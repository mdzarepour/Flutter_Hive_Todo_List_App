import 'package:flutter/material.dart';
import 'package:hive_todo/core/constants/app_colors.dart';
import 'package:hive_todo/core/theme/app_text_theme.dart';

class AppTheme {
  AppTheme._();
  static ThemeData appThem = ThemeData(
    textTheme: AppTextTheme.appTextTheme,
    colorScheme: const ColorScheme.light(
      brightness: Brightness.light,
      // Using new blue colors for surface and onSurface
      surface: AppColors.materialSecondBlue, // A lighter blue/grey for surface
      onSurface: AppColors.materialWhite, // White text on the blue surface
      // Using pink and green for primary/secondary accents
      primary: AppColors.materialPink, // Primary accent color
      onPrimary: AppColors.materialWhite, // White text on primary accent
      secondary: AppColors.materialGreen, // Secondary accent color
      onSecondary: AppColors.materialWhite, // White text on secondary accent
    ),
  );
}
