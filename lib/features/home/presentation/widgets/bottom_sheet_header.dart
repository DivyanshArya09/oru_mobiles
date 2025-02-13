import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oru_mobiles/core/constants/color_palatte.dart';
import 'package:oru_mobiles/themes/app_text_themes.dart';
import 'package:oru_mobiles/utils/custom_spacers.dart';

class BottomSheetHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onClose;
  const BottomSheetHeader({super.key, required this.title, this.onClose});

  @override
  Widget build(BuildContext context) {
    return _buildHeader(context);
  }

  Widget _buildHeader(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        height: 64.h,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
          border: Border(
            bottom: BorderSide(
              color: ColorPalette.lightGrey,
              width: 1,
            ),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              height: 4.h,
              width: 42.w,
              decoration: BoxDecoration(
                color: ColorPalette.borderColor,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            CustomSpacers.height8,
            Row(
              children: [
                Text(
                  title,
                  style: AppTextThemes.of(context).titleLarge?.copyWith(
                        color: ColorPalette.darkestGrey,
                      ),
                ),
                const Spacer(),
                InkWell(
                  onTap: onClose,
                  child: const Icon(
                    Icons.close,
                    color: ColorPalette.darktext,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
