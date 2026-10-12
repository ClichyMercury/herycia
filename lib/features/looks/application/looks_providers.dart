import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/api/api_providers.dart';
import '../data/api_looks_repository.dart';
import '../domain/look_models.dart';
import '../domain/looks_repository.dart';

final looksRepositoryProvider = Provider<LooksRepository>(
  (ref) => ApiLooksRepository(ref.watch(apiClientProvider)),
);

final looksProvider = FutureProvider.family<Paginated<Look>, LookQuery>(
  (ref, query) => ref.watch(looksRepositoryProvider).list(query),
);

final lookProvider = FutureProvider.family<Look, String>(
  (ref, id) => ref.watch(looksRepositoryProvider).get(id),
);
