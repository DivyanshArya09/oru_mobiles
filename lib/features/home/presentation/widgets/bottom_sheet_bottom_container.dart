import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oru_mobiles/core/constants/color_palatte.dart';
import 'package:oru_mobiles/themes/app_text_themes.dart';
import 'package:oru_mobiles/ui/custom_button.dart';
import 'package:oru_mobiles/utils/custom_spacers.dart';

class BottomSheetBottomContiner extends StatelessWidget {
  final VoidCallback onClearFilter, onApplyFilter;
  final bool? isDisabled;
  const BottomSheetBottomContiner(
      {super.key,
      required this.onClearFilter,
      required this.onApplyFilter,
      this.isDisabled = false});

  @override
  Widget build(BuildContext context) {
    return _buildBottomContainer(context);
  }

  Widget _buildBottomContainer(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 64.h,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
              color: ColorPalette.lightGrey,
              width: 1,
            ),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            CustomSpacers.width32,
            GestureDetector(
              onTap: onClearFilter,
              child: Text(
                'Clear all',
                style: AppTextThemes.of(context).bodyMedium?.copyWith(
                      color: ColorPalette.action,
                    ),
              ),
            ),
            const Spacer(),
            CustomButton(
              isDisabled: isDisabled!,
              dWidth: 140.w,
              dHeight: 40,
              strButtonText: 'Apply',
              buttonAction: onApplyFilter,
              buttonType: ButtonType.primary,
              borderColor: Colors.transparent,
              bgColor: ColorPalette.action,
              dCornerRadius: 8,
              textColor: ColorPalette.darktext,
              textStyle: AppTextThemes.of(context).bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
