import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_todo/core/constants/app_colors.dart';

class AppTextTheme {
  AppTextTheme._();
  static TextTheme appTextTheme = TextTheme(
    titleLarge: GoogleFonts.poppins(
      fontSize: 15,
      color: AppColors.materialBlack,
      fontWeight: FontWeight.w700,
    ),
    titleMedium: GoogleFonts.poppins(
      fontSize: 12,
      color: AppColors.materialBlack,
      fontWeight: FontWeight.w400,
    ),
    titleSmall: GoogleFonts.poppins(
      fontSize: 12,
      color: AppColors.materialFirstGreen,
      fontWeight: FontWeight.w700,
    ),
  );
}
