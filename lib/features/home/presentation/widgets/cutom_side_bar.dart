import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oru_mobiles/core/constants/app_assets.dart';
import 'package:oru_mobiles/core/constants/color_palatte.dart';
import 'package:oru_mobiles/core/helpers/user_helper.dart';
import 'package:oru_mobiles/features/home/presentation/utils/side_bar_enums.dart';
import 'package:oru_mobiles/features/home/presentation/widgets/profile_widget.dart';
import 'package:oru_mobiles/routes/app_routes.dart';
import 'package:oru_mobiles/routes/custom_navigator.dart';
import 'package:oru_mobiles/themes/app_text_themes.dart';
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
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 42.h),
              padding: EdgeInsets.all(12.w),
              color: ColorPalette.lightGrey.withOpacity(.23),
              width: double.infinity,
              // height: 60.h,
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
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
                  if (UserHelper.getIsloggedIn() == true) ...[
                    CustomSpacers.height24,
                    const ProfileWidget(),
                  ]
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (UserHelper.getIsloggedIn() == false) ...[
                    CustomSpacers.height24,
                    CustomButton(
                      strButtonText: 'Login/SignUp',
                      buttonAction: () => CustomNavigator.pushAndRemoveUntil(
                        context,
                        AppRouter.login,
                      ),
                      buttonType: ButtonType.secondary,
                    ),
                  ],
                  CustomSpacers.height10,
                  CustomButton(
                    strButtonText: 'Sell Your Phone',
                    buttonAction: () {},
                    textColor: ColorPalette.darktext,
                    bgColor: ColorPalette.action,
                    borderColor: ColorPalette.action,
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: ColorPalette.darktext,
                    ),
                    buttonType: ButtonType.secondary,
                  ),
                  CustomSpacers.height70,
                  Row(
                    children: [
                      CustomSpacers.width8,
                      SvgPicture.asset(
                        AppAssets.logoutIcon,
                      ),
                      CustomSpacers.width8,
                      Text(
                        'Logout',
                        style: AppTextThemes.of(context).bodyLarge,
                      ),
                    ],
                  )
                ],
              ),
            ),
            const Spacer(),
            _buildGrid(),
          ],
        ),
      ),
    );
  }

  Widget _buildGrid() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      height: MediaQuery.of(context).size.height * .3,
      alignment: Alignment.center,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 78 / 54,
        ),
        itemCount: SideBarEnums.values.length,
        itemBuilder: (context, index) {
          final item = SideBarEnums.values[index];
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: ColorPalette.lightGrey,
              ),
            ),
            child: InkWell(
              onTap: () {
                // Handle tap
              },
              borderRadius: BorderRadius.circular(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  item.icon,
                  // CustomSpacers.height8,
                  Text(
                    item.title,
                    textAlign: TextAlign.center,
                    style: AppTextThemes.of(context).labelSmall,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
