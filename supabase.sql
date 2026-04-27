create table if not exists public.funout_votes (
  id uuid primary key default gen_random_uuid(),
  name text unique not null,
  choice text not null check (choice in ('Balade d’Anton','Char à voile')),
  created_at timestamptz default now()
);
alter table public.funout_votes enable row level security;
create policy "votes readable" on public.funout_votes for select using (true);
create policy "votes insertable" on public.funout_votes for insert with check (true);
create policy "votes updatable by name" on public.funout_votes for update using (true) with check (true);
