import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../core/global/theme/theme_color/theme_color_dark.dart';
import 'home_screen.dart';
import '../../../core/utils/app_assets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashIconSize: 500,
      splash: Center(
        child: Lottie.asset(AppAssets.splashAnimation),
      ),
      nextScreen: const HomeScreen(),
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: ThemeColor.backgroundColor,
      duration: 2500,
    );
  }
}
