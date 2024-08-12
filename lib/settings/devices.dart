import 'package:flutter/material.dart';
import 'package:ivy/settings/security_screen.dart';
import 'package:ivy/widgets/custom_navigator.dart';

class Devices extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Devices'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
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
            const Text(
              'Account login Activity',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  _buildDeviceTile('One Plus Nord 2T . Gurugram, Haryana',
                      'Active Now', true),
                  _buildDeviceTile('Oppo . Gurugram, Haryana',
                      'Last active on February 22, 2024, 21:37', false),
                  _buildDeviceTile('One Plus 12 . New Delhi',
                      'Last active on March 15, 2023, 21:37', false),
                ],
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Add log out functionality here
                },
                child: Text('LOG OUT OF ALL DEVICES'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDeviceTile(String deviceName, String activity, bool isActive) {
    return ListTile(
      leading: Icon(Icons.smartphone),
      title: Text(deviceName),
      subtitle: Text(activity),
      trailing: isActive
          ? Text('Active Now', style: TextStyle(color: Colors.green))
          : null,
    );
  }
}
