import { createClient } from "@supabase/supabase-js";

// Ces deux valeurs viennent de ton projet Supabase (voir GUIDE.md).
// En local : mets-les dans un fichier .env (copié depuis .env.example).
// Sur Vercel : ajoute-les dans Settings > Environment Variables.
const url = import.meta.env.VITE_SUPABASE_URL;
const key = import.meta.env.VITE_SUPABASE_ANON_KEY;

export const supabase = createClient(url, key);
