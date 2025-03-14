import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:payonz/Core/Constants/app_colors.dart';
import 'package:payonz/Shared/widgets/appButton.dart';

class AddCreditAndDebitCard extends StatelessWidget {
  const AddCreditAndDebitCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: AppColors.appPrimary,
        foregroundColor: AppColors.white,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Container(
                          height: 250,
                          width: double.infinity,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Lottie.network(
                              'https://lottie.host/bd0e3eca-4185-46ce-8518-3bd1fcf9cfb0/lnmpnsBJRS.json'),

                          // child: CachedNetworkImage(
                          //   imageUrl:
                          //       'https://storage.googleapis.com/a1aa/image/Z7Y8FlHtImo42EGgn0fq_Bf5KTuMlBa0juZDFo9R6OY.jpg',
                          //   fit: BoxFit.cover,
                          //   height: 200,
                          //   width: double.infinity,
                          //   placeholder: (context, url) => Image.network(
                          //     url,
                          //     fit: BoxFit.cover,
                          //     height: 200,
                          //     width: double.infinity,
                          //     color: Colors.black.withOpacity(0.1),
                          //     colorBlendMode: BlendMode.darken,
                          //   ),
                          //   errorWidget: (context, url, error) =>
                          //       const Icon(Icons.error),
                          // ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Use your credit and debit cards to pay',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 16),
                        const PaymentOptionCard(
                          icon1: Icons.attach_money,
                          icon2: Icons.water_drop,
                          title: 'Pay bills on Pay Onz',
                          description:
                              'Pay electricity, broadband, and other bills',
                        ),
                        const PaymentOptionCard(
                          icon1: Icons.qr_code,
                          icon2: Icons.credit_card,
                          title: 'Scan Bharat QRs and pay',
                          description: 'Scan QRs and pay with your card',
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'You can use your cards for online and Bharat QR payments. To limit any access, contact your bank.',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Colors.grey[600],
                                  ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildPaymentLogo(
                                'https://storage.googleapis.com/a1aa/image/NJ_f_XcHcTO00bPQXvjYINRdpm-ekQega9QaKxyk6_8.jpg'),
                            buildPaymentLogo(
                                'https://storage.googleapis.com/a1aa/image/_s5ES786A_v1ibr4uB4fqpeWrbyUsJBodm1ulDpjr_s.jpg'),
                            buildPaymentLogo(
                                'https://storage.googleapis.com/a1aa/image/nkf8LVxtwnDhpcgfeSde142uYeGENP6iEDD5LsVVMXk.jpg'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(16.0),
                //   child: ElevatedButton(
                //     onPressed: () {},
                //     style: ElevatedButton.styleFrom(
                //       backgroundColor: AppColors.appPrimary,
                //       padding: const EdgeInsets.symmetric(vertical: 16),
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(8),
                //       ),
                //       minimumSize: const Size(double.infinity, 50),
                //     ),
                //     child: const Text(
                //       'Add card',
                //       style: TextStyle(fontSize: 16, color: Colors.white),
                //     ),
                //   ),
                // ),
                AppButton(label: "Add Card", onPressed: () {})
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPaymentLogo(String url) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Image.network(
        url,
        height: 30,
        width: 50, // Adjust width if necessary
        fit: BoxFit.contain,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return SizedBox(
            height: 30,
            width: 50,
            child: Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        (loadingProgress.expectedTotalBytes ?? 1)
                    : null,
                strokeWidth: 2,
              ),
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) =>
            const Icon(Icons.error, size: 30),
      ),
    );
  }
}

class PaymentOptionCard extends StatelessWidget {
  final IconData icon1;
  final IconData icon2;
  final String title;
  final String description;

  const PaymentOptionCard({
    super.key,
    required this.icon1,
    required this.icon2,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[200],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon1, color: AppColors.appPrimary, size: 30),
                const SizedBox(width: 8),
                Icon(icon2, color: AppColors.appPrimary, size: 30),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[600],
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
