import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:herycia/design_system/design_system.dart';

import '../helpers/pump_app.dart';

void main() {
  group('AppButton', () {
    testWidgets('déclenche onPressed', (tester) async {
      var taps = 0;
      await tester.pumpDs(AppButton(label: 'Voir les tenues', onPressed: () => taps++));
      await tester.tap(find.text('Voir les tenues'));
      expect(taps, 1);
    });

    testWidgets('en chargement : indicateur visible, aucun appui possible', (tester) async {
      var taps = 0;
      await tester.pumpDs(AppButton(label: 'Évaluer', isLoading: true, onPressed: () => taps++));
      expect(find.byType(HeryciaLoader), findsOneWidget);
      expect(find.text('Évaluer'), findsNothing);
      await tester.tap(find.byType(AppButton));
      expect(taps, 0);
    });

    testWidgets('garde la même taille en chargement', (tester) async {
      await tester.pumpDs(const Center(child: AppButton(label: 'Évaluer', onPressed: null)));
      final idle = tester.getSize(find.byType(AppButton));
      await tester.pumpDs(Center(child: AppButton(label: 'Évaluer', isLoading: true, onPressed: () {})));
      expect(tester.getSize(find.byType(AppButton)), idle);
    });

    testWidgets('désactivé : opacité 0,4', (tester) async {
      await tester.pumpDs(const AppButton(label: 'Évaluer', onPressed: null));
      final opacity = tester.widget<Opacity>(
        find.descendant(of: find.byType(AppButton), matching: find.byType(Opacity)),
      );
      expect(opacity.opacity, 0.4);
    });

    testWidgets('la petite taille garde une cible tactile de 48 px', (tester) async {
      await tester.pumpDs(
        Center(child: AppButton(label: 'Ok', size: AppButtonSize.sm, onPressed: () {})),
      );
      expect(tester.getSize(find.byType(AppButton)).height, greaterThanOrEqualTo(48));
    });
  });

  group('AppColorSwatch', () {
    testWidgets('annonce le nom et l’état de sélection', (tester) async {
      final handle = tester.ensureSemantics();
      await tester.pumpDs(const Row(children: [
        AppColorSwatch(color: Color(0xFF1F2A44), name: 'Bleu marine', selected: true),
        AppColorSwatch(color: Color(0xFFC19A6B), name: 'Camel'),
      ]));
      expect(find.bySemanticsLabel('Couleur Bleu marine, sélectionnée'), findsOneWidget);
      expect(find.bySemanticsLabel('Couleur Camel, non sélectionnée'), findsOneWidget);
      handle.dispose();
    });

    testWidgets('affiche le nom en texte dès la taille md', (tester) async {
      await tester.pumpDs(const AppColorSwatch(color: Color(0xFFC19A6B), name: 'Camel'));
      expect(find.text('Camel'), findsOneWidget);
      await tester.pumpDs(
        const AppColorSwatch(color: Color(0xFFC19A6B), name: 'Camel', size: SwatchSize.sm),
      );
      expect(find.text('Camel'), findsNothing);
    });

    testWidgets('coche lisible : blanche sur foncé, encre sur clair', (tester) async {
      await tester.pumpDs(const Row(children: [
        AppColorSwatch(key: Key('dark'), color: Color(0xFF111111), name: 'Noir', selected: true),
        AppColorSwatch(key: Key('light'), color: Color(0xFFFFFFFF), name: 'Blanc', selected: true),
      ]));
      Icon iconIn(String key) => tester.widget<Icon>(
            find.descendant(of: find.byKey(Key(key)), matching: find.byIcon(AppIcons.check)),
          );
      expect(iconIn('dark').color, const Color(0xFFFFFFFF));
      expect(iconIn('light').color, const Color(0xFF0E0E12));
    });

    testWidgets('appui et bordure systématique', (tester) async {
      var taps = 0;
      await tester.pumpDs(AppColorSwatch(
        color: const Color(0xFFFFFFFF),
        name: 'Blanc',
        onTap: () => taps++,
      ));
      await tester.tap(find.byType(AppColorSwatch));
      expect(taps, 1);
      final dot = tester.widgetList<Container>(find.byType(Container)).firstWhere(
            (c) => (c.decoration as BoxDecoration?)?.color == const Color(0xFFFFFFFF),
          );
      final border = (dot.decoration! as BoxDecoration).border! as Border;
      expect(border.top.color, AppColors.light.swatchBorder);
    });

    testWidgets('SwatchRow limite à 5 pastilles puis « +N »', (tester) async {
      await tester.pumpDs(SwatchRow(swatches: [
        for (var i = 0; i < 7; i++) (color: const Color(0xFF111111), name: 'C$i'),
      ]));
      expect(find.byType(AppColorSwatch), findsNWidgets(5));
      expect(find.text('+2'), findsOneWidget);
    });
  });

  group('AppChip', () {
    testWidgets('appui sur la puce et sur la croix sont distincts', (tester) async {
      var taps = 0;
      var deletes = 0;
      await tester.pumpDs(Center(
        child: AppChip(label: 'Travail', onTap: () => taps++, onDeleted: () => deletes++),
      ));
      await tester.tap(find.text('Travail'));
      await tester.tap(find.byKey(const ValueKey('chip-delete')));
      expect(taps, 1);
      expect(deletes, 1);
    });

    testWidgets('expose l’état sélectionné', (tester) async {
      final handle = tester.ensureSemantics();
      await tester.pumpDs(const AppChip(label: 'Soirée', selected: true));
      expect(
        tester.getSemantics(find.byType(AppChip)),
        isSemantics(isSelected: true, isButton: true, label: 'Soirée'),
      );
      handle.dispose();
    });
  });

  group('ScoreTone', () {
    test('seuils : > 75 haut, 50–75 moyen, < 50 bas', () {
      expect(ScoreTone.of(100), ScoreTone.high);
      expect(ScoreTone.of(76), ScoreTone.high);
      expect(ScoreTone.of(75), ScoreTone.medium);
      expect(ScoreTone.of(50), ScoreTone.medium);
      expect(ScoreTone.of(49), ScoreTone.low);
      expect(ScoreTone.of(0), ScoreTone.low);
    });

    test('jamais de rouge, même pour un score bas', () {
      for (final colors in [AppColors.light, AppColors.dark]) {
        for (final tone in ScoreTone.values) {
          expect(tone.color(colors), isNot(colors.danger));
        }
      }
    });
  });

  group('ScoreRing', () {
    testWidgets('annonce le score en toutes lettres', (tester) async {
      final handle = tester.ensureSemantics();
      await tester.pumpDs(const ScoreRing(score: 82));
      await tester.pumpAndSettle();
      expect(find.bySemanticsLabel('82 sur 100, Belle harmonie'), findsOneWidget);
      handle.dispose();
    });

    testWidgets('borne le score entre 0 et 100', (tester) async {
      await tester.pumpDs(const ScoreRing(score: 140, animate: false));
      expect(find.text('100'), findsOneWidget);
    });

    testWidgets('lien d’explication facultatif', (tester) async {
      var opened = false;
      await tester.pumpDs(ScoreRing(score: 40, onExplain: () => opened = true, animate: false));
      expect(find.text('À ajuster'), findsOneWidget);
      await tester.tap(find.text('Comment c\'est calculé ?'));
      expect(opened, isTrue);
    });
  });

  group('PieceSlot', () {
    testWidgets('vide : rôle et mention facultatif', (tester) async {
      var taps = 0;
      await tester.pumpDs(PieceSlot(
        roleLabel: 'Accessoires',
        state: const PieceSlotEmpty(),
        isOptional: true,
        onTap: () => taps++,
      ));
      expect(find.text('Accessoires'), findsOneWidget);
      expect(find.text('facultatif'), findsOneWidget);
      await tester.tap(find.byType(PieceSlot));
      expect(taps, 1);
    });

    testWidgets('rempli : type, couleur et pastille', (tester) async {
      await tester.pumpDs(const PieceSlot(
        roleLabel: 'Haut',
        state: PieceSlotFilled(typeName: 'Chemise', colorName: 'Bleu ciel', color: Color(0xFF9CC7E8)),
      ));
      expect(find.text('Chemise · Bleu ciel'), findsOneWidget);
      expect(find.byType(AppColorSwatch), findsOneWidget);
    });

    testWidgets('remplacé par une robe : non cliquable', (tester) async {
      var taps = 0;
      await tester.pumpDs(PieceSlot(
        roleLabel: 'Bas',
        state: const PieceSlotReplaced(replacedBy: 'la robe'),
        onTap: () => taps++,
      ));
      expect(find.text('remplacé par : la robe'), findsOneWidget);
      await tester.tap(find.byType(PieceSlot));
      expect(taps, 0);
    });
  });

  group('États de contenu', () {
    testWidgets('ErrorState propose « Réessayer » sans code technique', (tester) async {
      var retries = 0;
      await tester.pumpDs(ErrorState(onRetry: () => retries++));
      expect(find.text('Un problème est survenu'), findsOneWidget);
      await tester.tap(find.text('Réessayer'));
      expect(retries, 1);
    });

    testWidgets('ContentState masque le bouton sans action', (tester) async {
      await tester.pumpDs(ContentState.empty(title: 'Vide', actionLabel: 'Agir'));
      expect(find.byType(AppButton), findsNothing);
    });

    testWidgets('SlowLoadingHint apparaît après 5 s', (tester) async {
      await tester.pumpDs(const SlowLoadingHint(child: Skeleton(height: 40)));
      expect(find.text('Ça prend plus de temps que prévu'), findsNothing);
      await tester.pump(const Duration(seconds: 5));
      expect(find.text('Ça prend plus de temps que prévu'), findsOneWidget);
    });

    testWidgets('OfflineBanner affiche le message par défaut', (tester) async {
      await tester.pumpDs(const OfflineBanner());
      expect(find.text('Hors ligne · suggestions calculées sur l\'appareil'), findsOneWidget);
    });
  });

  group('AppTextField', () {
    testWidgets('message d’erreur et bascule du mot de passe', (tester) async {
      await tester.pumpDs(const AppTextField(
        label: 'Mot de passe',
        obscure: true,
        errorText: 'Utilisez au moins 8 caractères',
      ));
      expect(find.text('Mot de passe'), findsOneWidget);
      expect(find.text('Utilisez au moins 8 caractères'), findsOneWidget);
      expect(tester.widget<TextField>(find.byType(TextField)).obscureText, isTrue);
      await tester.tap(find.byTooltip('Afficher le mot de passe'));
      await tester.pump();
      expect(tester.widget<TextField>(find.byType(TextField)).obscureText, isFalse);
    });
  });

  group('HeryciaLoader', () {
    testWidgets('annoncé au lecteur d’écran', (tester) async {
      final handle = tester.ensureSemantics();
      await tester.pumpDs(const Center(child: HeryciaLoader()));
      expect(find.bySemanticsLabel('Chargement en cours'), findsOneWidget);
      handle.dispose();
    });

    testWidgets('tourne en continu (une animation de chargement ne se termine jamais)', (tester) async {
      await tester.pumpDs(const Center(child: HeryciaLoader()));
      await tester.pump(const Duration(milliseconds: 350));
      expect(tester.hasRunningAnimations, isTrue);
    });

    testWidgets('« réduire les animations » : figé, sous la forme du logo', (tester) async {
      await tester.pumpDs(const Center(child: HeryciaLoader(size: LoaderSize.lg)), disableAnimations: true);
      await tester.pumpAndSettle();
      final painter = tester.widget<CustomPaint>(
        find.descendant(of: find.byType(HeryciaLoader), matching: find.byType(CustomPaint)),
      ).painter! as LoaderPainter;
      expect(painter.animated, isFalse);
      expect(painter.hook, isTrue);
    });

    testWidgets('taille cohérente avec la grille et le crochet en grand format', (tester) async {
      await tester.pumpDs(const Center(child: Row(mainAxisSize: MainAxisSize.min, children: [
        HeryciaLoader(key: Key('sm'), size: LoaderSize.sm),
        HeryciaLoader(key: Key('lg'), size: LoaderSize.lg),
      ])));
      final sm = tester.getSize(find.byKey(const Key('sm')));
      final lg = tester.getSize(find.byKey(const Key('lg')));
      expect(sm.height, lessThanOrEqualTo(AppSizes.iconInButton + 4));
      expect(lg.height, greaterThan(lg.width / 2));
    });

    test('dessin en couleur unique pour les boutons', () {
      final painter = LoaderPainter(
        progress: 0.3,
        animated: true,
        ring: Colors.white,
        ringSoft: Colors.white,
        accent: Colors.white,
        hook: false,
      );
      expect(painter.shouldRepaint(painter), isFalse);
    });
  });

  testWidgets('AppBadge passe le libellé en majuscules', (tester) async {
    await tester.pumpDs(const AppBadge(label: 'Styliste', variant: AppBadgeVariant.brand));
    expect(find.text('STYLISTE'), findsOneWidget);
  });
}
