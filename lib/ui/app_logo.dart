import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oru_mobiles/core/constants/app_assets.dart';

class AppLogo extends StatelessWidget {
  final double? width, height;
  const AppLogo({super.key, this.width = 116, this.height = 61});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      width: width!.w,
      height: height!.h,
      AppAssets.appLogoIconSvg,
    );
  }
}
