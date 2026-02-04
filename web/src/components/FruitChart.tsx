'use client';

import React, { useState, useMemo, useRef, useEffect } from 'react';
import Link from 'next/link';
import { useRouter } from 'next/navigation';
import { Fruit, supabase } from '@/utils/supabase';
import { Search, HelpCircle, X, ChevronRight, MessageCircle, Loader2, CheckCircle2 } from 'lucide-react';
import clsx from 'clsx';
import { twMerge } from 'tailwind-merge';
import { useSettings } from '@/context/SettingsContext';

function cn(...inputs: (string | undefined | null | false)[]) {
  return twMerge(clsx(inputs));
}

// Helpers
const getJitter = (str: string) => {
  let hash = 0;
  for (let i = 0; i < str.length; i++) hash = str.charCodeAt(i) + ((hash << 5) - hash);
  return (hash % 30) / 10;
};

const getEnergyLabel = (val: number | undefined) => {
  const map: Record<string, string> = { '-2': '寒 ❄️', '-1': '涼 🍃', '0': '平 😌', '1': '溫 ☀️', '2': '燥 🔥' };
  return map[String(val)] || '平 😌';
};

const getSeasonLabel = (score: number) => {
  const s = Number(score) || 0;
  if (s >= 10) return '🔥 大盛產';
  if (s >= 7) return '🌿 產季中';
  if (s >= 4) return '🌱 嘗鮮期';
  return '❄️ 非產季';
};

interface FruitChartProps {
  initialFruits: Fruit[];
}

