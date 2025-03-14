import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:payonz/Core/Constants/app_colors.dart';
import 'package:payonz/Features/Bank/presentation/screens/fetching_loadibg_screens.dart';
import 'package:payonz/Shared/widgets/appButton.dart';

import 'bank_selection_screen.dart';

class BankAccountsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: AppColors.card1,
        title: Text('Bank Accounts'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(Icons.help_outline),
          ),
        ],
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            // color: Colors.grey[850],
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Image.network(
              //   'https://storage.googleapis.com/a1aa/image/39mALA_k7GfA1baxgDKAKT9qDA8nsa429gWsnXvOlyM.jpg',
              //   height: 150,
              //   width: 150,
              // ),
              GestureDetector(
                onTap: () {},
                child: Container(
                    height: 150,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15)),
                    child: Lottie.network(
                        'https://lottie.host/29e5b304-3162-4fb6-b46e-58ef663e01c0/w39ODf7PrV.json',
                        repeat: false)),
              ),
              SizedBox(height: 16.0),
              Text(
                'No bank accounts linked yet',
                style: TextStyle(color: Colors.grey[400]),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.card1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BankSelectionScreen()));
                },
                child: Text('Add New Bank Account'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
