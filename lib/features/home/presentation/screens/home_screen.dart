import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oru_mobiles/core/constants/app_assets.dart';
import 'package:oru_mobiles/core/constants/color_palatte.dart';
import 'package:oru_mobiles/core/helpers/scaffold_helper.dart';
import 'package:oru_mobiles/features/home/presentation/widgets/cutom_side_bar.dart';
import 'package:oru_mobiles/ui/app_logo.dart';
import 'package:oru_mobiles/ui/custom_button.dart';
import 'package:oru_mobiles/ui/custom_text_field.dart';
import 'package:oru_mobiles/utils/custom_spacers.dart';

var scaffoldKey = GlobalKey<ScaffoldState>();

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomSideBar(),
      key: scaffoldKey,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(
              raduis: 12,
              controller: TextEditingController(),
              hintText: 'Search phones with make, model...',
              prefix: const Icon(
                color: ColorPalette.lightGrey,
                Icons.search,
              ),
              suffix: const SizedBox(
                width: 30,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "|",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ColorPalette.darkGrey,
                      ),
                    ),
                    Icon(
                      Icons.mic_none_outlined,
                      color: ColorPalette.darkGrey,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      leadingWidth: 120,
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: Row(
        children: [
          CustomSpacers.width10,
          GestureDetector(
            onTap: () => ScaffoldHelper.toggleDrawer(),
            child: SvgPicture.asset(
              AppAssets.hamBurgerIcon,
            ),
          ),
          CustomSpacers.width10,
          const AppLogo(
            width: 50,
            height: 25,
          ),
        ],
      ),
      actions: [
        const Text('India', style: TextStyle(color: ColorPalette.darktext)),
        CustomSpacers.width8,
        const Icon(
          Icons.location_on_outlined,
          color: ColorPalette.darktext,
        ),
        CustomSpacers.width12,
        CustomButton(
          strButtonText: 'Login',
          buttonAction: () {},
          bgColor: ColorPalette.action,
          borderColor: ColorPalette.action,
          dHeight: 30,
          textStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: ColorPalette.darktext,
          ),
          dWidth: 66,
        ),
        CustomSpacers.width10,
      ],
    );
  }
}
