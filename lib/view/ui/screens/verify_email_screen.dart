import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivy/view/ui/screens/name_screen.dart';
import 'package:ivy/view/ui/screens/otp_screen.dart';
import 'package:ivy/utils/routes/widgets/custom_navigator.dart';
import 'package:ivy/utils/routes/widgets/custom_text_widget.dart';
import 'package:ivy/utils/utils.dart';
import 'package:provider/provider.dart'; // Import Provider
import 'package:ivy/providers/email_auth_provider.dart'; // Import your provider

class VerifyEmailScreen extends StatefulWidget {
  @override
  _VerifyEmailScreenState createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify yourself'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            CustomNavigator(
              context: context,
              screen: SmartNameScreen(),
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
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                labelText: 'Email Id',
              ),
            ),
            const Spacer(),
            Center(
              child: Consumer<EmailAuthProvider>(
                builder: (context, authProvider, child) {
                  return GestureDetector(
                    onTap: () async {
                      // Call verifyEmail when button is pressed
                      await authProvider.verifyEmail(_emailController.text);

                      // If successful, navigate to the OTP screen
                      if (authProvider.response?.status == 'success') {
                        CustomNavigator(
                          context: context,
                          screen: VerifyOTPScreen(
                              email: _emailController.text.trim()),
                        ).pushReplacement();
                      }
                      if (_emailController.text.trim().isEmpty) {
                        Utils.flushBarErrorMessage('Email is required', context,
                            content: const Text("Error"));
                        return;
                      } else {
                        Utils.toastMessage(
                            authProvider.response?.message ?? 'Error');
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                          horizontal: 24.h, vertical: 10.h),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(10),
                          bottom: Radius.circular(10),
                        ),
                        color: Theme.of(context).primaryColor,
                      ),
                      child: Center(
                        child: authProvider.isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white)
                            : customTextWidget(
                                'Send OTP',
                                fontSize: 14.h,
                                color: Colors.white,
                              ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
