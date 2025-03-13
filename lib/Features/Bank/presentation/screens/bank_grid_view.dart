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
          Icon(bank.icon, size: 40, color: AppColors.card1),
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
  final IconData icon;

  MyBank({required this.name, required this.icon});
}
