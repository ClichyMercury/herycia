import 'package:drift/drift.dart';

part 'app_database.g.dart';

enum SyncState { synced, pendingUpsert, pendingDelete }

@DataClassName('LocalFavoriteRow')
class LocalFavorites extends Table {
  TextColumn get clientUuid => text()();
  TextColumn get serverId => text().nullable()();
  TextColumn get outfitId => text().nullable()();
  TextColumn get snapshotJson => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  IntColumn get syncState => intEnum<SyncState>()();

  @override
  Set<Column> get primaryKey => {clientUuid};
}

@DataClassName('KeyValueRow')
class KeyValues extends Table {
  TextColumn get key => text()();
  TextColumn get value => text()();

  @override
  Set<Column> get primaryKey => {key};
}

@DriftDatabase(tables: [LocalFavorites, KeyValues])
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.executor);

  @override
  int get schemaVersion => 1;

  Future<List<LocalFavoriteRow>> allFavorites() =>
      (select(localFavorites)..orderBy([(t) => OrderingTerm.desc(t.createdAt)])).get();

  Future<void> upsertFavorite(LocalFavoritesCompanion row) =>
      into(localFavorites).insertOnConflictUpdate(row);

  Future<void> deleteFavorite(String clientUuid) =>
      (delete(localFavorites)..where((t) => t.clientUuid.equals(clientUuid))).go();

  Future<void> clearFavorites() => delete(localFavorites).go();

  Future<String?> readValue(String key) async =>
      (await (select(keyValues)..where((t) => t.key.equals(key))).getSingleOrNull())?.value;

  Future<void> writeValue(String key, String? value) => value == null
      ? (delete(keyValues)..where((t) => t.key.equals(key))).go()
      : into(keyValues).insertOnConflictUpdate(KeyValuesCompanion.insert(key: key, value: value));
}
