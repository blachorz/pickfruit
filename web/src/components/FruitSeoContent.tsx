import { Fruit } from '@/utils/supabase';
import { getEnergyText, getFruitFaqs, getNutritionText } from '@/utils/fruitSeo';

interface FruitSeoContentProps {
  fruit: Fruit;
}

const joinParts = (parts: Array<string | undefined | null>) =>
  parts
    .map((part) => part?.trim())
    .filter(Boolean)
    .join('；');

export default function FruitSeoContent({ fruit }: FruitSeoContentProps) {
  const p = fruit.properties || {};
  const nutritionText = getNutritionText(fruit);
  const energyText = getEnergyText(p.energy_index);
  const faqs = getFruitFaqs(fruit);
  const guideSummary = joinParts([
    fruit.guide?.appearance,
    fruit.guide?.detail,
    fruit.guide?.tactile,
    fruit.guide?.sense,
  ]);

  return (
    <section className="bg-slate-50 px-6 pb-16 pt-4 text-slate-700 lg:pt-2">
      <div className="mx-auto w-full max-w-5xl space-y-6 rounded-3xl border border-slate-100 bg-white p-5 shadow-sm lg:p-8">
        <div>
          <p className="text-[10px] font-black uppercase tracking-[0.24em] text-indigo-400">Fruit Knowledge Base</p>
          <h2 className="mt-2 text-xl font-black tracking-tight text-slate-900">
            {fruit.name}的營養、體質與挑選重點
          </h2>
          <p className="mt-3 text-sm font-medium leading-7 text-slate-600">
            {fruit.name}
            {p.brix ? `糖度約 ${p.brix} 度` : '提供糖度與風味資訊'}
            {p.gi_value ? `，GI 值約 ${p.gi_value}` : ''}
            {p.calories ? `，每 100 克熱量約 ${p.calories} kcal` : ''}
            ，食養屬性整理為{energyText}。這些資料可協助判斷當季是否適合購買、如何挑選，以及是否符合個人體質需求。
          </p>
        </div>

        <div className="grid gap-3 md:grid-cols-3">
          <article className="rounded-2xl bg-slate-50 p-4">
            <h3 className="text-xs font-black text-slate-900">健康洞察</h3>
            <p className="mt-2 text-xs font-medium leading-6 text-slate-600">
              {nutritionText || `${fruit.name}的營養資訊仍在整理中，可先參考糖度、GI、熱量與體質屬性。`}
            </p>
          </article>
          <article className="rounded-2xl bg-slate-50 p-4">
            <h3 className="text-xs font-black text-slate-900">挑選摘要</h3>
            <p className="mt-2 text-xs font-medium leading-6 text-slate-600">
              {guideSummary || `挑選${fruit.name}時可觀察外觀、觸感與氣味，並避開明顯受損或過熟的果實。`}
            </p>
          </article>
          <article className="rounded-2xl bg-slate-50 p-4">
            <h3 className="text-xs font-black text-slate-900">適合與禁忌</h3>
            <p className="mt-2 text-xs font-medium leading-6 text-slate-600">
              {joinParts([p.good_for && `適合：${p.good_for}`, p.bad_for && `留意：${p.bad_for}`]) ||
                `${fruit.name}可作為日常水果選項，仍建議依個人體質與飲食需求適量食用。`}
            </p>
          </article>
        </div>

        <div>
          <h3 className="text-sm font-black text-slate-900">常見問題</h3>
          <div className="mt-3 space-y-3">
            {faqs.map((faq) => (
              <details key={faq.question} className="rounded-2xl border border-slate-100 bg-white p-4 shadow-sm">
                <summary className="cursor-pointer text-sm font-bold text-slate-800">{faq.question}</summary>
                <p className="mt-2 text-xs font-medium leading-6 text-slate-600">{faq.answer}</p>
              </details>
            ))}
          </div>
        </div>
      </div>
    </section>
  );
}
