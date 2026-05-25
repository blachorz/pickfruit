'use client';

import React, { useState } from 'react';
import Link from 'next/link';
import { useRouter } from 'next/navigation';
import { Fruit } from '@/utils/supabase';
import { ChevronLeft, Share2 } from 'lucide-react';
import clsx from 'clsx';
import { twMerge } from 'tailwind-merge';

function cn(...inputs: (string | undefined | null | false)[]) {
  return twMerge(clsx(inputs));
}

// Helper functions
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
  const r = parseInt(baseColor.substr(1, 2), 16);
  const g = parseInt(baseColor.substr(3, 2), 16);
  const luma = 0.2126 * r + 0.7152 * g;
  
  if (luma > 180) { 
      if (r > 200 && g > 180) return { stroke: '#d97706', fill: baseColor, text: '#d97706' };
      return { stroke: '#475569', fill: baseColor, text: '#475569' };
  }
  return { stroke: baseColor, fill: baseColor, text: baseColor };
};

const getWavePath = (curve: any[], isArea = false) => {
    const data = (Array.isArray(curve) ? curve : Array(12).fill(0)).map(Number);
    const maxVal = 12; const width = 100; const step = width / 11;
    const points = data.map((val, i) => { const x = i * step; const y = 50 - ((val || 0) / maxVal) * 50; return [x, y]; });
    if (points.length === 0) return '';
    let d = `M ${points[0][0]},${points[0][1]}`;
    for (let i = 0; i < points.length - 1; i++) { const p0 = points[i]; const p1 = points[i + 1]; const midX = (p0[0] + p1[0]) / 2; d += ` C ${midX},${p0[1]} ${midX},${p1[1]} ${p1[0]},${p1[1]}`; }
    if (isArea) { d += ` V 60 H 0 Z`; }
    return d;
};

// Colors for bars
const getGIState = (val: number) => {
    const v = Number(val) || 0;
    if (v < 55) return { text: '負擔輕・血糖穩', color: 'text-emerald-300' };
    if (v < 70)  return { text: '需適量・懂節制', color: 'text-amber-300' };
    return { text: '易飆升・避空腹', color: 'text-rose-300' };
};
const getBrixState = (val: number) => {
    const v = Number(val) || 0;
    if (v < 8)  return { text: '微甜・清爽不膩', color: 'text-emerald-300' };
    if (v < 14)  return { text: '香甜・大眾口味', color: 'text-amber-300' };
    return { text: '濃甜・甜度像蜜', color: 'text-rose-300' };
};
const getCaloriesState = (val: number) => {
    const v = Number(val) || 0;
    if (v <= 40) return { text: '低卡・輕盈無負擔', color: 'text-emerald-300' };
    if (v <= 60) return { text: '中卡・適量攝取', color: 'text-amber-300' };
    return { text: '高卡・能量滿滿', color: 'text-rose-300' };
};


interface FruitDetailProps {
  fruit: Fruit;
  relatedFruits?: Fruit[];
  symptomsMetadata?: { name: string; slug: string }[];
}

