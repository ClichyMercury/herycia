import 'package:flutter/foundation.dart';

import '../../catalog/domain/catalog_models.dart';
import '../../looks/domain/look_models.dart';
import '../../recommendation/domain/recommendation_models.dart';

enum CompositionRole {
  top(CategoryGroup.top, PieceRole.top),
  bottom(CategoryGroup.bottom, PieceRole.bottom),
  onePiece(CategoryGroup.onePiece, PieceRole.onePiece),
  shoes(CategoryGroup.shoes, PieceRole.shoes),
  accessory(CategoryGroup.accessory, PieceRole.accessory);

  const CompositionRole(this.group, this.pieceRole);

  final CategoryGroup group;
  final PieceRole pieceRole;

  static CompositionRole fromPieceRole(PieceRole role) => values.firstWhere((r) => r.pieceRole == role);
}

@immutable
class ComposedPiece {
  const ComposedPiece({required this.type, required this.color});

  final ClothingType type;
  final CatalogColor color;

  @override
  bool operator ==(Object other) =>
      other is ComposedPiece && other.type == type && other.color == color;

  @override
  int get hashCode => Object.hash(type, color);
}

@immutable
class OutfitComposition {
  const OutfitComposition({
    this.top,
    this.bottom,
    this.onePiece,
    this.shoes,
    this.accessories = const [],
    this.occasionSlug,
    this.styleSlug,
  });

  static const empty = OutfitComposition();
  static const maxAccessories = 4;

  final ComposedPiece? top;
  final ComposedPiece? bottom;
  final ComposedPiece? onePiece;
  final ComposedPiece? shoes;
  final List<ComposedPiece> accessories;
  final String? occasionSlug;
  final String? styleSlug;

  bool get hasOnePiece => onePiece != null;

  bool get canAddAccessory => accessories.length < maxAccessories;

  bool get isEmpty =>
      top == null && bottom == null && onePiece == null && shoes == null && accessories.isEmpty;

  List<CompositionRole> get missingRequired => [
        if (!hasOnePiece && top == null) CompositionRole.top,
        if (!hasOnePiece && bottom == null) CompositionRole.bottom,
        if (shoes == null) CompositionRole.shoes,
      ];

  bool get isComplete => missingRequired.isEmpty;

  List<ComposedPiece> get pieces => [?top, ?bottom, ?onePiece, ?shoes, ...accessories];

  List<(CompositionRole, ComposedPiece)> get rolePieces => [
        if (top != null) (CompositionRole.top, top!),
        if (bottom != null) (CompositionRole.bottom, bottom!),
        if (onePiece != null) (CompositionRole.onePiece, onePiece!),
        if (shoes != null) (CompositionRole.shoes, shoes!),
        for (final a in accessories) (CompositionRole.accessory, a),
      ];

  OutfitRequest toRequest() => OutfitRequest(
        items: [
          for (final (role, piece) in rolePieces)
            RequestItem(clothingTypeId: piece.type.id, colorId: piece.color.id, role: role.pieceRole),
        ],
        occasionSlug: occasionSlug,
        styleSlug: styleSlug,
      );

  OutfitComposition withContext({String? occasionSlug, String? styleSlug}) => OutfitComposition(
        top: top,
        bottom: bottom,
        onePiece: onePiece,
        shoes: shoes,
        accessories: accessories,
        occasionSlug: occasionSlug,
        styleSlug: styleSlug,
      );

  OutfitComposition withPieceColor(CompositionRole role, String typeId, CatalogColor color) {
    if (role == CompositionRole.accessory) {
      return _copy(accessories: [
        for (final a in accessories) a.type.id == typeId ? ComposedPiece(type: a.type, color: color) : a,
      ]);
    }
    final current = pieceFor(role);
    if (current == null) return this;
    return withPiece(role, ComposedPiece(type: current.type, color: color));
  }

  ComposedPiece? pieceFor(CompositionRole role) => switch (role) {
        CompositionRole.top => top,
        CompositionRole.bottom => bottom,
        CompositionRole.onePiece => onePiece,
        CompositionRole.shoes => shoes,
        CompositionRole.accessory => null,
      };

  OutfitComposition withPiece(CompositionRole role, ComposedPiece piece) => switch (role) {
        CompositionRole.top => _copy(top: piece, onePiece: null),
        CompositionRole.bottom => _copy(bottom: piece, onePiece: null),
        CompositionRole.onePiece => _copy(onePiece: piece, top: null, bottom: null),
        CompositionRole.shoes => _copy(shoes: piece),
        CompositionRole.accessory => _withAccessory(piece),
      };

  OutfitComposition withoutRole(CompositionRole role) => switch (role) {
        CompositionRole.top => _copy(top: null),
        CompositionRole.bottom => _copy(bottom: null),
        CompositionRole.onePiece => _copy(onePiece: null),
        CompositionRole.shoes => _copy(shoes: null),
        CompositionRole.accessory => _copy(accessories: const []),
      };

  OutfitComposition withoutAccessory(String typeId) => _copy(
        accessories: [for (final a in accessories) if (a.type.id != typeId) a],
      );

  OutfitComposition _withAccessory(ComposedPiece piece) {
    final index = accessories.indexWhere((a) => a.type.id == piece.type.id);
    if (index >= 0) {
      return _copy(accessories: [...accessories]..[index] = piece);
    }
    if (!canAddAccessory) return this;
    return _copy(accessories: [...accessories, piece]);
  }

  static const _keep = Object();

  OutfitComposition _copy({
    Object? top = _keep,
    Object? bottom = _keep,
    Object? onePiece = _keep,
    Object? shoes = _keep,
    List<ComposedPiece>? accessories,
  }) =>
      OutfitComposition(
        top: identical(top, _keep) ? this.top : top as ComposedPiece?,
        bottom: identical(bottom, _keep) ? this.bottom : bottom as ComposedPiece?,
        onePiece: identical(onePiece, _keep) ? this.onePiece : onePiece as ComposedPiece?,
        shoes: identical(shoes, _keep) ? this.shoes : shoes as ComposedPiece?,
        accessories: accessories ?? this.accessories,
        occasionSlug: occasionSlug,
        styleSlug: styleSlug,
      );

  @override
  bool operator ==(Object other) =>
      other is OutfitComposition &&
      other.top == top &&
      other.bottom == bottom &&
      other.onePiece == onePiece &&
      other.shoes == shoes &&
      other.occasionSlug == occasionSlug &&
      other.styleSlug == styleSlug &&
      listEquals(other.accessories, accessories);

  @override
  int get hashCode =>
      Object.hash(top, bottom, onePiece, shoes, Object.hashAll(accessories), occasionSlug, styleSlug);
}
