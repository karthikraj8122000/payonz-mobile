import 'package:flutter/material.dart';
import 'package:payonz/Core/Constants/app_colors.dart';
import 'package:payonz/Features/Home/presentation/providers/balance_provider.dart';
import 'package:provider/provider.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final balanceProvider = Provider.of<BalanceProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Last Updated Balance',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: Colors.red[50],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Image.asset(
                    '../assets/images/hdfc.png',
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                '₹${balanceProvider.balance.toStringAsFixed(0)}',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black
                ),
              ),
              const Spacer(),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.card1,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.refresh,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(
                Icons.check_circle,
                color: AppColors.card2,
                size: 16,
              ),
              const SizedBox(width: 4),
              const Text(
                'Primary',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.card2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}