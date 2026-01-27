import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const primaryOrange = Color(0xFFFF6B00); // Approximate orange from design
  static const heroBlue = Color(0xFF5B8DEF); // Approximate blue from hero
  static const darkText = Color(0xFF1A1A1A);
  static const greyText = Color(0xFF888888);
  static const lightBackground = Color(0xFFF9F9F9);
  static const sectionBackground = Colors.white;
  static const footerBackground = Color(0xFF111111);
}

class NPLTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.white,
      primaryColor: AppColors.primaryOrange,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryOrange,
        primary: AppColors.primaryOrange,
        surface: Colors.white,
      ),
      textTheme: GoogleFonts.notoSansTextTheme().copyWith(
        displayLarge: GoogleFonts.notoSans(
          fontSize: 48,
          fontWeight: FontWeight.bold,
          color: AppColors.darkText,
        ),
        headlineLarge: GoogleFonts.notoSans(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: AppColors.darkText,
        ),
        headlineMedium: GoogleFonts.notoSans(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColors.darkText,
        ),
        bodyLarge: GoogleFonts.notoSans(
          fontSize: 16,
          color: AppColors.darkText,
        ),
        bodyMedium: GoogleFonts.notoSans(
          fontSize: 14,
          color: AppColors.greyText,
        ),
      ),
    );
  }
}
