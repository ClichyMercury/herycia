import 'package:flutter/material.dart';

import '../tokens/app_colors.dart';
import '../tokens/app_typography.dart';

extension ThemeTokens on BuildContext {
  AppColors get colors => Theme.of(this).extension<AppColors>()!;

  AppTypography get typo => Theme.of(this).extension<AppTypography>()!;

  Brightness get brightness => Theme.of(this).brightness;
}
