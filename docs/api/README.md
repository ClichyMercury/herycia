# API Herycia : contrat simulé côté mobile

L'application mobile tourne aujourd'hui contre un **faux serveur intégré** qui renvoie exactement le JSON qu'elle attend de l'API Laravel. Ce dossier décrit ce contrat. C'est une **base de discussion** : il suit le cahier des charges v2.0 (section 10), le complète là où il était muet, et liste ci-dessous les points à trancher ensemble.

Quand l'API réelle existera, le mobile changera une seule ligne ([lib/core/api/api_providers.dart](../../lib/core/api/api_providers.dart)) et parlera à `/api/v1`. Tant que le JSON respecte ce contrat, rien d'autre ne bouge.

## Contenu

| Fichier | Rôle |
|---|---|
| [openapi.yaml](openapi.yaml) | Spécification OpenAPI 3.1 : routes, schémas, codes de statut, contraintes de validation |
| [examples/](examples/) | 43 couples requête/réponse **générés par le faux serveur** (index dans [examples/index.json](examples/index.json)) |
| [../../assets/mock/](../../assets/mock/) | Données de départ : catalogue, 300 règles de couleur, 23 règles occasion/style, 20 looks, guide des couleurs |

Les exemples sont produits par un test automatisé ([test/mock_backend/api_examples_test.dart](../../test/mock_backend/api_examples_test.dart)) : ils correspondent exactement à ce que fait le faux serveur. Les listes de plus de 8 éléments y sont tronquées à 3, suivies d'une ligne « … N éléments supplémentaires ». Cette ligne ne fait pas partie du contrat.

## Conventions

- **Préfixe** `/api/v1`. Le mobile ne sait pas quel module Laravel répond.
- **Enveloppe** : `{"data": ...}` pour toute réponse 200/201. Les listes paginées ajoutent `meta: {current_page, per_page, total, last_page}`. Les 204 n'ont pas de corps.
- **Clés JSON** en `snake_case`, **dates** en ISO 8601 UTC (`2026-10-12T10:00:00.000Z`).
- **Identifiants** : le mobile les traite comme des chaînes opaques. Il les envoie en entier quand ils sont numériques (`"clothing_type_id": 12`), sinon en chaîne. Le faux serveur accepte les deux formes. Bigint et UUID conviennent donc tous les deux.
- **Erreurs** : format unique de la section 10 du cahier des charges.
  ```json
  {"message": "Certaines données sont invalides.", "errors": {"color_id": ["La couleur sélectionnée n'est pas disponible."]}, "code": "VALIDATION_ERROR"}
  ```
  Les messages de `errors` sont affichés tels quels sous les champs. Ils sont donc rédigés pour l'utilisateur, en français.
- **Authentification** : `Authorization: Bearer <token>`. Le jeton est révocable, expire au bout de 30 jours dans la simulation, et `expires_at` est renvoyé à la connexion. Sanctum convient bien.
- **Vocabulaire** : aucune explication ne dit « interdit », « faux » ou « erreur de goût » (sections 7 et 1.5 du design system).

## Routes

| Méthode | Route | Auth | Statuts |
|---|---|---|---|
| GET | `/catalog/version` | – | 200 |
| GET | `/clothing-categories` | – | 200 |
| GET | `/clothing-types?category_id=` | – | 200, 422 |
| GET | `/colors` | – | 200 |
| GET | `/styles` | – | 200 |
| GET | `/occasions` | – | 200 |
| GET | `/color-guide` | – | 200 |
| GET | `/color-pairing-rules` | – | 200 · **proposition** |
| GET | `/recommendation-rules` | – | 200 · **proposition** |
| GET | `/outfits?style_slug=&occasion_slug=&page=&per_page=` | – | 200, 422 |
| GET | `/outfits/{id}` | – | 200, 404 (brouillon ou archivé = 404) |
| POST | `/recommendations/from-item` | facultative | 200, 422 |
| POST | `/recommendations/evaluate-outfit` | facultative | 200, 422 |
| POST | `/recommendations/improve-outfit` | facultative | 200, 422 |
| POST | `/recommendations/{request_id}/feedback` | facultative | 201, 404, 422 |
| POST | `/auth/register` | – | 201, 422 |
| POST | `/auth/login` | – | 200, 422, 429 |
| POST | `/auth/logout` | requise | 204, 401 |
| POST | `/auth/forgot-password` | – | 200, 422 |
| POST | `/auth/reset-password` | – | 200, 422 |
| GET / DELETE | `/me` | requise | 200 / 204, 401 |
| GET / POST | `/me/favorites` | requise | 200 / 201 (création) ou 200 (déjà existant), 401, 422 |
| DELETE | `/me/favorites/{id ou client_uuid}` | requise | 204, 404 |
| GET / PUT | `/me/preferences` | requise | 200, 401, 422 |
| GET / POST | `/me/saved-outfits` | requise | 200 / 201 ou 200, 401, 422 |
| PUT / DELETE | `/me/saved-outfits/{id ou client_uuid}` | requise | 200, 404, 409, 422 / 204, 404 |

