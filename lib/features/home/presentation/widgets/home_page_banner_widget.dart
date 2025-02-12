import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oru_mobiles/core/constants/app_assets.dart';
import 'package:oru_mobiles/core/constants/color_palatte.dart';
import 'package:oru_mobiles/themes/app_text_themes.dart';
import 'package:oru_mobiles/ui/molecules/bouncing_widget.dart';
import 'package:oru_mobiles/ui/shimmer_container.dart';
import 'package:oru_mobiles/utils/custom_spacers.dart';

class HomePageBannerWidget extends StatelessWidget {
  const HomePageBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: ColorPalette.borderColorLight,
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: CachedNetworkImage(
                imageUrl:
                    'https://img.freepik.com/free-photo/woman-choosing-phone-technology-store_1303-31328.jpg',
                fit: BoxFit.cover,
                placeholder: (context, url) => ShimmerContainer(
                  height: 175.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: ColorPalette.borderColorLight,
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 20,
            child: BouncingWidget(
              onPressed: () {},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: ColorPalette.darktext,
                  borderRadius: BorderRadius.all(Radius.circular(25.r)),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(AppAssets.bagIcon),
                    CustomSpacers.width8,
                    Text(
                      'Sell',
                      style: AppTextThemes.of(context).bodyMedium?.copyWith(
                            color: ColorPalette.white,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 20,
            child: Text(
              'Sell Your Old Phone\nNearby',
              style: AppTextThemes.of(context).bodyMedium?.copyWith(
                    color: ColorPalette.white,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
