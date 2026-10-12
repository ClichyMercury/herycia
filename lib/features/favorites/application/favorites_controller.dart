import 'dart:convert';

import 'package:drift/drift.dart' show Value;
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../core/api/api_exception.dart';
import '../../../core/storage/app_database.dart';
import '../../../core/storage/storage_providers.dart';
import '../../account/application/session_controller.dart';
import '../../looks/presentation/look_view.dart';
import '../domain/wardrobe_models.dart';
import 'wardrobe_providers.dart';

enum FavoritesSyncStatus { localOnly, synced, pending, failed }

@immutable
class LocalFavorite {
  const LocalFavorite({
    required this.clientUuid,
    required this.snapshot,
    required this.createdAt,
    required this.updatedAt,
    required this.syncState,
    this.outfitId,
    this.serverId,
  });

  factory LocalFavorite.fromRow(LocalFavoriteRow row) => LocalFavorite(
        clientUuid: row.clientUuid,
        serverId: row.serverId,
        outfitId: row.outfitId,
        snapshot: LookSnapshot.fromJson(jsonDecode(row.snapshotJson) as Map<String, dynamic>),
        createdAt: row.createdAt,
        updatedAt: row.updatedAt,
        syncState: row.syncState,
      );

  final String clientUuid;
  final String? serverId;
  final String? outfitId;
  final LookSnapshot snapshot;
  final DateTime createdAt;
  final DateTime updatedAt;
  final SyncState syncState;

  String get signature => signatureOf(snapshot.items.map((i) => '${i.role.name}:${i.clothingTypeId}:${i.colorId}'));

  static String signatureOf(Iterable<String> parts) => (parts.toList()..sort()).join('|');

  LocalFavoritesCompanion toCompanion({SyncState? state, String? serverId}) => LocalFavoritesCompanion.insert(
        clientUuid: clientUuid,
        serverId: Value(serverId ?? this.serverId),
        outfitId: Value(outfitId),
        snapshotJson: jsonEncode(snapshot.toJson()),
        createdAt: createdAt,
        updatedAt: updatedAt,
        syncState: state ?? syncState,
      );
}

String lookSignature(LookView look) =>
    LocalFavorite.signatureOf(look.pieces.map((p) => '${p.role.name}:${p.type.id}:${p.color.id}'));

@immutable
class FavoritesState {
  const FavoritesState({required this.items, required this.status});

  final List<LocalFavorite> items;
  final FavoritesSyncStatus status;

  List<LocalFavorite> get visible => items.where((f) => f.syncState != SyncState.pendingDelete).toList();

  bool contains(LookView look) {
    final signature = lookSignature(look);
    return visible.any((f) => f.signature == signature);
  }
}

class FavoritesController extends AsyncNotifier<FavoritesState> {
  static const _uuid = Uuid();

  AppDatabase get _db => ref.read(appDatabaseProvider);

  DateTime Function() clock = () => DateTime.now().toUtc();

  @override
  Future<FavoritesState> build() async {
    final signedIn = ref.watch(isSignedInProvider);
    final items = await _load();
    if (signedIn) Future.microtask(sync);
    return FavoritesState(
      items: items,
      status: signedIn ? _statusOf(items) : FavoritesSyncStatus.localOnly,
    );
  }

  Future<List<LocalFavorite>> _load() async => [for (final row in await _db.allFavorites()) LocalFavorite.fromRow(row)];

  FavoritesSyncStatus _statusOf(List<LocalFavorite> items) =>
      items.any((f) => f.syncState != SyncState.synced) ? FavoritesSyncStatus.pending : FavoritesSyncStatus.synced;

  Future<void> _publish({FavoritesSyncStatus? status}) async {
    final items = await _load();
    final signedIn = ref.read(isSignedInProvider);
    state = AsyncData(FavoritesState(
      items: items,
      status: status ?? (signedIn ? _statusOf(items) : FavoritesSyncStatus.localOnly),
    ));
  }

