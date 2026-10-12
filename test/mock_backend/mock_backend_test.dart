import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:herycia/mock_backend/mock_backend.dart';
import 'package:herycia/mock_backend/mock_fixtures.dart';
import 'package:herycia/mock_backend/mock_http.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockFixtures fixtures;
  late MockBackend backend;
  late DateTime now;

  setUpAll(() async => fixtures = await MockFixtures.load(rootBundle));

  setUp(() {
    now = DateTime.utc(2026, 10, 12, 10);
    backend = MockBackend(fixtures: fixtures, clock: () => now);
  });

  MockResponse call(String method, String path, {Object? body, String? token, Map<String, String> query = const {}}) =>
      backend.handle(MockRequest(method: method, path: path, body: body, bearerToken: token, query: query));

  Map<String, dynamic> json(MockResponse r) => r.body! as Map<String, dynamic>;

  String login([String email = MockBackend.demoEmail, String password = MockBackend.demoPassword]) {
    final r = call('POST', '/auth/login', body: {'email': email, 'password': password});
    expect(r.status, 200);
    return (json(r)['data'] as Map<String, dynamic>)['token'] as String;
  }

  String register(String email) {
    final r = call('POST', '/auth/register', body: {
      'name': 'Test',
      'email': email,
      'password': 'motdepasse',
      'password_confirmation': 'motdepasse',
      'accepts_privacy_policy': true,
    });
    expect(r.status, 201);
    return (json(r)['data'] as Map<String, dynamic>)['token'] as String;
  }

  group('Format d’erreur', () {
    test('route inconnue : 404 NOT_FOUND au format standard', () {
      final r = call('GET', '/nope');
      expect(r.status, 404);
      expect(json(r).keys, containsAll(['message', 'errors', 'code']));
      expect(json(r)['code'], 'NOT_FOUND');
    });

    test('validation : 422 VALIDATION_ERROR avec erreurs par champ', () {
      final r = call('POST', '/recommendations/from-item', body: {'clothing_type_id': 999});
      expect(r.status, 422);
      expect(json(r)['code'], 'VALIDATION_ERROR');
      final errors = json(r)['errors'] as Map<String, dynamic>;
      expect(errors.keys, containsAll(['clothing_type_id', 'color_id']));
    });

    test('rôle incohérent avec le type de vêtement refusé', () {
      final r = call('POST', '/recommendations/evaluate-outfit', body: {
        'items': [
          {'clothing_type_id': 2, 'color_id': 1, 'role': 'shoes'},
        ],
      });
      expect(r.status, 422);
      expect((json(r)['errors'] as Map<String, dynamic>).keys, contains('items.0.role'));
    });

    test('identifiants acceptés en entier ou en chaîne', () {
      final asInt = call('POST', '/recommendations/from-item', body: {'clothing_type_id': 2, 'color_id': 11});
      final asString = call('POST', '/recommendations/from-item', body: {'clothing_type_id': '2', 'color_id': '11'});
      expect(asInt.status, 200);
      expect(asString.status, 200);
    });
  });

  group('Catalogue et looks', () {
    test('looks : seulement les publiés, pagination cohérente', () {
      final r = call('GET', '/outfits', query: {'per_page': '5', 'page': '2'});
      final meta = json(r)['meta'] as Map<String, dynamic>;
      expect(meta['total'], fixtures.looks.where((l) => l.status.name == 'published').length);
      expect(meta['current_page'], 2);
      expect(meta['last_page'], ((meta['total'] as int) / 5).ceil());
      expect(json(r)['data'], hasLength(5));
    });

    test('filtres par occasion et style', () {
      final r = call('GET', '/outfits', query: {'occasion_slug': 'evening', 'style_slug': 'elegant'});
      final looks = json(r)['data'] as List<dynamic>;
      expect(looks, isNotEmpty);
      for (final look in looks.cast<Map<String, dynamic>>()) {
        expect(look['occasion_id'], 5);
        expect(look['style_id'], 4);
      }
    });

    test('slug inconnu ou per_page hors limites : 422', () {
      expect(call('GET', '/outfits', query: {'occasion_slug': 'plage'}).status, 422);
      expect(call('GET', '/outfits', query: {'per_page': '500'}).status, 422);
    });

    test('brouillon et archivé introuvables', () {
      expect(call('GET', '/outfits/19').status, 404);
      expect(call('GET', '/outfits/20').status, 404);
      expect(call('GET', '/outfits/1').status, 200);
    });

    test('types filtrés par catégorie', () {
      final types = json(call('GET', '/clothing-types', query: {'category_id': '3'}))['data'] as List<dynamic>;
      expect(types.map((t) => (t as Map<String, dynamic>)['slug']), ['dress', 'jumpsuit']);
    });
  });

  group('Authentification', () {
    test('inscription puis /me, e-mail normalisé', () {
      final token = register('Nouvelle@Example.com');
      final me = json(call('GET', '/me', token: token))['data'] as Map<String, dynamic>;
      expect(me['email'], 'nouvelle@example.com');
      expect(me['roles'], ['user']);
    });

    test('e-mail déjà utilisé, mot de passe court, politique non acceptée', () {
      final r = call('POST', '/auth/register', body: {
        'name': 'X',
        'email': MockBackend.demoEmail,
        'password': 'court',
        'password_confirmation': 'court',
      });
      final errors = json(r)['errors'] as Map<String, dynamic>;
      expect(errors.keys, containsAll(['email', 'password', 'accepts_privacy_policy']));
    });

    test('jeton expiré refusé', () {
      final token = login();
      now = now.add(MockBackend.tokenLifetime + const Duration(minutes: 1));
      expect(call('GET', '/me', token: token).status, 401);
    });

    test('déconnexion : le jeton est révoqué', () {
      final token = login();
      expect(call('POST', '/auth/logout', token: token).status, 204);
      expect(call('GET', '/me', token: token).status, 401);
    });

    test('limitation : 5 échecs par minute puis 429 RATE_LIMITED', () {
      for (var i = 0; i < MockBackend.maxLoginAttemptsPerMinute; i++) {
        expect(call('POST', '/auth/login', body: {'email': MockBackend.demoEmail, 'password': 'x'}).status, 422);
      }
      final blocked = call('POST', '/auth/login', body: {'email': MockBackend.demoEmail, 'password': MockBackend.demoPassword});
      expect(blocked.status, 429);
      expect(json(blocked)['code'], 'RATE_LIMITED');
      now = now.add(const Duration(minutes: 2));
      expect(call('POST', '/auth/login', body: {'email': MockBackend.demoEmail, 'password': MockBackend.demoPassword}).status, 200);
    });

    test('mot de passe oublié : même réponse que le compte existe ou non', () {
      final known = call('POST', '/auth/forgot-password', body: {'email': MockBackend.demoEmail});
      final unknown = call('POST', '/auth/forgot-password', body: {'email': 'personne@example.com'});
      expect(known.status, unknown.status);
      expect(json(known), json(unknown));
    });

    test('réinitialisation : révoque les sessions, mauvais jeton refusé', () {
      final session = login();
      call('POST', '/auth/forgot-password', body: {'email': MockBackend.demoEmail});
      final token = backend.resetTokens[MockBackend.demoEmail]!;
      final bad = call('POST', '/auth/reset-password', body: {
        'email': MockBackend.demoEmail,
        'token': 'faux',
        'password': 'nouveaumdp',
        'password_confirmation': 'nouveaumdp',
      });
      expect(bad.status, 422);
      final ok = call('POST', '/auth/reset-password', body: {
        'email': MockBackend.demoEmail,
        'token': token,
        'password': 'nouveaumdp',
        'password_confirmation': 'nouveaumdp',
      });
      expect(ok.status, 200);
      expect(call('GET', '/me', token: session).status, 401);
      login(MockBackend.demoEmail, 'nouveaumdp');
    });

    test('suppression du compte : données supprimées, feedback anonymisé', () {
      final token = login();
      final rec = json(call('POST', '/recommendations/from-item', body: {'clothing_type_id': 2, 'color_id': 11}));
      final requestId = (rec['data'] as Map<String, dynamic>)['request_id'];
      call('POST', '/recommendations/$requestId/feedback', body: {'is_helpful': true}, token: token);
      final userId = backend.feedback.single.userId;
      expect(userId, isNotNull);

      expect(call('DELETE', '/me', token: token).status, 204);
      expect(backend.users, isNot(contains(userId)));
      expect(backend.favorites, isNot(contains(userId)));
      expect(backend.savedOutfits, isNot(contains(userId)));
      expect(backend.feedback.single.userId, isNull);
      expect(call('POST', '/auth/login', body: {'email': MockBackend.demoEmail, 'password': MockBackend.demoPassword}).status, 422);
    });
  });

  group('Favoris', () {
    const uuid = 'aaaaaaaa-bbbb-4ccc-8ddd-eeeeeeeeeeee';

    test('authentification requise', () {
      expect(call('GET', '/me/favorites').status, 401);
    });

    test('synchronisation répétée sans doublon (client_uuid)', () {
      final token = login();
      final first = call('POST', '/me/favorites', body: {'client_uuid': uuid, 'outfit_id': 4}, token: token);
      final again = call('POST', '/me/favorites', body: {'client_uuid': uuid, 'outfit_id': 4}, token: token);
      expect(first.status, 201);
      expect(again.status, 200);
      expect(json(again)['data'], json(first)['data']);
      final list = json(call('GET', '/me/favorites', token: token))['data'] as List<dynamic>;
      expect(list.where((f) => (f as Map<String, dynamic>)['client_uuid'] == uuid), hasLength(1));
    });

    test('un favori de look embarque un instantané', () {
      final token = login();
      final r = call('POST', '/me/favorites', body: {'client_uuid': uuid, 'outfit_id': 4}, token: token);
      final snapshot = (json(r)['data'] as Map<String, dynamic>)['snapshot'] as Map<String, dynamic>;
      expect(snapshot['title'], 'Robe bordeaux de soirée');
      expect(snapshot['items'], isNotEmpty);
    });

    test('isolation stricte entre utilisateurs', () {
      final demo = login();
      final other = register('autre@example.com');
      call('POST', '/me/favorites', body: {'client_uuid': uuid, 'outfit_id': 4}, token: demo);
      final otherList = json(call('GET', '/me/favorites', token: other))['data'] as List<dynamic>;
      expect(otherList, isEmpty);
      expect(call('DELETE', '/me/favorites/$uuid', token: other).status, 404);
      expect(call('DELETE', '/me/favorites/$uuid', token: demo).status, 204);
    });

    test('ni look ni instantané : refusé ; look non publié : refusé ; UUID invalide : refusé', () {
      final token = login();
      expect(call('POST', '/me/favorites', body: {'client_uuid': uuid}, token: token).status, 422);
      expect(call('POST', '/me/favorites', body: {'client_uuid': uuid, 'outfit_id': 19}, token: token).status, 422);
      expect(call('POST', '/me/favorites', body: {'client_uuid': 'pas-un-uuid', 'outfit_id': 1}, token: token).status, 422);
    });

    test('instantané mal typé : 422 et non plantage', () {
      final token = login();
      final r = call('POST', '/me/favorites', token: token, body: {
        'client_uuid': uuid,
        'snapshot': {
          'title': 'Test',
          'items': [
            {'clothing_type_id': 1, 'color_id': 2, 'role': 'top'},
          ],
          'occasion_slug': 42,
          'score': 'beaucoup',
        },
      });
      expect(r.status, 422);
      expect((json(r)['errors'] as Map<String, dynamic>).keys, containsAll(['snapshot.occasion_slug', 'snapshot.score']));
    });

    test('updated_since ne renvoie que les favoris modifiés après la date', () {
      final token = login();
      now = now.add(const Duration(hours: 1));
      call('POST', '/me/favorites', body: {'client_uuid': uuid, 'outfit_id': 4}, token: token);
      final since = now.subtract(const Duration(minutes: 1)).toIso8601String();
      final list = json(call('GET', '/me/favorites', token: token, query: {'updated_since': since}))['data'] as List<dynamic>;
      expect(list, hasLength(1));
    });
  });

  group('Compositions enregistrées', () {
    const uuid = '6a1f4c2e-3b7d-4e8a-9c0b-5d6e7f8a9b0c';
    Map<String, dynamic> body(String title, {String? baseUpdatedAt}) => {
          'title': title,
          'composition': {
            'items': [
              {'clothing_type_id': 2, 'color_id': 2, 'role': 'top'},
              {'clothing_type_id': 8, 'color_id': 10, 'role': 'bottom'},
              {'clothing_type_id': 17, 'color_id': 1, 'role': 'shoes'},
            ],
          },
          'base_updated_at': ?baseUpdatedAt,
        };

    test('conflit 409 si la version serveur est plus récente, avec la version courante', () {
      final token = login();
      final r = call('PUT', '/me/saved-outfits/$uuid', body: body('Hors ligne', baseUpdatedAt: '2026-10-01T00:00:00Z'), token: token);
      expect(r.status, 409);
      expect(json(r)['code'], 'CONFLICT');
      expect((json(r)['current'] as Map<String, dynamic>)['client_uuid'], uuid);
    });

    test('le score est recalculé par le serveur, pas repris du client', () {
      final token = login();
      final r = call('PUT', '/me/saved-outfits/$uuid', body: {...body('Bureau'), 'score': 3}, token: token);
      expect(r.status, 200);
      expect((json(r)['data'] as Map<String, dynamic>)['score'], greaterThan(50));
    });
  });

  group('Feedback', () {
    test('identifiant de recommandation inconnu : 404', () {
      expect(call('POST', '/recommendations/rec_999999/feedback', body: {'is_helpful': false}).status, 404);
    });

    test('commentaire limité à 500 caractères', () {
      final rec = json(call('POST', '/recommendations/from-item', body: {'clothing_type_id': 2, 'color_id': 11}));
      final requestId = (rec['data'] as Map<String, dynamic>)['request_id'];
      final r = call('POST', '/recommendations/$requestId/feedback', body: {'is_helpful': true, 'comment': 'x' * 501});
      expect(r.status, 422);
    });

    test('feedback anonyme accepté', () {
      final rec = json(call('POST', '/recommendations/from-item', body: {'clothing_type_id': 2, 'color_id': 11}));
      final requestId = (rec['data'] as Map<String, dynamic>)['request_id'];
      expect(call('POST', '/recommendations/$requestId/feedback', body: {'is_helpful': false}).status, 201);
      expect(backend.feedback.single.userId, isNull);
    });
  });

  group('Préférences', () {
    test('valeurs par défaut pour un nouveau compte', () {
      final token = register('prefs@example.com');
      final prefs = json(call('GET', '/me/preferences', token: token))['data'] as Map<String, dynamic>;
      expect(prefs['language'], 'fr');
      expect(prefs['theme'], 'system');
      expect(prefs['silhouette'], 'straight');
    });

    test('slug, thème ou silhouette invalides refusés', () {
      final token = login();
      final r = call('PUT', '/me/preferences', token: token, body: {
        'style_slugs': ['inconnu'],
        'theme': 'rose',
        'silhouette': 'triangle',
      });
      expect((json(r)['errors'] as Map<String, dynamic>).keys, containsAll(['style_slugs.0', 'theme', 'silhouette']));
    });
  });
}
