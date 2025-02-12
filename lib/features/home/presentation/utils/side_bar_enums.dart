import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oru_mobiles/core/constants/app_assets.dart';

enum SideBarEnums {
  howToBuy,
  howToSell,
  oruGuide,
  aboutUs,
  privacyPolicy,
  faqs
}

extension SideBarExtension on SideBarEnums {
  Widget get icon {
    switch (this) {
      case SideBarEnums.howToBuy:
        return SvgPicture.asset(AppAssets.cartIcon);
      case SideBarEnums.howToSell:
        return SvgPicture.asset(AppAssets.saveMoneyIcon);
      case SideBarEnums.oruGuide:
        return SvgPicture.asset(AppAssets.bookIcon);
      case SideBarEnums.aboutUs:
        return SvgPicture.asset(AppAssets.aboutUsIcon);
      case SideBarEnums.privacyPolicy:
        return SvgPicture.asset(AppAssets.privacyPolicy);
      case SideBarEnums.faqs:
        return SvgPicture.asset(AppAssets.faqIcon);
    }
  }

  String get title {
    switch (this) {
      case SideBarEnums.howToBuy:
        return 'How to Buy';
      case SideBarEnums.howToSell:
        return 'How to Sell';
      case SideBarEnums.oruGuide:
        return 'Oru Guide';
      case SideBarEnums.aboutUs:
        return 'About Us';
      case SideBarEnums.privacyPolicy:
        return 'Privacy Policy';
      case SideBarEnums.faqs:
        return 'FAQs';
    }
  }
}