  Future<void> toggle(LookView look) async {
    final current = state.value ?? await future;
    final signature = lookSignature(look);
    final existing = current.visible.where((f) => f.signature == signature).firstOrNull;
    if (existing != null) {
      await remove(existing.clientUuid);
    } else {
      await add(look);
    }
  }

  Future<LocalFavorite> add(LookView look) async {
    final now = clock();
    final favorite = LocalFavorite(
      clientUuid: _uuid.v4(),
      outfitId: look.image != null || look.score == null ? look.outfitId : null,
      snapshot: LookSnapshot(
        title: look.title,
        items: [for (final p in look.pieces) p.toRequestItem()],
        occasionSlug: look.occasion?.slug,
        styleSlug: look.style?.slug,
        score: look.score,
        imageUrl: look.image?.thumbnailUrl,
        explanation: look.explanation,
      ),
      createdAt: now,
      updatedAt: now,
      syncState: SyncState.pendingUpsert,
    );
    await _db.upsertFavorite(favorite.toCompanion());
    await _publish();
    if (ref.read(isSignedInProvider)) await sync();
    return favorite;
  }

  Future<void> remove(String clientUuid) async {
    final items = await _load();
    final favorite = items.where((f) => f.clientUuid == clientUuid).firstOrNull;
    if (favorite == null) return;
    if (favorite.serverId == null && favorite.syncState == SyncState.pendingUpsert) {
      await _db.deleteFavorite(clientUuid);
    } else {
      await _db.upsertFavorite(favorite.toCompanion(state: SyncState.pendingDelete));
    }
    await _publish();
    if (ref.read(isSignedInProvider)) await sync();
  }

  Future<void> restore(LocalFavorite favorite) async {
    await _db.upsertFavorite(favorite.toCompanion(state: SyncState.pendingUpsert));
    await _publish();
    if (ref.read(isSignedInProvider)) await sync();
  }

  Future<void> sync() async {
    if (!ref.read(isSignedInProvider)) return;
    final repo = ref.read(favoritesRepositoryProvider);
    try {
      for (final f in await _load()) {
        switch (f.syncState) {
          case SyncState.pendingUpsert:
            final saved = await repo.save(FavoriteInput(clientUuid: f.clientUuid, outfitId: f.outfitId, snapshot: f.snapshot));
            await _db.upsertFavorite(f.toCompanion(state: SyncState.synced, serverId: saved.id));
          case SyncState.pendingDelete:
            await repo.delete(f.clientUuid);
            await _db.deleteFavorite(f.clientUuid);
          case SyncState.synced:
            break;
        }
      }
      final remote = await repo.list();
      final local = {for (final f in await _load()) f.clientUuid: f};
      for (final r in remote) {
        if (local.containsKey(r.clientUuid)) continue;
        await _db.upsertFavorite(LocalFavorite(
          clientUuid: r.clientUuid,
          serverId: r.id,
          outfitId: r.outfitId,
          snapshot: r.snapshot,
          createdAt: r.createdAt,
          updatedAt: r.updatedAt,
          syncState: SyncState.synced,
        ).toCompanion());
      }
      final remoteIds = {for (final r in remote) r.clientUuid};
      for (final f in local.values) {
        if (f.syncState == SyncState.synced && !remoteIds.contains(f.clientUuid)) {
          await _db.deleteFavorite(f.clientUuid);
        }
      }
      await _publish(status: FavoritesSyncStatus.synced);
    } on NetworkUnavailableException {
      await _publish(status: FavoritesSyncStatus.pending);
    } on ApiException {
      await _publish(status: FavoritesSyncStatus.failed);
    }
  }

  Future<void> clearLocal() async {
    await _db.clearFavorites();
    await _publish();
  }
}

final favoritesProvider = AsyncNotifierProvider<FavoritesController, FavoritesState>(FavoritesController.new);
