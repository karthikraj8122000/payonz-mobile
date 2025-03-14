// import 'package:flutter/material.dart';

// class PrivacyAndSecurityScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Privacy & Security')),
//       body: Center(child: Text('Privacy & Security Screen')),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:payonz/Core/Constants/app_colors.dart';

class PrivacyAndSecurityScreen extends StatefulWidget {
  @override
  _PrivacyAndSecurityScreenState createState() =>
      _PrivacyAndSecurityScreenState();
}

class _PrivacyAndSecurityScreenState extends State<PrivacyAndSecurityScreen> {
  bool isAppLockEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Privacy & Security'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.shield, color: AppColors.appPrimary),
              title: Text('Data and personalisation'),
              subtitle: Text('Manage how your info is saved and used'),
              onTap: () {
                // Handle tap
              },
            ),
            Divider(
              color: AppColors.border,
            ),
            ListTile(
              leading: Icon(Icons.lock, color: AppColors.appPrimary),
              title: Text('Enable app lock'),
              subtitle:
                  Text('Use your existing passcode to keep your app secure'),
              trailing: Switch(
                value: isAppLockEnabled,
                activeColor: AppColors.appPrimary, // Custom color for ON state
                // inactiveTrackColor: Colors.grey, // Custom color for OFF state
                onChanged: (bool value) {
                  setState(() {
                    isAppLockEnabled = value;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 72.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {
                    // Handle button press
                  },
                  child: Text('Manage your app lock'),
                ),
              ),
            ),
            Divider(
              color: AppColors.border,
            ),
            ListTile(
              leading: Icon(Icons.verified_user, color: AppColors.appPrimary),
              title: Text('Get OTP code'),
              subtitle: Text(
                  'Enter this one-time code when you call pay Onz Support'),
              onTap: () {
                // Handle tap
              },
            ),
            Divider(
              color: AppColors.border,
            ),
            ListTile(
              leading: Icon(Icons.block, color: AppColors.appPrimary),
              title: Text('Blocked people'),
              subtitle: Text('See and edit people you’ve blocked'),
              onTap: () {
                // Handle tap
              },
            ),
            Divider(
              color: AppColors.border,
            ),
            ListTile(
              leading: Icon(Icons.search, color: AppColors.appPrimary),
              title: Text('How people find you on pay Onz'),
              subtitle: Text('Manage your profile preferences'),
              onTap: () {
                // Handle tap
              },
            ),
          ],
        ),
      ),
    );
  }
}
