import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/api/api_providers.dart';
import '../data/api_wardrobe_repositories.dart';
import '../domain/wardrobe_repositories.dart';

final favoritesRepositoryProvider = Provider<FavoritesRepository>(
  (ref) => ApiFavoritesRepository(ref.watch(apiClientProvider)),
);

final savedOutfitsRepositoryProvider = Provider<SavedOutfitsRepository>(
  (ref) => ApiSavedOutfitsRepository(ref.watch(apiClientProvider)),
);
