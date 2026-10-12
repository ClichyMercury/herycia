import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/wardrobe_models.dart';
import 'wardrobe_providers.dart';

final savedOutfitsProvider = FutureProvider.autoDispose<List<SavedOutfit>>(
  (ref) async => (await ref.watch(savedOutfitsRepositoryProvider).list())
    ..sort((a, b) => b.updatedAt.compareTo(a.updatedAt)),
);
