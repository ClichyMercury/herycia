import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:herycia/features/mannequin/application/silhouette_provider.dart';
import 'package:herycia/features/mannequin/domain/body_silhouette.dart';
import 'package:herycia/features/mannequin/domain/garment_shape.dart';
import 'package:herycia/features/mannequin/domain/mannequin_outfit.dart';
import 'package:herycia/features/mannequin/presentation/mannequin_painter.dart';
import 'package:herycia/features/mannequin/presentation/mannequin_view.dart';

import '../../helpers/pump_app.dart';

const navy = Color(0xFF1F2A44);
const camel = Color(0xFFC19A6B);

void main() {
  group('GarmentShape.resolve', () {
    test('associe les slugs du catalogue à une forme', () {
      expect(GarmentShape.resolve(GarmentSlot.top, 't-shirt'), GarmentShape.shortSleeveTop);
      expect(GarmentShape.resolve(GarmentSlot.top, 'blazer'), GarmentShape.outerwear);
      expect(GarmentShape.resolve(GarmentSlot.bottom, 'jupe'), GarmentShape.skirt);
      expect(GarmentShape.resolve(GarmentSlot.onePiece, 'combinaison'), GarmentShape.jumpsuit);
      expect(GarmentShape.resolve(GarmentSlot.shoes, 'bottines'), GarmentShape.boots);
      expect(GarmentShape.resolve(GarmentSlot.accessory, 'bijoux'), GarmentShape.necklace);
    });

    test('un type inconnu ajouté par l’admin retombe sur une forme générique', () {
      expect(GarmentShape.resolve(GarmentSlot.top, 'cardigan'), GarmentShape.longSleeveTop);
      expect(GarmentShape.resolve(GarmentSlot.bottom, 'cargo'), GarmentShape.trousers);
      expect(GarmentShape.resolve(GarmentSlot.shoes, 'escarpins'), GarmentShape.lowShoes);
    });

    test('un accessoire inconnu n’est pas dessiné', () {
      expect(GarmentShape.resolve(GarmentSlot.accessory, 'chapeau'), isNull);
    });

    test('un slug utilisé dans le mauvais emplacement n’est pas détourné', () {
      expect(GarmentShape.resolve(GarmentSlot.top, 'jean'), GarmentShape.longSleeveTop);
    });

    test('chaque type du catalogue du serveur a une forme', () {
      const bySlot = {
        GarmentSlot.top: ['t-shirt', 'chemise', 'polo', 'blouse', 'pull', 'veste', 'blazer'],
        GarmentSlot.bottom: ['pantalon', 'jean', 'chino', 'jupe', 'short'],
        GarmentSlot.onePiece: ['robe', 'combinaison'],
        GarmentSlot.shoes: ['baskets', 'mocassins', 'chaussures-habillees', 'sandales', 'bottines'],
        GarmentSlot.accessory: ['ceinture', 'sac', 'montre', 'bijoux', 'lunettes', 'foulard', 'cravate'],
      };
      for (final MapEntry(key: slot, value: slugs) in bySlot.entries) {
        for (final slug in slugs) {
          expect(GarmentShape.resolve(slot, slug)?.slot, slot, reason: slug);
        }
      }
    });
  });

  group('MannequinOutfit.lerp', () {
    const a = MannequinOutfit(top: MannequinLayer(GarmentShape.shortSleeveTop, Colors.white));
    const b = MannequinOutfit(top: MannequinLayer(GarmentShape.shortSleeveTop, Colors.black));

    test('même forme : la couleur est interpolée', () {
      final mid = MannequinOutfit.lerp(a, b, 0.5);
      expect(mid.top!.shape, GarmentShape.shortSleeveTop);
      expect(mid.top!.color, Color.lerp(Colors.white, Colors.black, 0.5));
    });

    test('extrémités : on retrouve les tenues de départ et d’arrivée', () {
      expect(MannequinOutfit.lerp(a, b, 0), a);
      expect(MannequinOutfit.lerp(a, b, 1), b);
    });

    test('forme différente ou pièce ajoutée : bascule à mi-parcours', () {
      const c = MannequinOutfit(top: MannequinLayer(GarmentShape.outerwear, camel));
      expect(MannequinOutfit.lerp(a, c, 0.4).top!.shape, GarmentShape.shortSleeveTop);
      expect(MannequinOutfit.lerp(a, c, 0.6).top!.shape, GarmentShape.outerwear);
      expect(MannequinOutfit.lerp(MannequinOutfit.empty, a, 0.4).top, isNull);
      expect(MannequinOutfit.lerp(MannequinOutfit.empty, a, 0.6).top, a.top);
    });

    test('accessoires interpolés par forme', () {
      const x = MannequinOutfit(accessories: [MannequinLayer(GarmentShape.belt, Colors.white)]);
      const y = MannequinOutfit(accessories: [
        MannequinLayer(GarmentShape.belt, Colors.black),
        MannequinLayer(GarmentShape.watch, navy),
      ]);
      final mid = MannequinOutfit.lerp(x, y, 0.75);
      expect(mid.accessory(GarmentShape.belt)!.color, Color.lerp(Colors.white, Colors.black, 0.75));
      expect(mid.accessory(GarmentShape.watch)!.color, navy);
    });
  });

  group('MannequinPainter', () {
    test('se redessine seulement si quelque chose change', () {
      MannequinPainter painter(MannequinOutfit outfit, [BodySilhouette s = BodySilhouette.straight]) =>
          MannequinPainter(
            silhouette: s,
            outfit: outfit,
            bodyColor: Colors.grey,
            outlineColor: Colors.black,
          );
      const outfit = MannequinOutfit(shoes: MannequinLayer(GarmentShape.lowShoes, navy));
      expect(painter(outfit).shouldRepaint(painter(outfit)), isFalse);
      expect(painter(outfit).shouldRepaint(painter(MannequinOutfit.empty)), isTrue);
      expect(
        painter(outfit).shouldRepaint(painter(outfit, BodySilhouette.broad)),
        isTrue,
      );
    });

    testWidgets('dessine toutes les formes sur toutes les silhouettes sans erreur', (tester) async {
      for (final silhouette in BodySilhouette.values) {
        for (final shape in GarmentShape.values) {
          final layer = MannequinLayer(shape, camel);
          final outfit = switch (shape.slot) {
            GarmentSlot.top => MannequinOutfit(top: layer),
            GarmentSlot.bottom => MannequinOutfit(bottom: layer),
            GarmentSlot.onePiece => MannequinOutfit(onePiece: layer),
            GarmentSlot.shoes => MannequinOutfit(shoes: layer),
            GarmentSlot.accessory => MannequinOutfit(accessories: [layer]),
          };
          await tester.pumpWidget(SizedBox(
            width: 200,
            height: 440,
            child: CustomPaint(
              painter: MannequinPainter(
                silhouette: silhouette,
                outfit: outfit,
                bodyColor: Colors.grey,
                outlineColor: Colors.black,
              ),
            ),
          ));
          expect(tester.takeException(), isNull, reason: '$silhouette $shape');
        }
      }
    });
  });

  test('limb produit un contour fermé qui contient son axe', () {
    final path = limb(const [Offset(0, 0), Offset(0, 100)], const [10, 10]);
    expect(path.contains(const Offset(0, 50)), isTrue);
    expect(path.contains(const Offset(30, 50)), isFalse);
  });

  test('smoothPolygon contient le centre du polygone', () {
    final path = smoothPolygon(const [Offset(0, 0), Offset(100, 0), Offset(100, 100), Offset(0, 100)]);
    expect(path.contains(const Offset(50, 50)), isTrue);
  });

  group('MannequinPreview', () {
    testWidgets('annonce la tenue et change de silhouette', (tester) async {
      final handle = tester.ensureSemantics();
      await tester.pumpDs(const MannequinPreview(
        outfit: MannequinOutfit(top: MannequinLayer(GarmentShape.shortSleeveTop, navy)),
        semanticsLabel: 'Aperçu de la tenue : T-shirt bleu marine',
      ));
      expect(find.bySemanticsLabel('Aperçu de la tenue : T-shirt bleu marine'), findsOneWidget);
      expect(find.text('Droite'), findsOneWidget);
      expect(find.text('Sablier'), findsOneWidget);
      expect(find.text('Ample'), findsOneWidget);

      await tester.tap(find.byKey(const ValueKey('silhouette-broad')));
      await tester.pumpAndSettle();
      final view = tester.widget<MannequinView>(find.byType(MannequinView));
      expect(view.silhouette, BodySilhouette.broad);
      handle.dispose();
    });

    test('silhouette par défaut : droite', () {
      final container = ProviderContainer(overrides: baseOverrides());
      addTearDown(container.dispose);
      expect(container.read(silhouetteProvider), BodySilhouette.straight);
      container.read(silhouetteProvider.notifier).select(BodySilhouette.hourglass);
      expect(container.read(silhouetteProvider), BodySilhouette.hourglass);
    });
  });
}
