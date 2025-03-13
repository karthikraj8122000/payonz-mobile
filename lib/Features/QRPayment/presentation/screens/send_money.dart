import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:payonz/Core/Constants/app_colors.dart';
import 'package:payonz/Features/Home/presentation/widgets/contact_list.dart';
import 'package:payonz/Features/QRPayment/presentation/screens/payment_success.dart';
import 'package:payonz/Shared/widgets/apptext.dart';

class SendMoney extends StatefulWidget {
  final String fromScreen;
  static const String routeName = '/sendmoney';
  final String recipientName;
  final String data;
  final String? name;
  final String? phone;
  final String? profilePic;

  const SendMoney(
      {super.key,
      required this.fromScreen,
      required this.recipientName,
      required this.data,
      this.name,
      this.phone,
      this.profilePic});

  @override
  State<SendMoney> createState() => _SendMoneyState();
}

class _SendMoneyState extends State<SendMoney> {
  final TextEditingController _amountController = TextEditingController();
  final ValueNotifier<bool> _isSwiped = ValueNotifier(false);
  final ValueNotifier<String?> _errorMessage = ValueNotifier(null);

  @override
  void dispose() {
    _amountController.dispose();
    _isSwiped.dispose();
    _errorMessage.dispose();
    super.dispose();
  }

  void _validateAndPay(BuildContext context) {
    if (_amountController.text.isEmpty) {
      _errorMessage.value = "Please enter amount";
      return;
    }

    try {
      final amount = double.parse(_amountController.text);
      if (amount <= 0) {
        _errorMessage.value = "Please enter a valid amount";
        return;
      }

      _errorMessage.value = null;
      _isSwiped.value = true;

      Future.delayed(const Duration(seconds: 1), () {
        _isSwiped.value = false;
        if (context.mounted) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PaymentSuccessScreen(
                amount: _amountController.text,
                recipientName: widget.recipientName,
                name: widget.name ?? 'Unknown',
                phone: widget.phone ?? "+91 8378239393",
              ),
            ),
          );
        }
      });
    } catch (e) {
      _errorMessage.value = "Please enter a valid amount";
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    Color randomColor =
        Colors.primaries[Random().nextInt(Colors.primaries.length)];

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05,
                vertical: screenHeight * 0.02,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (widget.fromScreen == "scanner") ContactList(),
                  if (widget.fromScreen == "person") Container(),
                  SizedBox(height: screenHeight * 0.03),
                  // Centered Recipient Details
                  Center(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: screenWidth * 0.12,
                          backgroundColor:
                              randomColor, // Random background color
                          backgroundImage: (widget.profilePic != null &&
                                  widget.profilePic!.isNotEmpty)
                              ? NetworkImage(widget.profilePic!)
                              : null, // Show image if available
                          child: (widget.profilePic == null ||
                                  widget.profilePic!.isEmpty)
                              ? Text(
                                  widget.name![0]
                                      .toUpperCase(), // Show first letter
                                  style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )
                              : null, // No child when image exists
                        ),
                        SizedBox(height: screenHeight * 0.015),
                        TitleText(
                          text: "${widget.name}",
                        ),
                        SubtitleText(
                          text: "+91 ${widget.phone}",
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),
                  // Amount Input
                  Center(
                    child: Column(
                      children: [
                        const Text("Enter Amount",
                            style: TextStyle(fontSize: 18, color: Colors.grey)),
                        SizedBox(height: 15),
                        TextField(
                          controller: _amountController,
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: screenWidth * 0.1,
                            fontWeight: FontWeight.bold,
                          ),
                          cursorColor: AppColors.card1,
                          decoration: InputDecoration(
                              hintText: "₹0",
                              hintStyle: TextStyle(
                                fontSize: screenWidth * 0.1,
                                color: Colors.grey.shade400,
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.card1))),
                          onChanged: (_) => _errorMessage.value = null,
                        ),

                        // Error message
                        ValueListenableBuilder<String?>(
                          valueListenable: _errorMessage,
                          builder: (context, errorMessage, _) =>
                              errorMessage != null
                                  ? Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: Text(
                                        errorMessage,
                                        style: const TextStyle(
                                          color: Colors.red,
                                          fontSize: 14,
                                        ),
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.05),

                  // Swipe Button
                  SwipeButton(
                    thumb: const Icon(Icons.arrow_forward_ios,
                        color: Colors.white),
                    activeThumbColor: AppColors.card1,
                    activeTrackColor: Colors.blue.shade50,
                    onSwipe: () => _validateAndPay(context),
                    child: ValueListenableBuilder<bool>(
                      valueListenable: _isSwiped,
                      builder: (context, isSwiped, _) {
                        return Text(
                          isSwiped ? "Processing..." : "Swipe to Pay",
                          style: TextStyle(
                            fontSize: 18,
                            color: AppColors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.03),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
