import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../app/theme/design_tokens.dart';

class NgaoTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? errorText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;

  const NgaoTextField({
    super.key,
    required this.label,
    required this.controller,
    this.errorText,
    this.keyboardType,
    this.obscureText = false,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        labelText: label,
        errorText: errorText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(NgaoRadius.small),
          borderSide: const BorderSide(color: NgaoColors.border),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: NgaoSpacing.lg,
          vertical: NgaoSpacing.md,
        ),
      ),
    );
  }
}