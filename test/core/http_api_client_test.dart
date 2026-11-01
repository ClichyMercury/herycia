import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:herycia/core/api/api_client.dart';
import 'package:herycia/core/api/api_exception.dart';

class ScriptedTransport implements ApiTransport {
  ScriptedTransport(this.handler);

  final FutureOr<ApiResponse> Function(ApiRequest request) handler;
  final List<ApiRequest> requests = [];

  int count(String path) => requests.where((r) => r.path == path).length;

  @override
  Future<ApiResponse> send(ApiRequest request) async {
    requests.add(request);
    return handler(request);
  }
}

ApiResponse unauthorized() =>
    const ApiResponse(401, {'message': 'Authentification requise.', 'errors': {}, 'code': 'UNAUTHENTICATED'});

ApiResponse refreshed(String token) => ApiResponse(200, {
      'data': {'access_token': token, 'token_type': 'Bearer', 'expires_in': 900},
    });

void main() {
  late InMemoryTokenStore tokens;

  setUp(() async {
    tokens = InMemoryTokenStore();
    await tokens.write('old');
  });

  test('un 401 déclenche un refresh puis rejoue une seule fois avec le nouveau jeton', () async {
    final transport = ScriptedTransport((r) {
      if (r.path == '/auth/refresh') return refreshed('new');
      return r.bearerToken == 'new' ? const ApiResponse(200, {'data': 'ok'}) : unauthorized();
    });
    final client = HttpApiClient(transport, tokens);

    expect(await client.get('/me'), {'data': 'ok'});
    expect(await tokens.read(), 'new');
    expect(transport.requests.map((r) => (r.path, r.bearerToken)), [
      ('/me', 'old'),
      ('/auth/refresh', 'old'),
      ('/me', 'new'),
    ]);
  });

  test('des 401 simultanés ne lancent qu’un seul refresh', () async {
    final gate = Completer<void>();
    final transport = ScriptedTransport((r) async {
      if (r.path == '/auth/refresh') {
        await gate.future;
        return refreshed('new');
      }
      return r.bearerToken == 'new' ? ApiResponse(200, {'data': r.path}) : unauthorized();
    });
    final client = HttpApiClient(transport, tokens);

    final calls = [client.get('/me'), client.get('/me/preferences'), client.get('/me/sync')];
    await Future<void>.delayed(Duration.zero);
    gate.complete();

    expect(await Future.wait(calls), [
      {'data': '/me'},
      {'data': '/me/preferences'},
      {'data': '/me/sync'},
    ]);
    expect(transport.count('/auth/refresh'), 1);
  });

  test('un rejeu qui échoue encore en 401 ne relance pas de refresh', () async {
    final transport = ScriptedTransport((r) => r.path == '/auth/refresh' ? refreshed('new') : unauthorized());
    final client = HttpApiClient(transport, tokens);

    await expectLater(
      client.get('/me'),
      throwsA(isA<ApiException>().having((e) => e.code, 'code', ApiErrorCode.unauthenticated)),
    );
    expect(transport.count('/auth/refresh'), 1);
    expect(transport.count('/me'), 2);
  });

  test('refresh refusé : jeton purgé et session expirée signalée', () async {
    final transport = ScriptedTransport((_) => unauthorized());
    final client = HttpApiClient(transport, tokens);
    final expired = expectLater(client.sessionExpired, emits(null));

    await expectLater(client.get('/me/favorites'), throwsA(isA<ApiException>()));
    await expired;
    expect(await tokens.read(), isNull);
  });

  test('refresh impossible faute de réseau : le jeton est conservé', () async {
    final transport = ScriptedTransport((r) {
      if (r.path == '/auth/refresh') throw const NetworkUnavailableException();
      return unauthorized();
    });
    final client = HttpApiClient(transport, tokens);

    await expectLater(client.get('/me'), throwsA(isA<NetworkUnavailableException>()));
    expect(await tokens.read(), 'old');
  });

  test('si un autre appel a déjà renouvelé le jeton, on rejoue sans refresh', () async {
    late ScriptedTransport transport;
    transport = ScriptedTransport((r) async {
      if (r.bearerToken == 'old') {
        await tokens.write('fresh');
        return unauthorized();
      }
      return const ApiResponse(200, {'data': 'ok'});
    });
    final client = HttpApiClient(transport, tokens);

    expect(await client.get('/me'), {'data': 'ok'});
    expect(transport.count('/auth/refresh'), 0);
  });

  test('pas de refresh sur les routes d’identifiants : 401 = identifiants invalides', () async {
    final transport = ScriptedTransport((_) => unauthorized());
    final client = HttpApiClient(transport, tokens);

    await expectLater(client.post('/auth/login', body: {'email': 'a@b.fr', 'password': 'x'}), throwsA(isA<ApiException>()));
    expect(transport.count('/auth/refresh'), 0);
    expect(await tokens.read(), 'old');
  });

  test('429 : le délai Retry-After est transmis', () async {
    final transport = ScriptedTransport(
      (_) => const ApiResponse(429, {'message': 'Trop de requêtes.', 'errors': {}, 'code': 'RATE_LIMITED'}, Duration(seconds: 42)),
    );
    final client = HttpApiClient(transport, tokens);

    await expectLater(
      client.post('/auth/password/forgot', body: {'email': 'a@b.fr'}),
      throwsA(isA<ApiException>()
          .having((e) => e.code, 'code', ApiErrorCode.rateLimited)
          .having((e) => e.retryAfter, 'retryAfter', const Duration(seconds: 42))),
    );
  });

  test('mode hors ligne simulé : NetworkUnavailableException et état réseau à faux', () async {
    final transport = ScriptedTransport((_) => const ApiResponse(200, {'data': 'ok'}));
    final client = HttpApiClient(transport, tokens)..simulateOffline = true;
    final reach = expectLater(client.reachability, emits(false));

    await expectLater(client.get('/colors'), throwsA(isA<NetworkUnavailableException>()));
    await reach;
    expect(transport.requests, isEmpty);
  });

  group('ApiException', () {
    test('lit le format d’erreur du contrat, champs imbriqués compris', () {
      final e = ApiException.fromResponse(422, {
        'message': 'Les données fournies sont invalides.',
        'errors': {
          'items.1.color_id': ["La couleur sélectionnée n'est pas disponible."],
        },
        'code': 'VALIDATION_ERROR',
      });
      expect(e.code, ApiErrorCode.validation);
      expect(e.isTerminal, isTrue);
      expect(e.firstErrorFor('items.1.color_id'), "La couleur sélectionnée n'est pas disponible.");
    });

    test('code absent : déduit du statut ; 419 traité comme 401', () {
      expect(ApiException.fromResponse(419, null).code, ApiErrorCode.unauthenticated);
      expect(ApiException.fromResponse(410, null).code, ApiErrorCode.cursorExpired);
      expect(ApiException.fromResponse(502, {'code': 'BIZARRE'}).code, ApiErrorCode.internal);
      expect(ApiException.fromResponse(413, null).code, ApiErrorCode.validation);
    });
  });
}