export function FruitDetail({ fruit, relatedFruits = [], symptomsMetadata = [] }: FruitDetailProps) {
  const router = useRouter();
  const [hoverChartIndex, setHoverChartIndex] = useState<number | null>(null);
  const currentMonth = new Date().getMonth() + 1;

  const getCurrentScore = (f: Fruit) => {
      const curve = Array.isArray(f.season_curve) ? f.season_curve : [];
      return Number(curve[currentMonth - 1]) || 0;
  };

  const handleBack = () => {
      if (window.history.length > 1) {
          router.back();
      } else {
          router.push('/');
      }
  };

  const handleShare = async () => {
      const shareUrl = window.location.href;
      const score = getCurrentScore(fruit);
      
      let strategy = 'A'; 
      if (score > 6) {
         strategy = 'A';
      } else {
         strategy = Math.random() > 0.5 ? 'B' : 'C';
      }

      const symptoms = (fruit.properties?.relief_symptoms || '').split(/[,，、]/).map(s => s.trim()).filter(s => s);
      const hasSymptoms = symptoms.length > 0;
      const hasTrivia = fruit.properties?.trivia && fruit.properties.trivia.length > 5;

      if (strategy === 'B' && !hasSymptoms) strategy = 'A';
      if (strategy === 'C' && !hasTrivia) strategy = 'A';

      let headline = ''; 
      let body = '';     

      if (strategy === 'A') {
          const seasonLabel = getSeasonLabel(score);
          headline = `🔥 救命！現在的【${fruit.name}】也太好吃了吧！`;
          body = `😲 錯過等明年！現在 ${seasonLabel} 沒吃到真的會後悔...\n\n👅 口感：${fruit.properties?.tagline || fruit.properties?.texture_desc || '好吃到無法形容'}\n\n👇 不想買到雷？3招挑選撇步這裏看：`;
      } else if (strategy === 'B') {
          const mainSym = symptoms[0];
          headline = `🩺 身體在呼救？最近剛好需要【${mainSym}】嗎？`;
          const subSym = symptoms.length > 1 ? `幫忙 ${symptoms[1]}` : '是你的神隊友';
          body = `😮 竟然！原來【${fruit.name}】不只解饞，還能${subSym}？\n\n💡 適合：${fruit.properties?.good_for || '日常保養'}\n\n👇 教你怎麼挑最有效 + 查最新產季：`;
      } else {
          headline = `🤯 什麼？原來【${fruit.name}】還有這個秘密？`;
          let safeTrivia = fruit.properties?.trivia || '';
          if (fruit.name && !safeTrivia.startsWith(fruit.name)) {
              safeTrivia = `${fruit.name}${safeTrivia}`;
          }
          body = `🧐 跟大家分享一個冷知識：\n「${safeTrivia}」\n\n👇 點這看「詳細挑選指南」與「完整禁忌」：`;
      }

      const fullMessage = `${headline}\n\n${body}`;
      
      const shareData = { title: headline, text: fullMessage, url: shareUrl };

      if (navigator.share && navigator.canShare && navigator.canShare({ url: shareUrl })) {
          try { await navigator.share(shareData); } catch (err) { console.log('Share cancelled'); }
      } else {
          try { 
              const copyText = `${fullMessage}\n${shareUrl}`;
              await navigator.clipboard.writeText(copyText); 
              alert('📋 文案已複製！貼到 LINE 給朋友看看！'); 
          } catch (err) { 
              prompt('請手動複製連結：', shareUrl); 
          }
      }
  };

  return (
    <div className="flex-1 w-full h-full bg-white relative flex flex-col overflow-hidden min-h-screen font-sans lg:flex-none lg:h-auto lg:max-h-[calc(100vh-3rem)] lg:min-h-0 lg:max-w-5xl lg:rounded-3xl lg:shadow-2xl">
        <div className="flex-1 overflow-y-auto no-scrollbar relative bg-white pb-20 lg:pb-4">
            {/* Header */}
            <div className="relative w-full pt-4 pb-6 px-5 overflow-hidden shrink-0 bg-gradient-to-b from-slate-50 via-slate-50 to-white">
                <button onClick={handleBack} className="absolute top-4 left-4 bg-white/60 backdrop-blur-md p-2 rounded-full shadow-sm hover:bg-white transition z-50 active:scale-95 border border-white/50">
                    <ChevronLeft className="w-5 h-5 text-slate-700" />
                </button>
                <button onClick={handleShare} className="absolute top-4 right-4 bg-white/60 backdrop-blur-md p-2 pl-3 pr-3 rounded-full shadow-sm hover:bg-white transition z-50 active:scale-95 border border-white/50 flex items-center gap-1.5 group">
                    <span className="text-xs font-bold text-slate-700 group-hover:text-indigo-600 transition-colors">分享</span>
                    <Share2 className="w-4 h-4 text-slate-700 group-hover:text-indigo-600 transition-colors" />
                </button>
                <div className="absolute -top-20 -right-20 w-80 h-80 rounded-full blur-[80px] opacity-40 pointer-events-none mix-blend-multiply" style={{ backgroundColor: fruit.properties?.color }}></div>
                
                <div className="relative z-10 mt-10 flex flex-col items-start">
                    <div className="flex flex-wrap gap-2 mb-3 opacity-90">
                        <span className="px-2.5 py-1 bg-white/70 backdrop-blur-sm text-slate-600 text-[10px] font-black tracking-wide rounded-md border border-slate-200/50 shadow-sm uppercase">
                            {fruit.category}
                        </span>
                        {fruit.properties?.is_premium && (
                            <span className="px-2.5 py-1 bg-gradient-to-r from-yellow-100 to-amber-100 text-amber-800 text-[10px] font-black tracking-wide rounded-md border border-amber-200/50 shadow-sm flex items-center gap-1"><span>👑</span> TOP</span>
                        )}
                        {fruit.properties?.is_common && (
                            <span className="px-2.5 py-1 bg-teal-50/80 backdrop-blur-sm text-teal-700 text-[10px] font-black tracking-wide rounded-md border border-teal-100/50">國民水果</span>
                        )}
                    </div>
                    <div className="flex flex-col mb-1">
                        <h2 className="text-4xl font-black text-slate-900 tracking-tight leading-none drop-shadow-sm">{fruit.name}</h2>
                        <span className="text-xs font-bold text-slate-400/80 uppercase tracking-[0.25em] mt-2 ml-0.5">{fruit.properties?.name_en}</span>
                    </div>
                    <div className="relative w-full mt-1 group">
                        <div className="relative rounded-2xl border border-white/40 shadow-sm overflow-hidden backdrop-blur-xl transition-all duration-500 hover:shadow-md hover:border-white/60">
                            <div className="absolute inset-0 bg-gradient-to-br from-white/80 via-white/40 to-white/20"></div>
                            <div className="relative px-5 py-4 flex items-start gap-3">
                                <span className="text-lg shrink-0 leading-none pt-0.5 opacity-60 mix-blend-multiply">❝</span>
                                <p className="text-sm font-bold text-slate-800/90 italic leading-relaxed drop-shadow-sm">{fruit.properties?.tagline || '暫無描述'}</p>
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
                                <span key={i} className={i <= (fruit.properties?.price_level || 1) ? 'text-slate-900' : 'text-slate-200'}>$</span>
                            ))}
                        </div>
                    </div>
                    <div className="bg-slate-50 p-2 rounded-2xl border border-slate-100 flex flex-col justify-center min-h-[70px]">
                        <p className="text-[10px] text-slate-400 font-bold uppercase mb-1.5">常見別名</p>
                        <p className="text-[11px] text-slate-700 font-bold leading-tight line-clamp-2">{fruit.properties?.keywords || '-'}</p>
                    </div>
                    <div className="bg-slate-50 p-2 rounded-2xl border border-slate-100 flex flex-col justify-center min-h-[70px]">
                        <p className="text-[10px] text-slate-400 font-bold uppercase mb-1.5">指標產區</p>
                        <div className="flex flex-col gap-1">
                            <div className="flex items-center gap-1">
                                <span className="text-xs leading-none">{(fruit.properties?.origin?.includes('台') || fruit.properties?.origin?.includes('國')) ? '🇹🇼' : '🌏'}</span>
                                <span className="text-[11px] font-bold text-slate-700 leading-none">{fruit.properties?.origin || '未標示'}</span>
                            </div>
                            {fruit.properties?.best_origin && (
                                <div className="flex items-center gap-1 overflow-hidden">
                                    <span className="text-xs leading-none shrink-0 opacity-80">📍</span>
                                    <span className="text-[11px] font-bold text-slate-700 leading-none truncate">{fruit.properties.best_origin}</span>
                                </div>
                            )}
                        </div>
                    </div>
                </div>

                {/* Season Chart (Wave) */}
                <div className="mb-8 select-none" onMouseLeave={() => setHoverChartIndex(null)}>
                    <div className="flex justify-between items-end mb-2">
                        <p className="text-xs font-bold text-slate-400">產季曲線</p>
                        <div className="flex items-center gap-2">
                            <span className="text-xs font-black transition-colors" style={{ color: hoverChartIndex !== null ? getChartTheme(fruit).text : '#94a3b8' }}>
                                {hoverChartIndex !== null ? (hoverChartIndex + 1) + '月' : '目前'}
                            </span>
                            <span className="text-[10px] font-bold px-1.5 py-0.5 rounded text-white transition-all shadow-sm" style={{ backgroundColor: hoverChartIndex !== null ? getChartTheme(fruit).text : '#cbd5e1' }}>
                                {hoverChartIndex !== null 
                                    ? getSeasonLabel((fruit.season_curve || [])[hoverChartIndex]) 
                                    : getSeasonLabel((fruit.season_curve || [])[currentMonth - 1])}
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
                                <linearGradient id={`grad-${fruit.id}`} x1="0%" y1="0%" x2="0%" y2="100%">
                                    <stop offset="0%" stopColor={getChartTheme(fruit).fill} stopOpacity="0.5" />
                                    <stop offset="100%" stopColor={getChartTheme(fruit).fill} stopOpacity="0.05" />
                                </linearGradient>
                            </defs>
                            <line x1="0" y1="12.5" x2="100" y2="12.5" stroke="#f1f5f9" strokeWidth="0.3" />
                            <line x1="0" y1="25" x2="100" y2="25" stroke="#f1f5f9" strokeWidth="0.3" />
                            <line x1="0" y1="37.5" x2="100" y2="37.5" stroke="#f1f5f9" strokeWidth="0.3" />
                            <path d={getWavePath(fruit.season_curve || [], true)} fill={`url(#grad-${fruit.id})`} className="transition-all duration-300 ease-out" />
                            <path d={getWavePath(fruit.season_curve || [], false)} fill="none" stroke={getChartTheme(fruit).stroke} strokeWidth="0.8" strokeLinecap="round" vectorEffect="non-scaling-stroke" className="transition-all duration-300 ease-out" />
                        </svg>
                        
                        {hoverChartIndex === null && (
                            <div className="absolute w-3 h-3 bg-white rounded-full border-[1.5px] shadow-sm pointer-events-none transition-all duration-300 animate-pulse z-10"
                                    style={{ 
                                        borderColor: getChartTheme(fruit).stroke, 
                                        left: `${((currentMonth - 1) * (100/11))}%`, 
                                        top: `${100 - (((fruit.season_curve || [])[currentMonth-1] || 0) / 12) * 100}%`,
                                        transform: 'translate(-50%, -50%)'
                                    }}></div>
                        )}
                        
                        {hoverChartIndex !== null && (
                            <div className="pointer-events-none">
                                <div className="absolute top-0 bottom-0 border-l border-dashed transition-all duration-75 z-0" style={{ borderColor: getChartTheme(fruit).stroke, opacity: 0.4, left: `${(hoverChartIndex * (100/11))}%` }}></div>
                                <div className="absolute w-3.5 h-3.5 bg-white rounded-full border-2 shadow-md transition-all duration-75 z-20" 
                                        style={{ 
                                            borderColor: getChartTheme(fruit).stroke, 
                                            left: `${(hoverChartIndex * (100/11))}%`, 
                                            top: `${100 - (((fruit.season_curve || [])[hoverChartIndex] || 0) / 12) * 100}%`,
                                            transform: 'translate(-50%, -50%)' 
                                        }}></div>
                            </div>
                        )}
                        <div className="relative w-full h-4 mt-2">
                            {Array.from({length: 12}).map((_, idx) => (
                                <div key={idx} className={cn(
                                    "absolute top-0 text-[9px] font-medium transition-all duration-200 pointer-events-none",
                                    (hoverChartIndex !== null ? hoverChartIndex === idx : (currentMonth - 1) === idx) 
                                        ? "text-slate-800 font-bold scale-110 opacity-100" 
                                        : "text-slate-300 opacity-80"
                                )} style={{ 
                                    left: `${idx * (100/11)}%`, 
                                    transform: `translateX(${idx === 0 ? '0%' : (idx === 11 ? '-100%' : '-50%')})` 
                                }}>
                                    <span>{idx + 1}月</span>
                                </div>
                            ))}
                        </div>
                    </div>
                </div>

                {/* Guide Section */}
                <section>
                    <h3 className="text-base font-bold text-slate-900 mb-3 flex items-center border-l-4 border-amber-500 pl-2">挑選眉角</h3>
                    <div className="bg-white border border-slate-100 rounded-2xl p-2 shadow-sm">
                        <div className="grid grid-cols-2 gap-2">
                            <div className="bg-slate-50 rounded-xl p-3 text-left flex flex-col justify-center h-full items-start">
                                <div className="flex items-center gap-1.5 mb-1.5 w-full">
                                    <span className="text-lg leading-none">👀</span>
                                    <span className="text-[10px] font-bold text-slate-400">整體</span>
                                </div>
                                <p className="text-xs font-bold text-slate-700 leading-snug">{fruit.guide?.appearance || '-'}</p>
                            </div>
                            <div className="bg-slate-50 rounded-xl p-3 text-left flex flex-col justify-center h-full items-start">
                                <div className="flex items-center gap-1.5 mb-1.5 w-full">
                                    <span className="text-lg leading-none">🔍</span>
                                    <span className="text-[10px] font-bold text-slate-400">細節</span>
                                </div>
                                <p className="text-xs font-bold text-slate-700 leading-snug">{fruit.guide?.detail || '-'}</p>
                            </div>
                            <div className="bg-slate-50 rounded-xl p-3 text-left flex flex-col justify-center h-full items-start">
                                <div className="flex items-center gap-1.5 mb-1.5 w-full">
                                    <span className="text-lg leading-none">✋</span>
                                    <span className="text-[10px] font-bold text-slate-400">觸覺</span>
                                </div>
                                <p className="text-xs font-bold text-slate-700 leading-snug">{fruit.guide?.tactile || '-'}</p>
                            </div>
                            <div className="bg-amber-50 rounded-xl p-3 text-left border border-amber-100/50 flex flex-col justify-center h-full items-start">
                                <div className="flex items-center gap-1.5 mb-1.5 w-full">
                                    <span className="text-lg leading-none">👃</span>
                                    <span className="text-[10px] font-bold text-amber-600">進階</span>
                                </div>
                                <p className="text-xs font-bold text-amber-900 leading-snug">{fruit.guide?.sense || '無特殊氣味'}</p>
                            </div>
                        </div>
                    </div>
                </section>

                {/* Sensory & Specs */}
                <section>
                    <h3 className="text-base font-bold text-slate-900 mb-4 flex items-center border-l-4 border-indigo-500 pl-2">口感與風味</h3>
                    <div className="bg-white border border-slate-100 shadow-sm rounded-2xl p-5">
                        <div className="space-y-4 mb-6">
                            {/* Brix */}
                            <div className="flex items-center text-xs h-7">
                                <span className="w-8 text-slate-400 font-bold shrink-0">糖度</span>
                                <div className="flex-1 h-2 bg-slate-100 rounded-full mx-3 relative isolate overflow-visible">
                                    <div className="absolute top-0 bottom-0 w-[1px] bg-white/80 z-10 shadow-[1px_0_2px_rgba(0,0,0,0.1)]" style={{ left: '25%' }}></div>
                                    <div className="absolute top-0 bottom-0 w-[1px] bg-white/80 z-10 shadow-[1px_0_2px_rgba(0,0,0,0.1)]" style={{ left: '43.75%' }}></div>
                                    <div className="h-full bg-pink-400 rounded-full relative z-0" style={{ width: `${((fruit.properties?.brix || 0) / 32) * 100}%` }}></div>
                                    <div className="absolute bottom-full mb-1.5 flex flex-col items-center z-20 -translate-x-1/2" style={{ left: `${((fruit.properties?.brix || 0) / 32) * 100}%` }}>
                                        <div className="px-1.5 py-0.5 rounded shadow-xl bg-slate-900/70 backdrop-blur-sm whitespace-nowrap border border-white/10">
                                            <span className={cn("text-[10px] font-black leading-none tracking-wide drop-shadow-sm block mt-[1px]", getBrixState(fruit.properties?.brix || 0).color)}>
                                                {getBrixState(fruit.properties?.brix || 0).text}
                                            </span>
                                        </div>
                                        <div className="w-0 h-0 border-l-[3px] border-l-transparent border-r-[3px] border-r-transparent border-t-[3px] border-t-slate-900/70 -mt-[1px]"></div>
                                    </div>
                                </div>
                                <span className="w-6 text-right font-mono font-bold text-slate-700">{fruit.properties?.brix}°</span>
                            </div>
                            {/* GI */}
                            <div className="flex items-center text-xs h-7">
                                <span className="w-8 text-slate-400 font-bold shrink-0">GI值</span>
                                <div className="flex-1 h-2 bg-slate-100 rounded-full mx-3 relative isolate overflow-visible">
                                    <div className="absolute top-0 bottom-0 w-[1px] bg-white/80 z-10 shadow-[1px_0_2px_rgba(0,0,0,0.1)]" style={{ left: '55%' }}></div>
                                    <div className="absolute top-0 bottom-0 w-[1px] bg-white/80 z-10 shadow-[1px_0_2px_rgba(0,0,0,0.1)]" style={{ left: '70%' }}></div>
                                    <div className="h-full bg-orange-400 rounded-full relative z-0" style={{ width: `${((fruit.properties?.gi_value || 0) / 100) * 100}%` }}></div>
                                    <div className="absolute bottom-full mb-1.5 flex flex-col items-center z-20 -translate-x-1/2" style={{ left: `${((fruit.properties?.gi_value || 0) / 100) * 100}%` }}>
                                        <div className="px-1.5 py-0.5 rounded shadow-xl bg-slate-900/70 backdrop-blur-sm whitespace-nowrap border border-white/10">
                                            <span className={cn("text-[10px] font-black leading-none tracking-wide drop-shadow-sm block mt-[1px]", getGIState(fruit.properties?.gi_value || 0).color)}>
                                                {getGIState(fruit.properties?.gi_value || 0).text}
                                            </span>
                                        </div>
                                        <div className="w-0 h-0 border-l-[3px] border-l-transparent border-r-[3px] border-r-transparent border-t-[3px] border-t-slate-900/70 -mt-[1px]"></div>
                                    </div>
                                </div>
                                <span className="w-6 text-right font-mono font-bold text-slate-700">{fruit.properties?.gi_value || '-'}</span>
                            </div>
                            {/* Calories */}
                            <div className="flex items-center text-xs h-7">
                                <span className="w-8 text-slate-400 font-bold shrink-0">熱量</span>
                                <div className="flex-1 h-2 bg-slate-100 rounded-full mx-3 relative isolate overflow-visible">
                                    <div className="absolute top-0 bottom-0 w-[1px] bg-white/80 z-10 shadow-[1px_0_2px_rgba(0,0,0,0.1)]" style={{ left: '40%' }}></div>
                                    <div className="absolute top-0 bottom-0 w-[1px] bg-white/80 z-10 shadow-[1px_0_2px_rgba(0,0,0,0.1)]" style={{ left: '60%' }}></div>
                                    <div className="h-full bg-rose-400 rounded-full relative z-0" style={{ width: `${Math.min(100, ((fruit.properties?.calories || 0) / 100) * 100)}%` }}></div>
                                    <div className="absolute bottom-full mb-1.5 flex flex-col items-center z-20 -translate-x-1/2" style={{ left: `${Math.min(100, ((fruit.properties?.calories || 0) / 100) * 100)}%` }}>
                                        <div className="px-1.5 py-0.5 rounded shadow-xl bg-slate-900/70 backdrop-blur-sm whitespace-nowrap border border-white/10">
                                            <span className={cn("text-[10px] font-black leading-none tracking-wide drop-shadow-sm block mt-[1px]", getCaloriesState(fruit.properties?.calories || 0).color)}>
                                                {getCaloriesState(fruit.properties?.calories || 0).text}
                                            </span>
                                        </div>
                                        <div className="w-0 h-0 border-l-[3px] border-l-transparent border-r-[3px] border-r-transparent border-t-[3px] border-t-slate-900/70 -mt-[1px]"></div>
                                    </div>
                                </div>
                                <span className="w-6 text-right font-mono font-bold text-slate-700">{fruit.properties?.calories || '-'}</span>
                            </div>
                            {/* Acidity */}
                            <div className="flex items-center text-xs">
                                <span className="w-8 text-slate-400 font-bold">酸度</span>
                                <div className="flex-1 h-2 bg-slate-100 rounded-full mx-3 overflow-hidden">
                                    <div className="h-full bg-yellow-400 rounded-full" style={{ width: `${((fruit.properties?.acidity || 0) / 10) * 100}%` }}></div>
                                </div>
                                <span className="w-6 text-right font-mono font-bold text-slate-700">{fruit.properties?.acidity || '-'}</span>
                            </div>
                            {/* Moisture */}
                            <div className="flex items-center text-xs">
                                <span className="w-8 text-slate-400 font-bold">水分</span>
                                <div className="flex-1 h-2 bg-slate-100 rounded-full mx-3 overflow-hidden">
                                    <div className="h-full bg-blue-400 rounded-full" style={{ width: `${((fruit.properties?.moisture || 0) / 10) * 100}%` }}></div>
                                </div>
                                <span className="w-6 text-right font-mono font-bold text-slate-700">{fruit.properties?.moisture || '-'}</span>
                            </div>
                            {/* Aroma */}
                            <div className="flex items-center text-xs">
                                <span className="w-8 text-slate-400 font-bold">香氣</span>
                                <div className="flex-1 h-2 bg-slate-100 rounded-full mx-3 overflow-hidden">
                                    <div className="h-full bg-purple-400 rounded-full" style={{ width: `${((fruit.properties?.aroma || 0) / 10) * 100}%` }}></div>
                                </div>
                                <span className="w-6 text-right font-mono font-bold text-slate-700">{fruit.properties?.aroma || '-'}</span>
                            </div>
                        </div>
                        <div className="h-px bg-slate-100 w-full mb-4"></div>
                        <div className="space-y-3">
                            <div className="flex gap-3">
                                <div className="shrink-0 pt-0.5 text-lg">😋</div>
                                <div>
                                    <span className="text-[10px] font-bold text-slate-400 block mb-0.5">口感特色</span>
                                    <p className="text-sm font-bold text-slate-800 leading-relaxed">{fruit.properties?.texture_desc || fruit.guide?.texture_desc || '-'}</p>
                                </div>
                            </div>
                            <div className="grid grid-cols-4 gap-2 pt-2">
                                <div className="col-span-1 bg-slate-50 rounded-xl py-2 px-1 pl-3 flex flex-col items-start justify-center border border-slate-100 min-h-[70px]">
                                    <span className="text-[10px] text-slate-400 mb-1">外皮</span>
                                    <span className="text-xs font-bold text-slate-700 text-left leading-tight">{getSkinLabel(fruit.properties?.skin_edible || '')}</span>
                                </div>
                                <div className="col-span-1 bg-slate-50 rounded-xl py-2 px-1 pl-3 flex flex-col items-start justify-center border border-slate-100 min-h-[70px]">
                                    <span className="text-[10px] text-slate-400 mb-1">種籽</span>
                                    <span className="text-xs font-bold text-slate-700 text-left leading-tight">{getSeedLabel(fruit.properties?.seed_edible || '')}</span>
                                </div>
                                <div className="col-span-2 bg-sky-50 rounded-xl py-3 px-2 pl-4 flex flex-col items-start justify-center border border-sky-100 min-h-[70px]">
                                    <div className="flex items-center gap-1 mb-1">
                                        <span className="text-[10px]">💡</span>
                                        <span className="text-[10px] text-sky-500 font-bold">保存方式</span>
                                    </div>
                                    <span className="text-xs font-bold text-sky-800 text-left leading-tight line-clamp-2">{fruit.guide?.storage}</span>
                                </div>
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
                                <span className="text-xs font-bold px-2 py-0.5 bg-slate-700 rounded-full text-slate-300 border border-slate-600">{getEnergyLabel(fruit.properties?.energy_index)}</span>
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
                                    style={{ left: `${((Number(fruit.properties?.energy_index || 0) + 2) / 4) * 100}%` }}>
                                    <span className="absolute inline-flex h-full w-full rounded-full bg-white/60 opacity-75 animate-ping"></span>
                                    <div className="absolute -inset-1.5 bg-indigo-400/30 rounded-full blur-sm"></div>
                                    <div className="relative w-4 h-4 bg-white border-2 border-slate-800 rounded-full shadow-[0_0_12px_rgba(255,255,255,1)]"></div>
                                </div>
                                <div className="absolute top-4 w-full left-0 h-4 select-none pointer-events-none">
                                    <span className="absolute left-0 -translate-x-1/2 text-[10px] font-bold text-slate-400 whitespace-nowrap">偏寒</span>
                                    <span className="absolute left-1/4 -translate-x-1/2 text-[10px] font-bold text-slate-500 whitespace-nowrap">涼</span>
                                    <span className="absolute left-1/2 -translate-x-1/2 text-[10px] font-bold text-slate-300 whitespace-nowrap">平性</span>
                                    <span className="absolute left-3/4 -translate-x-1/2 text-[10px] font-bold text-slate-500 whitespace-nowrap">溫</span>
                                    <span className="absolute left-full -translate-x-1/2 text-[10px] font-bold text-slate-400 whitespace-nowrap">燥熱</span>
                                </div>
                            </div>

                            <div className="mt-8 flex flex-col items-center text-center">
                                <div className="w-12 h-px bg-slate-600/50 mb-3"></div>
                                <span className="text-[10px] text-white/40 mb-1 font-bold tracking-widest uppercase">營養價值</span>
                                <p className="text-xs text-slate-200 leading-relaxed font-medium px-4 text-balance">{fruit.properties?.nutritional_value}</p>
                            </div>
                        </div>
                    </div>
                    
                    {/* Good / Bad */}
                    <div className="space-y-3 mt-4">
                        <div className="grid grid-cols-2 gap-3">
                            <div className="bg-emerald-50/50 border border-emerald-100 p-4 rounded-2xl flex flex-col items-start h-full">
                                <div className="flex items-center gap-1.5 mb-2">
                                <span className="text-sm">🙆🏻‍♂️</span><span className="text-[10px] font-black text-emerald-600 uppercase tracking-wider">適宜</span>
                                </div>
                                <p className="text-xs font-bold text-slate-700 leading-relaxed text-left">{fruit.properties?.good_for || '一般體質皆可'}</p>
                            </div>
                            <div className="bg-rose-50/50 border border-rose-100 p-4 rounded-2xl flex flex-col items-start h-full">
                                <div className="flex items-center gap-1.5 mb-2">
                                <span className="text-sm">🙅🏻‍♀️</span><span className="text-[10px] font-black text-rose-600 uppercase tracking-wider">禁忌</span>
                                </div>
                                <p className="text-xs font-bold text-slate-700 leading-relaxed text-left">{fruit.properties?.bad_for || '無特殊禁忌'}</p>
                            </div>
                        </div>
                        
                        {/* Safety Warning */}
                        {fruit.properties?.safety_warning && (
                            <div className="bg-orange-50/50 border border-orange-100 p-4 rounded-2xl flex items-start gap-3 text-left">
                                <span className="text-lg shrink-0 mt-0.5">⚠️</span>
                                <div>
                                    <span className="block text-[10px] font-black text-orange-400 uppercase tracking-wider mb-1">安全警示</span>
                                    <p className="text-xs font-bold text-orange-800 leading-relaxed">{fruit.properties.safety_warning}</p>
                                </div>
                            </div>
                        )}

                        {/* Relief Symptoms */}
                        {fruit.properties?.relief_symptoms && (
                            <div className="bg-indigo-50 border border-indigo-100/50 p-4 rounded-2xl flex flex-col items-start relative overflow-hidden group">
                                <div className="absolute -right-4 -top-8 text-indigo-200/30 text-[8rem] leading-none font-black select-none pointer-events-none rotate-12 transition-transform duration-700 group-hover:rotate-45">+</div>
                                <div className="flex items-center gap-2 mb-3 relative z-10">
                                    <div className="w-6 h-6 rounded-full bg-indigo-100 flex items-center justify-center text-sm">🩺</div>
                                    <span className="text-[10px] font-black text-indigo-600 uppercase tracking-wider">緩解症狀</span>
                                </div>
                                <div className="flex flex-wrap gap-2 mb-3 relative z-10">
                                    {(fruit.properties.relief_symptoms || '').split(/[,，、]/).filter((s: string) => s.trim()).map((symptom: string, i: number) => {
                                        const cleanName = symptom.trim();
                                        const meta = symptomsMetadata.find(m => m.name === cleanName);
                                        const slug = meta?.slug;
                                        const className = "pl-2 pr-3 py-1.5 bg-indigo-600 text-white text-[11px] font-bold rounded-lg shadow-md shadow-indigo-200 flex items-center gap-1.5 transform transition hover:scale-105 active:scale-95 hover:bg-indigo-500";
                                        
                                        if (slug) {
                                            return (
                                                <Link key={i} href={`/guide?mode=symptom&filter=${slug}`} className={className}>
                                                    ✓ {cleanName}
                                                </Link>
                                            );
                                        }
                                        return (
                                            <span key={i} className={className}>
                                                ✓ {cleanName}
                                            </span>
                                        );
                                    })}
                                </div>
                                <div className="w-full bg-white/80 backdrop-blur-sm rounded-xl p-3 border border-indigo-100/50 relative z-10">
                                    <p className="text-[10px] font-bold text-indigo-400 mb-1">🔬 作用機制</p>
                                    <p className="text-xs font-bold text-slate-700 leading-relaxed">{fruit.properties?.relief_mechanism || '暫無詳細機制說明'}</p>
                                </div>
                            </div>
                        )}

                        {/* Trivia */}
                        {fruit.properties?.trivia && (
                            <div className="bg-purple-50/50 border border-purple-100 p-4 rounded-2xl flex items-start gap-3 text-left">
                                <span className="text-lg shrink-0 mt-0.5">💡</span>
                                <div>
                                   <span className="block text-[10px] font-black text-purple-400 uppercase tracking-wider mb-1">冷知識</span>
                                   <p className="text-xs font-bold text-purple-800 leading-relaxed opacity-90">{fruit.properties.trivia}</p>
                                </div>
                            </div>
                        )}
                    </div>
                </section>

                {/* Related Fruits */}
                {relatedFruits.length > 0 && (
                    <div className="mt-8 mb-4">
                        <div className="flex items-center gap-2 mb-4 px-1">
                            <span className="text-lg animate-bounce">✨</span>
                            <h3 className="text-sm font-black text-slate-800">猜你喜歡</h3>
                            <span className="text-[10px] text-slate-400 bg-slate-100 px-2 py-0.5 rounded-full">當季精選</span>
                        </div>
                        <div className="flex gap-3 overflow-x-auto pb-4 -mx-6 px-6 no-scrollbar snap-x snap-mandatory">
                            {relatedFruits.map(rec => (
                                <button key={rec.id} onClick={() => router.push(`/fruit/${rec.slug || rec.id}`)} 
                                        className="snap-center shrink-0 w-36 bg-white border border-slate-100 rounded-2xl p-3 shadow-sm flex flex-col items-center text-center transition-transform active:scale-95 group relative overflow-hidden">
                                    <div className="absolute top-0 inset-x-0 h-1 bg-gradient-to-r from-transparent via-indigo-400 to-transparent opacity-50"></div>
                                    <div className="w-12 h-12 rounded-full shadow-inner border border-black/5 mb-2 mt-1 transition-transform group-hover:scale-110" style={{ backgroundColor: rec.properties?.color || '#ccc' }}></div>
                                    <div className="w-full">
                                        <p className="text-sm font-black text-slate-800 truncate">{rec.name}</p>
                                        <p className="text-[9px] font-bold text-indigo-500 bg-indigo-50 rounded-md py-0.5 mt-1 truncate px-1">
                                            {rec.properties?.recommendReason || '當季推薦'}
                                        </p>
                                    </div>
                                    <div className="mt-2 flex items-center gap-1 justify-center opacity-60">
                                        <div className={cn("w-1.5 h-1.5 rounded-full", getCurrentScore(rec) >= 10 ? 'bg-rose-500' : 'bg-emerald-500')}></div>
                                        <span className="text-[9px] text-slate-400">{getCurrentScore(rec) >= 10 ? '大盛產' : '產季中'}</span>
                                    </div>
                                </button>
                            ))}
                            <div className="w-2 shrink-0"></div>
                        </div>
                    </div>
                )}
                
                {/* 🔥 Footer Signature */}
                <div className="mt-5 mb-2 text-center select-text lg:mt-4 lg:mb-0">
                    <div className="inline-flex items-center justify-center gap-2 px-3 py-1.5 rounded-full bg-white/50 border border-slate-100/50 backdrop-blur-sm shadow-sm transition-all duration-300 hover:bg-white hover:shadow-md hover:scale-105 group cursor-default">
                        <span className="text-[10px] font-medium text-slate-400 flex items-center gap-1">Made with <span className="text-[10px] animate-pulse">❤️</span> by <span className="font-black text-slate-600">Mike</span></span>
                        <span className="w-0.5 h-2 bg-slate-300 rounded-full"></span>
                        <a href="mailto:blachorz.m@gmail.com" className="text-[10px] font-bold text-slate-400 hover:text-indigo-600 transition-colors flex items-center gap-1">✉️ <span className="underline decoration-slate-200 underline-offset-2 group-hover:decoration-indigo-200">Contact</span></a>
                    </div>
                </div>

                <div className="h-8 lg:hidden"></div>
            </div>
        </div>
    </div>
  );
}
