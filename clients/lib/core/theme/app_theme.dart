import 'package:material_ui/material_ui.dart';

import 'design_tokens.dart';

abstract final class AppTheme {
  static final light = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      surface: AppColors.surface,
      onSurface: AppColors.text,
    ),
    fontFamily: AppTypography.family,
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.surface,
      foregroundColor: AppColors.text,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
      titleSpacing: AppSpacing.screenHorizontal,
      titleTextStyle: AppTypography.screenTitle,
    ),
    cardTheme: const CardThemeData(
      color: AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(AppRadii.card)),
      ),
    ),
  );
}
