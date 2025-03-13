import 'package:go_router/go_router.dart';
import 'package:payonz/Config/app_routes.dart';
import 'package:payonz/Features/Bank/presentation/screens/add_bank_account.dart';
import 'package:flutter/material.dart';
import 'package:payonz/Features/Home/presentation/screens/dashboard.dart';
import 'package:payonz/appButton.dart';
import 'package:provider/provider.dart';
import '../../../../Core/Constants/app_colors.dart';
import '../../../../Core/theme/app_theme.dart';
import '../providers/bank_provider.dart';

class BankAccountsScreen extends StatelessWidget {
  static const String routeName = '/bank-account';
  const BankAccountsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bankProvider = Provider.of<BankProvider>(context);
    final banks = bankProvider.banks;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Bank Accounts ',
          style:
              TextStyle(color: AppTheme.textColor, fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(
            onPressed: () {
              GoRouter.of(context).push(DashboardPage.routeName);
              // AppRouter.navigateToHomeView();
            },
            child: const Text(
              'Skip',
              style: TextStyle(color: AppColors.card1),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Text(
                'We\'ve found ${banks.length} Bank Accounts belongs to you',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 24),
              Expanded(
                child: ListView.builder(
                  itemCount: banks.length,
                  itemBuilder: (context, index) {
                    final bank = banks[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        leading: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: getBankIcon(bank.name),
                        ),
                        title: Text(
                          bank.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(bank.accountNumber),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const AddBankScreen()),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: AppTheme.primaryColor,
                          width: 1,
                        ),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.add,
                            color: AppTheme.primaryColor,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Add New',
                            style: TextStyle(
                              color: AppTheme.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     GoRouter.of(context).push(DashboardPage.routeName);
              //   },
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: AppColors.card1,
              //     foregroundColor: Colors.white,
              //     minimumSize: const Size(double.infinity, 55),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(50),
              //     ),
              //   ),
              //   child: const Text(
              //     "Continue",
              //     style: TextStyle(fontSize: 18),
              //   ),
              // ),
              AppButton(
                  label: "Continue",
                  onPressed: () {
                    GoRouter.of(context).push(DashboardPage.routeName);
                  })
            ],
          ),
        ),
      ),
    );
  }

  Widget getBankIcon(String bankName) {
    Color iconColor;
    String iconData;

    switch (bankName) {
      case 'HDFC Bank':
        iconColor = Colors.red;
        iconData = "assets/images/hdfc.png";
        break;
      case 'Axis Bank':
        iconColor = Colors.purple;
        iconData = "assets/images/axis.png";
        break;
      case 'Union Bank':
        iconColor = Colors.blue;
        iconData = "assets/images/hdfc.png";
        break;
      case 'Deutsche Bank':
        iconColor = Colors.indigo;
        iconData = "assets/images/hdfc.png";
        break;
      default:
        iconColor = Colors.grey;
        iconData = "assets/images/hdfc.png";
    }

    return Image.asset(iconData);
  }
}
