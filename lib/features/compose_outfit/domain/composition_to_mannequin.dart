import '../../mannequin/domain/garment_shape.dart';
import '../../mannequin/domain/mannequin_outfit.dart';
import 'outfit_composition.dart';

MannequinLayer? _layer(ComposedPiece? piece, GarmentSlot slot) {
  if (piece == null) return null;
  final shape = GarmentShape.resolve(slot, piece.type.slug);
  return shape == null ? null : MannequinLayer(shape, piece.color.color);
}

MannequinOutfit compositionToMannequin(OutfitComposition composition) => MannequinOutfit(
      top: _layer(composition.top, GarmentSlot.top),
      bottom: _layer(composition.bottom, GarmentSlot.bottom),
      onePiece: _layer(composition.onePiece, GarmentSlot.onePiece),
      shoes: _layer(composition.shoes, GarmentSlot.shoes),
      accessories: [
        for (final a in composition.accessories) ?_layer(a, GarmentSlot.accessory),
      ],
    );
