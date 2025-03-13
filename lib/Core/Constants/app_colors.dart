import 'package:flutter/material.dart';

class AppColors {
  static const primaryColor = Color(0xFF0A0606);
  static const lightPrimaryColor = Color(0xFF42A5F5);
  static const lightScaffoldBackgroundColor = Color(0xFFF7F7F8);
  // static const lightScaffoldBackgroundColor = Color(0xFFfbdfeb  );
  static const darkPrimaryVariantColor = Colors.black;
  static const lightBackgroundColor = Color(0XFFFFFFFF);
  static const darkPrimaryColor = Color(0xFF000000);
  static const lightPrimaryContainer = Color(0xFFEEF0F3);
  static const darkSecondaryColor = Colors.white;
  static const darkOnPrimaryColor = Colors.white;
  // static const buttonBgColor =  Color(0xFFFF3131);
  static const buttonBgColor = Color(0xFFFF6B6B);

  static const loadingProgressColor = Colors.white;

  // Main colors
  static const Color background = Colors.white;
  static const Color primaryText = Color(0xFF000000);
  static const Color secondaryText = Color(0xFF757575);

  // Card colors

  // static const Color mintGreen = Color(0xFF8fbc8f);
  static const Color mintGreen = Color(0xFFEF5350);
  static const Color appGreen = Color(0xFF6c9d6c);
  // static const Color darkMintGreen = Color(0xFF6c9d6c); // Light green cards
  static const Color darkMintGreen = Colors.red;
  static const Color paleYellow = Colors.red;
  static const Color darkPaleYellow = Colors.red;
  // static const Color paleYellow = Color(0xFFf2db8e);
  // static const Color darkPaleYellow = Color(0xFFdabc59); // Yellow card
  static const Color softPink = Color(0xFFFCE4EC); // Pink course card
  static const Color lightGray = Color(0xFFF5F5F5);
  static const Color lightBlack = Colors.black54;
  // static const Color black = Colors.black;
  // static const Color white = Colors.white70;
  static const Color wine = Color(0xFFA52A2A);
  // static const Color appTheme = Color(0xFFFF3131);
  // Gray course card

  // Navigation colors
  static const Color navActive = Color(0xFF000000);
  static const Color navInactive = Color(0xFF9E9E9E);

  // Progress bar colors
  static const Color progressBackground = Color(0xFFEEEEEE);
  static const Color progressFill = Color(0xFF000000);

  // static const Color primary = Color(0xFF1A237E);  // Deep Indigo
  // static const Color secondary = Color(0xFF00796B); // Deep Teal
  static const Color accent = Color(0xFFFF6F00); // Deep Orange
  static const Color surface = Color(0xFFFAFAFA); // Light Surface
  static const Color card1 = Color(0xFF3949AB); // Indigo
  static const Color card2 = Color(0xFF00897B); // Teal
  static const Color card3 = Color(0xFF5E35B1); // Deep Purple
  static const Color textPrimary = Color(0xFF263238);
  static const Color textSecondary = Color(0xFF546E7A);
  static const Color success = Color(0xFF2E7D32);
  static const Color divider = Color(0xFFEEEEEE);

