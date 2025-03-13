import 'package:flutter/material.dart';
import 'package:payonz/Core/Constants/app_colors.dart';
import 'package:payonz/appButton.dart';

import 'bank_selection_screen.dart';

class MyAccounts extends StatelessWidget {
  final List<Map<String, String>> bankAccounts = [
    {
      'name': 'Axis Bank ',
      'logo':
          'https://storage.googleapis.com/a1aa/image/ZHGln02CJzFV7rBxgvmnpN8wkGD4WqNqAoTdS1H5IkE.jpg',
      'status': 'Primary',
    },
    {
      'name': 'State Bank',
      'logo':
          'https://storage.googleapis.com/a1aa/image/BSWEoKn8y7Ttcx_WPHo39-KHvZlVQurrs1lwiJn5veM.jpg',
    },
    {
      'name': 'Indian Overseas',
      'logo':
          'https://storage.googleapis.com/a1aa/image/PszEfBQFF0nrNcgl70g3_rN5UmGkPSp-iUqX6uJ9Feo.jpg',
    },
  ];

  void _viewAccountDetails(BuildContext context, String accountName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Viewing details for $accountName')),
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
          backgroundColor: AppColors.card1),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: bankAccounts.length,
              itemBuilder: (context, index) {
                final account = bankAccounts[index];
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(account['logo']!),
                        ),
                        title: Text(
                          account['name']!,
                          style: TextStyle(color: Colors.black),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (account.containsKey('status'))
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  account['status']!,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ),
                            Icon(Icons.chevron_right, color: AppColors.border),
                          ],
                        ),
                        onTap: () =>
                            _viewAccountDetails(context, account['name']!),
                      ),
                    ),
                    if (index < bankAccounts.length - 1)
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Divider(color: AppColors.border),
                      ),
                  ],
                );
              },
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(16.0),
          //   child: ElevatedButton(
          //     style: ElevatedButton.styleFrom(
          //       backgroundColor: AppColors.card1,
          //       padding: EdgeInsets.symmetric(vertical: 16),
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(8),
          //       ),
          //     ),
          //     onPressed: () {
          //       // ScaffoldMessenger.of(context).showSnackBar(
          //       //   SnackBar(content: Text('Add New Bank Account')),
          //       // );

          //       Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //               builder: (context) => BankSelectionScreen()));
          //     },
          //     child: Center(
          //       child: Text(
          //         'Add New Bank Account',
          //         style: TextStyle(color: Colors.white),
          //       ),
          //     ),
          //   ),
          // ),

          AppButton(
              label: "Add New Bank Account",
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BankSelectionScreen()));
              })
        ],
      ),
    );
  }
}
