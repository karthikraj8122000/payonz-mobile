import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';


import '../../Core/Constants/app_colors.dart';
import '../widgets/apptext.dart';

class NetworkErrorScreen extends StatefulWidget {
  static const String routeName = '/network_error_screen';

  const NetworkErrorScreen({super.key});

  @override
  State<NetworkErrorScreen> createState() => _NetworkErrorScreenState();
}

class _NetworkErrorScreenState extends State<NetworkErrorScreen> {
  bool isAlert = false;
  bool isConnected = false;
  dynamic internetConnectionChecker;
  Future<void> _checkConnectionAndRetry() async {
     internetConnectionChecker = await InternetConnectionChecker.createInstance();

    if (isConnected) {
      if (mounted) {
        Navigator.pop(context); // Go back if the connection is restored
      }

    } else {
      setState(() {
        isAlert = true;
      });
    }
    return await internetConnectionChecker.hasConnection;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/svg/error2.svg',
                  height: 150,
                  width: 150,
                  fit: BoxFit.contain,
                ),
                const AppText(
                  text: "Whoops !",
                  fontSize: 18,
                  color: AppColors.card1,
                ),
                const SizedBox(height: 15),
                const AppText(
                  textAlign: TextAlign.center,
                  text:
                      "Please check your network connection.",
                  fontSize: 14,
                  color: AppColors.card1,
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
