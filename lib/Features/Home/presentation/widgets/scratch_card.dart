import 'package:flutter/material.dart';
import 'package:scratcher/scratcher.dart';

import '../../../../Core/Constants/app_colors.dart';

class ScratchCardGrid extends StatelessWidget {
  final List<String> scratchCardImages = [
    'assets/images/delivery.jpeg',
    'assets/images/coupon.jpeg',
    'assets/images/cashback.jpeg',
    'assets/images/cashback.jpeg',
  ];

  // List of prize data (image and name)
  final List<Map<String, dynamic>> prizeData = [
    {
      'prizeImage': 'assets/images/prize.png',
      'description': 'cashback at zomato',
      'value': '₹300',
    },
    {
      'prizeImage': 'assets/images/prize.png',
      'description': 'BT-calling smartwatch om MRP',
      'value': 'Flat 75% off',
    },
    {
      'prizeImage': 'assets/images/prize.png',
      'description': 'cashback on mobile recharge',
      'value': '₹3 - ₹30',
    },
    {
      'prizeImage': 'assets/images/prize.png',
      'description': 'cashback on next electricity bill',
      'value': '₹5 - ₹50',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = (constraints.maxWidth ~/ 100).clamp(2, 4);
        return Container(
          decoration: BoxDecoration(color: Colors.grey.shade100),
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.9, // Adjust this to reduce height
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemCount: scratchCardImages.length,
                itemBuilder: (context, index) {
                  return Scratcher(
                    brushSize: 40,
                    threshold: 50,
                    image: Image.asset(
                      scratchCardImages[index],
                      fit: BoxFit.cover,
                    ),
                    onChange: (value) {
                      print("Scratch progress: $value%");
                    },
                    onThreshold: () {
                      print("Threshold reached, you won on card ${index + 1}!");
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.orange.shade100,
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: AssetImage(prizeData[index]['prizeImage']),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                              bottom: 12,
                              right: 0,
                              left: 0,
                              child: Column(
                                children: [
                                  Text(
                                    prizeData[index]['value'],
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      maxLines: 2,
                                      textAlign: TextAlign.center,
                                      prizeData[index]['description'],
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ))
                        ],
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 20,),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.black, width: 1),
                ),
                child: IntrinsicWidth(
                  child:Text(
                    "More rewards",
                    style: TextStyle(color: AppColors.card1, fontSize: 14),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
