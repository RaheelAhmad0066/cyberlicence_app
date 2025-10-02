import 'package:cyber_licence/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextStyle {
  /// Headings (Poppins Bold)
  static TextStyle headingLargeGreen = GoogleFonts.poppins(
    fontWeight: FontWeight.bold,
    fontSize: 24,
    color: AppColors.primary,
  );

  static TextStyle headingLargeDark = GoogleFonts.poppins(
    fontWeight: FontWeight.bold,
    fontSize: 24,
    color: AppColors.textPrimary,
  );

  /// Sub-headings
  static TextStyle subHeading = GoogleFonts.poppins(
    fontWeight: FontWeight.w600,
    fontSize: 18,
    color: AppColors.textPrimary,
  );

  /// Body Text (Nunito Regular)
  static TextStyle body = GoogleFonts.nunito(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  /// Hint / Secondary Text
  static TextStyle hint = GoogleFonts.nunito(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  /// Score / Unlocked
  static TextStyle score = GoogleFonts.poppins(
    fontWeight: FontWeight.bold,
    fontSize: 16,
    color: AppColors.primary,
  );

  /// Error Text
  static TextStyle error = GoogleFonts.nunito(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.error,
  );

  /// Success Text
  static TextStyle success = GoogleFonts.nunito(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.success,
  );
}
