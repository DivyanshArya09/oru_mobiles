import 'package:flutter/material.dart';
import 'package:oru_mobiles/core/constants/color_palatte.dart';
import 'package:oru_mobiles/features/home/data/models/faq_model.dart';
import 'package:oru_mobiles/features/home/presentation/widgets/faq_tile.dart';
import 'package:oru_mobiles/themes/app_text_themes.dart';
import 'package:oru_mobiles/ui/shimmer_container.dart';
import 'package:oru_mobiles/utils/custom_spacers.dart';

class FAQWidget extends StatelessWidget {
  final List<FaqModel> faqs;
  const FAQWidget({super.key, required this.faqs});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Frequently Asked Questions',
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
        for (FaqModel faq in faqs) ...[FAQTile(faq: faq), CustomSpacers.height8]
      ],
    );
  }
}

class FaqSkelTon extends StatelessWidget {
  const FaqSkelTon({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Frequently Asked Questions',
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
        for (int i = 0; i < 5; i++) ...[
          const ShimmerContainer(
            height: 40,
            width: double.infinity,
            decoration: BoxDecoration(
              color: ColorPalette.borderColorLight,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
          CustomSpacers.height8
        ]
      ],
    );
  }
}
