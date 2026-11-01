import '../../../core/api/api_client.dart';
import '../../../core/storage/response_cache.dart';
import '../domain/look_models.dart';
import '../domain/looks_repository.dart';

class ApiLooksRepository implements LooksRepository {
  const ApiLooksRepository(this.client, this.cache);

  final ApiClient client;
  final ResponseCache cache;

  @override
  Future<Paginated<Look>> list([LookQuery query = const LookQuery()]) async {
    final params = query.toQuery();
    final json = (await cache.networkFirst('looks:${canonicalKey(params)}', () => client.get('/outfits', query: params))).body;
    return Paginated(
      data: [for (final item in json.dataList) Look.fromJson(item)],
      meta: PageMeta.fromJson(json.asMap['meta'] as Map<String, dynamic>),
    );
  }

  @override
  Future<Look> get(String id) async =>
      Look.fromJson((await cache.networkFirst('look:$id', () => client.get('/outfits/$id'))).body.dataMap);
}
