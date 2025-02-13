import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oru_mobiles/core/constants/app_assets.dart';
import 'package:oru_mobiles/core/constants/color_palatte.dart';
import 'package:oru_mobiles/themes/app_text_themes.dart';
import 'package:oru_mobiles/ui/shimmer_container.dart';
import 'package:oru_mobiles/utils/custom_spacers.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 292.h,
      decoration: BoxDecoration(
        border: Border.all(color: ColorPalette.borderColorLight),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 2),
            blurRadius: 4,
            color: Color.fromRGBO(140, 140, 140, 0.1),
          ),
          BoxShadow(
            offset: Offset(-2, 6),
            blurRadius: 7,
            color: Color.fromRGBO(140, 140, 140, 0.09),
          ),
          BoxShadow(
            offset: Offset(-4, 14),
            blurRadius: 9,
            color: Color.fromRGBO(140, 140, 140, 0.05),
          ),
          BoxShadow(
            offset: Offset(-7, 26),
            blurRadius: 11,
            color: Color.fromRGBO(140, 140, 140, 0.01),
          ),
          BoxShadow(
            offset: Offset(-12, 40),
            blurRadius: 12,
            color: Color.fromRGBO(140, 140, 140, 0),
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProductImage(context),
          _buildProductDetails(context),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            decoration: const BoxDecoration(
              color: ColorPalette.lightestGrey,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 70,
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    'Nijampur, Luc.....',
                    style: AppTextThemes.of(context).labelMedium,
                  ),
                ),
                const Spacer(),
                Text(
                  '13 feb',
                  style: AppTextThemes.of(context).labelMedium,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildProductDetails(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSpacers.height16,
          Text(
            'Apple iPhone 13 Pro',
            style: AppTextThemes.of(context).bodyMedium,
          ),
          CustomSpacers.height10,
          Row(
            children: [
              Text(
                '12/256 GB',
                style: AppTextThemes.of(context).labelSmall,
              ),
              Container(
                height: 4,
                width: 4,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                ),
              ),
              Text(
                'Like New',
                style: AppTextThemes.of(context).labelSmall,
              )
            ],
          ),
          Text(
            '₹ 1,00,000',
            style: AppTextThemes.of(context).titleLarge,
          ),
          // const Spacer(),
        ],
      ),
    );
  }

  Widget _buildProductImage(BuildContext context) {
    return SizedBox(
      height: 174.h,
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl:
                    'https://i.guim.co.uk/img/media/6ead18d1b23b6cdaa33f6731c0c417a8f0576552/539_452_3726_2236/master/3726.jpg?width=445&dpr=1&s=none&crop=none',
                errorWidget: (context, url, error) => const Icon(Icons.error),
                placeholder: (context, url) => ShimmerContainer(
                  height: 174.h,
                  width: 223.w,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 25,
              alignment: Alignment.center,
              // padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              color: const Color.fromRGBO(76, 76, 76, 0.69),
              child: Text(
                'Price Negotiable'.toUpperCase(),
                style: AppTextThemes.of(context).labelSmall?.copyWith(
                      color: ColorPalette.white,
                    ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppAssets.oruVerified,
                  ),
                  const Spacer(),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8, right: 8),
                    child: Icon(
                      Icons.favorite_border_outlined,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
