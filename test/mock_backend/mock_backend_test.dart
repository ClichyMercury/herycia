import 'package:flutter_test/flutter_test.dart';
import 'package:herycia/mock_backend/mock_backend.dart';
import 'package:herycia/mock_backend/mock_fixtures.dart';
import 'package:herycia/mock_backend/mock_http.dart';

import '../helpers/mock_api.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockBackend backend;
  var now = DateTime.utc(2026, 10, 31, 10);

  setUp(() async {
    now = DateTime.utc(2026, 10, 31, 10);
    backend = MockBackend(fixtures: await MockApiHarness.fixtures(), clock: () => now);
  });

  MockResponse call(String method, String path, {Object? body, String? token, Map<String, String> query = const {}}) =>
      backend.handle(MockRequest(method: method, path: path, body: body, bearerToken: token, query: query));

  String login() => ((call('POST', '/auth/login', body: {
        'email': MockBackend.demoEmail,
        'password': MockBackend.demoPassword,
      }).body! as Map)['data'] as Map)['access_token'] as String;

  Map<String, dynamic> data(MockResponse r) => (r.body! as Map<String, dynamic>)['data'] as Map<String, dynamic>;

  test('route ou méthode inexistante : 404 NOT_FOUND au format du contrat', () {
    final r = call('PATCH', '/colors');
    expect(r.status, 404);
    expect(r.body, {'message': 'Ressource introuvable.', 'errors': <String, List<String>>{}, 'code': 'NOT_FOUND'});
  });

  test('jeton : 15 minutes, rotation au refresh, fenêtre de 14 jours depuis la connexion', () {
    final first = login();
    expect(call('GET', '/me', token: first).status, 200);
    now = now.add(const Duration(minutes: 16));
    expect(call('GET', '/me', token: first).status, 401);

    final second = data(call('POST', '/auth/refresh', token: first))['access_token'] as String;
    expect(call('GET', '/me', token: second).status, 200);
    expect(call('POST', '/auth/refresh', token: first).status, 401);

    now = now.add(const Duration(days: 15));
    expect(call('POST', '/auth/refresh', token: second).status, 401);
  });

  test('favoris : 201 puis 200 idempotent, suppression 204 idempotente, uuid inconnu 404', () {
    final token = login();
    const body = {'client_uuid': '7b0f3c2e-5d41-4f6a-9a3e-2c1d8e4b6a90', 'outfit_id': 'd25fd239-ab5b-57e4-8814-18c47815fd47'};
    expect(call('POST', '/me/favorites', body: body, token: token).status, 201);
    expect(call('POST', '/me/favorites', body: body, token: token).status, 200);
    expect(call('DELETE', '/me/favorites/${body['client_uuid']}', token: token).status, 204);
    expect(call('DELETE', '/me/favorites/${body['client_uuid']}', token: token).status, 204);
    expect(call('DELETE', '/me/favorites/c3a1e9d4-8b72-4a05-b6f1-9d2e7c4a5b13', token: token).status, 404);
    final restored = call('POST', '/me/favorites', body: body, token: token);
    expect(restored.status, 200);
    expect(data(restored)['id'], body['client_uuid']);
  });

  test('sync : pages avec has_more et curseur opaque, suppressions dans le delta', () {
    final token = login();
    for (var i = 0; i < 3; i++) {
      now = now.add(const Duration(seconds: 1));
      call('POST', '/me/favorites', token: token, body: {
        'client_uuid': '7b0f3c2e-5d41-4f6a-9a3e-00000000000$i',
        'snapshot': {
          'schema_version': 1,
          'title': 'Tenue $i',
          'catalog_version': 1,
          'items': [
            {
              'clothing_type': {'slug': 'chemise', 'name': 'Chemise'},
              'color': {'slug': 'blanc', 'name': 'Blanc', 'hex_code': '#FFFFFF'},
              'role': 'top',
              'is_required': true,
            },
          ],
        },
      });
    }
    final first = data(call('GET', '/me/sync', token: token, query: {'limit': '2'}));
    expect(first['changes'], hasLength(2));
    expect(first['has_more'], isTrue);
    final second = data(call('GET', '/me/sync', token: token, query: {'limit': '2', 'cursor': first['cursor'] as String}));
    expect(second['changes'], hasLength(1));
    expect(second['has_more'], isFalse);

    now = now.add(const Duration(seconds: 1));
    call('DELETE', '/me/favorites/7b0f3c2e-5d41-4f6a-9a3e-000000000000', token: token);
    final delta = data(call('GET', '/me/sync', token: token, query: {'cursor': second['cursor'] as String}));
    expect((delta['changes'] as List).single, containsPair('op', 'delete'));
    expect(call('GET', '/me/sync', token: token, query: {'cursor': 'pas-un-curseur'}).status, 422);
  });

  test('pagination : per_page hors bornes refusé en 422', () {
    expect(call('GET', '/outfits', query: {'per_page': '51'}).status, 422);
    expect(call('GET', '/outfits', query: {'page': '9'}).status, 200);
  });

  test('mode A sans look adaptable : élargissement complet puis conseils neutres', () async {
    final f = await MockApiHarness.fixtures();
    backend = MockBackend(
      fixtures: MockFixtures(
        version: f.version,
        categories: f.categories,
        types: f.types,
        colors: f.colors,
        styles: f.styles,
        occasions: f.occasions,
        colorGuide: f.colorGuide,
        outfits: const [],
      ),
      clock: () => now,
    );
    final r = data(call('POST', '/recommendations/from-item', body: {
      'clothing_type_id': 'f9c84ba6-8813-5dc9-84be-bf8a5c4e0521',
      'color_id': '0491898d-fc0d-51ca-9b9f-e2cdadf5a975',
      'occasion_slug': 'ceremonie',
      'style_slug': 'classique',
    }));
    expect(r['results'], isEmpty);
    expect((r['broadened'] as Map)['steps'], ['style', 'occasion', 'neutral_advice']);
    expect(r['filters'], {'occasion_slug': null, 'style_slug': null});
    expect((r['advice'] as List).single, containsPair('color_ids', isNotEmpty));
  });
}
