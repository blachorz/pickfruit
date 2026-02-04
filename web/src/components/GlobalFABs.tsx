'use client';

import React, { useState } from 'react';
import { MessageCircle, X, CheckCircle2, Loader2 } from 'lucide-react';
import { supabase } from '@/utils/supabase';
import { useSettings } from '@/context/SettingsContext';
import clsx from 'clsx';
import { twMerge } from 'tailwind-merge';

function cn(...inputs: (string | undefined | null | false)[]) {
  return twMerge(clsx(inputs));
}

// Feedback Constants
const FEEDBACK_OPTIONS = [
    { val: 'negative', emoji: '😫', label: '不好用' },
    { val: 'neutral', emoji: '🤔', label: '怪怪的' },
    { val: 'positive', emoji: '😍', label: '好棒' }
];

const FEEDBACK_TAGS_MAP: Record<string, string[]> = {
    negative: ['有 Bug', '卡頓', '介面混亂', '資料錯誤'],
    neutral: ['建議改善', '看不懂', '操作困難', '找不到功能'],
    positive: ['許願新功能', '介面好看', '非常實用', '內容很棒']
};

export default function GlobalFABs() {
  const { largeMode, setLargeMode } = useSettings();
  const [showFeedback, setShowFeedback] = useState(false);
  const [feedbackForm, setFeedbackForm] = useState({ sentiment: '', tags: [] as string[], comment: '' });
  const [isSubmittingFeedback, setIsSubmittingFeedback] = useState(false);
  const [feedbackSent, setFeedbackSent] = useState(false);

  const handleFeedbackSubmit = async () => {
      if (!feedbackForm.sentiment) return;
      setIsSubmittingFeedback(true);
      
      try {
          const { error } = await supabase.from('feedback').insert({
              sentiment: feedbackForm.sentiment,
              tags: feedbackForm.tags,
              comment: feedbackForm.comment,
              url: window.location.href,
              device: navigator.userAgent
          });

          if (error) throw error;

          setFeedbackSent(true);
          setTimeout(() => {
              setShowFeedback(false);
              setFeedbackSent(false);
              setFeedbackForm({ sentiment: '', tags: [], comment: '' });
          }, 2000);
      } catch (err) {
          console.error('Error submitting feedback:', err);
          alert('傳送失敗，請稍後再試');
      } finally {
          setIsSubmittingFeedback(false);
      }
  };

  const toggleFeedbackTag = (tag: string) => {
      setFeedbackForm(prev => {
          const tags = prev.tags.includes(tag) 
              ? prev.tags.filter(t => t !== tag)
              : [...prev.tags, tag];
          return { ...prev, tags };
      });
  };

  return (
    <>
        {/* Floating Actions */}
        <div className="fixed bottom-5 left-0 right-0 z-[70] w-full flex justify-end px-5 lg:px-4 lg:max-w-6xl lg:mx-auto pointer-events-none">
            <div className="pointer-events-auto flex flex-col items-center gap-3">
                {/* Large Mode Button */}
                <button 
                    onClick={() => setLargeMode(!largeMode)}
                    className={cn(
                        "group relative w-10 h-10 rounded-full shadow-lg shadow-slate-300/50 border flex items-center justify-center transition-all duration-300 active:scale-90 hover:-translate-y-1",
                        largeMode ? "bg-indigo-600 border-indigo-500 text-white" : "bg-white/90 backdrop-blur-md border-white/50 text-slate-600 hover:shadow-indigo-200"
                    )}
                >
                    <div className="flex items-end gap-[1px] relative select-none">
                        <span className={cn("font-bold leading-none mb-[3px] transition-all", largeMode ? "text-[9px] opacity-80" : "text-[10px]")}>A</span>
                        <span className={cn("font-black leading-none transition-all", largeMode ? "text-lg" : "text-base")}>A</span>
                        {largeMode && (
                            <div className="absolute -top-1.5 -right-1.5 w-1.5 h-1.5 rounded-full bg-rose-500 border border-white shadow-sm animate-in zoom-in duration-200"></div>
                        )}
                    </div>
                </button>

                {/* Feedback Button */}
                <button 
                    onClick={() => setShowFeedback(true)}
                    className="w-10 h-10 rounded-full bg-slate-800 text-white shadow-lg shadow-slate-400/40 flex items-center justify-center hover:bg-slate-700 active:scale-90 hover:-translate-y-1 transition-all duration-300 group"
                >
                    <MessageCircle className="w-5 h-5 group-hover:scale-110 group-hover:-rotate-12 transition-transform duration-300" />
                </button>
            </div>
        </div>

        {/* Feedback Modal */}
        {showFeedback && (
            <div className="fixed inset-0 z-[100] flex items-end sm:items-center justify-center p-4 cursor-default animate-in fade-in duration-200">
               <div className="absolute inset-0 bg-slate-900/40 backdrop-blur-sm transition-opacity" onClick={() => setShowFeedback(false)}></div>
               <div className="bg-white w-full max-w-sm rounded-3xl shadow-2xl p-6 relative flex flex-col gap-4 animate-in slide-in-from-bottom-10 sm:zoom-in-95 duration-300 pointer-events-auto">
                  <button onClick={() => setShowFeedback(false)} className="absolute top-4 right-4 text-slate-300 hover:text-slate-500 p-1 transition-colors"><X className="w-5 h-5" /></button>
                  
                  {feedbackSent ? (
                      <div className="py-8 text-center flex flex-col items-center justify-center animate-in zoom-in duration-300">
                          <div className="w-16 h-16 bg-green-100 text-green-500 rounded-full flex items-center justify-center mb-4 text-3xl animate-bounce">
                              <CheckCircle2 className="w-8 h-8" />
                          </div>
                          <h3 className="text-xl font-black text-slate-800">收到囉！</h3>
                          <p className="text-sm text-slate-500 mt-1">感謝你的建議，我們會繼續努力！</p>
                      </div>
                  ) : (
                      <>
                        <div className="text-center">
                            <h3 className="text-xl font-black text-slate-800">覺得這個網站如何？</h3>
                            <p className="text-xs text-slate-400 mt-1">很開心你願意和 Mike 分享你的想法，謝謝你 ❤️</p>
                        </div>

                        {/* Sentiment Selection */}
                        <div className="flex justify-center gap-4 py-2">
                            {FEEDBACK_OPTIONS.map(opt => (
                                <button
                                    key={opt.val}
                                    onClick={() => setFeedbackForm(prev => ({ ...prev, sentiment: opt.val, tags: [] }))}
                                    className={cn(
                                        "flex flex-col items-center gap-1 p-3 rounded-2xl border-2 transition-all w-20",
                                        feedbackForm.sentiment === opt.val 
                                            ? "border-indigo-500 bg-indigo-50 scale-110 shadow-md" 
                                            : "border-slate-100 bg-white hover:border-indigo-200 hover:bg-slate-50 grayscale hover:grayscale-0"
                                    )}
                                >
                                    <span className="text-2xl">{opt.emoji}</span>
                                    <span className={cn("text-xs font-bold", feedbackForm.sentiment === opt.val ? "text-indigo-600" : "text-slate-400")}>{opt.label}</span>
                                </button>
                            ))}
                        </div>

                        {/* Expanded Content (Tags + Form) */}
                        <div className={cn(
                            "transition-all duration-500 ease-in-out overflow-hidden space-y-4",
                            feedbackForm.sentiment ? "max-h-[500px] opacity-100" : "max-h-0 opacity-0"
                        )}>
                            {/* Tags Selection */}
                            <div className="flex flex-wrap justify-center gap-2">
                                {(FEEDBACK_TAGS_MAP[feedbackForm.sentiment] || []).map(tag => (
                                    <button
                                        key={tag}
                                        onClick={() => toggleFeedbackTag(tag)}
                                        className={cn(
                                            "px-3 py-1.5 rounded-full text-xs font-bold border transition-all active:scale-95",
                                            feedbackForm.tags.includes(tag)
                                                ? "bg-slate-800 text-white border-slate-800 shadow-md"
                                                : "bg-white text-slate-500 border-slate-200 hover:border-indigo-300 hover:text-indigo-600"
                                        )}
                                    >
                                        {tag}
                                    </button>
                                ))}
                            </div>

                            {/* Comment & Submit */}
                            <div className="space-y-3">
                                <textarea
                                    value={feedbackForm.comment}
                                    onChange={e => setFeedbackForm(prev => ({ ...prev, comment: e.target.value }))}
                                    placeholder="還有什麼想跟我們說的嗎？..."
                                    className="w-full h-20 p-3 rounded-xl bg-slate-50 border border-slate-200 text-sm focus:outline-none focus:ring-2 focus:ring-indigo-500/20 focus:border-indigo-500 resize-none placeholder:text-slate-400"
                                ></textarea>
                                
                                <button
                                    onClick={handleFeedbackSubmit}
                                    disabled={isSubmittingFeedback}
                                    className="w-full py-3 rounded-xl bg-indigo-600 text-white font-bold shadow-lg shadow-indigo-200 hover:bg-indigo-700 active:scale-95 transition-all disabled:opacity-70 disabled:cursor-not-allowed flex items-center justify-center gap-2"
                                >
                                    {isSubmittingFeedback ? (
                                        <>
                                            <Loader2 className="w-4 h-4 animate-spin" />
                                            傳送中...
                                        </>
                                    ) : (
                                        '送出回饋'
                                    )}
                                </button>
                            </div>
                        </div>
                      </>
                  )}
               </div>
            </div>
        )}
    </>
  );
}
