import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oru_mobiles/core/constants/color_palatte.dart';
import 'package:oru_mobiles/features/home/data/models/mobile_brand_model.dart';
import 'package:oru_mobiles/themes/app_text_themes.dart';
import 'package:oru_mobiles/ui/shimmer_container.dart';
import 'package:oru_mobiles/utils/custom_spacers.dart';

class TopBrandsWidget extends StatelessWidget {
  final bool? isLoading;
  final List<MobileBrandModel> brands;
  const TopBrandsWidget({super.key, this.isLoading, required this.brands});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Top Brands',
              style: AppTextThemes.of(context).titleLarge?.copyWith(
                    color: ColorPalette.darkestGrey,
                    fontWeight: FontWeight.w400,
                  ),
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios_sharp,
              color: ColorPalette.darktext,
            )
          ],
        ),
        CustomSpacers.height16,
        SizedBox(
          height: MediaQuery.of(context).size.height * .13,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: index >= 9
                  ? _buildViewAllChip(context)
                  : _buildChip(brands[index], context),
            ),
            itemCount: 10,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }

  Widget _buildViewAllChip(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: 72.w,
        height: 72.h,
        // padding: const EdgeInsets.all(16),
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: ColorPalette.lightestGrey,
        ),
        child: FittedBox(
          fit: BoxFit.contain,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'View All',
                style: AppTextThemes.of(context).labelMedium,
              ),
              const Icon(
                Icons.arrow_forward,
                color: ColorPalette.darktext,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChip(MobileBrandModel brand, BuildContext context) {
    return SizedBox(
      width: 72.w,
      child: Column(
        children: [
          Container(
            height: 72.h,
            width: 72.h,
            padding: EdgeInsets.all(16),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: ColorPalette.lightestGrey,
            ),
            child: CachedNetworkImage(
              imageUrl: brand.imagePath,
              fit: BoxFit.contain,
              errorWidget: (context, url, error) => const Icon(Icons.error),
              placeholder: (context, url) => ShimmerContainer(
                height: 72.h,
                width: 72.h,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorPalette.borderColorLight,
                ),
              ),
            ),
          ),
          CustomSpacers.height8,
          Text(
            textAlign: TextAlign.center,
            brand.make,
            style: AppTextThemes.of(context).labelMedium,
          ),
        ],
      ),
    );
  }
}
