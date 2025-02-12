import 'package:flutter/material.dart';
import 'package:oru_mobiles/core/constants/color_palatte.dart';
import 'package:oru_mobiles/features/auth/presentation/widgets/auth_header_widget.dart';
import 'package:oru_mobiles/features/auth/presentation/widgets/otp_widget.dart';
import 'package:oru_mobiles/features/auth/presentation/widgets/verification_text_widget.dart';
import 'package:oru_mobiles/ui/app_logo.dart';
import 'package:oru_mobiles/utils/custom_spacers.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.close,
              color: ColorPalette.darktext,
            ),
          ),
          CustomSpacers.width10,
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomSpacers.height40,
            const AppLogo(),
            CustomSpacers.height60,
            AuthHeaderWidget(
              title: 'Verify Mobile No.',
              subTitleWidget: VerificationTextWidget(),
            ),
            CustomSpacers.height100,
            const OtpWidget(),
          ],
        ),
      ),
    );
  }
}
