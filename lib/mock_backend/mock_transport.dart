import 'dart:convert';

import 'package:flutter/services.dart';

import '../core/api/api_client.dart';
import 'mock_backend.dart';
import 'mock_fixtures.dart';
import 'mock_http.dart';

class MockTransport implements ApiTransport {
  MockTransport({
    required Future<MockBackend> Function() backend,
    this.latency = const Duration(milliseconds: 350),
  }) : _loadBackend = backend;

  factory MockTransport.fromBundle(AssetBundle bundle, {Duration latency = const Duration(milliseconds: 350)}) =>
      MockTransport(
        backend: () async => MockBackend(fixtures: await MockFixtures.load(bundle)),
        latency: latency,
      );

  final Future<MockBackend> Function() _loadBackend;
  final Duration latency;
  Future<MockBackend>? _backend;

  Future<MockBackend> get backend => _backend ??= _loadBackend();

  @override
  Future<ApiResponse> send(ApiRequest request) async {
    if (latency > Duration.zero) await Future<void>.delayed(latency);
    final server = await backend;
    final response = server.handle(MockRequest(
      method: request.method,
      path: request.path,
      query: request.query,
      body: request.body == null ? null : jsonDecode(jsonEncode(request.body)),
      bearerToken: request.bearerToken,
    ));
    return ApiResponse(
      response.status,
      response.body == null ? null : jsonDecode(jsonEncode(response.body)),
      response.retryAfterSeconds == null ? null : Duration(seconds: response.retryAfterSeconds!),
    );
  }
}
