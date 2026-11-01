# API Herycia côté mobile

L'app parle à l'API Laravel de Banh, déployée sur `https://hery.mikoha.com/api/v1`.

## Références

| Source | Rôle |
|---|---|
| [hery.mikoha.com/docs](https://hery.mikoha.com/docs) | Schéma OpenAPI 3.1 du serveur. **Il fait foi** en cas de divergence. |
| [integration-mobile.md](integration-mobile.md) | Guide du serveur pour le mobile (version 1.1 du 2026-10-16) : refresh JWT, synchronisation hors ligne, cache, conduite par code d'erreur. |
| [../../test/fixtures/](../../test/fixtures/) | Réponses réelles enregistrées le 2026-10-31 ; [test/contract/server_contract_test.dart](../../test/contract/server_contract_test.dart) vérifie que nos modèles les lisent sans perte. |

## Choisir le serveur

| Commande | Serveur |
|---|---|
| `flutter run` | API réelle (`https://hery.mikoha.com/api/v1`) |
| `flutter run --dart-define=API_BASE_URL=http://localhost:8000/api/v1` | API locale de Banh |
| `flutter run --dart-define=USE_MOCK_API=true` | Faux serveur intégré (hors connexion, compte démo `demo@herycia.app` / `motdepasse123`, code OTP `123456`) |

Le faux serveur ([lib/mock_backend/](../../lib/mock_backend/)) suit le même contrat que le vrai : mêmes routes, enveloppes, codes d'erreur, jeton de 15 minutes avec refresh rotatif, `/me/sync` avec curseur et pierres tombales, règle d'un seul favori actif par look. Il sert de base aux tests de widgets et de parcours. Son moteur de recommandation est volontairement simplifié : seule l'API réelle calcule les vrais scores.

## Choix de l'app

- **Session** : un seul composant ([HttpApiClient](../../lib/core/api/api_client.dart)) ajoute le Bearer, sérialise les refresh (un seul à la fois), rejoue une seule fois, purge le jeton et affiche « Session expirée » si le refresh est refusé. Jeton dans Keychain / Keystore uniquement.
- **Catalogue** : en cache Drift, revalidé par `/catalog/version` au plus une fois par heure ; remplacé quand la version change.
- **Looks et recommandations** : réseau d'abord ; hors ligne, la dernière réponse reçue pour la même requête est réaffichée avec sa date (« Résultat du …, hors ligne »). Sans réponse en cache, le mode A affiche les associations du guide des couleurs, sans score. Aucun calcul local n'est présenté comme venant du moteur (§7.6).
- **Favoris et compositions** : local d'abord (Drift), file d'opérations fusionnée par `client_uuid`, envoi puis `/me/sync`. Gère A-37 (uuid remplacé), 404 sur `PUT` (restauration par `POST`), `410` (synchronisation complète puis réconciliation), 422 terminal (état « échec »).
- **Préférences** : styles et occasions synchronisés par identifiant ; thème et silhouette restent sur l'appareil. À la première connexion, les préférences locales sont envoyées si le serveur n'en a pas.
- **Consentement à la politique de confidentialité** : enregistré sur l'appareil uniquement (le contrat n'a pas de champ pour cela).

## Écarts et questions pour Banh

1. Pas de champ de consentement RGPD à l'inscription : l'app le garde en local. À ajouter côté serveur si une preuve de consentement est nécessaire.
2. Seuls 4 looks de démonstration sont publiés : avec un filtre d'occasion ou de style, l'élargissement est presque toujours appliqué.
3. Seules 21 couleurs sur 42 ont des associations dans `/color-guide` ; le guide affiche « Pas encore d'association conseillée » pour les autres.
