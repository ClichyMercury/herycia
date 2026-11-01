import 'catalog_models.dart';

abstract interface class CatalogRepository {
  Future<CatalogVersion> version();

  Future<List<ClothingCategory>> categories();

  Future<List<ClothingType>> types({String? categoryId});

  Future<List<CatalogColor>> colors();

  Future<List<OutfitStyle>> styles();

  Future<List<Occasion>> occasions();

  Future<ColorGuide> colorGuide();
}
