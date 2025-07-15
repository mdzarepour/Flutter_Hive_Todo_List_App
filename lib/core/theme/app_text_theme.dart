import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_todo/core/constants/app_colors.dart';

class AppTextTheme {
  AppTextTheme._();
  static TextTheme appTextTheme = TextTheme(
    titleLarge: GoogleFonts.poppins(
      fontSize: 15,
      color: AppColors
          .materialWhite, // Changed to white for better contrast on dark backgrounds
      fontWeight: FontWeight.w700,
    ),
    titleMedium: GoogleFonts.poppins(
      fontSize: 12,
      color:
          AppColors.materialGrey, // Using the new grey for less prominent text
      fontWeight: FontWeight.w400,
    ),
    titleSmall: GoogleFonts.poppins(
      fontSize: 12,
      color: AppColors
          .materialPink, // Using the new pink as an accent for small titles
      fontWeight: FontWeight.w700,
    ),
  );
}
