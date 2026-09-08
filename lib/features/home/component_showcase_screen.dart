import 'package:flutter/material.dart';
import 'package:ngao/shared/widgets/status_indicator.dart';
import '../../app/theme/app_theme.dart';
import '../../app/theme/design_tokens.dart';
import '../../shared/widgets/ngao_button.dart';
import '../../shared/widgets/ngao_card.dart';
import '../../shared/widgets/ngao_text_field.dart';

class ComponentShowcaseScreen extends StatefulWidget {
  const ComponentShowcaseScreen({super.key});

  @override
  State<ComponentShowcaseScreen> createState() => _ComponentShowcaseScreenState();
}

class _ComponentShowcaseScreenState extends State<ComponentShowcaseScreen> {
  final controller = TextEditingController();
  bool interventionMode = false;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: interventionMode ? AppTheme.intervention : AppTheme.light,
      child: Scaffold(
        appBar: AppBar(title: const Text('Component Showcase')),
        body: Padding(
          padding: const EdgeInsets.all(NgaoSpacing.lg),
          child: ListView(
            children: [
              SwitchListTile(
                title: const Text('Intervention mode'),
                value: interventionMode,
                onChanged: (v) => setState(() => interventionMode = v),
              ),
              const SizedBox(height: NgaoSpacing.lg),
              NgaoCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Sample card content'),
                    const SizedBox(height: NgaoSpacing.md),
                    NgaoTextField(label: 'Display name', controller: controller),
                    const SizedBox(height: NgaoSpacing.lg),
                    NgaoButton(label: 'Primary action', onPressed: () {}),
                    const SizedBox(height: NgaoSpacing.sm),
                    NgaoButton(
                      label: 'Secondary action',
                      variant: NgaoButtonVariant.secondary,
                      onPressed: () {},
                    ),
                    const SizedBox(height: NgaoSpacing.lg),
                    const NgaoStatusIndicator(status: NgaoStatus.success, label: 'Protected'),
                    const SizedBox(height: NgaoSpacing.xs),
                    const NgaoStatusIndicator(status: NgaoStatus.warning, label: 'Exceeds flexible budget'),
                    const SizedBox(height: NgaoSpacing.xs),
                    const NgaoStatusIndicator(status: NgaoStatus.error, label: 'Something went wrong'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}