import 'package:flutter/material.dart';
import 'package:payonz/Core/Constants/app_colors.dart';
import 'package:payonz/Features/Profile/presentation/screens/settings_page/about_screen.dart';
import 'package:payonz/Features/Profile/presentation/screens/settings_page/addCredit_Debit_card.dart';
import 'package:payonz/Features/Profile/presentation/screens/settings_page/help&feedback_screen.dart';
import 'package:payonz/Features/Profile/presentation/screens/settings_page/notifications&Emails.dart';
import 'package:payonz/Features/Profile/presentation/screens/settings_page/personalInfo_screen.dart';
import 'package:payonz/Features/Profile/presentation/screens/settings_page/privacy&security_screen.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appPrimary,
        foregroundColor: AppColors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SettingsItem(
              icon: Icons.person,
              text: 'Personal info',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PersonalInfoScreen()),
                );
              },
            ),
            SettingsItem(
              icon: Icons.notifications,
              text: 'Notifications & emails',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NotificationsAndEmailsScreen()),
                );
              },
            ),
            SettingsItem(
              icon: Icons.security,
              text: 'Privacy & security',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PrivacyAndSecurityScreen()),
                );
              },
            ),
            SizedBox(height: 20),
            SettingsItem(
              icon: Icons.info,
              text: 'About',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutScreen()),
                );
              },
            ),
            SettingsItem(
              icon: Icons.help,
              text: 'Help & feedback',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HelpAndFeedback()),
                );
              },
            ),
            SettingsItem(
              icon: Icons.lock,
              text: 'Lock app',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LockScreen()),
                );
              },
            ),
            SettingsItem(
              icon: Icons.power_settings_new,
              text: 'Sign out',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignOutScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  SettingsItem({required this.icon, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          children: [
            Icon(icon, color: AppColors.appPrimary, size: 24),
            SizedBox(width: 16),
            Text(
              text,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}



class LockScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lock App')),
      body: Center(child: Text('Lock App Screen')),
    );
  }
}

class SignOutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Out')),
      body: Center(child: Text('Sign Out Screen')),
    );
  }
}
