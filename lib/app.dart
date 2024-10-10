import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ivy/view/ui/splash/splash_screen.dart';
import 'package:ivy/view/ui/splash/start_screen.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
      designSize: Size(375, 812),
      child: MaterialApp(
        title: 'Ivy',
        debugShowCheckedModeBanner: false,
        home: StartScreen(),
      ),
    );
  }
}

class GlobalMaterialkey {
  static GlobalKey<NavigatorState> contextKey = GlobalKey<NavigatorState>();
}