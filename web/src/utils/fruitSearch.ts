import { Fruit } from '@/utils/supabase';
import { getNutritionText } from '@/utils/fruitSeo';

export type FruitSearchMatchType = 'none' | 'bad' | 'good' | 'nutri' | 'relief' | 'scenario' | 'guide' | 'trivia';

export type FruitSearchMatch = {
  type: FruitSearchMatchType;
  label: string;
  text: string;
  colorClass: string;
};

export type FruitSearchResult = Fruit & {
  searchScore: number;
  searchMatch: FruitSearchMatch;
};

type SearchField = {
  value?: string | null;
  weight: number;
  match: FruitSearchMatch;
};

const EMPTY_MATCH: FruitSearchMatch = {
  type: 'none',
  label: '',
  text: '',
  colorClass: '',
};

const normalizeText = (value: string) =>
  value
    .normalize('NFKC')
    .toLowerCase()
    .replace(/[，、]/g, ',')
    .replace(/\s+/g, ' ')
    .trim();

export function tokenizeSearchQuery(query: string) {
  const normalized = normalizeText(query);
  if (!normalized) return [];

  return Array.from(new Set(normalized.split(/[\s,]+/).filter(Boolean)));
}

const scoreField = (fieldValue: string, query: string, tokens: string[], weight: number) => {
  const normalizedValue = normalizeText(fieldValue);
  if (!normalizedValue) return 0;

  let score = 0;
  if (normalizedValue === query) score += weight * 4;
  if (normalizedValue.includes(query)) score += weight * 2;

  tokens.forEach((token) => {
    if (normalizedValue === token) score += weight * 2;
    else if (normalizedValue.includes(token)) score += weight;
  });

  return score;
};

const buildSearchFields = (fruit: Fruit): SearchField[] => {
  const p = fruit.properties || {};
  const guideText = [
    fruit.guide?.appearance,
    fruit.guide?.detail,
    fruit.guide?.tactile,
    fruit.guide?.sense,
    fruit.guide?.storage,
  ].filter(Boolean).join(' ');
  const nutrition = getNutritionText(fruit);

  return [
    {
      value: fruit.name,
      weight: 120,
      match: EMPTY_MATCH,
    },
    {
      value: p.name_en,
      weight: 100,
      match: EMPTY_MATCH,
    },
    {
      value: p.keywords,
      weight: 90,
      match: EMPTY_MATCH,
    },
    {
      value: p.relief_symptoms,
      weight: 75,
      match: { type: 'relief', label: '🩺 功效', text: p.relief_symptoms || '', colorClass: 'text-indigo-500 bg-indigo-50' },
    },
    {
      value: p.good_for,
      weight: 70,
      match: { type: 'good', label: '🙆🏻‍♂️ 適宜', text: p.good_for || '', colorClass: 'text-emerald-600 bg-emerald-50' },
    },
    {
      value: p.bad_for,
      weight: 70,
      match: { type: 'bad', label: '🙅🏻‍♀️ 禁忌', text: p.bad_for || '', colorClass: 'text-rose-600 bg-rose-50' },
    },
    {
      value: nutrition,
      weight: 55,
      match: { type: 'nutri', label: '🔥 營養', text: nutrition, colorClass: 'text-orange-500 bg-orange-50' },
    },
    {
      value: p.scenario,
      weight: 45,
      match: { type: 'scenario', label: '🎨 適合', text: p.scenario || '', colorClass: 'text-slate-500 bg-slate-100' },
    },
    {
      value: p.trivia,
      weight: 30,
      match: { type: 'trivia', label: '💡 冷知識', text: p.trivia || '', colorClass: 'text-purple-500 bg-purple-50' },
    },
    {
      value: guideText,
      weight: 25,
      match: { type: 'guide', label: '🔍 挑選', text: guideText, colorClass: 'text-amber-600 bg-amber-50' },
    },
  ];
};

export function searchFruits(fruits: Fruit[], query: string, limit = 20): FruitSearchResult[] {
  const normalizedQuery = normalizeText(query);
  const tokens = tokenizeSearchQuery(query);
  if (!normalizedQuery || tokens.length === 0) return [];

  return fruits
    .map((fruit) => {
      let bestMatch = EMPTY_MATCH;
      let bestMatchScore = 0;
      const totalScore = buildSearchFields(fruit).reduce((score, field) => {
        if (!field.value) return score;
        const fieldScore = scoreField(field.value, normalizedQuery, tokens, field.weight);

        if (fieldScore > bestMatchScore && field.match.type !== 'none') {
          bestMatch = field.match;
          bestMatchScore = fieldScore;
        }

        return score + fieldScore;
      }, 0);

      return {
        ...fruit,
        searchScore: totalScore,
        searchMatch: bestMatch,
      };
    })
    .filter((fruit) => fruit.searchScore > 0)
    .sort((a, b) => {
      if (b.searchScore !== a.searchScore) return b.searchScore - a.searchScore;
      return a.name.localeCompare(b.name, 'zh-Hant');
    })
    .slice(0, limit);
}

export function getHighlightedParts(text: string | undefined, query: string) {
  if (!text) return [];
  const tokens = tokenizeSearchQuery(query)
    .sort((a, b) => b.length - a.length)
    .map((token) => token.replace(/[.*+?^${}()|[\]\\]/g, '\\$&'));

  if (tokens.length === 0) return [{ text, match: false }];

  const regex = new RegExp(`(${tokens.join('|')})`, 'gi');
  const matchRegex = new RegExp(`^(?:${tokens.join('|')})$`, 'i');
  return text.split(regex).filter(Boolean).map((part) => ({
    text: part,
    match: matchRegex.test(part),
  }));
}
