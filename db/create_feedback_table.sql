-- Create Feedback Table
create table public.feedback (
  id uuid default gen_random_uuid() primary key,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null,
  sentiment text not null, -- 'positive', 'neutral', 'negative'
  tags text[] default '{}'::text[],
  comment text,
  url text,
  device text
);

-- Enable RLS
alter table public.feedback enable row level security;

-- Create Policy for Public Insert (Anonymous users can submit feedback)
create policy "Allow public insert to feedback"
on public.feedback
for insert
to public
with check (true);

-- Create Policy for Public Read (Optional: if we want to show stats later, but for now maybe restrict?)
-- For now, let's only allow insert. Reading should be done via dashboard or admin API.
