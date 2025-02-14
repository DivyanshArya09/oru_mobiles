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
    return SizedBox(
      width: MediaQuery.of(context).size.width * .8,
      child: Drawer(
        backgroundColor: ColorPalette.white,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 16.h),
              padding: EdgeInsets.all(12.w),
              color: ColorPalette.borderColorLight.withOpacity(.6),
              // width: double.infinity,
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
                      dHeight: 40.h,
                      strButtonText: 'Login/SignUp',
                      buttonAction: () => CustomNavigator.pushAndRemoveUntil(
                        context,
                        AppRouter.login,
                      ),
                      buttonType: ButtonType.secondary,
                    ),
                  ],
                  CustomSpacers.height20,
                  CustomButton(
                    dHeight: 40.h,
                    strButtonText: 'Sell Your Phone',
                    buttonAction: () {},
                    textColor: ColorPalette.darktext,
                    bgColor: ColorPalette.action,
                    borderColor: ColorPalette.action,
                    textStyle: const TextStyle(
                      fontSize: 16,
                      // fontWeight: FontWeight.w600,
                      color: ColorPalette.darktext,
                    ),
                    buttonType: ButtonType.secondary,
                  ),
                  CustomSpacers.height70,
                  Visibility(
                    visible: UserHelper.getIsloggedIn() == true,
                    child: InkWell(
                      onTap: () => showLogoutDialog(context),
                      child: Row(
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
                      ),
                    ),
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
                color: ColorPalette.borderColorLight,
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

  void showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: ColorPalette.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // Rounded corners
          ),
          titlePadding: const EdgeInsets.all(16),
          contentPadding: const EdgeInsets.symmetric(horizontal: 24),
          actionsPadding:
              const EdgeInsets.only(bottom: 16, right: 16, left: 16),
          title: Column(
            mainAxisSize: MainAxisSize.min, // Reduce height
            children: [
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.close,
                    color: ColorPalette.darktext,
                  ),
                ),
              ),
              SvgPicture.asset(
                AppAssets.logoutIcon,
              ),
              CustomSpacers.height12,
              const Text(
                'Logout',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ],
          ),
          content: Text(
            'Are you sure you want to logout?\n\nYou will need to re-login to view your listings, favourites, negotiations, and purchases.',
            textAlign: TextAlign.center,
            style: AppTextThemes.of(context).labelMedium,
          ),
          actions: [
            CustomSpacers.height30,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 40, // Minimize button height
                    child: CustomButton(
                      dCornerRadius: 100,
                      bgColor: Colors.transparent,
                      borderColor: ColorPalette.darktext,
                      textColor: ColorPalette.darktext,
                      strButtonText: 'No',
                      buttonAction: () => Navigator.pop(context),
                      buttonType: ButtonType.primary,
                    ),
                  ),
                ),
                const SizedBox(width: 12), // Spacing between buttons
                Expanded(
                  child: SizedBox(
                    height: 40, // Minimize button height
                    child: CustomButton(
                      textColor: ColorPalette.darktext,
                      strButtonText: 'Logout',
                      buttonAction: () => UserHelper.logOut(),
                      buttonType: ButtonType.secondary,
                      bgColor: ColorPalette.action,
                      borderColor: ColorPalette.action,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
