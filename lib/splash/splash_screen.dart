import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivy/constants/assets_constants.dart';
import 'package:ivy/splash/start_screen.dart';
import 'package:ivy/ui/initial/initial_screen.dart';

import 'package:ivy/widgets/custom_navigator.dart'; // Adjust the import path accordingly

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 2), () {});
    // CustomNavigator(
    //   context: context,
    //   screen: const InitialScreen(index: 0),
    // ).pushReplacement();

    CustomNavigator(context: context, screen: const StartScreen())
        .pushAndRemoveUntil();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ZoomIn(
        duration: const Duration(seconds: 1),
        child: Image.asset(
          AssetsConstants.splashlogo,
          width: 240.w,
        ),
      ),
    ));
  }
}
