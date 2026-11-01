# Contrat d'API pour l'application mobile Flutter (API-000)

Ce document est LA référence que le mobile Flutter implémente. Il remplace l'ancienne version de `docs/integration-mobile.md` (auteur inconnu), dont seuls les éléments conformes au « Journal des décisions » de `docs/01-architecture.md` ont été conservés. Il est rédigé à partir du cahier des charges v2.0 (CDC), de `docs/01-architecture.md`, `docs/02-tasks.md`, `docs/03-database-conceptual.md`, `docs/03-ux-flows.md`, `docs/suivi-implementation.md` et du code existant (`ApiExceptionRenderer`, `lang/fr/errors.php`, `config/jwt.php`, modèles, migrations, seeders).

Légende utilisée partout :

- **[Livré BE-00x]** : la route est codée et testée ; le contrat est constaté dans le code.
- **[À implémenter BE-00x]** : la route n'est pas encore codée ; le contrat est cible.
- **[Proposition]** : choix fait par ce document pour combler un point que le CDC et le Journal des décisions ne tranchent pas. À confirmer (voir annexe B).
- **[Décidé]** : tranché par le CDC ou par le Journal des décisions (`docs/01-architecture.md`).

---

## 1. Statut du document, public visé, base

### 1.1 Statut

- Version : 1.1 du 2026-10-16 (API-000, mise à jour après BE-007, BE-008 et BE-011). Statut : **toutes les routes mobiles sont livrées** (33 routes, BE-003 à BE-008) ; le Backoffice (BE-009) est un panneau web `/admin` sans route d'API pour le mobile ; les looks publiés depuis ce panneau apparaissent dans `/outfits`.
- Public : développeur Flutter (et relecteurs produit). Le backend (Laravel 13, PHP 8.3, PostgreSQL) est codé en parallèle à partir de ce contrat.
- Base de toutes les routes : `https://<domaine>/api/v1`. Les chemins ci-dessous sont relatifs à ce préfixe.
- **Le schéma OpenAPI 3.1 (tâche BE-011) fait foi en cas de divergence** avec ce document : source `docs/api/openapi.yaml`, version générée `docs/api/openapi.json` (importable dans Postman, Insomnia ou un générateur de client Dart). Un test vérifie qu'il décrit exactement les routes enregistrées. En local et en recette, il est consultable et testable (Swagger UI, bouton « Try it out », bouton « Authorize » pour le Bearer) sur `<APP_URL>/docs`, et téléchargeable sur `<APP_URL>/docs/openapi.json` ; en production ces pages sont désactivées sauf `API_DOCS_ENABLED=true`. Ce document reste le guide des comportements attendus du mobile (refresh, synchronisation, cache, conduites d'erreur).
- Les exemples JSON sont complets et plausibles, mais les valeurs (textes, scores, UUID de looks) sont illustratives. Les noms de champs et la structure sont le contrat visé.

### 1.2 Avancement des routes

| Tâche | Module | Routes concernées | Statut |
| --- | --- | --- | --- |
| BE-003 | Identity | `/auth/*`, `/me` (GET, PATCH, DELETE), `/me/password` | livré |
| BE-004 | Catalog | `/clothing-categories`, `/clothing-types`, `/colors`, `/styles`, `/occasions` | livré |
| BE-005 | Looks | `/outfits`, `/outfits/{id}` | livré |
| BE-006 | Recommendation | `/catalog/version` (décision A-7), `/color-guide` (propriétaire Recommendation, lit le référentiel de Catalog par contrat et ses propres règles de couleur), `/recommendations/from-item`, `/evaluate-outfit`, `/improve-outfit` | livré |
| BE-007 | Wardrobe | `/me/favorites*`, `/me/preferences`, `/me/saved-outfits*`, `/me/sync` | livré |
| BE-008 | Insights | `/recommendations/{request_id}/feedback` | livré |
| BE-009 | Backoffice | panneau Filament `/admin` | livré, **non exposé au mobile** (annexe A) |
| BE-010 | Looks | stockage des images : MinIO (bucket `hery-document`) et forme des URL livrés ; téléversement avec le Backoffice | en partie livré |
| BE-011 | Documentation | schéma OpenAPI `docs/api/openapi.yaml` (33 routes) | livré |

Données disponibles aujourd'hui : migrations et seeders du référentiel (DB-002, DB-003). Les UUID du référentiel public cités dans ce document sont réels et figés (annexe D).

### 1.3 Ajouts au CDC §10

Le CDC §10 liste 29 routes. Le Journal des décisions y ajoute : `POST /auth/refresh`, `POST /auth/password/forgot`, `POST /auth/password/reset` (réinitialisation par OTP e-mail), `PATCH /me`, `PUT /me/password` et `GET /me/sync`. Elles sont **[Décidé]** et incluses ici. Aucune autre route n'est ajoutée par ce document.

---

## 2. Conventions globales

### 2.1 En-têtes

| En-tête | Valeur | Remarque |
| --- | --- | --- |
| `Authorization` | `Bearer <access_token>` | Routes authentifiées uniquement. Voir §3 pour la gestion de l'expiration. |
| `Accept` | `application/json` | Toujours envoyé. L'API renvoie du JSON même sans cet en-tête sous `/api/*`, mais ne pas s'y fier. |
| `Accept-Language` | `fr` | Messages d'erreur et textes serveur en français. Seul le français est supporté au lancement ; toute autre valeur donne du français. |
| `Content-Type` | `application/json` | Pour les requêtes avec corps (POST, PUT, PATCH, DELETE avec corps). Encodage UTF-8. |
| `If-None-Match` | valeur d'un `ETag` reçu | Sur les routes publiques du catalogue (§2.8). |

Les réponses portent `Content-Type: application/json; charset=utf-8`, sauf `204` et `304` (sans corps).

### 2.2 Format des données

- JSON UTF-8, clés en `snake_case`.
- **Dates** : ISO 8601 en UTC avec le suffixe `Z`, par exemple `"2026-10-13T09:30:00Z"`. Les valeurs de synchronisation (`updated_at` des favoris et compositions) portent des **microsecondes** (`"2026-10-13T09:30:00.123456Z"`) ; les parser comme des instants, sans les tronquer pour comparer.
- Le mobile **ne doit jamais envoyer l'horloge du téléphone** comme donnée de synchronisation (§6).
- **Champs inconnus** : le mobile ignore tout champ de réponse qu'il ne connaît pas (le contrat peut s'enrichir sans changer de version).
- **Booléens** en `true`/`false`, **entiers** en nombres JSON (jamais en chaînes). Valeurs absentes : `null` explicite (la clé est présente). **Exception** : la clé peut être absente (et non `null`) pour `improvements[].change.item` lorsque `change.action` vaut `remove_item`, et pour `style`, `occasion` et `image` du snapshot d'une composition personnalisée ; le mobile traite une clé absente comme `null` dans ces seuls cas.

### 2.3 Identifiants **[Décidé]**

- Tout `id` et tout champ `*_id` est un **UUID en chaîne**, en minuscules (`"0197b2c4-7d1e-7a3b-9f10-2c8e5a4d6b11"`). Aucun entier n'est jamais exposé ; les entiers du CDC §10 sont des illustrations.
- `id` = `public_uuid` de la ressource. Pour le référentiel public (catégories, types, couleurs, styles, occasions), les looks éditoriaux seedés et leurs images (`outfit_images`, clé `outfit_images:<slug>`), c'est un **UUID v5 déterministe**, identique dans tous les environnements (§8.3). Pour le reste (utilisateurs, looks et images créés en administration) c'est un UUID v7.
- **Exception Wardrobe** : les favoris et compositions sauvegardées n'ont pas de `public_uuid`. Ils sont adressés par le **`client_uuid` généré par le mobile**, dans le périmètre du compte connecté. Dans les corps de requête le champ s'appelle `client_uuid` ; dans les réponses, le champ JSON **`id` vaut `client_uuid`**. Aucune autre clé n'est exposée.
- Les **slugs** (`occasion_slug`, `style_slug`, `slug` des référentiels) restent des champs distincts : minuscules ASCII, chiffres et tirets.
- UUID mal formé dans un **chemin** : `404 NOT_FOUND`. UUID mal formé ou inconnu dans un **corps ou une query** : `422 VALIDATION_ERROR` sur le champ concerné.
- `client_uuid` : tout UUID valide (v4 ou v7 recommandé), généré une fois par ressource et conservé à vie par le mobile.

### 2.4 Enveloppe de succès

- Ressource ou résultat unique : `{ "data": { ... } }`.
- Liste de référence non paginée : `{ "data": [ ... ] }`.
- Liste paginée : `{ "data": [ ... ], "links": { ... }, "meta": { ... } }` (§2.5).
- `204 No Content` : aucun corps.
- Les routes qui n'ont rien à renvoyer d'autre qu'un message (`password/forgot`, `password/reset`) répondent `{ "data": { "message": "..." } }`.

### 2.5 Pagination

Paramètres de query : `page` (entier >= 1, défaut 1) et `per_page` (entier de 1 à 50, défaut 20). Une valeur hors bornes donne `422 VALIDATION_ERROR` **[Proposition]**.

Format produit par la pagination standard de Laravel (exact) :

```json
{
  "data": [ ],
  "links": {
    "first": "https://api.example.com/api/v1/outfits?page=1",
    "last": "https://api.example.com/api/v1/outfits?page=3",
    "prev": null,
    "next": "https://api.example.com/api/v1/outfits?page=2"
  },
  "meta": {
    "current_page": 1,
    "from": 1,
    "last_page": 3,
    "path": "https://api.example.com/api/v1/outfits",
    "per_page": 20,
    "to": 20,
    "total": 47
  }
}
```

- Champs sur lesquels le mobile peut compter : `links.first`, `links.last`, `links.prev`, `links.next` (`null` s'il n'y a pas de page), `meta.current_page`, `meta.per_page`, `meta.total`, `meta.last_page`.
- Laravel ajoute aussi `meta.from`, `meta.to`, `meta.path` et `meta.links` (liste de liens de pagination pour le web) : à ignorer.
- Une page au-delà de `last_page` renvoie `200` avec `data: []`.
- Les listes de référence du catalogue (`/clothing-categories`, `/clothing-types`, `/colors`, `/styles`, `/occasions`) ne sont **pas paginées** [Décidé]. `/me/sync` utilise un curseur, pas `page` (§6).

### 2.6 Idempotence

- `POST /me/favorites` et `POST /me/saved-outfits` sont **idempotents sur `(user, client_uuid)`** [Décidé] : rejouer la même requête ne crée jamais de doublon (réponse `200` avec la ressource existante). Voir §4.6, §4.8 et §6 pour les cas particuliers (restauration, règle A-37).
- `DELETE` des favoris et compositions est idempotent (§4.6 et §4.8).
- Les autres `POST` (recommandations, inscription, etc.) ne sont **pas** idempotents ; ne pas les rejouer automatiquement après un délai ambigu sans nécessité. Le feedback est idempotent sur `(user, request_id, outfit)` (§4.5).
- `GET` et `PUT` sont sans effet de bord supplémentaire en cas de rejeu.

### 2.7 Limitation de débit (rate limiting) **[Proposition]**

Les groupes sont décidés (limitation nommée par groupe) ; **les valeurs sont proposées et à confirmer** :

| Groupe | Routes | Limite proposée | Clé |
| --- | --- | --- | --- |
| `auth` | `register`, `login`, `password/forgot`, `password/reset` | 5 requêtes / minute | IP seule, et paire e-mail + IP (e-mail normalisé en minuscules, clé hachée côté serveur) ; jamais par e-mail seul (un tiers ne peut pas bloquer le propriétaire d'un compte depuis une autre IP) |
| `auth-session` | `refresh`, `logout` | 30 requêtes / minute | IP |
| `recommendations` | `from-item`, `evaluate-outfit`, `improve-outfit` | 30 requêtes / minute, et au plus 120 / minute par IP tous comptes confondus | utilisateur si authentifié, sinon IP ; plafond par IP en plus |
| `feedback` | `POST /recommendations/{request_id}/feedback` | 10 requêtes / minute et 100 / jour par compte, 120 / minute par IP | utilisateur (route authentifiée) ; plafond par IP en plus |
| `public` | catalogue, looks, `/catalog/version`, `/color-guide` | 120 requêtes / minute | IP |
| `private` | `/me/*` et `/me/sync` | 120 requêtes / minute | utilisateur |

`PUT /me/password` et `DELETE /me` (qui vérifient le mot de passe actuel) sont soumis à une limite **plus stricte** que le groupe `private` : **5 requêtes / minute par utilisateur** **[Proposition]**.

Compteurs complémentaires sur l'e-mail seul, sans effet sur les requêtes valides **[Proposition, BE-003b]** :

- `login` : 20 échecs d'authentification par heure et par e-mail (toutes IP confondues) ; au-delà, `429` (même avec le bon mot de passe) jusqu'à la fin de la fenêtre. Les connexions réussies et les requêtes invalides (`422`) ne comptent pas.
- `password/reset` : 10 codes refusés par heure et par e-mail, cumulés même si un nouveau code est demandé entre-temps ; au-delà, `429` avec `Retry-After`, même avec le bon code.
- `password/forgot` : 1 envoi par minute et 5 par heure et par e-mail ; au-delà, la réponse reste un `202` au corps identique, mais **aucun e-mail n'est envoyé et le code en vigueur n'est pas remplacé** (le mobile ne peut pas le détecter : le compte à rebours de renvoi côté écran reste de 60 secondes minimum).

Dépassement : `429` avec le corps `RATE_LIMITED` et l'en-tête **`Retry-After`** (secondes). Le mobile attend au moins cette durée avant de réessayer la même route, sans réessai en boucle serrée. Laravel ajoute aussi `X-RateLimit-Limit`, `X-RateLimit-Remaining` (informatifs).

### 2.8 Cache HTTP

- **Routes publiques du catalogue** (`/clothing-categories`, `/clothing-types`, `/colors`, `/styles`, `/occasions`, `/catalog/version`, `/color-guide`) : réponse avec `ETag` (valeur entre guillemets, opaque) et `Cache-Control: public, max-age=300, must-revalidate` (`max-age=60` pour `/catalog/version`) **[Proposition pour les durées]**. Le mobile renvoie `If-None-Match: <ETag>` ; si rien n'a changé, réponse **`304 Not Modified`** sans corps (conserver la copie locale). L'`ETag` d'une liste est un hachage fort du contenu de la réponse (il change dès que la liste change, y compris lors d'une nouvelle version du catalogue). Pas de `Vary` : seul le français est servi.
- **Looks publics** (`/outfits`, `/outfits/{id}`) : `ETag` et `Cache-Control: public, max-age=60` **[Proposition]** ; le mobile ne doit pas dépendre de leur présence.
- **Toutes les réponses authentifiées ou liées à un utilisateur** (`/me/*`, `/auth/*`, `/recommendations/*`) : `Cache-Control: private, no-store` [Décidé]. Le mobile n'enregistre pas ces réponses dans un cache HTTP partagé ; ses propres copies vont dans la base locale (Drift/SQLite) chiffrée selon la sensibilité.
- Un cache HTTP du client (par ex. interceptor Dio) est autorisé sur les routes publiques uniquement.

---

## 3. Authentification JWT (cycle complet)

### 3.1 Principes **[Décidé]**

- Jeton **JWT** (tymon/jwt-auth 2.3.0), algorithme HS256, envoyé en `Authorization: Bearer`.
- **Access token : 15 minutes** (`JWT_TTL=15`, `expires_in` = 900 secondes).
- **Fenêtre de refresh : 14 jours** (`JWT_REFRESH_TTL=20160`). Dans cette fenêtre, un token (même expiré) peut être échangé contre un nouveau token. À chaque refresh, **rotation** : un nouveau token est émis et l'ancien est placé en **blacklist**.
- **Logout** : le token courant est mis en blacklist.
- **`token_valid_after`** : horodatage serveur par utilisateur. Tout token émis avant cette date est rejeté (`401`). Il est avancé lors d'un reset de mot de passe, d'un changement de mot de passe, d'une suppression ou désactivation de compte : **toutes les sessions de l'utilisateur sont alors révoquées**.
- Compte désactivé (`status = disabled`) : contrôlé à chaque requête authentifiée ; les sessions sont révoquées (`401`).
- Rôles multiples : lus en base à chaque requête, **jamais** dans le token. Le mobile n'a pas à les connaître.
- Pas de « jeton de 2 heures sans refresh », pas de connexion par téléphone, pas de renvoi d'un nouveau token par `PATCH /me` : voir annexe A.

### 3.2 Contenu du token : le mobile ne le décode pas

