// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:ivy/constants/assets_constants.dart';

// import 'package:ivy/screens/name_screen.dart';
// import 'package:ivy/widgets/custom_navigator.dart';
// import 'package:ivy/widgets/custom_text_widget.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import 'package:lottie/lottie.dart';
// import 'dart:async';

// class StartScreen extends StatefulWidget {
//   const StartScreen({super.key});

//   @override
//   _StartScreenState createState() => _StartScreenState();
// }

// class _StartScreenState extends State<StartScreen>
//     with TickerProviderStateMixin {
//   final PageController _controller = PageController();
//   int currentIndex = 0;
//   late final AnimationController _animationController1;
//   late final AnimationController _animationController2;
//   late final AnimationController _animationController3;

//   @override
//   void initState() {
//     super.initState();
//     _animationController1 = AnimationController(vsync: this);
//     _animationController2 = AnimationController(vsync: this);
//     _animationController3 = AnimationController(vsync: this);

//     // Start the timers to stop the animations after 3 seconds
//     Timer(const Duration(seconds: 3), () => _animationController1.stop());
//     Timer(const Duration(seconds: 3), () => _animationController2.stop());
//     Timer(const Duration(seconds: 3), () => _animationController3.stop());
//   }

//   @override
//   void dispose() {
//     _animationController1.dispose();
//     _animationController2.dispose();
//     _animationController3.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           PageView(
//             controller: _controller,
//             onPageChanged: (index) {
//               setState(() {
//                 currentIndex = index;
//               });
//             },
//             children: [
//               buildOnboardingPage(
//                 context,
//                 animationPath: AssetsConstants.slider1,
//                 controller: _animationController1,
//                 title: 'Find Your Dream Job',
//                 description:
//                     'Explore thousands of job listings in various fields',
//               ),
//               buildOnboardingPage(
//                 context,
//                 animationPath: AssetsConstants.slider2,
//                 controller: _animationController2,
// title: 'Connect with Employers',
// description:
//     'Chat directly with employers and get instant feedback',
//               ),
//               buildOnboardingPage(
//                 context,
//                 animationPath: AssetsConstants.slider3,
//                 controller: _animationController3,
//                 title: 'Grow Your Network',
//                 description: 'Build professional connections and stay updated',
//               ),
//             ],
//           ),
//           Positioned(
//             top: 40.h,
//             right: 16.h,
//             child: GestureDetector(
//               onTap: () {
//                 CustomNavigator(context: context, screen: NameScreen())
//                     .pushReplacement();
//               },
//               child:
//                   customTextWidget("Skip", fontSize: 16.h, color: Colors.teal),
//             ),
//           ),
//           Positioned(
//             bottom: 120.h,
//             left: 0,
//             right: 0,
//             child: Center(
//               child: SmoothPageIndicator(
//                 controller: _controller,
//                 count: 3,
//                 effect: ExpandingDotsEffect(
//                   dotWidth: 10.w,
//                   dotHeight: 10.h,
//                   activeDotColor: Colors.teal,
//                   dotColor: Colors.grey,
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             bottom: 30.h,
//             left: 16.h,
//             right: 16.h,
//             child: buildNavigateButton(context),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildOnboardingPage(BuildContext context,
//       {required String animationPath,
//       required AnimationController controller,
//       required String title,
//       required String description}) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Lottie.asset(
//           animationPath,
//           controller: controller,
//           width: MediaQuery.of(context).size.width,
//           height: 300.h,
//           fit: BoxFit.fitHeight,
//         ),
//         SizedBox(height: 20.h),
//         customTextWidget(title, fontSize: 24.h, fontWeight: FontWeight.bold),
//         SizedBox(height: 20.h),
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: 8.h),
//           child: customTextWidget(description,
//               fontSize: 16.h, textAlign: TextAlign.center),
//         ),
//       ],
//     );
//   }

//   Widget buildNavigateButton(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         if (currentIndex == 2) {
//           CustomNavigator(context: context, screen: NameScreen())
//               .pushReplacement();
//         } else {
//           _controller.nextPage(
//               duration: const Duration(milliseconds: 300),
//               curve: Curves.easeIn);
//         }
//       },
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 10.h),
//         decoration: const BoxDecoration(
//           borderRadius: BorderRadius.vertical(
//               top: Radius.circular(10), bottom: Radius.circular(10)),
//           gradient: LinearGradient(
//             colors: [Colors.teal, Color(0xff00e6fe)],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: Center(
//           child: customTextWidget(currentIndex == 2 ? "Get Started" : "Next",
//               fontSize: 14.h, color: Colors.white),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivy/constants/assets_constants.dart';
import 'package:ivy/screens/login_screen.dart';
import 'package:ivy/screens/name_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../widgets/custom_navigator.dart';
import '../../widgets/custom_text_widget.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  Future<void> _completeWelcomeScreen(BuildContext context) async {
    // await AppPreferences.instance.saveBool('hasShownWelcome', true);
    CustomNavigator(context: context, screen: NameScreen()).pushReplacement();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            children: [
              buildOnboardingPage(
                context,
                imagePath: AssetsConstants.slider1,
                title: 'Find Your Dream Job',
                description:
                    'Explore thousands of job listings in various fields',
              ),
              buildOnboardingPage(
                context,
                imagePath: AssetsConstants.slider2,
                title: 'Connect with Employers',
                description:
                    'Chat directly with employers and get instant feedback',
              ),
              buildOnboardingPage(
                context,
                imagePath: AssetsConstants.slider3,
                title: 'Grow Your Network',
                description: 'Build professional connections and stay updated',
              ),
            ],
          ),
          Positioned(
            top: 40.h,
            right: 16.h,
            child: GestureDetector(
              onTap: () {
                // Navigate to the login screen directly
                CustomNavigator(context: context, screen: NameScreen())
                    .pushReplacement();
              },
              child:
                  customTextWidget("Skip", fontSize: 16.h, color: Colors.teal),
            ),
          ),
          Positioned(
            bottom: 120.h,
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: ExpandingDotsEffect(
                  dotWidth: 10.w,
                  dotHeight: 10.h,
                  activeDotColor: Colors.green,
                  dotColor: Colors.grey,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 30.h,
            left: 16.h,
            right: 16.h,
            child: buildNavigateButton(context),
          ),
        ],
      ),
    );
  }

  Widget buildOnboardingPage(BuildContext context,
      {required String imagePath,
      required String title,
      required String description}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          imagePath,
          width: MediaQuery.of(context).size.width,
          height: 300,
          fit: BoxFit.fitHeight,
        ),
        SizedBox(height: 20.h),
        customTextWidget(title, fontSize: 24.h, fontWeight: FontWeight.bold),
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.h),
          child: customTextWidget(description,
              fontSize: 16.h, textAlign: TextAlign.center),
        ),
      ],
    );
  }

  Widget buildNavigateButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (currentIndex == 2) {
          _completeWelcomeScreen(context);
        } else {
          _controller.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn);
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 10.h),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(10), bottom: Radius.circular(10)),
          gradient: LinearGradient(
            colors: [Color.fromARGB(78, 3, 182, 227), Color(0xff00e6fe)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Center(
            child: customTextWidget(currentIndex == 2 ? "Get Started" : "Next",
                fontSize: 14.h, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
