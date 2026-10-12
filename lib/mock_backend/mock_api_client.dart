import 'dart:convert';

import 'package:flutter/services.dart';

import '../core/api/api_client.dart';
import '../core/api/api_exception.dart';
import 'mock_backend.dart';
import 'mock_fixtures.dart';
import 'mock_http.dart';

class MockApiClient implements ApiClient {
  MockApiClient({
    required Future<MockBackend> Function() backend,
    required this.tokenStore,
    this.latency = const Duration(milliseconds: 350),
  }) : _loadBackend = backend;

  factory MockApiClient.fromBundle(
    AssetBundle bundle, {
    required TokenStore tokenStore,
    Duration latency = const Duration(milliseconds: 350),
    DateTime Function()? clock,
  }) =>
      MockApiClient(
        backend: () async => MockBackend(fixtures: await MockFixtures.load(bundle), clock: clock),
        tokenStore: tokenStore,
        latency: latency,
      );

  final Future<MockBackend> Function() _loadBackend;
  final TokenStore tokenStore;
  final Duration latency;
  Future<MockBackend>? _backend;

  bool offline = false;

  Future<MockBackend> get backend => _backend ??= _loadBackend();

  Future<Object?> _send(String method, String path, {Map<String, String>? query, Object? body}) async {
    if (latency > Duration.zero) await Future<void>.delayed(latency);
    if (offline) throw const NetworkUnavailableException();
    final server = await backend;
    final response = server.handle(MockRequest(
      method: method,
      path: path,
      query: query ?? const {},
      body: body == null ? null : jsonDecode(jsonEncode(body)),
      bearerToken: await tokenStore.read(),
    ));
    final decoded = response.body == null ? null : jsonDecode(jsonEncode(response.body));
    if (response.status >= 400) throw ApiException.fromResponse(response.status, decoded);
    return decoded;
  }

  @override
  Future<Object?> get(String path, {Map<String, String>? query}) => _send('GET', path, query: query);

  @override
  Future<Object?> post(String path, {Object? body}) => _send('POST', path, body: body);

  @override
  Future<Object?> put(String path, {Object? body}) => _send('PUT', path, body: body);

  @override
  Future<Object?> delete(String path) => _send('DELETE', path);
}
