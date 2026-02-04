'use client';

import React, { useState, useMemo, useEffect, Suspense } from 'react';
import Link from 'next/link';
import { useRouter, useSearchParams } from 'next/navigation';
import { Fruit, Scenario, Symptom } from '@/utils/supabase';
import { ChevronLeft } from 'lucide-react';
import clsx from 'clsx';
import { twMerge } from 'tailwind-merge';

function cn(...inputs: (string | undefined | null | false)[]) {
  return twMerge(clsx(inputs));
}

// Helpers
const getSeasonLabel = (score: number) => {
  const s = Number(score) || 0;
  if (s >= 10) return '🔥 大盛產';
  if (s >= 7) return '🌿 產季中';
  if (s >= 4) return '🌱 嘗鮮期';
  return '❄️ 非產季';
};

const getCurrentScore = (fruit: Fruit, month: number) => {
    const curve = Array.isArray(fruit.season_curve) ? fruit.season_curve : [];
    return Number(curve[month - 1]) || 0;
};

interface FruitGuideProps {
  fruits: Fruit[];
  scenarios: Scenario[];
  symptoms: Symptom[];
}

export default function FruitGuide({ fruits, scenarios, symptoms }: FruitGuideProps) {
  return (
    <Suspense fallback={<div className="min-h-screen flex items-center justify-center bg-slate-50"><div className="animate-spin text-4xl">🍋</div></div>}>
        <FruitGuideContent fruits={fruits} scenarios={scenarios} symptoms={symptoms} />
    </Suspense>
  );
}

