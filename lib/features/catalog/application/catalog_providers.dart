import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/api/api_providers.dart';
import '../../../core/storage/storage_providers.dart';
import '../data/api_catalog_repository.dart';
import '../domain/catalog_models.dart';
import '../domain/catalog_repository.dart';

final catalogRepositoryProvider = Provider<CatalogRepository>(
  (ref) => ApiCatalogRepository(ref.watch(apiClientProvider), ref.watch(responseCacheProvider)),
);

final catalogVersionProvider = FutureProvider<CatalogVersion>(
  (ref) => ref.watch(catalogRepositoryProvider).version(),
);

final categoriesProvider = FutureProvider<List<ClothingCategory>>(
  (ref) => ref.watch(catalogRepositoryProvider).categories(),
);

final typesByCategoryProvider = FutureProvider.family<List<ClothingType>, String>(
  (ref, categoryId) => ref.watch(catalogRepositoryProvider).types(categoryId: categoryId),
);

final colorsProvider = FutureProvider<List<CatalogColor>>(
  (ref) => ref.watch(catalogRepositoryProvider).colors(),
);

final stylesProvider = FutureProvider<List<OutfitStyle>>(
  (ref) => ref.watch(catalogRepositoryProvider).styles(),
);

final occasionsProvider = FutureProvider<List<Occasion>>(
  (ref) => ref.watch(catalogRepositoryProvider).occasions(),
);

final colorGuideProvider = FutureProvider<ColorGuide>(
  (ref) => ref.watch(catalogRepositoryProvider).colorGuide(),
);
