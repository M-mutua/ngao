import 'package:flutter/material.dart';
import '../../app/theme/design_tokens.dart';

enum NgaoButtonVariant { primary, secondary }

class NgaoButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final NgaoButtonVariant variant;

  const NgaoButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = NgaoButtonVariant.primary,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (variant == NgaoButtonVariant.primary) {
      return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: theme.colorScheme.primary,
            foregroundColor: theme.colorScheme.onPrimary,
            padding: const EdgeInsets.symmetric(vertical: NgaoSpacing.lg),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(NgaoRadius.small),
            ),
          ),
          child: Text(label),
        ),
      );
    }

    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: theme.colorScheme.primary,
          side: BorderSide(color: theme.colorScheme.primary),
          padding: const EdgeInsets.symmetric(vertical: NgaoSpacing.lg),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(NgaoRadius.small),
          ),
        ),
        child: Text(label),
      ),
    );
  }
}