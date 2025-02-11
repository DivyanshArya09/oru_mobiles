import 'package:flutter/material.dart';
import 'package:oru_mobiles/core/constants/color_palatte.dart';
import 'package:oru_mobiles/themes/app_text_themes.dart';
import 'package:oru_mobiles/themes/text_field_theme.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    indicatorColor: ColorPalette.primary,
    inputDecorationTheme: TextFieldTheme.theme,
    textTheme: AppTextThemes.lightTextTheme,
  );
}
