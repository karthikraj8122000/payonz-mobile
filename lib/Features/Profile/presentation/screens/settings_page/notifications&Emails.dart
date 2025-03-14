// import 'package:flutter/material.dart';

// class NotificationsAndEmailsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Notifications & Emails')),
//       body: Center(child: Text('Notifications & Emails Screen')),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:payonz/Core/Constants/app_colors.dart';

class NotificationsAndEmailsScreen extends StatefulWidget {
  @override
  _NotificationsAndEmailsScreenState createState() =>
      _NotificationsAndEmailsScreenState();
}

class _NotificationsAndEmailsScreenState extends State {
  bool payOnezPayTips = true;
  bool friendsActivity = true;
  bool smartAlerts = true;
  bool offersRewards = true;
  bool transactionHistory = true;
  bool chatMessages = true;
  bool locationBasedAlerts = false;
  bool orderUpdates = true;
  bool emailpayOnezTips = true;
  bool emailOffersRewards = true;
  bool emailTransactionInsights = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Notifications and Emails'),
        // backgroundColor: AppColors.appPrimary,
        // foregroundColor: AppColors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              "You'll get a notification after every transaction and payment request. Manage all other notifications here.",
              style: TextStyle(color: Colors.grey[600]),
            ),
            SizedBox(height: 20),
            buildSectionTitle('Notifications'),
            buildSwitchTile(
              'pay Onz tips',
              'Get tips on getting the most out of pay Onz, made just for you',
              payOnezPayTips,
              (value) {
                setState(() {
                  payOnezPayTips = value;
                });
              },
            ),
            buildSwitchTile(
              'Friends\' activity',
              'Get alerts on what\'s new with your contacts & friends',
              friendsActivity,
              (value) {
                setState(() {
                  friendsActivity = value;
                });
              },
            ),
            buildSwitchTile(
              'Smart alerts',
              'Get notified of upcoming bills',
              smartAlerts,
              (value) {
                setState(() {
                  smartAlerts = value;
                });
              },
            ),
            buildSwitchTile(
              'Offers & rewards',
              'Find out when you earn new rewards, and stay up to date on offers',
              offersRewards,
              (value) {
                setState(() {
                  offersRewards = value;
                });
              },
            ),
            buildSwitchTile(
              'Transaction history & recommendations',
              'Get summaries and useful recommendations based on your pay Onz transaction history',
              transactionHistory,
              (value) {
                setState(() {
                  transactionHistory = value;
                });
              },
            ),
            buildSwitchTile(
              'Chat messages',
              'Get notified about incoming chat messages',
              chatMessages,
              (value) {
                setState(() {
                  chatMessages = value;
                });
              },
            ),
            buildSwitchTile(
              'Location based alerts',
              'Turn on background location to get timely reminders from stores around you',
              locationBasedAlerts,
              (value) {
                setState(() {
                  locationBasedAlerts = value;
                });
              },
            ),
            buildSwitchTile(
              'Order updates',
              'Get notified about updates to your orders',
              orderUpdates,
              (value) {
                setState(() {
                  orderUpdates = value;
                });
              },
            ),
            SizedBox(height: 20),
            buildSectionTitle('Emails'),
            buildSwitchTile(
              'pay Onz tips',
              'Receive personalised suggestions on how to get the most out of pay Onz',
              emailpayOnezTips,
              (value) {
                setState(() {
                  emailpayOnezTips = value;
                });
              },
            ),
            buildSwitchTile(
              'Offers & rewards',
              'Get notified of offers or rewards through emails',
              emailOffersRewards,
              (value) {
                setState(() {
                  emailOffersRewards = value;
                });
              },
            ),
            buildSwitchTile(
              'Transaction insights & recommendations',
              'Get notified of offers or rewards through emails',
              emailTransactionInsights,
              (value) {
                setState(() {
                  emailTransactionInsights = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildSwitchTile(
      String title, String subtitle, bool value, Function(bool) onChanged) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChanged,
      activeColor: AppColors.appPrimary,
    );
  }
}
