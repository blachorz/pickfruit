import type { MetadataRoute } from 'next';
import { getFruitPath, getSiteUrl } from '@/utils/fruitSeo';
import { supabase } from '@/utils/supabase';

export const revalidate = 86400;

export default async function sitemap(): Promise<MetadataRoute.Sitemap> {
  const siteUrl = getSiteUrl();
  const now = new Date();
  const { data: fruits } = await supabase
    .from('fruits')
    .select('id, slug, created_at')
    .order('name', { ascending: true });

  const staticRoutes: MetadataRoute.Sitemap = [
    {
      url: siteUrl,
      lastModified: now,
      changeFrequency: 'daily',
      priority: 1,
    },
    {
      url: `${siteUrl}/guide`,
      lastModified: now,
      changeFrequency: 'weekly',
      priority: 0.8,
    },
  ];

  const fruitRoutes: MetadataRoute.Sitemap = (fruits || []).map((fruit) => ({
    url: `${siteUrl}${getFruitPath(fruit)}`,
    lastModified: fruit.created_at ? new Date(fruit.created_at) : now,
    changeFrequency: 'weekly',
    priority: 0.7,
  }));

  return [...staticRoutes, ...fruitRoutes];
}
