import 'dart:convert';

import 'package:drift/drift.dart' show driftRuntimeOptions;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:herycia/core/storage/app_database.dart';
import 'package:herycia/features/favorites/application/local_wardrobe.dart';
import 'package:herycia/features/favorites/application/wardrobe_sync.dart';
import 'package:herycia/features/favorites/data/api_wardrobe_repositories.dart';
import 'package:herycia/features/favorites/domain/wardrobe_models.dart';
import 'package:herycia/features/looks/domain/look_models.dart';
import 'package:herycia/features/recommendation/domain/recommendation_models.dart';

import '../../helpers/mock_api.dart';

const look = 'd25fd239-ab5b-57e4-8814-18c47815fd47';

const customSnapshot = LookSnapshot(
  title: 'Ma tenue du lundi',
  items: [
    SnapshotItem(
      clothingType: SnapshotRef(slug: 'chemise', name: 'Chemise'),
      color: SnapshotColor(slug: 'bleu-ciel', name: 'Bleu ciel', hexCode: '#A7C7E7'),
      role: PieceRole.top,
    ),
  ],
);

const composition = CompositionPayload(items: [
  RequestItem(
    clothingTypeId: 'f9c84ba6-8813-5dc9-84be-bf8a5c4e0521',
    colorId: '0491898d-fc0d-51ca-9b9f-e2cdadf5a975',
    role: PieceRole.top,
  ),
]);

LocalFavorite favorite(String uuid, {String? outfitId, LookSnapshot snapshot = customSnapshot}) => LocalFavorite(
      clientUuid: uuid,
      outfitId: outfitId,
      snapshot: snapshot,
      createdAt: DateTime.utc(2026, 10, 31),
      syncState: SyncState.pendingUpsert,
    );

