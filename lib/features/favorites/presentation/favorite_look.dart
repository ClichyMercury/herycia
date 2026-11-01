import '../../catalog/application/catalog_lookup.dart';
import '../../catalog/domain/catalog_models.dart';
import '../../looks/domain/look_models.dart';
import '../../looks/presentation/look_view.dart';
import '../application/favorites_controller.dart';
import '../domain/wardrobe_models.dart';

LookView snapshotToLook(LookSnapshot snapshot, CatalogLookup lookup, {String? outfitId}) {
  final image = snapshot.image;
  return LookView(
    title: snapshot.title,
    outfitId: outfitId,
    occasion: snapshot.occasion == null
        ? null
        : lookup.occasionBySlug(snapshot.occasion!.slug) ??
            Occasion(id: snapshot.occasion!.slug, name: snapshot.occasion!.name, slug: snapshot.occasion!.slug),
    style: snapshot.style == null
        ? null
        : lookup.styleBySlug(snapshot.style!.slug) ??
            OutfitStyle(id: snapshot.style!.slug, name: snapshot.style!.name, slug: snapshot.style!.slug),
    image: image == null
        ? null
        : LookImage(
            id: image.url,
            url: image.url,
            thumbnailUrl: image.thumbnailUrl,
            altText: image.altText,
            credit: image.credit,
            licenseType: image.licenseType,
          ),
    pieces: [
      for (final i in snapshot.items)
        LookPiece(
          type: lookup.typeBySlug(i.clothingType.slug) ??
              ClothingType(id: i.clothingType.slug, categoryId: '', name: i.clothingType.name, slug: i.clothingType.slug),
          color: lookup.colorBySlug(i.color.slug) ??
              CatalogColor(
                id: i.color.slug,
                name: i.color.name,
                slug: i.color.slug,
                hexCode: i.color.hexCode,
                colorFamily: '',
              ),
          role: i.role,
        ),
    ],
  );
}

LookView favoriteToLook(LocalFavorite favorite, CatalogLookup lookup) =>
    snapshotToLook(favorite.snapshot, lookup, outfitId: favorite.outfitId);
