import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:oru_mobiles/core/constants/app_assets.dart';
import 'package:oru_mobiles/core/helpers/user_helper.dart';
import 'package:oru_mobiles/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  void _navigateToNextScreen() {
    bool isLoggedIn = UserHelper.getIsloggedIn();
    if (UserHelper.getIsloggedIn() == true) {
      Navigator.pushReplacementNamed(context, AppRouter.home);
      return;
    }
    if (UserHelper.getIsloggedIn() == true &&
        UserHelper.getUserName().isEmpty) {
      Navigator.pushReplacementNamed(context, AppRouter.register);
      return;
    }

    if (UserHelper.getIsloggedIn() == false) {
      Navigator.pushReplacementNamed(context, AppRouter.login);
      return;
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.stop();
        _navigateToNextScreen();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose controller to prevent memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          AppAssets.splashGif,
          controller: _controller,
          onLoaded: (composition) {
            _controller
              ..duration = composition.duration
              ..forward();
          },
        ),
      ),
    );
  }
}
