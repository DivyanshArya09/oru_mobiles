import 'package:flutter/material.dart';
import 'package:oru_mobiles/core/constants/color_palatte.dart';
import 'package:oru_mobiles/features/auth/presentation/widgets/auth_header_widget.dart';
import 'package:oru_mobiles/features/auth/presentation/widgets/login_widget.dart';
import 'package:oru_mobiles/ui/app_logo.dart';
import 'package:oru_mobiles/utils/custom_spacers.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

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
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomSpacers.height20,
              const AppLogo(),
              CustomSpacers.height60,
              const AuthHeaderWidget(
                title: 'Welcome',
                subtitle: 'Sign in to continue',
              ),
              CustomSpacers.height60,
              const LoginWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
