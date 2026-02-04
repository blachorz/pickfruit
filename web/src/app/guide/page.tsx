import { Metadata } from 'next';
import { supabase } from '@/utils/supabase';
import FruitGuide from '@/components/FruitGuide';

// Revalidate every day
export const revalidate = 86400;

export const metadata: Metadata = {
  title: '挑選指南 - 水果呷對時',
  description: '不知道該吃什麼？透過「生活情調」或「對症下藥」幫您找到最適合的當季水果。',
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
