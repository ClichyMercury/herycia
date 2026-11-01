import '../../../core/api/api_client.dart';
import '../../../core/api/api_exception.dart';
import '../domain/account_models.dart';
import '../domain/account_repositories.dart';

class ApiAuthRepository implements AuthRepository {
  const ApiAuthRepository(this.client, this.tokenStore);

  final ApiClient client;
  final TokenStore tokenStore;

  Future<AuthSession> _session(Future<Object?> call) async {
    final session = AuthSession.fromJson((await call).dataMap);
    await tokenStore.write(session.accessToken);
    return session;
  }

  @override
  Future<AuthSession> register(RegisterRequest request) =>
      _session(client.post('/auth/register', body: request.toJson()));

  @override
  Future<AuthSession> login(LoginRequest request) => _session(client.post('/auth/login', body: request.toJson()));

  @override
  Future<void> logout() async {
    try {
      await client.post('/auth/logout');
    } on ApiException {
      return;
    } on NetworkUnavailableException {
      return;
    } finally {
      await tokenStore.write(null);
    }
  }

  @override
  Future<void> forgotPassword(String email) => client.post('/auth/password/forgot', body: {'email': email});

  @override
  Future<void> resetPassword(ResetPasswordRequest request) =>
      client.post('/auth/password/reset', body: request.toJson());

  @override
  Future<AppUser> me() async => AppUser.fromJson((await client.get('/me')).dataMap);

  @override
  Future<AppUser> updateName(String name) async =>
      AppUser.fromJson((await client.patch('/me', body: {'name': name})).dataMap);

  @override
  Future<void> changePassword(ChangePasswordRequest request) async {
    final body = await client.put('/me/password', body: request.toJson());
    final data = body is Map<String, dynamic> ? body['data'] : null;
    await tokenStore.write(data is Map<String, dynamic> ? data['access_token'] as String? : null);
  }

  @override
  Future<void> deleteAccount(String password) async {
    await client.delete('/me', body: {'password': password});
    await tokenStore.write(null);
  }
}

class ApiPreferencesRepository implements PreferencesRepository {
  const ApiPreferencesRepository(this.client);

  final ApiClient client;

  @override
  Future<RemotePreferences> get() async => RemotePreferences.fromJson((await client.get('/me/preferences')).dataMap);

  @override
  Future<RemotePreferences> update(RemotePreferences preferences) async => RemotePreferences.fromJson(
        (await client.put('/me/preferences', body: preferences.toJson()..remove('updated_at'))).dataMap,
      );
}
