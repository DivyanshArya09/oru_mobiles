import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oru_mobiles/core/constants/color_palatte.dart';
import 'package:oru_mobiles/themes/app_text_themes.dart';
import 'package:oru_mobiles/utils/custom_spacers.dart';

class WhatsOnYourMindWidget extends StatelessWidget {
  const WhatsOnYourMindWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> labels = [
      'Buy Used Phones',
      'Sell Used Phones',
      'Compare Prices',
      'My Profile',
      'My Listings',
      'Open Store',
    ];
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'What\'s on your mind?',
          style: AppTextThemes.of(context).titleLarge?.copyWith(
                color: ColorPalette.darkestGrey,
                fontWeight: FontWeight.w400,
              ),
        ),
        CustomSpacers.height16,
        SizedBox(
          height: MediaQuery.of(context).size.height * .15,
          child: ListView.separated(
            separatorBuilder: (context, index) => CustomSpacers.width16,
            itemBuilder: (context, index) => _buildChip(labels[index], context),
            itemCount: labels.length,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }

  Widget _buildChip(String label, BuildContext context) {
    return SizedBox(
      width: 72.w,
      child: Column(
        children: [
          Container(
            height: 72.h,
            width: 72.h,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: ColorPalette.borderColorLight,
            ),
          ),
          CustomSpacers.height8,
          Text(
            textAlign: TextAlign.center,
            label,
            style: AppTextThemes.of(context).labelMedium,
          ),
        ],
      ),
    );
  }
}
