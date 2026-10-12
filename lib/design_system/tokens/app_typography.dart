import 'package:flutter/material.dart';

@immutable
class AppTypography extends ThemeExtension<AppTypography> {
  const AppTypography({
    required this.display,
    required this.title1,
    required this.title2,
    required this.title3,
    required this.body,
    required this.bodyStrong,
    required this.label,
    required this.caption,
    required this.overline,
    required this.numeric,
  });

  static const fontFamily = 'DMSans';

  final TextStyle display;
  final TextStyle title1;
  final TextStyle title2;
  final TextStyle title3;
  final TextStyle body;
  final TextStyle bodyStrong;
  final TextStyle label;
  final TextStyle caption;
  final TextStyle overline;
  final TextStyle numeric;

  static TextStyle _style(double size, double lineHeight, FontWeight weight) =>
      TextStyle(
        fontFamily: fontFamily,
        fontSize: size,
        height: lineHeight / size,
        fontWeight: weight,
        leadingDistribution: TextLeadingDistribution.even,
      );

  static final standard = AppTypography(
    display: _style(32, 38, FontWeight.w700),
    title1: _style(26, 32, FontWeight.w700),
    title2: _style(21, 28, FontWeight.w700),
    title3: _style(18, 24, FontWeight.w500),
    body: _style(16, 24, FontWeight.w400),
    bodyStrong: _style(16, 24, FontWeight.w500),
    label: _style(15, 20, FontWeight.w500),
    caption: _style(13, 18, FontWeight.w400),
    overline: _style(12, 16, FontWeight.w700).copyWith(letterSpacing: 12 * 0.08),
    numeric: _style(28, 32, FontWeight.w700).copyWith(
      fontFeatures: const [FontFeature.tabularFigures()],
    ),
  );

  TextTheme toTextTheme(Color primary, Color secondary) => TextTheme(
        displayLarge: display.copyWith(color: primary),
        headlineMedium: title1.copyWith(color: primary),
        titleLarge: title2.copyWith(color: primary),
        titleMedium: title3.copyWith(color: primary),
        titleSmall: label.copyWith(color: primary),
        bodyLarge: body.copyWith(color: primary),
        bodyMedium: body.copyWith(color: primary),
        bodySmall: caption.copyWith(color: secondary),
        labelLarge: label.copyWith(color: primary),
        labelMedium: caption.copyWith(color: primary),
        labelSmall: overline.copyWith(color: secondary),
      );

  @override
  AppTypography copyWith() => this;

  @override
  AppTypography lerp(ThemeExtension<AppTypography>? other, double t) => this;
}
