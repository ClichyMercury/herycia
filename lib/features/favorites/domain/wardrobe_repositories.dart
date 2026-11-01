import 'wardrobe_models.dart';

abstract interface class FavoritesRepository {
  Future<Favorite> save(FavoriteInput input);

  Future<void> delete(String clientUuid);
}

abstract interface class SavedOutfitsRepository {
  Future<SavedOutfit> create(String clientUuid, SavedOutfitInput input);

  Future<SavedOutfit> update(String clientUuid, SavedOutfitInput input);

  Future<void> delete(String clientUuid);
}

abstract interface class SyncRepository {
  Future<SyncPage> changes({String? cursor, int limit = 100});
}
