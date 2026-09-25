import 'package:flutter/material.dart';

import '../../app/theme/design_tokens.dart';

class NgaoOnboardingProgress extends StatelessWidget {
  const NgaoOnboardingProgress({
    super.key,
    required this.step,
    required this.label,
  });

  final int step;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: NgaoSpacing.lg),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Step $step of 3',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          Text(label, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}