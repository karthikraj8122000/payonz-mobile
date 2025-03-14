// Success Screen
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:payonz/Core/Constants/app_colors.dart';
import 'package:payonz/Features/Home/presentation/screens/dashboard.dart';
import 'package:payonz/Shared/widgets/appButton.dart';

class PaymentSuccessScreen extends StatefulWidget {
  final String amount;
  final String recipientName;
  final String name;
  final String phone;

  const PaymentSuccessScreen({
    Key? key,
    required this.amount,
    required this.recipientName,
    required this.name,
    required this.phone,
  }) : super(key: key);

  @override
  State<PaymentSuccessScreen> createState() => _PaymentSuccessScreenState();
}

class _PaymentSuccessScreenState extends State<PaymentSuccessScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {
                    // Navigator.popUntil(
                    //   context,
                    //   (route) => route.isFirst,
                    // );
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close),
                ),
              ),

              const Spacer(flex: 1),
              Container(
                height: 200,
                child: Center(
                  child: Lottie.network(
                      repeat: false,
                      'https://lottie.host/bb2b29b4-d574-4759-80d3-8d21e574aaef/B4xGlTXlDj.json'),
                ),
              ),

              const SizedBox(height: 30),

              // Amount
              Text(
                "₹${widget.amount.isEmpty ? "0" : widget.amount}",
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Payment Successful!",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

              // Recipient Details
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: AppColors.white,
                      child: const Icon(Icons.person,
                          size: 25, color: AppColors.card1),
                    ),
                    const SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "+91 ${widget.phone}",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const Spacer(flex: 1),

              // Date and Transaction ID
              Text(
                "Today, ${TimeOfDay.now().format(context)}",
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 5),
              Text(
                "Transaction ID: PAY${DateTime.now().millisecondsSinceEpoch.toString().substring(5, 13)}",
                style: const TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 30),

              // Done Button
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.popUntil(
              //       context,
              //       (route) => route.isFirst,
              //     );
              //     // Navigator.pop(context);
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
              //     "Done",
              //     style: TextStyle(fontSize: 18),
              //   ),
              // ),
              AppButton(
                  label: "Done",
                  onPressed: () {
                    GoRouter.of(context).push(DashboardPage.routeName);
                  }),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
