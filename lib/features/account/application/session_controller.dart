import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/api/api_exception.dart';
import '../../../core/api/api_providers.dart';
import '../domain/account_models.dart';
import 'account_providers.dart';

class SessionController extends AsyncNotifier<AppUser?> {
  @override
  Future<AppUser?> build() async {
    final token = await ref.watch(tokenStoreProvider).read();
    if (token == null) return null;
    try {
      return await ref.watch(authRepositoryProvider).me();
    } on ApiException catch (e) {
      if (e.code == ApiErrorCode.unauthenticated) {
        await ref.read(tokenStoreProvider).write(null);
        return null;
      }
      rethrow;
    } on NetworkUnavailableException {
      return null;
    }
  }

  Future<AppUser> login(String email, String password) async {
    final session = await ref.read(authRepositoryProvider).login(LoginRequest(email: email.trim(), password: password));
    state = AsyncData(session.user);
    return session.user;
  }

  Future<AppUser> register({
    required String name,
    required String email,
    required String password,
    required bool acceptsPrivacyPolicy,
  }) async {
    final session = await ref.read(authRepositoryProvider).register(RegisterRequest(
          name: name.trim(),
          email: email.trim(),
          password: password,
          passwordConfirmation: password,
          acceptsPrivacyPolicy: acceptsPrivacyPolicy,
        ));
    state = AsyncData(session.user);
    return session.user;
  }

  Future<void> logout() async {
    await ref.read(authRepositoryProvider).logout();
    state = const AsyncData(null);
  }

  Future<void> deleteAccount() async {
    await ref.read(authRepositoryProvider).deleteAccount();
    state = const AsyncData(null);
  }
}

final sessionProvider = AsyncNotifierProvider<SessionController, AppUser?>(SessionController.new);

final isSignedInProvider = Provider<bool>((ref) => ref.watch(sessionProvider).value != null);
