-- ============================================================
--  UFOSTREET LEAGUE — Base de données
--  Copie-colle TOUT ce texte dans Supabase :
--    menu de gauche  >  SQL Editor  >  New query  >  colle  >  Run
-- ============================================================

-- 1) La table qui stocke les données (équipes + étapes)
create table if not exists public.kv (
  key   text primary key,
  value jsonb not null,
  updated_at timestamptz default now()
);

-- 2) On autorise l'app à lire et écrire dans cette table.
--    (Row Level Security activée, avec une politique ouverte :
--     l'accès reste protégé côté application par le code PIN admin.)
alter table public.kv enable row level security;

drop policy if exists "acces public kv" on public.kv;
create policy "acces public kv"
  on public.kv
  for all
  using (true)
  with check (true);

-- ============================================================
--  C'est tout ! Tu peux fermer cet onglet.
-- ============================================================
