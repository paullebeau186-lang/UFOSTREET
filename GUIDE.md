# Guide de mise en ligne — UFOSTREET LEAGUE

Ce guide te fait passer, pas à pas, d'un dossier de fichiers à un **vrai site en ligne** avec une adresse que tu peux partager. Aucune connaissance technique requise : suis les étapes dans l'ordre.

Tu vas créer **3 comptes gratuits** :
1. **GitHub** — le coffre-fort où vit ton code.
2. **Supabase** — la base de données (pour que tout le monde voie les mêmes inscriptions).
3. **Vercel** — ce qui publie le site et te donne le lien.

Compte environ **30 à 45 minutes** la première fois. Ensuite, chaque mise à jour prend 1 minute.

---

## Étape 0 — Ce dont tu as besoin

- Un ordinateur avec un navigateur (Chrome, Edge, Firefox…).
- Une adresse email.
- Le dossier `ufostreet` que je t'ai donné (celui qui contient ce guide).

Tu n'as **rien à installer** sur ton ordinateur.

---

## Étape 1 — Créer un compte GitHub et déposer le code

GitHub va héberger ton code. Vercel ira le lire automatiquement.

1. Va sur **https://github.com** et clique sur **Sign up**. Crée ton compte (email, mot de passe, nom d'utilisateur).
2. Une fois connecté, clique sur le **+** en haut à droite, puis **New repository**.
3. Donne-lui un nom, par exemple `ufostreet`. Laisse tout le reste par défaut. Clique **Create repository**.
4. Sur la page qui s'ouvre, tu vois un lien du type « uploading an existing file ». Clique sur **uploading an existing file**.
5. Ouvre le dossier `ufostreet` sur ton ordinateur. **Sélectionne tous les fichiers et dossiers** qu'il contient (pas le dossier lui-même, mais son contenu : `src`, `package.json`, `index.html`, etc.) et **glisse-les** dans la zone de la page GitHub.
   - ⚠️ Ne mets **pas** de dossier `node_modules` (il n'y en a pas dans ce que je t'ai donné, c'est normal).
6. En bas, clique le bouton vert **Commit changes**.

✅ Ton code est maintenant sur GitHub.

---

## Étape 2 — Créer la base de données (Supabase)

C'est ce qui permet à 400 personnes de voir les mêmes données en même temps.

1. Va sur **https://supabase.com** et clique **Start your project**. Connecte-toi (le plus simple : **Continue with GitHub**, ça réutilise le compte que tu viens de créer).
2. Clique **New project**.
   - **Name** : `ufostreet`
   - **Database Password** : invente un mot de passe et **note-le quelque part** (tu peux ne plus jamais t'en servir, mais garde-le).
   - **Region** : choisis l'Europe (par ex. « West EU (Paris) » ou « Frankfurt »).
   - Clique **Create new project**. Attends ~2 minutes que ça s'installe.
3. Quand c'est prêt, dans le menu de gauche, clique sur **SQL Editor** (icône `</>`), puis **New query**.
4. Ouvre le fichier **`supabase-setup.sql`** (dans le dossier que je t'ai donné), **copie tout son contenu**, colle-le dans la zone, et clique **Run** (ou Ctrl+Entrée).
   - Tu dois voir « Success ». Si oui, la base est prête.
5. Récupère maintenant tes 2 clés. Dans le menu de gauche : **Project Settings** (la roue crantée) → **API**.
   - Copie la **Project URL** (elle ressemble à `https://xxxx.supabase.co`).
   - Copie la clé **anon public** (une longue suite de caractères).
   - Garde ces deux valeurs sous la main pour l'étape suivante.

✅ Ta base de données existe.

---

## Étape 3 — Publier le site (Vercel)

1. Va sur **https://vercel.com** et clique **Sign Up**. Choisis **Continue with GitHub** et autorise Vercel à accéder à GitHub.
2. Sur ton tableau de bord Vercel, clique **Add New…** → **Project**.
3. Tu vois la liste de tes dépôts GitHub. À côté de `ufostreet`, clique **Import**.
4. Avant de déployer, ouvre la section **Environment Variables** et ajoute tes deux clés Supabase :
   - Nom : `VITE_SUPABASE_URL` — Valeur : ta *Project URL* (collée de l'étape 2).
   - Clique **Add**.
   - Nom : `VITE_SUPABASE_ANON_KEY` — Valeur : ta clé *anon public*.
   - Clique **Add**.
   - ⚠️ Écris les noms **exactement** comme ci-dessus (majuscules, tirets bas).
5. Clique **Deploy**. Attends 1 à 2 minutes.
6. Quand c'est fini, Vercel affiche un écran de félicitations avec un aperçu et un bouton **Visit** (ou **Continue to Dashboard**). L'adresse ressemble à `https://ufostreet-xxxx.vercel.app`.

✅ **C'est ton lien public.** Ouvre-le sur ton téléphone : ça marche, et les données sont partagées.

---

## Étape 4 — Vérifier que tout fonctionne

1. Ouvre ton lien.
2. Va dans **Inscription**, crée une équipe test. Note le **code d'équipe** affiché.
3. Ouvre le **même lien sur ton téléphone** (ou dans une autre fenêtre). Va dans **Classement** : l'équipe test doit apparaître (au besoin, patiente ~15 secondes, les données se synchronisent régulièrement).
4. Va dans **Admin** (code PIN par défaut : **1970**). Tu dois voir l'inscription, pouvoir la modifier, la supprimer, ajouter des étapes, saisir des points.

Si l'équipe test apparaît des deux côtés : **tout est bon.** Supprime-la depuis l'Admin avant l'ouverture réelle.

---

## Très important : change le code admin

Le code admin par défaut est **1970**. Change-le avant de diffuser le lien :

1. Sur GitHub, ouvre le dossier `src`, puis le fichier `App.jsx`.
2. Clique le petit **crayon** (Edit) en haut à droite.
3. Tout en haut, trouve la ligne :
   ```
   const ADMIN_PIN = "1970";
   ```
   Remplace `1970` par ton propre code (garde les guillemets), par ex. `"UFO2026"`.
4. En bas, clique **Commit changes**.
5. Vercel redéploie tout seul en ~1 minute. Ton nouveau code est actif.

---

## Comment modifier le site plus tard

Deux cas :

**Usage quotidien** (ajouter des étapes, saisir les points, gérer/supprimer des équipes, exporter l'Excel) : tu fais tout **dans l'espace Admin du site**, sans rien toucher au code.

**Changer le design ou une fonctionnalité** : reviens me voir avec ta demande. Je te donne le nouveau code. Tu le colles dans GitHub (comme pour le code admin ci-dessus, via le crayon **Edit**), tu fais **Commit changes**, et le site se met à jour tout seul. Le lien ne change jamais.

---

## Aide rapide (si quelque chose cloche)

- **Le classement ne se met pas à jour d'un téléphone à l'autre** → attends 15 secondes et recharge la page. Si rien n'apparaît jamais, revérifie que les deux variables Supabase sur Vercel sont bien orthographiées et que le SQL a bien été exécuté (« Success »).
- **Page blanche après déploiement** → presque toujours une variable Supabase manquante ou mal nommée. Va dans Vercel → ton projet → **Settings → Environment Variables**, corrige, puis onglet **Deployments** → clique le dernier → **Redeploy**.
- **Tu as changé une variable** → il faut redéployer pour qu'elle prenne effet (Deployments → dernier → Redeploy).

---

## Un mot sur les coûts

Tout ce qui est décrit ici est **gratuit** pour ton usage (les offres gratuites de GitHub, Supabase et Vercel couvrent très largement un tournoi avec quelques centaines de participants). Aucune carte bancaire n'est nécessaire.
