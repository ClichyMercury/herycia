import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../catalog/domain/catalog_models.dart';
import '../domain/outfit_composition.dart';

class CompositionController extends Notifier<OutfitComposition> {
  @override
  OutfitComposition build() => OutfitComposition.empty;

  void setPiece(CompositionRole role, ComposedPiece piece) =>
      state = state.withPiece(role, piece);

  void removeRole(CompositionRole role) => state = state.withoutRole(role);

  void removeAccessory(String typeId) => state = state.withoutAccessory(typeId);

  void reset() => state = OutfitComposition.empty;

  void setOccasion(String? slug) =>
      state = state.withContext(occasionSlug: slug, styleSlug: state.styleSlug);

  void setStyle(String? slug) =>
      state = state.withContext(occasionSlug: state.occasionSlug, styleSlug: slug);

  void recolor(CompositionRole role, String typeId, CatalogColor color) =>
      state = state.withPieceColor(role, typeId, color);

  void restore(OutfitComposition composition) => state = composition;
}

final compositionProvider = NotifierProvider<CompositionController, OutfitComposition>(
  CompositionController.new,
);
