import 'package:flutter/material.dart';
import 'package:payonz/Core/Constants/app_colors.dart';

class BankSelectionScreen extends StatelessWidget {
  final List banks = [
    Bank(name: 'State Bank of India', imageUrl: 'assets/sbi.png'),
    Bank(name: 'Indian Bank', imageUrl: 'assets/indian_bank.png'),
    Bank(name: 'Canara Bank', imageUrl: 'assets/canara_bank.png'),
    Bank(name: 'Indian Overseas Bank', imageUrl: 'assets/iob.png'),
    Bank(name: 'HDFC Bank', imageUrl: 'assets/hdfc.png'),
    Bank(name: 'Karur Vysya Bank', imageUrl: 'assets/kvb.png'),
    Bank(name: 'Union Bank Of India', imageUrl: 'assets/union_bank.png'),
    Bank(name: 'Kotak Mahindra Bank', imageUrl: 'assets/kotak.png'),
    Bank(name: 'Axis Bank', imageUrl: 'assets/axis.png'),
  ];

  final List allBanks = List.generate(
      10,
      (index) => Bank(
          name: 'Bank ${index + 1}', imageUrl: 'assets/bank_placeholder.png'));

  BankSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color(0xFF1c0f2e),
        elevation: 0,
        leading: Icon(Icons.close),
        actions: [Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Icon(Icons.help_outline),
        )],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add Bank Linked To',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              '+91 6383864180',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'This is required to set up your UPI account',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 8),
            Text(
              'Use a different mobile number',
              style: TextStyle(color: Colors.purple),
            ),
            SizedBox(height: 16),
            TextField(
              style: TextStyle(color: AppColors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFF2a1b3d),
                hintText: 'Search By Bank Name',
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Popular Banks',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            BankDetailScreen(bank: banks[index]),
                      ),
                    );
                  },
                );
              },
            ),
            SizedBox(height: 16),
            Text(
              'All Banks',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: allBanks.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 2,
                  margin: EdgeInsets.symmetric(vertical: 4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    leading: Image.asset(
                      allBanks[index].imageUrl,
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                    title: Text(
                      allBanks[index].name,
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
                              BankDetailScreen(bank: allBanks[index]),
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

class BankGridItem extends StatelessWidget {
  final Bank bank;
  final VoidCallback onTap;
  const BankGridItem({required this.bank, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            bank.imageUrl,
            width: 40,
            height: 40,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 8),
          Text(
            bank.name,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class BankDetailScreen extends StatelessWidget {
  final Bank bank;
  const BankDetailScreen({required this.bank});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(bank.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              bank.imageUrl,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(
              bank.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class Bank {
  final String name;
  final String imageUrl;
  Bank({required this.name, required this.imageUrl});
}
