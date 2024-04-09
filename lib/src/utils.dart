import 'package:flutter/material.dart';

class PrimaryColors {
  // disable constructor
  PrimaryColors._();

  static const Color primary = Color(0xFFddcc88);
  static const Color primaryLight = Color(0xFFffeeaa);
  static const Color primaryDark = Color(0xFFaa9955);
  static const Color primaryWarm = Color(0xFFbbaa66);
  static const Color white = Color(0xFFffffff);
  static const Color dark = Color(0xFF332b00);
  static const Color black = Color(0xFF000000);
  static const Color grey = Colors.grey;
  static const Color darkGrey = Colors.blueGrey;

  static const gradientPrimary = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      PrimaryColors.primaryLight,
      PrimaryColors.primary,
      PrimaryColors.primaryDark,
      PrimaryColors.primary,
    ],
    stops: [0.0, 0.49, 0.51, 1.0],
  );

  static const gradientSecondary = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      PrimaryColors.primaryDark,
      PrimaryColors.primaryLight,
      PrimaryColors.primary,
      PrimaryColors.primaryLight,
    ],
    stops: [0.0, 0.47, 0.53, 1.0],
  );

  static const gradientConvex = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      PrimaryColors.primaryDark,
      PrimaryColors.primaryLight,
      PrimaryColors.white,
      PrimaryColors.primary,
      PrimaryColors.primaryLight,
      PrimaryColors.primaryDark,
    ],
    stops: [0.0, 0.25, 0.38, 0.63, 0.87, 1.0],
  );

  static const gradientFlat = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomLeft,
    colors: [
      PrimaryColors.primaryDark,
      PrimaryColors.primaryLight,
    ],
  );
}
