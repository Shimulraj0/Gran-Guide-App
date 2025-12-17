import 'package:flutter/material.dart';

class AppColors {
  // Primary Brand Colors
  static const Color primary = Color(0xFF2FA2E3);
  static const Color primaryLight = Color(0xFF6FCEF0);
  static const Color primaryDark = Color(
    0xFF1E88C9,
  ); // slightly darker for variation if needed

  // Backgrounds
  static const Color background = Colors.white;
  static const Color inputBackground = Colors.white;

  // Text Colors
  static const Color textPrimary = Colors.black87;
  static const Color textSecondary = Color(0xFF6B6B6B);

  static const Color textMuted = Color(0xFF8997AA);
  static const Color textWhite = Colors.white;

  // Border & Dividers
  static const Color border = Color(0xFFE2E8F0);
  static const Color borderLight = Color(
    0xFFEBF4FC,
  ); // Pale blue border found in containers

  // Button Colors
  static const Color buttonLightBlue = Color(0xFF7CB9E8);

  // Status/Feedback
  static const Color error = Colors.redAccent;

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [primaryLight, primary],
  );

  // Social
  static const Color facebookBlue = Colors.blue;
  static const Color appleBlack = Colors.black;
}
