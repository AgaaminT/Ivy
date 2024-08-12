import 'package:flutter/material.dart';
import 'package:ivy/settings/security_screen.dart';
import 'package:ivy/widgets/custom_navigator.dart';

class AppLockScreen extends StatefulWidget {
  @override
  _AppLockScreenState createState() => _AppLockScreenState();
}

class _AppLockScreenState extends State<AppLockScreen> {
  bool _isBiometricEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Lock'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () =>
              CustomNavigator(context: context, screen: SecurityScreen())
                  .pushReplacement(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Unlock with biometric',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "When enabled, you'll need to use fingerprint, face or other unique identifiers to open the app.",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Switch(
                  value: _isBiometricEnabled,
                  onChanged: (bool value) {
                    setState(() {
                      _isBiometricEnabled = value;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
