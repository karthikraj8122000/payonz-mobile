import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:payonz/Shared/widgets/apptext.dart';

class FetchingDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFF1A1A2E),
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image.network(
                  //   'https://storage.googleapis.com/a1aa/image/Ius1O0-Et5WoIriykw9s8eLwFq7eP_WluOmm-86mGX0.jpg',
                  //   height: 100,
                  //   width: 100,
                  // ),
                  Lottie.network(
                      'https://lottie.host/3557f1ea-f20e-492c-899f-8c04ebc7d846/c2fO8q5EhS.json'),
                  SizedBox(height: 20),
                  TitleText(
                    text: 'Fetching your account details',
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Center(
                child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtj1QNHzC6AVkGEEf1UoX2yVRkhM3w9nsA5w&s',
                  height: 50,
                  width: 150,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AccountAddedSuccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFF1A1A2E),
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.network(
                      repeat: false,
                      'https://lottie.host/b47b1d97-3136-4d5f-987f-d9cbfe8e5995/27k4GgqbPJ.json'),
                  SizedBox(height: 20),
                  TitleText(
                    text: 'Account Added Successfully!',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
