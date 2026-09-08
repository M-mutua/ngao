import 'package:flutter/material.dart';
import '../../app/theme/design_tokens.dart';

class NgaoCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;

  const NgaoCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(NgaoSpacing.lg),
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(padding: padding, child: child),
    );
  }
}