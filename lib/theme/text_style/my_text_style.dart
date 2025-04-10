import 'package:flutter/material.dart';

import '../colors/my_colors.dart';
import '../my_fonts.dart';

class MyTextStyle {
  static TextTheme baseTextStyle = MyFonts.baseTextStyle.copyWith(
    ///Display text style
    displayLarge: TextStyle(
      color: MyColors.onSurfaceHigh,
      fontSize: 57,
      fontWeight: FontWeight.w800,
      fontFamily: MyFonts.fontFamily,
      letterSpacing: 0,
    ),
    displayMedium: TextStyle(
      color: MyColors.onSurfaceHigh,
      fontSize: 45,
      fontWeight: FontWeight.w800,
      fontFamily: MyFonts.fontFamily,
      letterSpacing: 0,
    ),
    displaySmall: TextStyle(
      color: MyColors.onSurfaceHigh,
      fontSize: 36,
      fontWeight: FontWeight.w600,
      fontFamily: MyFonts.fontFamily,
      letterSpacing: 0,
    ),

    ///Headline text style
    headlineLarge: TextStyle(
      color: MyColors.onSurfaceHigh,
      fontSize: 32,
      fontWeight: FontWeight.w700,
      fontFamily: MyFonts.fontFamily,
      letterSpacing: 0,
    ),
    headlineMedium: TextStyle(
      color: MyColors.onSurfaceHigh,
      fontSize: 28,
      fontWeight: FontWeight.w800,
      fontFamily: MyFonts.fontFamily,
      letterSpacing: 0,
    ),
    headlineSmall: TextStyle(
      color: MyColors.onSurfaceHigh,
      fontSize: 24,
      fontWeight: FontWeight.w600,
      fontFamily: MyFonts.fontFamily,
      letterSpacing: 0,
    ),

    ///Title text style
    titleLarge: TextStyle(
      color: MyColors.onSurfaceHigh,
      fontSize: 22,
      fontWeight: FontWeight.w700,
      fontFamily: MyFonts.fontFamily,
      letterSpacing: 0,
    ),
    titleMedium: TextStyle(
      color: MyColors.onSurfaceHigh,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      fontFamily: MyFonts.fontFamily,
      letterSpacing: 0,
    ),
    titleSmall: TextStyle(
      color: MyColors.onSurfaceHigh,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      fontFamily: MyFonts.fontFamily,
      letterSpacing: 0,
    ),

    ///Label text style
    labelLarge: TextStyle(
      color: MyColors.onSurfaceHigh,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      fontFamily: MyFonts.fontFamily,
      letterSpacing: 0,
    ),
    labelMedium: TextStyle(
      color: MyColors.onSurfaceHigh,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontFamily: MyFonts.fontFamily,
      letterSpacing: 0,
    ),
    labelSmall: TextStyle(
      color: MyColors.onSurfaceHigh,
      fontSize: 10,
      fontWeight: FontWeight.w500,
      fontFamily: MyFonts.fontFamily,
      letterSpacing: 0,
    ),

    ///Body text style
    bodyLarge: TextStyle(
      color: MyColors.onSurfaceHigh,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontFamily: MyFonts.fontFamily,
      letterSpacing: 0,
    ),
    bodyMedium: TextStyle(
      color: MyColors.onSurfaceHigh,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontFamily: MyFonts.fontFamily,
      letterSpacing: 0,
    ),
    bodySmall: TextStyle(
      color: MyColors.onSurfaceHigh,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      fontFamily: MyFonts.fontFamily,
      letterSpacing: 0,
    ),
  );
}
