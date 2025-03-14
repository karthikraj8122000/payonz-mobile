import 'package:flutter/material.dart';
import 'package:payonz/Core/Constants/app_colors.dart';
import 'package:payonz/Shared/widgets/apptext.dart';
import 'package:payonz/appButton.dart';

class MyRegisteredCardsDetails extends StatelessWidget {
  final String accountName;
  final String logo;
  final String? status;

  const MyRegisteredCardsDetails(
      {super.key, required this.accountName, required this.logo, this.status});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.card1,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(Icons.help_outline),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TitleText(
                        text: 'All Set for UPI Payments',
                      ),
                      SizedBox(height: 8),
                      SubtitleText(
                        text:
                            'You can send and receive money with this bank account',
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 24),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.transparent,
                            backgroundImage: AssetImage(logo),
                            radius: 24,
                          ),
                          SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ParagraphText(
                                text: accountName,
                              ),
                              SubtitleText(
                                text: 'Saving Account',
                              ),
                              SubtitleText(
                                text: 'Karthik',
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 24),
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.appPrimary,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Set UPI PIN',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none,
                                ),
                                style: TextStyle(color: AppColors.appPrimary),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Reset PIN',
                                style: TextStyle(color: AppColors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 24),
                      Image.network(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtj1QNHzC6AVkGEEf1UoX2yVRkhM3w9nsA5w&s',
                        height: 50,
                      ),
                    
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.card1,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.check_box, color: Colors.green),
                        SizedBox(width: 8),
                        TitleText(
                          text: 'Receive money easily from any UPI app',
                          size: 14,
                          color: AppColors.white,
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    SubtitleText(
                      text:
                          'Your number 98765432111 is currently linked to another UPI app with abcdefg-1@oksbi. Switch to PhonePe now & receive money to this account.',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              AppButton(
                label: 'Send ₹1 to a friend',
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Colors.white,
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
