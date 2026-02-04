import { Metadata } from 'next';
import { notFound } from 'next/navigation';
import { Fruit, supabase } from '@/utils/supabase';
import { FruitDetail } from '@/components/FruitDetail';

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
                    ...f.properties,
                    recommendReason: reason
                }
            };
            
            return { fruit: enrichedFruit, matchScore: points };
        })
        .filter((item): item is { fruit: Fruit, matchScore: number } => item !== null)
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

  if (!fruit) return { title: '水果呷對時' };

  return {
    title: `${fruit.name} - 水果呷對時`,
    description: fruit.properties?.tagline || `查看${fruit.name}的產季、挑選技巧與營養價值。`,
    openGraph: {
      title: `${fruit.name} - 水果呷對時`,
      description: fruit.properties?.tagline || `查看${fruit.name}的產季、挑選技巧與營養價值。`,
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

  return (
      <main className="min-h-screen bg-slate-50">
          <FruitDetail 
            fruit={fruit} 
            relatedFruits={recommended} 
            symptomsMetadata={(symptomsRes.data || []) as { name: string; slug: string }[]}
          />
      </main>
  );
}
