import Link from 'next/link';
import { Fruit } from '@/utils/supabase';
import { Card, CardContent, CardFooter, CardHeader, CardTitle } from '@/components/ui/card';
import { Badge } from '@/components/ui/badge';
import { Button } from '@/components/ui/button';
import { ArrowRight, Leaf, Star } from 'lucide-react';

interface FruitCardProps {
  fruit: Fruit;
}

export function FruitCard({ fruit }: FruitCardProps) {
  // Safe access to properties
  const isPremium = fruit.properties?.is_premium;
  const color = fruit.properties?.color || '#e2e8f0';
  const tagline = fruit.properties?.tagline;

  return (
    <Card className="overflow-hidden hover:shadow-lg transition-shadow duration-300 flex flex-col h-full border-t-4" style={{ borderTopColor: color }}>
      <CardHeader className="pb-2">
        <div className="flex justify-between items-start">
          <Badge variant="outline" className="mb-2 bg-slate-50">
            {fruit.category || '水果'}
          </Badge>
          {isPremium && (
            <Badge variant="secondary" className="bg-yellow-100 text-yellow-800 hover:bg-yellow-200">
              <Star className="w-3 h-3 mr-1 fill-yellow-500 text-yellow-500" />
              精選
            </Badge>
          )}
        </div>
        <CardTitle className="text-2xl font-bold flex items-center gap-2">
          {fruit.name}
        </CardTitle>
        {fruit.properties?.name_en && (
          <p className="text-sm text-muted-foreground">{fruit.properties.name_en}</p>
        )}
      </CardHeader>
      
      <CardContent className="flex-grow">
        {tagline ? (
          <p className="text-slate-600 mb-4">{tagline}</p>
        ) : (
          <p className="text-slate-400 italic text-sm">暫無描述</p>
        )}
        
        {/* Simple Nutrition Tags */}
        <div className="flex flex-wrap gap-2 mt-2">
          {fruit.properties?.calories && fruit.properties.calories > 0 && (
             <span className="text-xs bg-slate-100 px-2 py-1 rounded text-slate-600">
               🔥 {fruit.properties.calories} kcal
             </span>
          )}
           {fruit.properties?.brix && fruit.properties.brix > 0 && (
             <span className="text-xs bg-slate-100 px-2 py-1 rounded text-slate-600">
               🍬 甜度 {fruit.properties.brix}
             </span>
          )}
        </div>
      </CardContent>

      <CardFooter className="pt-2">
        <Button asChild className="w-full group">
          <Link href={`/fruit/${fruit.slug}`}>
            查看詳情
            <ArrowRight className="w-4 h-4 ml-2 group-hover:translate-x-1 transition-transform" />
          </Link>
        </Button>
      </CardFooter>
    </Card>
  );
}
