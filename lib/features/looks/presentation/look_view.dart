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

  static List<LookPiece> _pieces(
    CatalogLookup lookup,
    Iterable<({String typeId, String colorId, PieceRole role, bool isAnchor})> items,
  ) =>
      [
        for (final i in items)
          if (lookup.type(i.typeId) case final type?)
            if (lookup.color(i.colorId) case final color?)
              LookPiece(type: type, color: color, role: i.role, isAnchor: i.isAnchor),
      ];

  factory LookView.fromLook(Look look, CatalogLookup lookup) => LookView(
        title: look.title,
        outfitId: look.id,
        description: look.description,
        image: look.primaryImage != null && look.primaryImage!.usageApproved ? look.primaryImage : null,
        occasion: look.occasionId == null ? null : lookup.occasion(look.occasionId!),
        style: look.styleId == null ? null : lookup.style(look.styleId!),
        pieces: _pieces(lookup, [
          for (final i in [...look.items]..sort((a, b) => a.sortOrder.compareTo(b.sortOrder)))
            (typeId: i.clothingTypeId, colorId: i.colorId, role: i.role, isAnchor: false),
        ]),
      );

  factory LookView.fromRecommendation(
    RecommendedLook look,
    CatalogLookup lookup, {
    required String requestId,
    Occasion? occasion,
    OutfitStyle? style,
  }) =>
      LookView(
        title: look.title,
        outfitId: look.outfitId,
        image: look.image,
        explanation: look.explanation,
        score: look.score,
        breakdown: look.breakdown,
        occasion: occasion,
        style: style,
        requestId: requestId,
        pieces: _pieces(lookup, [
          for (final i in look.items)
            (typeId: i.clothingTypeId, colorId: i.colorId, role: i.role, isAnchor: i.isAnchor),
        ]),
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
      shoes: layer(first(PieceRole.shoes), GarmentSlot.shoes),
      accessories: [
        for (final p in pieces.where((p) => p.role == PieceRole.accessory))
          ?layer(p, GarmentSlot.accessory),
      ],
    );
  }

  String get semantics => [
        title,
        for (final p in pieces) '${p.type.name} ${p.color.name.toLowerCase()}',
      ].join(', ');
}
