import 'package:flutter/material.dart';
import 'package:payonz/Core/Constants/app_colors.dart';

class HelpAndFeedback extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.appPrimary,
        foregroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Help & Feedback',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Icon(Icons.help, color: AppColors.appPrimary),
              title: Text('Get Help', style: TextStyle(fontSize: 18)),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.feedback, color: AppColors.appPrimary),
              title: Text('Send Feedback', style: TextStyle(fontSize: 18)),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.description, color: AppColors.appPrimary),
              title: Text('Raise BBPS Dispute', style: TextStyle(fontSize: 18)),
              onTap: () {},
            ),
            // ListTile(
            //   leading: Icon(Icons.info, color: Colors.grey),
            //   title: Text('Version 269.1.3 (arm64-v8a_release_flutter)',
            //       style: TextStyle(fontSize: 18)),
            // ),
          ],
        ),
      ),
    );
  }
}
