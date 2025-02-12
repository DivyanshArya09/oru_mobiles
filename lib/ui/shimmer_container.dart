import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oru_mobiles/core/constants/color_palatte.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerContainer extends StatelessWidget {
  final BoxDecoration? decoration;
  final double height, width;
  final EdgeInsets? padding;
  const ShimmerContainer(
      {super.key,
      this.decoration,
      required this.height,
      required this.width,
      this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Shimmer.fromColors(
        period: const Duration(milliseconds: 800),
        baseColor: ColorPalette.borderColorLight,
        highlightColor: ColorPalette.lightestGrey,
        enabled: true,
        child: Container(
          height: height.h,
          width: width.w,
          decoration: decoration ??
              BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorPalette.borderColorLight,
              ),
        ),
      ),
    );
  }
}
