import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oru_mobiles/core/constants/app_assets.dart';
import 'package:oru_mobiles/core/constants/color_palatte.dart';
import 'package:oru_mobiles/features/home/data/models/product_model.dart';
import 'package:oru_mobiles/features/home/presentation/widgets/favourite_icon.dart';
import 'package:oru_mobiles/themes/app_text_themes.dart';
import 'package:oru_mobiles/ui/shimmer_container.dart';
import 'package:oru_mobiles/utils/custom_spacers.dart';

class ProductCard extends StatelessWidget {
  final Function(bool? isFavourite) onFavouriteTap;
  final ProductModel product;
  const ProductCard(
      {super.key, required this.onFavouriteTap, required this.product});

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
                    '${product.listingLocation}, ${product.listingState}',
                    style: AppTextThemes.of(context).labelMedium,
                  ),
                ),
                const Spacer(),
                Text(
                  product.listingDate,
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
            product.marketingName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextThemes.of(context).bodyMedium,
          ),
          CustomSpacers.height10,
          Row(
            children: [
              Text(
                '${product.deviceRam}/${product.deviceStorage} GB',
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
                product.deviceCondition,
                style: AppTextThemes.of(context).labelSmall,
              )
            ],
          ),
          Text(
            '₹ ${product.listingPrice}',
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
                imageUrl: product.imagePath,
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
          Visibility(
            visible: product.openForNegotiation,
            child: Align(
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
                  Visibility(
                    visible: product.verified,
                    child: SvgPicture.asset(
                      AppAssets.oruVerified,
                    ),
                  ),
                  const Spacer(),
                  FavouriteIcon(
                    onChanged: onFavouriteTap,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
