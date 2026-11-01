import 'dart:ui';

import 'package:flutter/foundation.dart';

import 'garment_shape.dart';

@immutable
class MannequinLayer {
  const MannequinLayer(this.shape, this.color);

  final GarmentShape shape;
  final Color color;

  static MannequinLayer? lerp(MannequinLayer? a, MannequinLayer? b, double t) {
    if (a != null && b != null && a.shape == b.shape) {
      return MannequinLayer(a.shape, Color.lerp(a.color, b.color, t)!);
    }
    return t < 0.5 ? a : b;
  }

  @override
  bool operator ==(Object other) =>
      other is MannequinLayer && other.shape == shape && other.color == color;

  @override
  int get hashCode => Object.hash(shape, color);
}

@immutable
class MannequinOutfit {
  const MannequinOutfit({
    this.top,
    this.bottom,
    this.onePiece,
    this.outerwear,
    this.shoes,
    this.accessories = const [],
  });

  static const empty = MannequinOutfit();

  final MannequinLayer? top;
  final MannequinLayer? bottom;
  final MannequinLayer? onePiece;
  final MannequinLayer? outerwear;
  final MannequinLayer? shoes;
  final List<MannequinLayer> accessories;

  bool get isEmpty =>
      top == null && bottom == null && onePiece == null && outerwear == null && shoes == null && accessories.isEmpty;

  MannequinLayer? accessory(GarmentShape shape) {
    for (final a in accessories) {
      if (a.shape == shape) return a;
    }
    return null;
  }

  static MannequinOutfit lerp(MannequinOutfit a, MannequinOutfit b, double t) {
    final shapes = {...a.accessories.map((l) => l.shape), ...b.accessories.map((l) => l.shape)};
    return MannequinOutfit(
      top: MannequinLayer.lerp(a.top, b.top, t),
      bottom: MannequinLayer.lerp(a.bottom, b.bottom, t),
      onePiece: MannequinLayer.lerp(a.onePiece, b.onePiece, t),
      outerwear: MannequinLayer.lerp(a.outerwear, b.outerwear, t),
      shoes: MannequinLayer.lerp(a.shoes, b.shoes, t),
      accessories: [
        for (final shape in shapes)
          ?MannequinLayer.lerp(a.accessory(shape), b.accessory(shape), t),
      ],
    );
  }

  @override
  bool operator ==(Object other) =>
      other is MannequinOutfit &&
      other.top == top &&
      other.bottom == bottom &&
      other.onePiece == onePiece &&
      other.outerwear == outerwear &&
      other.shoes == shoes &&
      listEquals(other.accessories, accessories);

  @override
  int get hashCode => Object.hash(top, bottom, onePiece, outerwear, shoes, Object.hashAll(accessories));
}
