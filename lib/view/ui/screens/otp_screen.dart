import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivy/providers/email_auth_provider.dart';
import 'package:ivy/view/ui/screens/create_password_screen.dart';
import 'package:ivy/view/ui/screens/verify_email_screen.dart';
import 'package:ivy/utils/routes/widgets/custom_navigator.dart';
import 'package:ivy/utils/routes/widgets/custom_text_widget.dart';
import 'package:ivy/utils/utils.dart';
import 'package:provider/provider.dart';



class VerifyOTPScreen extends StatefulWidget {
  final String email; // Accept email in constructor

  VerifyOTPScreen({required this.email}); // Constructor

  @override
  _VerifyOTPScreenState createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> {
  final TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final emailAuthProvider = Provider.of<EmailAuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Confirm OTP'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            CustomNavigator(
              context: context,
              screen: VerifyEmailScreen(),
            ).pushReplacement();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            // Only OTP field is shown, no email field here
            TextField(
              controller: _otpController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                labelText: 'OTP',
              ),
            ),
            const Spacer(),
            Center(
              child: GestureDetector(
                onTap: () async {
                  String otp = _otpController.text.trim();
                  if (otp.isNotEmpty) {
                    await emailAuthProvider.verifyOtp(
                      widget.email, // Use email from widget
                      otp,
                    );

                    if (emailAuthProvider.response?.status == 'success') {
                      CustomNavigator(
                        context: context,
                        screen: CreatePasswordScreen(),
                      ).pushReplacement();
                    } else {
                      Utils.toastMessage(emailAuthProvider.response?.message ??
                          'OTP verification failed');
                    }
                  } else {
                    Utils.flushBarErrorMessage(
                      'Please enter OTP',
                      context,
                      content: const Text('Please enter OTP'),
                    );
                  }
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
                      emailAuthProvider.isLoading ? 'Submitting...' : 'Submit',
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
                onPressed: () async {
                  await emailAuthProvider.resendOtp(widget.email);

                  if (emailAuthProvider.response?.status == 'success') {
                    Utils.toastMessage('OTP has been resent');
                  } else {
                    Utils.flushBarErrorMessage(
                      emailAuthProvider.response?.message ??
                          'Failed to resend OTP',
                      context,
                      content: const Text('Error'),
                    );
                  }
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
