import 'package:flutter/material.dart';
import 'package:payonz/Core/Constants/app_colors.dart';
import '../../../../Core/theme/app_theme.dart';

class TransactionsPage extends StatelessWidget {
  static const String routeName = '/transaction';
  const TransactionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: AppColors.card1,
        elevation: 0,
        title: const Text(
          'Transactions',
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildFilterSection(context),
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    _buildDateSection(context, 'Today'),
                    _buildTransactionItem(
                      icon: Icons.shopping_bag_outlined,
                      color: AppColors.card1.withOpacity(0.5),
                      title: 'Shopping',
                      description: 'Amazon',
                      date: '12:30 PM',
                      amount: '- ₹1,250.00',
                      isDebit: true,
                    ),
                    _buildTransactionItem(
                      icon: Icons.fastfood_outlined,
                      color: AppColors.card1.withOpacity(0.5),
                      title: 'Food & Drinks',
                      description: 'Starbucks',
                      date: '10:15 AM',
                      amount: '- ₹450.00',
                      isDebit: true,
                    ),
                    _buildDateSection(context, 'Yesterday'),
                    _buildTransactionItem(
                      icon: Icons.medical_services_outlined,
                      color: AppColors.card1.withOpacity(0.5),
                      title: 'Medical',
                      description: 'Apollo Pharmacy',
                      date: '4:45 PM',
                      amount: '- ₹850.00',
                      isDebit: true,
                    ),
                    _buildTransactionItem(
                      icon: Icons.payments_outlined,
                      color: AppColors.card1.withOpacity(0.5),
                      title: 'Salary',
                      description: 'TechCorp Inc.',
                      date: '10:00 AM',
                      amount: '+ ₹45,000.00',
                      isDebit: false,
                    ),
                    _buildDateSection(context, 'Mar 9, 2025'),
                    _buildTransactionItem(
                      icon: Icons.sports_esports,
                      color: AppColors.card1.withOpacity(0.5),
                      title: 'Entertainment',
                      description: 'Netflix',
                      date: '8:30 PM',
                      amount: '- ₹499.00',
                      isDebit: true,
                    ),
                    _buildTransactionItem(
                      icon: Icons.electric_bolt,
                      color:AppColors.card1.withOpacity(0.5),
                      title: 'Electricity Bill',
                      description: 'State Power Ltd',
                      date: '3:15 PM',
                      amount: '- ₹1,850.00',
                      isDebit: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterSection(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              cursorColor: AppColors.card1,
              decoration: InputDecoration(
                hintText: "Search transactions",
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: AppColors.card1.withOpacity(0.1),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.transparent), // Define border color
                  borderRadius: BorderRadius.all(
                      Radius.circular(10)), // No border radius
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: AppColors.card1), // Border color on focus
                  borderRadius: BorderRadius.all(
                      Radius.circular(10)), // No border radius
                ),
              ),
            ),
          ),
          SizedBox(width: 5,),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 10),
            decoration: BoxDecoration(
              color: AppColors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.filter_list,
              color: AppColors.grey.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateSection(BuildContext context, String date) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Text(
            date,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Container(
              height: 1,
              color: Colors.grey.withOpacity(0.3),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionItem({
    required IconData icon,
    required Color color,
    required String title,
    required String description,
    required String date,
    required String amount,
    required bool isDebit,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: color,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  color: isDebit ? AppColors.mintGreen : AppColors.card2,
                ),
              ),
              Text(
                date,
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
