import 'package:flutter/material.dart';
import 'package:ivy/constants/assets_constants.dart';
import 'package:ivy/screens/create_password_screen.dart';
import 'package:ivy/widgets/custom_navigator.dart';
import 'package:ivy/widgets/custom_text_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CongratulationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Spacer(),
            Lottie.asset(
              AssetsConstants.congratulations,
              height: 200.h,
              width: 200.w,
            ),
            SizedBox(height: 24.h),
            customTextWidget(
              'Congratulations!',
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
              color: Colors.black,
            ),
            SizedBox(height: 16.h),
            customTextWidget(
              'Your smart name has been successfully created.',
              fontSize: 16.sp,
              textAlign: TextAlign.center,
              color: Colors.grey,
            ),
            const Spacer(),
            Center(
              child: GestureDetector(
                onTap: () {
                  CustomNavigator(
                          context: context, screen: CreatePasswordScreen())
                      .pushReplacement();
                },
                child: Container(
                  width: double.infinity,
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.h, vertical: 10.h),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(10),
                      bottom: Radius.circular(10),
                    ),
                    color: Colors.teal,
                  ),
                  child: Center(
                    child: customTextWidget(
                      'Continue to Create Password',
                      fontSize: 14.h,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
