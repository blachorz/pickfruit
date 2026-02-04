-- Enable the UUID extension if not already enabled
create extension if not exists "pgcrypto";

-- 🔥 Drop existing table to ensure clean state
drop table if exists fruits cascade;

-- Create the fruits table
create table fruits (
  id uuid default gen_random_uuid() primary key,
  slug text unique not null,
  name text not null,
  category text,
  
  -- Season curve data: Array of numbers [0, 0, 5, 10, ...]
  season_curve jsonb default '[]'::jsonb,
  
  -- Properties: brix, calories, acidity, nutritional values, etc.
  properties jsonb default '{}'::jsonb,
  
  -- Guide: appearance, tactile, storage, etc.
  guide jsonb default '{}'::jsonb,
  
  -- Tags/Keywords for search
  tags text[] default array[]::text[],
  
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

-- Create an index on the slug for fast lookups
create index if not exists fruits_slug_idx on fruits (slug);

-- Create a GIN index on properties for faster JSONB querying
create index if not exists fruits_properties_idx on fruits using gin (properties);
