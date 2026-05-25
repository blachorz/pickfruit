import type { Metadata } from 'next';
import { cache } from 'react';
import { Fruit, supabase } from '@/utils/supabase';
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

const getHomepageFruits = cache(async () => {
  const { data: fruits, error } = await supabase
    .from('fruits')
    .select('*')
    .order('name', { ascending: true });

  return {
    fruits: (fruits || []) as Fruit[],
    error,
  };
});

const getTaiwanMonth = () => {
  const monthPart = new Intl.DateTimeFormat('zh-TW', {
    timeZone: 'Asia/Taipei',
    month: 'numeric',
  })
    .formatToParts(new Date())
    .find((part) => part.type === 'month');

  return Number(monthPart?.value) || new Date().getMonth() + 1;
};

const getSeasonScore = (fruit: Fruit, month: number) => {
  const curve = Array.isArray(fruit.season_curve) ? fruit.season_curve : [];
  return Number(curve[month - 1]) || 0;
};

const getTopSeasonalFruits = (
  fruits: Fruit[],
  month: number,
  limit: number,
  minScore: number,
  maxScore = Number.POSITIVE_INFINITY
) =>
  fruits
    .filter((fruit) => {
      const seasonScore = getSeasonScore(fruit, month);
      return fruit.name && seasonScore >= minScore && seasonScore < maxScore;
    })
    .sort((a, b) => {
      const seasonDiff = getSeasonScore(b, month) - getSeasonScore(a, month);
      if (seasonDiff !== 0) return seasonDiff;

      return (Number(b.properties?.brix) || 0) - (Number(a.properties?.brix) || 0);
    })
    .slice(0, limit);

const buildHomeMetadata = (description: string): Metadata => ({
  title: {
    absolute: SITE_TITLE,
  },
  description,
  keywords: SITE_KEYWORDS,
  alternates: {
    canonical: '/',
  },
  openGraph: {
    title: SITE_TITLE,
    description,
    url: getCanonicalUrl('/'),
    siteName: SITE_NAME,
    locale: 'zh_TW',
    type: 'website',
  },
  twitter: {
    card: 'summary',
    title: SITE_TITLE,
    description,
  },
});

export async function generateMetadata(): Promise<Metadata> {
  const { fruits, error } = await getHomepageFruits();

  if (error) {
    return buildHomeMetadata(SITE_DESCRIPTION);
  }

  const month = getTaiwanMonth();
  const peakFruitNames = getTopSeasonalFruits(fruits, month, fruits.length, 10)
    .map((fruit) => fruit.name)
    .join('、');
  const inSeasonFruitNames = getTopSeasonalFruits(fruits, month, 3, 7, 10)
    .map((fruit) => fruit.name)
    .join('、');
  const seasonalHighlights = [
    peakFruitNames && `大盛產：${peakFruitNames}`,
    inSeasonFruitNames && `產季中：${inSeasonFruitNames}`,
  ].filter(Boolean);
  const description = seasonalHighlights.length > 0
    ? `${month}月當季水果推薦，${seasonalHighlights.join('；')}。查詢台灣水果產季、甜度、GI 值、寒熱屬性與挑選建議。`
    : SITE_DESCRIPTION;

  return buildHomeMetadata(description);
}

export default async function Home() {
  const { fruits, error } = await getHomepageFruits();

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

  return <FruitChart initialFruits={fruits} />;
}
