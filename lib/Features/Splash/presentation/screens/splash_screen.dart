import 'dart:async';

import 'package:go_router/go_router.dart';
import 'package:payonz/Core/Constants/app_colors.dart';
import 'package:payonz/Core/theme/app_theme.dart';
import 'package:payonz/Features/Auth/presentation/screens/signin_screen.dart';
import 'package:flutter/material.dart';

import '../../../Auth/presentation/screens/sim_selection.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/splash';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
    Timer(const Duration(seconds: 5), goToPage);
  }

  goToPage() async {
    GoRouter.of(context).push(SimSelection.routeName);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
             AppColors.card1.withOpacity(0.8),
              AppColors.card1.withOpacity(0.6),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/payonz-logo.png",width: 100,height: 100,),
            ],
          ),
        ),
      ),
    );
  }
}