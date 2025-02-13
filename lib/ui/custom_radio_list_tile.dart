import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oru_mobiles/core/constants/color_palatte.dart';
import 'package:oru_mobiles/themes/app_text_themes.dart';

class CustomRadioListTile extends StatelessWidget {
  final String title; // Text to display for the option
  final bool groupValue; // Whether the tile is currently selected
  final VoidCallback onTap;
  final EdgeInsets? padding;
  // Callback for tapping the tile

  const CustomRadioListTile(
      {super.key,
      required this.title,
      required this.groupValue,
      required this.onTap,
      this.padding}); // Whether the tile is currently selected

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      color: groupValue ? ColorPalette.action.withOpacity(.1) : null,
      height: 58.h,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: padding ?? EdgeInsets.symmetric(vertical: 2.h),
          child: Row(
            children: [
              Text(
                title,
                style: AppTextThemes.of(context).bodyLarge,
              ),
              const Spacer(),
              Radio<bool>(
                value: true,
                groupValue: groupValue,
                onChanged: (value) {
                  // setState(() {
                  //   groupValue = value!;
                  // });
                },
                activeColor: ColorPalette.action,
                fillColor: MaterialStateProperty.resolveWith((states) {
                  return groupValue
                      ? ColorPalette.action
                      : ColorPalette.borderColorLight;
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
