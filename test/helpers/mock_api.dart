import 'package:flutter/services.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:herycia/core/api/api_client.dart';
import 'package:herycia/core/api/api_providers.dart';
import 'package:herycia/mock_backend/mock_backend.dart';
import 'package:herycia/mock_backend/mock_fixtures.dart';
import 'package:herycia/mock_backend/mock_transport.dart';

class MockApiHarness {
  MockApiHarness(MockFixtures fixtures, {DateTime Function()? clock})
      : backend = MockBackend(fixtures: fixtures, clock: clock ?? (() => DateTime.utc(2026, 10, 31, 10))) {
    transport = MockTransport(backend: () async => backend, latency: Duration.zero);
    client = HttpApiClient(transport, tokens);
  }

  static MockFixtures? _fixtures;

  static Future<MockFixtures> fixtures() async => _fixtures ??= await MockFixtures.load(rootBundle);

  final MockBackend backend;
  final InMemoryTokenStore tokens = InMemoryTokenStore();
  late final MockTransport transport;
  late final HttpApiClient client;

  List<Override> get overrides => [apiClientProvider.overrideWithValue(client)];

  Future<String> signIn({String email = MockBackend.demoEmail, String password = MockBackend.demoPassword}) async {
    final body = await client.post('/auth/login', body: {'email': email, 'password': password});
    final token = body.dataMap['access_token'] as String;
    await tokens.write(token);
    return token;
  }
}
