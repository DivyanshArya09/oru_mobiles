import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oru_mobiles/core/constants/color_palatte.dart';
import 'package:oru_mobiles/ui/app_logo.dart';
import 'package:oru_mobiles/ui/custom_button.dart';
import 'package:oru_mobiles/utils/custom_spacers.dart';

class CustomSideBar extends StatefulWidget {
  const CustomSideBar({super.key});

  @override
  State<CustomSideBar> createState() => _CustomSideBarState();
}

class _CustomSideBarState extends State<CustomSideBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 42.h),
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            color: ColorPalette.primary.withOpacity(.09),
            width: double.infinity,
            height: 60.h,
            alignment: Alignment.center,
            child: Row(
              children: [
                const AppLogo(
                  width: 50,
                  height: 25,
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: ColorPalette.darktext,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomSpacers.height24,
                CustomButton(
                  strButtonText: 'Login/SignUp',
                  buttonAction: () {},
                  buttonType: ButtonType.secondary,
                ),
                CustomSpacers.height10,
                CustomButton(
                  strButtonText: 'Sell Your Phone',
                  buttonAction: () {},
                  bgColor: ColorPalette.action,
                  borderColor: ColorPalette.action,
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: ColorPalette.darktext,
                  ),
                  buttonType: ButtonType.secondary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
