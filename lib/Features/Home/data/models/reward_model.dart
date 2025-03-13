
import 'package:flutter/cupertino.dart';

class RewardItem {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final int points;

  RewardItem({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.points,
  });
}