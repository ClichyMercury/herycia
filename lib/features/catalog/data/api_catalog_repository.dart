import '../../../core/api/api_client.dart';
import '../domain/catalog_models.dart';
import '../domain/catalog_repository.dart';

class ApiCatalogRepository implements CatalogRepository {
  const ApiCatalogRepository(this.client);

  final ApiClient client;

  Future<List<T>> _list<T>(String path, T Function(Map<String, dynamic>) parse, {Map<String, String>? query}) async =>
      [for (final item in (await client.get(path, query: query)).dataList) parse(item)];

  @override
  Future<CatalogVersion> version() async =>
      CatalogVersion.fromJson((await client.get('/catalog/version')).dataMap);

  @override
  Future<List<ClothingCategory>> categories() async =>
      (await _list('/clothing-categories', ClothingCategory.fromJson))
        ..sort((a, b) => a.sortOrder.compareTo(b.sortOrder));

  @override
  Future<List<ClothingType>> types({String? categoryId}) async => (await _list(
        '/clothing-types',
        ClothingType.fromJson,
        query: categoryId == null ? null : {'category_id': categoryId},
      ))
        ..sort((a, b) => a.sortOrder.compareTo(b.sortOrder));

  @override
  Future<List<CatalogColor>> colors() => _list('/colors', CatalogColor.fromJson);

  @override
  Future<List<OutfitStyle>> styles() async =>
      (await _list('/styles', OutfitStyle.fromJson))..sort((a, b) => a.sortOrder.compareTo(b.sortOrder));

  @override
  Future<List<Occasion>> occasions() async =>
      (await _list('/occasions', Occasion.fromJson))..sort((a, b) => a.sortOrder.compareTo(b.sortOrder));

  @override
  Future<ColorGuide> colorGuide() async => ColorGuide.fromJson((await client.get('/color-guide')).dataMap);

  @override
  Future<List<ColorPairingRule>> colorPairingRules() =>
      _list('/color-pairing-rules', ColorPairingRule.fromJson);

  @override
  Future<List<RecommendationRule>> recommendationRules() =>
      _list('/recommendation-rules', RecommendationRule.fromJson);
}
