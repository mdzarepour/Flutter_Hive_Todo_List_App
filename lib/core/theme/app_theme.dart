import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker_fork/flutter_cupertino_date_picker_fork.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_todo/core/constants/app_colors.dart';
import 'package:hive_todo/core/theme/app_text_theme.dart';

class AppTheme {
  AppTheme._();
  static ThemeData appThem = ThemeData(
    filledButtonTheme: _getFilledButton(),
    floatingActionButtonTheme: _getFloatinButtonTheme(),
    textTheme: AppTextTheme.appTextTheme,
    inputDecorationTheme: _getInpuTheme(),
    checkboxTheme: const CheckboxThemeData(),
    dividerTheme: _getDividerTheme(),
    colorScheme: _getColorScheme(),
  );

  static FilledButtonThemeData _getFilledButton() {
    return FilledButtonThemeData(
      style: FilledButton.styleFrom(
        fixedSize: const Size.fromHeight(60),
        backgroundColor: AppColors.materialThirdBlue,
        textStyle: AppTextTheme.appTextTheme.bodyMedium,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  static FloatingActionButtonThemeData _getFloatinButtonTheme() {
    return FloatingActionButtonThemeData(
      elevation: 0,
      foregroundColor: AppColors.materialWhite,
      backgroundColor: AppColors.materialThirdBlue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(10),
      ),
    );
  }

  static ColorScheme _getColorScheme() {
    return const ColorScheme.dark(
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
    );
  }

  static DividerThemeData _getDividerTheme() {
    return const DividerThemeData(
      thickness: 0,
      color: AppColors.materialSoftGrey,
    );
  }

  static InputDecorationTheme _getInpuTheme() {
    return InputDecorationTheme(
      filled: true,
      fillColor: AppColors.materialThirdBlue,
      contentPadding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
      hintStyle: GoogleFonts.dmSans(
        fontSize: 13,
        color: AppColors.materialWhite,
        fontWeight: FontWeight.w400,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide.none,
      ),
    );
  }

  static final timeDatePickerTheme = DateTimePickerTheme(
    itemHeight: 50,
    backgroundColor: AppColors.materialSecondBlue,
    itemTextStyle: AppTextTheme.appTextTheme.headlineMedium,
    cancelTextStyle: AppTextTheme.appTextTheme.headlineMedium,
    confirmTextStyle: AppTextTheme.appTextTheme.headlineMedium,
  );
}
