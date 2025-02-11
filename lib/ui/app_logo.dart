import 'package:flutter/material.dart';
import 'package:oru_mobiles/core/constants/app_assets.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppAssets.appLogoIcon,
    );
  }
}
