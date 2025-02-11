import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oru_mobiles/core/constants/color_palatte.dart';
import 'package:pinput/pinput.dart';

class PinPutThemes {
  static final defaultPinTheme = PinTheme(
    width: 43.w,
    height: 44.h,
    textStyle: TextStyle(
      fontSize: 18.sp,
      color: ColorPalette.darktext,
      fontWeight: FontWeight.w500,
    ),
    decoration: BoxDecoration(
      color: ColorPalette.white,
      borderRadius: BorderRadius.circular(8.r),
      border: Border.all(
        color: ColorPalette.lightGrey,
        width: 1,
      ),
    ),
  );
}
