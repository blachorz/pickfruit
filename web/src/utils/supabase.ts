import { createClient } from '@supabase/supabase-js';

// Define the shape of our Fruit data
export type Fruit = {
  id: string;
  slug: string;
  name: string;
  category: string | null;
  season_curve: number[] | null; // JSONB array [0,0,5,10...]
  tags: string[] | null;
  
  // JSONB Fields - strongly typed for easier usage
  properties: {
    name_en?: string;
    is_premium?: boolean;
    is_common?: boolean;
    tagline?: string;
    color?: string;
    
    // Taste & Specs
    brix?: number;
    calories?: number;
    acidity?: number;
    gi_value?: number;
    moisture?: number;
    aroma?: number;
    texture_desc?: string;
    
    // Basic Info
    origin?: string;
    best_origin?: string;
    keywords?: string;
    price_level?: number;
    
    // Health
    energy_index?: number;
    nutrition_value?: string;
    good_for?: string;
    bad_for?: string;
    safety_warning?: string;
    relief_symptoms?: string;
    relief_mechanism?: string;
    
    // Misc
    skin_edible?: string;
    seed_edible?: string;
    trivia?: string;
    scenario?: string; // Comma separated string or array
    
    [key: string]: any; // Allow other properties
  };
  
  guide: {
    appearance?: string;
    detail?: string; // Added
    tactile?: string;
    sense?: string; // Added (smell)
    storage?: string;
    selection?: string;
    [key: string]: any;
  };

  created_at: string;
};

export type Scenario = {
  id: string;
  slug: string;
  group_name: string;
  name: string;
  description: string | null;
  sort_order: number;
};

export type Symptom = {
  id: string;
  slug: string;
  group_name: string;
  name: string;
  description: string | null;
  sort_order: number;
};

// Database Schema definition for Supabase client
export type Database = {
  public: {
    Tables: {
      fruits: {
        Row: Fruit;
        Insert: Omit<Fruit, 'id' | 'created_at'>;
        Update: Partial<Omit<Fruit, 'id' | 'created_at'>>;
      };
      scenarios: {
        Row: Scenario;
        Insert: Omit<Scenario, 'id'>;
        Update: Partial<Omit<Scenario, 'id'>>;
      };
      symptoms: {
        Row: Symptom;
        Insert: Omit<Symptom, 'id'>;
        Update: Partial<Omit<Symptom, 'id'>>;
      };
      feedback: {
        Row: {
          id: string;
          created_at: string;
          sentiment: string;
          tags: string[] | null;
          comment: string | null;
          url: string | null;
          device: string | null;
        };
        Insert: {
          id?: string;
          created_at?: string;
          sentiment: string;
          tags?: string[] | null;
          comment?: string | null;
          url?: string | null;
          device?: string | null;
        };
        Update: {
          id?: string;
          created_at?: string;
          sentiment?: string;
          tags?: string[] | null;
          comment?: string | null;
          url?: string | null;
          device?: string | null;
        };
      };
    };
  };
};

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!;

export const supabase = createClient<Database>(supabaseUrl, supabaseKey);