String uuid(int n) => '7b0f3c2e-5d41-4f6a-9a3e-${n.toString().padLeft(12, '0')}';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;

  late MockApiHarness api;
  late AppDatabase db;
  late WardrobeSync sync;
  var tick = 0;

  WardrobeSync engineFor(AppDatabase database) => WardrobeSync(
        db: database,
        favorites: ApiFavoritesRepository(api.client),
        savedOutfits: ApiSavedOutfitsRepository(api.client),
        sync: ApiSyncRepository(api.client),
      );

  setUp(() async {
    tick = 0;
    api = MockApiHarness(
      await MockApiHarness.fixtures(),
      clock: () => DateTime.utc(2026, 10, 31, 10).add(Duration(seconds: tick++)),
    );
    await api.signIn();
    db = AppDatabase(NativeDatabase.memory());
    sync = engineFor(db);
  });

  tearDown(() => db.close());

  test('un favori créé hors connexion est envoyé puis marqué synchronisé', () async {
    await db.upsertFavorite(favorite(uuid(1)).toCompanion());

    expect(await sync.run(), WardrobeSyncOutcome.synced);

    final row = (await db.favorite(uuid(1)))!;
    expect(row.syncState, SyncState.synced);
    expect(row.serverUpdatedAt, isNotNull);
    expect(api.backend.favorites.values.single.keys, [uuid(1)]);
  });

  test('favori de look : le serveur reconstruit l’instantané', () async {
    await db.upsertFavorite(favorite(uuid(1), outfitId: look).toCompanion());
    await sync.run();
    final local = LocalFavorite.fromRow((await db.favorite(uuid(1)))!);
    expect(local.snapshot.title, 'Chemise blanche et denim');
  });

  test('A-37 : le look déjà favori sous un autre uuid remplace l’uuid local', () async {
    final other = AppDatabase(NativeDatabase.memory());
    addTearDown(other.close);
    await other.upsertFavorite(favorite(uuid(9), outfitId: look).toCompanion());
    await engineFor(other).run();

    await db.upsertFavorite(favorite(uuid(1), outfitId: look).toCompanion());
    await sync.run();

    final rows = await db.allFavorites();
    expect(rows.map((r) => r.clientUuid), [uuid(9)]);
    expect(rows.single.syncState, SyncState.synced);
  });

  test('suppression : pierre tombale propagée aux autres appareils', () async {
    final other = AppDatabase(NativeDatabase.memory());
    addTearDown(other.close);
    final otherSync = engineFor(other);
    await db.upsertFavorite(favorite(uuid(1)).toCompanion());
    await sync.run();
    await otherSync.run();
    expect(await other.allFavorites(), hasLength(1));

    final row = (await db.favorite(uuid(1)))!;
    await db.upsertFavorite(LocalFavorite.fromRow(row).toCompanion(state: SyncState.pendingDelete));
    await sync.run();
    expect(await db.allFavorites(), isEmpty);

    await otherSync.run();
    expect(await other.allFavorites(), isEmpty);
  });

  test('look dépublié (422 outfit_id) : renvoyé comme composition personnalisée', () async {
    await db.upsertFavorite(favorite(uuid(1), outfitId: '00000000-0000-4000-8000-000000000000').toCompanion());
    await sync.run();
    final row = (await db.favorite(uuid(1)))!;
    expect(row.outfitId, isNull);
    expect(row.syncState, SyncState.synced);
  });

  test('instantané invalide : échec terminal, pas de rejeu', () async {
    await db.upsertFavorite(
      favorite(uuid(1), snapshot: const LookSnapshot(title: 'Vide', items: [])).toCompanion(),
    );
    expect(await sync.run(), WardrobeSyncOutcome.failed);
    expect((await db.favorite(uuid(1)))!.syncState, SyncState.failed);
    await sync.run();
    expect(api.backend.callCounts['POST /me/favorites'], 1);
  });

  test('hors ligne : tout reste en attente, rien n’est perdu', () async {
    api.client.simulateOffline = true;
    await db.upsertFavorite(favorite(uuid(1)).toCompanion());
    expect(await sync.run(), WardrobeSyncOutcome.pending);
    expect((await db.favorite(uuid(1)))!.syncState, SyncState.pendingUpsert);
  });

  test('composition : création, modification, puis restauration après suppression ailleurs', () async {
    final now = DateTime.utc(2026, 10, 31);
    final outfit = LocalSavedOutfit(
      clientUuid: uuid(2),
      title: 'Lundi',
      composition: composition,
      score: 72,
      createdAt: now,
      updatedAt: now,
      syncState: SyncState.pendingUpsert,
    );
    await db.upsertSavedOutfit(outfit.toCompanion());
    await sync.run();
    expect(api.backend.callCounts['POST /me/saved-outfits'], 1);

    final synced = LocalSavedOutfit.fromRow((await db.savedOutfit(uuid(2)))!);
    await db.upsertSavedOutfit(synced.toCompanion(state: SyncState.pendingUpsert));
    await sync.run();
    expect(api.backend.callCounts['PUT /me/saved-outfits/${uuid(2)}'], 1);

    api.backend.savedOutfits.values.single[uuid(2)]!.deletedAt = DateTime.utc(2026, 10, 31, 11);
    await db.upsertSavedOutfit(synced.toCompanion(state: SyncState.pendingUpsert));
    await sync.run();
    expect(api.backend.callCounts['POST /me/saved-outfits'], 2);
    expect(api.backend.savedOutfits.values.single[uuid(2)]!.isActive, isTrue);
    expect((await db.savedOutfit(uuid(2)))!.syncState, SyncState.synced);
  });

  test('curseur expiré : synchronisation complète et réconciliation', () async {
    await db.upsertFavorite(favorite(uuid(1)).toCompanion());
    await sync.run();
    await db.upsertFavorite(
      LocalFavorite.fromRow((await db.favorite(uuid(1)))!).copyWith(clientUuid: uuid(5)).toCompanion(state: SyncState.synced),
    );
    final old = DateTime.utc(2026, 7, 1).microsecondsSinceEpoch;
    await db.writeValue(AppDatabase.syncCursorKey, base64Url.encode(utf8.encode('$old|x|$old')));
    final before = api.backend.callCounts['GET /me/sync']!;

    await sync.run();

    expect(api.backend.callCounts['GET /me/sync'], before + 2);
    expect((await db.allFavorites()).map((r) => r.clientUuid), [uuid(1)]);
  });

  test('une modification locale en attente n’est pas écrasée par le serveur', () async {
    await db.upsertFavorite(favorite(uuid(1)).toCompanion());
    await sync.run();
    await db.writeValue(AppDatabase.syncCursorKey, null);
    final row = (await db.favorite(uuid(1)))!;
    await db.upsertFavorite(LocalFavorite.fromRow(row).toCompanion(state: SyncState.pendingDelete));
    api.client.simulateOffline = true;
    await sync.run();
    api.client.simulateOffline = false;
    expect((await db.favorite(uuid(1)))!.syncState, SyncState.pendingDelete);
  });
}
