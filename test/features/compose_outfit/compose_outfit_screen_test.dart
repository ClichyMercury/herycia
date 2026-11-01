import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:herycia/design_system/design_system.dart';
import 'package:herycia/features/catalog/application/catalog_providers.dart';
import 'package:herycia/features/compose_outfit/presentation/compose_outfit_screen.dart';
import 'package:herycia/features/mannequin/domain/garment_shape.dart';
import 'package:herycia/features/mannequin/presentation/mannequin_view.dart';

import '../../helpers/pump_app.dart';

Future<void> pumpCompose(WidgetTester tester) async {
  await tester.binding.setSurfaceSize(const Size(430, 932));
  addTearDown(() => tester.binding.setSurfaceSize(null));
  await tester.pumpDs(
    const ComposeOutfitScreen(),
    overrides: [catalogRepositoryProvider.overrideWithValue(FakeCatalogRepository())],
  );
  await tester.pumpAndSettle();
}

Future<void> reveal(WidgetTester tester, Finder finder) async {
  await tester.scrollUntilVisible(
    finder,
    200,
    scrollable: find.byType(Scrollable).first,
  );
  await tester.pumpAndSettle();
}

Future<void> pick(WidgetTester tester, String slotKey, String type, String colorSlug) async {
  final slot = find.byKey(ValueKey(slotKey));
  await reveal(tester, slot);
  await tester.tap(slot);
  await tester.pumpAndSettle();
  await tester.tap(find.text(type).last);
  await tester.pumpAndSettle();
  await tester.tap(find.byKey(ValueKey('swatch-$colorSlug')));
  await tester.pumpAndSettle();
  await tester.tap(find.byKey(const ValueKey('picker-confirm')));
  await tester.pumpAndSettle();
}

MannequinView mainMannequin(WidgetTester tester) =>
    tester.widget<MannequinView>(find.byType(MannequinView).first);

Future<void> backToTop(WidgetTester tester) async {
  await tester.scrollUntilVisible(
    find.byType(MannequinView),
    -300,
    scrollable: find.byType(Scrollable).first,
  );
  await tester.pumpAndSettle();
}

AppButton evaluateButton(WidgetTester tester) =>
    tester.widget<AppButton>(find.byKey(const ValueKey('compose-evaluate')));

