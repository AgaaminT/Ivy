import 'package:flutter/material.dart';
import 'package:ivy/view/ui/profile/profile_screen.dart';
import 'package:ivy/utils/routes/widgets/custom_navigator.dart';
import 'package:ivy/view/ui/settings/security_screen.dart';


import 'package:ivy/view/ui/initial/initial_screen.dart';


class SettingsScreen extends StatelessWidget {
  bool isEditing = false;
  SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            CustomNavigator(
              context: context,
              screen: const InitialScreen(index: 0),
            ).pushReplacement();
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          _buildSettingsCategory(
            context,
            'Account',
            [
              _buildSettingsItem(Icons.person, 'Edit profile', () {
                 CustomNavigator(
                  context: context,
                  screen: UserProfileScreen(), // Navigate to the profile page
                ).pushReplacement();
              }),
              _buildSettingsItem(Icons.security, 'Security', () {
                CustomNavigator(context: context, screen: SecurityScreen())
                    .pushReplacement();
              }),
              _buildSettingsItem(Icons.notifications, 'Notifications', () {}),
              _buildSettingsItem(Icons.privacy_tip, 'Privacy', () {}),
            ],
          ),
          _buildSettingsCategory(
            context,
            'Support & About',
            [
              _buildSettingsItem(
                  Icons.subscriptions, 'Smart Name Subscription', () {}),
              _buildSettingsItem(Icons.help, 'Help & Support', () {}),
              _buildSettingsItem(Icons.policy, 'Terms and Policies', () {}),
            ],
          ),
          _buildSettingsCategory(
            context,
            'Actions',
            [
              _buildSettingsItem(Icons.group, 'Smart Name Manager', () {
                // CustomNavigator(
                //         context: context, screen: const SettingsScreen())
                //     .pushReplacement();
              }),
              _buildSettingsItem(Icons.vpn_key, 'Nostr Keys', () {}),
              _buildSettingsItem(Icons.logout, 'Log out', () {}),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsCategory(
      BuildContext context, String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          // style: Theme.of(context)
          //     .textTheme
          //     .subtitle1!
          //     .copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8.0),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            children: items,
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }

  Widget _buildSettingsItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
    );
  }
}
