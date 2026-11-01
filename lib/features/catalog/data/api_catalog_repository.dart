import '../../../core/api/api_client.dart';
import '../../../core/storage/response_cache.dart';
import '../domain/catalog_models.dart';
import '../domain/catalog_repository.dart';

class ApiCatalogRepository implements CatalogRepository {
  ApiCatalogRepository(this.client, this.cache, {this.revalidateAfter = const Duration(hours: 1)});

  static const _prefix = 'catalog:';
  static const _versionKey = '${_prefix}version';

  final ApiClient client;
  final ResponseCache cache;
  final Duration revalidateAfter;
  Future<void>? _validation;
  DateTime? _validatedAt;

  Future<void> _ensureCurrent() {
    final now = cache.clock();
    if (_validation == null || _validatedAt == null || now.difference(_validatedAt!) > revalidateAfter) {
      _validatedAt = now;
      _validation = _validate();
    }
    return _validation!;
  }

  Future<void> _validate() async {
    final stored = await cache.read(_versionKey);
    try {
      final body = await client.get('/catalog/version');
      if (stored == null || canonicalKey(stored.body) != canonicalKey(body)) await cache.invalidate(_prefix);
      await cache.write(_versionKey, body);
    } catch (error) {
      _validation = null;
      if (!isOfflineFailure(error)) rethrow;
    }
  }

  Future<Object?> _get(String path) async {
    final key = '$_prefix$path';
    await _ensureCurrent();
    final cached = await cache.read(key);
    if (cached != null) return cached.body;
    return (await cache.networkFirst(key, () => client.get(path))).body;
  }

  Future<List<T>> _list<T>(String path, T Function(Map<String, dynamic>) parse) async =>
      [for (final item in (await _get(path)).dataList) parse(item)];

  @override
  Future<CatalogVersion> version() async =>
      CatalogVersion.fromJson((await cache.networkFirst(_versionKey, () => client.get('/catalog/version'))).body.dataMap);

  @override
  Future<List<ClothingCategory>> categories() async =>
      (await _list('/clothing-categories', ClothingCategory.fromJson))..sort((a, b) => a.sortOrder.compareTo(b.sortOrder));

  @override
  Future<List<ClothingType>> types({String? categoryId}) async => [
        for (final t in await _list('/clothing-types', ClothingType.fromJson))
          if (categoryId == null || t.categoryId == categoryId) t,
      ]..sort((a, b) => a.sortOrder.compareTo(b.sortOrder));

  @override
  Future<List<CatalogColor>> colors() => _list('/colors', CatalogColor.fromJson);

  @override
  Future<List<OutfitStyle>> styles() async =>
      (await _list('/styles', OutfitStyle.fromJson))..sort((a, b) => a.sortOrder.compareTo(b.sortOrder));

  @override
  Future<List<Occasion>> occasions() async =>
      (await _list('/occasions', Occasion.fromJson))..sort((a, b) => a.sortOrder.compareTo(b.sortOrder));

  @override
  Future<ColorGuide> colorGuide() async => ColorGuide.fromJson((await _get('/color-guide')).dataMap);
}
