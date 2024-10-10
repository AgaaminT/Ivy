import 'package:flutter/material.dart';
import 'package:ivy/view/ui/screens/create_password_screen.dart';
import 'package:ivy/view/ui/screens/verify_email_screen.dart';
import 'package:ivy/utils/routes/widgets/custom_navigator.dart';

void main() {
  runApp(MaterialApp(
    home: SmartNameScreen(),
  ));
}

class SmartNameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Enter your Smart Name',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 140),
            TextField(
              decoration: InputDecoration(
                hintText: 'Handshake domain',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 80),
            ElevatedButton(
              onPressed: () {
                // Submit logic
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.blue, // Color for button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Submit',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text('Don`t have a smart name ?'),
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  CustomNavigator(context: context, screen: VerifyEmailScreen())
                      .pushReplacement();
                },
                child: const Text('Get Yourself one'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