function FruitGuideContent({ fruits, scenarios, symptoms }: FruitGuideProps) {
  const router = useRouter();
  const searchParams = useSearchParams();
  
  // Initialize state from URL params
  const [guideMode, setGuideMode] = useState<'scenario' | 'symptom'>(
      (searchParams.get('mode') as 'scenario' | 'symptom') || 'scenario'
  );
  const [activeFilterSlug, setActiveFilterSlug] = useState<string | null>(
      searchParams.get('filter') || null
  );
  
  const [month] = useState(new Date().getMonth() + 1);

  // Helper to get active filter name from slug
  const activeFilterName = useMemo(() => {
      if (!activeFilterSlug) return null;
      if (guideMode === 'scenario') {
          return scenarios.find(s => s.slug === activeFilterSlug)?.name || null;
      } else {
          return symptoms.find(s => s.slug === activeFilterSlug)?.name || null;
      }
  }, [activeFilterSlug, guideMode, scenarios, symptoms]);

  // Sync state to URL
  const updateUrl = (mode: 'scenario' | 'symptom', filterSlug: string | null) => {
      const params = new URLSearchParams();
      params.set('mode', mode);
      if (filterSlug) {
          params.set('filter', filterSlug);
      } else {
          params.delete('filter');
      }
      router.replace(`?${params.toString()}`, { scroll: false });
  };
  
  // Auto-scroll to results when returning with a filter
  useEffect(() => {
      if (activeFilterSlug) {
          // Delay slightly to ensure rendering is complete
          setTimeout(() => {
              const el = document.getElementById('guide-results-container');
              if (el) {
                  el.scrollIntoView({ behavior: 'smooth', block: 'start' });
              }
          }, 300);
      }
  }, [activeFilterSlug]);

  // Derived Data: Scenario Groups
  const scenarioGroups = useMemo(() => {
    const grouped = scenarios.reduce((acc, item) => {
      const groupName = item.group_name;
      if (!acc[groupName]) {
        acc[groupName] = [];
      }
      acc[groupName].push({
        name: item.name,
        slug: item.slug,
        desc: item.description || ''
      });
      return acc;
    }, {} as Record<string, { name: string, slug: string, desc: string }[]>);

    // Ensure specific order if needed, or just iterate keys
    // The scenarios are already sorted by sort_order from the DB query, so insertion order should be roughly correct.
    // However, JS object keys are not guaranteed ordered.
    // Let's rely on the distinct group names found in the sorted list to maintain group order.
    const distinctGroups = Array.from(new Set(scenarios.map(s => s.group_name)));
    
    return distinctGroups.map(name => ({
      name,
      items: grouped[name]
    }));
  }, [scenarios]);

  // Derived Data: Symptom Groups
  const symptomGroups = useMemo(() => {
    const grouped = symptoms.reduce((acc, item) => {
      const groupName = item.group_name;
      if (!acc[groupName]) {
        acc[groupName] = [];
      }
      acc[groupName].push({
        name: item.name,
        slug: item.slug
        // desc: item.description // Not used in current UI but available
      });
      return acc;
    }, {} as Record<string, { name: string, slug: string }[]>);

    const distinctGroups = Array.from(new Set(symptoms.map(s => s.group_name)));

    return distinctGroups.map(name => ({
      name,
      items: grouped[name]
    }));
  }, [symptoms]);

  // Filter Logic
  const activeResults = useMemo(() => {
      if (!activeFilterName) return [];
      
      const keyword = activeFilterName;
      const matches = fruits.filter(f => {
          const source = guideMode === 'scenario' ? f.properties?.scenario : f.properties?.relief_symptoms;
          if (!source) return false;
          // source can be comma separated string
          return source.toString().includes(keyword);
      });

      return matches.sort((a, b) => {
          const scoreA = getCurrentScore(a, month);
          const scoreB = getCurrentScore(b, month);
          const diffScore = scoreB - scoreA; // Seasonality first
          if (diffScore !== 0) return diffScore;
          return (Number(b.properties?.brix) || 0) - (Number(a.properties?.brix) || 0); // Then Brix
      });
  }, [fruits, activeFilterName, guideMode, month]);

  const toggleFilter = (slug: string) => {
      if (activeFilterSlug === slug) {
          setActiveFilterSlug(null);
          updateUrl(guideMode, null);
      } else {
          setActiveFilterSlug(slug);
          updateUrl(guideMode, slug);
          // Scroll handled by useEffect now
      }
  };

  const handleModeChange = (mode: 'scenario' | 'symptom') => {
      setGuideMode(mode);
      setActiveFilterSlug(null);
      updateUrl(mode, null);
  };

  return (
    <div className="fixed inset-0 z-[60] font-sans h-full w-full flex flex-col lg:items-center lg:justify-center lg:bg-slate-900/30 lg:backdrop-blur-sm lg:p-6 bg-slate-50">
        <div className="flex-1 w-full h-full bg-slate-50 relative flex flex-col overflow-hidden lg:flex-none lg:h-auto lg:max-h-full lg:w-full lg:max-w-5xl lg:rounded-3xl lg:shadow-2xl z-10">
            <div className="overflow-y-auto pb-20 no-scrollbar h-full relative">
                {/* Header (Sticky) */}
                <div className={cn(
                    "sticky top-0 z-50 pt-6 pb-4 px-4 bg-slate-50 shadow-sm transition-colors duration-500 h-[9rem] border-b",
                    guideMode === 'scenario' ? 'border-orange-100' : 'border-blue-100'
                )}>
                    <div className="flex justify-between items-center mb-4">
                        <h2 className={cn("text-2xl font-black tracking-tight flex items-center gap-2", guideMode === 'scenario' ? 'text-orange-600' : 'text-blue-600')}>
                            <span>{guideMode === 'scenario' ? '生活情調' : '對症下藥'}</span>
                            <span className="text-lg opacity-80">{guideMode === 'scenario' ? '🎨' : '💊'}</span>
                        </h2>
                        <div className="flex items-center gap-3">
                            <div className="text-right leading-none">
                                <span className="text-xl font-black text-indigo-600/90 tracking-tighter">{month}</span>
                                <span className="text-xs font-bold text-slate-400">月</span>
                            </div>
                            <Link href="/" className="p-2 bg-white rounded-full shadow-sm border border-slate-100 text-slate-400 active:scale-95 transition">
                                <XIcon className="w-5 h-5" />
                            </Link>
                        </div>
                    </div>
                    
                    {/* Toggle Switch */}
                    <div className="relative bg-slate-200/50 p-1 rounded-full flex font-bold text-xs select-none shadow-inner">
                        <div className={cn(
                            "absolute inset-y-1 w-[calc(50%-4px)] bg-white rounded-full shadow-sm transition-all duration-300 ease-out",
                            guideMode === 'scenario' ? 'left-1' : 'left-[calc(50%)]'
                        )}></div>
                        <button onClick={() => handleModeChange('scenario')} className={cn("flex-1 relative z-10 py-2.5 text-center rounded-full transition-colors", guideMode === 'scenario' ? 'text-orange-600' : 'text-slate-400')}>生活情調</button>
                        <button onClick={() => handleModeChange('symptom')} className={cn("flex-1 relative z-10 py-2.5 text-center rounded-full transition-colors", guideMode === 'symptom' ? 'text-blue-600' : 'text-slate-400')}>身體訊號</button>
                    </div>
                </div>

                {/* Content Area */}
                <div className="flex flex-col min-h-[calc(100vh-14rem)] bg-slate-50 relative z-0">
                    <div className="px-4 py-4 space-y-6">
                        
                        {/* Scenario View */}
                        {guideMode === 'scenario' && (
                            <div className="animate-in fade-in slide-in-from-left-4 duration-300">
                                {scenarioGroups.map(group => (
                                    <div key={group.name} className="mb-6">
                                        <h3 className="text-xs font-black text-orange-300 uppercase tracking-widest mb-3 ml-1">{group.name}</h3>
                                        <div className="grid grid-cols-2 gap-3">
                                            {group.items.map(item => (
                                                <button key={item.slug} onClick={() => toggleFilter(item.slug)}
                                                        className={cn(
                                                            "relative p-4 rounded-2xl border text-left transition-all duration-300 group overflow-hidden",
                                                            activeFilterSlug === item.slug 
                                                                ? 'bg-gradient-to-br from-orange-500 to-amber-500 border-orange-600 shadow-lg shadow-orange-200 scale-[1.02] ring-2 ring-offset-2 ring-orange-200' 
                                                                : 'bg-white border-slate-100 hover:border-orange-200 hover:shadow-md'
                                                        )}>
                                                    <div className={cn("absolute -right-4 -bottom-4 text-6xl opacity-10 rotate-12 group-hover:rotate-0 transition-transform duration-500", activeFilterSlug === item.slug ? 'text-white' : 'text-slate-200 grayscale')}>🎁</div>
                                                    <div className="relative z-10">
                                                        <div className={cn("text-sm font-black mb-1", activeFilterSlug === item.slug ? 'text-white' : 'text-slate-800')}>{item.name}</div>
                                                        <div className={cn("text-[10px] leading-tight line-clamp-2", activeFilterSlug === item.slug ? 'text-orange-100' : 'text-slate-400')}>{item.desc}</div>
                                                    </div>
                                                </button>
                                            ))}
                                        </div>
                                    </div>
                                ))}
                            </div>
                        )}

                        {/* Symptom View */}
                        {guideMode === 'symptom' && (
                            <div className="animate-in fade-in slide-in-from-right-4 duration-300">
                                {symptomGroups.map(group => (
                                    <div key={group.name} className="mb-5">
                                        <h3 className="text-xs font-black text-blue-300 uppercase tracking-widest mb-3 ml-1">{group.name}</h3>
                                        <div className="flex flex-wrap gap-2">
                                            {group.items.map(item => (
                                                <button key={item.slug} onClick={() => toggleFilter(item.slug)}
                                                        className={cn(
                                                            "px-4 py-2 rounded-full text-xs font-bold border transition-all duration-200 active:scale-95",
                                                            activeFilterSlug === item.slug 
                                                                ? 'bg-blue-600 text-white border-blue-600 shadow-md shadow-blue-200' 
                                                                : 'bg-white text-slate-500 border-slate-200 hover:border-blue-300 hover:text-blue-600'
                                                        )}>
                                                    {item.name}
                                                </button>
                                            ))}
                                        </div>
                                    </div>
                                ))}
                            </div>
                        )}
                    </div>

                    {/* Results Section */}
                    <div id="guide-results" 
                         className={cn(
                             "sticky top-[8.5rem] z-30 backdrop-blur-md border-t border-b py-3 px-5 flex justify-between items-center shadow-sm transition-all duration-300",
                             activeFilterSlug 
                                ? (guideMode === 'scenario' ? 'bg-orange-50/95 border-orange-200 shadow-orange-100/50' : 'bg-blue-50/95 border-blue-200 shadow-blue-100/50') 
                                : 'bg-slate-50/95 border-slate-200'
                         )}>
                        <div className="flex items-center gap-2">
                            <span className="text-lg">{activeFilterSlug ? '🎯' : '👇'}</span>
                            <span className={cn("text-sm font-black transition-colors", activeFilterSlug ? (guideMode === 'scenario' ? 'text-orange-900' : 'text-blue-900') : 'text-slate-800')}>
                                {activeFilterSlug ? activeFilterName : '請選擇上方項目'}
                            </span>
                        </div>
                        {activeFilterSlug && (
                            <span className={cn("text-[10px] font-bold px-2 py-0.5 rounded-full transition-colors", guideMode === 'scenario' ? 'bg-orange-200 text-orange-800' : 'bg-blue-200 text-blue-800')}>
                                {activeResults.length} 種推薦
                            </span>
                        )}
                    </div>

                    <div id="guide-results-container" className="p-4 min-h-[30vh] bg-slate-100/50 scroll-mt-48 pb-24">
                        {!activeFilterSlug && (
                            <div className="flex flex-col items-center justify-center py-10 text-slate-300">
                                <div className="text-4xl mb-2 animate-bounce">👆</div>
                                <p className="text-xs font-bold text-center">點擊上方卡片或標籤<br/>查看專屬水果推薦</p>
                            </div>
                        )}
                        
                        {activeFilterSlug && (
                            <div className="grid grid-cols-1 gap-3 animate-in fade-in slide-in-from-bottom-4 duration-500">
                                {activeResults.map(fruit => (
                                    <button key={fruit.id} onClick={() => router.push(`/fruit/${fruit.slug || fruit.id}`)}
                                            className="flex items-center gap-3 p-3 bg-white rounded-2xl border border-slate-100 shadow-sm hover:shadow-md hover:border-indigo-200 transition-all group text-left">
                                        <div className="w-12 h-12 rounded-full shadow-inner border border-black/5 shrink-0" style={{ backgroundColor: fruit.properties?.color || '#ccc' }}></div>
                                        <div className="flex-1 min-w-0">
                                            <div className="flex items-center justify-between mb-1">
                                                <span className="text-sm font-black text-slate-800">{fruit.name}</span>
                                                <span className={cn("text-[10px] font-bold px-1.5 py-0.5 rounded", getCurrentScore(fruit, month) >= 4 ? 'bg-emerald-100 text-emerald-700' : 'bg-slate-100 text-slate-400')}>
                                                    {getSeasonLabel(getCurrentScore(fruit, month))}
                                                </span>
                                            </div>
                                            <div className="mt-0.5">
                                                <p className="text-xs font-bold text-slate-600 line-clamp-1 group-hover:text-indigo-600 transition-colors">
                                                    {guideMode === 'symptom' 
                                                        ? `舒緩：${fruit.properties?.relief_symptoms}` 
                                                        : (fruit.properties?.tagline || fruit.properties?.scenario)}
                                                </p>
                                                {guideMode === 'symptom' && fruit.properties?.relief_mechanism && (
                                                    <p className="text-[10px] text-slate-400 mt-0.5 line-clamp-1 font-medium">
                                                        <span>作用：</span><span>{fruit.properties?.relief_mechanism}</span>
                                                    </p>
                                                )}
                                            </div>
                                        </div>
                                        <ChevronLeft className="w-5 h-5 text-slate-300 group-hover:text-indigo-500 transform group-hover:translate-x-1 transition-transform rotate-180" />
                                    </button>
                                ))}
                                {activeResults.length === 0 && (
                                    <div className="text-center py-8 text-slate-400">
                                        <p className="text-sm">此項目暫無當季推薦水果 😅</p>
                                    </div>
                                )}
                            </div>
                        )}
                        
                        {/* 🔥 Footer Signature */}
                        <div className="mt-8 mb-6 text-center select-text">
                            <div className="inline-flex items-center justify-center gap-2 px-3 py-1.5 rounded-full bg-white/50 border border-slate-100/50 backdrop-blur-sm shadow-sm transition-all duration-300 hover:bg-white hover:shadow-md hover:scale-105 group cursor-default">
                                <span className="text-[10px] font-medium text-slate-400 flex items-center gap-1">Made with <span className="text-[10px] animate-pulse">❤️</span> by <span className="font-black text-slate-600">Mike</span></span>
                                <span className="w-0.5 h-2 bg-slate-300 rounded-full"></span>
                                <a href="mailto:blachorz.m@gmail.com" class="text-[10px] font-bold text-slate-400 hover:text-indigo-600 transition-colors flex items-center gap-1">✉️ <span className="underline decoration-slate-200 underline-offset-2 group-hover:decoration-indigo-200">Contact</span></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
  );
}

function XIcon({ className }: { className?: string }) {
    return <svg className={className} fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M6 18L18 6M6 6l12 12"></path></svg>;
}