Le payload du JWT contient uniquement des revendications techniques (`sub` = `public_uuid` de l'utilisateur, `iat`, `exp`, `jti`, auxquelles la librairie peut ajouter `iss` et `nbf`). **Aucune donnée personnelle ni rôle.** Le mobile traite le token comme une **chaîne opaque** :

- il ne décode ni ne valide jamais le JWT ;
- il utilise `expires_in` (secondes, reçu à la connexion et au refresh) uniquement comme information ;
- la seule source de vérité sur la validité d'un token est la réponse `401` du serveur.

### 3.3 Forme de la réponse de login, register et refresh

Réponse commune (dans l'enveloppe `data`) :

| Champ | Type | Description |
| --- | --- | --- |
| `access_token` | string | JWT à placer dans `Authorization: Bearer`. |
| `token_type` | string | Toujours `"Bearer"`. |
| `expires_in` | integer | Durée de vie en secondes (900). |
| `user` | object | Présent pour `register` et `login` uniquement (voir §4.1 et §4.2). Absent de `refresh`. |

Il n'existe **pas de refresh token distinct** : le mécanisme est celui de tymon/jwt-auth, où c'est le token d'accès lui-même qui est rafraîchi.

### 3.4 Rafraîchissement : `POST /auth/refresh` **[Proposition]**

- Le mobile appelle `POST /auth/refresh` avec **l'access token expiré (ou sur le point d'expirer) dans l'en-tête `Authorization: Bearer`**, sans corps. C'est le comportement de tymon/jwt-auth dans sa fenêtre de refresh : un token expiré reste acceptable pour le refresh pendant 14 jours.
- Le serveur répond `200` avec un **nouveau** `access_token` (rotation) ; l'ancien est invalidé immédiatement (blacklist avec période de grâce nulle, `JWT_BLACKLIST_GRACE_PERIOD=0`).
- **Conséquence importante** : deux refresh simultanés avec le même token font échouer le second (`401`). Le mobile doit donc **sérialiser** les refresh (§3.5).
- **Fenêtre absolue [À confirmer en BE-003]** : avec tymon/jwt-auth, le nouveau token conserve le `iat` du token d'origine, donc la fenêtre de 14 jours se compte **depuis la connexion initiale** et non depuis le dernier refresh. Au plus tard 14 jours après `login`, un `401` sur `refresh` ramène l'utilisateur à l'écran de connexion. Le mobile ne doit rien supposer de plus : tout `401` sur `refresh` signifie « se reconnecter ».
- Si `token_valid_after` a dépassé le `iat` du token, ou si le compte est désactivé ou supprimé, `refresh` renvoie `401`.

### 3.5 Comportement obligatoire du mobile sur `401 UNAUTHENTICATED`

Un seul composant (intercepteur HTTP central) gère ce cas :

1. Concerne toute réponse `401` à une requête **envoyée avec un Bearer**, sauf pour `login`, `register`, `password/forgot`, `password/reset` (où `401` signifie identifiants invalides) et `refresh` (traité en 4).
2. **Un seul refresh à la fois (single-flight)** : si un refresh est en cours, la requête en échec attend son résultat au lieu d'en lancer un autre. Toutes les requêtes concurrentes en échec forment une file d'attente derrière ce refresh unique.
3. Avant de lancer un refresh, comparer le token utilisé par la requête en échec au token actuellement stocké : s'ils diffèrent, un autre appel a déjà rafraîchi ; **rejouer simplement** la requête avec le token stocké.
4. Refresh réussi : enregistrer le nouveau token dans le stockage sécurisé **avant** de rejouer, puis **rejouer une seule fois** chaque requête en attente avec le nouveau token. Une requête rejouée qui échoue encore en `401` ne relance pas de refresh.
5. Refresh en échec par `401` : **purger le token** (stockage sécurisé), passer en **mode visiteur**, afficher le bandeau « Session expirée, reconnectez-vous pour synchroniser » (UX §0), suspendre la synchronisation. **Aucune donnée locale n'est supprimée** : favoris, compositions, préférences et file d'opérations en attente sont conservés.
6. Refresh en échec pour une autre raison (réseau coupé, `429`, `5xx`) : **ne pas purger le token**. La requête d'origine échoue avec l'erreur correspondante (réseau, `RATE_LIMITED`, etc.) ; le refresh sera retenté au prochain `401`.
7. Les routes publiques (catalogue, looks, recommandations) fonctionnent sans token. Si un token expiré est envoyé sur une route publique, il est ignoré (pas de `401`) **[Proposition]** ; sur `/recommendations/*` le Bearer est optionnel (§7.5). Le mobile peut donc appeler le catalogue en visiteur sans refresh préalable.
8. Si le mobile exécute des tâches en arrière-plan (autre isolate), partager le même verrou de refresh et le même stockage ; ne jamais lancer deux refresh en parallèle depuis deux contextes.
9. Les opérations de la file de synchronisation sont rattachées au compte (`user.id`) qui les a créées. Si un **autre compte** se connecte, elles ne lui sont pas envoyées **[Proposition]**.

### 3.6 Stockage sécurisé

- Le token est stocké **uniquement** dans Keychain (iOS) / Keystore (Android), par ex. `flutter_secure_storage`. Jamais dans SharedPreferences, SQLite/Drift, fichiers ou logs.
- Aucun mot de passe n'est conservé sur l'appareil.
- Aucun token ni mot de passe dans les logs, rapports d'erreurs ou analytics.
- Déconnexion : appeler `POST /auth/logout` (au mieux), puis effacer le token local **quel que soit** le résultat de l'appel.

### 3.7 Réinitialisation et changement de mot de passe

- `POST /auth/password/reset` (réinitialisation par OTP e-mail, sans lien ni token de reset) et `PUT /me/password` avancent `token_valid_after` : tous les appareils sont déconnectés.
- Après `password/reset`, aucun token n'est renvoyé ; l'utilisateur se reconnecte avec `login`.
- Après `PUT /me/password`, la réponse contient un **nouveau** token valide pour l'appareil qui a fait le changement **[Proposition]** (les anciens, dont celui utilisé pour l'appel, sont révoqués). Si la réponse ne contenait pas de token, le mobile retombe sur le cas 5 de §3.5 (reconnexion).

---

## 4. Référence des routes

Le préfixe `/api/v1` est omis. « Auth : oui » = en-tête `Authorization: Bearer` obligatoire. Les erreurs communes à toutes les routes (`429 RATE_LIMITED`, `500 INTERNAL_ERROR`, et `401 UNAUTHENTICATED` pour les routes authentifiées) sont décrites au §5 et ne sont répétées que si elles ont une portée particulière.

### 4.0 Objets partagés

Ces objets sont réutilisés par plusieurs routes. Tous les `id` sont des UUID.

**ClothingTypeRef** : `{ "id": "f9c84ba6-8813-5dc9-84be-bf8a5c4e0521", "slug": "chemise", "name": "Chemise" }`

**ColorRef** : `{ "id": "0491898d-fc0d-51ca-9b9f-e2cdadf5a975", "slug": "blanc", "name": "Blanc", "hex_code": "#FFFFFF" }`

**StyleRef** / **OccasionRef** : `{ "id": "53b091ff-b61a-59c2-a221-10925d18edb9", "slug": "casual", "name": "Casual" }`

**Image** [Proposition] :

```json
{
  "id": "0197b2c5-0a3f-7c21-8b4d-6e1f2a9c7d30",
  "url": "https://media.example.com/images/0197b2c5-0a3f-7c21-8b4d-6e1f2a9c7d30/display.webp",
  "thumbnail_url": "https://media.example.com/images/0197b2c5-0a3f-7c21-8b4d-6e1f2a9c7d30/thumb.webp",
  "alt_text": "Chemise blanche, jean bleu et baskets blanches.",
  "credit": "Photo : Studio X, licence CC BY 4.0",
  "license_type": "cc-by-4.0",
  "source_name": "Studio X",
  "source_url": "https://studio-x.example.com"
}
```

- `thumbnail_url`, `credit`, `source_url` peuvent être `null`. `alt_text` est toujours renseigné (accessibilité). `credit` est non `null` lorsque la licence exige une attribution : l'afficher alors (MOB-07).
- Seules les images dont l'usage est approuvé (`usage_approved`) sont exposées. Aucune clé de stockage ni image d'origine n'est exposée.
- **Forme et stabilité des URL [BE-010, en partie livré]** : les images sont servies par le stockage objet MinIO (bucket `hery-document`), en HTTPS, sur un domaine de fichiers distinct de l'API (par exemple `https://files.<domaine>/hery-document/outfit-images/...`). Les URL sont publiques, sans jeton ni signature, et ne changent pas tant que l'image n'est pas remplacée. Le mobile met en cache l'image par son `id` et tolère un changement d'URL (une image remplacée reçoit un nouvel `id`). Ne pas coder en dur de domaine ni de chemin.

**OutfitItem** :

```json
{
  "clothing_type": { "id": "f9c84ba6-8813-5dc9-84be-bf8a5c4e0521", "slug": "chemise", "name": "Chemise" },
  "color": { "id": "0491898d-fc0d-51ca-9b9f-e2cdadf5a975", "slug": "blanc", "name": "Blanc", "hex_code": "#FFFFFF" },
  "role": "top",
  "is_required": true,
  "sort_order": 1
}
```

`role` appartient à : `top`, `bottom`, `one_piece`, `footwear`, `accessory`, `outerwear` **[Proposition A-9]**.

**ScoreBreakdown** (détail du score sur 100) :

```json
{
  "color": { "points": 36, "max": 40 },
  "structure": { "points": 25, "max": 25 },
  "occasion": { "points": 12, "max": 15 },
  "style": { "points": 8, "max": 10 },
  "completeness": { "points": 9, "max": 10 }
}
```

Les `max` sont constants (40, 25, 15, 10, 10, CDC §7). `score` = somme des `points`, entier de 0 à 100.

### 4.1 Authentification

#### POST /auth/register : inscription

**[Livré BE-003]** · Auth : non · Groupe : `auth`

Corps (JSON) :

| Champ | Type | Obligatoire | Contraintes |
| --- | --- | --- | --- |
| `name` | string | oui | 1 à 100 caractères (espaces de bord retirés). Nom ou pseudonyme (collecte minimale). |
| `email` | string | oui | e-mail valide, 255 max, normalisé en minuscules, unique. |
| `password` | string | oui | 8 caractères minimum, 72 **octets** maximum (un caractère accentué en compte 2) ; refusé s'il est trivial : identique à l'e-mail, un seul caractère répété, suite de chiffres (`12345678`) ou mot de passe très courant (`password`, `azertyuiop`...). |
| `password_confirmation` | string | oui | identique à `password` (règle `confirmed`, vérifiée par le serveur) |

