import 'package:flutter/material.dart';
import 'design_tokens.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: NgaoColors.warmOffWhite,
      colorScheme: ColorScheme.fromSeed(
        seedColor: NgaoColors.deepTeal,
        brightness: Brightness.light,
      ).copyWith(
        primary: NgaoColors.deepTeal,
        surface: NgaoColors.surface,
        error: NgaoColors.error,
      ),
      textTheme: _textTheme(NgaoColors.textPrimary, NgaoColors.textSecondary),
      cardTheme: CardThemeData(
        color: NgaoColors.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(NgaoRadius.medium),
          side: const BorderSide(color: NgaoColors.border),
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: NgaoColors.warmOffWhite,
        foregroundColor: NgaoColors.textPrimary,
        elevation: 0,
      ),
    );
  }

  /// Intervention mode: darker, calmer, lower cognitive load.
  /// Per SDD §18 and Decision 016. Not a generic dark mode inversion.
  static ThemeData get intervention {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: NgaoColors.interventionBackground,
      colorScheme: ColorScheme.fromSeed(
        seedColor: NgaoColors.interventionAccent,
        brightness: Brightness.dark,
      ).copyWith(
        primary: NgaoColors.interventionAccent,
        surface: NgaoColors.interventionSurface,
        error: NgaoColors.error,
      ),
      textTheme: _textTheme(
        NgaoColors.interventionTextPrimary,
        NgaoColors.interventionTextPrimary.withValues(alpha: 0.7),
      ),
      cardTheme: CardThemeData(
        color: NgaoColors.interventionSurface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(NgaoRadius.medium),
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: NgaoColors.interventionBackground,
        foregroundColor: NgaoColors.interventionTextPrimary,
        elevation: 0,
      ),
    );
  }

  static TextTheme _textTheme(Color primary, Color secondary) {
    return TextTheme(
      headlineLarge: TextStyle(color: primary, fontWeight: FontWeight.w600),
      headlineMedium: TextStyle(color: primary, fontWeight: FontWeight.w600),
      titleLarge: TextStyle(color: primary, fontWeight: FontWeight.w600),
      bodyLarge: TextStyle(color: primary),
      bodyMedium: TextStyle(color: primary),
      bodySmall: TextStyle(color: secondary),
      labelLarge: TextStyle(color: primary, fontWeight: FontWeight.w500),
    );
  }
}