import 'package:flutter/material.dart';
import 'package:payonz/Core/Constants/app_colors.dart';
import 'package:payonz/Shared/widgets/apptext.dart';

import 'bank_details.dart';
import 'bank_grid_view.dart';
import 'fetching_loadibg_screens.dart';

class BankSelectionScreen extends StatelessWidget {
  final List<MyBank> banks = [
    MyBank(
      name: 'State Bank of India',
      logo: 'assets/images/sbi.png',
    ),
    MyBank(
      name: 'Indian Bank',
      logo: 'assets/images/indianbank.png',
    ),
    MyBank(
      name: 'Canara Bank',
      logo: 'assets/images/canara.png',
    ),
    MyBank(
      name: 'Indian Overseas Bank',
      logo: 'assets/images/iob.png',
    ),
    MyBank(
      name: 'HDFC Bank',
      logo: 'assets/images/hdfc.png',
    ),
    MyBank(
      name: 'Karur Vysya Bank',
      logo: 'assets/images/kvb.jpeg',
    ),
    MyBank(
      name: 'Union Bank Of India',
      logo: 'assets/images/union.png',
    ),
    MyBank(
      name: 'Kotak Mahindra Bank',
      logo: 'assets/images/kotak.png',
    ),
    MyBank(
      name: 'Axis Bank',
      logo: 'assets/images/axis.png',
    ),
  ];

  final List<MyBank> allBanks = List.generate(
      10,
      (index) => MyBank(
            name: 'Bank ${index + 1}',
            logo: 'https://example.com/bank${index + 1}_logo.png',
          ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: AppColors.card1,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(Icons.help_outline),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleText(text: 'Add Bank Linked To'),
            TitleText(text: '+91 9876543210'),
            SizedBox(height: 8),
            Text('This is required to set up your UPI account',
                style: TextStyle(color: Colors.grey)),
            SizedBox(height: 8),
            Text('Use a different mobile number',
                style: TextStyle(color: AppColors.card1)),
            SizedBox(height: 16),
            TextField(
              style: TextStyle(color: AppColors.black),
              cursorColor: AppColors.card1,
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.borderLight,
                hintText: 'Search By Bank Name',
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.card1))
              ),
            ),
            SizedBox(height: 16),
            TitleText(
                text: 'Popular Banks',
                color: AppColors.darkPrimaryColor,
                size: 18),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FetchingDetailsScreen(),
                      ),
                    );
                    Future.delayed(const Duration(seconds: 2), () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AccountAddedSuccess(),
                        ),
                      );
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
                text: 'All Banks', color: AppColors.darkPrimaryColor, size: 18),
            SizedBox(height: 8),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: banks.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 1,
                  margin: EdgeInsets.symmetric(vertical: 4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    leading: 
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage:AssetImage(banks[index].logo)
                    ),
                    // Image.network(
                    //   banks[index].logo,
                    //   width: 40,
                    //   height: 40,
                    //   fit: BoxFit.cover,
                    // ),
                    title: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        banks[index].name,
                        style:
                            TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
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
