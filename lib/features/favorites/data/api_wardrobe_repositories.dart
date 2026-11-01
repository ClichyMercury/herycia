import '../../../core/api/api_client.dart';
import '../../../core/api/api_exception.dart';
import '../domain/wardrobe_models.dart';
import '../domain/wardrobe_repositories.dart';

Future<void> _idempotentDelete(Future<Object?> call) async {
  try {
    await call;
  } on ApiException catch (e) {
    if (e.code != ApiErrorCode.notFound) rethrow;
  }
}

class ApiFavoritesRepository implements FavoritesRepository {
  const ApiFavoritesRepository(this.client);

  final ApiClient client;

  @override
  Future<Favorite> save(FavoriteInput input) async =>
      Favorite.fromJson((await client.post('/me/favorites', body: input.toJson())).dataMap);

  @override
  Future<void> delete(String clientUuid) => _idempotentDelete(client.delete('/me/favorites/$clientUuid'));
}

class ApiSavedOutfitsRepository implements SavedOutfitsRepository {
  const ApiSavedOutfitsRepository(this.client);

  final ApiClient client;

  @override
  Future<SavedOutfit> create(String clientUuid, SavedOutfitInput input) async => SavedOutfit.fromJson(
        (await client.post('/me/saved-outfits', body: {'client_uuid': clientUuid, ...input.toJson()})).dataMap,
      );

  @override
  Future<SavedOutfit> update(String clientUuid, SavedOutfitInput input) async =>
      SavedOutfit.fromJson((await client.put('/me/saved-outfits/$clientUuid', body: input.toJson())).dataMap);

  @override
  Future<void> delete(String clientUuid) => _idempotentDelete(client.delete('/me/saved-outfits/$clientUuid'));
}

class ApiSyncRepository implements SyncRepository {
  const ApiSyncRepository(this.client);

  final ApiClient client;

  @override
  Future<SyncPage> changes({String? cursor, int limit = 100}) async => SyncPage.fromJson(
        (await client.get('/me/sync', query: {'cursor': ?cursor, 'limit': '$limit'})).dataMap,
      );
}
