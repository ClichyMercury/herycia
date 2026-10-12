import 'wardrobe_models.dart';

abstract interface class FavoritesRepository {
  Future<List<Favorite>> list({DateTime? updatedSince});

  Future<Favorite> save(FavoriteInput input);

  Future<void> delete(String idOrClientUuid);
}

abstract interface class SavedOutfitsRepository {
  Future<List<SavedOutfit>> list();

  Future<SavedOutfit> create(SavedOutfitInput input);

  Future<SavedOutfit> update(String idOrClientUuid, SavedOutfitInput input);

  Future<void> delete(String idOrClientUuid);
}
