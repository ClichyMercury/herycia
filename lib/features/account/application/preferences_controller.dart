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

  Future<void> _writeLocal(UserPreferences prefs, {required bool pending}) async {
    final db = ref.read(appDatabaseProvider);
    await db.writeValue(_key, jsonEncode(prefs.toJson()));
    await db.writeValue(_pendingKey, pending ? '1' : null);
  }

  @override
  Future<UserPreferences> build() async {
    final signedIn = ref.watch(isSignedInProvider);
    final local = await _readLocal();
    if (!signedIn) return local;
    final repo = ref.read(preferencesRepositoryProvider);
    try {
      final pending = await ref.read(appDatabaseProvider).readValue(_pendingKey) != null;
      if (pending) {
        final pushed = await repo.update(local);
        await _writeLocal(pushed, pending: false);
        return pushed;
      }
      final remote = await repo.get();
      final remoteIsNewer = remote.updatedAt != null &&
          (local.updatedAt == null || remote.updatedAt!.isAfter(local.updatedAt!));
      if (remoteIsNewer) {
        await _writeLocal(remote, pending: false);
        return remote;
      }
      if (local.updatedAt != null) {
        final pushed = await repo.update(local);
        await _writeLocal(pushed, pending: false);
        return pushed;
      }
      return remote;
    } on NetworkUnavailableException {
      return local;
    } on ApiException {
      return local;
    }
  }

  Future<void> save(UserPreferences prefs) async {
    final updated = prefs.copyWith(updatedAt: clock());
    state = AsyncData(updated);
    await _writeLocal(updated, pending: ref.read(isSignedInProvider));
    if (!ref.read(isSignedInProvider)) return;
    try {
      final pushed = await ref.read(preferencesRepositoryProvider).update(updated);
      await _writeLocal(pushed, pending: false);
      state = AsyncData(pushed);
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

final preferencesProvider = AsyncNotifierProvider<PreferencesController, UserPreferences>(PreferencesController.new);
