import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../core/storage/app_database.dart';
import '../../../core/storage/storage_providers.dart';
import '../../account/application/session_controller.dart';
import '../../catalog/application/catalog_providers.dart';
import '../../looks/presentation/look_view.dart';
import '../domain/wardrobe_models.dart';
import 'local_wardrobe.dart';
import 'wardrobe_providers.dart';

export 'local_wardrobe.dart' show LocalFavorite;

LookSnapshot snapshotOf(LookView look, {int catalogVersion = 1}) {
  final image = look.image;
  final secureImage = image != null && image.url.startsWith('https://');
  return LookSnapshot(
    title: look.title.length > 150 ? look.title.substring(0, 150) : look.title,
    catalogVersion: catalogVersion,
    style: look.style == null ? null : SnapshotRef(slug: look.style!.slug, name: look.style!.name),
    occasion: look.occasion == null ? null : SnapshotRef(slug: look.occasion!.slug, name: look.occasion!.name),
    image: secureImage
        ? SnapshotImage(
            url: image.url,
            thumbnailUrl: (image.thumbnailUrl?.startsWith('https://') ?? false) ? image.thumbnailUrl : null,
            altText: image.altText,
            credit: image.credit,
            licenseType: image.licenseType,
          )
        : null,
    items: [
      for (final p in look.pieces.take(LookSnapshot.maxItems))
        SnapshotItem(
          clothingType: SnapshotRef(slug: p.type.slug, name: p.type.name),
          color: SnapshotColor(slug: p.color.slug, name: p.color.name, hexCode: p.color.hexCode.toUpperCase()),
          role: p.role,
        ),
    ],
  );
}

String lookSignature(LookView look) =>
    look.isPublishedLook ? 'look:${look.outfitId}' : LocalFavorite.snapshotSignature(snapshotOf(look));

@immutable
class FavoritesState {
  const FavoritesState({required this.items});

  final List<LocalFavorite> items;

  List<LocalFavorite> get visible => items.where((f) => f.syncState != SyncState.pendingDelete).toList();

  bool contains(LookView look) {
    final signature = lookSignature(look);
    return visible.any((f) => f.signature == signature);
  }
}

class FavoritesController extends AsyncNotifier<FavoritesState> {
  static const _uuid = Uuid();

  AppDatabase get _db => ref.read(appDatabaseProvider);

  @override
  Future<FavoritesState> build() async {
    ref.watch(wardrobeRevisionProvider);
    return FavoritesState(items: [for (final row in await _db.allFavorites()) LocalFavorite.fromRow(row)]);
  }

  Future<void> _changed() async {
    ref.read(wardrobeRevisionProvider.notifier).bump();
    if (ref.read(isSignedInProvider)) await ref.read(wardrobeSyncProvider.notifier).sync();
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
    final version = ref.read(catalogVersionProvider).value?.catalogVersion ?? 1;
    final favorite = LocalFavorite(
      clientUuid: _uuid.v4(),
      outfitId: look.isPublishedLook ? look.outfitId : null,
      snapshot: snapshotOf(look, catalogVersion: version),
      createdAt: DateTime.now().toUtc(),
      syncState: SyncState.pendingUpsert,
    );
    await _db.upsertFavorite(favorite.toCompanion());
    await _changed();
    return favorite;
  }

  Future<void> remove(String clientUuid) async {
    final row = await _db.favorite(clientUuid);
    if (row == null) return;
    if (row.serverUpdatedAt == null && row.syncState != SyncState.synced) {
      await _db.deleteFavorite(clientUuid);
    } else {
      await _db.upsertFavorite(LocalFavorite.fromRow(row).toCompanion(state: SyncState.pendingDelete));
    }
    await _changed();
  }

  Future<void> restore(LocalFavorite favorite) async {
    await _db.upsertFavorite(favorite.toCompanion(state: SyncState.pendingUpsert));
    await _changed();
  }

  Future<void> sync() => ref.read(wardrobeSyncProvider.notifier).sync();
}

final favoritesProvider = AsyncNotifierProvider<FavoritesController, FavoritesState>(FavoritesController.new);
