import 'package:flutter/foundation.dart';

import '../../catalog/application/catalog_lookup.dart';
import '../../catalog/domain/catalog_models.dart';
import '../../mannequin/domain/garment_shape.dart';
import '../../mannequin/domain/mannequin_outfit.dart';
import '../../recommendation/domain/recommendation_models.dart';
import '../domain/look_models.dart';

@immutable
class LookPiece {
  const LookPiece({required this.type, required this.color, required this.role, this.isAnchor = false});

  final ClothingType type;
  final CatalogColor color;
  final PieceRole role;
  final bool isAnchor;

  RequestItem toRequestItem() => RequestItem(clothingTypeId: type.id, colorId: color.id, role: role);

  @override
  bool operator ==(Object other) =>
      other is LookPiece &&
      other.type == type &&
      other.color == color &&
      other.role == role &&
      other.isAnchor == isAnchor;

  @override
  int get hashCode => Object.hash(type, color, role, isAnchor);
}

@immutable
class LookView {
  const LookView({
    required this.title,
    required this.pieces,
    this.outfitId,
    this.description,
    this.image,
    this.explanation,
    this.score,
    this.breakdown,
    this.occasion,
    this.style,
    this.requestId,
    this.rulesVersion,
  });

  final String title;
  final List<LookPiece> pieces;
  final String? outfitId;
  final String? description;
  final LookImage? image;
  final String? explanation;
  final int? score;
  final ScoreBreakdown? breakdown;
  final Occasion? occasion;
  final OutfitStyle? style;
  final String? requestId;
  final int? rulesVersion;

  bool get isPublishedLook => outfitId != null && requestId == null;

  static Occasion? _occasion(CatalogLookup lookup, CatalogRef? ref) =>
      ref == null ? null : lookup.occasionBySlug(ref.slug) ?? Occasion(id: ref.id, name: ref.name, slug: ref.slug);

  static OutfitStyle? _style(CatalogLookup lookup, CatalogRef? ref) =>
      ref == null ? null : lookup.styleBySlug(ref.slug) ?? OutfitStyle(id: ref.id, name: ref.name, slug: ref.slug);

  factory LookView.fromLook(Look look, CatalogLookup lookup) => LookView(
        title: look.title,
        outfitId: look.id,
        description: look.description,
        image: look.image,
        occasion: _occasion(lookup, look.occasion),
        style: _style(lookup, look.style),
        pieces: [
          for (final i in [...look.items]..sort((a, b) => a.sortOrder.compareTo(b.sortOrder)))
            LookPiece(type: lookup.typeOf(i.clothingType), color: lookup.colorOf(i.color), role: i.role),
        ],
      );

  factory LookView.fromRecommendation(
    RecommendedLook look,
    CatalogLookup lookup, {
    required String requestId,
    int? rulesVersion,
    Occasion? occasion,
    OutfitStyle? style,
  }) =>
      LookView(
        title: look.title,
        outfitId: look.outfitId,
        image: look.image,
        explanation: look.explanation,
        score: look.score,
        breakdown: look.scoreBreakdown,
        occasion: occasion,
        style: style,
        requestId: requestId,
        rulesVersion: rulesVersion,
        pieces: [
          for (final i in look.items)
            LookPiece(
              type: lookup.typeOf(i.clothingType),
              color: lookup.colorOf(i.color),
              role: i.role,
              isAnchor: i.isStartingItem,
            ),
        ],
      );

  MannequinOutfit toMannequin() {
    MannequinLayer? layer(LookPiece? piece, GarmentSlot slot) {
      if (piece == null) return null;
      final shape = GarmentShape.resolve(slot, piece.type.slug);
      return shape == null ? null : MannequinLayer(shape, piece.color.color);
    }

    LookPiece? first(PieceRole role) => pieces.where((p) => p.role == role).firstOrNull;
    return MannequinOutfit(
      top: layer(first(PieceRole.top), GarmentSlot.top),
      bottom: layer(first(PieceRole.bottom), GarmentSlot.bottom),
      onePiece: layer(first(PieceRole.onePiece), GarmentSlot.onePiece),
      outerwear: layer(first(PieceRole.outerwear), GarmentSlot.top),
      shoes: layer(first(PieceRole.footwear), GarmentSlot.shoes),
      accessories: [
        for (final p in pieces.where((p) => p.role == PieceRole.accessory)) ?layer(p, GarmentSlot.accessory),
      ],
    );
  }

  String get semantics => [
        title,
        for (final p in pieces) '${p.type.name} ${p.color.name.toLowerCase()}',
      ].join(', ');
}
