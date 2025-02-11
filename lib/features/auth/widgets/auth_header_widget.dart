import 'package:flutter/material.dart';
import 'package:oru_mobiles/core/constants/color_palatte.dart';
import 'package:oru_mobiles/themes/app_text_themes.dart';
import 'package:oru_mobiles/utils/custom_spacers.dart';

class AuthHeaderWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? subTitleWidget;
  const AuthHeaderWidget({
    super.key,
    required this.title,
    this.subtitle,
    this.subTitleWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: AppTextThemes.of(context)
              .displayLarge
              ?.copyWith(color: ColorPalette.primary, height: 0),
        ),
        if (subtitle != null) ...[
          Text(
            subtitle!,
            style: AppTextThemes.of(context)
                .bodyLarge
                ?.copyWith(color: ColorPalette.lightGrey, height: 0),
          ),
        ],
        if (subTitleWidget != null) ...[CustomSpacers.height8, subTitleWidget!]
      ],
    );
  }
}
