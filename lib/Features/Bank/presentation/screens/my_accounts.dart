import 'package:flutter/material.dart';
import 'package:payonz/Core/Constants/app_colors.dart';
import 'package:payonz/Features/Bank/presentation/screens/my_cards_details.dart';
import 'package:payonz/appButton.dart';
import 'bank_selection_screen.dart';

class MyAccounts extends StatelessWidget {
  final List<Map<String, String>> bankAccounts = [
    {
      'name': 'Axis Bank',
      'logo': 'assets/images/axis.png',
      'status': 'Primary',
    },
    {
      'name': 'State Bank',
      'logo': 'assets/images/sbi.png',
    },
    {
      'name': 'Indian Overseas',
      'logo': 'assets/images/iob.png',
    },
  ];

  void _viewAccountDetails(BuildContext context, Map<String, String> account) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MyRegisteredCardsDetails(
          accountName: account['name']!,
          logo: account['logo']!,
          status: account.containsKey('status') ? account['status'] : null,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Bank Accounts'),
        actions: [
          IconButton(
            icon: Icon(Icons.help_outline, color: Colors.white),
            onPressed: () {},
          ),
        ],
        backgroundColor: AppColors.card1,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: bankAccounts.length,
              itemBuilder: (context, index) {
                final account = bankAccounts[index];
                return Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: EdgeInsets.only(bottom: 16),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(16),
                    leading: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage(account['logo']!),
                      radius: 28,
                    ),
                    title: Text(
                      account['name']!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    subtitle: account.containsKey('status')
                        ? Text(
                            account['status']!,
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : null,
                    trailing: Icon(
                      Icons.chevron_right,
                      color: AppColors.border,
                    ),
                    onTap: () => _viewAccountDetails(context, account),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: AppButton(
              label: "Add New Bank Account",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BankSelectionScreen(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
