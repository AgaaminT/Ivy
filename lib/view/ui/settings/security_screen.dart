import 'package:flutter/material.dart';
import 'package:ivy/view/ui/Employee/recovery_screen.dart';
import 'package:ivy/utils/routes/widgets/custom_navigator.dart';
import 'package:ivy/view/ui/settings/applock_screen.dart';
import 'package:ivy/view/ui/settings/devices.dart';
import 'package:ivy/view/ui/settings/settings_screen.dart';

class SecurityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            CustomNavigator(context: context, screen: SettingsScreen())
                .pushReplacement();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('Security'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    children: [
                      _buildSecurityItem(
                          Icons.verified_user, 'Two Step Verification', () {}),
                      _buildSecurityItem(Icons.lock, 'App Lock', () {
                        CustomNavigator(
                                context: context, screen: AppLockScreen())
                            .pushReplacement();
                      }),
                      _buildSecurityItem(Icons.devices, 'Devices', () {
                        CustomNavigator(context: context, screen: Devices())
                            .pushReplacement();
                      }),
                      _buildSecurityItem(Icons.build, 'Recovery', () {
                        CustomNavigator(
                                context: context,
                                screen: const RecoveryScreen())
                            .pushReplacement();
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.grey[200],
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text('About'),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text('Privacy Policies'),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text('Terms of Use'),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                const Text(
                  'Agaamin Technologies © 2024',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSecurityItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
    );
  }
}
