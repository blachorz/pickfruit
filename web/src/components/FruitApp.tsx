'use client';

import React, { useState, useEffect, useMemo, useRef } from 'react';
import { Fruit } from '@/utils/supabase';
import { Search, ArrowRight, Share2, X, ChevronLeft, Info, HelpCircle } from 'lucide-react';
import clsx from 'clsx';
import { twMerge } from 'tailwind-merge';

// Helper to merge classes
function cn(...inputs: (string | undefined | null | false)[]) {
  return twMerge(clsx(inputs));
}

// --- Logic Helpers (Ported from Alpine) ---
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

const getSkinLabel = (val: string) => {
  const map: Record<string, string> = { 'Yes': '可食', 'No': '不可食', 'Bitter': '可食帶苦', 'Wax': '表皮有蠟' };
  return map[val] || val || '-';
};

const getSeedLabel = (val: string) => {
  const map: Record<string, string> = { 'Yes': '有籽', 'No': '不可吞', 'Swallow': '可吞食', 'None': '無籽' };
  return map[val] || val || '-';
};

const getChartTheme = (fruit: Fruit) => {
  const baseColor = fruit.properties?.color || '#cccccc';
  // Simple brightness check
  const r = parseInt(baseColor.substr(1, 2), 16);
  const g = parseInt(baseColor.substr(3, 2), 16);
  // const b = parseInt(baseColor.substr(5, 2), 16);
  const luma = 0.2126 * r + 0.7152 * g; // Simplified luma
  
  if (luma > 180) { // Light color
      if (r > 200 && g > 180) return { stroke: '#d97706', fill: baseColor, text: '#d97706' };
      return { stroke: '#475569', fill: baseColor, text: '#475569' };
  }
  return { stroke: baseColor, fill: baseColor, text: baseColor };
};

const getWavePath = (curve: any[], isArea = false) => {
    // curve is JSONB array, usually numbers
    const data = (Array.isArray(curve) ? curve : Array(12).fill(0)).map(Number);
    const maxVal = 12; 
    const width = 100; 
    const step = width / 11;
    const points = data.map((val, i) => { 
        const x = i * step; 
        const y = 50 - ((val || 0) / maxVal) * 50; 
        return [x, y]; 
    });
    
    if (points.length === 0) return '';
    
    let d = `M ${points[0][0]},${points[0][1]}`;
    for (let i = 0; i < points.length - 1; i++) { 
        const p0 = points[i]; 
        const p1 = points[i + 1]; 
        const midX = (p0[0] + p1[0]) / 2; 
        d += ` C ${midX},${p0[1]} ${midX},${p1[1]} ${p1[0]},${p1[1]}`; 
    }
    
    if (isArea) { d += ` V 60 H 0 Z`; }
    return d;
};

// --- Component ---

interface FruitAppProps {
  initialFruits: Fruit[];
}