export default function FruitChart({ initialFruits }: FruitChartProps) {
  const router = useRouter();
  const searchInputRef = useRef<HTMLInputElement>(null);
  const monthSelectorRef = useRef<HTMLDivElement>(null);
  // 使用固定值避免布局抖動，讓 CSS 處理響應式行為
  // 原本使用 ResizeObserver 監測月份選擇器高度會導致長輩模式切換時的頓挫感
  const [chartMode, setChartMode] = useState('daily'); // daily, sugar, burden, tcm, flavor, gift
  const [month, setMonth] = useState(new Date().getMonth() + 1);
  const [lockedFruit, setLockedFruit] = useState<Fruit | null>(null);
  const [hoveredFruit, setHoveredFruit] = useState<any | null>(null);

  // Search State
  const [searchOpen, setSearchOpen] = useState(false);
  const [searchQuery, setSearchQuery] = useState('');
  const [triviaFruit, setTriviaFruit] = useState<Fruit & { emoji?: string } | null>(null);

  // UI State (FABs)
  const { largeMode } = useSettings();
  
  // Advanced Filter State
  const [onlyPremium, setOnlyPremium] = useState(false);
  const [onlyCommon, setOnlyCommon] = useState(false);
  const [showOffSeason, setShowOffSeason] = useState(false);
  
  // Search Logic
  const openSearch = () => {
      setSearchOpen(true);
      setSearchQuery('');
      // Pick random trivia fruit
      const candidates = initialFruits.filter(f => f.properties?.trivia && f.properties.trivia.length > 5);
      if (candidates.length > 0) {
          const randomFruit = candidates[Math.floor(Math.random() * candidates.length)];
          setTriviaFruit({
              ...randomFruit,
              emoji: ['🤓', '💡', '🧐', '😎', '🍎'][Math.floor(Math.random() * 5)]
          });
      }
      setTimeout(() => searchInputRef.current?.focus(), 100);
  };

  const closeSearch = () => {
      setSearchOpen(false);
  };

  const searchResults = useMemo(() => {
      if (!searchQuery.trim()) return [];
      const q = searchQuery.toLowerCase().trim();
      return initialFruits.filter(f => {
          const p = f.properties || {};
          const source = [
              f.name,
              p.name_en,
              p.keywords,
              p.relief_symptoms,
              p.scenario,
              p.nutritional_value,
              p.good_for,
              p.bad_for
          ].join(' ').toLowerCase();
          return source.includes(q);
      }).slice(0, 20);
  }, [initialFruits, searchQuery]);

  const getMatchResult = (fruit: Fruit) => {
      const q = searchQuery.toLowerCase().trim();
      const p = fruit.properties || {};
      
      if (p.bad_for && p.bad_for.toLowerCase().includes(q)) {
          return { type: 'bad', label: '🙅🏻‍♀️ 禁忌', text: p.bad_for, colorClass: 'text-rose-600 bg-rose-50' };
      }
      if (p.good_for && p.good_for.toLowerCase().includes(q)) {
          return { type: 'good', label: '🙆🏻‍♂️ 適宜', text: p.good_for, colorClass: 'text-emerald-600 bg-emerald-50' };
      }
      if (p.nutritional_value && p.nutritional_value.toLowerCase().includes(q)) {
          return { type: 'nutri', label: '🔥 營養', text: p.nutritional_value, colorClass: 'text-orange-500 bg-orange-50' };
      }
      if (p.relief_symptoms && p.relief_symptoms.toLowerCase().includes(q)) {
          return { type: 'relief', label: '🩺 功效', text: p.relief_symptoms, colorClass: 'text-indigo-500 bg-indigo-50' };
      }
      if (p.scenario && p.scenario.toLowerCase().includes(q)) {
          return { type: 'scenario', label: '🎨 適合', text: p.scenario, colorClass: 'text-slate-500 bg-slate-100' };
      }
      return { type: 'none', label: '', text: '', colorClass: '' };
  };

  const highlightMatch = (text: string | undefined, query: string) => {
      if (!text) return '';
      if (!query || query.trim() === '') return text;
      const safeQuery = query.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
      const regex = new RegExp(`(${safeQuery})`, 'gi');
      return text.replace(regex, '<span class="text-indigo-600 bg-indigo-50 font-black rounded-[2px] px-0.5">$1</span>');
  };
  
  // Interaction
  const handleFruitClick = (fruit: Fruit) => {
      // If locked, navigate
      if (lockedFruit?.id === fruit.id) {
          router.push(`/fruit/${fruit.slug || fruit.id}`);
      } else {
          setLockedFruit(fruit);
      }
  };

  // 🔥 追蹤客戶端 hydration 完成，避免 SSR 與 CSR 大小不一致
  const [isClient, setIsClient] = useState(false);
  useEffect(() => {
    setIsClient(true);
  }, []);

  // Computed: Chart Items
  const chartItems = useMemo(() => {
    const isMobile = isClient ? window.innerWidth < 768 : true;  // 預設為 mobile 大小，避免初次載入過大
    const baseSize = isMobile ? 12 : 20;
    const PADDING = 12;  // 🔥 增加邊距，避免 tooltip 被截斷
    const SAFE_ZONE = 100 - (PADDING * 2);

    return initialFruits
      .filter(f => f.name)
      .map(f => {
        const curve = Array.isArray(f.season_curve) ? f.season_curve : Array(12).fill(0);
        const seasonScore = Number(curve[month - 1]) || 0;
        const p = f.properties;
        const bubbleColor = p?.color || '#cccccc';

        // Visibility Logic - 非產季水果不顯示在泡泡圖上
        let isVisible = true;
        if (seasonScore < 4) isVisible = false;  // 🔥 關鍵修復：只顯示產季中的水果
        if (onlyPremium && !p?.is_premium) isVisible = false;
        if (onlyCommon && !p?.is_common) isVisible = false;

        // Mode Specific Data Checks
        if (chartMode === 'sugar' && !p?.gi_value) isVisible = false;
        if (chartMode === 'burden' && (!p?.calories || !p?.gi_value)) isVisible = false;
        if (chartMode === 'tcm' && (p?.moisture === undefined || p?.energy_index === undefined)) isVisible = false;
        if (chartMode === 'gift' && (p?.price_level === undefined || p?.aroma === undefined)) isVisible = false;
        if (chartMode === 'flavor' && (p?.acidity === undefined || p?.acidity === null)) isVisible = false;

        let size = 0;
        if (isVisible) {
            const diff = Math.max(0, seasonScore - 4);
            const multiplier = isMobile ? 10 : 16;
            size = baseSize + (Math.pow(diff, 1.25) * multiplier);
        }

        // Coordinates Logic
        let rawPercentX = 50;
        let rawPercentY = 50;

        if (chartMode === 'tcm') {
            const energy = Number(p?.energy_index) || 0;
            rawPercentX = Math.min(100, Math.max(0, ((energy + 2) / 4) * 100));
            const moisture = Number(p?.moisture) || 0;
            rawPercentY = Math.min(100, Math.max(0, ((moisture - 2) / 8) * 100));
        } else if (chartMode === 'burden') {
            const cal = Number(p?.calories) || 0;
            const MIN_CAL = 10; const MID_CAL = 50; const MAX_CAL = 180;
            if (cal <= MID_CAL) rawPercentX = ((cal - MIN_CAL) / (MID_CAL - MIN_CAL)) * 50;
            else rawPercentX = 50 + ((cal - MID_CAL) / (MAX_CAL - MID_CAL)) * 50;
            rawPercentX = Math.min(100, Math.max(0, rawPercentX));
            const gi = Number(p?.gi_value) || 0;
            rawPercentY = Math.min(100, Math.max(0, (gi / 75) * 100));
        } else if (chartMode === 'sugar') {
            const brix = Number(p?.brix) || 0;
            rawPercentX = Math.min(100, Math.max(0, (brix / 32) * 100));
            const gi = Number(p?.gi_value) || 0;
            rawPercentY = Math.min(100, Math.max(0, (gi / 75) * 100));
        } else if (chartMode === 'gift') {
            const price = Number(p?.price_level) || 1;
            rawPercentX = Math.min(100, Math.max(0, ((price - 1) / 4) * 100));
            const aroma = Number(p?.aroma) || 0;
            rawPercentY = Math.min(100, Math.max(0, (aroma / 10) * 100));
        } else if (chartMode === 'flavor') {
            const brix = Number(p?.brix) || 0;
            rawPercentX = Math.min(100, Math.max(0, (brix / 32) * 100));
            const acidity = Number(p?.acidity) || 0;
            rawPercentY = Math.min(100, Math.max(0, (acidity / 10) * 100));
        } else {
            // Daily
            const brix = Number(p?.brix) || 0;
            rawPercentX = Math.min(100, Math.max(0, (brix / 32) * 100));
            const energy = Number(p?.energy_index) || 0;
            rawPercentY = Math.min(100, Math.max(0, ((energy + 2) / 4) * 100));
        }

        const jitterX = isVisible ? getJitter(f.id + 'x') : 0;
        const jitterY = isVisible ? getJitter(f.id + 'y') : 0;

        return {
            ...f,
            score: seasonScore,
            domX: PADDING + (rawPercentX * SAFE_ZONE / 100) + jitterX,
            domY: PADDING + (rawPercentY * SAFE_ZONE / 100) + jitterY,
            r: size,
            color: bubbleColor
        };
      })
      .filter(item => item.r > 0)
      .sort((a, b) => b.r - a.r);
  }, [initialFruits, month, chartMode, onlyPremium, onlyCommon, isClient]);

  // Grouping for list - 包含符合條件的水果，供下方卡片列表使用
  const groupedFruits = useMemo(() => {
      const tiers: any = { 
          1: { name: '🔥 大盛產・絕佳賞味', items: [] }, 
          2: { name: '🌿 產季中・品質優', items: [] }, 
          3: { name: '🌱 產季初/尾・嘗鮮', items: [] }, 
          4: { name: '❄️ 非產季・等待中', items: [] } 
      };
      
      // 🔥 使用原始資料，套用老饕/大眾篩選，確保包含符合條件的非產季水果
      initialFruits.forEach(f => {
          const p = f.properties;
          
          // 篩選：老饕必吃 / 大眾水果
          if (onlyPremium && !p?.is_premium) return;
          if (onlyCommon && !p?.is_common) return;

          const curve = Array.isArray(f.season_curve) ? f.season_curve : Array(12).fill(0);
          const seasonScore = Number(curve[month - 1]) || 0;
          const s = seasonScore;
          
          if (s >= 10) tiers[1].items.push(f);
          else if (s >= 7) tiers[2].items.push(f);
          else if (s >= 4) tiers[3].items.push(f);
          else tiers[4].items.push(f);
      });

      const result: any[] = [];
      [1, 2, 3, 4].forEach(level => {
          if (level === 4 && !showOffSeason) return; // Hide off season if not enabled
          const group = tiers[level];
          if (group.items.length > 0) {
              // Sort by brix descending within group
              group.items.sort((a: any, b: any) => (b.properties?.brix || 0) - (a.properties?.brix || 0));
              result.push(group);
          }
      });
      return result;
  }, [initialFruits, month, showOffSeason, onlyPremium, onlyCommon]);

  const visibleCount = useMemo(() => {
      return initialFruits.filter(f => {
          const p = f.properties;
          
          // 🔥 篩選：老饕必吃 / 大眾水果
          if (onlyPremium && !p?.is_premium) return false;
          if (onlyCommon && !p?.is_common) return false;
          
          // 🔥 篩選：非產季開關
          if (showOffSeason) return true;
          
          const curve = Array.isArray(f.season_curve) ? f.season_curve : Array(12).fill(0);
          const seasonScore = Number(curve[month - 1]) || 0;
          return seasonScore >= 4;
      }).length;
  }, [initialFruits, month, showOffSeason, onlyPremium, onlyCommon]);

  return (
    <div className="flex flex-col p-4 w-full max-w-6xl mx-auto min-h-screen lg:h-screen lg:overflow-hidden font-sans text-slate-800 bg-slate-50">
        {/* Header */}
        <div className="flex justify-between items-end mb-2 shrink-0 z-10">
            <div>
                <h1 className="text-2xl font-black tracking-tight text-slate-900 flex items-center gap-2">
                    水果呷對時 🍎
                </h1>
                <p className="text-xs text-slate-500 font-medium subtitle-fixed">跟著季節吃，最對味</p>
            </div>
            <div className="flex items-center gap-1">
                <div className="text-right leading-none">
                    <span className="text-4xl font-black text-indigo-600/90 tracking-tighter">{month}</span>
                    <span className="text-lg font-bold text-slate-400">月</span>
                </div>
                <button onClick={openSearch} className="flex items-center justify-center w-10 h-10 bg-white border border-indigo-100 shadow-sm rounded-full active:scale-95 transition hover:shadow-md hover:border-indigo-200 group mr-2">
                    <Search className="w-5 h-5 text-slate-600 group-hover:scale-110 transition-transform" />
                </button>
                <Link href="/guide" className="flex items-center gap-1.5 bg-white border border-indigo-100 shadow-sm px-3 py-2 rounded-full active:scale-95 transition group hover:shadow-md hover:border-indigo-200 relative overflow-hidden ignore-scaling">
                    <span className="text-base animate-bounce">📖</span>
                    <span className="text-xs font-black bg-gradient-to-r from-indigo-500 to-purple-600 bg-clip-text text-transparent animate-pulse">挑選指南</span>
                </Link>
            </div>
        </div>

        {/* Main Layout */}
        <div className="flex-1 min-h-0 flex flex-col lg:flex-row gap-2 lg:gap-4">
            
            {/* CHART AREA */}
            <div className="flex-1 bg-white rounded-[1.5rem] shadow-sm border border-slate-200 relative overflow-hidden min-h-[45vh] lg:min-h-0"
                    onClick={() => setLockedFruit(null)}>
                
                {/* HUD */}
                <div className="absolute top-5 left-5 z-20 pointer-events-none select-none ignore-scaling">
                    <h2 className="text-sm font-black text-slate-700 tracking-wide mb-0.5">
                        {chartMode === 'daily' && '日常選品：食材屬性'}
                        {chartMode === 'sugar' && '甜蜜陷阱：GI 值揭秘'}
                        {chartMode === 'burden' && '熱量精算'}
                        {chartMode === 'tcm' && '養生食療'}
                        {chartMode === 'flavor' && '酸甜光譜'}
                        {chartMode === 'gift' && '送禮攻略'}
                    </h2>
                    <p className="text-[10px] font-bold text-slate-400">
                        {chartMode === 'daily' && '糖度 / 寒燥'}
                        {chartMode === 'sugar' && '糖度 / 升糖指數'}
                        {chartMode === 'burden' && '熱量 / 升糖指數'}
                        {chartMode === 'tcm' && '寒燥 / 水分'}
                        {chartMode === 'flavor' && '糖度 / 酸度'}
                        {chartMode === 'gift' && '價位 / 香氣'}
                    </p>
                </div>

                {/* Watermark Background (Mode Specific) */}
                <div className="absolute inset-0 z-0 pointer-events-none overflow-hidden">
                    {/* Daily Mode */}
                    <div className={cn("absolute inset-0 transition-opacity duration-500", chartMode === 'daily' ? 'opacity-100' : 'opacity-0')}>
                        <div className="absolute top-8 left-6 lg:-top-4 lg:-left-4 opacity-[0.04] select-none -rotate-12 transform origin-top-left">
                            <span className="text-6xl lg:text-9xl font-black text-amber-900 leading-[0.8] tracking-tighter block whitespace-nowrap">溫潤<br/><span className="ml-4">養生</span></span>
                        </div>
                        <div className="absolute top-8 right-6 lg:-top-4 lg:-right-4 opacity-[0.04] select-none rotate-12 transform origin-top-right text-right">
                            <span className="text-6xl lg:text-9xl font-black text-rose-900 leading-[0.8] tracking-tighter block whitespace-nowrap">濃甜<br/><span className="mr-4">暖身</span></span>
                        </div>
                        <div className="absolute bottom-12 left-6 lg:-bottom-2 lg:-left-2 opacity-[0.04] select-none rotate-12 transform origin-bottom-left">
                            <span className="text-6xl lg:text-9xl font-black text-sky-900 leading-[0.8] tracking-tighter block whitespace-nowrap">清爽<br/><span className="ml-4">解膩</span></span>
                        </div>
                        <div className="absolute bottom-12 right-6 lg:-bottom-2 lg:-right-2 opacity-[0.04] select-none -rotate-12 transform origin-bottom-right text-right">
                            <span className="text-6xl lg:text-9xl font-black text-indigo-900 leading-[0.8] tracking-tighter block whitespace-nowrap">甜蜜<br/><span className="mr-4">消暑</span></span>
                        </div>
                    </div>

                    {/* Gift Mode */}
                    <div className={cn("absolute inset-0 transition-opacity duration-500", chartMode === 'gift' ? 'opacity-100' : 'opacity-0')}>
                        <div className="absolute top-8 left-6 lg:-top-4 lg:-left-4 opacity-[0.05] select-none -rotate-12 transform origin-top-left">
                            <span className="text-6xl lg:text-9xl font-black text-fuchsia-600 leading-[0.8] tracking-tighter block whitespace-nowrap">國民<br/><span className="ml-4">美味</span></span>
                        </div>
                        <div className="absolute top-8 right-6 lg:-top-4 lg:-right-4 opacity-[0.05] select-none rotate-12 transform origin-top-right text-right">
                            <span className="text-6xl lg:text-9xl font-black text-purple-800 leading-[0.8] tracking-tighter block whitespace-nowrap">頂級<br/><span className="mr-4">禮贈</span></span>
                        </div>
                        <div className="absolute bottom-12 left-6 lg:-bottom-2 lg:-left-2 opacity-[0.05] select-none rotate-12 transform origin-bottom-left">
                            <span className="text-6xl lg:text-9xl font-black text-slate-600 leading-[0.8] tracking-tighter block whitespace-nowrap">居家<br/><span className="ml-4">常備</span></span>
                        </div>
                        <div className="absolute bottom-12 right-6 lg:-bottom-2 lg:-right-2 opacity-[0.05] select-none -rotate-12 transform origin-bottom-right text-right">
                            <span className="text-6xl lg:text-9xl font-black text-amber-700 leading-[0.8] tracking-tighter block whitespace-nowrap">稀有<br/><span className="mr-4">獵奇</span></span>
                        </div>
                    </div>
                    
                    {/* Sugar Mode */}
                    <div className={cn("absolute inset-0 transition-opacity duration-500", chartMode === 'sugar' ? 'opacity-100' : 'opacity-0')}>
                        <div className="absolute top-8 left-6 lg:-top-4 lg:-left-4 opacity-[0.05] select-none -rotate-12 transform origin-top-left">
                            <span className="text-6xl lg:text-9xl font-black text-slate-800 leading-[0.8] tracking-tighter block whitespace-nowrap">隱形<br/><span className="ml-4">殺手</span></span>
                        </div>
                        <div className="absolute top-8 right-6 lg:-top-4 lg:-right-4 opacity-[0.05] select-none rotate-12 transform origin-top-right text-right">
                            <span className="text-6xl lg:text-9xl font-black text-red-900指標 leading-[0.8] tracking-tighter block whitespace-nowrap">紅燈<br/><span className="mr-4">警戒</span></span>
                        </div>
                        <div className="absolute bottom-12 left-6 lg:-bottom-2 lg:-left-2 opacity-[0.05] select-none rotate-12 transform origin-bottom-left">
                            <span className="text-6xl lg:text-9xl font-black text-emerald-900 leading-[0.8] tracking-tighter block whitespace-nowrap">絕對<br/><span className="ml-4">安全</span></span>
                        </div>
                        <div className="absolute bottom-12 right-6 lg:-bottom-2 lg:-right-2 opacity-[0.05] select-none -rotate-12 transform origin-bottom-right text-right">
                            <span className="text-6xl lg:text-9xl font-black text-amber-600 leading-[0.8] tracking-tighter block whitespace-nowrap">天使<br/><span className="mr-4">甜點</span></span>
                        </div>
                    </div>

                    {/* Burden Mode */}
                    <div className={cn("absolute inset-0 transition-opacity duration-500", chartMode === 'burden' ? 'opacity-100' : 'opacity-0')}>
                        <div className="absolute top-8 left-6 lg:-top-4 lg:-left-4 opacity-[0.05] select-none -rotate-12 transform origin-top-left">
                            <span className="text-6xl lg:text-9xl font-black text-slate-700 leading-[0.8] tracking-tighter block whitespace-nowrap">嘴饞<br/><span className="ml-4">陷阱</span></span>
                        </div>
                        <div className="absolute top-8 right-6 lg:-top-4 lg:-right-4 opacity-[0.05] select-none rotate-12 transform origin-top-right text-right">
                            <span className="text-6xl lg:text-9xl font-black text-red-600 leading-[0.8] tracking-tighter block whitespace-nowrap">熱量<br/><span className="mr-4">炸彈</span></span>
                        </div>
                        <div className="absolute bottom-12 left-6 lg:-bottom-2 lg:-left-2 opacity-[0.05] select-none rotate-12 transform origin-bottom-left">
                            <span className="text-6xl lg:text-9xl font-black text-emerald-600 leading-[0.8] tracking-tighter block whitespace-nowrap">越吃<br/><span className="ml-4">越瘦</span></span>
                        </div>
                        <div className="absolute bottom-12 right-6 lg:-bottom-2 lg:-right-2 opacity-[0.05] select-none -rotate-12 transform origin-bottom-right text-right">
                            <span className="text-6xl lg:text-9xl font-black text-amber-500 leading-[0.8] tracking-tighter block whitespace-nowrap">飽足<br/><span className="mr-4">好油</span></span>
                        </div>
                    </div>

                    {/* TCM Mode */}
                    <div className={cn("absolute inset-0 transition-opacity duration-500", chartMode === 'tcm' ? 'opacity-100' : 'opacity-0')}>
                        <div className="absolute top-8 left-6 lg:-top-4 lg:-left-4 opacity-[0.05] select-none -rotate-12 transform origin-top-left">
                            <span className="text-6xl lg:text-9xl font-black text-cyan-600 leading-[0.8] tracking-tighter block whitespace-nowrap">烈火<br/><span className="ml-4">剋星</span></span>
                        </div>
                        <div className="absolute top-8 right-6 lg:-top-4 lg:-right-4 opacity-[0.05] select-none rotate-12 transform origin-top-right text-right">
                            <span className="text-6xl lg:text-9xl font-black text-orange-600 leading-[0.8] tracking-tighter block whitespace-nowrap">容易<br/><span className="mr-4">上火</span></span>
                        </div>
                        <div className="absolute bottom-12 left-6 lg:-bottom-2 lg:-left-2 opacity-[0.05] select-none rotate-12 transform origin-bottom-left">
                            <span className="text-6xl lg:text-9xl font-black text-lime-700 leading-[0.8] tracking-tighter block whitespace-nowrap">高纖<br/><span className="ml-4">淨化</span></span>
                        </div>
                        <div className="absolute bottom-12 right-6 lg:-bottom-2 lg:-right-2 opacity-[0.05] select-none -rotate-12 transform origin-bottom-right text-right">
                            <span className="text-6xl lg:text-9xl font-black text-amber-800 leading-[0.8] tracking-tighter block whitespace-nowrap">能量<br/><span className="mr-4">溫補</span></span>
                        </div>
                    </div>

                    {/* Flavor Mode */}
                    <div className={cn("absolute inset-0 transition-opacity duration-500", chartMode === 'flavor' ? 'opacity-100' : 'opacity-0')}>
                        <div className="absolute top-8 left-6 lg:-top-4 lg:-left-4 opacity-[0.05] select-none -rotate-12 transform origin-top-left">
                            <span className="text-6xl lg:text-9xl font-black text-lime-600 leading-[0.8] tracking-tighter block whitespace-nowrap">鮮酸<br/><span className="ml-4">生津</span></span>
                        </div>
                        <div className="absolute top-8 right-6 lg:-top-4 lg:-right-4 opacity-[0.05] select-none rotate-12 transform origin-top-right text-right">
                            <span className="text-6xl lg:text-9xl font-black text-amber-500 leading-[0.8] tracking-tighter block whitespace-nowrap">濃郁<br/><span className="mr-4">衝擊</span></span>
                        </div>
                        <div className="absolute bottom-12 left-6 lg:-bottom-2 lg:-left-2 opacity-[0.05] select-none rotate-12 transform origin-bottom-left">
                            <span className="text-6xl lg:text-9xl font-black text-slate-400 leading-[0.8] tracking-tighter block whitespace-nowrap">恬淡<br/><span className="ml-4">輕盈</span></span>
                        </div>
                        <div className="absolute bottom-12 right-6 lg:-bottom-2 lg:-right-2 opacity-[0.05] select-none -rotate-12 transform origin-bottom-right text-right">
                            <span className="text-6xl lg:text-9xl font-black text-pink-500 leading-[0.8] tracking-tighter block whitespace-nowrap">純粹<br/><span className="mr-4">蜜甜</span></span>
                        </div>
                    </div>
                </div>

                {/* 🔥 X、Y 軸線 - 象限分隔（比照原版 index.html） */}
                <div className="absolute inset-0 grid grid-cols-2 grid-rows-2 opacity-30 pointer-events-none ignore-scaling">
                    <div className="border-b border-r border-slate-300 bg-red-50/20"></div>
                    <div className="border-b border-slate-300 bg-red-50/40"></div>
                    <div className="border-r border-slate-300 bg-blue-50/20"></div>
                    <div></div>
                </div>

                {/* Chart Labels */}
                <div className="absolute inset-0 pointer-events-none z-0 ignore-scaling">
                    {/* Top Label */}
                    <span className={cn(
                        "absolute top-2 left-1/2 -translate-x-1/2 text-[10px] font-bold bg-white/90 px-2 py-0.5 rounded-full border shadow-sm flex items-center gap-1 transition-all duration-300",
                        chartMode === 'daily' && "text-red-400 border-red-100",
                        chartMode === 'sugar' && "text-rose-600 border-rose-200",
                        chartMode === 'burden' && "text-rose-600 border-rose-200",
                        chartMode === 'tcm' && "text-sky-500 border-sky-200",
                        chartMode === 'flavor' && "text-lime-600 border-lime-200",
                        chartMode === 'gift' && "text-purple-600 border-purple-200"
                    )}>
                        {chartMode === 'daily' && '🔥 燥熱'}
                        {chartMode === 'sugar' && '🔴 高 GI'}
                        {chartMode === 'burden' && '🔴 高 GI'}
                        {chartMode === 'tcm' && '💦 爆汁'}
                        {chartMode === 'flavor' && '🍋 極酸'}
                        {chartMode === 'gift' && '🌸 濃香'}
                    </span>
                    {/* Bottom Label */}
                    <span className={cn(
                        "absolute bottom-2 left-1/2 -translate-x-1/2 text-[10px] font-bold bg-white/90 px-2 py-0.5 rounded-full border shadow-sm flex items-center gap-1 transition-all duration-300",
                        chartMode === 'daily' && "text-blue-400 border-blue-100",
                        chartMode === 'sugar' && "text-emerald-500 border-emerald-200",
                        chartMode === 'burden' && "text-emerald-500 border-emerald-200",
                        chartMode === 'tcm' && "text-stone-500 border-stone-200",
                        chartMode === 'flavor' && "text-slate-400 border-slate-200",
                        chartMode === 'gift' && "text-slate-400 border-slate-200"
                    )}>
                        {chartMode === 'daily' && '❄️ 寒涼'}
                        {chartMode === 'sugar' && '🟢 低 GI'}
                        {chartMode === 'burden' && '🟢 低 GI'}
                        {chartMode === 'tcm' && '磚紮實'}
                        {chartMode === 'flavor' && '🎐 清淡'}
                        {chartMode === 'gift' && '🍃 淡雅'}
                    </span>
                    {/* Left Label */}
                    <span className={cn(
                        "absolute top-1/2 left-2 -translate-y-1/2 text-[10px] font-bold bg-white/90 px-2 py-0.5 rounded-full border shadow-sm flex items-center gap-1 transition-all duration-300",
                        chartMode === 'daily' && "text-slate-400 border-slate-100",
                        chartMode === 'sugar' && "text-slate-400 border-slate-100",
                        chartMode === 'burden' && "text-emerald-500 border-emerald-100",
                        chartMode === 'tcm' && "text-blue-400 border-blue-100",
                        chartMode === 'flavor' && "text-slate-400 border-slate-100",
                        chartMode === 'gift' && "text-slate-500 border-slate-100"
                    )}>
                        {chartMode === 'daily' && '🌱 低糖'}
                        {chartMode === 'sugar' && '🌱 低糖'}
                        {chartMode === 'burden' && '♻️ 低卡'}
                        {chartMode === 'tcm' && '❄️ 寒涼'}
                        {chartMode === 'flavor' && '🌱 低糖'}
                        {chartMode === 'gift' && '💰 親民'}
                    </span>
                    {/* Right Label */}
                    <span className={cn(
                        "absolute top-1/2 right-2 -translate-y-1/2 text-[10px] font-bold bg-white/90 px-2 py-0.5 rounded-full border shadow-sm flex items-center gap-1 transition-all duration-300",
                        chartMode === 'daily' && "text-pink-400 border-pink-100",
                        chartMode === 'sugar' && "text-pink-400 border-pink-100",
                        chartMode === 'burden' && "text-orange-500 border-orange-100",
                        chartMode === 'tcm' && "text-red-400 border-red-100",
                        chartMode === 'flavor' && "text-pink-400 border-pink-100",
                        chartMode === 'gift' && "text-amber-500 border-amber-100"
                    )}>
                        {chartMode === 'daily' && '🍬 高糖'}
                        {chartMode === 'sugar' && '🍬 高糖'}
                        {chartMode === 'burden' && '🔺 高卡'}
                        {chartMode === 'tcm' && '🔥 燥熱'}
                        {chartMode === 'flavor' && '🍬 高糖'}
                        {chartMode === 'gift' && '💎 奢華'}
                    </span>
                </div>

                {/* Bubbles */}
                <div className="absolute inset-6 z-10">
                    {chartItems.map(fruit => (
                        <button
                            key={fruit.id}
                            onClick={(e) => { e.stopPropagation(); handleFruitClick(fruit); }}
                            onMouseEnter={() => setHoveredFruit(fruit)}
                            onMouseLeave={() => setHoveredFruit(null)}
                            className={cn(
                                "group absolute rounded-full flex items-center justify-center transition-[opacity,transform] duration-150 ease-out focus:outline-none will-change-[opacity,transform]",
                                lockedFruit
                                    ? (lockedFruit.id === fruit.id || hoveredFruit?.id === fruit.id)
                                        ? '!opacity-100 scale-110 shadow-2xl border-white !z-50'
                                        : 'opacity-[0.15] scale-90 border-transparent grayscale blur-[1px]'
                                    : (hoveredFruit?.id === fruit.id)
                                        ? '!opacity-100 scale-110 shadow-xl border-white !z-50'
                                        : 'opacity-40 shadow-sm border border-stone-400/25 scale-100'
                            )}
                            style={{
                                left: `${fruit.domX}%`,
                                bottom: `${fruit.domY}%`,
                                width: fruit.r,
                                height: fruit.r,
                                backgroundColor: fruit.color,
                                transform: 'translate(-50%, 50%)',
                                zIndex: Math.floor(100 - fruit.r)
                            }}
                        >
                            {fruit.r > 32 && (
                                <span className={cn(
                                    "text-white font-bold text-center leading-none px-0.5 break-words drop-shadow-md pointer-events-none transition-opacity duration-300",
                                    (lockedFruit && lockedFruit.id !== fruit.id && hoveredFruit?.id !== fruit.id) ? 'opacity-0' : 'opacity-100'
                                )} style={{ fontSize: Math.min(13, fruit.r * 0.25), textShadow: '0 1px 2px rgba(0,0,0,0.3)' }}>
                                    {fruit.name}
                                </span>
                            )}
                        </button>
                    ))}
                </div>
                
                {/* Tooltip (Global) */}
                { (hoveredFruit || lockedFruit) && (
                    <div className="absolute z-[2000] pointer-events-none transition-[bottom,transform] duration-300 ease-out flex flex-col items-center"
                            style={{
                                left: `${(hoveredFruit || lockedFruit).domX}%`,
                                bottom: `${(hoveredFruit || lockedFruit).domY}%`,
                                transform: `translate(-50%, ${(hoveredFruit || lockedFruit).domY > 60 ? `calc(100% + ${(hoveredFruit || lockedFruit).r/2}px + 12px)` : `calc(0% - ${(hoveredFruit || lockedFruit).r/2}px - 12px)`})`
                            }}>
                            <div className="px-3 py-2 bg-slate-800 text-white text-xs font-bold rounded-xl shadow-xl border border-slate-700 relative whitespace-nowrap">
                            {/* 🔥 箭頭元素 - 比照原版 */}
                            <div 
                                className={cn(
                                    "absolute left-1/2 -translate-x-1/2 w-3 h-3 bg-slate-800 rotate-45",
                                    (hoveredFruit || lockedFruit).domY > 60 
                                        ? "-top-1.5 border-t border-l border-slate-700" 
                                        : "-bottom-1.5 border-b border-r border-slate-700"
                                )}
                            />
                            <div className="flex items-center justify-center gap-1.5 z-10 relative">
                                <span className="text-sm">{(hoveredFruit || lockedFruit).name}</span>
                            </div>
                            <div className="text-[9px] text-slate-400 font-normal mt-0.5 flex gap-2 justify-center items-center">
                                <span>{(hoveredFruit || lockedFruit).properties?.brix}° 糖</span>
                                <span className="w-px h-2 bg-slate-600"></span>
                                <span>{getSeasonLabel((hoveredFruit || lockedFruit).score)}</span>
                            </div>
                            <div className="pt-2 mt-2 border-t border-slate-600/50 animate-pulse text-[10px] text-slate-400 text-center font-medium leading-none">
                                {lockedFruit?.id === (hoveredFruit || lockedFruit).id ? '點擊查看詳情' : '點擊鎖定'}
                            </div>
                            </div>
                    </div>
                )}

                {/* 🔥 圓圈大小說明圖例（左下角） */}
                <div className="absolute bottom-5 left-5 z-20 pointer-events-none select-none flex items-center gap-2 opacity-70 ignore-scaling">
                    <div className="flex items-end gap-0.5 mb-0.5">
                        <div className="w-1 h-1 rounded-full bg-slate-400"></div>
                        <div className="w-1.5 h-1.5 rounded-full bg-slate-400"></div>
                        <div className="w-2.5 h-2.5 rounded-full bg-slate-400"></div>
                    </div>
                    <span className="text-[10px] font-bold text-slate-400">圓圈越大・越盛產</span>
                </div>

                {/* 🔥 互動引導提示（右下角） */}
                <div className={cn(
                    "absolute bottom-5 right-5 z-20 pointer-events-none transition-opacity duration-500 ignore-scaling",
                    lockedFruit ? 'opacity-0' : 'opacity-100'
                )}>
                    <div className="bg-slate-900/60 backdrop-blur-md text-white px-3 py-1.5 rounded-full text-[10px] font-bold shadow-sm flex items-center gap-1.5 border border-white/10">
                        <span className="animate-bounce">👆</span>
                        <span>點擊圓圈</span>
                    </div>
                </div>

            </div>

            {/* SIDEBAR */}
            <div className="w-full shrink-0 flex flex-col mt-0 lg:w-80 lg:h-full lg:flex-none lg:sticky lg:top-2 relative">
                <div className="bg-white rounded-[1.5rem] shadow-lg shadow-indigo-100/50 border border-slate-100 relative overflow-visible flex flex-col lg:flex-1 lg:min-h-0 lg:overflow-hidden">
                    
                    {/* Mode Switcher - 移除手機版 sticky */}
                    <div className="px-4 pt-5 pb-1 z-20 bg-white rounded-t-[1.5rem]">
                        <div className="relative bg-slate-100 p-1 rounded-xl grid grid-cols-3 gap-1 select-none font-bold text-xs shadow-inner h-[4.5rem]">
                            {/* Active Background */}
                            <div className={cn(
                                "absolute w-[calc(33.33%-5px)] h-[calc(50%-6px)] bg-white rounded-lg shadow-sm border border-slate-200/50 transition-all duration-300 ease-[cubic-bezier(0.34,1.56,0.64,1)] z-0",
                                chartMode === 'daily' && 'top-1 left-1',
                                chartMode === 'sugar' && 'top-1 left-[calc(33.33%+2px)]',
                                chartMode === 'burden' && 'top-1 left-[calc(66.66%+2px)]',
                                chartMode === 'tcm' && 'top-[calc(50%+2px)] left-1',
                                chartMode === 'flavor' && 'top-[calc(50%+2px)] left-[calc(33.33%+2px)]',
                                chartMode === 'gift' && 'top-[calc(50%+2px)] left-[calc(66.66%+2px)]'
                            )}></div>

                            <button onClick={() => setChartMode('daily')} className={cn("relative z-10 flex flex-row items-center justify-center gap-1.5 rounded-lg transition-colors duration-300 active:scale-95", chartMode === 'daily' ? 'text-slate-800' : 'text-slate-400')}>
                                <span className="text-sm">🛒</span><span className="text-[11px]">日常</span>
                            </button>
                            <button onClick={() => setChartMode('sugar')} className={cn("relative z-10 flex flex-row items-center justify-center gap-1.5 rounded-lg transition-colors duration-300 active:scale-95", chartMode === 'sugar' ? 'text-rose-600' : 'text-slate-400')}>
                                <span className="text-sm">⚠️</span><span className="text-[11px]">陷阱</span>
                            </button>
                            <button onClick={() => setChartMode('burden')} className={cn("relative z-10 flex flex-row items-center justify-center gap-1.5 rounded-lg transition-colors duration-300 active:scale-95", chartMode === 'burden' ? 'text-indigo-600' : 'text-slate-400')}>
                                <span className="text-sm">🎯</span><span className="text-[11px]">熱量</span>
                            </button>
                            <button onClick={() => setChartMode('tcm')} className={cn("relative z-10 flex flex-row items-center justify-center gap-1.5 rounded-lg transition-colors duration-300 active:scale-95", chartMode === 'tcm' ? 'text-emerald-700' : 'text-slate-400')}>
                                <span className="text-sm">🌿</span><span className="text-[11px]">食養</span>
                            </button>
                            <button onClick={() => setChartMode('flavor')} className={cn("relative z-10 flex flex-row items-center justify-center gap-1.5 rounded-lg transition-colors duration-300 active:scale-95", chartMode === 'flavor' ? 'text-lime-600' : 'text-slate-400')}>
                                <span className="text-sm">🍋</span><span className="text-[11px]">風味</span>
                            </button>
                            <button onClick={() => setChartMode('gift')} className={cn("relative z-10 flex flex-row items-center justify-center gap-1.5 rounded-lg transition-colors duration-300 active:scale-95", chartMode === 'gift' ? 'text-purple-600' : 'text-slate-400')}>
                                <span className="text-sm">🎁</span><span className="text-[11px]">禮贈</span>
                            </button>
                        </div>
                        
                        {/* Mode Description Text */}
                        <div className="mt-1 h-4 grid place-items-center min-h-[1rem]">
                            {chartMode === 'daily' && <span className="text-[10px] text-slate-400 font-medium animate-in fade-in zoom-in duration-300 text-mode-desc">依據「體質寒熱」挑選</span>}
                            {chartMode === 'sugar' && <span className="text-[10px] text-rose-400 font-medium animate-in fade-in zoom-in duration-300 text-mode-desc">高糖 ≠ 高 GI？揭露甜蜜陷阱</span>}
                            {chartMode === 'burden' && <span className="text-[10px] text-indigo-400 font-medium animate-in fade-in zoom-in duration-300 text-mode-desc">精算「熱量 (kcal) vs 升糖」</span>}
                            {chartMode === 'tcm' && <span className="text-[10px] text-emerald-600 font-medium animate-in fade-in zoom-in duration-300 text-mode-desc">東方智慧「寒熱 vs 水分滋潤」</span>}
                            {chartMode === 'flavor' && <span className="text-[10px] text-lime-600 font-medium animate-in fade-in zoom-in duration-300 text-mode-desc">口感光譜「酸度 vs 甜度」</span>}
                            {chartMode === 'gift' && <span className="text-[10px] text-purple-500 font-medium animate-in fade-in zoom-in duration-300 text-mode-desc">送禮攻略「價格 vs 香氣」</span>}
                        </div>
                    </div>

                    <div ref={monthSelectorRef} className="p-4 shrink-0 z-30 bg-white/95 backdrop-blur-md sticky top-0 lg:static border-b border-slate-50 lg:border-none">
                        <div className="flex items-center justify-between mb-3">
                            <h2 className="text-xs font-black text-slate-400 flex items-center gap-1.5 uppercase tracking-wider">
                                📅 產季月份
                            </h2>
                            <button 
                                onClick={() => setMonth(new Date().getMonth() + 1)}
                                className="flex items-center gap-1 text-[10px] font-black text-indigo-500 bg-indigo-50 px-2.5 py-1 rounded-full hover:bg-indigo-100 transition-colors"
                            >
                                <span className="w-1.5 h-1.5 bg-indigo-500 rounded-full animate-pulse"></span>
                                切換即看當季盛產
                            </button>
                        </div>
                        <div className="grid grid-cols-6 gap-1.5">
                            {[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12].map(m => (
                                <button key={m} onClick={() => setMonth(m)} className={cn("text-[10px] font-bold py-1 rounded-lg active:scale-95 text-month-btn", month === m ? 'bg-indigo-600 text-white shadow-md' : 'text-slate-500 bg-slate-50 hover:bg-slate-100 border border-slate-100')}>
                                    {m}月
                                </button>
                            ))}
                        </div>
                    </div>
                    
                    <div className="h-px bg-slate-100 mx-4 shrink-0 hidden lg:block"></div>
                    
                    {/* Control Panel (Checkbox) */}
                    <div className="py-4 flex flex-col shrink-0 bg-white z-20 px-4">
                        <div className="flex items-stretch">
                            <div className="flex-1 flex flex-col justify-center items-center border-r border-slate-100 pr-2">
                                <span className="text-4xl font-black text-slate-800 tracking-tighter leading-none">{visibleCount}</span>
                                <span className="text-[10px] font-bold text-slate-400 mt-1">本月推薦</span>
                            </div>
                            <div className="flex-1 pl-4 flex flex-col justify-center space-y-2">
                                <label className="flex items-center justify-between cursor-pointer group">
                                    <span className={cn("text-[10px] font-bold transition-colors", onlyPremium ? 'text-yellow-600' : 'text-slate-500')}>老饕必吃</span>
                                    <div className="relative ml-1">
                                        <input type="checkbox" className="sr-only" checked={onlyPremium} onChange={() => {
                                            const newVal = !onlyPremium;
                                            setOnlyPremium(newVal);
                                            if (newVal) setOnlyCommon(false);
                                        }} />
                                        <div className={cn("w-7 h-4 bg-slate-200 rounded-full transition-colors", onlyPremium ? 'bg-yellow-400' : '')}></div>
                                        <div className={cn("absolute left-0.5 top-0.5 w-3 h-3 bg-white rounded-full shadow transition-transform", onlyPremium ? 'translate-x-3' : '')}></div>
                                    </div>
                                </label>
                                <label className="flex items-center justify-between cursor-pointer group">
                                    <span className={cn("text-[10px] font-bold transition-colors", onlyCommon ? 'text-teal-600' : 'text-slate-500')}>大眾水果</span>
                                    <div className="relative ml-1">
                                        <input type="checkbox" className="sr-only" checked={onlyCommon} onChange={() => {
                                            const newVal = !onlyCommon;
                                            setOnlyCommon(newVal);
                                            if (newVal) setOnlyPremium(false);
                                        }} />
                                        <div className={cn("w-7 h-4 bg-slate-200 rounded-full transition-colors", onlyCommon ? 'bg-teal-500' : '')}></div>
                                        <div className={cn("absolute left-0.5 top-0.5 w-3 h-3 bg-white rounded-full shadow transition-transform", onlyCommon ? 'translate-x-3' : '')}></div>
                                    </div>
                                </label>
                                <label className="flex items-center justify-between cursor-pointer group">
                                    <span className={cn("text-[10px] font-bold transition-colors", showOffSeason ? 'text-slate-600' : 'text-slate-400')}>顯示非產季</span>
                                    <div className="relative ml-1">
                                        <input type="checkbox" className="sr-only" checked={showOffSeason} onChange={() => setShowOffSeason(!showOffSeason)} />
                                        <div className={cn("w-7 h-4 bg-slate-200 rounded-full transition-colors", showOffSeason ? 'bg-slate-500' : '')}></div>
                                        <div className={cn("absolute left-0.5 top-0.5 w-3 h-3 bg-white rounded-full shadow transition-transform", showOffSeason ? 'translate-x-3' : '')}></div>
                                    </div>
                                </label>
                            </div>
                        </div>
                    </div>
                    
                    <div className="h-px bg-slate-100 mx-4 shrink-0 hidden lg:block"></div>

                    {/* Fruit List - 手機版移除 overflow-y-auto 讓整頁捲動處理 sticky，桌機版維持局部捲動 */}
                    <div className="flex-1 px-4 pb-4 space-y-4 relative z-10 bg-white rounded-b-[1.5rem] lg:overflow-y-auto no-scrollbar">
                        {groupedFruits.length === 0 && (
                            <div className="text-center py-8 text-slate-300 text-xs">本月暫無推薦</div>
                        )}
                        {groupedFruits.map((group: any) => (
                            <div key={group.name} className="pt-3">
                                <h3 
                                    className="text-[10px] font-black text-indigo-500 uppercase tracking-wider sticky top-[9.1rem] lg:top-0 bg-indigo-50/95 backdrop-blur-sm border-b border-indigo-100 pt-2 pb-2 w-full px-4 shadow-sm z-10"
                                >
                                    {group.name}
                                </h3>
                                <div className="grid grid-cols-2 gap-2 mt-3">
                                    {group.items.map((fruit: any) => (
                                        <button key={fruit.id} onClick={() => router.push(`/fruit/${fruit.slug || fruit.id}`)} className={cn(
                                            "group/card flex items-center gap-2 p-2 rounded-xl border transition-all text-left relative overflow-hidden active:scale-95",
                                            fruit.score < 4 ? 'border-slate-100 bg-slate-50/50 opacity-60 grayscale hover:grayscale-0 hover:opacity-100' : fruit.properties?.is_premium ? 'border-yellow-300 bg-yellow-50' : 'border-slate-100 bg-slate-50 hover:bg-white hover:border-indigo-200'
                                        )}>
                                            <div className="w-2 h-2 rounded-full shrink-0" style={{ backgroundColor: fruit.color }}></div>
                                            <div className="min-w-0 flex-1">
                                                <p className="text-xs font-bold text-slate-700 truncate group-hover/card:text-indigo-600 transition-colors">{fruit.name}</p>
                                                <div className="flex items-center text-[10px] leading-none mt-0.5">
                                                    <span className="text-slate-500 font-bold">{fruit.properties?.brix}°糖</span>
                                                    <span className="mx-1 text-slate-300">|</span>
                                                    <span className={cn("font-bold", (fruit.properties?.energy_index || 0) > 0 ? 'text-rose-500' : 'text-sky-500')}>
                                                        {getEnergyLabel(fruit.properties?.energy_index)}
                                                    </span>
                                                </div>
                                            </div>
                                        </button>
                                    ))}
                                </div>
                            </div>
                        ))}
                    </div>
                </div>

                {/* 🔥 Footer Signature: 放置於 Sidebar 容器最下方（比照 index.html） */}
                <div className="mt-3 shrink-0 pb-6 lg:pb-0 text-center select-text">
                    <div className="inline-flex items-center justify-center gap-2 px-3 py-1.5 rounded-full bg-white/50 border border-slate-100/50 backdrop-blur-sm shadow-sm transition-all duration-300 hover:bg-white hover:shadow-md hover:scale-105 group cursor-default">
                        <span className="text-[10px] font-medium text-slate-400 flex items-center gap-1">Made with <span className="text-[10px] animate-pulse">❤️</span> by <span className="font-black text-slate-600">Mike</span></span>
                        <span className="w-0.5 h-2 bg-slate-300 rounded-full"></span>
                        <a href="mailto:blachorz.m@gmail.com" className="text-[10px] font-bold text-slate-400 hover:text-indigo-600 transition-colors flex items-center gap-1">✉️ <span className="underline decoration-slate-200 underline-offset-2 group-hover:decoration-indigo-200">Contact</span></a>
                    </div>
                </div>
            </div>
        </div>

        {/* SEARCH OVERLAY (Modal Style) */}
        {searchOpen && (
            <div className="fixed inset-0 z-[100] flex items-center justify-center px-4 animate-in fade-in duration-200">
                <div className="absolute inset-0 bg-slate-900/40 backdrop-blur-md transition-opacity" onClick={closeSearch}></div>
                <div className="relative w-full max-w-2xl bg-white shadow-2xl rounded-3xl overflow-hidden flex flex-col max-h-[70vh] animate-in zoom-in-95 slide-in-from-bottom-4 duration-200">
                    
                    {/* Header */}
                    <div className="p-4 sm:p-6 border-b border-slate-100 flex items-center gap-3 sm:gap-4 shrink-0">
                        <span className="text-xl sm:text-3xl animate-bounce">🔍</span>
                        <input 
                            ref={searchInputRef}
                            type="text" 
                            value={searchQuery}
                            onChange={(e) => setSearchQuery(e.target.value)}
                            placeholder="搜尋水果、症狀或營養 (如：維他命C)..." 
                            className="w-full text-base sm:text-xl font-bold text-slate-800 placeholder:text-slate-300 outline-none bg-transparent h-10 sm:h-12"
                        />
                        <button onClick={closeSearch} className="p-2 text-slate-300 hover:text-slate-500 bg-slate-100 rounded-full shrink-0 transition-colors">
                            <X className="w-4 h-4 sm:w-5 sm:h-5" />
                        </button>
                    </div>

                    {/* Content */}
                    <div className="overflow-y-auto p-4 min-h-[300px] bg-slate-50/50">
                        {!searchQuery ? (
                            /* Empty State: Trivia */
                            <div className="h-full flex flex-col items-center justify-center text-center py-10 opacity-60">
                                {triviaFruit ? (
                                    <div className="max-w-md">
                                        <div className="text-4xl mb-4 grayscale">{triviaFruit.emoji || '💡'}</div>
                                        <p className="text-[10px] font-black tracking-[0.2em] text-indigo-400 uppercase mb-2">Did You Know?</p>
                                        <h3 className="text-lg font-bold text-slate-700 leading-relaxed cursor-pointer hover:text-indigo-600 transition-colors" onClick={() => router.push(`/fruit/${triviaFruit.slug || triviaFruit.id}`)}>
                                            <span className="text-indigo-600 bg-indigo-50 px-2 py-0.5 rounded-lg mr-1">{triviaFruit.name}</span>
                                            <span>{triviaFruit.properties?.trivia}</span>
                                        </h3>
                                        <button onClick={(e) => { e.stopPropagation(); openSearch(); }} className="mt-6 text-xs font-bold text-slate-400 hover:text-indigo-500 flex items-center gap-1 mx-auto transition-colors">
                                            <Search className="w-3 h-3" />
                                            換一個冷知識
                                        </button>
                                    </div>
                                ) : (
                                    <p className="text-sm text-slate-400">輸入關鍵字開始搜尋...</p>
                                )}
                            </div>
                        ) : (
                            /* Results List */
                            <div className="space-y-2">
                                {searchResults.length === 0 ? (
                                    <div className="text-center py-8 text-slate-400">
                                        <p className="text-2xl mb-2">🤔</p>
                                        <p className="text-sm font-bold">找不到相關的水果</p>
                                        <p className="text-xs mt-1">試試看「便秘」、「維他命」或「紅色」？</p>
                                    </div>
                                ) : (
                                    searchResults.map(fruit => {
                                        const match = getMatchResult(fruit);
                                        const curve = Array.isArray(fruit.season_curve) ? fruit.season_curve : [];
                                        const seasonScore = Number(curve[month - 1]) || 0;

                                        return (
                                            <button key={fruit.id} onClick={() => router.push(`/fruit/${fruit.slug || fruit.id}`)} className="w-full text-left bg-white p-3 rounded-2xl border border-slate-100 shadow-sm hover:border-indigo-300 hover:shadow-md transition-all flex items-center gap-4 group">
                                                <div className="w-12 h-12 rounded-full shadow-inner border border-black/5 shrink-0" style={{ backgroundColor: fruit.properties?.color || '#ccc' }}></div>
                                                <div className="flex-1 min-w-0 flex flex-col justify-center">
                                                    <div className="flex items-center gap-2">
                                                        <span className="text-base font-black text-slate-800 shrink-0" dangerouslySetInnerHTML={{ __html: highlightMatch(fruit.name, searchQuery) }}></span>
                                                        <span className={cn("px-1.5 py-0.5 rounded text-[10px] font-bold shrink-0", seasonScore >= 4 ? 'bg-emerald-100 text-emerald-700' : 'bg-slate-100 text-slate-400')}>
                                                            {seasonScore >= 4 ? '產季中' : '非產季'}
                                                        </span>
                                                    </div>
                                                    <div className="text-xs text-slate-400 font-medium truncate mt-0.5" dangerouslySetInnerHTML={{ __html: highlightMatch(fruit.properties?.keywords, searchQuery) }}></div>
                                                    
                                                    <div className="text-xs text-slate-500 line-clamp-1 mt-1 group-hover:text-indigo-600 transition-colors">
                                                        {match.type !== 'none' ? (
                                                            <span className="flex items-baseline gap-1">
                                                                <span className={cn("font-bold shrink-0 text-[10px] px-1.5 py-0.5 rounded bg-slate-100", match.colorClass)}>
                                                                    {match.label}
                                                                </span>
                                                                <span className="truncate" dangerouslySetInnerHTML={{ __html: highlightMatch(match.text, searchQuery) }}></span>
                                                            </span>
                                                        ) : (
                                                            <span dangerouslySetInnerHTML={{ __html: highlightMatch(fruit.properties?.tagline || '點擊查看詳情', searchQuery) }}></span>
                                                        )}
                                                    </div>
                                                </div>
                                                <div className="text-slate-300 group-hover:text-indigo-500 group-hover:translate-x-1 transition-all">
                                                    <ChevronRight className="w-6 h-6" />
                                                </div>
                                            </button>
                                        );
                                    })
                                )}
                            </div>
                        )}
                    </div>
                    
                    {/* Footer */}
                    <div className="px-6 py-3 bg-slate-50 border-t border-slate-100 text-[10px] text-slate-400 flex justify-between items-center">
                        <span>💡 支援搜尋名稱、功效、情境與營養成分</span>
                        <span className="hidden sm:inline-block font-mono bg-white border border-slate-200 px-1.5 py-0.5 rounded text-slate-500">ESC to close</span>
                    </div>
                </div>
            </div>
        )}
    </div>
  );
}
