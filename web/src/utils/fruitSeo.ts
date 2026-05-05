import { Fruit } from '@/utils/supabase';

export const SITE_NAME = '水果呷對時';
export const PRODUCTION_SITE_URL = 'https://pickfruit.app';
export const SITE_AUTHOR = 'Mike';
export const SITE_TITLE = `${SITE_NAME}｜台灣水果產季、甜度與食養指南`;
export const SITE_DESCRIPTION = '查詢台灣水果產季、甜度、GI 值、寒熱屬性與挑選建議，依月份找到現在最適合吃的水果。';
export const SITE_KEYWORDS = [
  '水果呷對時',
  '台灣水果',
  '水果產季',
  '當季水果',
  '水果甜度',
  '水果GI值',
  '水果熱量',
  '水果挑選',
  '水果保存',
  '食養水果',
];

type FaqItem = {
  question: string;
  answer: string;
};

const hasValue = (value: unknown) => value !== undefined && value !== null && value !== '';

const compact = <T,>(items: Array<T | undefined | null | false>) =>
  items.filter(Boolean) as T[];

export function getSiteUrl() {
  const explicitUrl = process.env.NEXT_PUBLIC_SITE_URL;
  const isProduction = process.env.NODE_ENV === 'production' || process.env.VERCEL_ENV === 'production';
  const vercelUrl = !isProduction && process.env.VERCEL_URL ? `https://${process.env.VERCEL_URL}` : undefined;
  const fallbackUrl = isProduction ? PRODUCTION_SITE_URL : 'http://localhost:3000';

  return (explicitUrl || vercelUrl || fallbackUrl).replace(/\/$/, '');
}

export function getCanonicalUrl(path = '/') {
  if (/^https?:\/\//.test(path)) {
    return path.replace(/\/$/, '');
  }

  const normalizedPath = path.startsWith('/') ? path : `/${path}`;
  return `${getSiteUrl()}${normalizedPath}`;
}

export function getFruitPath(fruit: Pick<Fruit, 'id' | 'slug'>) {
  return `/fruit/${fruit.slug || fruit.id}`;
}

export function getFruitUrl(fruit: Pick<Fruit, 'id' | 'slug'>) {
  return getCanonicalUrl(getFruitPath(fruit));
}

export function getEnergyText(value: number | undefined) {
  const labels: Record<string, string> = {
    '-2': '偏寒',
    '-1': '涼性',
    '0': '平性',
    '1': '溫性',
    '2': '偏燥熱',
  };

  return labels[String(value ?? 0)] || '平性';
}

export function getNutritionText(fruit: Fruit) {
  return fruit.properties?.nutritional_value || fruit.properties?.nutrition_value || fruit.properties?.nutritionalValue || '';
}

export function getFruitDescription(fruit: Fruit) {
  const p = fruit.properties || {};
  const energy = getEnergyText(p.energy_index);
  const brix = hasValue(p.brix) ? `糖度約 ${p.brix} 度` : '提供產季與挑選資訊';
  const gi = hasValue(p.gi_value) ? `GI 值約 ${p.gi_value}` : '並整理食用建議';

  return `${fruit.name}完整指南：${brix}，${gi}，中醫食養屬性為${energy}。查看產季、挑選技巧、保存方式、適合體質與食用禁忌。`;
}

export function getFruitKeywords(fruit: Fruit) {
  const p = fruit.properties || {};
  const keywords = String(p.keywords || '')
    .split(/[,，、]/)
    .map((item) => item.trim())
    .filter(Boolean);

  return Array.from(new Set(compact([
    fruit.name,
    p.name_en,
    `${fruit.name}產季`,
    `${fruit.name}挑選`,
    `${fruit.name}保存`,
    `${fruit.name}含糖量`,
    `${fruit.name}GI值`,
    `${fruit.name}熱量`,
    `${fruit.name}中醫`,
    `${getEnergyText(p.energy_index)}水果`,
    ...keywords,
  ])));
}

export function getFruitFaqs(fruit: Fruit): FaqItem[] {
  const p = fruit.properties || {};
  const energy = getEnergyText(p.energy_index);
  const brixText = hasValue(p.brix) ? `${fruit.name}糖度約 ${p.brix} 度` : `${fruit.name}的糖度資料仍在整理中`;
  const giText = hasValue(p.gi_value) ? `GI 值約 ${p.gi_value}` : 'GI 值資料仍在整理中';

  return [
    {
      question: `糖尿病可以吃${fruit.name}嗎？`,
      answer: `${brixText}，${giText}。若正在控糖，建議依個人血糖狀況少量食用，並優先參考醫師或營養師建議。`,
    },
    {
      question: `${fruit.name}是寒性還是熱性水果？`,
      answer: `從食養角度整理，${fruit.name}屬於「${energy}」水果。若您對寒涼或燥熱食物較敏感，建議搭配自身體質調整份量。`,
    },
    {
      question: `${fruit.name}怎麼挑選？`,
      answer: compact([
        fruit.guide?.appearance,
        fruit.guide?.detail,
        fruit.guide?.tactile,
        fruit.guide?.sense,
      ]).join('；') || `挑選${fruit.name}時可觀察外觀、觸感與香氣，並避開明顯受損或過熟的果實。`,
    },
    {
      question: `${fruit.name}適合哪些人或症狀？`,
      answer: compact([
        p.good_for ? `適合：${p.good_for}` : undefined,
        p.relief_symptoms ? `常見對應症狀：${p.relief_symptoms}` : undefined,
        p.bad_for ? `需留意：${p.bad_for}` : undefined,
      ]).join('。') || `${fruit.name}可作為日常水果選項，仍建議依個人體質與飲食需求適量食用。`,
    },
  ];
}

export function buildFruitJsonLd(fruit: Fruit) {
  const p = fruit.properties || {};
  const additionalProperty = compact([
    hasValue(p.brix) && { '@type': 'PropertyValue', name: '糖度', value: p.brix, unitText: 'Brix' },
    hasValue(p.gi_value) && { '@type': 'PropertyValue', name: 'GI值', value: p.gi_value },
    hasValue(p.energy_index) && { '@type': 'PropertyValue', name: '中醫食養屬性', value: getEnergyText(p.energy_index) },
    hasValue(p.moisture) && { '@type': 'PropertyValue', name: '水分', value: p.moisture },
    hasValue(p.acidity) && { '@type': 'PropertyValue', name: '酸度', value: p.acidity },
    hasValue(p.aroma) && { '@type': 'PropertyValue', name: '香氣', value: p.aroma },
  ]);

  return {
    '@context': 'https://schema.org',
    '@type': 'Food',
    '@id': `${getFruitUrl(fruit)}#food`,
    name: fruit.name,
    alternateName: compact([p.name_en, p.keywords]).join(', ') || undefined,
    description: getFruitDescription(fruit),
    url: getFruitUrl(fruit),
    category: fruit.category || undefined,
    nutrition: {
      '@type': 'NutritionInformation',
      calories: hasValue(p.calories) ? `${p.calories} kcal per 100 g` : undefined,
    },
    additionalProperty,
  };
}

export function buildFruitFaqJsonLd(fruit: Fruit) {
  return {
    '@context': 'https://schema.org',
    '@type': 'FAQPage',
    mainEntity: getFruitFaqs(fruit).map((faq) => ({
      '@type': 'Question',
      name: faq.question,
      acceptedAnswer: {
        '@type': 'Answer',
        text: faq.answer,
      },
    })),
  };
}

export function serializeJsonLd(data: unknown) {
  return JSON.stringify(data).replace(/</g, '\\u003c');
}
