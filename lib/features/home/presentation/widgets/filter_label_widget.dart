import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oru_mobiles/core/constants/color_palatte.dart';
import 'package:oru_mobiles/features/home/domain/entities/filter_entity.dart';
import 'package:oru_mobiles/themes/app_text_themes.dart';
import 'package:oru_mobiles/utils/custom_spacers.dart';

class FilterLabelWidget extends StatelessWidget {
  final FilterEntity filter;
  final VoidCallback onPressed;
  const FilterLabelWidget({
    super.key,
    required this.onPressed,
    required this.filter,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50.h,
        decoration: BoxDecoration(
          // if selected then show this
          color: filter.isSelected
              ? ColorPalette.action.withOpacity(
                  .3,
                )
              : null,
        ),
        child: Row(
          children: [
            // Selected show this
            if (filter.isSelected)
              Container(
                height: 50.h,
                width: 4,
                color: ColorPalette.action,
              ),
            CustomSpacers.width10,
            Text(
              filter.label,
              style: AppTextThemes.of(context).bodyMedium?.copyWith(
                    color: ColorPalette.darkGrey,
                  ),
            ),
            const Spacer(),
            if (filter.selectedValues > 0)
              Text(
                filter.selectedValues.toString(),
                style: AppTextThemes.of(context).bodyMedium?.copyWith(
                      color: ColorPalette.action,
                    ),
              ),
            CustomSpacers.width10,
          ],
        ),
      ),
    );
  }
}
