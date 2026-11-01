import 'package:drift/drift.dart' show Value;

import '../../../core/api/api_exception.dart';
import '../../../core/storage/app_database.dart';
import '../domain/wardrobe_models.dart';
import '../domain/wardrobe_repositories.dart';
import 'local_wardrobe.dart';

enum WardrobeSyncOutcome { synced, pending, failed }

class WardrobeSync {
  WardrobeSync({required this.db, required this.favorites, required this.savedOutfits, required this.sync});

  static const pageSize = 100;

  final AppDatabase db;
  final FavoritesRepository favorites;
  final SavedOutfitsRepository savedOutfits;
  final SyncRepository sync;

  Future<WardrobeSyncOutcome> run() async {
    try {
      await _pushFavorites();
      await _pushSavedOutfits();
      await _pull();
    } on NetworkUnavailableException {
      return WardrobeSyncOutcome.pending;
    } on ApiException catch (e) {
      if (e.code == ApiErrorCode.unauthenticated) return WardrobeSyncOutcome.pending;
      return e.isTerminal ? WardrobeSyncOutcome.failed : WardrobeSyncOutcome.pending;
    }
    final failed = [
      ...(await db.allFavorites()).map((r) => r.syncState),
      ...(await db.allSavedOutfits()).map((r) => r.syncState),
    ].contains(SyncState.failed);
    return failed ? WardrobeSyncOutcome.failed : WardrobeSyncOutcome.synced;
  }

  Future<void> _pushFavorites() async {
    for (final row in await db.allFavorites()) {
      final local = LocalFavorite.fromRow(row);
      switch (local.syncState) {
        case SyncState.pendingUpsert:
          await _pushFavorite(local);
        case SyncState.pendingDelete:
          await favorites.delete(local.clientUuid);
          await db.deleteFavorite(local.clientUuid);
        case SyncState.synced || SyncState.failed:
          break;
      }
    }
  }

  Future<void> _pushFavorite(LocalFavorite local) async {
    final Favorite saved;
    try {
      saved = await favorites.save(
        FavoriteInput(clientUuid: local.clientUuid, outfitId: local.outfitId, snapshot: local.snapshot),
      );
    } on ApiException catch (e) {
      if (!e.isTerminal) rethrow;
      if (local.outfitId != null && e.fieldErrors.containsKey('outfit_id')) {
        final custom = local.copyWith(clearOutfit: true);
        await db.upsertFavorite(custom.toCompanion());
        return _pushFavorite(custom);
      }
      await db.upsertFavorite(local.toCompanion(state: SyncState.failed));
      return;
    }
    await db.transaction(() async {
      if (saved.id != local.clientUuid) await db.deleteFavorite(local.clientUuid);
      await db.upsertFavorite(LocalFavorite.fromRemote(saved).toCompanion());
    });
  }

  Future<void> _pushSavedOutfits() async {
    for (final row in await db.allSavedOutfits()) {
      final local = LocalSavedOutfit.fromRow(row);
      switch (local.syncState) {
        case SyncState.pendingUpsert:
          await _pushSavedOutfit(local);
        case SyncState.pendingDelete:
          await savedOutfits.delete(local.clientUuid);
          await db.deleteSavedOutfit(local.clientUuid);
        case SyncState.synced || SyncState.failed:
          break;
      }
    }
  }

  Future<void> _pushSavedOutfit(LocalSavedOutfit local) async {
    final SavedOutfit saved;
    try {
      if (local.serverUpdatedAt == null) {
        saved = await savedOutfits.create(local.clientUuid, local.toInput());
      } else {
        try {
          saved = await savedOutfits.update(local.clientUuid, local.toInput());
        } on ApiException catch (e) {
          if (e.code != ApiErrorCode.notFound) rethrow;
          return _pushSavedOutfit(local.copyWithServerUpdatedAt(null));
        }
      }
    } on ApiException catch (e) {
      if (!e.isTerminal) rethrow;
      await db.upsertSavedOutfit(local.toCompanion(state: SyncState.failed));
      return;
    }
    await db.upsertSavedOutfit(local.toCompanion(state: SyncState.synced, serverUpdatedAt: Value(saved.updatedAt)));
  }

  Future<void> _pull() async {
    var cursor = await db.readValue(AppDatabase.syncCursorKey);
    var full = cursor == null;
    final seenFavorites = <String>{};
    final seenOutfits = <String>{};
    while (true) {
      final SyncPage page;
      try {
        page = await sync.changes(cursor: cursor, limit: pageSize);
      } on ApiException catch (e) {
        final unreadable = e.code == ApiErrorCode.validation && e.fieldErrors.containsKey('cursor');
        if (cursor == null || (e.code != ApiErrorCode.cursorExpired && !unreadable)) rethrow;
        await db.writeValue(AppDatabase.syncCursorKey, null);
        cursor = null;
        full = true;
        continue;
      }
      await db.transaction(() async {
        for (final change in page.changes) {
          (change.resource == SyncResource.favorite ? seenFavorites : seenOutfits).add(change.id);
          await _apply(change);
        }
        if (!full || !page.hasMore) await db.writeValue(AppDatabase.syncCursorKey, page.cursor);
      });
      cursor = page.cursor;
      if (!page.hasMore) break;
    }
    if (full) await _reconcile(seenFavorites, seenOutfits);
  }

  bool _isStale(SyncState state, DateTime? known, DateTime incoming) =>
      state != SyncState.synced || (known != null && incoming.isBefore(known));

  Future<void> _apply(SyncChange change) async {
    switch (change.resource) {
      case SyncResource.favorite:
        final row = await db.favorite(change.id);
        if (row != null && _isStale(row.syncState, row.serverUpdatedAt, change.updatedAt)) return;
        if (change.op == SyncOp.delete) {
          await db.deleteFavorite(change.id);
        } else if (change.data != null) {
          await db.upsertFavorite(LocalFavorite.fromRemote(Favorite.fromJson(change.data!)).toCompanion());
        }
      case SyncResource.savedOutfit:
        final row = await db.savedOutfit(change.id);
        if (row != null && _isStale(row.syncState, row.serverUpdatedAt, change.updatedAt)) return;
        if (change.op == SyncOp.delete) {
          await db.deleteSavedOutfit(change.id);
        } else if (change.data != null) {
          await db.upsertSavedOutfit(LocalSavedOutfit.fromRemote(SavedOutfit.fromJson(change.data!)).toCompanion());
        }
    }
  }

  Future<void> _reconcile(Set<String> favoriteIds, Set<String> outfitIds) => db.transaction(() async {
        for (final row in await db.allFavorites()) {
          if (row.syncState == SyncState.synced && !favoriteIds.contains(row.clientUuid)) {
            await db.deleteFavorite(row.clientUuid);
          }
        }
        for (final row in await db.allSavedOutfits()) {
          if (row.syncState == SyncState.synced && !outfitIds.contains(row.clientUuid)) {
            await db.deleteSavedOutfit(row.clientUuid);
          }
        }
      });
}

extension on LocalSavedOutfit {
  LocalSavedOutfit copyWithServerUpdatedAt(DateTime? value) => LocalSavedOutfit(
        clientUuid: clientUuid,
        title: title,
        composition: composition,
        score: score,
        ruleVersion: ruleVersion,
        createdAt: createdAt,
        updatedAt: updatedAt,
        serverUpdatedAt: value,
        syncState: syncState,
      );
}
