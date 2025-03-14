import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scratcher/scratcher.dart';

import '../../../../Core/Constants/app_colors.dart';

class ScratchCardGrid extends StatefulWidget {
  @override
  State<ScratchCardGrid> createState() => _ScratchCardGridState();
}

class _ScratchCardGridState extends State<ScratchCardGrid> {
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

  final List<GlobalKey<ScratcherState>> scratcherKeys = [];
  // Create a list to track if each card has been auto-revealed
  final List<bool> autoRevealedCards = [];

  @override
  void initState() {
    super.initState();
    // Initialize keys and auto-reveal tracker for each card
    for (int i = 0; i < scratchCardImages.length; i++) {
      scratcherKeys.add(GlobalKey<ScratcherState>());
      autoRevealedCards.add(false);
    }
  }

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
                    key: scratcherKeys[index], // Assign the key for this specific card
                    brushSize: 40,
                    threshold: 50,
                    accuracy: ScratchAccuracy.medium,
                    image: Image.asset(
                      scratchCardImages[index],
                      fit: BoxFit.cover,
                    ),
                    onChange: (value) {
                      print("Scratch progress: $value%");
                      if (value >= 50 && !autoRevealedCards[index]) {
                        setState(() {
                          autoRevealedCards[index] = true;
                        });
                        // Trigger auto-reveal for this specific card
                        scratcherKeys[index].currentState?.reveal(duration: Duration(milliseconds: 500));
                      }
                    },
                    onThreshold: () {
                      print("Threshold reached, you won on card ${index + 1}!");
                      _showRewardDialog(context, prizeData[index]);
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
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 20,),
              OutlinedButton(
                onPressed: () {
                },
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

  void _showRewardDialog(BuildContext context, Map<String, dynamic> prizeData) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Congratulations!'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWeGAFBJW2mfT9G3RObMsYSULE01VwO-WHmg&s",
                height: 100,
                width: 100,
              ),
              SizedBox(height: 16),
              Text('You won: ${prizeData['value']}'),
              Text(prizeData['description']),
            ],
          ),
          actions: [
            Align(
              alignment: Alignment.center,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.black, width: 1),
                ),
                child: IntrinsicWidth(
                  child:Text(
                    "Claim",
                    style: TextStyle(color: AppColors.card1, fontSize: 14),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}