Règle unique **[Décidé]** : le serveur exige `password_confirmation` (règle `confirmed`) sur `register`, `password/reset` et `PUT /me/password`. Le mobile l'envoie toujours. L'e-mail est obligatoire dans le MVP (pas d'autre identifiant de connexion, décision A-14 posée ; pas de champ téléphone). L'adresse n'est pas vérifiée par un e-mail de confirmation dans le MVP **[Proposition]**.

Requête :

```json
{ "name": "Awa Koné", "email": "awa@example.com", "password": "Un mot de passe solide 2026", "password_confirmation": "Un mot de passe solide 2026" }
```

Succès `201` :

```json
{
  "data": {
    "access_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIi...",
    "token_type": "Bearer",
    "expires_in": 900,
    "user": {
      "id": "0197b2c4-7d1e-7a3b-9f10-2c8e5a4d6b11",
      "name": "Awa Koné",
      "email": "awa@example.com",
      "email_verified_at": null,
      "created_at": "2026-10-13T09:30:00Z"
    }
  }
}
```

Erreurs spécifiques :

| Statut | Code | Quand | Exemple de corps |
| --- | --- | --- | --- |
| 422 | `VALIDATION_ERROR` | champ manquant ou invalide, e-mail déjà utilisé | `{"message":"Les données fournies sont invalides.","errors":{"email":["Cette adresse e-mail est déjà utilisée."]},"code":"VALIDATION_ERROR"}` |
| 429 | `RATE_LIMITED` | trop de tentatives | voir §5 |

#### POST /auth/login : connexion

**[Livré BE-003]** · Auth : non · Groupe : `auth`

| Champ | Type | Obligatoire | Contraintes |
| --- | --- | --- | --- |
| `email` | string | oui | e-mail (casse ignorée) |
| `password` | string | oui | 72 octets maximum (au-delà : `422`) |

Requête : `{ "email": "awa@example.com", "password": "Un mot de passe solide 2026" }`

Succès `200` : même structure que l'inscription (`access_token`, `token_type`, `expires_in`, `user`).

Erreurs spécifiques :

| Statut | Code | Quand | Exemple de corps |
| --- | --- | --- | --- |
| 401 | `UNAUTHENTICATED` | e-mail inconnu **ou** mot de passe faux (même réponse dans les deux cas) | `{"message":"Identifiants invalides.","errors":{},"code":"UNAUTHENTICATED"}` |
| 403 | `FORBIDDEN` | identifiants corrects mais compte désactivé **[Proposition]** | `{"message":"Ce compte est désactivé.","errors":{},"code":"FORBIDDEN"}` |
| 422 | `VALIDATION_ERROR` | champ manquant ou mal formé | `{"message":"Les données fournies sont invalides.","errors":{"password":["Le champ mot de passe est obligatoire."]},"code":"VALIDATION_ERROR"}` |
| 429 | `RATE_LIMITED` | plus de 5 requêtes par minute depuis une IP ou pour une paire e-mail + IP, ou 20 échecs de connexion en une heure pour cet e-mail ; en-tête `Retry-After` | voir §5 |

Le `401` de `login` ne déclenche **pas** la logique de refresh (§3.5, point 1) : afficher « Identifiants invalides ».

#### POST /auth/refresh : rafraîchir le token

**[Livré BE-003]** · Auth : oui, avec le token expiré ou valide (fenêtre de 14 jours) · Groupe : `auth-session` · **[Proposition]** pour le mécanisme du Bearer expiré (§3.4)

Aucun corps. En-tête : `Authorization: Bearer <access_token>`.

Succès `200` :

```json
{
  "data": {
    "access_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOi...",
    "token_type": "Bearer",
    "expires_in": 900
  }
}
```

L'ancien token est invalidé aussitôt (rotation).

| Statut | Code | Quand | Conduite du mobile |
| --- | --- | --- | --- |
| 401 | `UNAUTHENTICATED` | token hors fenêtre de 14 jours, déjà mis en blacklist (refresh concurrent, logout), révoqué par `token_valid_after`, compte supprimé ou désactivé | purger le token, mode visiteur (§3.5 point 5) |
| 429 | `RATE_LIMITED` | trop de refresh | ne pas purger, réessayer plus tard |

#### POST /auth/logout : déconnexion

**[Livré BE-003]** · Auth : oui · Groupe : `auth-session`

Aucun corps. Succès `204`. Le token courant est mis en blacklist. Idempotent : un second appel avec un token déjà en blacklist répond aussi `204`. Si le token est expiré mais encore dans la fenêtre de refresh, l'appel est accepté (`204`) **[À confirmer BE-003]** ; sinon il renvoie `401`. Dans tous les cas, le mobile efface son token local et traite `401` comme un succès.

| Statut | Code | Quand |
| --- | --- | --- |
| 401 | `UNAUTHENTICATED` | token absent, invalide ou hors fenêtre (considérer comme déjà déconnecté) |

#### POST /auth/password/forgot : demande de code de réinitialisation (OTP)

**[Livré BE-003]** · [Décidé] · Auth : non · Groupe : `auth`

| Champ | Type | Obligatoire | Contraintes |
| --- | --- | --- | --- |
| `email` | string | oui | e-mail valide |

Requête : `{ "email": "awa@example.com" }`

Succès `202`, **toujours le même corps** que le compte existe ou non (aucune énumération de comptes) :

```json
{ "data": { "message": "Si un compte existe pour cette adresse, un code de réinitialisation vient d'être envoyé par e-mail." } }
```

Règles de l'OTP :

- code numérique de **6 chiffres**, valable **15 minutes**, à **usage unique** ;
- invalidé après **5 essais ratés** ; une nouvelle demande **remplace** le code précédent (l'ancien cesse de fonctionner), mais les échecs restent comptés pour l'e-mail : 10 codes refusés par heure bloquent `password/reset` (`429`) ;
- au plus **1 demande par minute et 5 par heure** par e-mail : au-delà, le serveur répond `202` (même corps) sans envoyer d'e-mail ni changer le code ;
- l'e-mail est envoyé **de façon asynchrone** (file d'attente) : le mobile ne doit pas supposer une livraison immédiate. Le `202` signifie « demande prise en compte », pas « e-mail livré » : l'écran de saisie du code s'affiche toujours, avec un renvoi possible (compte à rebours) ;
- il n'y a ni lien ni token de reset : l'utilisateur recopie le code reçu.

Erreurs :

| Statut | Code | Quand | Exemple de corps |
| --- | --- | --- | --- |
| 422 | `VALIDATION_ERROR` | format d'e-mail invalide | `{"message":"Les données fournies sont invalides.","errors":{"email":["L'adresse e-mail n'est pas valide."]},"code":"VALIDATION_ERROR"}` |
| 429 | `RATE_LIMITED` | limitation par IP ou par paire e-mail + IP dépassée (5 par minute) ; en-tête `Retry-After` (secondes) | `{"message":"Trop de requêtes. Veuillez réessayer plus tard.","errors":{},"code":"RATE_LIMITED"}` |

Le message d'écran côté mobile reste neutre (UX MOB-10).

#### POST /auth/password/reset : réinitialisation avec l'OTP

**[Livré BE-003]** · [Décidé] · Auth : non · Groupe : `auth`

| Champ | Type | Obligatoire | Contraintes |
| --- | --- | --- | --- |
| `email` | string | oui | e-mail valide |
| `otp` | string | oui | 6 chiffres reçus par e-mail |
| `password` | string | oui | mêmes règles que l'inscription (8 caractères minimum, 72 octets maximum, non trivial) |
| `password_confirmation` | string | oui | identique à `password` |

Requête :

```json
{ "email": "awa@example.com", "otp": "482913", "password": "Nouveau mot de passe 2026", "password_confirmation": "Nouveau mot de passe 2026" }
```

Succès `200` :

```json
{ "data": { "message": "Votre mot de passe a été réinitialisé. Vous pouvez vous connecter." } }
```

`token_valid_after` est avancé : **toutes les sessions sont révoquées**, y compris sur l'appareil courant. **Aucun token n'est renvoyé** : le mobile purge son token local, passe en mode visiteur et renvoie l'utilisateur vers l'écran de connexion (`login`) avec son e-mail prérempli.

| Statut | Code | Quand | Exemple de corps |
| --- | --- | --- | --- |
| 422 | `VALIDATION_ERROR` | OTP invalide, expiré ou épuisé (5 essais), ou e-mail sans demande en cours : **message générique identique** dans tous ces cas ; mot de passe trop court ou confirmation différente (erreur sur le champ concerné) | `{"message":"Les données fournies sont invalides.","errors":{"otp":["Le code est invalide ou a expiré."]},"code":"VALIDATION_ERROR"}` |
| 429 | `RATE_LIMITED` | plus de 5 requêtes par minute (IP ou paire e-mail + IP), ou 10 codes refusés dans l'heure pour cet e-mail (même avec le bon code) ; en-tête `Retry-After` (secondes) | `{"message":"Trop de requêtes. Veuillez réessayer plus tard.","errors":{},"code":"RATE_LIMITED"}` |

Le serveur ne distingue pas, dans la réponse, un code faux d'un code expiré ou épuisé : le mobile affiche le même message et propose « Renvoyer un code » (nouvel appel à `password/forgot`).

### 4.2 Compte

#### GET /me : profil connecté

**[Livré BE-003]** · Auth : oui · Groupe : `private`

Succès `200` :

```json
{
  "data": {
    "id": "0197b2c4-7d1e-7a3b-9f10-2c8e5a4d6b11",
    "name": "Awa Koné",
    "email": "awa@example.com",
    "email_verified_at": null,
    "created_at": "2026-10-13T09:30:00Z"
  }
}
```

Les rôles ne sont pas exposés au mobile **[Proposition]**. Erreur : `401` (voir §3.5).

#### PATCH /me : modifier le profil non sensible

**[Livré BE-003]** · Auth : oui · Groupe : `private` · [Décidé] : profil non sensible uniquement, **sans nouveau token**

| Champ | Type | Obligatoire | Contraintes |
| --- | --- | --- | --- |
| `name` | string | non | 1 à 100 caractères |

Les **préférences de style et d'occasion** ne se modifient pas ici mais par `PUT /me/preferences` (frontière de modules : Wardrobe est propriétaire de ces données ; voir annexe C). **Seuls `email`, `password`, `status`, `roles` (et tout champ connu mais non modifiable) donnent `422` sur le champ concerné** s'ils sont fournis. Les autres champs inconnus sont **ignorés** sans erreur, dont `phone` : le téléphone n'existe pas dans le MVP.

Requête : `{ "name": "Awa K." }`

Succès `200` : `{ "data": { ...profil, comme GET /me } }`.

| Statut | Code | Quand | Exemple de corps |
| --- | --- | --- | --- |
| 422 | `VALIDATION_ERROR` | `name` invalide, ou champ sensible fourni | `{"message":"Les données fournies sont invalides.","errors":{"email":["Ce champ n'est pas modifiable."]},"code":"VALIDATION_ERROR"}` |
| 401 | `UNAUTHENTICATED` | token invalide | voir §3.5 |

#### PUT /me/password : changer le mot de passe

**[Livré BE-003]** · Auth : oui · Groupe : `sensitive` (5 requêtes / minute par compte)

| Champ | Type | Obligatoire | Contraintes |
| --- | --- | --- | --- |
| `current_password` | string | oui | doit correspondre au mot de passe actuel |
| `password` | string | oui | 8 caractères minimum, 72 octets maximum, non trivial (mêmes règles que l'inscription), différent de l'actuel |
| `password_confirmation` | string | oui | identique à `password` (règle `confirmed`, vérifiée par le serveur) |

Requête : `{ "current_password": "Un mot de passe solide 2026", "password": "Nouveau mot de passe 2026", "password_confirmation": "Nouveau mot de passe 2026" }`

Succès `200` : `token_valid_after` est avancé, tous les anciens tokens sont révoqués, et un **nouveau** token est renvoyé **[Proposition]** :

```json
{
  "data": {
    "access_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOi...",
    "token_type": "Bearer",
    "expires_in": 900
  }
}
```

Le mobile **remplace** le token stocké s'il y en a un dans la réponse ; sinon il se reconnecte (§3.7).

| Statut | Code | Quand | Exemple de corps |
| --- | --- | --- | --- |
| 422 | `VALIDATION_ERROR` | mot de passe actuel faux, nouveau mot de passe invalide | `{"message":"Les données fournies sont invalides.","errors":{"current_password":["Le mot de passe actuel est incorrect."]},"code":"VALIDATION_ERROR"}` |
| 401 | `UNAUTHENTICATED` | token invalide | voir §3.5 |

#### DELETE /me : suppression du compte et des données

**[Livré BE-003]** · Auth : oui · Groupe : `sensitive` (5 requêtes / minute par compte)

| Champ | Type | Obligatoire | Contraintes |
| --- | --- | --- | --- |
| `password` | string | oui | mot de passe actuel, par confirmation **[Proposition]** (l'UX MOB-10 admet « mot de passe ou double confirmation ») |

Requête : `{ "password": "Un mot de passe solide 2026" }`

Succès `204`. Le compte est supprimé physiquement ; un événement `UserDeleted` déclenche la purge des favoris, compositions et préférences, et l'anonymisation du feedback. Le token devient invalide. Le mobile efface le token, revient en mode visiteur, et propose de conserver ou d'effacer les données locales (UX MOB-10).

| Statut | Code | Quand | Exemple de corps |
| --- | --- | --- | --- |
| 422 | `VALIDATION_ERROR` | mot de passe faux ou manquant | `{"message":"Les données fournies sont invalides.","errors":{"password":["Le mot de passe est incorrect."]},"code":"VALIDATION_ERROR"}` |
| 403 | `FORBIDDEN` | réservé : compte d'administration (A-30 encore ouverte, **non implémenté** : la route ne renvoie pas ce code aujourd'hui) | `{"message":"Vous n'avez pas le droit d'effectuer cette action.","errors":{},"code":"FORBIDDEN"}` |
| 401 | `UNAUTHENTICATED` | token invalide | voir §3.5 |

### 4.3 Catalogue public

Toutes les routes de ce chapitre : **[Livré BE-004]** (sauf `/catalog/version` et `/color-guide`, BE-006) · Auth : non · Groupe : `public` · `ETag` / `If-None-Match` (§2.8) · aucun paramètre. Seuls les éléments **actifs** sont renvoyés ; un élément désactivé disparaît de la liste (le mobile le retire de ses sélecteurs mais conserve de quoi afficher les favoris et looks existants, §8.2). Ordre : `sort_order` croissant, puis `id` interne (stable).

Erreurs communes à ces routes : `503 CATALOG_UNAVAILABLE` (catalogue momentanément indisponible, conduite : utiliser le cache local), `304` (non modifié, succès), `429`, `500`.

#### GET /catalog/version

**[Livré BE-006]** (route enregistrée par le module Recommendation, décision A-7 ; le mobile ne voit pas la différence) · Auth : non

Succès `200` :

```json
{ "data": { "catalog_version": 1, "rules_version": 1 } }
```

Deux entiers strictement croissants : `catalog_version` (catégories, types, couleurs, styles, occasions) et `rules_version` (règles de couleur et de recommandation). Usage : §8.

#### GET /clothing-categories

Succès `200` :

```json
{
  "data": [
    { "id": "213f6e59-5153-5c00-9433-4b5e8cf6b699", "slug": "hauts", "name": "Hauts", "group_type": "top", "is_optional": false, "sort_order": 1 },
    { "id": "e5da4983-8379-5ab0-a5b8-3d3dd3994128", "slug": "bas", "name": "Bas", "group_type": "bottom", "is_optional": false, "sort_order": 2 },
    { "id": "5b40f239-9069-56d3-a43c-da78f0f0d17b", "slug": "pieces-completes", "name": "Pièces complètes", "group_type": "one_piece", "is_optional": false, "sort_order": 3 },
    { "id": "a1cd9adf-1c4d-51b1-89e5-88eace2bc8f8", "slug": "chaussures", "name": "Chaussures", "group_type": "footwear", "is_optional": false, "sort_order": 4 },
    { "id": "672ee724-ea63-53ba-9f6f-739269c3edd4", "slug": "accessoires", "name": "Accessoires", "group_type": "accessory", "is_optional": true, "sort_order": 5 }
  ]
}
```

`group_type` : `top`, `bottom`, `one_piece`, `footwear`, `accessory` **[Proposition A-3]**. `is_optional` indique si la catégorie est facultative dans une tenue : le mobile s'en sert pour distinguer pièces requises et facultatives (il ne les code pas en dur, UX MOB-03).

#### GET /clothing-types

Succès `200` :

```json
{
  "data": [
    { "id": "dc55d999-ef14-5ed4-9068-1f15433831f1", "slug": "t-shirt", "name": "T-shirt", "category_id": "213f6e59-5153-5c00-9433-4b5e8cf6b699", "is_one_piece": false, "sort_order": 1 },
    { "id": "f9c84ba6-8813-5dc9-84be-bf8a5c4e0521", "slug": "chemise", "name": "Chemise", "category_id": "213f6e59-5153-5c00-9433-4b5e8cf6b699", "is_one_piece": false, "sort_order": 2 },
    { "id": "52c94f88-eca2-54ec-89b1-629894f50fdc", "slug": "robe", "name": "Robe", "category_id": "5b40f239-9069-56d3-a43c-da78f0f0d17b", "is_one_piece": true, "sort_order": 13 }
  ]
}
```

`category_id` référence l'`id` d'une catégorie. `is_one_piece` vrai pour robe et combinaison (remplacent haut + bas). L'exemple est tronqué : la vraie réponse contient les 26 types actifs.

#### GET /colors

Succès `200` :

```json
{
  "data": [
    {
      "id": "162543d0-27c2-5a4e-ae5d-e1e64980999e",
      "slug": "bleu-marine",
      "name": "Bleu marine",
      "hex_code": "#1B2A49",
      "color_family": "bleu",
      "temperature": "cool",
      "brightness": "dark",
      "saturation": "medium",
      "is_neutral": false,
      "aliases": []
    }
  ]
}
```

`color_family` : l'un des 15 slugs `noir`, `blanc`, `gris`, `beige`, `creme`, `marron`, `camel`, `bleu`, `vert`, `rouge`, `bordeaux`, `rose`, `violet`, `jaune`, `orange` **[Proposition A-4]**. `temperature` : `warm`, `cool`, `neutral` ou `null` ; `brightness` : `light`, `medium`, `dark` ou `null` ; `saturation` : `low`, `medium`, `high` ou `null` **[Proposition A-5]**. `aliases` : tableau de chaînes (peut être vide) **[Proposition A-6]**. Le jeu initial compte 42 couleurs.

#### GET /styles et GET /occasions

Même structure (exemple pour `/styles`) :

```json
{
  "data": [
    { "id": "2f2e1cea-0a8d-5e3d-b21d-2389a145e54a", "slug": "classique", "name": "Classique", "description": "Des pièces intemporelles aux coupes sobres.", "sort_order": 1 },
    { "id": "53b091ff-b61a-59c2-a221-10925d18edb9", "slug": "casual", "name": "Casual", "description": "Des tenues décontractées pour le quotidien.", "sort_order": 2 }
  ]
}
```

Jeu initial : 7 styles (`classique`, `casual`, `casual-chic`, `elegant`, `minimaliste`, `audacieux`, `streetwear`) et 6 occasions (`quotidien`, `travail-entretien`, `sortie`, `ceremonie`, `soiree`, `evenement-decontracte`). `description` peut être `null`. Les slugs envoyés dans `occasion_slug`/`style_slug` sont ceux de ces listes (annexe D).

#### GET /color-guide

**[Livré BE-006]** (route enregistrée par le module Recommendation, sur le modèle de `/catalog/version` (A-7) : il lit le référentiel de Catalog par contrat et ses propres règles de couleur ; le mobile ne voit pas la différence) · Auth : non · Groupe : `public` · ETag lié aux versions du catalogue et des règles

**Structure entièrement en [Proposition]** : le CDC demande « familles, nuances, neutres, contrastes, harmonies » mais ne définit aucune table de textes pédagogiques. Le guide est calculé à partir des couleurs actives et des règles de couleur actives ; les conseils sont des indications, jamais des règles absolues. Les textes pédagogiques éditoriaux (sections) ne sont pas fournis par l'API dans le MVP (annexe C).

Succès `200` :

```json
{
  "data": {
    "catalog_version": 1,
    "rules_version": 1,
    "families": [
      {
        "slug": "bleu",
        "name": "Bleu",
        "color_ids": [
          "162543d0-27c2-5a4e-ae5d-e1e64980999e",
          "ac3ba93a-e758-502d-984c-5efbc5c47ed8"
        ]
      }
    ],
    "neutral_color_ids": [
      "e4415da7-2919-5acc-8b06-5657736ae031",
      "0491898d-fc0d-51ca-9b9f-e2cdadf5a975"
    ],
    "harmonies": [
      {
        "color_id": "162543d0-27c2-5a4e-ae5d-e1e64980999e",
        "harmonious": [
          { "color_id": "0491898d-fc0d-51ca-9b9f-e2cdadf5a975", "score": 92, "explanation": "Le bleu marine sur une base blanche donne un look frais et soigné." },
          { "color_id": "817994b0-fcd5-52d8-ac2c-c1053796702d", "score": 90, "explanation": "Le bleu marine et le beige s'équilibrent par leur contraste doux." },
          { "color_id": "af1ac4b5-8c3f-5418-87c0-dedb842fee78", "score": 90, "explanation": "Le camel réchauffe la profondeur du bleu marine." }
        ],
        "contrast": [
          { "color_id": "ecdd9d1b-1491-5a80-97c6-3d8f5fc0b1a6", "score": 85, "explanation": "La moutarde fait ressortir le bleu marine par contraste de teintes." }
        ],
        "neutral_pairing": [],
        "caution": [
          { "color_id": "e4415da7-2919-5acc-8b06-5657736ae031", "score": 45, "explanation": "Le bleu marine et le noir sont très proches : le contraste manque de franchise." }
        ]
      }
    ]
  }
}
```

- `families[].color_ids` et tous les `color_id` renvoient à `/colors`. Ordre des familles : ordre du CDC.
- Pour chaque couleur, les partenaires sont groupés par type de règle (`harmonious`, `contrast`, `neutral_pairing`, `caution` **[Proposition A-12]**), triés par `score` décroissant, 5 par groupe au plus. Une couleur sans règle active est absente de `harmonies`.
- `caution` signale une association à manier avec précaution (jamais présentée comme interdite).
- Erreur spécifique : `503 CATALOG_UNAVAILABLE`.

### 4.4 Looks

#### GET /outfits : liste des looks publiés

**[Livré BE-005]** · Auth : non · Groupe : `public` · paginé (§2.5) · `ETag` et `Cache-Control: public, max-age=60`

| Paramètre | Où | Type | Obligatoire | Contraintes |
| --- | --- | --- | --- | --- |
| `page` | query | integer | non | >= 1, défaut 1 |
| `per_page` | query | integer | non | 1 à 50, défaut 20 |
| `style` | query | string | non | slug de style actif **[Proposition]** |
| `occasion` | query | string | non | slug d'occasion active **[Proposition]** |
| `exclude` | query | UUID | non | `id` d'un look à exclure (utile pour les « variantes » de MOB-07) **[Proposition]** |

Les noms des paramètres de filtre sont à confirmer par OpenAPI (point ouvert de l'UX). Tri : `published_at` décroissant, puis `id` interne. Seuls les looks `published` sont visibles ; un look archivé ou brouillon n'apparaît jamais.

Requête : `GET /api/v1/outfits?style=casual&occasion=quotidien&per_page=20`

Succès `200` :

```json
{
  "data": [
    {
      "id": "d25fd239-ab5b-57e4-8814-18c47815fd47",
      "title": "Chemise blanche et denim",
      "slug": "demo-casual-chemise-denim",
      "description": "Un classique du quotidien : chemise blanche, jean et baskets.",
      "style": { "id": "53b091ff-b61a-59c2-a221-10925d18edb9", "slug": "casual", "name": "Casual" },
      "occasion": { "id": "30d60732-5f1e-5a01-bda6-763c717535f2", "slug": "quotidien", "name": "Quotidien" },
      "image": {
        "id": "3015870d-9554-59f3-9e63-55c95de74e25",
        "url": "https://media.example.com/images/3015870d-9554-59f3-9e63-55c95de74e25/display.webp",
        "thumbnail_url": "https://media.example.com/images/3015870d-9554-59f3-9e63-55c95de74e25/thumb.webp",
        "alt_text": "Illustration fictive : chemise blanche, jean bleu et baskets blanches.",
        "credit": "Image fictive pour le développement local, aucun droit tiers.",
        "license_type": "demo",
        "source_name": "Démo locale (image fictive)",
        "source_url": null
      },
      "items": [
        {
          "clothing_type": { "id": "f9c84ba6-8813-5dc9-84be-bf8a5c4e0521", "slug": "chemise", "name": "Chemise" },
          "color": { "id": "0491898d-fc0d-51ca-9b9f-e2cdadf5a975", "slug": "blanc", "name": "Blanc", "hex_code": "#FFFFFF" },
          "role": "top", "is_required": true, "sort_order": 1
        },
        {
          "clothing_type": { "id": "3ecf043e-01a0-51da-a194-7831016c280c", "slug": "jean", "name": "Jean" },
          "color": { "id": "ac3ba93a-e758-502d-984c-5efbc5c47ed8", "slug": "bleu-denim", "name": "Bleu denim", "hex_code": "#3B5B8C" },
          "role": "bottom", "is_required": true, "sort_order": 2
        },
        {
          "clothing_type": { "id": "403ecfd2-fe5e-50bf-9351-7d6acf7529b4", "slug": "baskets", "name": "Baskets" },
          "color": { "id": "0491898d-fc0d-51ca-9b9f-e2cdadf5a975", "slug": "blanc", "name": "Blanc", "hex_code": "#FFFFFF" },
          "role": "footwear", "is_required": true, "sort_order": 3
        },
        {
          "clothing_type": { "id": "92860eff-fb0e-5f9f-a2bf-ba2f27065487", "slug": "ceinture", "name": "Ceinture" },
          "color": { "id": "f491c79a-d4fd-5cd0-aa9b-230aaa8d208a", "slug": "marron", "name": "Marron", "hex_code": "#6B4423" },
          "role": "accessory", "is_required": false, "sort_order": 4
        }
      ],
      "origin": "editorial",
      "published_at": "2026-10-01T08:00:00Z"
    }
  ],
  "links": { "first": "https://api.example.com/api/v1/outfits?page=1", "last": "https://api.example.com/api/v1/outfits?page=1", "prev": null, "next": null },
  "meta": { "current_page": 1, "from": 1, "last_page": 1, "path": "https://api.example.com/api/v1/outfits", "per_page": 20, "to": 1, "total": 1 }
}
```

- `style`, `occasion`, `image` peuvent être `null` : la publication exige un style, une occasion et une image approuvée, mais une image dont l'usage n'est plus approuvé après publication n'est plus exposée (`image: null`).
- Un look publié reste affiché avec ses pièces, son style et son occasion même si le catalogue les a désactivés ensuite ; seuls les filtres `style` et `occasion` exigent un slug actif.
- Un paramètre de filtre vide (`style=`, `occasion=`, `exclude=`) vaut absence de filtre. Exception au §2.3 : un `exclude` bien formé mais inconnu (look archivé entre-temps par exemple) est ignoré, sans 422.
- Les liens de pagination reprennent les filtres valides et `per_page`, jamais les paramètres inconnus.
- `description` joue le rôle de l'explication pédagogique de MOB-07 (le schéma n'a pas de champ `explanation` pour les looks, annexe C). Les explications d'une combinaison précise viennent des recommandations.
- `origin` vaut `editorial` dans le MVP (le mobile n'en fait rien ; prévu pour la phase 2).
- Il n'y a pas de champ « créateur » : l'emplacement de MOB-07 reste masqué.

Erreurs spécifiques :

| Statut | Code | Quand | Exemple de corps |
| --- | --- | --- | --- |
| 422 | `VALIDATION_ERROR` | `per_page` hors bornes, slug de filtre inconnu, `exclude` mal formé | `{"message":"Les données fournies sont invalides.","errors":{"style":["Le style sélectionné n'est pas disponible."]},"code":"VALIDATION_ERROR"}` |
| 429, 500 | | | voir §5 |

#### GET /outfits/{id} : détail d'un look

**[Livré BE-005]** · Auth : non · Groupe : `public` · `ETag` et `Cache-Control: public, max-age=60`

| Paramètre | Où | Type | Obligatoire | Contraintes |
| --- | --- | --- | --- | --- |
| `id` | chemin | UUID | oui | `id` d'un look publié |

Requête : `GET /api/v1/outfits/d25fd239-ab5b-57e4-8814-18c47815fd47`

Succès `200` : `{ "data": { ...même objet que dans la liste } }` (même structure, sans `links` ni `meta`). Cette consultation émet l'événement interne `LookViewed` (sans donnée personnelle côté mobile).

| Statut | Code | Quand | Exemple de corps |
| --- | --- | --- | --- |
| 404 | `NOT_FOUND` | look inconnu, brouillon, archivé, ou UUID mal formé | `{"message":"Ressource introuvable.","errors":{},"code":"NOT_FOUND"}` |

Conduite : sur `404` d'un look présent dans les favoris, afficher l'instantané enregistré avec la mention « Ce look n'est plus dans le catalogue » (UX MOB-07).

### 4.5 Recommandations

Voir aussi §7. Authentification : le Bearer est **optionnel** sur les trois routes de calcul **[Proposition]** ; s'il est valide, le `request_id` est lié à l'utilisateur. Groupe : `recommendations`. Réponses : `Cache-Control: private, no-store`. Le moteur est déterministe à entrées, catalogue et règles identiques.

#### POST /recommendations/from-item : mode A, partir d'une pièce

**[Livré BE-006]** · les suggestions sont des looks publiés adaptés : la pièce de départ remplace la pièce de même rôle (une robe ou combinaison remplace haut + bas ; un haut ou un bas n'est jamais proposé avec un look de robe) ; un look qui contient une pièce désactivée n'est jamais proposé ; score minimal 60 ; élargissement tant que moins de `min(3, limit)` résultats

| Champ | Type | Obligatoire | Contraintes |
| --- | --- | --- | --- |
| `clothing_type_id` | UUID | oui | type de vêtement **actif** |
| `color_id` | UUID | oui | couleur **active** |
| `occasion_slug` | string \| null | non | slug d'une occasion active |
| `style_slug` | string \| null | non | slug d'un style actif |
| `limit` | integer | non | 1 à 5, défaut 5 |

Requête :

```json
{
  "clothing_type_id": "f9c84ba6-8813-5dc9-84be-bf8a5c4e0521",
  "color_id": "0491898d-fc0d-51ca-9b9f-e2cdadf5a975",
  "occasion_slug": "travail-entretien",
  "style_slug": "classique",
  "limit": 5
}
```

Succès `200` :

```json
{
  "data": {
    "request_id": "rq1.dV85YjNlNGY3YTFjMmQ4ZTA1LjE3OTE4ODQ3MDA.kq3Jx9mT2vB0pZc8Wd1sYQ4n7Lh5uA6rEoFg2NxCyVs",
    "catalog_version": 1,
    "rules_version": 1,
    "starting_item": {
      "clothing_type": { "id": "f9c84ba6-8813-5dc9-84be-bf8a5c4e0521", "slug": "chemise", "name": "Chemise" },
      "color": { "id": "0491898d-fc0d-51ca-9b9f-e2cdadf5a975", "slug": "blanc", "name": "Blanc", "hex_code": "#FFFFFF" },
      "role": "top"
    },
    "filters": { "occasion_slug": "travail-entretien", "style_slug": "classique" },
    "broadened": { "applied": false, "steps": [] },
    "results": [
      {
        "outfit_id": "d2a6aa62-d2e8-504f-9254-55a6a226692f",
        "title": "Blazer marine pour le bureau",
        "score": 90,
        "score_breakdown": {
          "color": { "points": 37, "max": 40 },
          "structure": { "points": 25, "max": 25 },
          "occasion": { "points": 15, "max": 15 },
          "style": { "points": 8, "max": 10 },
          "completeness": { "points": 5, "max": 10 }
        },
        "explanation": "Le bleu marine sur une base blanche donne un look frais et soigné.",
        "items": [
          {
            "clothing_type": { "id": "f9c84ba6-8813-5dc9-84be-bf8a5c4e0521", "slug": "chemise", "name": "Chemise" },
            "color": { "id": "0491898d-fc0d-51ca-9b9f-e2cdadf5a975", "slug": "blanc", "name": "Blanc", "hex_code": "#FFFFFF" },
            "role": "top", "is_required": true, "is_starting_item": true
          },
          {
            "clothing_type": { "id": "f26409bc-63f9-5d5a-b295-b36ebd53d248", "slug": "blazer", "name": "Blazer" },
            "color": { "id": "162543d0-27c2-5a4e-ae5d-e1e64980999e", "slug": "bleu-marine", "name": "Bleu marine", "hex_code": "#1B2A49" },
            "role": "outerwear", "is_required": false, "is_starting_item": false
          },
          {
            "clothing_type": { "id": "1d867035-98c1-5c73-b792-1b1234231248", "slug": "pantalon", "name": "Pantalon" },
            "color": { "id": "1639317e-4f0a-588b-a4ac-63513aba2829", "slug": "gris-anthracite", "name": "Gris anthracite", "hex_code": "#3C3F44" },
            "role": "bottom", "is_required": true, "is_starting_item": false
          },
          {
            "clothing_type": { "id": "95004ef5-cea4-58c7-8c12-4dc453c1765b", "slug": "chaussures-habillees", "name": "Chaussures habillées" },
            "color": { "id": "e4415da7-2919-5acc-8b06-5657736ae031", "slug": "noir", "name": "Noir", "hex_code": "#111111" },
            "role": "footwear", "is_required": true, "is_starting_item": false
          },
          {
            "clothing_type": { "id": "146959c7-6034-57b8-bd2b-6f5461feb002", "slug": "montre", "name": "Montre" },
            "color": { "id": "84bf15b2-6a05-52f1-b60f-cdb20f3e624b", "slug": "gris", "name": "Gris", "hex_code": "#808080" },
            "role": "accessory", "is_required": false, "is_starting_item": false
          }
        ],
        "image": {
          "id": "b65baa9f-ed64-53a2-942e-f38e97dc85b4",
          "url": "https://media.example.com/images/b65baa9f-ed64-53a2-942e-f38e97dc85b4/display.webp",
          "thumbnail_url": "https://media.example.com/images/b65baa9f-ed64-53a2-942e-f38e97dc85b4/thumb.webp",
          "alt_text": "Illustration fictive : blazer bleu marine, chemise blanche et pantalon anthracite.",
          "credit": "Image fictive pour le développement local, aucun droit tiers.",
          "license_type": "demo",
          "source_name": "Démo locale (image fictive)",
          "source_url": null
        }
      }
    ],
    "advice": []
  }
}
```

Champs de `data` :

| Champ | Type | Description |
| --- | --- | --- |
| `request_id` | string | Jeton opaque signé HMAC (sans `public_uuid` en clair), valable 7 jours, à conserver pour le feedback (§7.4). |
| `catalog_version`, `rules_version` | integer | Versions utilisées pour ce calcul (§8). |
| `starting_item` | object | Pièce de départ telle que comprise par le serveur (`role` déduit de sa catégorie). |
| `filters` | object | Filtres **effectivement appliqués** (après élargissement éventuel) ; clés à `null` si non appliquées. |
| `broadened` | object | Indicateur d'élargissement (§7.3) : `applied` (booléen) et `steps` (liste ordonnée parmi `style`, `occasion`, `neighbor_shades`, `neutral_advice`). |
| `results` | array | 0 à `limit` suggestions, classées par `score` décroissant. Peut être **vide**. |
| `advice` | array | Conseils neutres de couleur `[{ "text": "...", "color_ids": [ ... ] }]`, renseignés seulement en dernier recours (étape `neutral_advice`), sinon vide. |

Chaque élément de `results` :

| Champ | Type | Description |
| --- | --- | --- |
| `outfit_id` | UUID | Look de référence (peut servir à `GET /outfits/{id}`). Le mobile affiche les `items` de la **réponse**, pas ceux du look s'ils diffèrent. |
| `title` | string | Titre du look de référence ; après adaptation à la pièce de départ, les pièces peuvent différer du titre : afficher les `items`. |
| `score` | integer 0 à 100 | Score indicatif. |
| `score_breakdown` | object | Détail 40/25/15/10/10 (ScoreBreakdown). |
| `explanation` | string | **Une phrase** d'explication, toujours présente. |
| `items` | array | Pièces de la suggestion, avec `is_starting_item` ; la pièce de départ est **toujours présente**. |
| `image` | Image \| null | Visuel et crédit. |

Erreurs spécifiques :

| Statut | Code | Quand | Exemple de corps |
| --- | --- | --- | --- |
| 422 | `VALIDATION_ERROR` | type ou couleur inconnu ou désactivé, UUID mal formé, slug inconnu, `limit` hors bornes | `{"message":"Les données fournies sont invalides.","errors":{"color_id":["La couleur sélectionnée n'est pas disponible."]},"code":"VALIDATION_ERROR"}` |
| 503 | `CATALOG_UNAVAILABLE` | catalogue ou règles indisponibles **[Proposition]** | voir §5 |

Un résultat vide (`results: []`) n'est **pas** une erreur : `200`.

#### POST /recommendations/evaluate-outfit : mode B, évaluer une tenue

**[Livré BE-006]** · occasion (15) et style (10) : part des pièces dont le type figure dans au moins un look publié de l'occasion ou du style demandé (tous les points sans filtre) ; une veste en rôle `outerwear` ne compte pas comme haut pour la structure

| Champ | Type | Obligatoire | Contraintes |
| --- | --- | --- | --- |
| `items` | array | oui | 1 à 10 éléments (même borne pour `evaluate-outfit` et `improve-outfit`, et pour `composition.items` des compositions sauvegardées) |
| `items[].clothing_type_id` | UUID | oui | type actif |
| `items[].color_id` | UUID | oui | couleur active |
| `items[].role` | string | oui | `top`, `bottom`, `one_piece`, `footwear`, `accessory`, `outerwear` ; cohérent avec la catégorie du type **[Proposition]** |
| `occasion_slug` | string \| null | non | slug d'occasion active |
| `style_slug` | string \| null | non | slug de style actif |

Requête :

```json
{
  "items": [
    { "clothing_type_id": "1d867035-98c1-5c73-b792-1b1234231248", "color_id": "1639317e-4f0a-588b-a4ac-63513aba2829", "role": "bottom" },
    { "clothing_type_id": "f9c84ba6-8813-5dc9-84be-bf8a5c4e0521", "color_id": "0491898d-fc0d-51ca-9b9f-e2cdadf5a975", "role": "top" }
  ],
  "occasion_slug": "travail-entretien",
  "style_slug": "classique"
}
```

Succès `200` **[Proposition]** :

```json
{
  "data": {
    "request_id": "rq1.dV85YjNlNGY3YTFjMmQ4ZTA1LjE3OTE4ODQ3NjA.Zr8TnPq0cV5yH2dLw9xKj3sB7mFe1uGaOi6NtCvXy4E",
    "catalog_version": 1,
    "rules_version": 1,
    "score": 68,
    "score_breakdown": {
      "color": { "points": 34, "max": 40 },
      "structure": { "points": 10, "max": 25 },
      "occasion": { "points": 12, "max": 15 },
      "style": { "points": 8, "max": 10 },
      "completeness": { "points": 4, "max": 10 }
    },
    "is_complete": false,
    "strengths": [
      { "text": "Le blanc et le gris anthracite forment une base sobre et facile à porter." }
    ],
    "warnings": [
      { "type": "structure", "text": "Il manque des chaussures pour compléter la tenue.", "item_indexes": [] },
      { "type": "preference", "text": "Cette association reste très sobre : une touche de couleur lui donnerait plus de caractère.", "item_indexes": [0, 1] }
    ],
    "suggestions": [
      { "text": "Ajoutez des chaussures habillées noires pour une tenue de bureau complète." }
    ]
  }
}
```

- `strengths` : points forts. `warnings[].type` vaut **`structure`** (erreur structurelle : pièce manquante, doublon, contradiction) ou **`preference`** (préférence de style, jamais une interdiction). `item_indexes` : positions (à partir de 0) dans `items` de la requête concernées, vide si la tenue entière est visée. `suggestions` : conseils textuels courts.
- Pièces manquantes, doublons de rôle et contradictions (par ex. une robe avec un haut) sont des **avertissements de structure dans une réponse `200`**, pas des erreurs `422` [Proposition ; l'UX demande de distinguer erreur structurelle et préférence]. Un `422` ne sanctionne qu'une requête mal formée ou faisant référence à un élément inconnu ou désactivé.
- Distinguer visuellement les deux types dans l'interface (étiquette texte « Structure » / « Préférence » + icône, UX MOB-06).

Erreurs spécifiques :

| Statut | Code | Quand | Exemple de corps |
| --- | --- | --- | --- |
| 422 | `VALIDATION_ERROR` | `items` vide ou trop long, type ou couleur inconnu ou désactivé, `role` invalide ou incohérent avec le type | `{"message":"Les données fournies sont invalides.","errors":{"items.1.color_id":["La couleur sélectionnée n'est pas disponible."]},"code":"VALIDATION_ERROR"}` |
| 503 | `CATALOG_UNAVAILABLE` | catalogue ou règles indisponibles | voir §5 |

Les clés d'erreur imbriquées utilisent la notation pointée de Laravel (`items.1.color_id`) ; le mobile rattache l'erreur à la pièce d'index 1. Au-delà de 10 pièces, seule l'erreur `items` est renvoyée. Un corps de plus de 16 Ko sur `/recommendations/*` est refusé en `413` avec le code `VALIDATION_ERROR`.

#### POST /recommendations/improve-outfit : améliorations d'une tenue

**[Livré BE-006]** · Corps identique à `evaluate-outfit`. Candidats : ajout de chaque pièce manquante et d'un accessoire (meilleur type et couleur actifs), changement de couleur de chaque pièce, retrait d'un doublon ou d'une pièce en contradiction.

Succès `200` **[Proposition]** :

```json
{
  "data": {
    "request_id": "rq1.dV85YjNlNGY3YTFjMmQ4ZTA1LjE3OTE4ODQ4MTA.Hq4VbN8sWc2eXy7LpA0uDf5gTjR9mKiZo3EtC1vYa6M",
    "catalog_version": 1,
    "rules_version": 1,
    "current_score": 68,
    "improvements": [
      {
        "text": "Ajoutez des chaussures habillées noires pour compléter la tenue.",
        "change": {
          "action": "add_item",
          "item_index": null,
          "item": {
            "clothing_type_id": "95004ef5-cea4-58c7-8c12-4dc453c1765b",
            "color_id": "e4415da7-2919-5acc-8b06-5657736ae031",
            "role": "footwear"
          }
        },
        "resulting_score": 86
      }
    ]
  }
}
```

- `change.action` : `add_item`, `replace_item` (`item_index` = position de la pièce remplacée), `remove_item` (`item` absent). `resulting_score` : score de la tenue une fois la modification appliquée (supérieur à `current_score`).
- Le serveur ne renvoie que des améliorations qui **augmentent** le score, au plus 5, classées par `resulting_score` décroissant. `improvements: []` est un succès (« Aucune amélioration à proposer », UX MOB-06).
- « Appliquer » une amélioration = appliquer `change` à la tenue locale puis rappeler `evaluate-outfit`.

Erreurs : `422 VALIDATION_ERROR` et `503` comme `evaluate-outfit`.

#### POST /recommendations/{request_id}/feedback : feedback facultatif

**[Livré BE-008]** · Auth : **oui** [Proposition, voir §7.4] · Groupe : `feedback`

| Paramètre | Où | Type | Obligatoire | Contraintes |
| --- | --- | --- | --- | --- |
| `request_id` | chemin | string | oui | valeur reçue dans `data.request_id`, telle quelle (opaque, ne pas encoder au-delà de l'encodage d'URL standard) |
| `outfit_id` | corps | UUID \| null | non | look concerné ; `null` ou absent = retour sur la requête entière (évaluation, amélioration) ; sinon look publié |
| `rating` | corps | integer | non | 1 à 5 |
| `is_helpful` | corps | boolean | non | |
| `comment` | corps | string | non | 500 caractères max |

Au moins un des champs `rating` ou `is_helpful` est obligatoire **[Proposition A-25]**. Requête :

```json
{ "outfit_id": "d2a6aa62-d2e8-504f-9254-55a6a226692f", "is_helpful": true, "rating": 5, "comment": "Très utile pour le bureau." }
```

Succès **`201`** à la première soumission, **`200`** si une ligne existe déjà pour `(utilisateur, request_id, outfit_id)` (rejeu, ou changement d'avis dont la valeur est remplacée) **[Proposition]** :

```json
{
  "data": {
    "request_id": "rq1.dV85YjNlNGY3YTFjMmQ4ZTA1LjE3OTE4ODQ3MDA.kq3Jx9mT2vB0pZc8Wd1sYQ4n7Lh5uA6rEoFg2NxCyVs",
    "outfit_id": "d2a6aa62-d2e8-504f-9254-55a6a226692f",
    "rating": 5,
    "is_helpful": true,
    "comment": "Très utile pour le bureau.",
    "created_at": "2026-10-13T09:34:12Z"
  }
}
```

| Statut | Code | Quand | Exemple de corps |
| --- | --- | --- | --- |
| 401 | `UNAUTHENTICATED` | visiteur ou token invalide | voir §3.5 |
| 422 | `VALIDATION_ERROR` | `request_id` invalide (signature), **expiré (plus de 7 jours)** ou appartenant à un autre utilisateur ; aucun de `rating`/`is_helpful` ; `rating` hors bornes ; look inconnu ou non publié | `{"message":"Les données fournies sont invalides.","errors":{"request_id":["Cette recommandation n'est plus valide pour un retour."]},"code":"VALIDATION_ERROR"}` |
| 429 | `RATE_LIMITED` | trop de requêtes | voir §5 |

Conduite sur `422` portant sur `request_id` : abandonner le retour, **ne pas réessayer** (le jeton ne redeviendra pas valide).

### 4.6 Favoris

Toutes les routes `/me/*` : Auth oui · Groupe `private` · `Cache-Control: private, no-store` · isolation stricte par utilisateur (un `client_uuid` d'un autre compte est indistinguable d'un identifiant inexistant : `404`).

**Objet Favorite** :

| Champ | Type | Description |
| --- | --- | --- |
| `id` | UUID | **= `client_uuid`** |
| `outfit_id` | UUID \| null | look référencé ; `null` pour une composition personnalisée |
| `snapshot` | object | instantané du look ou de la composition (§6.7) |
| `created_at` | datetime | |
| `updated_at` | datetime | instant serveur de la dernière modification (curseur et last-write-wins) |

#### GET /me/favorites

**[Livré BE-007]** · paginé (§2.5), `page`/`per_page`. Renvoie les favoris **actifs** (hors supprimés), tri `created_at` décroissant puis `id` interne.

Succès `200` :

```json
{
  "data": [
    {
      "id": "7b0f3c2e-5d41-4f6a-9a3e-2c1d8e4b6a90",
      "outfit_id": "d25fd239-ab5b-57e4-8814-18c47815fd47",
      "snapshot": {
        "schema_version": 1,
        "title": "Chemise blanche et denim",
        "style": { "slug": "casual", "name": "Casual" },
        "occasion": { "slug": "quotidien", "name": "Quotidien" },
        "items": [
          { "clothing_type": { "slug": "chemise", "name": "Chemise" }, "color": { "slug": "blanc", "name": "Blanc", "hex_code": "#FFFFFF" }, "role": "top", "is_required": true },
          { "clothing_type": { "slug": "jean", "name": "Jean" }, "color": { "slug": "bleu-denim", "name": "Bleu denim", "hex_code": "#3B5B8C" }, "role": "bottom", "is_required": true }
        ],
        "image": {
          "url": "https://media.example.com/images/3015870d-9554-59f3-9e63-55c95de74e25/display.webp",
          "thumbnail_url": "https://media.example.com/images/3015870d-9554-59f3-9e63-55c95de74e25/thumb.webp",
          "alt_text": "Illustration fictive : chemise blanche, jean bleu et baskets blanches.",
          "credit": "Image fictive pour le développement local, aucun droit tiers.",
          "license_type": "demo"
        },
        "catalog_version": 1
      },
      "created_at": "2026-10-13T09:30:00.123456Z",
      "updated_at": "2026-10-13T09:30:00.123456Z"
    }
  ],
  "links": { "first": "https://api.example.com/api/v1/me/favorites?page=1", "last": "https://api.example.com/api/v1/me/favorites?page=1", "prev": null, "next": null },
  "meta": { "current_page": 1, "from": 1, "last_page": 1, "path": "https://api.example.com/api/v1/me/favorites", "per_page": 20, "to": 1, "total": 1 }
}
```

La synchronisation (`/me/sync`) est la voie de lecture recommandée pour réconcilier l'état local (§6) ; cette liste sert à l'affichage ponctuel et aux outils. Erreurs : `401`, `422` (pagination).

#### POST /me/favorites : ajouter ou synchroniser

**[Livré BE-007]**

| Champ | Type | Obligatoire | Contraintes |
| --- | --- | --- | --- |
| `client_uuid` | UUID | oui | généré par le mobile, unique par ressource |
| `outfit_id` | UUID \| null | non | look **publié** ; `null` ou absent pour une composition personnalisée |
| `snapshot` | object | oui si `outfit_id` est absent ; **ignoré** si `outfit_id` est fourni | instantané (§6.7) : 1 à 12 éléments dans `items`, 8 Ko max, slugs au format `a-z0-9-`, URL d'image en `https`, ne contient aucune donnée personnelle ; seuls les champs du contrat sont conservés |

Requête (favori d'un look) :

```json
{
  "client_uuid": "7b0f3c2e-5d41-4f6a-9a3e-2c1d8e4b6a90",
  "outfit_id": "d25fd239-ab5b-57e4-8814-18c47815fd47",
  "snapshot": {
    "schema_version": 1,
    "title": "Chemise blanche et denim",
    "style": { "slug": "casual", "name": "Casual" },
    "occasion": { "slug": "quotidien", "name": "Quotidien" },
    "items": [
      { "clothing_type": { "slug": "chemise", "name": "Chemise" }, "color": { "slug": "blanc", "name": "Blanc", "hex_code": "#FFFFFF" }, "role": "top", "is_required": true }
    ],
    "image": { "url": "https://media.example.com/images/3015870d-9554-59f3-9e63-55c95de74e25/display.webp", "thumbnail_url": null, "alt_text": "Illustration fictive : chemise blanche, jean bleu et baskets blanches.", "credit": "Image fictive pour le développement local, aucun droit tiers.", "license_type": "demo" },
    "catalog_version": 1
  }
}
```

Requête (composition personnalisée, sans `outfit_id`) :

```json
{
  "client_uuid": "c3a1e9d4-8b72-4a05-b6f1-9d2e7c4a5b13",
  "snapshot": {
    "schema_version": 1,
    "title": "Ma tenue du lundi",
    "items": [
      { "clothing_type": { "slug": "chemise", "name": "Chemise" }, "color": { "slug": "bleu-ciel", "name": "Bleu ciel", "hex_code": "#A7C7E7" }, "role": "top", "is_required": true },
      { "clothing_type": { "slug": "chino", "name": "Chino" }, "color": { "slug": "beige", "name": "Beige", "hex_code": "#D6C3A3" }, "role": "bottom", "is_required": true }
    ],
    "catalog_version": 1
  }
}
```

Réponses de succès (le corps est toujours `{ "data": <Favorite> }`) :

| Statut | Cas |
| --- | --- |
| `201 Created` | nouvelle ligne créée. |
| `200 OK` | ligne **déjà existante et active** pour ce `client_uuid` (rejeu idempotent, aucune modification), **ou** `client_uuid` d'un favori supprimé : **restauration** (la ligne redevient active avec `outfit_id` et `snapshot` mis à jour, `updated_at` avancé, même `id`) ; **ou** règle **A-37** : le look est déjà en favori actif sous un autre `client_uuid` : la réponse contient ce favori existant avec **son** `id` (§6.5). |

Exemple de réponse A-37 (le mobile avait envoyé `client_uuid` `7b0f3c2e-...`, le favori existait sous un autre uuid) :

```json
{
  "data": {
    "id": "e41d2a76-93c8-4b5f-8a10-5f6c3b9d7e22",
    "outfit_id": "d25fd239-ab5b-57e4-8814-18c47815fd47",
    "snapshot": {
      "schema_version": 1,
      "title": "Chemise blanche et denim",
      "items": [
        { "clothing_type": { "slug": "chemise", "name": "Chemise" }, "color": { "slug": "blanc", "name": "Blanc", "hex_code": "#FFFFFF" }, "role": "top", "is_required": true },
        { "clothing_type": { "slug": "jean", "name": "Jean" }, "color": { "slug": "bleu-denim", "name": "Bleu denim", "hex_code": "#3B5B8C" }, "role": "bottom", "is_required": true }
      ],
      "catalog_version": 1
    },
    "created_at": "2026-10-12T18:02:11.482901Z",
    "updated_at": "2026-10-12T18:02:11.482901Z"
  }
}
```

Si `data.id` diffère du `client_uuid` envoyé, le mobile **remplace son uuid local** (§6.5).

| Statut | Code | Quand | Exemple de corps |
| --- | --- | --- | --- |
| 422 | `VALIDATION_ERROR` | `client_uuid` mal formé ; ni `outfit_id` ni `snapshot` ; `outfit_id` inconnu ou look non publié ; instantané trop gros ou mal formé ; **500 favoris actifs atteints** (création ou restauration, erreur sur `client_uuid`, réponse terminale : l'utilisateur doit en supprimer) | `{"message":"Les données fournies sont invalides.","errors":{"outfit_id":["Ce look n'est plus disponible."]},"code":"VALIDATION_ERROR"}` |

Conduite sur `422 outfit_id` : le look n'est plus publié ; le mobile peut renvoyer le favori comme **composition personnalisée** (même `client_uuid`, sans `outfit_id`, avec `snapshot`) pour ne rien perdre.

#### DELETE /me/favorites/{client_uuid}

**[Livré BE-007]**

| Paramètre | Où | Type | Obligatoire |
| --- | --- | --- | --- |
| `client_uuid` | chemin | UUID | oui |

Succès `204` (suppression logique : la ligne devient une pierre tombale propagée par `/me/sync`). **Idempotent** : supprimer un favori déjà supprimé renvoie aussi `204`.

| Statut | Code | Quand | Conduite |
| --- | --- | --- | --- |
| 404 | `NOT_FOUND` | uuid inconnu pour ce compte (jamais créé, tombstone déjà purgé après 90 jours, ou uuid mal formé) | le mobile considère l'opération **réussie** (déjà absent) et retire l'opération de sa file |

### 4.7 Préférences

#### GET /me/preferences

**[Livré BE-007]**

Succès `200` :

```json
{
  "data": {
    "language": "fr",
    "style_ids": ["2f2e1cea-0a8d-5e3d-b21d-2389a145e54a", "18ca3d5f-d049-51e4-9f81-bf8916bf3732"],
    "occasion_ids": ["e779128b-627b-5e78-b00c-0ed261650363"],
    "updated_at": "2026-10-13T09:40:00Z"
  }
}
```

Un compte sans préférences enregistrées reçoit les valeurs par défaut (`language: "fr"`, listes vides, `updated_at: null`). Seuls les styles et occasions encore actifs sont renvoyés **[Proposition]**.

#### PUT /me/preferences

**[Livré BE-007]** · remplacement complet des préférences.

| Champ | Type | Obligatoire | Contraintes |
| --- | --- | --- | --- |
| `language` | string | non (défaut `fr`) | `fr` seulement au lancement **[Proposition]** |
| `style_ids` | array d'UUID | oui | styles actifs, sans doublon (liste vide permise) |
| `occasion_ids` | array d'UUID | oui | occasions actives, sans doublon |

Requête : `{ "language": "fr", "style_ids": ["2f2e1cea-0a8d-5e3d-b21d-2389a145e54a"], "occasion_ids": [] }`

Succès `200` : `{ "data": { ...mêmes champs que GET } }`.

| Statut | Code | Quand | Exemple de corps |
| --- | --- | --- | --- |
| 422 | `VALIDATION_ERROR` | UUID inconnu ou désactivé, doublon, langue non supportée | `{"message":"Les données fournies sont invalides.","errors":{"style_ids.0":["Le style sélectionné n'est pas disponible."]},"code":"VALIDATION_ERROR"}` |

Règles de synchronisation des préférences **[Proposition]** : les préférences ne passent pas par `/me/sync`. Elles vivent d'abord en local (onboarding). À la connexion, le mobile appelle `GET /me/preferences` : si `updated_at` est `null` (rien sur le serveur), il envoie ses préférences locales avec `PUT` ; sinon les valeurs du serveur remplacent les locales. Ensuite, chaque modification locale est envoyée par `PUT` (dernière écriture gagnante).

### 4.8 Compositions sauvegardées

**Objet SavedOutfit** :

| Champ | Type | Description |
| --- | --- | --- |
| `id` | UUID | **= `client_uuid`** |
| `title` | string \| null | 150 caractères max |
| `composition` | object | `{ "items": [ { "clothing_type_id", "color_id", "role" } ], "occasion_slug", "style_slug" }` |
| `score` | integer \| null | 0 à 100 |
| `rule_version` | integer | `rules_version` utilisée pour calculer le score (>= 1) |
| `created_at`, `updated_at` | datetime | instants serveur |

#### GET /me/saved-outfits

**[Livré BE-007]** · paginé (§2.5). Compositions actives, tri `created_at` décroissant.

Succès `200` : `{ "data": [ <SavedOutfit> ], "links": { ... }, "meta": { ... } }`.

#### POST /me/saved-outfits : créer ou synchroniser

**[Livré BE-007]**

| Champ | Type | Obligatoire | Contraintes |
| --- | --- | --- | --- |
| `client_uuid` | UUID | oui | généré par le mobile |
| `title` | string \| null | non | 150 max |
| `composition` | object | oui | `items` : 1 à 10 éléments `{ clothing_type_id (UUID), color_id (UUID), role (valeur de rôle) }` ; `occasion_slug` et `style_slug` optionnels ; 8 Ko max |
| `score` | integer \| null | non | 0 à 100 |
| `rule_version` | integer | oui | >= 1 |

Le serveur valide seulement la **forme** de la composition (UUID bien formés, rôles connus), pas l'existence ni l'activité des types et couleurs : une composition synchronisée longtemps après sa création ne doit pas être refusée parce qu'un élément a été désactivé entre-temps **[Proposition]**.

Requête :

```json
{
  "client_uuid": "c3a1e9d4-8b72-4a05-b6f1-9d2e7c4a5b13",
  "title": "Ma tenue du lundi",
  "composition": {
    "items": [
      { "clothing_type_id": "f9c84ba6-8813-5dc9-84be-bf8a5c4e0521", "color_id": "0491898d-fc0d-51ca-9b9f-e2cdadf5a975", "role": "top" },
      { "clothing_type_id": "1d867035-98c1-5c73-b792-1b1234231248", "color_id": "1639317e-4f0a-588b-a4ac-63513aba2829", "role": "bottom" },
      { "clothing_type_id": "95004ef5-cea4-58c7-8c12-4dc453c1765b", "color_id": "e4415da7-2919-5acc-8b06-5657736ae031", "role": "footwear" }
    ],
    "occasion_slug": "travail-entretien",
    "style_slug": "classique"
  },
  "score": 86,
  "rule_version": 1
}
```

Succès : `201` (créée) ou `200` (même `client_uuid` déjà actif : rejeu sans modification, **ou** restauration d'une composition supprimée avec mise à jour de ses champs). Corps :

```json
{
  "data": {
    "id": "c3a1e9d4-8b72-4a05-b6f1-9d2e7c4a5b13",
    "title": "Ma tenue du lundi",
    "composition": {
      "items": [
        { "clothing_type_id": "f9c84ba6-8813-5dc9-84be-bf8a5c4e0521", "color_id": "0491898d-fc0d-51ca-9b9f-e2cdadf5a975", "role": "top" },
        { "clothing_type_id": "1d867035-98c1-5c73-b792-1b1234231248", "color_id": "1639317e-4f0a-588b-a4ac-63513aba2829", "role": "bottom" },
        { "clothing_type_id": "95004ef5-cea4-58c7-8c12-4dc453c1765b", "color_id": "e4415da7-2919-5acc-8b06-5657736ae031", "role": "footwear" }
      ],
      "occasion_slug": "travail-entretien",
      "style_slug": "classique"
    },
    "score": 86,
    "rule_version": 1,
    "created_at": "2026-10-13T09:45:00.314159Z",
    "updated_at": "2026-10-13T09:45:00.314159Z"
  }
}
```

| Statut | Code | Quand | Exemple de corps |
| --- | --- | --- | --- |
| 422 | `VALIDATION_ERROR` | `client_uuid` mal formé, `composition` invalide, `score` hors bornes, `rule_version` manquant ou supérieur à 1 000 000 ; **500 compositions actives atteintes** (création ou restauration, erreur sur `client_uuid`) | `{"message":"Les données fournies sont invalides.","errors":{"composition.items.0.role":["Le rôle de la pièce est invalide."]},"code":"VALIDATION_ERROR"}` |

#### PUT /me/saved-outfits/{client_uuid} : modifier

**[Livré BE-007]** · remplacement complet des champs `title`, `composition`, `score`, `rule_version` (mêmes contraintes que `POST`, sans `client_uuid` dans le corps). **Pas de `base_version`** : dernière écriture gagnante (§6.4).

Requête : `{ "title": "Ma tenue du lundi (bureau)", "composition": { ... }, "score": 88, "rule_version": 1 }`

Succès `200` : `{ "data": <SavedOutfit> }` avec `updated_at` avancé.

| Statut | Code | Quand | Conduite |
| --- | --- | --- | --- |
| 404 | `NOT_FOUND` | uuid inconnu, composition supprimée ou uuid mal formé | renvoyer la composition locale par `POST` avec le **même** `client_uuid` (restauration, voir §6.4) |
| 422 | `VALIDATION_ERROR` | champs invalides | corriger ; réponse terminale |

#### DELETE /me/saved-outfits/{client_uuid}

**[Livré BE-007]** · Succès `204` (suppression logique), idempotent. `404 NOT_FOUND` si l'uuid est inconnu pour ce compte : traité comme un succès par le mobile (comme pour les favoris).

### 4.9 Synchronisation

#### GET /me/sync?cursor=

**[Livré BE-007]** · Auth : oui · Groupe : `private` · détail du protocole au §6.

| Paramètre | Où | Type | Obligatoire | Contraintes |
| --- | --- | --- | --- | --- |
| `cursor` | query | string | non | curseur **opaque** reçu d'un appel précédent ; absent = synchronisation complète |
| `limit` | query | integer | non | 1 à 200, défaut 100 (pentest BE-007 M-1) |

Succès `200` :

```json
{
  "data": {
    "changes": [
      {
        "resource": "favorite",
        "op": "upsert",
        "id": "7b0f3c2e-5d41-4f6a-9a3e-2c1d8e4b6a90",
        "updated_at": "2026-10-13T09:30:00.123456Z",
        "data": {
          "id": "7b0f3c2e-5d41-4f6a-9a3e-2c1d8e4b6a90",
          "outfit_id": "d25fd239-ab5b-57e4-8814-18c47815fd47",
          "snapshot": {
            "schema_version": 1,
            "title": "Chemise blanche et denim",
            "items": [
              { "clothing_type": { "slug": "chemise", "name": "Chemise" }, "color": { "slug": "blanc", "name": "Blanc", "hex_code": "#FFFFFF" }, "role": "top", "is_required": true },
              { "clothing_type": { "slug": "jean", "name": "Jean" }, "color": { "slug": "bleu-denim", "name": "Bleu denim", "hex_code": "#3B5B8C" }, "role": "bottom", "is_required": true }
            ],
            "catalog_version": 1
          },
          "created_at": "2026-10-13T09:30:00.123456Z",
          "updated_at": "2026-10-13T09:30:00.123456Z"
        }
      },
      {
        "resource": "favorite",
        "op": "delete",
        "id": "e41d2a76-93c8-4b5f-8a10-5f6c3b9d7e22",
        "updated_at": "2026-10-13T09:41:02.553120Z",
        "deleted_at": "2026-10-13T09:41:02.553120Z"
      },
      {
        "resource": "saved_outfit",
        "op": "upsert",
        "id": "c3a1e9d4-8b72-4a05-b6f1-9d2e7c4a5b13",
        "updated_at": "2026-10-13T09:45:00.314159Z",
        "data": {
          "id": "c3a1e9d4-8b72-4a05-b6f1-9d2e7c4a5b13",
          "title": "Ma tenue du lundi",
          "composition": { "items": [ { "clothing_type_id": "f9c84ba6-8813-5dc9-84be-bf8a5c4e0521", "color_id": "0491898d-fc0d-51ca-9b9f-e2cdadf5a975", "role": "top" } ], "occasion_slug": "travail-entretien", "style_slug": "classique" },
          "score": 86,
          "rule_version": 1,
          "created_at": "2026-10-13T09:45:00.314159Z",
          "updated_at": "2026-10-13T09:45:00.314159Z"
        }
      }
    ],
    "cursor": "eyJpdiI6Ik5xM1p0V2o4a1JmTHk1c0U3cVhCZEE9PSIsInZhbHVlIjoiRm9yVXhKc0Z3bzBhYm1zVHpQY2t5Vy8xN3lVR2RwTkZ3Y0pqd3BXS1Q4SmxXd3Z0SGNtZ0x3PT0iLCJtYWMiOiI5ZjJlYzdhMyIsInRhZyI6IiJ9",
    "has_more": false
  }
}
```

- `changes` : delta trié de façon stable ; chaque élément a `resource` (`favorite` ou `saved_outfit`), `op` (`upsert` ou `delete`), `id` (= `client_uuid`) et `updated_at` (instant serveur). Un `upsert` porte `data` (objet Favorite ou SavedOutfit complet) ; un `delete` porte `deleted_at` (tombstone).
- `cursor` : à stocker tel quel pour l'appel suivant. **Ne jamais l'interpréter, le décoder ni le construire** : il est chiffré et signé par le serveur (aucun identifiant interne n'y est lisible) et sa valeur d'exemple ci-dessus est purement illustrative. Toujours présent, même si `changes` est vide.
- `has_more` : `true` s'il reste des changements ; rappeler aussitôt avec le nouveau `cursor`.
- Appel **sans** `cursor` : état complet des ressources actives (pas de tombstones), paginé par `has_more`.

| Statut | Code | Quand | Conduite |
| --- | --- | --- | --- |
| 410 | `CURSOR_EXPIRED` | curseur plus ancien que la rétention des tombstones (90 jours) | oublier le curseur, resynchronisation complète (§6.6). Exemple : `{"message":"Le curseur de synchronisation a expiré. Une synchronisation complète est nécessaire.","errors":{},"code":"CURSOR_EXPIRED"}` |
| 422 | `VALIDATION_ERROR` | curseur illisible ou `limit` hors bornes **[Proposition]** | traiter comme `CURSOR_EXPIRED` (resynchronisation complète) |
| 401 | `UNAUTHENTICATED` | token invalide | voir §3.5 |

### 4.10 Appels API par écran (rappel de `docs/03-ux-flows.md`)

| Écran | Appels |
| --- | --- |
| MOB-01 Onboarding | `GET /styles`, `GET /occasions` (ou cache) ; `PUT /me/preferences` si connecté |
| MOB-02 Accueil | `GET /catalog/version`, `GET /outfits` (peu d'éléments) |
| MOB-03 Sélecteur | `GET /clothing-categories`, `/clothing-types`, `/colors` (cache) |
| MOB-04 Occasion et style | `GET /occasions`, `GET /styles` (cache) |
| MOB-05 Recommandations | `POST /recommendations/from-item`, `POST /recommendations/{request_id}/feedback` |
| MOB-06 Évaluation | `POST /recommendations/evaluate-outfit`, `/improve-outfit` |
| MOB-07 Détail | `GET /outfits/{id}`, `GET /outfits?style=&occasion=&exclude=` (variantes) |
| MOB-08 Favoris | local d'abord ; `POST/DELETE /me/favorites`, `/me/saved-outfits*`, `GET /me/sync` |
| MOB-09 Guide | `GET /color-guide`, `GET /colors` |
| MOB-10 Compte | `POST /auth/register`, `login`, `logout`, `refresh`, `POST /auth/password/forgot`, `POST /auth/password/reset` (mot de passe oublié : e-mail puis OTP + nouveau mot de passe), `GET/PATCH/DELETE /me` (`PATCH` : `name` uniquement), `PUT /me/password`, `GET/PUT /me/preferences` |
| MOB-11 Partage | aucun appel dédié |

---

## 5. Catalogue des erreurs

### 5.1 Format unique

Toute erreur sous `/api/*` suit ce format, quelle que soit la route :

```json
{
  "message": "Les données fournies sont invalides.",
  "errors": { "color_id": ["La couleur sélectionnée n'est pas disponible."] },
  "code": "VALIDATION_ERROR"
}
```

- `message` : texte en français, affichable à l'utilisateur. Le texte exact peut évoluer ; **la logique du mobile repose sur `code` (et le statut HTTP), jamais sur `message`**. Les textes cités dans ce document (par exemple « Identifiants invalides. », « Ce compte est désactivé. ») sont **indicatifs**.
- `errors` : toujours un **objet** (jamais un tableau), vide `{}` hors validation. Pour `VALIDATION_ERROR`, les clés sont les noms de champs en `snake_case` (notation pointée pour les éléments imbriqués : `items.0.color_id`) et les valeurs des listes de messages.
- `code` : l'un des codes ci-dessous. **`CONFLICT` n'existe pas** (refusé par le Journal des décisions).
- En production, aucune trace d'exception n'est exposée ; un `INTERNAL_ERROR` ne contient qu'un message générique.

### 5.2 Tableau statut × code

| Statut | `code` | Signification | Comportement attendu du mobile |
| --- | --- | --- | --- |
| 422 | `VALIDATION_ERROR` | Données invalides (aussi : requête mal formée, UUID mal formé ou inconnu dans un corps ou une query, texte en UTF-8 invalide ou contenant un caractère de contrôle autre que tabulation et sauts de ligne, sur toutes les routes). | Ne pas réessayer telle quelle. Annoter les champs de `errors` ; retour à l'écran de saisie (par ex. pièce en erreur dans MOB-03/06). Pour la file de synchronisation : réponse **terminale**, l'opération est marquée en échec et n'est pas rejouée. Sur `password/reset` : OTP invalide, expiré ou épuisé = message générique unique, proposer « Renvoyer un code » (§4.1). |
| 401 | `UNAUTHENTICATED` | Token absent, expiré, révoqué ou invalide ; compte désactivé ou supprimé ; identifiants de connexion incorrects. | Sur une route authentifiée : refresh unique puis relance, sinon purge du token et mode visiteur (§3.5). Sur `login` : « Identifiants invalides ». |
| 403 | `FORBIDDEN` | Droit insuffisant (par ex. compte désactivé à la connexion, suppression d'un compte d'administration). | Afficher le `message`, ne pas réessayer. |
| 404 | `NOT_FOUND` | Ressource inconnue ou non visible (look non publié ou archivé, favori d'un autre compte), **UUID mal formé dans un chemin**, route ou méthode HTTP inexistante (une méthode non autorisée renvoie aussi `404`, pas `405`). | « Ce contenu n'est plus disponible » + retour. Sur `DELETE` d'un favori ou d'une composition : succès implicite. Sur `PUT` d'une composition : voir §6.4. |
| 410 | `CURSOR_EXPIRED` | Curseur de synchronisation plus ancien que la rétention des pierres tombales (90 jours). | Oublier le curseur et lancer une synchronisation complète sans le perdre de données locales (§6.6). Aucune erreur affichée en principe. |
| 429 | `RATE_LIMITED` | Trop de requêtes. En-tête `Retry-After` (secondes). | Attendre `Retry-After` (compte à rebours textuel, bouton désactivé brièvement), puis réessayer une fois ; en file de synchronisation, différer l'opération. Sur `password/forgot` et `password/reset` : afficher le compte à rebours et désactiver le bouton d'envoi pendant `Retry-After`. |
| 503 | `CATALOG_UNAVAILABLE` | Catalogue ou règles momentanément indisponibles (maintenance, publication en cours). | Utiliser le cache local du catalogue s'il existe ; sinon erreur avec « Réessayer ». Backoff exponentiel plafonné. |
| 500 | `INTERNAL_ERROR` | Erreur serveur inattendue. | Message générique + « Réessayer ». Pour les écritures de la file de synchronisation : réessai avec backoff, l'opération est idempotente par `client_uuid`. |

Exceptions HTTP non listées ci-dessus : le statut est conservé, `errors` reste `{}` et le message est générique. `401` et `419` renvoient `UNAUTHENTICATED` (statut conservé, traiter le `419` comme un `401`), `403` renvoie `FORBIDDEN`, `503` de maintenance renvoie `CATALOG_UNAVAILABLE` (avec `Retry-After` s'il est fourni), `409`, `413`, `415` et les autres `4xx` renvoient `VALIDATION_ERROR` (ne pas réessayer telle quelle), les autres `5xx` renvoient `INTERNAL_ERROR`.

Autres statuts : `204` (succès sans corps), `304` (non modifié, catalogue). Les erreurs réseau (hors ligne, délai dépassé) ne sont pas des erreurs de l'API : état « hors ligne » de l'UX.

### 5.3 Exemples de corps

| Statut | Exemple |
| --- | --- |
| 401 | `{"message":"Authentification requise.","errors":{},"code":"UNAUTHENTICATED"}` |
| 403 | `{"message":"Vous n'avez pas le droit d'effectuer cette action.","errors":{},"code":"FORBIDDEN"}` |
| 404 | `{"message":"Ressource introuvable.","errors":{},"code":"NOT_FOUND"}` |
| 410 | `{"message":"Le curseur de synchronisation a expiré. Une synchronisation complète est nécessaire.","errors":{},"code":"CURSOR_EXPIRED"}` |
| 422 | `{"message":"Les données fournies sont invalides.","errors":{"clothing_type_id":["Le type de vêtement sélectionné n'est pas disponible."]},"code":"VALIDATION_ERROR"}` |
| 429 | `{"message":"Trop de requêtes. Veuillez réessayer plus tard.","errors":{},"code":"RATE_LIMITED"}` avec `Retry-After: 42` |
| 503 | `{"message":"Le catalogue est momentanément indisponible.","errors":{},"code":"CATALOG_UNAVAILABLE"}` |
| 500 | `{"message":"Une erreur interne est survenue.","errors":{},"code":"INTERNAL_ERROR"}` |

---

## 6. Synchronisation hors ligne

### 6.1 Principes **[Décidé]**

- **Local d'abord** : favoris, compositions et préférences s'écrivent d'abord dans la base locale du mobile (Drift/SQLite), avec retour visuel immédiat, sans attendre le réseau (CDC parcours 4).
- Un visiteur n'effectue **aucun appel** de synchronisation : tout reste local.
- Pour un compte connecté, chaque modification crée une **opération** dans une **file locale persistante** (création, modification, suppression), rejouée dès que le réseau et le token le permettent. Pas de perte silencieuse : une opération n'est retirée de la file qu'après réponse terminale du serveur.
- Chaque favori et chaque composition a un **`client_uuid`** généré à la création locale et conservé à vie : il est l'identifiant public (`id` des réponses) et la clé d'idempotence.
- **Last-write-wins sur `updated_at` serveur** : l'écriture traitée en dernier par le serveur l'emporte. Aucune colonne `version`, aucun `base_version`, aucun `409 CONFLICT`, aucune copie « Ma tenue (copie) » imposée par l'API.
- **Aucune utilisation de l'horloge du téléphone** : le mobile n'envoie jamais de date de modification ; seuls les `updated_at` renvoyés par le serveur servent à comparer.

### 6.2 Statuts d'une ligne locale

Chaque favori et composition locale porte : `client_uuid`, `server_updated_at` (dernier `updated_at` serveur connu, `null` si jamais synchronisé) et un statut `pending` (opération en file), `synced` ou `failed` (rejet terminal). L'UI affiche « En attente de synchronisation » (icône horloge + texte) ou « Synchronisé » (UX MOB-08).

### 6.3 Cycle de synchronisation recommandé

Déclencheurs : ouverture de l'application (connecté), connexion, retour du réseau, retour au premier plan après une durée raisonnable, après chaque envoi réussi.

1. **Pousser la file** : opérations en ordre chronologique, une à la fois **par ressource** (ressources distinctes en parallèle possibles). Traiter les réponses selon le tableau ci-dessous.
2. **Tirer les changements** : `GET /me/sync` avec le dernier curseur (ou sans curseur pour une synchronisation complète), en bouclant tant que `has_more` est vrai.
3. **Appliquer** les `changes` dans l'ordre reçu, dans une **transaction locale** par page :
   - `upsert` : créer ou remplacer la ligne locale d'`id` `x` **seulement si** `updated_at` reçu >= `server_updated_at` local (les pages peuvent rejouer un changement déjà vu) et s'il n'existe pas d'opération locale en attente pour `x` (l'opération en attente sera poussée au prochain cycle) ; mémoriser `server_updated_at`.
   - `delete` : supprimer la ligne locale `x`, sous les mêmes réserves.
4. **Enregistrer le nouveau `cursor` dans la même transaction que l'application de la page.** Un cursor n'est jamais enregistré avant que ses changements soient appliqués.
5. Si `has_more` est vrai, enchaîner immédiatement.

Traitement des réponses de la file :

| Opération | Réponse | Action |
| --- | --- | --- |
| `POST` favori ou composition | `201` ou `200` | marquer `synced`, mémoriser `updated_at` ; si `data.id` diffère du `client_uuid` envoyé (règle A-37) : remplacer l'uuid local (§6.5) |
| `POST` | `422` | échec **terminal** : marquer `failed`, ne pas rejouer ; cas `outfit_id` : renvoyer en composition personnalisée (§4.6) |
| `PUT` composition | `200` | `synced` |
| `PUT` composition | `404` | renvoyer par `POST` avec le même `client_uuid` (restauration) ; si l'utilisateur a supprimé entre-temps, appliquer la suppression |
| `DELETE` | `204` ou `404` | succès, retirer l'opération et la ligne locale |
| toute | `429` | attendre `Retry-After`, garder l'opération |
| toute | réseau, `500`, `503` | backoff exponentiel avec gigue (1 s, 2 s, 4 s ... plafond 5 min), garder l'opération |
| toute | `401` | refresh unique (§3.5) puis rejeu ; si refresh impossible : file **suspendue**, pas de perte |

Optimisation permise : fusionner localement des opérations successives sur le même `client_uuid` avant envoi (création puis suppression non envoyée = les deux disparaissent ; plusieurs `PUT` = le dernier).

### 6.4 Modifications, suppressions et restauration

- **Suppression** : `DELETE` pose un tombstone côté serveur (`deleted_at`, `updated_at` avancé). Les autres appareils reçoivent un `delete` via `/me/sync`. Les tombstones sont conservés **90 jours**, puis purgés.
- **Ré-ajout = restauration** : un `POST` dont le `client_uuid` correspond à une ligne supprimée **restaure** cette ligne (même `id`, champs mis à jour, `updated_at` avancé, réponse `200`), sans `409`. L'unicité `(compte, client_uuid)` inclut les lignes supprimées. Après purge à 90 jours, le même uuid peut être réutilisé comme nouvelle création.
- **Modification concurrente** : deux appareils modifient la même composition : la dernière requête traitée par le serveur l'emporte ; l'autre appareil reçoit le résultat par `/me/sync`. Aucun conflit n'est signalé et aucune copie n'est créée.
- **Modification d'une composition supprimée** : `PUT` répond `404` ; le mobile renvoie sa version par `POST` avec le même `client_uuid` pour la restaurer (l'intention de l'utilisateur la plus récente sur l'appareil prime, conformément au last-write-wins) **[Proposition]**.

### 6.5 Un seul favori actif par look (A-37) **[Décidé]**

Garanti côté base par un index unique partiel `(compte, outfit_id)` sur les favoris actifs. Conséquence pour `POST /me/favorites` :

- Si le look est déjà en favori actif sous un **autre** `client_uuid` (ajouté depuis un autre appareil), le serveur répond **`200`** avec le **favori existant**, donc avec **son** `id` ; aucune erreur.
- Le mobile **remplace son uuid local** par `data.id` : mise à jour de la ligne locale et de toutes les opérations en file qui référencent l'ancien uuid (par exemple un `DELETE` en attente) ; l'élément passe `synced`.
- Si le favori existait sous le même uuid : `200`, rien à faire.
- Ne concerne pas les compositions personnalisées (`outfit_id` absent).
- Cas limite : un même `client_uuid` déjà **actif** renvoyé avec un **autre** `outfit_id` : `200` avec la ressource existante, inchangée (aucune modification) ; le last-write-wins ne s'applique qu'aux `PUT` de compositions **[Livré BE-007]**.
- Cas limite : `client_uuid` supprimé que l'on ré-ajoute alors que le look est déjà favori actif sous un autre uuid : le serveur renvoie le favori actif existant (`200`) et laisse le tombstone tel quel **[Proposition]**.

### 6.6 Curseur et resynchronisation complète

- **Livré BE-007** : les écritures des 2 dernières secondes sont laissées à l'appel suivant (aucune transaction en cours ne peut être sautée) ; à la dernière page, le curseur avance jusqu'à cette borne ; `410` quand le client n'a rien vu depuis plus de 90 jours.
- Le curseur est **opaque** : chaîne que le mobile stocke et renvoie sans l'interpréter. Côté serveur il encode la position `(updated_at, id)` de la dernière ressource renvoyée, mais **sous forme chiffrée et signée** (par ex. `Crypt` de Laravel) : aucun décodage n'est possible ni nécessaire côté mobile, et aucun identifiant interne (bigint) n'est exposé. Il porte aussi sa date d'émission, ce qui permet au serveur de répondre `410 CURSOR_EXPIRED` sans lecture inutile lorsqu'il dépasse la rétention de 90 jours **[Proposition]**.
- Première synchronisation, ou après purge du curseur local : appel **sans `cursor`**. Le serveur renvoie l'état complet des éléments actifs (pas de tombstones), en pages signalées par `has_more`. Pendant une synchronisation complète, ne pas enregistrer le curseur avant la **dernière** page.
- Le delta qui suit une synchronisation complète repart de son **début** : il peut renvoyer des `upsert` déjà reçus (à appliquer de façon idempotente, par `id` et `updated_at`) et contient les `delete` des éléments supprimés pendant qu'elle était paginée. Ne jamais supposer qu'un `upsert` est nouveau.
- Quotas par compte : 500 favoris actifs et 500 compositions actives. Au-delà, `POST` (création ou restauration) répond `422` sur `client_uuid` : réponse terminale, l'opération est marquée en échec et l'utilisateur est invité à supprimer des éléments.
- À la fin d'une synchronisation complète, **réconcilier** : toute ligne locale `synced` absente de l'ensemble reçu est supprimée localement ; les lignes `pending`, `failed` ou jamais synchronisées sont conservées (leurs opérations seront poussées).
- **`410 CURSOR_EXPIRED`** : le curseur est antérieur à la rétention des tombstones de 90 jours (les suppressions manquées ne sont plus connues). Le mobile oublie le curseur, refait une synchronisation complète comme ci-dessus, **sans perdre les opérations locales en attente**, puis enregistre le nouveau curseur. Aucun message d'erreur n'est nécessaire.
- Un curseur illisible (`422`) est traité comme `CURSOR_EXPIRED`.

### 6.7 Instantané (`snapshot`) du look **[Proposition]**

Un favori conserve un instantané du look pour survivre à l'archivage ou à la modification du catalogue (CDC MOB-08 et §14). Contenu minimal visé (doc 03 §8.1, aucune donnée personnelle) :

```json
{
  "schema_version": 1,
  "title": "Chemise blanche et denim",
  "style": { "slug": "casual", "name": "Casual" },
  "occasion": { "slug": "quotidien", "name": "Quotidien" },
  "items": [
    { "clothing_type": { "slug": "chemise", "name": "Chemise" }, "color": { "slug": "blanc", "name": "Blanc", "hex_code": "#FFFFFF" }, "role": "top", "is_required": true }
  ],
  "image": { "url": "https://media.example.com/images/3015870d-9554-59f3-9e63-55c95de74e25/display.webp", "thumbnail_url": null, "alt_text": "Illustration fictive : chemise blanche, jean bleu et baskets blanches.", "credit": "Image fictive pour le développement local, aucun droit tiers.", "license_type": "demo" },
  "catalog_version": 1
}
```

- Champs obligatoires : `schema_version` (entier), `title` (150 max), `items` (1 à 12 éléments), `catalog_version` (entier). `style`, `occasion`, `image` sont facultatifs : pour une composition personnalisée la clé est **absente** (exception à la règle `null` explicite du §2.2) ; un `null` explicite est aussi accepté.
- **Bornes harmonisées** : `items` d'un snapshot de look : **1 à 12** éléments ; `items` d'une composition (`composition.items` de `/me/saved-outfits`) et de `evaluate-outfit` / `improve-outfit` : **1 à 10** éléments. Un `items` vide est toujours refusé (`422`).
- L'instantané référence les types et couleurs par **slug** (et le nom affichable), pas par `id`, pour rester lisible même si un élément est désactivé. Taille maximale 8 Ko.
- Le mobile le construit à partir des données qu'il affiche (résultat de recommandation, détail de look ou composition). `schema_version` permet de le faire évoluer ; le mobile sait lire les versions qu'il a connues.
- **Décidé (A-20, BE-007)** : pour un favori de look, le serveur construit toujours l'instantané à partir du look publié (titre, style, occasion, pièces, image et crédit, `catalog_version`) et ignore celui du mobile ; le favori garde cet instantané si le look est archivé ensuite. L'instantané envoyé par le mobile ne sert qu'aux compositions personnalisées.
- En base, la colonne `snapshot_json` est nullable, avec un CHECK `outfit_id IS NOT NULL OR snapshot_json IS NOT NULL`. Côté API, le snapshot est **obligatoire** pour un favori sans `outfit_id` (composition personnalisée) et **recommandé** pour un favori de look.

---

## 7. Recommandation

### 7.1 Principes **[Décidé]**

- Le moteur est **serveur seulement** (pas de moteur Dart, pas d'export de règles) et **déterministe** : mêmes entrées, même catalogue, mêmes règles : même résultat et même ordre (départage interne stable, non exposé).
- La pièce de départ (mode A) est toujours présente dans chaque résultat. Une robe ou combinaison remplace haut + bas. Les accessoires sont facultatifs.
- **Moins de résultats plutôt que des résultats faibles** : si moins de 3 propositions sont assez pertinentes, la liste est plus courte, voire vide (`200`). Aucun remplissage artificiel, aucun doublon proche.
- Chaque suggestion porte **une phrase d'explication**.
- **Neutralité commerciale** : aucun critère commercial dans le score ; une éventuelle suggestion sponsorisée serait séparée (hors MVP).
- Le score est **indicatif** (jamais présenté comme une vérité absolue) : le texte de l'interface le dit.

### 7.2 Score /100 et détail

`score` = compatibilité des couleurs (40) + cohérence structurelle (25) + adéquation à l'occasion (15) + préférences de style (10) + complétude (10). La complétude réserve 4 points aux accessoires (pleins à partir de deux) : une tenue complète sans accessoire plafonne à 96, sans avertissement (les accessoires restent facultatifs). Le détail par critère est fourni dans `score_breakdown` pour `from-item` (par suggestion) et `evaluate-outfit` (pour la tenue). Poids et maxima sont constants dans le MVP ; le mobile utilise le `max` fourni plutôt que ses propres constantes.

### 7.3 Élargissement progressif

Si les filtres demandés ne donnent pas assez de résultats pertinents, le serveur élargit dans l'ordre : **1. style, 2. occasion, 3. nuances voisines, 4. conseils neutres** (CDC §7). Indicateur dans la réponse : `broadened.applied` et la liste ordonnée `broadened.steps` (`style`, `occasion`, `neighbor_shades`, `neutral_advice`). `filters` reflète les filtres réellement utilisés. Le mobile affiche une notice textuelle de ce qui a été élargi (« Nous avons ignoré le style pour trouver plus de propositions », UX MOB-05) ; à l'étape `neutral_advice`, les `advice` remplacent les looks.

### 7.4 `request_id` et feedback

- `request_id` : jeton **opaque** signé HMAC par le serveur, contenant un horodatage et un identifiant **haché ou dérivé** de l'utilisateur éventuel, **jamais le `public_uuid` en clair** (le `request_id` apparaît dans l'URL de feedback, donc dans les journaux d'accès). **Valable 7 jours**, **sans table** côté serveur. Le mobile le traite comme une chaîne (255 caractères max, alphabet URL-safe) et le conserve avec le résultat qu'il affiche (historique local) ; il ne le décode jamais.
- Une réponse `from-item`, `evaluate-outfit` ou `improve-outfit` contient toujours un `request_id`.
- Route de feedback : `POST /recommendations/{request_id}/feedback` (§4.5). Unicité `(utilisateur, request_id, look)` : un second envoi remplace l'avis (réponse `200`).
- `request_id` invalide ou expiré : **`422 VALIDATION_ERROR`** (champ `request_id`) **[Proposition de précision, basée sur le doc 03 §9.1]**, aucune ligne créée. Jamais de réessai.
- **Règle d'authentification retenue [Proposition]** : le feedback **exige un compte connecté**. Raisons : le CDC §3 range le feedback parmi les droits de l'« utilisateur connecté » (le visiteur n'y figure pas), et le doc 03 §9.1 décrit la route comme authentifiée. `user_id` reste nullable en base uniquement pour l'anonymisation après suppression de compte. Le CDC API-06 dit « facultatif » : cela qualifie l'action (l'utilisateur est libre de donner un avis), pas l'authentification. Conséquence UX : pour un visiteur, masquer ou désactiver les boutons « Utile / Pas utile » avec une invitation à se connecter, ou conserver l'avis localement jusqu'à la connexion (non envoyé après 7 jours).
- Un `request_id` émis pour un visiteur (sans Bearer) est utilisable par un utilisateur connecté ensuite ; un `request_id` émis pour l'utilisateur A est refusé pour l'utilisateur B (`422`) **[Proposition]**.

### 7.5 Authentification des routes de calcul

`from-item`, `evaluate-outfit` et `improve-outfit` sont utilisables par un visiteur. Le mobile envoie le Bearer quand il en a un valide, pour que le `request_id` soit lié à l'utilisateur (permettant le feedback). Un Bearer invalide ou expiré sur ces routes est ignoré (la requête est traitée comme celle d'un visiteur) **[Proposition]**.

### 7.6 Hors ligne

Il n'y a **pas de moteur de recommandation local** dans le MVP (pas d'export de règles, annexe A). Hors ligne : le mobile peut (a) réafficher les derniers résultats déjà reçus et conservés localement, avec la mention de leurs `catalog_version` et `rules_version`, (b) parcourir les looks et le guide des couleurs déjà en cache, (c) mettre en file les favoris et compositions. Il n'affiche jamais de propositions calculées localement présentées comme issues du moteur (UX MOB-05 : « les erreurs ne produisent jamais de propositions locales fausses »). Le libellé « Calculé hors ligne » est inutilisé tant qu'aucun repli local n'est défini (annexe C).

---

## 8. Versions et cache du catalogue

### 8.1 Stratégie de cache local **[Proposition]**

- Le mobile stocke dans la base locale les 5 listes de référence, le guide des couleurs et les derniers looks consultés, chacun avec son `ETag`, et le couple `(catalog_version, rules_version)` correspondant.
- **Vérification** : `GET /catalog/version` (léger, avec `If-None-Match`) :
  - au démarrage à froid (si réseau),
  - au retour au premier plan après au moins 1 heure depuis la dernière vérification,
  - après toute réponse de recommandation dont `catalog_version` ou `rules_version` est supérieur à la valeur en cache (information gratuite),
  - après un `503 CATALOG_UNAVAILABLE` (réessai espacé).
- **Rafraîchissement** si `catalog_version` a changé : télécharger les 5 listes (avec `If-None-Match` ; `304` accepté) et le guide si `catalog_version` ou `rules_version` a changé. Remplacer le cache **de façon atomique** (une transaction locale, seulement si toutes les listes ont été reçues). Si `catalog_version` change encore pendant le téléchargement, recommencer.
- Les listes sont des **copies complètes** (pas de delta dans le MVP) : un élément absent de la nouvelle liste est désactivé ; il disparaît des sélecteurs mais reste résolvable localement (par `id`) pour l'affichage des favoris, compositions et historiques. Ne jamais supprimer ces données locales.
- Au premier lancement hors ligne sans cache : état « Catalogue non disponible hors ligne » (UX §1).
- `503 CATALOG_UNAVAILABLE` : continuer avec le cache existant, sans message bloquant.

### 8.2 Utilisation des versions

- `catalog_version` : change quand les catégories, types, couleurs, styles ou occasions changent.
- `rules_version` : change quand les règles de couleur ou de recommandation changent. Une recommandation ou un score conservé localement peut devenir « périmé » : le mobile affiche le `rules_version` d'origine et peut proposer de recalculer. Un favori conserve la `catalog_version` de son instantané ; une composition la `rule_version` de son score.

### 8.3 UUID v5 stables du référentiel public **[Décidé]**

- Catégories, types, couleurs, styles, occasions, règles de couleur et de recommandation, looks éditoriaux seedés et leurs images (`outfit_images`, nom `outfit_images:<slug du look>`) ont un `id` **UUID v5 déterministe**, identique dans tous les environnements (local, recette, production).
- Calcul : UUID v5 dans l'espace de noms fixe `6f1c2a9e-4b7d-4e38-8a15-c3d9f0b27a64`, avec le nom `<table>:<slug>` (par exemple `colors:bleu-marine`).
- Le mobile **n'a pas besoin de les calculer** : il les lit dans l'API. Leur stabilité permet de les mettre en cache, de les référencer dans des compositions sauvegardées et de les utiliser dans des tests d'intégration. La liste initiale figure en annexe D.
- Les UUID créés via l'API ou l'administration (utilisateurs, images et looks de l'administration) sont des UUID v7 (non déterministes).

### 8.4 Fréquence conseillée

Voir §8.1 : vérification au démarrage et au premier plan après 1 heure ; pas de polling périodique en arrière-plan dans le MVP.

---

## 9. Annexes

### Annexe A. Hors MVP, refusé ou non exposé

| Élément | Statut | Détail |
| --- | --- | --- |
| Connexion par téléphone, champ `phone`, champ `login` e-mail ou téléphone | hors MVP (backlog) | Le MVP n'a que `email` + `password`. Aucun champ téléphone dans l'API. Impact futur : `users.phone`. |
| `GET /catalog/rules-export`, moteur Dart hors ligne, fichier de parité, calcul entier côté Dart | hors MVP | Le moteur est uniquement serveur. |
| Changement d'e-mail | hors MVP (backlog) | Flux dédié avec vérification. **`PATCH /me` n'accepte pas `email`.** |
| Jeton de 2 heures sans refresh, `POST /auth/refresh` absent | refusé | Remplacé par 15 minutes + refresh rotatif. |
| `version`, `base_version`, `409 CONFLICT`, copie « Ma tenue (copie) » imposée | refusé | Last-write-wins sur `updated_at` serveur. |
| `PATCH /me` renvoyant un nouveau token | refusé | `PATCH /me` ne renvoie pas de token. (`PUT /me/password` renvoie un token, §3.7.) |
| Textes pédagogiques éditoriaux du guide des couleurs (sections) | non prévu | Aucune table au CDC §9. |
| URL d'images « stables et immuables » garanties | non tranché | Voir BE-010. |
| Routes d'administration (Backoffice : CRUD du catalogue, des règles et des looks, images, publication, archivage, statistiques, audit, authentification administrateur) | **non exposées au mobile** | Protégées par authentification, rôle et policies. Maintenues côté backend (BE-009), absentes de ce contrat ; le mobile ne les appelle jamais. |
| Stylistes, marketplace, paiements, partenariats | hors MVP | Aucun module ni table. |

### Annexe B. Points à confirmer

**Propositions du doc 03 §19 (valeurs posées en DB-002, à valider)**

| Réf. | Proposition | Impact mobile |
| --- | --- | --- |
| A-3 | `group_type` : `top`, `bottom`, `one_piece`, `footwear`, `accessory` | valeurs de `group_type` |
| A-4 | 15 familles de couleurs en liste fermée | valeurs de `color_family` |
| A-5 | `temperature` (`warm`/`cool`/`neutral`), `brightness` (`light`/`medium`/`dark`), `saturation` (`low`/`medium`/`high`) | valeurs affichables |
| A-6 | alias de couleurs : `aliases` | champ `aliases` de `/colors` |
| A-8 | `outfits.origin` : seule valeur `editorial` | champ `origin` |
| A-9 | rôles de pièces : `top`, `bottom`, `one_piece`, `footwear`, `accessory`, `outerwear` | valeurs de `role` |
| A-10 | scores entiers 0 à 100 | tous les scores |
| A-12 | `rule_type` des paires : `harmonious`, `contrast`, `neutral_pairing`, `caution` (**confirmé par l'utilisateur en BE-006**) | clés de `/color-guide` |
| A-13 | `rule_version` : entier par ligne | `rule_version` des compositions |
| A-14 | e-mail unique, seul identifiant de connexion | inscription et connexion par e-mail |
| A-25 | `rating` et `is_helpful` nullables, au moins un renseigné | corps du feedback |

**Questions ouvertes du doc 03 §17 qui touchent le mobile** : A-20 (snapshot systématique pour un favori de look), A-28 (comportement d'un look dont une image devient non approuvée : le mobile voit alors `404` sur le look), A-29 (sort du `comment` libre à la suppression de compte), A-30 (suppression d'un compte administrateur par `DELETE /me`), A-31 (durées de rétention), A-15, A-16, A-19, A-26 (sans effet direct sur l'API mobile).

**Propositions faites par ce document**

1. Refresh par `POST /auth/refresh` avec l'access token (éventuellement expiré) dans le Bearer, sans corps ; fenêtre de 14 jours comptée depuis la connexion initiale (comportement tymon à vérifier) ; `logout` accepté dans la fenêtre de refresh.
2. `PUT /me/password` renvoie un nouveau token (sinon reconnexion) ; `password/reset` ne renvoie pas de token.
3. `DELETE /me` exige `password`.
4. Compte désactivé : `403` à la connexion, `401` ensuite.
5. Valeurs de limitation de débit (§2.7) et durées de cache HTTP (§2.8).
6. `per_page` hors bornes : `422` (et non rognage).
7. Bearer optionnel sur les routes de recommandation ; Bearer invalide ignoré sur les routes publiques.
8. Feedback : authentification obligatoire ; `422` pour `request_id` invalide ou expiré ; `201` puis `200` au rejeu ; `request_id` d'un visiteur utilisable après connexion, refusé pour un autre utilisateur.
9. Formes des réponses de recommandation (`starting_item`, `filters`, `broadened`, `advice`, `score_breakdown`, `warnings[].type`, `improvements[].change`) ; pièces manquantes et doublons = avertissements dans un `200`.
10. Paramètres de `GET /outfits` : `style`, `occasion`, `exclude` ; objet look (`image`, `items` imbriqués, pas de champ `explanation`).
11. Forme de `/color-guide` (familles, neutres, harmonies par type de règle) ; **propriétaire de la route : Recommendation (BE-006)** et non Catalog (BE-004), sur le modèle de `/catalog/version` (A-7). Décision du Team Lead, à valider.
12. Forme des URL et stabilité des images (BE-010).
13. Contenu du `snapshot` ; limites 8 Ko (snapshot) et 8 Ko (composition), 500 favoris et 500 compositions actifs par compte ; validation de forme seule des compositions.
14. Forme de `/me/sync` (`changes[]` avec `resource`, `op`, `id`, `updated_at`, `data`/`deleted_at`) ; `limit` défaut 100, max 200 ; curseur illisible = `422` traité comme expiré.
15. `PUT` d'une composition supprimée = `404` puis restauration par `POST`.
16. Règle de fusion des préférences à la première connexion.
17. Format de l'OTP de réinitialisation du mot de passe reçu par e-mail : code numérique à 6 chiffres, valable 15 minutes, usage unique, 5 essais (décidé par le Journal ; seul le gabarit de l'e-mail reste à fixer).
18. Pas de vérification de l'e-mail à l'inscription ; l'e-mail déjà utilisé donne un `422` explicite (énumération de comptes acceptée).
19. Cas où `CATALOG_UNAVAILABLE` est émis (catalogue ou règles indisponibles).
20. Rôles non exposés par `GET /me`.
21. Cohérence rôle/catégorie dans `evaluate-outfit` (`top` accepte aussi `outerwear` pour veste et blazer).
22. **`PATCH /me` ne modifie que `name`** (décision du Team Lead, à valider avec l'utilisateur) : les préférences de style et d'occasion passent par `PUT /me/preferences` (Wardrobe est propriétaire, frontière de module). Écart avec la formulation « nom, préférences de style, etc. » du Journal des décisions.
23. Curseur de `/me/sync` **chiffré et signé** côté serveur (par ex. `Crypt` de Laravel), sans identifiant interne exposé, portant sa date d'émission (§6.6).
24. `password_confirmation` exigé par le serveur (règle `confirmed`) sur `register`, `password/reset` et `PUT /me/password`.
25. **Pour BE-003, comparaison `iat` / `token_valid_after`** : `iat` est en secondes, `token_valid_after` en microsecondes. La règle de comparaison est à fixer et à tester en BE-003 : un nouveau token émis dans la même seconde que la révocation ne doit pas être rejeté, et un ancien token ne doit pas être accepté.
26. **Pour BE-003, horodatage de `request_id`** : les exemples du §4.5 utilisent désormais des timestamps de 2026 (`1791884700` = 2026-10-13T09:45:00Z) ; à vérifier que le gabarit réel de l'horodatage signé colle à cette forme (secondes, UTC).
27. **Pour BE-003, textes d'erreur** : BE-003 doit ajouter ces textes (« Identifiants invalides. », « Ce compte est désactivé. », etc.) à `lang/fr/errors.php` ou aligner le contrat.
28. **Pour BE-007, `POST /me/favorites` avec un `client_uuid` déjà actif et un autre `outfit_id`** : `200` avec la ressource existante inchangée (§6.5) ; à confirmer.
29. **Limite stricte** sur `PUT /me/password` et `DELETE /me` : 5 par minute par utilisateur (§2.7) ; à confirmer en BE-003.
30. **`request_id` sans `public_uuid` en clair** : jeton HMAC contenant un identifiant haché ou dérivé de l'utilisateur (§7.4) ; à fixer en BE-006.
31. **Durcissement BE-003b** : limite dure des routes `auth` par IP seule et par paire e-mail + IP (plus par e-mail seul) ; compteurs sur l'e-mail seul : 20 échecs de connexion par heure, 10 codes OTP refusés par heure (cumulés), `forgot` 1 par minute et 5 par heure (202 sans envoi au-delà) ; `429` avec `Retry-After` (§2.7).
32. **Mot de passe (annexe B, BE-003b)** : 8 caractères minimum et 72 **octets** maximum (bcrypt tronque au-delà) sur `register`, `login`, `password/reset` et `PUT /me/password` ; refus des mots de passe triviaux (égal à l'e-mail, caractère unique répété, suite de chiffres, petite liste de mots courants) sur `register`, `password/reset` et `PUT /me/password`, message `Ce mot de passe est trop simple. Choisissez-en un autre.` ; la limite de 128 caractères annoncée plus haut est remplacée.
33. `POST /auth/logout` répond `204` même si le token est déjà en blacklist ; un token sans `sub`, `iat`, `exp`, `jti` ou `tv` est refusé (`401`) ; un `email` qui n'est pas une chaîne donne `422`.

### Annexe C. Incohérences et arbitrages

Règle appliquée : en cas d'incohérence entre le CDC, `docs/02-tasks.md`, le doc 03 et l'UX, ce document tranche **dans le sens du cahier des charges**, puis note l'arbitrage. Les décisions du Journal (`docs/01-architecture.md`) priment quand elles précisent le CDC sans le contredire.

| N° | Incohérence | Arbitrage |
| --- | --- | --- |
| 1 | Le CDC §10 montre des `id` entiers (`"clothing_type_id": 12`) ; la décision D4 expose des UUID. | UUID partout. Le CDC précise lui-même que ses identifiants sont « des exemples de contrat ». |
| 2 | Le CDC §10 cite `/recommendations/{id}/feedback` sans dire quel identifiant ; l'UX (point ouvert 6) suppose un identifiant retourné par l'API. | `{id}` = `request_id` renvoyé par les trois routes de calcul (décision A-24). |
| 3 | Le CDC §10 donne `occasion_slug: "work"` et `style_slug: "smart-casual"` en exemple ; les seeders (DB-003, issus du CDC MOB-04) produisent `travail-entretien` et `classique`/`casual-chic`. | Les slugs des seeders (annexe D) font foi ; ceux du CDC sont des illustrations. L'ancien `integration-mobile.md` utilisait `work`, `casual` : non repris. |
| 4 | CDC MOB-05 et §11 : « repli local si les données sont disponibles hors ligne » / « règles compatibles en cache » ; l'UX MOB-05/06 prévoit un moteur local et la mention « Calculé hors ligne » ; le Journal exclut `rules-export` et le moteur Dart. | Pas de moteur local. Le CDC §11 conditionne le repli à des règles réellement en cache et précise que « le MVP est connecté avec un cache robuste » : sans export de règles, aucun repli de calcul n'est possible. Hors ligne : derniers résultats conservés, looks en cache (§7.6). **Écart avec CDC §11 et MOB-05 (repli local)**, justifié par la décision « pas de rules-export » ; à faire valider côté produit avant BE-006. |
| 5 | CDC §3 : le feedback est un droit de l'« utilisateur connecté » ; CDC API-06 : « facultatif » ; schéma : `user_id` nullable ; UX MOB-05 affiche le feedback sans distinguer le visiteur. | Authentification exigée (CDC §3 et doc 03 §9.1) ; « facultatif » signifie « à l'initiative de l'utilisateur ». L'UX doit masquer le feedback pour un visiteur (§7.4). |
| 6 | Le Journal accepte `PATCH /me` pour « nom, préférences de style, etc. » ; or les préférences appartiennent à Wardrobe, qui dépend d'Identity (jamais l'inverse), et le CDC §5 interdit à un module d'écrire les tables d'un autre. | `PATCH /me` ne modifie que `name` en MVP ; les préférences de style et d'occasion passent par `PUT /me/preferences` (Wardrobe en est propriétaire). Décision du Team Lead : **écart au Journal, à valider** avec l'utilisateur (annexe B n°22). `PATCH /me` n'accepte que `name` (champ non sensible), ne renvoie pas de token, et e-mail et téléphone ne sont pas modifiables (changement d'e-mail au backlog, annexe A). |
| 7 | L'UX (point ouvert 5) note que le CDC §10 n'a ni route de mot de passe ni de profil, ni refresh ni synchronisation ; le Journal les ajoute. | Routes ajoutées (§1.3). `refresh` découle de « jetons révocables avec expiration » (CDC §10) ; `/me/sync` de « stratégie de conflit et de reprise après perte réseau » (CDC API-05). |
| 8 | L'UX §0 ordonne de passer en visiteur sur tout `UNAUTHENTICATED` de `/me/*` ; or l'access token vit 15 minutes et se rafraîchit. | Le passage en visiteur n'a lieu qu'après l'échec d'un refresh unique (§3.5). Sans cela, l'utilisateur serait déconnecté toutes les 15 minutes. |
| 9 | L'UX MOB-08 cite `GET /me/favorites` pour fusionner à la première connexion ; le Journal fournit `GET /me/sync`. | Envoi des éléments locaux par `POST` puis synchronisation complète par `/me/sync` ; `GET /me/favorites` reste disponible mais n'est pas la voie de réconciliation. |
| 10 | Le CDC §9 définit `favorites` sans `deleted_at` ; le Journal (A-21) introduit la suppression logique. | Suppression logique et pierres tombales de 90 jours (§6.4). |
| 11 | CDC §9 : `users.email` « nullable selon l'inscription » sans autre identifiant de connexion. | E-mail obligatoire dans le MVP (A-14) ; pas de téléphone. |
| 12 | L'UX MOB-07 demande une « explication pédagogique » par look ; la table `outfits` n'a que `description`. | `description` tient lieu d'explication ; l'explication d'une combinaison précise vient des recommandations. À reprendre si un champ dédié est ajouté. |
| 13 | CDC §10 place `/color-guide` dans le catalogue public ; il dépend à la fois de Catalog (couleurs) et de Recommendation (règles), alors que Catalog ne peut pas dépendre de Recommendation. Le CDC §9 ne prévoit aucune table de textes de guide. | Même solution que `/catalog/version` (A-7) : **le module propriétaire de la route est Recommendation (BE-006)**, qui lit le référentiel de Catalog via son contrat et ses propres règles de couleur ; la route reste publique (§4.3). Contenu = calculé à partir des couleurs et règles, sans sections éditoriales. Décision du Team Lead, à valider (annexe B n°11). |
| 14 | CDC §7 : le moteur est déterministe « sauf diversité explicitement configurée ». | Aucune diversité aléatoire dans le MVP : même entrée, même sortie (Journal). |
| 15 | `config/jwt.php` fixe `JWT_TTL` à 60 par défaut et exige les claims `iss` et `nbf` ; le Journal impose 15 minutes et des claims minimaux (`sub`, `iat`, `exp`, `jti`). `.env` fixe déjà `JWT_TTL=15`. | Sans effet pour le mobile (qui ne décode pas le token) ; l'alignement de la configuration est à faire en BE-003. |
| 16 | Le message de validation du CDC §10 (« Certaines données sont invalides. ») diffère de celui du code (« Les données fournies sont invalides. »). | Seul `code` est contractuel ; les messages sont indicatifs (§5.1). |
| 17 | `docs/01-architecture.md` indique que l'ancien `integration-mobile.md` « n'est pas modifié » ; ce fichier est maintenant remplacé par le présent contrat (API-000). | Le présent document supersede l'ancien ; la section « Écarts d'integration-mobile.md » de l'architecture reste vraie et est reprise ici. |
| 18 | Le CDC §10 ne prévoit pas de `GET` unitaire sur `/me/favorites/{id}` ni `/me/saved-outfits/{id}` ; le doc 03 §8 parle d'« adressage » par `client_uuid`. | Seuls `DELETE` (favoris) et `PUT`/`DELETE` (compositions) adressent une ressource ; la lecture passe par la liste et `/me/sync`. |
| 19 | `PUT /me/password` renvoie un nouveau token ; le Journal ne le prévoit pas. | Extension du Journal, **à valider** (annexe B n°2) : sinon reconnexion (§3.7). |
| 20 | Routes d'administration (Backoffice) : le CDC §6 API-07 et le Journal les prévoient, ce contrat est destiné au mobile. | Maintenues côté backend (BE-009) conformément au CDC §6 API-07 et au Journal ; **non exposées au mobile et hors de ce contrat** (annexe A). |

### Annexe D. Référentiel initial et UUID v5

Valeurs issues des seeders actuels (`CatalogSeeder`, `LooksDemoSeeder`), calculées avec `SeedUuid` (namespace `6f1c2a9e-4b7d-4e38-8a15-c3d9f0b27a64`, nom `<table>:<slug>`). Elles servent de jeu de contrôle pour les tests mobiles. Les looks `demo-*` ne sont créés que hors production (`LooksDemoSeeder`) ; les vrais looks éditoriaux de production auront leurs propres slugs.

#### clothing_categories

| Slug | Nom | UUID |
| --- | --- | --- |
| `hauts` | Hauts | `213f6e59-5153-5c00-9433-4b5e8cf6b699` |
| `bas` | Bas | `e5da4983-8379-5ab0-a5b8-3d3dd3994128` |
| `pieces-completes` | Pièces complètes | `5b40f239-9069-56d3-a43c-da78f0f0d17b` |
| `chaussures` | Chaussures | `a1cd9adf-1c4d-51b1-89e5-88eace2bc8f8` |
| `accessoires` | Accessoires | `672ee724-ea63-53ba-9f6f-739269c3edd4` |

#### clothing_types

| Slug | Nom | UUID |
| --- | --- | --- |
| `t-shirt` | T-shirt | `dc55d999-ef14-5ed4-9068-1f15433831f1` |
| `chemise` | Chemise | `f9c84ba6-8813-5dc9-84be-bf8a5c4e0521` |
| `polo` | Polo | `dd39fa26-d917-5c97-9e62-657db4b55aaf` |
| `blouse` | Blouse | `612d6de5-bf3e-5522-a511-89e7635a0b40` |
| `pull` | Pull | `9c844e53-4e60-56ed-8b97-81137490d75a` |
| `veste` | Veste | `b12afe0d-beec-5ee0-8b99-a5e6e4f48506` |
| `blazer` | Blazer | `f26409bc-63f9-5d5a-b295-b36ebd53d248` |
| `pantalon` | Pantalon | `1d867035-98c1-5c73-b792-1b1234231248` |
| `jean` | Jean | `3ecf043e-01a0-51da-a194-7831016c280c` |
| `chino` | Chino | `04b8bbdd-8b77-5753-a564-5223e69bff7b` |
| `jupe` | Jupe | `b106606b-4405-5a0b-85d8-d863918e23e8` |
| `short` | Short | `0d2490c2-bcc1-57a8-9cc2-c779902c9230` |
| `robe` | Robe | `52c94f88-eca2-54ec-89b1-629894f50fdc` |
| `combinaison` | Combinaison | `88dcf565-11ec-5202-ae34-f7bce200fce7` |
| `baskets` | Baskets | `403ecfd2-fe5e-50bf-9351-7d6acf7529b4` |
| `mocassins` | Mocassins | `7c545e33-85ac-5ee9-8fbd-9339bb8b8828` |
| `chaussures-habillees` | Chaussures habillées | `95004ef5-cea4-58c7-8c12-4dc453c1765b` |
| `sandales` | Sandales | `24b7f280-d1f2-5296-b865-3d2aae62491a` |
| `bottines` | Bottines | `1160156b-2a63-5042-bfae-0027f83b6000` |
| `ceinture` | Ceinture | `92860eff-fb0e-5f9f-a2bf-ba2f27065487` |
| `sac` | Sac | `ac632891-3c61-5357-9238-4dd1b05f977d` |
| `montre` | Montre | `146959c7-6034-57b8-bd2b-6f5461feb002` |
| `bijoux` | Bijoux | `e5bd3caf-f402-577b-aefa-ec733e5a7c53` |
| `lunettes` | Lunettes | `28f162fc-0ecd-509d-8bc2-1306f756dc50` |
| `foulard` | Foulard | `7714220d-9886-5d4d-9be2-8b84756f2af0` |
| `cravate` | Cravate | `f3730e1c-f9b3-5a0c-99bd-3aa9b3a0a2d1` |

#### colors

| Slug | Nom | UUID |
| --- | --- | --- |
| `noir` | Noir | `e4415da7-2919-5acc-8b06-5657736ae031` |
| `blanc` | Blanc | `0491898d-fc0d-51ca-9b9f-e2cdadf5a975` |
| `blanc-casse` | Blanc cassé | `578fee36-d6e6-541e-9d3c-53c5b88b2220` |
| `gris-clair` | Gris clair | `4a7b59ad-cdce-509a-862d-e3dd75ba2510` |
| `gris` | Gris | `84bf15b2-6a05-52f1-b60f-cdb20f3e624b` |
| `gris-anthracite` | Gris anthracite | `1639317e-4f0a-588b-a4ac-63513aba2829` |
| `beige-clair` | Beige clair | `d8127959-52d0-5fdf-8082-71cc878d7d31` |
| `beige` | Beige | `817994b0-fcd5-52d8-ac2c-c1053796702d` |
| `sable` | Sable | `f082c9fd-5f06-58c8-8714-412f3598ba72` |
| `creme` | Crème | `79da2d51-5e7b-5b17-acf4-e723662aab48` |
| `ivoire` | Ivoire | `6cace339-1a89-5f50-970a-ec8741371a10` |
| `marron-clair` | Marron clair | `2d2b09e1-ed50-5ee4-8866-afed9c4d727c` |
| `marron` | Marron | `f491c79a-d4fd-5cd0-aa9b-230aaa8d208a` |
| `chocolat` | Chocolat | `069120ad-85d8-516a-90e3-3457089ddc2d` |
| `camel` | Camel | `af1ac4b5-8c3f-5418-87c0-dedb842fee78` |
| `cognac` | Cognac | `03ee7da4-19cf-5669-8274-e3759d419c5e` |
| `bleu-ciel` | Bleu ciel | `8f53161c-3012-551d-94d9-bb19bd5c4d81` |
| `bleu-denim` | Bleu denim | `ac3ba93a-e758-502d-984c-5efbc5c47ed8` |
| `bleu` | Bleu | `c807109f-0e98-517b-b2bd-9b5486f33026` |
| `bleu-marine` | Bleu marine | `162543d0-27c2-5a4e-ae5d-e1e64980999e` |
| `vert-sauge` | Vert sauge | `6c114d05-9e49-5a96-aa9f-772b9a9ac781` |
| `vert` | Vert | `2e52fa85-a2e8-51ec-8aa0-3d796c3e9ae8` |
| `vert-kaki` | Vert kaki | `fe4b2979-e2dc-5c26-8186-5669e86c1107` |
| `vert-foret` | Vert forêt | `4dd9dc7a-7790-57e9-bd01-5023a4cfb59f` |
| `rouge` | Rouge | `5cf99278-40b4-50f2-8a91-342ee70c9975` |
| `rouge-vif` | Rouge vif | `8596f9df-e12d-5367-9d58-09ccbbe1adf0` |
| `rouge-brique` | Rouge brique | `4a2d7d04-024d-583a-a525-271929b1df79` |
| `bordeaux` | Bordeaux | `d9a5c744-8978-557d-8a5c-3f1a384b2564` |
| `lie-de-vin` | Lie-de-vin | `6e40438b-11ca-50eb-8981-182dad710180` |
| `rose-pale` | Rose pâle | `71afdc1f-1d83-5b8d-9de9-6dce03489f0d` |
| `rose-poudre` | Rose poudré | `287ba693-adb3-5ad7-843f-9e001103127d` |
| `rose` | Rose | `f99735e8-25a1-583a-baec-744b4c28c4aa` |
| `fuchsia` | Fuchsia | `03b047e1-622a-509d-bf57-d34590a8174b` |
| `lavande` | Lavande | `e5ffd1d3-a3ce-59ed-a324-c086ae958733` |
| `violet` | Violet | `e80d9cad-bd4d-58c2-a0ab-4b00a9b2d2a4` |
| `aubergine` | Aubergine | `d39a7057-03fa-5cf6-80dc-ea0a0156235b` |
| `jaune-pale` | Jaune pâle | `e5a37267-8336-5874-a18e-e6b1829148cc` |
| `jaune` | Jaune | `6213e9d0-d4e1-5038-95a7-bd8dee2be240` |
| `moutarde` | Moutarde | `ecdd9d1b-1491-5a80-97c6-3d8f5fc0b1a6` |
| `peche` | Pêche | `bf72bfcc-47c0-5851-be9a-755ad4536d17` |
| `orange` | Orange | `634c0e1e-3bd5-57e9-9729-65ae92ce7968` |
| `terracotta` | Terracotta | `02dabb50-1c8f-560c-ab9f-406077d93ff4` |

#### styles

| Slug | Nom | UUID |
| --- | --- | --- |
| `classique` | Classique | `2f2e1cea-0a8d-5e3d-b21d-2389a145e54a` |
| `casual` | Casual | `53b091ff-b61a-59c2-a221-10925d18edb9` |
| `casual-chic` | Casual chic | `18ca3d5f-d049-51e4-9f81-bf8916bf3732` |
| `elegant` | Élégant | `9c2c5d75-048e-536b-a978-1efa1eea208e` |
| `minimaliste` | Minimaliste | `a131576e-49c2-5e11-bdcd-06b80e298737` |
| `audacieux` | Audacieux | `2e6d3484-4d9e-5f87-bd37-dfbbaf0cfc23` |
| `streetwear` | Streetwear | `9d4427e1-b411-5fdb-aa56-8c262b8b61b2` |

#### occasions

| Slug | Nom | UUID |
| --- | --- | --- |
| `quotidien` | Quotidien | `30d60732-5f1e-5a01-bda6-763c717535f2` |
| `travail-entretien` | Travail / entretien | `e779128b-627b-5e78-b00c-0ed261650363` |
| `sortie` | Sortie | `d7dbcef2-20ce-51e4-8bc9-4fdb4dc882e5` |
| `ceremonie` | Cérémonie | `9c155cc5-c09f-5471-ab67-fd2c10e422dd` |
| `soiree` | Soirée | `da9a94ab-ae32-531d-a68f-f4924b49ad50` |
| `evenement-decontracte` | Événement décontracté | `965055cf-6e64-5c1c-b2d6-6d09e92ea8c3` |

#### outfits

| Slug | Titre | UUID |
| --- | --- | --- |
| `demo-casual-chemise-denim` | Chemise blanche et denim | `d25fd239-ab5b-57e4-8814-18c47815fd47` |
| `demo-travail-blazer-marine` | Blazer marine pour le bureau | `d2a6aa62-d2e8-504f-9254-55a6a226692f` |
| `demo-soiree-robe-bordeaux` | Robe bordeaux du soir | `83e199ae-21d9-56d0-bb86-8dd319dd8e8f` |
| `demo-streetwear-pull-gris` | Pull gris et jean noir | `c84de014-7bf3-5fb8-875e-c359f5db5026` |

#### outfit_images

Nom du calcul : `outfit_images:<slug du look>`. Les images de démo portent `license_type` = `demo`, `source_name` = « Démo locale (image fictive) » et une attribution (`credit` dans l'API) = « Image fictive pour le développement local, aucun droit tiers. ».

| Slug du look | UUID de l'image |
| --- | --- |
| `demo-casual-chemise-denim` | `3015870d-9554-59f3-9e63-55c95de74e25` |
| `demo-travail-blazer-marine` | `b65baa9f-ed64-53a2-942e-f38e97dc85b4` |
| `demo-soiree-robe-bordeaux` | `24bc260d-f717-5950-b2c8-60ef0fccecef` |
| `demo-streetwear-pull-gris` | `6b11b6a6-6d35-51df-814e-6dab11a3d592` |
