import 'package:flutter/material.dart';
import 'package:payonz/Core/Constants/app_colors.dart';

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color color;
  final Color backgroundColor;
  final double height;
  final double borderRadius;
  final double paddingVertical;
  final double fontSize;

  const AppButton({
    super.key,
    this.height = 50,
    this.borderRadius = 24,
    this.paddingVertical = 16,
    this.fontSize = 14,
    this.backgroundColor = AppColors.card1,
    required this.label,
    required this.onPressed,
    this.color = AppColors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0), // Keeps padding from original code
      child: SizedBox(
        width: double.infinity, // Makes button full-width
        height: height,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            backgroundColor: backgroundColor,
            padding: EdgeInsets.symmetric(vertical: paddingVertical),
            minimumSize: const Size(double.infinity, 50), // Ensures full width
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}
