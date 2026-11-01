import 'dart:async';
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/api/api_exception.dart';
import '../../../core/api/api_providers.dart';
import '../../../core/storage/storage_providers.dart';
import '../domain/account_models.dart';
import 'account_providers.dart';

class SessionController extends AsyncNotifier<AppUser?> {
  static const _userKey = 'session_user';

  Future<void> _remember(AppUser? user) =>
      ref.read(appDatabaseProvider).writeValue(_userKey, user == null ? null : jsonEncode(user.toJson()));

  @override
  Future<AppUser?> build() async {
    final expired = ref.watch(apiClientProvider).sessionExpired.listen((_) => _expire());
    ref.onDispose(expired.cancel);
    final token = await ref.watch(tokenStoreProvider).read();
    if (token == null) return null;
    try {
      final user = await ref.watch(authRepositoryProvider).me();
      await _remember(user);
      return user;
    } on ApiException catch (e) {
      if (e.code == ApiErrorCode.unauthenticated) {
        await ref.read(tokenStoreProvider).write(null);
        return null;
      }
      return _rememberedUser();
    } on NetworkUnavailableException {
      return _rememberedUser();
    }
  }

  Future<AppUser?> _rememberedUser() async {
    final raw = await ref.read(appDatabaseProvider).readValue(_userKey);
    return raw == null ? null : AppUser.fromJson(jsonDecode(raw) as Map<String, dynamic>);
  }

  void _expire() {
    if (state.value == null) return;
    ref.read(sessionExpiredProvider.notifier).set(true);
    state = const AsyncData(null);
  }

  Future<AppUser> _signedIn(AuthSession session) async {
    final user = session.user ?? await ref.read(authRepositoryProvider).me();
    await _remember(user);
    ref.read(sessionExpiredProvider.notifier).set(false);
    state = AsyncData(user);
    return user;
  }

  Future<AppUser> login(String email, String password) async =>
      _signedIn(await ref.read(authRepositoryProvider).login(LoginRequest(email: email.trim(), password: password)));

  Future<AppUser> register({required String name, required String email, required String password}) async =>
      _signedIn(await ref.read(authRepositoryProvider).register(RegisterRequest(
            name: name.trim(),
            email: email.trim(),
            password: password,
            passwordConfirmation: password,
          )));

  Future<void> updateName(String name) async {
    final user = await ref.read(authRepositoryProvider).updateName(name.trim());
    await _remember(user);
    state = AsyncData(user);
  }

  Future<void> changePassword({required String current, required String password}) async {
    await ref.read(authRepositoryProvider).changePassword(ChangePasswordRequest(
          currentPassword: current,
          password: password,
          passwordConfirmation: password,
        ));
    if (await ref.read(tokenStoreProvider).read() == null) _expire();
  }

  Future<void> logout() async {
    await ref.read(authRepositoryProvider).logout();
    await _remember(null);
    state = const AsyncData(null);
  }

  Future<void> deleteAccount(String password) async {
    await ref.read(authRepositoryProvider).deleteAccount(password);
    await _remember(null);
    state = const AsyncData(null);
  }
}

final sessionProvider = AsyncNotifierProvider<SessionController, AppUser?>(SessionController.new);

final isSignedInProvider = Provider<bool>((ref) => ref.watch(sessionProvider).value != null);

class SessionExpired extends Notifier<bool> {
  @override
  bool build() => false;

  void set(bool value) => state = value;
}

final sessionExpiredProvider = NotifierProvider<SessionExpired, bool>(SessionExpired.new);
