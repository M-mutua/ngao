import 'package:flutter/material.dart';

/// Centralized design tokens for Ngao.
/// Phase 2: Design System. Do not hardcode these values in feature screens.
class NgaoColors {
  // Anchors
  static const Color deepTeal = Color(0xFF0D4F4B);
  static const Color warmOffWhite = Color(0xFFFAF6F0);

  // Neutrals
  static const Color textPrimary = Color(0xFF2A2A28);
  static const Color textSecondary = Color(0xFF6B6B66);
  static const Color border = Color(0xFFE4DED3);
  static const Color surface = Color(0xFFFFFFFF);

  // Functional
  static const Color warning = Color(0xFFC97A3D);
  static const Color error = Color(0xFFB3453B);
  static const Color success = Color(0xFF3D7A5C);

  // Intervention mode
  static const Color interventionBackground = Color(0xFF0F2E2C);
  static const Color interventionSurface = Color(0xFF163B38);
  static const Color interventionTextPrimary = Color(0xFFF2EDE3);
  static const Color interventionAccent = Color(0xFF6FA89E);
}

class NgaoSpacing {
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 24;
  static const double xxl = 32;
  static const double xxxl = 48;
}

class NgaoRadius {
  static const double small = 8;   // inputs, small elements
  static const double medium = 16; // cards
  static const double large = 24;  // sheets, modals
}