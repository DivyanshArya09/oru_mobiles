import 'package:flutter/material.dart';
import 'package:oru_mobiles/features/auth/widgets/auth_header_widget.dart';
import 'package:oru_mobiles/ui/app_logo.dart';
import 'package:oru_mobiles/utils/custom_spacers.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(elevation: 0, backgroundColor: Colors.transparent, actions: [
        IconButton(
          icon: const Icon(
            Icons.close,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        CustomSpacers.width10
      ]),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              CustomSpacers.height40,
              const AppLogo(),
              CustomSpacers.height60,
              const AuthHeaderWidget(
                title: 'Welcome',
                subtitle: 'Sign up to continue',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
