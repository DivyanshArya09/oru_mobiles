import 'package:flutter/material.dart';
import 'package:oru_mobiles/core/constants/color_palatte.dart';
import 'package:oru_mobiles/features/auth/widgets/terms_and_condition_widget.dart';
import 'package:oru_mobiles/themes/app_text_themes.dart';
import 'package:oru_mobiles/ui/custom_button.dart';
import 'package:oru_mobiles/ui/custom_text_field.dart';
import 'package:oru_mobiles/utils/custom_spacers.dart';

enum LoginWidgetType { bottomSheet, pageWidget }

extension LoginWidgetTypeExtension on LoginWidgetType {
  bool get isPageWidget {
    return this == LoginWidgetType.pageWidget;
  }
}

class LoginWidget extends StatefulWidget {
  final LoginWidgetType? loginWidgetType;
  const LoginWidget(
      {super.key, this.loginWidgetType = LoginWidgetType.pageWidget});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  late TextEditingController _phoneTC;

  @override
  void initState() {
    _phoneTC = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorPalette.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextField(
            controller: _phoneTC,
            title: 'Enter Your Phone Number',
            hintText: 'Mobile Number',
            prefix: Text(
              '+91',
              style: AppTextThemes.of(context)
                  .bodyMedium
                  ?.copyWith(color: ColorPalette.darktext),
            ),
          ),
          if (!widget.loginWidgetType!.isPageWidget) CustomSpacers.height16,
          if (widget.loginWidgetType!.isPageWidget) CustomSpacers.height120,
          const TermsAndConditionWidget(),
          CustomSpacers.height16,
          CustomButton.icon(
            buttonAction: () {},
            strButtonText: 'Next',
            icon: const Icon(
              Icons.arrow_forward,
              color: ColorPalette.white,
            ),
          ),
        ],
      ),
    );
  }
}
