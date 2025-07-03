import 'package:flutter/material.dart';
import 'package:hive_todo/core/constants/app_colors.dart';
import 'package:hive_todo/core/theme/app_text_theme.dart';

class AppTheme {
  AppTheme._();
  static ThemeData appThem = ThemeData(
    textTheme: AppTextTheme.appTextTheme,
    colorScheme: const ColorScheme.light(
      brightness: Brightness.light,
      surface: AppColors.materialSeconWhite,
      onSurface: AppColors.materialBlack,
      primary: AppColors.materialFirstGreen,
      onPrimary: AppColors.materialWhite,
      secondary: AppColors.materialSecondGreen,
      onSecondary: AppColors.materialFirstGreen,
    ),
  );
}
