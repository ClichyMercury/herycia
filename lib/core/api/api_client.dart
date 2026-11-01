import 'dart:async';

import 'api_exception.dart';

class ApiRequest {
  const ApiRequest({
    required this.method,
    required this.path,
    this.query = const {},
    this.body,
    this.bearerToken,
  });

  final String method;
  final String path;
  final Map<String, String> query;
  final Object? body;
  final String? bearerToken;

  ApiRequest withToken(String? token) =>
      ApiRequest(method: method, path: path, query: query, body: body, bearerToken: token);
}

class ApiResponse {
  const ApiResponse(this.status, [this.body, this.retryAfter]);

  final int status;
  final Object? body;
  final Duration? retryAfter;

  bool get isSuccess => status >= 200 && status < 300;
}

abstract interface class ApiTransport {
  Future<ApiResponse> send(ApiRequest request);
}

abstract interface class TokenStore {
  Future<String?> read();

  Future<void> write(String? token);
}

class InMemoryTokenStore implements TokenStore {
  String? _token;

  @override
  Future<String?> read() async => _token;

  @override
  Future<void> write(String? token) async => _token = token;
}

abstract interface class ApiClient {
  Future<Object?> get(String path, {Map<String, String>? query});

  Future<Object?> post(String path, {Object? body});

  Future<Object?> put(String path, {Object? body});

  Future<Object?> patch(String path, {Object? body});

  Future<Object?> delete(String path, {Object? body});

  Stream<void> get sessionExpired;

  Stream<bool> get reachability;

  bool get simulateOffline;

  set simulateOffline(bool value);
}

class HttpApiClient implements ApiClient {
  HttpApiClient(this.transport, this.tokenStore);

  static const refreshPath = '/auth/refresh';

  static const _credentialPaths = {
    '/auth/login',
    '/auth/register',
    '/auth/password/forgot',
    '/auth/password/reset',
    '/auth/logout',
    refreshPath,
  };

  final ApiTransport transport;
  final TokenStore tokenStore;
  final _sessionExpired = StreamController<void>.broadcast();
  final _reachability = StreamController<bool>.broadcast();
  Future<String?>? _refreshing;

  @override
  bool simulateOffline = false;

  @override
  Stream<void> get sessionExpired => _sessionExpired.stream;

  @override
  Stream<bool> get reachability => _reachability.stream;

  @override
  Future<Object?> get(String path, {Map<String, String>? query}) =>
      _call(ApiRequest(method: 'GET', path: path, query: query ?? const {}));

  @override
  Future<Object?> post(String path, {Object? body}) => _call(ApiRequest(method: 'POST', path: path, body: body));

  @override
  Future<Object?> put(String path, {Object? body}) => _call(ApiRequest(method: 'PUT', path: path, body: body));

  @override
  Future<Object?> patch(String path, {Object? body}) => _call(ApiRequest(method: 'PATCH', path: path, body: body));

  @override
  Future<Object?> delete(String path, {Object? body}) =>
      _call(ApiRequest(method: 'DELETE', path: path, body: body));

  Future<ApiResponse> _send(ApiRequest request) async {
    if (simulateOffline) {
      _reachability.add(false);
      throw const NetworkUnavailableException();
    }
    try {
      final response = await transport.send(request);
      _reachability.add(true);
      return response;
    } on NetworkUnavailableException {
      _reachability.add(false);
      rethrow;
    }
  }

  Future<Object?> _call(ApiRequest request) async {
    final token = await tokenStore.read();
    var response = await _send(request.withToken(token));
    if (response.status == 401 && token != null && !_credentialPaths.contains(request.path)) {
      final fresh = await _freshToken(token);
      if (fresh != null) response = await _send(request.withToken(fresh));
    }
    if (!response.isSuccess) {
      throw ApiException.fromResponse(response.status, response.body, retryAfter: response.retryAfter);
    }
    return response.body;
  }

  Future<String?> _freshToken(String rejected) async {
    final current = await tokenStore.read();
    if (current != null && current != rejected) return current;
    if (current == null) return null;
    return _refreshing ??= _refresh(rejected).whenComplete(() => _refreshing = null);
  }

  Future<String?> _refresh(String rejected) async {
    final response = await _send(ApiRequest(method: 'POST', path: refreshPath, bearerToken: rejected));
    if (response.status == 401 || response.status == 419) {
      await tokenStore.write(null);
      _sessionExpired.add(null);
      return null;
    }
    if (!response.isSuccess) {
      throw ApiException.fromResponse(response.status, response.body, retryAfter: response.retryAfter);
    }
    final token = (response.body.dataMap)['access_token'] as String;
    await tokenStore.write(token);
    return token;
  }
}

extension ApiJson on Object? {
  Map<String, dynamic> get asMap => this! as Map<String, dynamic>;

  Map<String, dynamic> get dataMap => asMap['data'] as Map<String, dynamic>;

  List<Map<String, dynamic>> get dataList =>
      [for (final item in asMap['data'] as List<dynamic>) item as Map<String, dynamic>];
}
