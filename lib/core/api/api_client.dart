abstract interface class ApiClient {
  static const basePath = '/api/v1';

  Future<Object?> get(String path, {Map<String, String>? query});

  Future<Object?> post(String path, {Object? body});

  Future<Object?> put(String path, {Object? body});

  Future<Object?> delete(String path);
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

extension ApiJson on Object? {
  Map<String, dynamic> get asMap => this! as Map<String, dynamic>;

  Map<String, dynamic> get dataMap => asMap['data'] as Map<String, dynamic>;

  List<Map<String, dynamic>> get dataList =>
      [for (final item in asMap['data'] as List<dynamic>) item as Map<String, dynamic>];
}
