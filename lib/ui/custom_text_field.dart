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
  const CustomTextField({
    super.key,
    required this.controller,
    this.title,
    this.contentPadding =
        const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
    this.prefix,
    this.suffix,
    this.raduis = 4,
    this.inputTextStyle,
    this.hintText,
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
          controller: controller,
          style: inputTextStyle,
          decoration: InputDecoration(
            enabledBorder: _getborder(raduis!),
            focusedBorder: _getborder(raduis!),
            errorBorder: _getborder(raduis!),
            contentPadding: contentPadding,
            hintText: hintText,
            prefixIcon: prefix == null
                ? null
                : Padding(
                    padding: contentPadding!,
                    child: prefix,
                  ),
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
      borderSide: const BorderSide(
        color: ColorPalette.borderColor,
      ),
    );
  }
}
