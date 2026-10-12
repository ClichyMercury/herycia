import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:herycia/mock_backend/mock_backend.dart';
import 'package:herycia/mock_backend/mock_fixtures.dart';
import 'package:herycia/mock_backend/mock_http.dart';

const examplesDir = 'docs/api/examples';
const truncateAbove = 8;
const keptItems = 3;

class Example {
  const Example(this.name, this.title, this.method, this.path, {this.query = const {}, this.body, this.auth = false});

  final String name;
  final String title;
  final String method;
  final String path;
  final Map<String, String> query;
  final Object? body;
  final bool auth;
}

Object? truncate(Object? json) {
  if (json is List) {
    if (json.length <= truncateAbove) return [for (final e in json) truncate(e)];
    return [
      for (final e in json.take(keptItems)) truncate(e),
      '… ${json.length - keptItems} éléments supplémentaires (${json.length} au total)',
    ];
  }
  if (json is Map<String, dynamic>) return {for (final e in json.entries) e.key: truncate(e.value)};
  return json;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('exemples de l’API simulée à jour', () async {
    final backend = MockBackend(
      fixtures: await MockFixtures.load(rootBundle),
      clock: () => DateTime.utc(2026, 10, 12, 10),
    );
    String? token;
    const shirt = 2, trousers = 8, jeans = 9, sweater = 5, dress = 13, sneakers = 15, dressShoes = 17;
    const black = 1, white = 2, sky = 11, navy = 10, fuchsia = 19, orange = 24, purple = 20;
    const savedUuid = '6a1f4c2e-3b7d-4e8a-9c0b-5d6e7f8a9b0c';
    const newFavUuid = '3f2c1b4a-5d6e-4f70-8a9b-0c1d2e3f4a5b';

    final examples = <Example>[
      const Example('catalog-version', 'Version du catalogue et des règles', 'GET', '/catalog/version'),
      const Example('clothing-categories', 'Catégories', 'GET', '/clothing-categories'),
      const Example('clothing-types', 'Types d’une catégorie', 'GET', '/clothing-types', query: {'category_id': '1'}),
      const Example('colors', 'Palette', 'GET', '/colors'),
      const Example('styles', 'Styles', 'GET', '/styles'),
      const Example('occasions', 'Occasions', 'GET', '/occasions'),
      const Example('color-guide', 'Guide des couleurs', 'GET', '/color-guide'),
      const Example('color-pairing-rules', 'Règles de couleur (proposition)', 'GET', '/color-pairing-rules'),
      const Example('recommendation-rules', 'Règles occasion/style (proposition)', 'GET', '/recommendation-rules'),
      const Example('outfits-list', 'Looks publiés filtrés et paginés', 'GET', '/outfits',
          query: {'occasion_slug': 'work', 'per_page': '2'}),
      const Example('outfits-show', 'Détail d’un look', 'GET', '/outfits/1'),
      const Example('outfits-show-unpublished', 'Look non publié inaccessible', 'GET', '/outfits/19'),
      const Example('from-item', 'Mode A : partir d’une pièce', 'POST', '/recommendations/from-item', body: {
        'clothing_type_id': shirt,
        'color_id': sky,
        'occasion_slug': 'work',
        'limit': 5,
      }),
      const Example('from-item-broadened', 'Mode A avec élargissement progressif', 'POST', '/recommendations/from-item',
          body: {'clothing_type_id': 1, 'color_id': fuchsia, 'occasion_slug': 'ceremony', 'style_slug': 'elegant'}),
      const Example('from-item-validation-error', 'Erreur de validation', 'POST', '/recommendations/from-item',
          body: {'clothing_type_id': shirt, 'color_id': 999}),
      const Example('evaluate-outfit', 'Mode B : évaluer une tenue', 'POST', '/recommendations/evaluate-outfit', body: {
        'items': [
          {'clothing_type_id': trousers, 'color_id': navy, 'role': 'bottom'},
          {'clothing_type_id': shirt, 'color_id': white, 'role': 'top'},
          {'clothing_type_id': dressShoes, 'color_id': black, 'role': 'shoes'},
        ],
        'occasion_slug': 'work',
        'style_slug': 'classic',
      }),
      const Example('evaluate-outfit-structural', 'Évaluation avec erreurs structurelles', 'POST',
          '/recommendations/evaluate-outfit', body: {
        'items': [
          {'clothing_type_id': dress, 'color_id': navy, 'role': 'one_piece'},
          {'clothing_type_id': jeans, 'color_id': navy, 'role': 'bottom'},
        ],
      }),
      const Example('improve-outfit', 'Améliorations proposées', 'POST', '/recommendations/improve-outfit', body: {
        'items': [
          {'clothing_type_id': sweater, 'color_id': fuchsia, 'role': 'top'},
          {'clothing_type_id': jeans, 'color_id': orange, 'role': 'bottom'},
          {'clothing_type_id': sneakers, 'color_id': purple, 'role': 'shoes'},
        ],
        'occasion_slug': 'everyday',
      }),
      const Example('feedback', 'Feedback sur une recommandation', 'POST', '/recommendations/rec_000001/feedback',
          body: {'is_helpful': true, 'outfit_id': 1, 'comment': 'Très utile pour mon entretien.'}),
      const Example('auth-register', 'Inscription', 'POST', '/auth/register', body: {
        'name': 'Kofi',
        'email': 'kofi@example.com',
        'password': 'unmotdepasse',
        'password_confirmation': 'unmotdepasse',
        'accepts_privacy_policy': true,
        'device_name': 'iPhone de Kofi',
      }),
      const Example('auth-register-invalid', 'Inscription invalide', 'POST', '/auth/register', body: {
        'name': '',
        'email': 'demo@herycia.app',
        'password': 'court',
        'password_confirmation': 'autre',
      }),
      const Example('auth-login-invalid', 'Connexion refusée', 'POST', '/auth/login',
          body: {'email': 'demo@herycia.app', 'password': 'mauvais'}),
      const Example('auth-login', 'Connexion', 'POST', '/auth/login',
          body: {'email': 'demo@herycia.app', 'password': 'motdepasse123', 'device_name': 'Pixel 7'}),
      const Example('me', 'Profil connecté', 'GET', '/me', auth: true),
      const Example('me-unauthenticated', 'Sans jeton', 'GET', '/me'),
      const Example('favorites-list', 'Lister les favoris', 'GET', '/me/favorites', auth: true),
      const Example('favorites-create', 'Ajouter un look en favori', 'POST', '/me/favorites', auth: true,
          body: {'client_uuid': newFavUuid, 'outfit_id': 7}),
      const Example('favorites-create-again', 'Même client_uuid : idempotent (200)', 'POST', '/me/favorites',
          auth: true, body: {'client_uuid': newFavUuid, 'outfit_id': 7}),
      const Example('favorites-create-snapshot', 'Favori d’une composition personnelle', 'POST', '/me/favorites',
          auth: true, body: {
        'client_uuid': '9e8d7c6b-5a4f-4e3d-8c2b-1a0f9e8d7c6b',
        'snapshot': {
          'title': 'Ma tenue du samedi',
          'items': [
            {'clothing_type_id': 1, 'color_id': white, 'role': 'top'},
            {'clothing_type_id': jeans, 'color_id': navy, 'role': 'bottom'},
            {'clothing_type_id': sneakers, 'color_id': white, 'role': 'shoes'},
          ],
          'occasion_slug': 'everyday',
          'score': 88,
        },
      }),
      const Example('favorites-delete', 'Supprimer un favori par client_uuid', 'DELETE', '/me/favorites/$newFavUuid',
          auth: true),
      const Example('preferences-get', 'Lire les préférences', 'GET', '/me/preferences', auth: true),
      const Example('preferences-put', 'Modifier les préférences', 'PUT', '/me/preferences', auth: true, body: {
        'language': 'fr',
        'style_slugs': ['classic', 'elegant'],
        'occasion_slugs': ['work'],
        'theme': 'dark',
        'silhouette': 'broad',
      }),
      const Example('saved-outfits-list', 'Lister les compositions', 'GET', '/me/saved-outfits', auth: true),
      const Example('saved-outfits-create', 'Enregistrer une composition', 'POST', '/me/saved-outfits', auth: true,
          body: {
        'client_uuid': '1c2d3e4f-5a6b-4c7d-8e9f-0a1b2c3d4e5f',
        'title': 'Mariage de Léa',
        'composition': {
          'items': [
            {'clothing_type_id': dress, 'color_id': 18, 'role': 'one_piece'},
            {'clothing_type_id': dressShoes, 'color_id': 6, 'role': 'shoes'},
          ],
          'occasion_slug': 'ceremony',
          'style_slug': 'elegant',
        },
      }),
      const Example('saved-outfits-conflict', 'Conflit de synchronisation (409)', 'PUT', '/me/saved-outfits/$savedUuid',
          auth: true, body: {
        'title': 'Entretien jeudi (modifié hors ligne)',
        'composition': {
          'items': [
            {'clothing_type_id': shirt, 'color_id': white, 'role': 'top'},
            {'clothing_type_id': trousers, 'color_id': navy, 'role': 'bottom'},
            {'clothing_type_id': 16, 'color_id': 8, 'role': 'shoes'},
          ],
          'occasion_slug': 'work',
        },
        'base_updated_at': '2026-10-10T09:00:00Z',
      }),
      const Example('saved-outfits-update', 'Modifier une composition', 'PUT', '/me/saved-outfits/$savedUuid',
          auth: true, body: {
        'title': 'Entretien jeudi',
        'composition': {
          'items': [
            {'clothing_type_id': shirt, 'color_id': white, 'role': 'top'},
            {'clothing_type_id': trousers, 'color_id': navy, 'role': 'bottom'},
            {'clothing_type_id': 16, 'color_id': 8, 'role': 'shoes'},
          ],
          'occasion_slug': 'work',
        },
        'base_updated_at': '2026-10-11T10:00:00Z',
      }),
      const Example('saved-outfits-delete', 'Supprimer une composition', 'DELETE', '/me/saved-outfits/$savedUuid',
          auth: true),
      const Example('auth-forgot-password', 'Demande de réinitialisation', 'POST', '/auth/forgot-password',
          body: {'email': 'demo@herycia.app'}),
      const Example('auth-reset-password', 'Réinitialisation du mot de passe', 'POST', '/auth/reset-password', body: {
        'email': 'demo@herycia.app',
        'token': 'reset_0001',
        'password': 'nouveaumotdepasse',
        'password_confirmation': 'nouveaumotdepasse',
      }),
      const Example('auth-login-after-reset', 'Connexion avec le nouveau mot de passe', 'POST', '/auth/login',
          body: {'email': 'demo@herycia.app', 'password': 'nouveaumotdepasse'}),
      const Example('auth-logout', 'Déconnexion (révocation du jeton)', 'POST', '/auth/logout', auth: true),
      const Example('auth-login-kofi', 'Connexion du compte créé', 'POST', '/auth/login',
          body: {'email': 'kofi@example.com', 'password': 'unmotdepasse'}),
      const Example('me-delete', 'Suppression du compte', 'DELETE', '/me', auth: true),
    ];

    final update = Platform.environment['UPDATE_API_EXAMPLES'] == '1';
    final encoder = const JsonEncoder.withIndent('  ');
    final index = <Map<String, Object?>>[];
    final mismatches = <String>[];

    for (final (i, ex) in examples.indexed) {
      final response = backend.handle(MockRequest(
        method: ex.method,
        path: ex.path,
        query: ex.query,
        body: ex.body,
        bearerToken: ex.auth ? token : null,
      ));
      final body = response.body == null ? null : jsonDecode(jsonEncode(response.body));
      if (body is Map<String, dynamic> && body['data'] is Map<String, dynamic>) {
        final issued = (body['data'] as Map<String, dynamic>)['token'];
        if (issued is String) token = issued;
      }
      final fileName = '${(i + 1).toString().padLeft(2, '0')}-${ex.name}.json';
      final content = '${encoder.convert({
        'title': ex.title,
        'request': {
          'method': ex.method,
          'path': '/api/v1${ex.path}',
          if (ex.query.isNotEmpty) 'query': ex.query,
          if (ex.auth) 'headers': {'Authorization': 'Bearer <token>'},
          if (ex.body != null) 'body': ex.body,
        },
        'response': {'status': response.status, if (body != null) 'body': truncate(body)},
      })}\n';
      index.add({'file': fileName, 'title': ex.title, 'method': ex.method, 'path': '/api/v1${ex.path}', 'status': response.status});
      final file = File('$examplesDir/$fileName');
      if (update) {
        file
          ..createSync(recursive: true)
          ..writeAsStringSync(content);
      } else if (!file.existsSync() || file.readAsStringSync() != content) {
        mismatches.add(fileName);
      }
    }

    final indexFile = File('$examplesDir/index.json');
    final indexContent = '${encoder.convert(index)}\n';
    if (update) {
      indexFile.writeAsStringSync(indexContent);
    } else if (!indexFile.existsSync() || indexFile.readAsStringSync() != indexContent) {
      mismatches.add('index.json');
    }

    expect(
      mismatches,
      isEmpty,
      reason: 'Exemples obsolètes. Régénérez avec : UPDATE_API_EXAMPLES=1 flutter test test/mock_backend/api_examples_test.dart',
    );
  });
}
