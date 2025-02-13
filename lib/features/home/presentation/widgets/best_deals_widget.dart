import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oru_mobiles/core/constants/app_assets.dart';
import 'package:oru_mobiles/core/constants/color_palatte.dart';
import 'package:oru_mobiles/themes/app_text_themes.dart';
import 'package:oru_mobiles/utils/custom_spacers.dart';

class BestDealsWidget extends StatelessWidget {
  final VoidCallback onFilterTap, onSortTap;
  const BestDealsWidget(
      {super.key, required this.onFilterTap, required this.onSortTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Best Deals Near',
              style: AppTextThemes.of(context).titleLarge?.copyWith(
                    color: ColorPalette.darkestGrey,
                    fontWeight: FontWeight.w400,
                  ),
            ),
            Text(
              ' (India)',
              style: AppTextThemes.of(context).bodyLarge?.copyWith(
                    color: ColorPalette.primary,
                  ),
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios_sharp,
                color: ColorPalette.darktext)
          ],
        ),
        CustomSpacers.height10,
        SizedBox(
          height: 40,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  if (index == 1) {
                    onFilterTap();
                  }
                  if (index == 0) {
                    onSortTap();
                  }
                },
                child: _buildChip(
                  entity: BestDealsEntity.getBestDealsConstants[index],
                  context: context,
                ),
              );
            },
            separatorBuilder: (context, index) => CustomSpacers.width10,
            itemCount: BestDealsEntity.getBestDealsConstants.length,
          ),
        )
      ],
    );
  }

  Widget _buildChip(
      {required BestDealsEntity entity, required BuildContext context}) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: ColorPalette.borderColorLight,
        ),
      ),
      child: Row(
        children: [
          if (entity.assetName != null) ...[
            SvgPicture.asset(entity.assetName!),
            CustomSpacers.width6,
          ],
          Text(
            entity.label,
            style: AppTextThemes.of(context).labelMedium,
          ),
          if (entity.assetName != null) ...[
            CustomSpacers.width6,
            const Icon(
              Icons.keyboard_arrow_down,
              size: 11,
              color: ColorPalette.darktext,
            )
          ]
        ],
      ),
    );
  }
}

class BestDealsEntity {
  final String label;
  final String? assetName;

  const BestDealsEntity({this.assetName, required this.label});

  static List<BestDealsEntity> get getBestDealsConstants {
    return [
      BestDealsEntity(
        label: 'Sort',
        assetName: AppAssets.upSideDownArrowIcon,
      ),
      BestDealsEntity(
        label: 'Filter',
        assetName: AppAssets.filterIcon,
      ),
      const BestDealsEntity(label: 'Nearby Deals'),
      const BestDealsEntity(label: 'Deals in 250km'),
      const BestDealsEntity(label: 'Verified Deals'),
      const BestDealsEntity(label: 'Deals in 50km'),
      const BestDealsEntity(label: 'Apple'),
    ];
  }
}
