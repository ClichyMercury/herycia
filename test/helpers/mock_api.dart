import 'package:flutter/services.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:herycia/core/api/api_client.dart';
import 'package:herycia/core/api/api_providers.dart';
import 'package:herycia/mock_backend/mock_api_client.dart';
import 'package:herycia/mock_backend/mock_backend.dart';
import 'package:herycia/mock_backend/mock_fixtures.dart';

class MockApiHarness {
  MockApiHarness(MockFixtures fixtures, {DateTime Function()? clock})
      : backend = MockBackend(fixtures: fixtures, clock: clock ?? () => DateTime.utc(2026, 10, 12, 10)) {
    client = MockApiClient(backend: () async => backend, tokenStore: tokens, latency: Duration.zero);
  }

  static MockFixtures? _fixtures;

  static Future<MockFixtures> fixtures() async => _fixtures ??= await MockFixtures.load(rootBundle);

  final MockBackend backend;
  final InMemoryTokenStore tokens = InMemoryTokenStore();
  late final MockApiClient client;

  List<Override> get overrides => [apiClientProvider.overrideWithValue(client)];
}
