import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:payonz/Core/Constants/app_colors.dart';
import 'package:payonz/Features/Bank/presentation/screens/pay-contacts.dart';
import 'package:payonz/Features/Bank/presentation/screens/pay-phonenumber.dart';
import 'package:payonz/Features/Home/data/models/quick_actions_model.dart';
import 'package:payonz/Features/QRPayment/presentation/screens/qrscanner.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final actions = [
      QuickAction(title: 'Scan &\nPay', icon: Icons.qr_code_scanner, backgroundColor: AppColors.card1.withOpacity(0.4), iconColor: AppColors.white),
      QuickAction(title: 'Pay\nContacts', icon: Icons.contact_page, backgroundColor: AppColors.card1.withOpacity(0.4), iconColor: AppColors.white),
      QuickAction(title: 'Phone\nNumber', icon: Icons.tag, backgroundColor: AppColors.card1.withOpacity(0.4), iconColor: AppColors.white),
      QuickAction(title: 'Bank\nTransfer', icon: Icons.account_balance, backgroundColor: AppColors.card1.withOpacity(0.4), iconColor: AppColors.white),
      QuickAction(title: 'Pay\nVirtual ID', icon: Icons.perm_identity, backgroundColor: AppColors.card1.withOpacity(0.4), iconColor: AppColors.white),
      QuickAction(title: 'Self\nTransfer', icon: Icons.directions_walk, backgroundColor: AppColors.card1.withOpacity(0.4), iconColor: AppColors.white),
      QuickAction(title: 'Electricity\nBills', icon: Icons.flash_on, backgroundColor: AppColors.card1.withOpacity(0.4), iconColor: AppColors.white),
      QuickAction(title: 'Mobile\nRecharge', icon: Icons.smartphone, backgroundColor: AppColors.card1.withOpacity(0.4), iconColor: AppColors.white),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = (constraints.maxWidth ~/ 100).clamp(2, 4);
        return Container(
          decoration: BoxDecoration(color: AppColors.card1.withOpacity(0.05)),
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: constraints.maxWidth / (crossAxisCount * 180),
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemCount: actions.length,
                itemBuilder: (context, index) {
                  return _buildActionItem(context,actions[index]);
                },
              ),
              _buildInviteBanner(),
            ],
          ),
        );
      },
    );
  }

  openRoutes(BuildContext context,String title){
    print(title);
    if(title == "Scan &\nPay"){
// GoRouter.of(context).push(QRScanner.routeName);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => QRScanner()));
    }if(title == "Pay\nContacts"){
        GoRouter.of(context).push(PayContacts.routeName);
    }if(title == "Phone\nNumber"){
      GoRouter.of(context).push(PayPhoneNumber.routeName);
    }else{
    }
  }

  Widget _buildActionItem(BuildContext context,QuickAction action) {
    var index = action.title;
    return GestureDetector(
      onTap: (){
        openRoutes(context,index);
      },
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(color: action.backgroundColor, shape: BoxShape.circle),
            child: Icon(action.icon, color: action.iconColor, size: 24),
          ),
          const SizedBox(height: 8),
          Text(
            action.title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildInviteBanner() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.card1.withOpacity(0.1),
        borderRadius: const BorderRadius.all(Radius.circular(50)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.card_giftcard, color: AppColors.card1, size: 20),
            const SizedBox(width: 8),
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(text: 'Invite friends and get ', style: TextStyle(color: AppColors.card1)),
                  TextSpan(text: '₹1,000', style: TextStyle(color: AppColors.card1, fontWeight: FontWeight.bold)),
                  TextSpan(text: ' reward →', style: TextStyle(color: AppColors.card1)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
