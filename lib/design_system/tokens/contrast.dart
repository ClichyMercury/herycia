import 'dart:math' as math;
import 'dart:ui';

import 'palette.dart';

double _linearize(double channel) => channel <= 0.04045
    ? channel / 12.92
    : math.pow((channel + 0.055) / 1.055, 2.4).toDouble();

double relativeLuminance(Color color) =>
    0.2126 * _linearize(color.r) +
    0.7152 * _linearize(color.g) +
    0.0722 * _linearize(color.b);

double contrastRatio(Color a, Color b) {
  final la = relativeLuminance(a);
  final lb = relativeLuminance(b);
  final lighter = math.max(la, lb);
  final darker = math.min(la, lb);
  return (lighter + 0.05) / (darker + 0.05);
}

Color readableInkOn(Color background) {
  const ink = NeutralPalette.n950;
  const white = NeutralPalette.n0;
  return contrastRatio(ink, background) >= contrastRatio(white, background)
      ? ink
      : white;
}

bool isVeryLight(Color color) => relativeLuminance(color) > 0.8;
