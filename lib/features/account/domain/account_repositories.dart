import 'account_models.dart';

abstract interface class AuthRepository {
  Future<AuthSession> register(RegisterRequest request);

  Future<AuthSession> login(LoginRequest request);

  Future<void> logout();

  Future<void> forgotPassword(String email);

  Future<void> resetPassword(ResetPasswordRequest request);

  Future<AppUser> me();

  Future<void> deleteAccount();
}

abstract interface class PreferencesRepository {
  Future<UserPreferences> get();

  Future<UserPreferences> update(UserPreferences preferences);
}
