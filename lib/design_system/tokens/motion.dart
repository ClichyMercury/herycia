import 'package:flutter/widgets.dart';

enum AppMotion {
  instant(Duration(milliseconds: 100), Curves.easeOut),
  fast(Duration(milliseconds: 180), Curves.easeOut),
  base(Duration(milliseconds: 240), Curves.easeInOut),
  slow(Duration(milliseconds: 400), Curves.easeInOut),
  score(Duration(milliseconds: 700), Curves.easeOutCubic);

  const AppMotion(this.duration, this.curve);

  final Duration duration;
  final Curve curve;

  static const cascadeStep = Duration(milliseconds: 40);
  static const cascadeMaxItems = 5;

  Duration resolve(BuildContext context) {
    if (this == AppMotion.instant) return duration;
    return MediaQuery.maybeDisableAnimationsOf(context) ?? false
        ? Duration.zero
        : duration;
  }

  static Duration cascadeDelay(BuildContext context, int index) {
    if (MediaQuery.maybeDisableAnimationsOf(context) ?? false) {
      return Duration.zero;
    }
    if (index >= cascadeMaxItems) return Duration.zero;
    return cascadeStep * index;
  }
}
