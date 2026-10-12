import 'package:flutter/material.dart';

import 'palette.dart';

@immutable
class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.background,
    required this.surface,
    required this.surfaceSunken,
    required this.surfaceInverse,
    required this.textOnInverse,
    required this.border,
    required this.borderStrong,
    required this.textPrimary,
    required this.textSecondary,
    required this.textTertiary,
    required this.textOnBrand,
    required this.textOnAccent,
    required this.actionPrimary,
    required this.actionPrimaryPressed,
    required this.actionPrimarySoft,
    required this.actionSecondaryBg,
    required this.actionSecondaryBorder,
    required this.accent,
    required this.focusRing,
    required this.favorite,
    required this.scoreHigh,
    required this.scoreMedium,
    required this.scoreLow,
    required this.swatchBorder,
    required this.overlay,
    required this.success,
    required this.successBg,
    required this.warning,
    required this.warningBg,
    required this.danger,
    required this.dangerBg,
    required this.info,
    required this.infoBg,
    required this.badgeSunBg,
    required this.badgeFreshBg,
    required this.mannequinBody,
    required this.mannequinOutline,
    required this.brandMark,
    required this.brandMarkSoft,
  });

  final Color background;
  final Color surface;
  final Color surfaceSunken;
  final Color surfaceInverse;
  final Color textOnInverse;
  final Color border;
  final Color borderStrong;
  final Color textPrimary;
  final Color textSecondary;
  final Color textTertiary;
  final Color textOnBrand;
  final Color textOnAccent;
  final Color actionPrimary;
  final Color actionPrimaryPressed;
  final Color actionPrimarySoft;
  final Color actionSecondaryBg;
  final Color actionSecondaryBorder;
  final Color accent;
  final Color focusRing;
  final Color favorite;
  final Color scoreHigh;
  final Color scoreMedium;
  final Color scoreLow;
  final Color swatchBorder;
  final Color overlay;
  final Color success;
  final Color successBg;
  final Color warning;
  final Color warningBg;
  final Color danger;
  final Color dangerBg;
  final Color info;
  final Color infoBg;
  final Color badgeSunBg;
  final Color badgeFreshBg;
  final Color mannequinBody;
  final Color mannequinOutline;
  final Color brandMark;
  final Color brandMarkSoft;

  static const light = AppColors(
    background: NeutralPalette.n50,
    surface: NeutralPalette.n0,
    surfaceSunken: NeutralPalette.n100,
    surfaceInverse: NeutralPalette.n950,
    textOnInverse: NeutralPalette.n0,
    border: NeutralPalette.n200,
    borderStrong: NeutralPalette.n300,
    textPrimary: NeutralPalette.n900,
    textSecondary: NeutralPalette.n700,
    textTertiary: NeutralPalette.n500,
    textOnBrand: NeutralPalette.n0,
    textOnAccent: NeutralPalette.n950,
    actionPrimary: BrandPalette.primary,
    actionPrimaryPressed: BrandPalette.primaryPressed,
    actionPrimarySoft: BrandPalette.primarySoft,
    actionSecondaryBg: NeutralPalette.n0,
    actionSecondaryBorder: NeutralPalette.n300,
    accent: BrandPalette.accent,
    focusRing: BrandPalette.primary,
    favorite: BrandPalette.accentStrong,
    scoreHigh: BrandPalette.fresh,
    scoreMedium: BrandPalette.sun,
    scoreLow: NeutralPalette.n500,
    swatchBorder: NeutralPalette.n300,
    overlay: Color(0x7A0E0E12),
    success: StatusPalette.success,
    successBg: StatusPalette.successBg,
    warning: StatusPalette.warning,
    warningBg: StatusPalette.warningBg,
    danger: StatusPalette.danger,
    dangerBg: StatusPalette.dangerBg,
    info: StatusPalette.info,
    infoBg: StatusPalette.infoBg,
    badgeSunBg: BrandPalette.sunSoft,
    badgeFreshBg: BrandPalette.freshSoft,
    mannequinBody: Color(0xFFDCDCE4),
    mannequinOutline: NeutralPalette.n500,
    brandMark: BrandPalette.primary,
    brandMarkSoft: BrandPalette.lavender,
  );

  static const dark = AppColors(
    background: Color(0xFF0E0E12),
    surface: Color(0xFF17171F),
    surfaceSunken: Color(0xFF101016),
    surfaceInverse: Color(0xFFFFFFFF),
    textOnInverse: NeutralPalette.n950,
    border: Color(0xFF2A2A36),
    borderStrong: Color(0xFF3C3C4C),
    textPrimary: Color(0xFFF4F4F7),
    textSecondary: Color(0xFFB4B4C2),
    textTertiary: Color(0xFF83838F),
    textOnBrand: NeutralPalette.n950,
    textOnAccent: NeutralPalette.n950,
    actionPrimary: BrandPalette.lavender,
    actionPrimaryPressed: BrandPalette.lavenderPressed,
    actionPrimarySoft: Color(0xFF2A2140),
    actionSecondaryBg: Color(0xFF17171F),
    actionSecondaryBorder: Color(0xFF3C3C4C),
    accent: Color(0xFFFF8E83),
    focusRing: BrandPalette.lavender,
    favorite: Color(0xFFFF8E83),
    scoreHigh: Color(0xFF2DD4BC),
    scoreMedium: Color(0xFFFFD166),
    scoreLow: Color(0xFF83838F),
    swatchBorder: Color(0xFF4A4A58),
    overlay: Color(0xA3000000),
    success: Color(0xFF3DD68C),
    successBg: Color(0xFF12301F),
    warning: Color(0xFFF5B83D),
    warningBg: Color(0xFF33270D),
    danger: Color(0xFFFF6369),
    dangerBg: Color(0xFF3A1517),
    info: Color(0xFF4FAEF5),
    infoBg: Color(0xFF0F2738),
    badgeSunBg: Color(0xFF3A2F12),
    badgeFreshBg: Color(0xFF0E332D),
    mannequinBody: Color(0xFF3A3A48),
    mannequinOutline: Color(0xFF6E6E7E),
    brandMark: Color(0xFFF4F4F7),
    brandMarkSoft: BrandPalette.lavender,
  );

  @override
  AppColors copyWith() => this;

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    Color l(Color a, Color b) => Color.lerp(a, b, t)!;
    return AppColors(
      background: l(background, other.background),
      surface: l(surface, other.surface),
      surfaceSunken: l(surfaceSunken, other.surfaceSunken),
      surfaceInverse: l(surfaceInverse, other.surfaceInverse),
      textOnInverse: l(textOnInverse, other.textOnInverse),
      border: l(border, other.border),
      borderStrong: l(borderStrong, other.borderStrong),
      textPrimary: l(textPrimary, other.textPrimary),
      textSecondary: l(textSecondary, other.textSecondary),
      textTertiary: l(textTertiary, other.textTertiary),
      textOnBrand: l(textOnBrand, other.textOnBrand),
      textOnAccent: l(textOnAccent, other.textOnAccent),
      actionPrimary: l(actionPrimary, other.actionPrimary),
      actionPrimaryPressed: l(actionPrimaryPressed, other.actionPrimaryPressed),
      actionPrimarySoft: l(actionPrimarySoft, other.actionPrimarySoft),
      actionSecondaryBg: l(actionSecondaryBg, other.actionSecondaryBg),
      actionSecondaryBorder: l(actionSecondaryBorder, other.actionSecondaryBorder),
      accent: l(accent, other.accent),
      focusRing: l(focusRing, other.focusRing),
      favorite: l(favorite, other.favorite),
      scoreHigh: l(scoreHigh, other.scoreHigh),
      scoreMedium: l(scoreMedium, other.scoreMedium),
      scoreLow: l(scoreLow, other.scoreLow),
      swatchBorder: l(swatchBorder, other.swatchBorder),
      overlay: l(overlay, other.overlay),
      success: l(success, other.success),
      successBg: l(successBg, other.successBg),
      warning: l(warning, other.warning),
      warningBg: l(warningBg, other.warningBg),
      danger: l(danger, other.danger),
      dangerBg: l(dangerBg, other.dangerBg),
      info: l(info, other.info),
      infoBg: l(infoBg, other.infoBg),
      badgeSunBg: l(badgeSunBg, other.badgeSunBg),
      badgeFreshBg: l(badgeFreshBg, other.badgeFreshBg),
      mannequinBody: l(mannequinBody, other.mannequinBody),
      mannequinOutline: l(mannequinOutline, other.mannequinOutline),
      brandMark: l(brandMark, other.brandMark),
      brandMarkSoft: l(brandMarkSoft, other.brandMarkSoft),
    );
  }
}
