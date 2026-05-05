import type { Metadata } from 'next';
import { supabase } from '@/utils/supabase';
import FruitChart from '@/components/FruitChart';
import {
  getCanonicalUrl,
  SITE_DESCRIPTION,
  SITE_KEYWORDS,
  SITE_NAME,
  SITE_TITLE,
} from '@/utils/fruitSeo';

// Revalidate every hour
export const revalidate = 3600;

export const metadata: Metadata = {
  title: {
    absolute: SITE_TITLE,
  },
  description: SITE_DESCRIPTION,
  keywords: SITE_KEYWORDS,
  alternates: {
    canonical: '/',
  },
  openGraph: {
    title: SITE_TITLE,
    description: SITE_DESCRIPTION,
    url: getCanonicalUrl('/'),
    siteName: SITE_NAME,
    locale: 'zh_TW',
    type: 'website',
  },
  twitter: {
    card: 'summary',
    title: SITE_TITLE,
    description: SITE_DESCRIPTION,
  },
};

export default async function Home() {
  const { data: fruits, error } = await supabase
    .from('fruits')
    .select('*')
    .order('name', { ascending: true });

  if (error) {
    console.error('Error fetching fruits:', error);
    return (
      <div className="flex flex-col items-center justify-center min-h-screen bg-slate-50 p-4">
        <div className="bg-white p-8 rounded-2xl shadow-lg text-center max-w-md">
          <div className="text-4xl mb-4">😢</div>
          <h1 className="text-xl font-bold text-slate-800 mb-2">無法載入水果資料</h1>
          <p className="text-slate-500 mb-6 text-sm">{error.message}</p>
          <p className="text-xs text-slate-400">請確認 Supabase 連線設定</p>
        </div>
      </div>
    );
  }

  return <FruitChart initialFruits={fruits || []} />;
}
