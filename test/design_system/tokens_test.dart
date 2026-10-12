import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:herycia/design_system/design_system.dart';
import 'package:herycia/design_system/tokens/palette.dart';

void main() {
  group('contrastRatio', () {
    test('noir sur blanc vaut 21:1', () {
      expect(contrastRatio(Colors.black, Colors.white), closeTo(21, 0.01));
    });

    test('est symétrique', () {
      expect(
        contrastRatio(BrandPalette.primary, NeutralPalette.n0),
        contrastRatio(NeutralPalette.n0, BrandPalette.primary),
      );
    });

    test('une couleur contre elle-même vaut 1:1', () {
      expect(contrastRatio(BrandPalette.accent, BrandPalette.accent), 1);
    });
  });

  group('Contrastes exigés par le design system (§2.6)', () {
    const aa = 4.5;

    test('texte principal et secondaire sur surface claire', () {
      expect(contrastRatio(NeutralPalette.n900, NeutralPalette.n0), greaterThan(15));
      expect(contrastRatio(NeutralPalette.n700, NeutralPalette.n0), greaterThan(7));
    });

    test('texte tertiaire reste sous AA : réservé au 15 px non essentiel', () {
      expect(contrastRatio(NeutralPalette.n500, NeutralPalette.n0), lessThan(aa));
    });

    test('blanc sur indigo est conforme', () {
      expect(contrastRatio(NeutralPalette.n0, BrandPalette.primary), greaterThanOrEqualTo(aa));
    });

    test('blanc sur mandarine et menthe est insuffisant', () {
      expect(contrastRatio(NeutralPalette.n0, BrandPalette.accent), lessThan(aa));
      expect(contrastRatio(NeutralPalette.n0, BrandPalette.fresh), lessThan(aa));
    });

    test('encre sur mandarine, menthe et citron est conforme', () {
      for (final accent in [BrandPalette.accent, BrandPalette.fresh, BrandPalette.sun]) {
        expect(contrastRatio(NeutralPalette.n950, accent), greaterThanOrEqualTo(aa));
      }
    });
  });

  group('Tokens sémantiques', () {
    for (final (name, c) in [('clair', AppColors.light), ('sombre', AppColors.dark)]) {
      test('thème $name : textes lisibles sur leurs surfaces', () {
        expect(contrastRatio(c.textPrimary, c.surface), greaterThanOrEqualTo(4.5));
        expect(contrastRatio(c.textSecondary, c.surface), greaterThanOrEqualTo(4.5));
        expect(contrastRatio(c.textOnBrand, c.actionPrimary), greaterThanOrEqualTo(4.5));
        expect(contrastRatio(c.textOnAccent, c.accent), greaterThanOrEqualTo(4.5));
        expect(contrastRatio(c.textOnInverse, c.surfaceInverse), greaterThanOrEqualTo(4.5));
      });

      test('thème $name : le cœur des favoris et le focus restent visibles (≥ 3:1)', () {
        expect(contrastRatio(c.favorite, c.surface), greaterThanOrEqualTo(3));
        expect(contrastRatio(c.favorite, c.background), greaterThanOrEqualTo(3));
        expect(contrastRatio(c.focusRing, c.surface), greaterThanOrEqualTo(3));
        expect(contrastRatio(c.actionPrimary, c.background), greaterThanOrEqualTo(4.5));
      });

      test('thème $name : la puce active reste lisible', () {
        expect(contrastRatio(c.actionPrimary, c.actionPrimarySoft), greaterThanOrEqualTo(3));
      });
    }

    test('mandarine, menthe et citron ne portent jamais de texte blanc', () {
      expect(AppColors.light.textOnAccent, NeutralPalette.n950);
      expect(AppColors.dark.textOnAccent, NeutralPalette.n950);
    });

    test('lerp à 0 et 1 restitue les thèmes', () {
      expect(AppColors.light.lerp(AppColors.dark, 0).surface, AppColors.light.surface);
      expect(AppColors.light.lerp(AppColors.dark, 1).surface, AppColors.dark.surface);
    });
  });

  group('readableInkOn', () {
    test('choisit l’encre sur une couleur claire', () {
      expect(readableInkOn(const Color(0xFFF3E9D2)), NeutralPalette.n950);
    });

    test('choisit le blanc sur une couleur foncée', () {
      expect(readableInkOn(const Color(0xFF1F2A44)), NeutralPalette.n0);
    });
  });

  test('isVeryLight repère le blanc et la crème, pas le camel', () {
    expect(isVeryLight(Colors.white), isTrue);
    expect(isVeryLight(const Color(0xFFF3E9D2)), isTrue);
    expect(isVeryLight(const Color(0xFFC19A6B)), isFalse);
  });

  group('Échelles', () {
    test('espacements en base 4', () {
      for (final v in [
        AppSpacing.s1, AppSpacing.s2, AppSpacing.s3, AppSpacing.s4, AppSpacing.s5,
        AppSpacing.s6, AppSpacing.s8, AppSpacing.s10, AppSpacing.s12, AppSpacing.s16,
      ]) {
        expect(v % 4, 0);
      }
      expect(AppSpacing.screenHorizontal, 24);
    });

    test('typographie conforme au tableau §3.2', () {
      final t = AppTypography.standard;
      expect(t.display.fontSize, 32);
      expect(t.body.fontSize! * t.body.height!, closeTo(24, 0.001));
      expect(t.title1.fontWeight, FontWeight.w700);
      expect(t.label.fontWeight, FontWeight.w500);
      expect(t.numeric.fontFeatures, contains(const FontFeature.tabularFigures()));
      expect(t.body.fontFamily, AppTypography.fontFamily);
    });

    test('les ombres disparaissent en mode sombre', () {
      expect(AppElevation.of(Brightness.dark, AppElevation.level2), isEmpty);
      expect(AppElevation.of(Brightness.light, AppElevation.level2), AppElevation.level2);
    });
  });
}
