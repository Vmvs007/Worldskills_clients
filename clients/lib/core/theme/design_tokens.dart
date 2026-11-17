import 'package:material_ui/material_ui.dart';

abstract final class AppColors {
  static const background = Color(0xFFF5F8FF);
  static const surface = Color(0xFFFFFFFF);
  static const primary = Color(0xFF8F81F0);
  static const text = Color(0xFF17151F);
}

abstract final class AppTypography {
  static const family = 'Inter';
  static const screenTitle = TextStyle(
    fontFamily: family,
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.text,
  );
}

abstract final class AppRadii {
  static const card = 16.0;
}

abstract final class AppSpacing {
  static const screenHorizontal = 16.0;
}
