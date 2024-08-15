import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivy/widgets/custom_appbar.dart';
import 'package:ivy/widgets/custom_navigator.dart';
import 'package:ivy/widgets/custom_text_widget.dart';
import 'eligibility_screen.dart';

class VerifyOTPScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isBackButton: true,
        title: 'confirm OTP',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                labelText: 'OTP',
              ),
            ),
            const Spacer(),
            Center(
              child: GestureDetector(
                onTap: () {
                  CustomNavigator(context: context, screen: EligibilityScreen())
                      .pushReplacement();
                },
                child: Container(
                  width: double.infinity,
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.h, vertical: 10.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(10),
                      bottom: Radius.circular(10),
                    ),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Center(
                    child: customTextWidget(
                      'Submit',
                      fontSize: 14.h,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: TextButton(
                onPressed: () {
                  // Handle resend OTP action
                },
                child: const Text('Resend OTP'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
