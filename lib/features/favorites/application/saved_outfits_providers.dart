import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../core/storage/app_database.dart';
import '../../../core/storage/storage_providers.dart';
import '../../account/application/session_controller.dart';
import '../domain/wardrobe_models.dart';
import 'local_wardrobe.dart';
import 'wardrobe_providers.dart';

export 'local_wardrobe.dart' show LocalSavedOutfit;

class SavedOutfitsController extends AsyncNotifier<List<LocalSavedOutfit>> {
  static const _uuid = Uuid();

  AppDatabase get _db => ref.read(appDatabaseProvider);

  @override
  Future<List<LocalSavedOutfit>> build() async {
    ref.watch(wardrobeRevisionProvider);
    return [
      for (final row in await _db.allSavedOutfits())
        if (row.syncState != SyncState.pendingDelete) LocalSavedOutfit.fromRow(row),
    ];
  }

  Future<void> _changed() async {
    ref.read(wardrobeRevisionProvider.notifier).bump();
    if (ref.read(isSignedInProvider)) await ref.read(wardrobeSyncProvider.notifier).sync();
  }

  Future<LocalSavedOutfit> create({
    required CompositionPayload composition,
    String? title,
    int? score,
    int ruleVersion = 1,
  }) async {
    final now = DateTime.now().toUtc();
    final outfit = LocalSavedOutfit(
      clientUuid: _uuid.v4(),
      title: title,
      composition: composition,
      score: score,
      ruleVersion: ruleVersion,
      createdAt: now,
      updatedAt: now,
      syncState: SyncState.pendingUpsert,
    );
    await _db.upsertSavedOutfit(outfit.toCompanion());
    await _changed();
    return outfit;
  }

  Future<void> remove(String clientUuid) async {
    final row = await _db.savedOutfit(clientUuid);
    if (row == null) return;
    if (row.serverUpdatedAt == null && row.syncState != SyncState.synced) {
      await _db.deleteSavedOutfit(clientUuid);
    } else {
      await _db.upsertSavedOutfit(LocalSavedOutfit.fromRow(row).toCompanion(state: SyncState.pendingDelete));
    }
    await _changed();
  }

  Future<void> restore(LocalSavedOutfit outfit) async {
    await _db.upsertSavedOutfit(outfit.toCompanion(state: SyncState.pendingUpsert));
    await _changed();
  }
}

final savedOutfitsProvider =
    AsyncNotifierProvider<SavedOutfitsController, List<LocalSavedOutfit>>(SavedOutfitsController.new);
