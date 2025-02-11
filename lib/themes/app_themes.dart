import 'package:flutter/material.dart';
import 'package:oru_mobiles/core/constants/color_palatte.dart';
import 'package:oru_mobiles/themes/app_text_themes.dart';
import 'package:oru_mobiles/themes/text_field_theme.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    indicatorColor: ColorPalette.primary,
    inputDecorationTheme: TextFieldTheme.theme,
    textTheme: AppTextThemes.lightTextTheme,
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.resolveWith<Color>(
        (states) {
          if (states.contains(MaterialState.selected)) {
            return ColorPalette.primary; // Active fill color (primary)
          }
          return ColorPalette.white; // Default fill color (white)
        },
      ),
      checkColor:
          MaterialStateProperty.all(ColorPalette.white), // Check icon color
      side: MaterialStateBorderSide.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return const BorderSide(
            color: ColorPalette.primary, // Border color remains same
            width: 1, // Border width 1px
          );
        }

        return const BorderSide(
          color: ColorPalette.lightGrey, // Border color remains same
          width: 1, // Border width 1px
        );
      }),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4), // Border radius 4px
      ),
    ),
  );
}
