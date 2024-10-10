import 'package:flutter/material.dart';
import 'package:ivy/view/ui/profile/profile_screen.dart';
import 'package:ivy/view/ui/settings/settings_screen.dart';
import 'package:ivy/utils/routes/widgets/custom_navigator.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text("Sajan.iit"),
            accountEmail: Text("sajan@example.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              CustomNavigator(context: context, screen: UserProfileScreen())
                  .pushReplacement();
            },
          ),
          ListTile(
            leading: const Icon(Icons.group),
            title: const Text('Community'),
            subtitle: const Text('Coming Soon'),
            onTap: () {
              // Placeholder for future functionality
            },
          ),
          ListTile(
            leading: const Icon(Icons.work),
            title: const Text('Jobs'),
            subtitle: const Text('Coming Soon'),
            onTap: () {
              // Placeholder for future functionality
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              CustomNavigator(context: context, screen: SettingsScreen())
                  .pushReplacement();
            },
          ),
        ],
      ),
    );
  }
}
