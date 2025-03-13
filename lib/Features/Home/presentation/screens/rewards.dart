import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:payonz/Features/Home/presentation/widgets/scratch_card.dart';
import 'package:payonz/Shared/widgets/apptext.dart';
import 'package:scratcher/widgets.dart';

import '../../../../Core/Constants/app_colors.dart';
import '../../data/models/reward_model.dart';


class RewardScreen extends StatefulWidget {
  static const String routeName = '/rewards';
  const RewardScreen({Key? key}) : super(key: key);

  @override
  _RewardScreenState createState() => _RewardScreenState();
}
class _RewardScreenState extends State<RewardScreen> {
  final List<String> scratchCardImages = [
    'assets/images/scratchBanner.png',
    'assets/images/scratchBanner.png',
    'assets/images/scratchBanner.png',
    'assets/images/scratchBanner.png',
    'assets/images/scratchBanner.png',
  ];

  // List of prize images
  final List<String> prizeImages = [
    'assets/images/prize.png',
    'assets/images/prize.png',
    'assets/images/prize.png',
    'assets/images/prize.png',
    'assets/images/prize.png',
  ];

  int _totalPoints = 1250;
  bool _isRewardSelected = false;
  RewardItem? _selectedReward;

  void _selectReward(RewardItem reward) {
    if (_totalPoints >= reward.points) {
      setState(() {
        _isRewardSelected = true;
        _selectedReward = reward;
        _totalPoints -= reward.points;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(title: Text("Rewards"),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildPointsCard(),
                  SizedBox(height: 20,),
                  HeadingText(text: "Your Rewards",color: Colors.black,),
                ],
              ),
            ),

            ScratchCardGrid()
          ],
        ),
      ),
    );
  }
  Widget _buildPointsCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.card1,AppColors.card1],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6C5CE7).withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Your Points",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),
              _buildMembershipBadge(),
            ],
          ),
          const SizedBox(height: 20),
          _buildPointsDisplay(),
          const SizedBox(height: 20),
          _buildProgressBar(),
        ],
      ),
    );
  }
  Widget _buildMembershipBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Row(
        children: [
          Icon(Icons.star, color: Colors.amber, size: 16),
          SizedBox(width: 4),
          Text(
            "Gold Member",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPointsDisplay() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "$_totalPoints",
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 8),
        const Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: Text(
            "points",
            style: TextStyle(
              fontSize: 16,
              color: Colors.white70,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProgressBar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: const LinearProgressIndicator(
            value: 0.7,
            backgroundColor: Colors.white24,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            minHeight: 8,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "750 more points to reach Platinum",
          style: TextStyle(
            fontSize: 14,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }

}