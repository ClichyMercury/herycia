import '../../../core/api/api_client.dart';
import '../domain/look_models.dart';
import '../domain/looks_repository.dart';

class ApiLooksRepository implements LooksRepository {
  const ApiLooksRepository(this.client);

  final ApiClient client;

  @override
  Future<Paginated<Look>> list([LookQuery query = const LookQuery()]) async {
    final json = await client.get('/outfits', query: query.toQuery());
    return Paginated(
      data: [for (final item in json.dataList) Look.fromJson(item)],
      meta: PageMeta.fromJson(json.asMap['meta'] as Map<String, dynamic>),
    );
  }

  @override
  Future<Look> get(String id) async => Look.fromJson((await client.get('/outfits/$id')).dataMap);
}
