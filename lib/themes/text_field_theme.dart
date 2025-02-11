import 'package:flutter/material.dart';
import 'package:oru_mobiles/core/constants/color_palatte.dart';

class TextFieldTheme {
  static InputDecorationTheme theme = InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(
        color: ColorPalette.borderColor,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(
        color: ColorPalette.borderColor,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(
        color: ColorPalette.borderColor, // Using primary color
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(
        color: ColorPalette.errorColor,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(
        color: ColorPalette.errorColor,
      ),
    ),
    hintStyle: const TextStyle(
      color: ColorPalette.borderColor,
    ),
  );
}