## Comportements à reproduire côté Laravel

**Recommandations, mode A (`from-item`)**
- Le moteur part des looks **publiés** et remplace la pièce du même rôle par la pièce choisie : la pièce de départ est toujours présente, marquée `is_anchor: true`.
- Il calcule le score de chaque proposition, écarte les doublons (mêmes types et couleurs hors accessoires) et garde au plus `limit` résultats (5 maximum) au-dessus d'un seuil de 65.
- **Photo** : un résultat ne porte `image` que si la pièce choisie est identique à celle du look d'origine **et** si `usage_approved` est vrai. Sinon `image: null`, et le mobile affiche le mannequin 2D. Une photo de chemise bleue ne doit jamais illustrer une chemise rouge.
- **Moins de 3 résultats** : le moteur élargit dans l'ordre du cahier des charges, et chaque étape est listée dans `broadened`.
  1. Style.
  2. Occasion.
  3. « Nuances voisines » : le seuil descend à 55.
  4. Conseils neutres : propositions générées, sans `outfit_id` ni photo.

**Score sur 100** : 40 couleurs, 25 structure, 15 occasion, 10 style, 10 complétude, avec le détail dans `breakdown`.
- **Couleurs** : moyenne pondérée des règles de paire. Les paires de pièces principales pèsent 1, les paires avec un accessoire 0,5. Un malus s'applique au-delà de deux familles de couleurs vives.
- **Structure** : chaque problème retire des points (haut, bas ou chaussures manquants ; robe avec haut ou bas ; doublons).
- **Occasion et style** : on part de 1 et on ajoute les poids négatifs de `recommendation_rules`, puis on multiplie par le ratio de structure. Sans occasion ni style demandés, les points sont pleins.
- **Complétude** : 8 points pour les pièces requises, plus 2 si la tenue a au moins un accessoire.
- **Remarques** : `warnings[].kind` vaut `structural` (pièce manquante, contradiction) ou `style` (préférence, contraste faible, occasion). Le mobile les affiche différemment (section API-04 du cahier des charges).
- **Déterminisme** : mêmes entrées, même catalogue et mêmes règles donnent la même réponse.

**Favoris et compositions** (`client_uuid`)
- **Idempotence** : renvoyer un `POST` avec le même `client_uuid` rend la ressource existante en 200, sans créer de doublon.
- **Suppression** : un `DELETE` sur une ressource déjà supprimée renvoie 404, que le mobile traite comme un succès.
- **Instantané** : un favori porte toujours `snapshot`, construit par le serveur si le mobile n'envoie qu'un `outfit_id`. Il survit ainsi à l'archivage du look.
- **Score des compositions** : il est **recalculé par le serveur**. Le `score` envoyé par le client est ignoré.
- **Conflit** : `PUT /me/saved-outfits` avec un `base_updated_at` plus ancien que la version serveur renvoie **409 `CONFLICT`**, avec la version serveur dans `current`.

**Remplacement complet par `PUT`**
- `PUT /me/preferences` et `PUT /me/saved-outfits/{id}` remplacent toute la ressource : un champ omis repasse à sa valeur par défaut, et le `title` d'une composition passe à null. Le mobile envoie toujours l'objet complet.
- `updated_since` n'existe que sur les favoris, pas encore sur les compositions (voir la question ouverte n° 3).