  static const LinearGradient scaffoldGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppColors.buttonBgColor,
      Colors.white,
    ],
  );

  static const Color primary =
      Color(0xFF22C55E); // Green color for active states
  static const Color primaryLight =
      Color(0xFFDCFCE7); // Light green for backgrounds
  static const Color secondary =
      Color(0xFFE11D48); // Red color for alerts/negative
  static const Color secondaryLight = Color(0xFFFEE2E2); // Light red background
  static const Color grey = Color(0xFF64748B); // Text and icons
  static const Color greyLight = Color(0xFFF8FAFC); // Background grey
  static const Color white = Colors.white;
  static const Color black = Color(0xFF1E293B);

  // Primary Colors
  static const Color appPrimary = Color(0xFF3949AB);
  static const Color primaryDark = Color.fromARGB(255, 33, 42, 100);
  static const Color appPrimaryLight = Color.fromARGB(255, 80, 102, 240);

  // Secondary Colors
  // static const Color secondary = Color(0xFF03DAC6);
  static const Color secondaryVariant = Color(0xFF018786);
  // static const Color secondaryLight = Color(0xFF66FFF9);

  // Text Colors
  // static const Color textPrimary = Color(0xFF000000);
  // static const Color textSecondary = Color(0xFF757575);
  static const Color textLight = Color(0xFFFFFFFF);
  static const Color textPrimaryLight = Color(0xFF212121);
  static const Color textSecondaryLight = Color(0xFF616161);
  static const Color textPrimaryDark = Color(0xFFFFFFFF);
  static const Color textSecondaryDark = Color(0xFFBDBDBD);

  // Background Colors
  // static const Color background = Color(0xFFF5F5F5);
  static const Color backgroundDark = Color(0xFF121212);
  static const Color backgroundLight = Color(0xFFFFFFFF);

  // Surface Colors
  // static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceDark = Color(0xFF2C2C2C);
  static const Color surfaceLight = Color(0xFFF9F9F9);

  // Error Colors
  static const Color error = Color(0xFFB00020);
  static const Color errorBackground = Color(0xFFFFE8E8);
  static const Color errorLight = Color(0xFFFFCDD2);
  static const Color errorDark = Color(0xFF9E0000);

  static const Color errorButton = Color.fromARGB(255, 192, 0, 0);

  // 0x00C00000

  // Success Colors
  // static const Color success = Color(0xFF4CAF50);
  static const Color successLight = Color(0xFF63A765);
  static const Color successDark = Color(0xFF108B14);
  static const Color successBackground = Color(0xFFDFF7DC);

  // Accent and Highlight Colors
  // static const Color accent = Color(0xFFFFD700);
  static const Color accentDark = Color(0xFFFFA500);
  static const Color accentLight = Color(0xFFFFE135);

  // Button Colors
  static const Color buttonPrimary = Color(0xFF6200EE);
  static const Color buttonSecondary = Color(0xFF03DAC6);
  static const Color buttonDisabled = Color(0xFFB0BEC5);
  static const Color buttonPrimaryLight = Color(0xFFBB86FC);
  static const Color buttonPrimaryDark = Color(0xFF3700B3);

  // Border and Divider Colors
  static const Color border = Color(0xFFBDBDBD);
  // static const Color divider = Color(0xFFEEEEEE);
  static const Color borderLight = Color(0xFFDDDDDD);
  static const Color borderDark = Color(0xFF757575);

  // Shadows and Miscellaneous
  static const Color shadow = Color(0x40000000);
  // static const Color white = Color(0xFFFFFFFF);
  // static const Color black = Color(0xFF000000);

  // Dark Theme-specific Colors
  static const Color darkShadow = Color(0x80000000);
  static const Color darkBackground = Color(0xFF121212);
  static const Color appBackground = Color(0xFF1E1E1E);

  // 0x001D2029
  static const Color appContainerColor = Color(0xFF1D2029);

  // Gradient Colors
  static const List<Color> gradient1 = [
    Color(0xFF2196F3),
    Color(0xFF21CBF3)
  ]; // Blue Gradient
  static const List<Color> gradient2 = [
    Color(0xFFFE6B8B),
    Color(0xFFFF8E53)
  ]; // Pink-Orange
  static const List<Color> gradient3 = [
    Color(0xFF4CAF50),
    Color(0xFF8BC34A)
  ]; // Green Gradient
  static const List<Color> gradient4 = [
    Color(0xFFFFC107),
    Color(0xFFFF9800)
  ]; // Yellow-Orange
  static const List<Color> gradient5 = [
    Color(0xFF404547),
    Color(0xFF353334)
  ]; // Purple-Pink
  static const List<Color> gradient6 = [
    Color(0xFF404547),
    Color(0xFF181818)
  ]; // Gray-Blue
  static const List<Color> gradient7 = [
    Color(0xFF00BCD4),
    Color(0xFF009688)
  ]; // Cyan-Teal
  static const List<Color> gradient8 = [
    Color(0xFFF44336),
    Color(0xFFE57373)
  ]; // Red Gradient
  static const List<Color> gradient9 = [
    Color(0xFF673AB7),
    Color(0xFF9575CD)
  ]; // Deep Purple
  static const List<Color> gradient10 = [
    Color(0xFF3F51B5),
    Color(0xFF5C6BC0)
  ]; // Indigo Gradient
}
