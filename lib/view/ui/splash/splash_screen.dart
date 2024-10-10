import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivy/constant/assets_constants.dart';
import 'package:ivy/data/pref_constants.dart';

import 'package:ivy/utils/routes/widgets/custom_navigator.dart';
import 'package:ivy/view/ui/initial/initial_screen.dart';
import 'package:ivy/model/services/app_preferences.dart';

import 'start_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  // void initState() {
  //   Timer(const Duration(seconds: 2), handleLoginState);
  //   super.initState();
  // }

  // void handleLoginState() {
  //   if ((AppPreferences.instance.fetchBool(PrefConstants.kIsLogin) == true) &&
  //       (AppPreferences.instance.fetchBool(PrefConstants) == true)) {
  //     CustomNavigator(
  //         context: context,
  //         screen: const InitialScreen(
  //           index: 0,
  //         )).pushAndRemoveUntil();
  //   } else if (AppPreferences.instance
  //           .fetchBool(PrefConstants.khasShownWelcome) ==
  //       true) {
  //     CustomNavigator(context: context, screen: const LoginScreen())
  //         .pushReplacement();
  //   } else {
  //     CustomNavigator(context: context, screen: const StartScreen())
  //         .pushReplacement();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ZoomIn(
        duration: const Duration(seconds: 1),
        child: Image.asset(
          AssetsConstants.agaamin,
          width: 240.w,
        ),
      ),
    ));
  }
}
