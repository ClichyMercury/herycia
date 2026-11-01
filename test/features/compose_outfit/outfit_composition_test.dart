import 'package:flutter_test/flutter_test.dart';
import 'package:herycia/features/catalog/domain/catalog_models.dart';
import 'package:herycia/features/compose_outfit/domain/composition_to_mannequin.dart';
import 'package:herycia/features/compose_outfit/domain/outfit_composition.dart';
import 'package:herycia/features/looks/domain/look_models.dart';
import 'package:herycia/features/mannequin/domain/garment_shape.dart';
import 'package:herycia/features/recommendation/domain/recommendation_models.dart';

import '../../helpers/pump_app.dart';

ComposedPiece piece(ClothingType type, [CatalogColor color = FakeCatalogRepository.navy]) =>
    ComposedPiece(type: type, color: color);

const scarfType = ClothingType(id: '53', categoryId: '5', name: 'Foulard', slug: 'foulard');
const tieType = ClothingType(id: '54', categoryId: '5', name: 'Cravate', slug: 'cravate');
const hatType = ClothingType(id: '55', categoryId: '5', name: 'Chapeau', slug: 'chapeau');

void main() {
  const shirt = FakeCatalogRepository.shirt;
  const jeans = FakeCatalogRepository.jeans;
  const dress = FakeCatalogRepository.dress;
  const sneakers = FakeCatalogRepository.sneakers;
  const watch = FakeCatalogRepository.watch;
  const belt = FakeCatalogRepository.belt;

  group('Pièces requises', () {
    test('vide : il manque haut, bas et chaussures', () {
      expect(OutfitComposition.empty.missingRequired, [
        CompositionRole.top,
        CompositionRole.bottom,
        CompositionRole.shoes,
      ]);
      expect(OutfitComposition.empty.isComplete, isFalse);
    });

    test('haut + bas + chaussures : complète, accessoires facultatifs', () {
      final c = OutfitComposition.empty
          .withPiece(CompositionRole.top, piece(shirt))
          .withPiece(CompositionRole.bottom, piece(jeans))
          .withPiece(CompositionRole.shoes, piece(sneakers));
      expect(c.isComplete, isTrue);
      expect(c.accessories, isEmpty);
    });

    test('robe + chaussures : complète sans haut ni bas', () {
      final c = OutfitComposition.empty
          .withPiece(CompositionRole.onePiece, piece(dress))
          .withPiece(CompositionRole.shoes, piece(sneakers));
      expect(c.isComplete, isTrue);
    });
  });

  group('Robe ou combinaison', () {
    test('remplace le duo haut/bas', () {
      final c = OutfitComposition.empty
          .withPiece(CompositionRole.top, piece(shirt))
          .withPiece(CompositionRole.bottom, piece(jeans))
          .withPiece(CompositionRole.onePiece, piece(dress));
      expect(c.top, isNull);
      expect(c.bottom, isNull);
      expect(c.onePiece, piece(dress));
    });

    test('choisir un haut retire la robe', () {
      final c = OutfitComposition.empty
          .withPiece(CompositionRole.onePiece, piece(dress))
          .withPiece(CompositionRole.top, piece(shirt));
      expect(c.onePiece, isNull);
      expect(c.top, piece(shirt));
      expect(c.missingRequired, [CompositionRole.bottom, CompositionRole.shoes]);
    });
  });

  group('Accessoires', () {
    test('pas de doublon : le même type remplace la couleur', () {
      final c = OutfitComposition.empty
          .withPiece(CompositionRole.accessory, piece(watch))
          .withPiece(CompositionRole.accessory, piece(watch, FakeCatalogRepository.camel));
      expect(c.accessories, [piece(watch, FakeCatalogRepository.camel)]);
    });

    test('limités à 4', () {
      var c = OutfitComposition.empty;
      for (final type in [watch, belt, scarfType, tieType, hatType]) {
        c = c.withPiece(CompositionRole.accessory, piece(type));
      }
      expect(c.accessories, hasLength(OutfitComposition.maxAccessories));
      expect(c.canAddAccessory, isFalse);
      expect(c.accessories.map((a) => a.type.id), isNot(contains(hatType.id)));
    });

    test('retrait ciblé', () {
      final c = OutfitComposition.empty
          .withPiece(CompositionRole.accessory, piece(watch))
          .withPiece(CompositionRole.accessory, piece(belt))
          .withoutAccessory(watch.id);
      expect(c.accessories, [piece(belt)]);
    });
  });

  test('retirer un rôle n’affecte pas les autres', () {
    final c = OutfitComposition.empty
        .withPiece(CompositionRole.top, piece(shirt))
        .withPiece(CompositionRole.shoes, piece(sneakers))
        .withoutRole(CompositionRole.top);
    expect(c.top, isNull);
    expect(c.shoes, piece(sneakers));
  });

  test('égalité par valeur', () {
    final a = OutfitComposition.empty.withPiece(CompositionRole.top, piece(shirt));
    final b = OutfitComposition.empty.withPiece(CompositionRole.top, piece(shirt));
    expect(a, b);
    expect(a.hashCode, b.hashCode);
  });

  group('compositionToMannequin', () {
    test('traduit chaque pièce en calque coloré', () {
      final outfit = compositionToMannequin(OutfitComposition.empty
          .withPiece(CompositionRole.top, piece(shirt))
          .withPiece(CompositionRole.bottom, piece(jeans, FakeCatalogRepository.camel))
          .withPiece(CompositionRole.shoes, piece(sneakers))
          .withPiece(CompositionRole.accessory, piece(watch)));
      expect(outfit.top!.shape, GarmentShape.collaredLongSleeve);
      expect(outfit.top!.color, FakeCatalogRepository.navy.color);
      expect(outfit.bottom!.shape, GarmentShape.trousers);
      expect(outfit.bottom!.color, FakeCatalogRepository.camel.color);
      expect(outfit.shoes!.shape, GarmentShape.lowShoes);
      expect(outfit.accessory(GarmentShape.watch), isNotNull);
    });

    test('ignore un accessoire sans dessin', () {
      final outfit = compositionToMannequin(
        OutfitComposition.empty.withPiece(CompositionRole.accessory, piece(hatType)),
      );
      expect(outfit.accessories, isEmpty);
    });
  });

  group('Changements proposés par le serveur', () {
    final byId = {for (final t in FakeCatalogRepository.typeList) t.id: t};
    final colors = {FakeCatalogRepository.navy.id: FakeCatalogRepository.navy, FakeCatalogRepository.camel.id: FakeCatalogRepository.camel};
    OutfitComposition apply(OutfitComposition c, OutfitChange change) =>
        c.applyChange(change, type: (id) => byId[id], color: (id) => colors[id]);

    final base = OutfitComposition.empty
        .withPiece(CompositionRole.top, piece(shirt))
        .withPiece(CompositionRole.bottom, piece(jeans));

    test('ajout : la pièce rejoint la tenue à sa place', () {
      final c = apply(
        base,
        OutfitChange(
          action: ChangeAction.addItem,
          item: RequestItem(clothingTypeId: sneakers.id, colorId: FakeCatalogRepository.camel.id, role: PieceRole.footwear),
        ),
      );
      expect(c.shoes, piece(sneakers, FakeCatalogRepository.camel));
      expect(c.isComplete, isTrue);
    });

    test('remplacement : l’index suit l’ordre des pièces envoyées', () {
      expect(base.toRequest().items.map((i) => i.role), [PieceRole.top, PieceRole.bottom]);
      final c = apply(
        base,
        OutfitChange(
          action: ChangeAction.replaceItem,
          itemIndex: 1,
          item: RequestItem(clothingTypeId: jeans.id, colorId: FakeCatalogRepository.camel.id, role: PieceRole.bottom),
        ),
      );
      expect(c.bottom!.color, FakeCatalogRepository.camel);
      expect(c.top, base.top);
    });

    test('retrait et index invalide sans effet de bord', () {
      expect(apply(base, const OutfitChange(action: ChangeAction.removeItem, itemIndex: 0)).top, isNull);
      expect(apply(base, const OutfitChange(action: ChangeAction.removeItem, itemIndex: 9)), base);
    });
  });

  test('veste portée par-dessus : rôle outerwear envoyé, mannequin à deux couches', () {
    final c = OutfitComposition.empty
        .withPiece(CompositionRole.top, piece(shirt))
        .withPiece(CompositionRole.outerwear, piece(FakeCatalogRepository.blazer, FakeCatalogRepository.camel));
    expect(c.toRequest().items.map((i) => i.role), [PieceRole.top, PieceRole.outerwear]);
    final m = compositionToMannequin(c);
    expect(m.top!.shape, GarmentShape.collaredLongSleeve);
    expect(m.outerwear!.shape, GarmentShape.outerwear);
    expect(c.missingRequired, isNot(contains(CompositionRole.outerwear)));
  });
}
