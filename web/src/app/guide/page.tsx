import { Metadata } from 'next';
import { supabase } from '@/utils/supabase';
import FruitGuide from '@/components/FruitGuide';
import { getCanonicalUrl, SITE_KEYWORDS, SITE_NAME } from '@/utils/fruitSeo';

// Revalidate every day
export const revalidate = 86400;

const guideTitle = '挑選指南';
const guideSocialTitle = `${guideTitle} | ${SITE_NAME}`;
const guideDescription = '不知道該吃什麼？透過生活情境、身體狀態與營養需求，找到最適合的當季水果挑選建議。';

export const metadata: Metadata = {
  title: guideTitle,
  description: guideDescription,
  keywords: [
    ...SITE_KEYWORDS,
    '水果挑選指南',
    '當季水果推薦',
    '症狀水果',
    '水果營養',
    '生活情境水果',
  ],
  alternates: {
    canonical: '/guide',
  },
  openGraph: {
    title: guideSocialTitle,
    description: guideDescription,
    url: getCanonicalUrl('/guide'),
    siteName: SITE_NAME,
    locale: 'zh_TW',
    type: 'website',
  },
  twitter: {
    card: 'summary',
    title: guideSocialTitle,
    description: guideDescription,
  },
};

export default async function GuidePage() {
  const [fruitsRes, scenariosRes, symptomsRes] = await Promise.all([
    supabase.from('fruits').select('*').order('name', { ascending: true }),
    supabase.from('scenarios').select('*').order('sort_order', { ascending: true }),
    supabase.from('symptoms').select('*').order('sort_order', { ascending: true }),
  ]);

  const { data: fruits, error: fruitsError } = fruitsRes;
  const { data: scenarios, error: scenariosError } = scenariosRes;
  const { data: symptoms, error: symptomsError } = symptomsRes;

  const error = fruitsError || scenariosError || symptomsError;

  if (error) {
    console.error('Error fetching guide data:', error);
    return (
      <div className="flex flex-col items-center justify-center min-h-screen bg-slate-50 p-4">
        <div className="bg-white p-8 rounded-2xl shadow-lg text-center max-w-md">
          <div className="text-4xl mb-4">😢</div>
          <h1 className="text-xl font-bold text-slate-800 mb-2">無法載入指南資料</h1>
          <p className="text-slate-500 mb-6 text-sm">{error.message}</p>
        </div>
      </div>
    );
  }

  return (
    <FruitGuide 
      fruits={fruits || []} 
      scenarios={scenarios || []} 
      symptoms={symptoms || []} 
    />
  );
}
