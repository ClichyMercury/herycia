import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/api/api_exception.dart';
import '../../../core/storage/storage_providers.dart';
import '../domain/account_models.dart';
import 'account_providers.dart';
import 'session_controller.dart';

class PreferencesController extends AsyncNotifier<UserPreferences> {
  static const _key = 'preferences';
  static const _pendingKey = 'preferences_pending';

  DateTime Function() clock = () => DateTime.now().toUtc();

  Future<UserPreferences> _readLocal() async {
    final raw = await ref.read(appDatabaseProvider).readValue(_key);
    if (raw == null) return const UserPreferences();
    try {
      return UserPreferences.fromJson(jsonDecode(raw) as Map<String, dynamic>);
    } on FormatException {
      return const UserPreferences();
    }
  }

  Future<void> _writeLocal(UserPreferences prefs, {bool? pending}) async {
    final db = ref.read(appDatabaseProvider);
    await db.writeValue(_key, jsonEncode(prefs.toJson()));
    if (pending != null) await db.writeValue(_pendingKey, pending ? '1' : null);
  }

  Future<UserPreferences> _push(UserPreferences local) async {
    final pushed = await ref.read(preferencesRepositoryProvider).update(local.toRemote());
    final merged = local.withRemote(pushed);
    await _writeLocal(merged, pending: false);
    return merged;
  }

  @override
  Future<UserPreferences> build() async {
    final signedIn = ref.watch(isSignedInProvider);
    final local = await _readLocal();
    if (!signedIn) return local;
    try {
      final pending = await ref.read(appDatabaseProvider).readValue(_pendingKey) != null;
      if (pending) return await _push(local);
      final remote = await ref.read(preferencesRepositoryProvider).get();
      if (remote.updatedAt == null) return await _push(local);
      final merged = local.withRemote(remote);
      await _writeLocal(merged, pending: false);
      return merged;
    } on NetworkUnavailableException {
      return local;
    } on ApiException {
      return local;
    }
  }

  Future<void> save(UserPreferences prefs) async {
    final signedIn = ref.read(isSignedInProvider);
    final previous = state.value;
    final updated = prefs.copyWith(updatedAt: clock());
    state = AsyncData(updated);
    final remoteChanged = previous == null || previous.toRemote() != updated.toRemote();
    await _writeLocal(updated, pending: signedIn && remoteChanged ? true : null);
    if (!signedIn || !remoteChanged) return;
    try {
      state = AsyncData(await _push(updated));
    } on NetworkUnavailableException {
      return;
    } on ApiException {
      return;
    }
  }

  Future<void> change(UserPreferences Function(UserPreferences current) edit) async {
    final current = state.value ?? await future;
    await save(edit(current));
  }
}

const privacyConsentKey = 'privacy_accepted_at';

final preferencesProvider = AsyncNotifierProvider<PreferencesController, UserPreferences>(PreferencesController.new);
