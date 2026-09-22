import 'package:flutter/material.dart';

import '../../app/theme/design_tokens.dart';

typedef NgaoTimePicker = Future<TimeOfDay?> Function(
  BuildContext context,
  TimeOfDay initialTime,
  String label,
);

class NgaoTimeField extends StatelessWidget {
  const NgaoTimeField({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    this.timePicker = _showTimePicker,
  });

  final String label;
  final TimeOfDay value;
  final ValueChanged<TimeOfDay> onChanged;
  final NgaoTimePicker timePicker;

  static Future<TimeOfDay?> _showTimePicker(
    BuildContext context,
    TimeOfDay initialTime,
    String label,
  ) => showTimePicker(
    context: context,
    initialTime: initialTime,
    helpText: label,
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final selected = await timePicker(context, value, label);
        if (selected != null) onChanged(selected);
      },
      borderRadius: BorderRadius.circular(NgaoRadius.small),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(NgaoRadius.small),
            borderSide: const BorderSide(color: NgaoColors.border),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: NgaoSpacing.lg,
            vertical: NgaoSpacing.md,
          ),
        ),
        child: Text(value.format(context)),
      ),
    );
  }
}