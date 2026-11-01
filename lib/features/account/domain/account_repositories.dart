import 'account_models.dart';

abstract interface class AuthRepository {
  Future<AuthSession> register(RegisterRequest request);

  Future<AuthSession> login(LoginRequest request);

  Future<void> logout();

  Future<void> forgotPassword(String email);

  Future<void> resetPassword(ResetPasswordRequest request);

  Future<AppUser> me();

  Future<AppUser> updateName(String name);

  Future<void> changePassword(ChangePasswordRequest request);

  Future<void> deleteAccount(String password);
}

abstract interface class PreferencesRepository {
  Future<RemotePreferences> get();

  Future<RemotePreferences> update(RemotePreferences preferences);
}
