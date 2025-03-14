import 'package:flutter/material.dart';
import 'package:payonz/Core/Constants/app_colors.dart';

class BankGridItem extends StatelessWidget {
  final MyBank bank;
  final VoidCallback onTap;
  const BankGridItem({required this.bank, required this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon(bank.logo, size: 40, color: AppColors.card1),
          CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage(bank.logo),
          ),
          SizedBox(height: 8),
          Text(
            bank.name,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: Colors.black),
          ),
        ],
      ),
    );
  }
}

class MyBank {
  final String name;
  final String logo;

  MyBank({required this.name, required this.logo});
}
