import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_todo/core/constants/app_colors.dart';

class AppTextTheme {
  AppTextTheme._();
  static TextTheme appTextTheme = TextTheme(
    headlineLarge: GoogleFonts.poppins(
      fontSize: 30,
      color: AppColors.materialWhite,
      fontWeight: FontWeight.w900,
    ),
    headlineMedium: GoogleFonts.dmSans(
      fontSize: 17,
      color: AppColors.materialWhite,
      fontWeight: FontWeight.w400,
    ),
    titleLarge: GoogleFonts.dmSans(
      fontSize: 15,
      color: AppColors.materialWhite,
      fontWeight: FontWeight.w700,
    ),
    titleMedium: GoogleFonts.dmSans(
      fontSize: 15,
      color: AppColors.materialGrey,
      fontWeight: FontWeight.w400,
    ),
    titleSmall: GoogleFonts.dmSans(
      fontSize: 12,
      color: AppColors.materialPink,
      fontWeight: FontWeight.w700,
    ),
    bodyLarge: GoogleFonts.poppins(
      fontSize: 45,
      color: AppColors.materialWhite,
      fontWeight: FontWeight.w700,
    ),
    bodyMedium: GoogleFonts.poppins(
      fontSize: 17,
      color: AppColors.materialBlack,
      fontWeight: FontWeight.w400,
    ),
  );
}
