import 'package:flutter/material.dart';
import 'package:oru_mobiles/core/constants/color_palatte.dart';
import 'package:oru_mobiles/themes/app_text_themes.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? title;
  final Widget? prefix, suffix;
  final TextStyle? inputTextStyle;
  final String? hintText;
  final double? raduis;
  final EdgeInsets? contentPadding;
  final Color? borderColor;
  final TextInputType? keyboardType;
  final int? maxLength;
  final String? Function(String?)? validator;
  final Function(String?)? onChanged;
  final Color? hintTextColor;
  const CustomTextField({
    super.key,
    this.hintTextColor = ColorPalette.borderColor,
    required this.controller,
    this.borderColor = ColorPalette.borderColor,
    this.title,
    this.contentPadding =
        const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
    this.prefix,
    this.suffix,
    this.raduis = 4,
    this.validator,
    this.onChanged,
    this.inputTextStyle,
    this.hintText,
    this.keyboardType,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Text(
            title!,
            style: AppTextThemes.of(context).labelMedium?.copyWith(
                  color: ColorPalette.darktext,
                ),
          ),
        TextFormField(
          validator: validator,
          onChanged: onChanged,
          controller: controller,
          maxLength: maxLength,
          style: inputTextStyle,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            helperStyle: TextStyle(color: hintTextColor),
            fillColor: ColorPalette.white,
            filled: true,
            counterText: '',
            enabledBorder: _getborder(raduis!),
            focusedBorder: _getborder(raduis!),
            errorBorder: _getborder(raduis!),
            contentPadding: contentPadding,
            hintText: hintText,
            prefixIcon: prefix,
            suffixIcon: suffix != null
                ? Padding(
                    padding: contentPadding!,
                    child: suffix,
                  )
                : null,
          ),
        ),
      ],
    );
  }

  OutlineInputBorder _getborder(double borderRaduis) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRaduis),
      borderSide: BorderSide(
        color: borderColor!,
      ),
    );
  }
}
