import 'package:flutter/material.dart';
import 'package:payonz/Core/Constants/app_colors.dart';
import 'package:payonz/Shared/widgets/apptext.dart';

import 'bank_details.dart';
import 'bank_grid_view.dart';
import 'fetching_loadibg_screens.dart';

class BankSelectionScreen extends StatelessWidget {
  final List<MyBank> banks = [
    MyBank(name: 'State Bank of India', icon: Icons.account_balance),
    MyBank(name: 'Indian Bank', icon: Icons.account_balance_wallet),
    MyBank(name: 'Canara Bank', icon: Icons.account_balance),
    MyBank(name: 'Indian Overseas Bank', icon: Icons.account_balance_wallet),
    MyBank(name: 'HDFC Bank', icon: Icons.account_balance),
    MyBank(name: 'Karur Vysya Bank', icon: Icons.account_balance_wallet),
    MyBank(name: 'Union Bank Of India', icon: Icons.account_balance),
    MyBank(name: 'Kotak Mahindra Bank', icon: Icons.account_balance_wallet),
    MyBank(name: 'Axis Bank', icon: Icons.account_balance),
  ];

  final List<MyBank> allBanks = List.generate(
      10,
      (index) =>
          MyBank(name: 'Bank ${index + 1}', icon: Icons.account_balance));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: AppColors.card1,
        // backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Icon(Icons.help_outline),
        )],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleText(
              text: 'Add Bank Linked To',
            ),
            TitleText(
              text: '+91 9876543210',
            ),
            SizedBox(height: 8),
            Text('This is required to set up your UPI account',
                style: TextStyle(color: Colors.grey)),
            SizedBox(height: 8),
            Text('Use a different mobile number',
                style: TextStyle(color: AppColors.card1)),
            SizedBox(height: 16),
            TextField(
              style: TextStyle(color: AppColors.white),
              cursorColor: AppColors.background,
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.card1,
                hintText: 'Search By Bank Name',
                focusColor: AppColors.white,
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 16),
            TitleText(
              text: 'Popular Banks',
              color: AppColors.darkPrimaryColor,
              size: 18,
            ),
            SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: banks.length,
              itemBuilder: (context, index) {
                return BankGridItem(
                  bank: banks[index],
                  onTap: () {
                    // Show FetchingDetailsScreen first
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FetchingDetailsScreen(),
                      ),
                    );

                    // Delay for 2 seconds, then show AccountAddedSuccess screen
                    Future.delayed(const Duration(seconds: 2), () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AccountAddedSuccess(),
                        ),
                      );

                      // Delay for another 2 seconds, then navigate to BankDetailScreen
                      Future.delayed(const Duration(seconds: 2), () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                BankDetailScreen(bank: banks[index]),
                          ),
                        );
                      });
                    });
                  },
                );
              },
            ),
            SizedBox(height: 16),
            TitleText(
              text: 'All Banks',
              color: AppColors.darkPrimaryColor,
              size: 18,
            ),
            SizedBox(height: 8),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: banks.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 2,
                  margin: EdgeInsets.symmetric(vertical: 4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    leading: Icon(banks[index].icon, color: AppColors.card1),
                    title: Text(
                      banks[index].name,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios,
                        size: 16, color: Colors.grey),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              BankDetailScreen(bank: banks[index]),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
