import 'package:flutter/material.dart';

class AppTheme {
  // Phase 1: minimal centralized theme.
  // Phase 2 (Design System) will expand this into full tokens
  // for spacing, typography, elevation, and component styles.

  static const Color deepTeal = Color(0xFF0D4F4B);
  static const Color warmOffWhite = Color(0xFFFAF6F0);

  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: warmOffWhite,
      colorScheme: ColorScheme.fromSeed(
        seedColor: deepTeal,
        brightness: Brightness.light,
      ).copyWith(
        primary: deepTeal,
        surface: warmOffWhite,
      ),
    );
  }
}