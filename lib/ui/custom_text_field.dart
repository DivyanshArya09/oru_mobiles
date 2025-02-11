import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oru_mobiles/core/constants/color_palatte.dart';
import 'package:oru_mobiles/themes/app_text_themes.dart';
import 'package:oru_mobiles/utils/custom_spacers.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final Widget? prefix, suffix;
  final TextStyle? inputTextStyle;
  final String? hintText;
  const CustomTextField({
    super.key,
    required this.controller,
    required this.title,
    this.prefix,
    this.suffix,
    this.inputTextStyle,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextThemes.of(context).labelMedium?.copyWith(
                color: ColorPalette.darktext,
              ),
        ),
        CustomSpacers.height6,
        TextFormField(
          controller: controller,
          style: inputTextStyle,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 15.h,
            ),
            hintText: hintText,
            prefix: prefix,
            suffix: suffix,
          ),
        ),
      ],
    );
  }
}
