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
    await tokenStore.write(session.token);
    return session;
  }

  @override
  Future<AuthSession> register(RegisterRequest request) =>
      _session(client.post('/auth/register', body: request.toJson()));

  @override
  Future<AuthSession> login(LoginRequest request) =>
      _session(client.post('/auth/login', body: request.toJson()));

  @override
  Future<void> logout() async {
    try {
      await client.post('/auth/logout');
    } on ApiException catch (e) {
      if (e.code != ApiErrorCode.unauthenticated) rethrow;
    } finally {
      await tokenStore.write(null);
    }
  }

  @override
  Future<void> forgotPassword(String email) => client.post('/auth/forgot-password', body: {'email': email});

  @override
  Future<void> resetPassword(ResetPasswordRequest request) =>
      client.post('/auth/reset-password', body: request.toJson());

  @override
  Future<AppUser> me() async => AppUser.fromJson((await client.get('/me')).dataMap);

  @override
  Future<void> deleteAccount() async {
    await client.delete('/me');
    await tokenStore.write(null);
  }
}

class ApiPreferencesRepository implements PreferencesRepository {
  const ApiPreferencesRepository(this.client);

  final ApiClient client;

  @override
  Future<UserPreferences> get() async => UserPreferences.fromJson((await client.get('/me/preferences')).dataMap);

  @override
  Future<UserPreferences> update(UserPreferences preferences) async => UserPreferences.fromJson(
        (await client.put('/me/preferences', body: preferences.toJson()..remove('updated_at'))).dataMap,
      );
}
