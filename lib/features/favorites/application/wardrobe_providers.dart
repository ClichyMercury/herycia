import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/api/api_providers.dart';
import '../../../core/api/network_status.dart';
import '../../../core/storage/storage_providers.dart';
import '../../account/application/session_controller.dart';
import '../data/api_wardrobe_repositories.dart';
import '../domain/wardrobe_repositories.dart';
import 'wardrobe_sync.dart';

final favoritesRepositoryProvider = Provider<FavoritesRepository>(
  (ref) => ApiFavoritesRepository(ref.watch(apiClientProvider)),
);

final savedOutfitsRepositoryProvider = Provider<SavedOutfitsRepository>(
  (ref) => ApiSavedOutfitsRepository(ref.watch(apiClientProvider)),
);

final syncRepositoryProvider = Provider<SyncRepository>(
  (ref) => ApiSyncRepository(ref.watch(apiClientProvider)),
);

class WardrobeRevision extends Notifier<int> {
  @override
  int build() => 0;

  void bump() => state++;
}

final wardrobeRevisionProvider = NotifierProvider<WardrobeRevision, int>(WardrobeRevision.new);

enum WardrobeSyncStatus { localOnly, syncing, synced, pending, failed }

class WardrobeSyncController extends Notifier<WardrobeSyncStatus> {
  static const _ownerKey = 'wardrobe_owner';

  Future<void>? _running;
  bool _again = false;

  @override
  WardrobeSyncStatus build() {
    final signedIn = ref.watch(isSignedInProvider);
    if (!signedIn) return WardrobeSyncStatus.localOnly;
    ref.listen(isOnlineProvider, (previous, online) {
      if (online && previous == false) unawaited(sync());
    });
    ref.listen(resumeSignalProvider, (_, _) => unawaited(sync()));
    Future.microtask(sync);
    return WardrobeSyncStatus.pending;
  }

  Future<void> sync() {
    if (!ref.mounted || !ref.read(isSignedInProvider)) return Future.value();
    if (_running != null) {
      _again = true;
      return _running!;
    }
    return _running = _loop().whenComplete(() => _running = null);
  }

  Future<void> _loop() async {
    do {
      _again = false;
      await _once();
    } while (_again && ref.mounted);
  }

  Future<void> _once() async {
    final user = ref.read(sessionProvider).value;
    if (user == null) return;
    final db = ref.read(appDatabaseProvider);
    final owner = await db.readValue(_ownerKey);
    if (owner != null && owner != user.id) await db.clearWardrobe();
    await db.writeValue(_ownerKey, user.id);
    if (!ref.mounted) return;
    state = WardrobeSyncStatus.syncing;
    final outcome = await WardrobeSync(
      db: db,
      favorites: ref.read(favoritesRepositoryProvider),
      savedOutfits: ref.read(savedOutfitsRepositoryProvider),
      sync: ref.read(syncRepositoryProvider),
    ).run();
    if (!ref.mounted) return;
    ref.read(wardrobeRevisionProvider.notifier).bump();
    state = switch (outcome) {
      WardrobeSyncOutcome.synced => WardrobeSyncStatus.synced,
      WardrobeSyncOutcome.pending => WardrobeSyncStatus.pending,
      WardrobeSyncOutcome.failed => WardrobeSyncStatus.failed,
    };
  }

  Future<void> forgetLocalData() async {
    await ref.read(appDatabaseProvider).clearWardrobe();
    await ref.read(appDatabaseProvider).writeValue(_ownerKey, null);
    ref.read(wardrobeRevisionProvider.notifier).bump();
  }
}

final wardrobeSyncProvider = NotifierProvider<WardrobeSyncController, WardrobeSyncStatus>(WardrobeSyncController.new);
