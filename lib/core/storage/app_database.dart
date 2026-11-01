import 'package:drift/drift.dart';

part 'app_database.g.dart';

enum SyncState { synced, pendingUpsert, pendingDelete, failed }

@DataClassName('LocalFavoriteRow')
class LocalFavorites extends Table {
  TextColumn get clientUuid => text()();
  TextColumn get outfitId => text().nullable()();
  TextColumn get snapshotJson => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get serverUpdatedAt => dateTime().nullable()();
  IntColumn get syncState => intEnum<SyncState>()();

  @override
  Set<Column> get primaryKey => {clientUuid};
}

@DataClassName('LocalSavedOutfitRow')
class LocalSavedOutfits extends Table {
  TextColumn get clientUuid => text()();
  TextColumn get title => text().nullable()();
  TextColumn get compositionJson => text()();
  IntColumn get score => integer().nullable()();
  IntColumn get ruleVersion => integer().withDefault(const Constant(1))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get serverUpdatedAt => dateTime().nullable()();
  IntColumn get syncState => intEnum<SyncState>()();

  @override
  Set<Column> get primaryKey => {clientUuid};
}

@DataClassName('CachedResponseRow')
class CachedResponses extends Table {
  TextColumn get key => text()();
  TextColumn get body => text()();
  DateTimeColumn get savedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {key};
}

@DataClassName('KeyValueRow')
class KeyValues extends Table {
  TextColumn get key => text()();
  TextColumn get value => text()();

  @override
  Set<Column> get primaryKey => {key};
}

@DriftDatabase(tables: [LocalFavorites, LocalSavedOutfits, CachedResponses, KeyValues])
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.executor);

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onUpgrade: (m, from, to) async {
          if (from < 2) {
            await m.deleteTable('local_favorites');
            await m.createTable(localFavorites);
            await m.createTable(localSavedOutfits);
            await m.createTable(cachedResponses);
            await customStatement("DELETE FROM key_values WHERE key = 'preferences'");
          }
        },
      );

  Future<List<LocalFavoriteRow>> allFavorites() =>
      (select(localFavorites)..orderBy([(t) => OrderingTerm.desc(t.createdAt)])).get();

  Future<LocalFavoriteRow?> favorite(String clientUuid) =>
      (select(localFavorites)..where((t) => t.clientUuid.equals(clientUuid))).getSingleOrNull();

  Future<void> upsertFavorite(LocalFavoritesCompanion row) => into(localFavorites).insertOnConflictUpdate(row);

  Future<void> deleteFavorite(String clientUuid) =>
      (delete(localFavorites)..where((t) => t.clientUuid.equals(clientUuid))).go();

  Future<List<LocalSavedOutfitRow>> allSavedOutfits() =>
      (select(localSavedOutfits)..orderBy([(t) => OrderingTerm.desc(t.updatedAt)])).get();

  Future<LocalSavedOutfitRow?> savedOutfit(String clientUuid) =>
      (select(localSavedOutfits)..where((t) => t.clientUuid.equals(clientUuid))).getSingleOrNull();

  Future<void> upsertSavedOutfit(LocalSavedOutfitsCompanion row) =>
      into(localSavedOutfits).insertOnConflictUpdate(row);

  Future<void> deleteSavedOutfit(String clientUuid) =>
      (delete(localSavedOutfits)..where((t) => t.clientUuid.equals(clientUuid))).go();

  Future<void> clearWardrobe() => transaction(() async {
        await delete(localFavorites).go();
        await delete(localSavedOutfits).go();
        await writeValue(syncCursorKey, null);
      });

  static const syncCursorKey = 'sync_cursor';

  Future<CachedResponseRow?> cached(String key) =>
      (select(cachedResponses)..where((t) => t.key.equals(key))).getSingleOrNull();

  Future<void> writeCached(String key, String body, DateTime savedAt) => into(cachedResponses)
      .insertOnConflictUpdate(CachedResponsesCompanion.insert(key: key, body: body, savedAt: savedAt));

  Future<void> deleteCachedPrefix(String prefix) =>
      (delete(cachedResponses)..where((t) => t.key.like('$prefix%'))).go();

  Future<String?> readValue(String key) async =>
      (await (select(keyValues)..where((t) => t.key.equals(key))).getSingleOrNull())?.value;

  Future<void> writeValue(String key, String? value) => value == null
      ? (delete(keyValues)..where((t) => t.key.equals(key))).go()
      : into(keyValues).insertOnConflictUpdate(KeyValuesCompanion.insert(key: key, value: value));
}
