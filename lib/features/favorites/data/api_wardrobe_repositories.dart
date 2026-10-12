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
  Future<List<Favorite>> list({DateTime? updatedSince}) async => [
        for (final item in (await client.get(
          '/me/favorites',
          query: updatedSince == null ? null : {'updated_since': updatedSince.toUtc().toIso8601String()},
        ))
            .dataList)
          Favorite.fromJson(item),
      ];

  @override
  Future<Favorite> save(FavoriteInput input) async =>
      Favorite.fromJson((await client.post('/me/favorites', body: input.toJson())).dataMap);

  @override
  Future<void> delete(String idOrClientUuid) => _idempotentDelete(client.delete('/me/favorites/$idOrClientUuid'));
}

class ApiSavedOutfitsRepository implements SavedOutfitsRepository {
  const ApiSavedOutfitsRepository(this.client);

  final ApiClient client;

  @override
  Future<List<SavedOutfit>> list() async =>
      [for (final item in (await client.get('/me/saved-outfits')).dataList) SavedOutfit.fromJson(item)];

  @override
  Future<SavedOutfit> create(SavedOutfitInput input) async =>
      SavedOutfit.fromJson((await client.post('/me/saved-outfits', body: input.toJson())).dataMap);

  @override
  Future<SavedOutfit> update(String idOrClientUuid, SavedOutfitInput input) async => SavedOutfit.fromJson(
        (await client.put('/me/saved-outfits/$idOrClientUuid', body: input.toJson())).dataMap,
      );

  @override
  Future<void> delete(String idOrClientUuid) =>
      _idempotentDelete(client.delete('/me/saved-outfits/$idOrClientUuid'));
}