void main() {
  testWidgets('état initial : mannequin nu, évaluation désactivée', (tester) async {
    await pumpCompose(tester);
    expect(mainMannequin(tester).outfit.isEmpty, isTrue);
    expect(find.text('Il manque : haut, bas, chaussures'), findsOneWidget);
    expect(evaluateButton(tester).onPressed, isNull);
  });

  testWidgets('choisir une pièce habille le mannequin', (tester) async {
    await pumpCompose(tester);
    await pick(tester, 'slot-top', 'Chemise', 'bleu-marine');

    await reveal(tester, find.text('Chemise · Bleu marine'));
    expect(find.text('Chemise · Bleu marine'), findsOneWidget);
    final outfit = mainMannequin(tester).outfit;
    expect(outfit.top!.shape, GarmentShape.collaredLongSleeve);
    expect(outfit.top!.color, FakeCatalogRepository.navy.color);
  });

  testWidgets('aperçu en direct dans la feuille avant validation', (tester) async {
    await pumpCompose(tester);
    await reveal(tester, find.byKey(const ValueKey('slot-shoes')));
    await tester.tap(find.byKey(const ValueKey('slot-shoes')));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Baskets').last);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const ValueKey('swatch-camel')));
    await tester.pumpAndSettle();

    final sheetPreview = tester.widget<MannequinView>(find.byType(MannequinView).last);
    expect(sheetPreview.outfit.shoes!.color, FakeCatalogRepository.camel.color);
    Navigator.of(tester.element(find.byType(MannequinView).last)).pop();
    await tester.pumpAndSettle();
    await backToTop(tester);
    expect(mainMannequin(tester).outfit.shoes, isNull);
  });

  testWidgets('tenue complète : bouton Évaluer actif', (tester) async {
    await pumpCompose(tester);
    await pick(tester, 'slot-top', 'Chemise', 'bleu-marine');
    await pick(tester, 'slot-bottom', 'Jean', 'bleu-marine');
    await pick(tester, 'slot-shoes', 'Baskets', 'camel');

    expect(find.text('Tenue prête à évaluer'), findsOneWidget);
    expect(evaluateButton(tester).onPressed, isNotNull);
  });

  testWidgets('une robe remplace haut et bas', (tester) async {
    await pumpCompose(tester);
    await pick(tester, 'slot-top', 'Chemise', 'bleu-marine');
    await pick(tester, 'slot-onePiece', 'Robe', 'camel');

    expect(find.text('remplacé par : robe'), findsNWidgets(2));
    final outfit = mainMannequin(tester).outfit;
    expect(outfit.top, isNull);
    expect(outfit.onePiece!.shape, GarmentShape.dress);
    expect(find.text('Il manque : chaussures'), findsOneWidget);
  });

  testWidgets('retirer une pièce puis annuler la restaure', (tester) async {
    await pumpCompose(tester);
    await pick(tester, 'slot-top', 'Chemise', 'bleu-marine');

    await reveal(tester, find.byKey(const ValueKey('slot-top')));
    await tester.tap(find.byKey(const ValueKey('slot-top')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const ValueKey('picker-remove')));
    await tester.pumpAndSettle();
    expect(find.text('Chemise · Bleu marine'), findsNothing);
    expect(find.text('Pièce retirée'), findsOneWidget);

    await tester.tap(find.text('Annuler'));
    await tester.pumpAndSettle();
    await reveal(tester, find.text('Chemise · Bleu marine'));
    expect(find.text('Chemise · Bleu marine'), findsOneWidget);
  });

  testWidgets('ajouter et modifier un accessoire', (tester) async {
    await pumpCompose(tester);
    await pick(tester, 'slot-accessory-add', 'Montre', 'bleu-marine');
    await reveal(tester, find.text('Montre · Bleu marine'));
    expect(find.text('Montre · Bleu marine'), findsOneWidget);

    await reveal(tester, find.byKey(const ValueKey('accessory-t-watch')));
    await tester.tap(find.byKey(const ValueKey('accessory-t-watch')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const ValueKey('swatch-camel')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const ValueKey('picker-confirm')));
    await tester.pumpAndSettle();

    expect(find.text('Montre · Camel'), findsOneWidget);
    expect(find.text('Montre · Bleu marine'), findsNothing);
    await backToTop(tester);
    expect(mainMannequin(tester).outfit.accessory(GarmentShape.watch)!.color,
        FakeCatalogRepository.camel.color);
  });

  testWidgets('retour du choix de couleur vers le choix du type', (tester) async {
    await pumpCompose(tester);
    await tester.tap(find.byKey(const ValueKey('slot-top')));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Chemise').last);
    await tester.pumpAndSettle();
    expect(find.text('Quelle couleur ?'), findsOneWidget);
    await tester.tap(find.byKey(const ValueKey('picker-back')));
    await tester.pumpAndSettle();
    expect(find.text('Quel type ?'), findsOneWidget);
  });

  testWidgets('tout effacer puis annuler', (tester) async {
    await pumpCompose(tester);
    await pick(tester, 'slot-top', 'Chemise', 'bleu-marine');
    await reveal(tester, find.byType(MannequinView).first);
    await tester.tap(find.byKey(const ValueKey('compose-reset')));
    await tester.pumpAndSettle();
    expect(mainMannequin(tester).outfit.isEmpty, isTrue);
    await tester.tap(find.text('Annuler'));
    await tester.pumpAndSettle();
    expect(mainMannequin(tester).outfit.top, isNotNull);
  });

  testWidgets('veste facultative : seuls veste et blazer, portée par-dessus le haut', (tester) async {
    await pumpCompose(tester);
    await pick(tester, 'slot-top', 'Chemise', 'bleu-marine');
    final slot = find.byKey(const ValueKey('slot-outerwear'));
    await reveal(tester, slot);
    await tester.tap(slot);
    await tester.pumpAndSettle();
    expect(find.text('Chemise'), findsNothing);
    await tester.tap(find.text('Blazer').last);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const ValueKey('swatch-camel')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const ValueKey('picker-confirm')));
    await tester.pumpAndSettle();

    final outfit = mainMannequin(tester).outfit;
    expect(outfit.top!.shape, GarmentShape.collaredLongSleeve);
    expect(outfit.outerwear!.shape, GarmentShape.outerwear);
    expect(outfit.outerwear!.color, FakeCatalogRepository.camel.color);
  });
}
