import 'package:flutter/material.dart';
import 'package:hive_todo/core/constants/app_colors.dart';
import 'package:hive_todo/core/theme/app_text_theme.dart';

class AppTheme {
  AppTheme._();
  static ThemeData appThem = ThemeData(
    textTheme: AppTextTheme.appTextTheme,
    checkboxTheme: const CheckboxThemeData(),
    dividerTheme: const DividerThemeData(
      thickness: 0,
      color: AppColors.materialSoftGrey,
    ),
    colorScheme: const ColorScheme.dark(
      brightness: Brightness.light,
      surface: AppColors.materialSecondBlue,
      onSurface: AppColors.materialWhite,
      primary: AppColors.materialSecondBlue,
      onPrimary: AppColors.materialWhite,
      secondary: AppColors.materialThirdBlue,
      onSecondary: AppColors.materialWhite,
      primaryContainer: AppColors.materialGrey,
      onPrimaryContainer: AppColors.materialWhite,
      secondaryContainer: AppColors.materialSoftGrey,
    ),
  );
}
