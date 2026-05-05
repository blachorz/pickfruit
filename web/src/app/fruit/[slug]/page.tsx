import { Metadata } from 'next';
import { notFound } from 'next/navigation';
import { Fruit, supabase } from '@/utils/supabase';
import { FruitDetail } from '@/components/FruitDetail';
import FruitSeoContent from '@/components/FruitSeoContent';
import {
  buildFruitFaqJsonLd,
  buildFruitJsonLd,
  getFruitDescription,
  getFruitKeywords,
  getFruitUrl,
  serializeJsonLd,
  SITE_NAME,
} from '@/utils/fruitSeo';

// Revalidate every day
export const revalidate = 86400;

// Generate static params for all fruits to enable full SSG
export async function generateStaticParams() {
    const { data: fruits } = await supabase.from('fruits').select('slug');
    return (fruits || []).map((fruit) => ({
        slug: fruit.slug,
    }));
}

interface Props {
    params: { slug: string };
}

// Helper to get similar fruits
async function getRecommendedFruits(currentFruit: Fruit) {
    const { data: allFruitsRes } = await supabase.from('fruits').select('*');
    const allFruits = (allFruitsRes as Fruit[]) || [];

    const currentSymptoms = (currentFruit.properties?.relief_symptoms || '')
        .split(/[,，、]/)
        .map(s => s.trim())
        .filter(Boolean);

    const mIndex = new Date().getMonth();

    const scoredCandidates = allFruits
        .filter((f: Fruit) => f.id !== currentFruit.id) 
        .map((f: Fruit) => {
            let points = 0; 
            let reason = '';
            
            // Season Check
            const curve = Array.isArray(f.season_curve) ? f.season_curve : [];
            const seasonScore = Number(curve[mIndex]) || 0;
            
            if (seasonScore < 4) return null; // Must be in season
            
            // Symptom Match (+10)
            const fSymptoms = (f.properties?.relief_symptoms || '')
                .split(/[,，、]/)
                .map(s => s.trim());
            const sharedSymptoms = currentSymptoms.filter(s => fSymptoms.includes(s));
            
            if (sharedSymptoms.length > 0) { 
                points += 10; 
                reason = `也能改善${sharedSymptoms[0]}`; 
            }
            
            // Category Match (+5)
            if (f.category === currentFruit.category) { 
                points += 5; 
                if (!reason) reason = `同為${f.category}家族`; 
            }
            
            // Season Score Bonus
            points += seasonScore; 
            
            if (!reason) reason = '當季必吃推薦';
            
            // Inject reason into properties for UI to render
            const enrichedFruit = {
                ...f,
                properties: {
                    ...(f.properties || {}),
                    recommendReason: reason
                }
            } as any;
            
            return { fruit: enrichedFruit, matchScore: points };
        })
        .filter((item) => item !== null)
        .map(item => item as { fruit: Fruit, matchScore: number })
        .sort((a, b) => b.matchScore - a.matchScore)
        .slice(0, 6)
        .map(item => item.fruit);
        
    return scoredCandidates;
}

// SEO Metadata Generator
export async function generateMetadata({ params }: Props): Promise<Metadata> {
  const slug = decodeURIComponent(params.slug);
  const { data: fruit } = await supabase
    .from('fruits')
    .select('*')
    .eq('slug', slug)
    .single();

  if (!fruit) {
    return {
      title: `找不到水果 - ${SITE_NAME}`,
      robots: {
        index: false,
        follow: false,
      },
    };
  }

  const typedFruit = fruit as Fruit;
  const title = `${typedFruit.name}含糖量、GI與體質屬性`;
  const socialTitle = `${title} | ${SITE_NAME}`;
  const description = getFruitDescription(typedFruit);
  const url = getFruitUrl(typedFruit);

  return {
    title,
    description,
    keywords: getFruitKeywords(typedFruit),
    alternates: {
      canonical: url,
    },
    openGraph: {
      title: socialTitle,
      description,
      url,
      siteName: SITE_NAME,
      type: 'article',
    },
    twitter: {
      card: 'summary',
      title: socialTitle,
      description,
    },
  };
}

export default async function FruitPage({ params }: Props) {
  const slug = decodeURIComponent(params.slug);
  
  // Fetch all data in parallel to optimize
  const [fruitRes, allFruitsRes, symptomsRes] = await Promise.all([
      supabase.from('fruits').select('*').eq('slug', slug).single(),
      supabase.from('fruits').select('*'), // Fetch all for recommendation logic
      supabase.from('symptoms').select('*')
  ]);

  const fruit = fruitRes.data as Fruit;
  if (!fruit) notFound();

  // Recommendations
  const recommended = await getRecommendedFruits(fruit);
  const fruitJsonLd = buildFruitJsonLd(fruit);
  const faqJsonLd = buildFruitFaqJsonLd(fruit);

  return (
    <>
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: serializeJsonLd(fruitJsonLd) }}
      />
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: serializeJsonLd(faqJsonLd) }}
      />
      <main className="min-h-screen bg-slate-50 lg:flex lg:items-center lg:justify-center lg:p-6">
          <FruitDetail 
            fruit={fruit} 
            relatedFruits={recommended} 
            symptomsMetadata={(symptomsRes.data || []) as { name: string; slug: string }[]}
          />
      </main>
      <FruitSeoContent fruit={fruit} />
    </>
  );
}
