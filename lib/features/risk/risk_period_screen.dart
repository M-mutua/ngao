import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/storage/repositories/repositories.dart';
import '../../core/utils/domain_validation.dart';
import '../../shared/models/domain_enums.dart';
import '../../shared/models/risk_window.dart';
import '../../shared/widgets/ngao_button.dart';
import '../../shared/widgets/ngao_card.dart';
import '../../shared/widgets/ngao_onboarding_progress.dart';
import '../../shared/widgets/ngao_time_field.dart';
import '../../shared/widgets/status_indicator.dart';

const _currentUserId = 'current-user';
// This assumes the MVP supports one configured risk window per user; multiple or historical windows would require revisiting this identifier scheme.
const _currentRiskWindowId = 'current-user-risk-window';

class RiskPeriodScreen extends StatefulWidget {
  const RiskPeriodScreen({
    super.key,
    required this.riskWindowRepository,
    this.timePicker,
    this.returnToHome = false,
  });

  final RiskWindowRepository riskWindowRepository;
  final NgaoTimePicker? timePicker;
  final bool returnToHome;

  @override
  State<RiskPeriodScreen> createState() => _RiskPeriodScreenState();
}

class _RiskPeriodScreenState extends State<RiskPeriodScreen> {
  final _selectedDays = <int>{};
  TimeOfDay _startTime = const TimeOfDay(hour: 18, minute: 0);
  TimeOfDay _endTime = const TimeOfDay(hour: 22, minute: 0);
  RiskTrigger? _selectedTrigger;
  bool _enabled = true;
  String? _message;
  bool _isLoading = true;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _loadRiskWindow();
  }

  Future<void> _loadRiskWindow() async {
    try {
      final windows = await widget.riskWindowRepository.listByUserId(
        _currentUserId,
      );
      if (!mounted) return;
      final window = windows.where((item) => item.id == _currentRiskWindowId).firstOrNull;
      if (window != null) {
        _selectedDays
          ..clear()
          ..addAll(window.daysOfWeek);
        _startTime = TimeOfDay(
          hour: window.startTime.inHours,
          minute: window.startTime.inMinutes % 60,
        );
        _endTime = TimeOfDay(
          hour: window.endTime.inHours,
          minute: window.endTime.inMinutes % 60,
        );
        _selectedTrigger = window.trigger;
        _enabled = window.enabled;
      }
      setState(() => _isLoading = false);
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _message = 'Could not load your risk period.';
        _isLoading = false;
      });
    }
  }

  RiskWindow get _draftWindow => RiskWindow(
        id: _currentRiskWindowId,
        userId: _currentUserId,
        daysOfWeek: Set.unmodifiable(_selectedDays),
        startTime: Duration(
          hours: _startTime.hour,
          minutes: _startTime.minute,
        ),
        endTime: Duration(hours: _endTime.hour, minutes: _endTime.minute),
        trigger: _selectedTrigger ?? RiskTrigger.other,
        enabled: _enabled,
      );

  Future<void> _saveWindow() async {
    final window = _draftWindow;
    if (_selectedTrigger == null) {
      setState(() => _message = 'Choose what may make this period risky.');
      return;
    }

    final validationMessage = validateRiskWindow(window);
    if (validationMessage != null) {
      setState(() => _message = validationMessage);
      return;
    }

    setState(() {
      _message = null;
      _isSaving = true;
    });

    try {
      await widget.riskWindowRepository.save(window);
      if (mounted) {
        context.go(widget.returnToHome ? '/home' : '/trusted-person');
      }
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _message = 'Could not save your risk period.';
        _isSaving = false;
      });
    }
  }

  String _dayLabel(int day) => const {
        1: 'Monday',
        2: 'Tuesday',
        3: 'Wednesday',
        4: 'Thursday',
        5: 'Friday',
        6: 'Saturday',
        7: 'Sunday',
      }[day]!;

  String _triggerLabel(RiskTrigger trigger) => switch (trigger) {
        RiskTrigger.payday => 'Payday',
        RiskTrigger.stress => 'Stress',
        RiskTrigger.argument => 'Argument',
        RiskTrigger.loneliness => 'Loneliness',
        RiskTrigger.socialEvent => 'Social event',
        RiskTrigger.alcoholAvailability => 'Alcohol availability',
        RiskTrigger.workPressure => 'Work pressure',
        RiskTrigger.unexpectedMoney => 'Unexpected money',
        RiskTrigger.other => 'Other',
      };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Risk period')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: _isLoading
                ? const CircularProgressIndicator()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            tooltip: 'Back',
                            onPressed: () => context.go(
                                widget.returnToHome
                                  ? '/home'
                                  : '/protection-plan',
                            ),
                            icon: const Icon(Icons.arrow_back),
                          ),
                          const Expanded(
                            child: NgaoOnboardingProgress(
                              step: 2,
                              label: 'Risk period',
                            ),
                          ),
                        ],
                      ),
                NgaoCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Choose the days and time',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: List.generate(7, (index) {
                          final day = index + 1;
                          return FilterChip(
                            label: Text(_dayLabel(day)),
                            selected: _selectedDays.contains(day),
                            onSelected: (selected) => setState(() {
                              if (selected) {
                                _selectedDays.add(day);
                              } else {
                                _selectedDays.remove(day);
                              }
                            }),
                          );
                        }),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: NgaoTimeField(
                              label: 'Starts',
                              value: _startTime,
                              timePicker: widget.timePicker ??
                                  (context, initialTime, label) =>
                                      showTimePicker(
                                        context: context,
                                        initialTime: initialTime,
                                        helpText: label,
                                      ),
                              onChanged: (time) =>
                                  setState(() => _startTime = time),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: NgaoTimeField(
                              label: 'Ends',
                              value: _endTime,
                              timePicker: widget.timePicker ??
                                  (context, initialTime, label) =>
                                      showTimePicker(
                                        context: context,
                                        initialTime: initialTime,
                                        helpText: label,
                                      ),
                              onChanged: (time) =>
                                  setState(() => _endTime = time),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                      ),
                const SizedBox(height: 16),
                NgaoCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'What might trigger it?',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: RiskTrigger.values
                            .map(
                              (trigger) => ChoiceChip(
                                label: Text(_triggerLabel(trigger)),
                                selected: _selectedTrigger == trigger,
                                onSelected: (_) => setState(
                                  () => _selectedTrigger = trigger,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      SwitchListTile(
                        contentPadding: EdgeInsets.zero,
                        title: const Text('Enabled'),
                        value: _enabled,
                        onChanged: (enabled) =>
                            setState(() => _enabled = enabled),
                      ),
                      if (_message != null) ...[
                        const SizedBox(height: 8),
                        NgaoStatusIndicator(
                          status: NgaoStatus.warning,
                          label: _message!,
                        ),
                      ],
                      const SizedBox(height: 8),
                      NgaoButton(
                        label: _isSaving ? 'Saving...' : 'Save risk period',
                        onPressed: _isLoading || _isSaving
                          ? null
                          : _saveWindow,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}