**Sécurité**
- **Identifiants refusés** à la connexion : 422 avec une erreur sur `email`, comme le fait Laravel par défaut, et non 401.
- **`device_name`** est envoyé par le mobile, mais le faux serveur l'ignore. Il servirait de nom au jeton Sanctum.
- **429** : `retry_after` figure dans le corps ; un en-tête `Retry-After` serait un bonus côté Laravel.
- **Isolation** : un utilisateur ne voit ni ne supprime jamais les données d'un autre (404 sinon).
- **Connexion** : 5 échecs par minute et par e-mail, puis **429 `RATE_LIMITED`** avec `retry_after`.
- **Mot de passe oublié** : la réponse est identique, que le compte existe ou non.
- **Réinitialisation** du mot de passe : elle révoque tous les jetons.
- **`DELETE /me`** : supprime l'utilisateur, ses favoris, ses compositions et ses préférences, et anonymise son feedback (`user_id` à null).

## Écarts avec le cahier des charges (propositions)

| Proposition | Pourquoi |
|---|---|
| Routes `GET /color-pairing-rules` et `GET /recommendation-rules` | Section 11 : le mobile doit « stocker localement les règles compatibles » pour recommander hors ligne, mais aucune route publique ne les exposait |
| Code d'erreur `CONFLICT` (409) et champ `base_updated_at` | Stratégie de conflit explicite demandée en API-05 et section 11 |
| `retry_after` sur les 429 | Permet au mobile d'afficher un délai |
| `DELETE` par `client_uuid` (en plus de l'`id`) | Un favori créé hors ligne n'a pas encore d'`id` serveur |
| `updated_since` sur `GET /me/favorites` | Synchronisation incrémentale |
| `theme` et `silhouette` dans les préférences | Écran G-07 (thème) et mannequin 2D, **ajouté au MVP par décision produit** alors que le cahier des charges l'excluait |
| `accepts_privacy_policy` et `device_name` à l'inscription et à la connexion | Écran G-03 ; nom du jeton Sanctum |
| `request_id` dans chaque réponse de recommandation | Le feedback (`/recommendations/{id}/feedback`) a besoin d'un identifiant que le modèle de données ne prévoyait pas |
| `breakdown`, `broadened`, `is_anchor`, `computed_offline` | Écran C-06 (répartition des points), élargissement annoncé (§8.2 du design system), mise en avant de la pièce de départ |
| `explanation` sur les règles occasion/style | Texte des remarques affiché tel quel |
| `pairs_well_with_color_ids` et `example_color_ids` dans le guide | Écran F-02 (neutres compatibles, exemples) |

## Questions ouvertes

1. **Identifiants publics** : bigint ou UUID ? Le mobile accepte les deux. C'est à fixer avant les premières migrations.
2. **Superposition de pièces** : un look n'a qu'un seul haut, donc pas de « veste + chemise ». Faut-il un rôle `outer` en plus de `top` ?
3. **Suppressions synchronisées** : avec `updated_since`, comment le mobile apprend-il qu'un favori a été supprimé sur un autre appareil ? Il faudrait des enregistrements de suppression (`deleted_at`) ou une liste complète à chaque synchronisation.
4. **Stockage des `request_id`** : table `recommendation_requests`, ou identifiant signé sans stockage ?
5. **Cache HTTP** : `ETag` ou `Last-Modified` sur les routes du catalogue, pour que le mobile ne retélécharge que si `catalog_version` change ?
6. **Images** : les URL des données de départ (`images.herycia.example`) sont fictives. Quel stockage, et quelle URL pour les miniatures ?
7. **Rôles** : `roles` est une liste (`user`, `content_admin`, `super_admin`, `stylist`, `vendor`), ce qui prépare la phase 2. Ça vous convient ?

## Compte de démonstration du faux serveur

`demo@herycia.app` / `motdepasse123` : préférences, un favori et une composition enregistrée déjà présents.

## Régénérer les exemples

Après une modification du faux serveur :

```bash
UPDATE_API_EXAMPLES=1 flutter test test/mock_backend/api_examples_test.dart
```

Sans la variable, ce test échoue si les exemples ne correspondent plus au code.
