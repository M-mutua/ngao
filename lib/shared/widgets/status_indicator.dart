import 'package:flutter/material.dart';
import '../../app/theme/design_tokens.dart';

enum NgaoStatus { success, warning, error }

class NgaoStatusIndicator extends StatelessWidget {
  final NgaoStatus status;
  final String label;

  const NgaoStatusIndicator({
    super.key,
    required this.status,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final (color, icon) = switch (status) {
      NgaoStatus.success => (NgaoColors.success, Icons.check_circle_outline),
      NgaoStatus.warning => (NgaoColors.warning, Icons.info_outline),
      NgaoStatus.error => (NgaoColors.error, Icons.error_outline),
    };

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: color, size: 18),
        const SizedBox(width: NgaoSpacing.xs),
        Flexible(
          child: Text(
            label,
            style: TextStyle(color: color, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}