import 'package:flutter/material.dart';

import '../tokens/app_colors.dart';
import '../tokens/app_typography.dart';
import '../tokens/layout.dart';

abstract final class AppTheme {
  static ThemeData light() => _build(AppColors.light, Brightness.light);

  static ThemeData dark() => _build(AppColors.dark, Brightness.dark);

  static ThemeData _build(AppColors colors, Brightness brightness) {
    final typography = AppTypography.standard;
    final scheme = ColorScheme(
      brightness: brightness,
      primary: colors.actionPrimary,
      onPrimary: colors.textOnBrand,
      primaryContainer: colors.actionPrimarySoft,
      onPrimaryContainer: colors.actionPrimary,
      secondary: colors.accent,
      onSecondary: colors.textOnAccent,
      error: colors.danger,
      onError: colors.textOnBrand,
      surface: colors.surface,
      onSurface: colors.textPrimary,
      onSurfaceVariant: colors.textSecondary,
      surfaceContainerLowest: colors.surface,
      surfaceContainerLow: colors.surface,
      surfaceContainer: colors.surface,
      surfaceContainerHigh: colors.surfaceSunken,
      surfaceContainerHighest: colors.surfaceSunken,
      outline: colors.borderStrong,
      outlineVariant: colors.border,
      inverseSurface: colors.surfaceInverse,
      onInverseSurface: colors.textOnInverse,
      scrim: colors.overlay,
      shadow: const Color(0xFF0E0E12),
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: scheme,
      fontFamily: AppTypography.fontFamily,
      scaffoldBackgroundColor: colors.background,
      textTheme: typography.toTextTheme(colors.textPrimary, colors.textSecondary),
      extensions: [colors, typography],
      splashFactory: NoSplash.splashFactory,
      dividerTheme: DividerThemeData(color: colors.border, thickness: 1, space: 1),
      appBarTheme: AppBarTheme(
        backgroundColor: colors.background,
        surfaceTintColor: Colors.transparent,
        foregroundColor: colors.textPrimary,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleSpacing: AppSpacing.screenHorizontal,
        titleTextStyle: typography.title2.copyWith(color: colors.textPrimary),
      ),
      navigationBarTheme: NavigationBarThemeData(
        height: AppSizes.bottomBarHeight,
        backgroundColor: colors.surface,
        surfaceTintColor: Colors.transparent,
        indicatorColor: Colors.transparent,
        elevation: 0,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        iconTheme: WidgetStateProperty.resolveWith(
          (states) => IconThemeData(
            size: AppSizes.iconInNavigation,
            color: states.contains(WidgetState.selected)
                ? colors.actionPrimary
                : colors.textTertiary,
          ),
        ),
        labelTextStyle: WidgetStateProperty.resolveWith(
          (states) => typography.caption.copyWith(
            fontWeight: FontWeight.w500,
            color: states.contains(WidgetState.selected)
                ? colors.actionPrimary
                : colors.textSecondary,
          ),
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: colors.surface,
        surfaceTintColor: Colors.transparent,
        modalBarrierColor: colors.overlay,
        showDragHandle: true,
        dragHandleColor: colors.borderStrong,
        dragHandleSize: const Size(36, 4),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.xl)),
        ),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: colors.surface,
        surfaceTintColor: Colors.transparent,
        barrierColor: colors.overlay,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.xl)),
        titleTextStyle: typography.title3.copyWith(color: colors.textPrimary),
        contentTextStyle: typography.body.copyWith(color: colors.textSecondary),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: colors.surfaceInverse,
        contentTextStyle: typography.body.copyWith(color: colors.textOnInverse),
        actionTextColor: colors.textOnInverse,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.md)),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(color: colors.actionPrimary),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: colors.actionPrimary,
        selectionColor: colors.actionPrimarySoft,
        selectionHandleColor: colors.actionPrimary,
      ),
    );
  }
}
