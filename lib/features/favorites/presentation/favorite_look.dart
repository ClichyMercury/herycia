import '../../catalog/application/catalog_lookup.dart';
import '../../looks/presentation/look_view.dart';
import '../application/favorites_controller.dart';

LookView favoriteToLook(LocalFavorite favorite, CatalogLookup lookup) {
  final snapshot = favorite.snapshot;
  return LookView(
    title: snapshot.title,
    outfitId: favorite.outfitId,
    explanation: snapshot.explanation,
    score: snapshot.score,
    occasion: lookup.occasionBySlug(snapshot.occasionSlug),
    style: lookup.styleBySlug(snapshot.styleSlug),
    pieces: [
      for (final i in snapshot.items)
        if (lookup.type(i.clothingTypeId) case final type?)
          if (lookup.color(i.colorId) case final color?) LookPiece(type: type, color: color, role: i.role),
    ],
  );
}
