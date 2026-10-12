import 'look_models.dart';

abstract interface class LooksRepository {
  Future<Paginated<Look>> list([LookQuery query = const LookQuery()]);

  Future<Look> get(String id);
}
