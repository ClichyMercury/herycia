import 'dart:ui';

abstract final class BrandPalette {
  static const primary = Color(0xFF34165C);
  static const primaryPressed = Color(0xFF251043);
  static const primarySoft = Color(0xFFEEE8F8);
  static const lavender = Color(0xFFB5A0E1);
  static const lavenderPressed = Color(0xFF9F86D6);
  static const accent = Color(0xFFFA7C70);
  static const accentStrong = Color(0xFFE35D4E);
  static const accentSoft = Color(0xFFFEECEA);
  static const fresh = Color(0xFF00C2A8);
  static const freshSoft = Color(0xFFD9F8F3);
  static const sun = Color(0xFFFFC43D);
  static const sunSoft = Color(0xFFFFF4D6);
}

abstract final class NeutralPalette {
  static const n0 = Color(0xFFFFFFFF);
  static const n50 = Color(0xFFF8F8FA);
  static const n100 = Color(0xFFF0F0F4);
  static const n200 = Color(0xFFE3E3EA);
  static const n300 = Color(0xFFC9C9D4);
  static const n500 = Color(0xFF8A8A9A);
  static const n700 = Color(0xFF52525F);
  static const n900 = Color(0xFF1C1C26);
  static const n950 = Color(0xFF0E0E12);
}

abstract final class StatusPalette {
  static const success = Color(0xFF0FA958);
  static const successBg = Color(0xFFE4F7EC);
  static const warning = Color(0xFFF2A20C);
  static const warningBg = Color(0xFFFEF3DC);
  static const danger = Color(0xFFE5484D);
  static const dangerBg = Color(0xFFFDE8E9);
  static const info = Color(0xFF0B8CE9);
  static const infoBg = Color(0xFFE2F2FD);
}
