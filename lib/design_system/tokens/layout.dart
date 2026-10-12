import 'package:flutter/widgets.dart';

abstract final class AppSpacing {
  static const s1 = 4.0;
  static const s2 = 8.0;
  static const s3 = 12.0;
  static const s4 = 16.0;
  static const s5 = 20.0;
  static const s6 = 24.0;
  static const s8 = 32.0;
  static const s10 = 40.0;
  static const s12 = 48.0;
  static const s16 = 64.0;

  static const screenHorizontal = s6;
  static const betweenSections = s8;
  static const titleToContent = s3;
  static const betweenCards = s4;
  static const cardPadding = s4;
  static const gridGutter = s3;

  static const screenPadding = EdgeInsets.symmetric(horizontal: screenHorizontal);
}

abstract final class AppRadius {
  static const sm = 8.0;
  static const md = 12.0;
  static const lg = 16.0;
  static const xl = 24.0;
  static const full = 999.0;
}

abstract final class AppSizes {
  static const minTapTarget = 48.0;
  static const tapTargetGap = 8.0;
  static const iconInButton = 20.0;
  static const iconInNavigation = 24.0;
  static const iconInEmptyState = 32.0;
  static const bottomBarHeight = 64.0;
}

abstract final class AppElevation {
  static const level1 = [
    BoxShadow(color: Color(0x0F0E0E12), offset: Offset(0, 1), blurRadius: 2),
  ];
  static const level2 = [
    BoxShadow(color: Color(0x140E0E12), offset: Offset(0, 4), blurRadius: 12),
  ];
  static const level3 = [
    BoxShadow(color: Color(0x290E0E12), offset: Offset(0, 12), blurRadius: 32),
  ];

  static List<BoxShadow> of(Brightness brightness, List<BoxShadow> level) =>
      brightness == Brightness.dark ? const [] : level;
}
