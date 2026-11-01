abstract final class Env {
  static const prodApiBaseUrl = 'https://hery.mikoha.com/api/v1';

  static const _apiBaseUrl = String.fromEnvironment('API_BASE_URL');

  static const useMockApi = bool.fromEnvironment('USE_MOCK_API');

  static String get apiBaseUrl => _apiBaseUrl.isNotEmpty ? _apiBaseUrl : prodApiBaseUrl;
}
