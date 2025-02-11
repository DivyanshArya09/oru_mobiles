import 'package:flutter/material.dart';

class AppTextThemes {
  // Constructor to fetch text theme from context
  static TextTheme of(BuildContext context) {
    return Theme.of(context).textTheme;
  }

  static const lightTextTheme = TextTheme(
    // 1. font-size: 28px, font-weight: 600, line-height: 44.24px
    displayLarge: TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
      fontSize: 28,
      height: 44.24 / 28,
      letterSpacing: 0,
      textBaseline: TextBaseline.alphabetic,
    ),

    // 2. font-size: 14px, font-weight: 400, line-height: 22.12px
    bodyLarge: TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
      fontSize: 14,
      height: 22.12 / 14,
      letterSpacing: 0,
      textBaseline: TextBaseline.alphabetic,
    ),

    // 3. font-size: 16px, font-weight: 400
    bodyMedium: TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
      fontSize: 16,
      letterSpacing: 0,
      textBaseline: TextBaseline.alphabetic,
    ),

    // 4. font-size: 18px, font-weight: 600, line-height: 27px
    titleLarge: TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
      fontSize: 18,
      height: 27 / 18,
      letterSpacing: 0,
      textBaseline: TextBaseline.alphabetic,
    ),

    // 5. font-size: 10px, font-weight: 400, line-height: 13.5px, letter-spacing: -5%
    labelSmall: TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
      fontSize: 10,
      height: 13.5 / 10,
      letterSpacing: -0.05, // -5% letter spacing converted
      textBaseline: TextBaseline.alphabetic,
    ),

    // 6. font-size: 12px, font-weight: 500, line-height: 18px
    labelMedium: TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
      fontSize: 12,
      height: 18 / 12,
      letterSpacing: 0,
      textBaseline: TextBaseline.alphabetic,
    ),
  );
}