export default function FruitApp({ initialFruits }: FruitAppProps) {
  // --- State ---
  const [view, setView] = useState<'home' | 'detail' | 'guide'>('home');
  const [chartMode, setChartMode] = useState('daily'); // daily, sugar, burden, tcm, flavor, gift
  const [month, setMonth] = useState(new Date().getMonth() + 1);
  const [searchOpen, setSearchOpen] = useState(false);
  const [searchQuery, setSearchQuery] = useState('');
  
  // Filters
  const [onlyPremium, setOnlyPremium] = useState(false);
  const [onlyCommon, setOnlyCommon] = useState(false);
  const [showOffSeason, setShowOffSeason] = useState(false);
  
  // Interaction
  const [activeFruit, setActiveFruit] = useState<Fruit | null>(null);
  const [lockedFruit, setLockedFruit] = useState<Fruit | null>(null); // For chart selection
  const [hoveredFruit, setHoveredFruit] = useState<any | null>(null); // For chart hover
  const [hoverChartIndex, setHoverChartIndex] = useState<number | null>(null); // For wave chart hover

  // Guide Mode
  const [guideMode, setGuideMode] = useState<'scenario' | 'symptom'>('scenario');
  const [activeFilter, setActiveFilter] = useState<string | null>(null);

  // Computed: Chart Items
  const chartItems = useMemo(() => {
    const isMobile = typeof window !== 'undefined' ? window.innerWidth < 768 : false;
    const baseSize = isMobile ? 12 : 20;
    const PADDING = 5;
    const SAFE_ZONE = 100 - (PADDING * 2);

    return initialFruits
      .filter(f => f.name)
      .map(f => {
        const curve = Array.isArray(f.season_curve) ? f.season_curve : Array(12).fill(0);
        const seasonScore = Number(curve[month - 1]) || 0;

        let isVisible = true;
        if (onlyPremium && !f.properties?.is_premium) isVisible = false;
        if (onlyCommon && !f.properties?.is_common) isVisible = false;
        
        // Mode specific checks
        if (chartMode === 'sugar' && !f.properties?.gi_value) isVisible = false;
        if (chartMode === 'burden' && (!f.properties?.calories || !f.properties?.gi_value)) isVisible = false;
        if (chartMode === 'tcm' && (f.properties?.moisture === undefined || f.properties?.energy_index === undefined)) isVisible = false;
        if (chartMode === 'gift' && (f.properties?.price_level === undefined || f.properties?.aroma === undefined)) isVisible = false;
        if (chartMode === 'flavor' && (f.properties?.acidity === undefined)) isVisible = false;

        let size = 0;
        if (isVisible) {
            const diff = Math.max(0, seasonScore - 4);
            const multiplier = isMobile ? 10 : 16;
            size = baseSize + (Math.pow(diff, 1.25) * multiplier);
        }

        // Calculate Coordinates
        let rawPercentX = 50;
        let rawPercentY = 50;

        const p = f.properties; // Shorthand
        const bubbleColor = p?.color || '#cccccc';

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
      .sort((a, b) => b.r - a.r); // Sort by size desc (draw large first, small on top?) No, actually HTML draws order matters. Usually we want small on top of large.
      // In SVG/DOM, last one is on top. So we should sort by size DESC so large are drawn first (bottom), small drawn last (top).
  }, [initialFruits, month, chartMode, onlyPremium, onlyCommon]);

  // Filter visible fruits for list
  const visibleFruits = useMemo(() => {
      const list = chartItems; // chartItems already filtered by visible logic
      if (showOffSeason) return initialFruits; // If show off season, we might want ALL fruits?
      // Actually the original logic: "getRenderData" does filtering.
      // "getVisibleCount" uses getRenderData.
      // If "showOffSeason" is false, we filter by score >= 4 in the list view.
      
      return initialFruits.filter(f => {
          const curve = Array.isArray(f.season_curve) ? f.season_curve : [];
          const s = Number(curve[month-1]) || 0;
          if (!showOffSeason && s < 4) return false;
          return true;
      }).sort((a,b) => (Number(b.properties?.brix)||0) - (Number(a.properties?.brix)||0));
  }, [initialFruits, month, showOffSeason, chartItems]); // simplified dependency

  // Grouping for list
  const groupedFruits = useMemo(() => {
      const tiers: any = { 
          1: { name: '🔥 大盛產・絕佳賞味', items: [] }, 
          2: { name: '🌿 產季中・品質優', items: [] }, 
          3: { name: '🌱 產季初/尾・嘗鮮', items: [] }, 
          4: { name: '❄️ 非產季・等待中', items: [] } 
      };
      
      // Use filtered chart items to ensure consistency with filters
      // BUT list view might want to show items that are hidden in chart?
      // Original logic: "getRenderData" respects "onlyPremium/onlyCommon".
      // Then "getGroupedFruits" iterates that data.
      
      chartItems.forEach(f => {
          const s = f.score;
          if (s >= 10) tiers[1].items.push(f);
          else if (s >= 7) tiers[2].items.push(f);
          else if (s >= 4) tiers[3].items.push(f);
          else tiers[4].items.push(f);
      });

      const result: any[] = [];
      [1, 2, 3, 4].forEach(level => {
          if (level === 4 && !showOffSeason) return;
          const group = tiers[level];
          if (group.items.length > 0) result.push(group);
      });
      return result;
  }, [chartItems, showOffSeason]);

  // Actions
  const goToDetail = (fruit: Fruit) => {
      setActiveFruit(fruit);
      setView('detail');
      window.scrollTo(0,0);
  };

  const goHome = () => {
      setView('home');
      setActiveFruit(null);
  };

  return (
    <div className="font-sans text-slate-800 bg-slate-50 min-h-screen selection:bg-indigo-100">
      
      {/* 🔵 HOME VIEW */}
      {view === 'home' && (
        <div className="flex flex-col p-4 w-full max-w-6xl mx-auto min-h-screen lg:h-screen lg:overflow-hidden">
            {/* Header */}
            <div className="flex justify-between items-end mb-2 shrink-0 z-10">
                <div>
                    <h1 className="text-2xl font-black tracking-tight text-slate-900 flex items-center gap-2">
                        水果呷對時 🍎
                    </h1>
                    <p className="text-xs text-slate-500 font-medium">跟著季節吃，最對味</p>
                </div>
                <div className="flex items-center gap-1">
                    <div className="text-right leading-none">
                        <span className="text-4xl font-black text-indigo-600/90 tracking-tighter">{month}</span>
                        <span className="text-lg font-bold text-slate-400">月</span>
                    </div>
                    <button onClick={() => setSearchOpen(true)} className="flex items-center justify-center w-10 h-10 bg-white border border-indigo-100 shadow-sm rounded-full active:scale-95 transition hover:shadow-md hover:border-indigo-200 group mr-2">
                        <Search className="w-5 h-5 text-slate-600 group-hover:scale-110 transition-transform" />
                    </button>
                    <button onClick={() => setView('guide')} className="flex items-center gap-1.5 bg-white border border-indigo-100 shadow-sm px-3 py-2 rounded-full active:scale-95 transition group hover:shadow-md hover:border-indigo-200 relative overflow-hidden">
                        <span className="text-base animate-bounce">📖</span>
                        <span className="text-xs font-black bg-gradient-to-r from-indigo-500 to-purple-600 bg-clip-text text-transparent animate-pulse">挑選指南</span>
                    </button>
                </div>
            </div>

            {/* Main Layout */}
            <div className="flex-1 min-h-0 flex flex-col lg:flex-row gap-2 lg:gap-4">
                
                {/* CHART AREA */}
                <div className="flex-1 bg-white rounded-[1.5rem] shadow-sm border border-slate-200 relative overflow-hidden min-h-[45vh] lg:min-h-0"
                     onClick={() => setLockedFruit(null)}>
                    
                    {/* HUD */}
                    <div className="absolute top-5 left-5 z-20 pointer-events-none select-none">
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
                                    <span className="text-6xl lg:text-9xl font-black text-red-900 leading-[0.8] tracking-tighter block whitespace-nowrap">紅燈<br/><span className="mr-4">警戒</span></span>
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

                        {/* Chart Labels */}
                    <div className="absolute inset-0 pointer-events-none z-0">
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
                            {chartMode === 'tcm' && '🧱 紮實'}
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
                                onClick={(e) => { e.stopPropagation(); if (lockedFruit?.id === fruit.id) goToDetail(fruit); else setLockedFruit(fruit); }}
                                onMouseEnter={() => setHoveredFruit(fruit)}
                                onMouseLeave={() => setHoveredFruit(null)}
                                className={cn(
                                    "group absolute rounded-full flex items-center justify-center transition-all duration-300 ease-out focus:outline-none will-change-transform",
                                    lockedFruit
                                        ? (lockedFruit.id === fruit.id || hoveredFruit?.id === fruit.id)
                                            ? '!opacity-100 scale-110 shadow-2xl border-white !z-50 blur-0 grayscale-0'
                                            : 'opacity-20 grayscale-[0.8] scale-90 border-transparent lg:blur-[2px]'
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
                    { (hoveredFruit || lockedFruit) && !searchOpen && (
                        <div className="absolute z-[2000] pointer-events-none transition-[bottom,transform] duration-300 ease-out flex flex-col items-center"
                             style={{
                                 left: `${(hoveredFruit || lockedFruit).domX}%`,
                                 bottom: `${(hoveredFruit || lockedFruit).domY}%`,
                                 transform: `translate(-50%, ${(hoveredFruit || lockedFruit).domY > 60 ? `calc(100% + ${(hoveredFruit || lockedFruit).r/2}px + 12px)` : `calc(0% - ${(hoveredFruit || lockedFruit).r/2}px - 12px)`})`
                             }}>
                             <div className="px-3 py-2 bg-slate-800 text-white text-xs font-bold rounded-xl shadow-xl border border-slate-700 relative whitespace-nowrap">
                                <span className="text-sm">{(hoveredFruit || lockedFruit).name}</span>
                                <div className="text-[9px] text-slate-400 font-normal mt-0.5 flex gap-2 justify-center items-center">
                                    <span>{(hoveredFruit || lockedFruit).properties?.brix}° 糖</span>
                                    <span className="w-px h-2 bg-slate-600"></span>
                                    <span>{getSeasonLabel((hoveredFruit || lockedFruit).score)}</span>
                                </div>
                             </div>
                        </div>
                    )}

                </div>

                {/* SIDEBAR */}
                <div className="w-full shrink-0 flex flex-col mt-0 lg:w-80 lg:h-full lg:flex-none lg:sticky lg:top-2 relative h-auto">
                    <div className="bg-white rounded-[1.5rem] shadow-lg shadow-indigo-100/50 border border-slate-100 relative overflow-visible flex flex-col lg:flex-1 lg:min-h-0 lg:overflow-hidden">
                        
                        {/* Mode Switcher */}
                        <div className="px-4 pt-5 pb-1 z-20 bg-white">
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
                                {chartMode === 'daily' && <span className="text-[10px] text-slate-400 font-medium animate-in fade-in zoom-in duration-300">依據「體質寒熱」挑選</span>}
                                {chartMode === 'sugar' && <span className="text-[10px] text-rose-400 font-medium animate-in fade-in zoom-in duration-300">高糖 ≠ 高 GI？揭露甜蜜陷阱</span>}
                                {chartMode === 'burden' && <span className="text-[10px] text-indigo-400 font-medium animate-in fade-in zoom-in duration-300">精算「熱量 (kcal) vs 升糖」</span>}
                                {chartMode === 'tcm' && <span className="text-[10px] text-emerald-600 font-medium animate-in fade-in zoom-in duration-300">東方智慧「寒熱 vs 水分滋潤」</span>}
                                {chartMode === 'flavor' && <span className="text-[10px] text-lime-600 font-medium animate-in fade-in zoom-in duration-300">口感光譜「酸度 vs 甜度」</span>}
                                {chartMode === 'gift' && <span className="text-[10px] text-purple-500 font-medium animate-in fade-in zoom-in duration-300">送禮攻略「價格 vs 香氣」</span>}
                            </div>
                        </div>

                        {/* Month Selector */}
                        <div className="p-4 shrink-0 z-30 bg-white/95 backdrop-blur-md sticky top-0 lg:static border-b border-slate-50 lg:border-none">
                            <div className="flex items-center justify-between mb-2 px-1">
                                <span className="text-[10px] font-black text-slate-400 uppercase tracking-widest">📅 產季月份</span>
                            </div>
                            <div className="grid grid-cols-6 gap-1.5 text-center select-none">
                                {[1,2,3,4,5,6,7,8,9,10,11,12].map(m => (
                                    <button key={m} onClick={() => setMonth(m)} className={cn("text-[10px] font-bold py-1 rounded-lg transition-all active:scale-95", month === m ? 'bg-indigo-600 text-white shadow-md' : 'text-slate-500 bg-slate-50 hover:bg-slate-100 border border-slate-100')}>
                                        {m}月
                                    </button>
                                ))}
                            </div>
                        </div>

                        {/* Fruit List */}
                        <div className="flex-1 px-4 pb-4 space-y-4 relative z-10 bg-white rounded-b-[1.5rem] h-auto overflow-visible lg:h-full lg:overflow-y-auto lg:no-scrollbar">
                            {groupedFruits.map((group: any) => (
                                <div key={group.name} className="pt-3">
                                    <h3 
                                        className="text-[10px] font-black text-slate-400 uppercase tracking-wider sticky bg-slate-50/95 backdrop-blur-sm border-b border-slate-100 pt-2 pb-2 w-full px-4 shadow-sm z-10"
                                        style={{ top: typeof window !== 'undefined' && window.innerWidth >= 1024 ? '0' : '9.1rem' }}
                                    >
                                        {group.name}
                                    </h3>
                                    <div className="grid grid-cols-2 gap-2 mt-3">
                                        {group.items.map((fruit: any) => (
                                            <button key={fruit.id} onClick={() => goToDetail(fruit)} className={cn(
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
        </div>
      )}

      {/* 🟠 DETAIL VIEW */}
      {view === 'detail' && activeFruit && (
        <div className="fixed inset-0 z-[60] font-sans h-full w-full flex flex-col lg:items-center lg:justify-center lg:bg-slate-900/30 lg:backdrop-blur-sm lg:p-6 animate-in fade-in slide-in-from-bottom-10 duration-300">
            <div className="absolute inset-0 hidden lg:block" onClick={goHome}></div>
            <div className="flex-1 w-full h-full bg-white relative flex flex-col overflow-hidden lg:flex-none lg:h-auto lg:max-h-full lg:w-full lg:max-w-5xl lg:rounded-3xl lg:shadow-2xl z-10">
                <div id="detail-scroll-view" className="flex-1 overflow-y-auto no-scrollbar relative bg-white pb-24">
                    {/* Header */}
                    <div className="relative w-full pt-4 pb-6 px-5 overflow-hidden shrink-0 bg-gradient-to-b from-slate-50 via-slate-50 to-white">
                        <button onClick={goHome} className="absolute top-4 left-4 bg-white/60 backdrop-blur-md p-2 rounded-full shadow-sm hover:bg-white transition z-50 active:scale-95 border border-white/50">
                            <ChevronLeft className="w-5 h-5 text-slate-700" />
                        </button>
                        <div className="absolute -top-20 -right-20 w-80 h-80 rounded-full blur-[80px] opacity-40 pointer-events-none mix-blend-multiply" style={{ backgroundColor: activeFruit.properties?.color }}></div>
                        
                        <div className="relative z-10 mt-10 flex flex-col items-start">
                            <div className="flex flex-wrap gap-2 mb-3 opacity-90">
                                <span className="px-2.5 py-1 bg-white/70 backdrop-blur-sm text-slate-600 text-[10px] font-black tracking-wide rounded-md border border-slate-200/50 shadow-sm uppercase">
                                    {activeFruit.category}
                                </span>
                                {activeFruit.properties?.is_premium && (
                                    <span className="px-2.5 py-1 bg-gradient-to-r from-yellow-100 to-amber-100 text-amber-800 text-[10px] font-black tracking-wide rounded-md border border-amber-200/50 shadow-sm flex items-center gap-1"><span>👑</span> TOP</span>
                                )}
                            </div>
                            <div className="flex flex-col mb-1">
                                <h2 className="text-4xl font-black text-slate-900 tracking-tight leading-none drop-shadow-sm">{activeFruit.name}</h2>
                                <span className="text-xs font-bold text-slate-400/80 uppercase tracking-[0.25em] mt-2 ml-0.5">{activeFruit.properties?.name_en}</span>
                            </div>
                            <div className="relative w-full mt-1 group">
                                <div className="relative rounded-2xl border border-white/40 shadow-sm overflow-hidden backdrop-blur-xl transition-all duration-500 hover:shadow-md hover:border-white/60">
                                    <div className="absolute inset-0 bg-gradient-to-br from-white/80 via-white/40 to-white/20"></div>
                                    <div className="relative px-5 py-4 flex items-start gap-3">
                                        <span className="text-lg shrink-0 leading-none pt-0.5 opacity-60 mix-blend-multiply">❝</span>
                                        <p className="text-sm font-bold text-slate-800/90 italic leading-relaxed drop-shadow-sm">{activeFruit.properties?.tagline || '暫無描述'}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    {/* Content */}
                    <div className="px-6 space-y-8 relative z-10 -mt-2">
                        {/* Info Grid */}
                        <div className="grid grid-cols-3 gap-2 mb-6">
                            <div className="bg-slate-50 p-2 rounded-2xl border border-slate-100 flex flex-col justify-center min-h-[70px]">
                                <p className="text-[10px] text-slate-400 font-bold uppercase mb-1.5">價位水準</p>
                                <div className="flex text-sm font-bold text-slate-700">
                                    {[1,2,3,4,5].map(i => (
                                        <span key={i} className={i <= (activeFruit.properties?.price_level || 1) ? 'text-slate-900' : 'text-slate-200'}>$</span>
                                    ))}
                                </div>
                            </div>
                            <div className="bg-slate-50 p-2 rounded-2xl border border-slate-100 flex flex-col justify-center min-h-[70px]">
                                <p className="text-[10px] text-slate-400 font-bold uppercase mb-1.5">常見別名</p>
                                <p className="text-[11px] text-slate-700 font-bold leading-tight line-clamp-2">{activeFruit.properties?.keywords || '-'}</p>
                            </div>
                            <div className="bg-slate-50 p-2 rounded-2xl border border-slate-100 flex flex-col justify-center min-h-[70px]">
                                <p className="text-[10px] text-slate-400 font-bold uppercase mb-1.5">指標產區</p>
                                <div className="flex flex-col gap-1">
                                    <div className="flex items-center gap-1">
                                        <span className="text-xs leading-none">{(activeFruit.properties?.origin?.includes('台') || activeFruit.properties?.origin?.includes('國')) ? '🇹🇼' : '🌏'}</span>
                                        <span className="text-[11px] font-bold text-slate-700 leading-none">{activeFruit.properties?.origin || '未標示'}</span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        {/* Season Chart (Wave) */}
                        <div className="mb-8 select-none" onMouseLeave={() => setHoverChartIndex(null)}>
                            <div className="flex justify-between items-end mb-2">
                                <p className="text-xs font-bold text-slate-400">產季曲線</p>
                                <div className="flex items-center gap-2">
                                    <span className="text-xs font-black transition-colors" style={{ color: hoverChartIndex !== null ? getChartTheme(activeFruit).text : '#94a3b8' }}>
                                        {hoverChartIndex !== null ? (hoverChartIndex + 1) + '月' : '目前'}
                                    </span>
                                    <span className="text-[10px] font-bold px-1.5 py-0.5 rounded text-white transition-all shadow-sm" style={{ backgroundColor: hoverChartIndex !== null ? getChartTheme(activeFruit).text : '#cbd5e1' }}>
                                        {hoverChartIndex !== null 
                                            ? getSeasonLabel((activeFruit.season_curve || [])[hoverChartIndex]) 
                                            : getSeasonLabel((activeFruit.season_curve || [])[month - 1])}
                                    </span>
                                </div>
                            </div>
                            <div className="relative w-full h-32 touch-pan-x select-none group bg-slate-50/50 rounded-xl"
                                 onMouseMove={(e) => {
                                     const rect = e.currentTarget.getBoundingClientRect();
                                     const x = e.clientX - rect.left;
                                     const width = rect.width;
                                     setHoverChartIndex(Math.min(11, Math.max(0, Math.round((x / width) * 11))));
                                 }}>
                                <svg className="w-full h-full overflow-visible" viewBox="0 0 100 50" preserveAspectRatio="none">
                                    <defs>
                                        <linearGradient id={`grad-${activeFruit.id}`} x1="0%" y1="0%" x2="0%" y2="100%">
                                            <stop offset="0%" stopColor={getChartTheme(activeFruit).fill} stopOpacity="0.5" />
                                            <stop offset="100%" stopColor={getChartTheme(activeFruit).fill} stopOpacity="0.05" />
                                        </linearGradient>
                                    </defs>
                                    <path d={getWavePath(activeFruit.season_curve || [], true)} fill={`url(#grad-${activeFruit.id})`} className="transition-all duration-300 ease-out" />
                                    <path d={getWavePath(activeFruit.season_curve || [], false)} fill="none" stroke={getChartTheme(activeFruit).stroke} strokeWidth="0.8" strokeLinecap="round" vectorEffect="non-scaling-stroke" className="transition-all duration-300 ease-out" />
                                </svg>
                                
                                {/* Current Month Dot */}
                                {hoverChartIndex === null && (
                                    <div className="absolute w-3 h-3 bg-white rounded-full border-[1.5px] shadow-sm pointer-events-none transition-all duration-300 animate-pulse z-10"
                                         style={{ 
                                             borderColor: getChartTheme(activeFruit).stroke, 
                                             left: `${((month - 1) * (100/11))}%`, 
                                             top: `${100 - (((activeFruit.season_curve || [])[month-1] || 0) / 12) * 100}%`,
                                             transform: 'translate(-50%, -50%)'
                                         }}></div>
                                )}
                                
                                {/* Hover Indicator */}
                                {hoverChartIndex !== null && (
                                    <div className="pointer-events-none">
                                        <div className="absolute top-0 bottom-0 border-l border-dashed transition-all duration-75 z-0" style={{ borderColor: getChartTheme(activeFruit).stroke, opacity: 0.4, left: `${(hoverChartIndex * (100/11))}%` }}></div>
                                        <div className="absolute w-3.5 h-3.5 bg-white rounded-full border-2 shadow-md transition-all duration-75 z-20" 
                                             style={{ 
                                                 borderColor: getChartTheme(activeFruit).stroke, 
                                                 left: `${(hoverChartIndex * (100/11))}%`, 
                                                 top: `${100 - (((activeFruit.season_curve || [])[hoverChartIndex] || 0) / 12) * 100}%`,
                                                 transform: 'translate(-50%, -50%)' 
                                             }}></div>
                                    </div>
                                )}
                            </div>
                        </div>

                        {/* Guide Section */}
                        <section>
                            <h3 className="text-base font-bold text-slate-900 mb-3 flex items-center border-l-4 border-amber-500 pl-2">挑選眉角</h3>
                            <div className="bg-white border border-slate-100 rounded-2xl p-2 shadow-sm">
                                <div className="grid grid-cols-2 gap-2">
                                    <div className="bg-slate-50 rounded-xl p-3 text-left">
                                        <div className="flex items-center gap-1.5 mb-1.5 w-full">
                                            <span className="text-lg leading-none">👀</span>
                                            <span className="text-[10px] font-bold text-slate-400">整體</span>
                                        </div>
                                        <p className="text-xs font-bold text-slate-700 leading-snug">{activeFruit.guide?.appearance || '-'}</p>
                                    </div>
                                    <div className="bg-slate-50 rounded-xl p-3 text-left">
                                        <div className="flex items-center gap-1.5 mb-1.5 w-full">
                                            <span className="text-lg leading-none">✋</span>
                                            <span className="text-[10px] font-bold text-slate-400">觸覺</span>
                                        </div>
                                        <p className="text-xs font-bold text-slate-700 leading-snug">{activeFruit.guide?.tactile || '-'}</p>
                                    </div>
                                </div>
                            </div>
                        </section>

                        {/* Health Section */}
                        <section>
                            <h3 className="text-base font-bold text-slate-900 mb-3 flex items-center border-l-4 border-teal-500 pl-2">體質屬性</h3>
                            <div className="bg-slate-800 text-white rounded-2xl p-5 mb-4 relative overflow-hidden shadow-lg shadow-slate-200">
                                <div className="relative z-10">
                                    <div className="flex justify-between items-center mb-4">
                                        <span className="text-xs font-bold text-slate-400">屬性</span>
                                        <span className="text-xs font-bold px-2 py-0.5 bg-slate-700 rounded-full text-slate-300 border border-slate-600">{getEnergyLabel(activeFruit.properties?.energy_index)}</span>
                                    </div>
                                    
                                    {/* Radar Bar */}
                                    <div className="relative h-1 bg-slate-600 rounded-full mb-6 mt-2 mx-1">
                                        <div className="absolute left-0 top-1/2 -translate-y-1/2 w-1.5 h-1.5 bg-slate-500 rounded-full"></div>
                                        <div className="absolute left-1/4 top-1/2 -translate-y-1/2 w-1.5 h-1.5 bg-slate-500 rounded-full"></div>
                                        <div className="absolute left-1/2 top-1/2 -translate-y-1/2 w-1 h-2 bg-slate-400"></div> 
                                        <div className="absolute left-3/4 top-1/2 -translate-y-1/2 w-1.5 h-1.5 bg-slate-500 rounded-full"></div>
                                        <div className="absolute right-0 top-1/2 -translate-y-1/2 w-1.5 h-1.5 bg-slate-500 rounded-full"></div>
                                        
                                        {/* Ping Indicator */}
                                        <div className="absolute top-1/2 -translate-y-1/2 z-20 w-4 h-4 -ml-2 flex items-center justify-center transition-all duration-500 ease-out will-change-left"
                                            style={{ left: `${((Number(activeFruit.properties?.energy_index || 0) + 2) / 4) * 100}%` }}>
                                            <span className="absolute inline-flex h-full w-full rounded-full bg-white/60 opacity-75 animate-ping"></span>
                                            <div className="absolute -inset-1.5 bg-indigo-400/30 rounded-full blur-sm"></div>
                                            <div className="relative w-4 h-4 bg-white border-2 border-slate-800 rounded-full shadow-[0_0_12px_rgba(255,255,255,1)]"></div>
                                        </div>
                                    </div>

                                    <div className="mt-8 flex flex-col items-center text-center">
                                        <div className="w-12 h-px bg-slate-600/50 mb-3"></div>
                                        <span className="text-[10px] text-white/40 mb-1 font-bold tracking-widest uppercase">營養價值</span>
                                        <p className="text-xs text-slate-200 leading-relaxed font-medium px-4 text-balance">{activeFruit.properties?.nutritional_value}</p>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>
            </div>
        </div>
      )}

      {/* Floating Actions */}
      <div className="fixed bottom-5 left-0 right-0 z-[70] w-full flex justify-end px-5 lg:px-4 lg:max-w-6xl lg:mx-auto pointer-events-none">
        <div className="pointer-events-auto flex flex-col items-center gap-3">
            {/* Feedback Button (Mock) */}
            <button className="w-10 h-10 rounded-full bg-slate-800 text-white shadow-lg shadow-slate-400/40 flex items-center justify-center hover:bg-slate-700 active:scale-90 hover:-translate-y-1 transition-all duration-300 group">
                <HelpCircle className="w-5 h-5 group-hover:scale-110 group-hover:-rotate-12 transition-transform duration-300" />
            </button>
        </div>
      </div>

    </div>
  );
}
