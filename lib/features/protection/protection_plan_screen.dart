import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../core/storage/repositories/repositories.dart';
import '../../core/utils/financial_rules.dart';
import '../../shared/models/allocation.dart';
import '../../shared/models/domain_enums.dart';
import '../../shared/models/protection_plan.dart';
import '../../shared/widgets/ngao_button.dart';
import '../../shared/widgets/ngao_card.dart';
import '../../shared/widgets/ngao_onboarding_progress.dart';
import '../../shared/widgets/ngao_text_field.dart';
import '../../shared/widgets/status_indicator.dart';

const _currentUserId = 'current-user';
// This assumes the MVP supports exactly one protection plan per user; multiple or historical plans would require revisiting this identifier scheme.
const _currentPlanId = 'current-user-plan';

class ProtectionPlanScreen extends StatefulWidget {
  const ProtectionPlanScreen({
    super.key,
    required this.protectionPlanRepository,
    required this.riskWindowRepository,
  });

  final ProtectionPlanRepository protectionPlanRepository;
  final RiskWindowRepository riskWindowRepository;

  @override
  State<ProtectionPlanScreen> createState() => _ProtectionPlanScreenState();
}

class _ProtectionPlanScreenState extends State<ProtectionPlanScreen> {
  final _incomeController = TextEditingController();
  final _allocationAmountController = TextEditingController();
  final _allocations = <Allocation>[];
  AllocationCategory? _selectedCategory;
  String? _formMessage;
  bool _isLoading = true;
  bool _isSaving = false;

  int get _plannedIncome => int.tryParse(_incomeController.text) ?? 0;

  ProtectionPlan get _draftPlan => ProtectionPlan(
        id: _currentPlanId,
        userId: _currentUserId,
        plannedIncome: _plannedIncome,
        currency: 'KES',
        allocations: List.unmodifiable(_allocations),
      );

  @override
  void initState() {
    super.initState();
    _incomeController.addListener(_refreshTotals);
    _loadPlan();
  }

  Future<void> _loadPlan() async {
    try {
      final plan = await widget.protectionPlanRepository.findByUserId(
        _currentUserId,
      );
      if (!mounted) return;
      if (plan != null) {
        _incomeController.text = plan.plannedIncome.toString();
        _allocations
          ..clear()
          ..addAll(plan.allocations);
      }
      setState(() => _isLoading = false);
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _formMessage = 'Could not load your protection plan.';
        _isLoading = false;
      });
    }
  }

  void _refreshTotals() => setState(() {});

  void _addAllocation() {
    final amount = int.tryParse(_allocationAmountController.text);
    if (amount == null || amount <= 0 || _selectedCategory == null) {
      setState(() => _formMessage = 'Choose a category and enter an amount.');
      return;
    }

    setState(() {
      _allocations.add(
        Allocation(
          id: '$_currentPlanId-allocation-${_allocations.length}',
          protectionPlanId: _currentPlanId,
          category: _selectedCategory!,
          amount: amount,
          isProtected: _selectedCategory != AllocationCategory.flexible,
        ),
      );
      _allocationAmountController.clear();
      _selectedCategory = null;
      _formMessage = null;
    });
  }

  Future<void> _savePlan() async {
    final plan = _draftPlan;
    if (_plannedIncome <= 0) {
      setState(() => _formMessage = 'Enter your planned income in whole KES.');
      return;
    }
    if (allocationsExceedPlannedIncome(plan)) {
      setState(() => _formMessage = 'Adjust your allocations to fit your income.');
      return;
    }

    setState(() {
      _formMessage = null;
      _isSaving = true;
    });

    try {
      await widget.protectionPlanRepository.save(plan);
      if (mounted) context.go('/risk-period');
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _formMessage = 'Could not save your protection plan.';
        _isSaving = false;
      });
    }
  }

  @override
  void dispose() {
    _incomeController
      ..removeListener(_refreshTotals)
      ..dispose();
    _allocationAmountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final plan = _draftPlan;
    final overIncome = allocationsExceedPlannedIncome(plan);

    return Scaffold(
      appBar: AppBar(title: const Text('Protection plan')),
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
                      const NgaoOnboardingProgress(
                        step: 1,
                        label: 'Protection plan',
                      ),
                NgaoCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Plan your income',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 16),
                      NgaoTextField(
                        label: 'Planned income (KES)',
                        controller: _incomeController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                        'Add an allocation',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: AllocationCategory.values
                            .map(
                              (category) => ChoiceChip(
                                label: Text(category.name),
                                selected: _selectedCategory == category,
                                onSelected: (_) => setState(
                                  () => _selectedCategory = category,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      const SizedBox(height: 16),
                      NgaoTextField(
                        label: 'Amount (KES)',
                        controller: _allocationAmountController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      ),
                      const SizedBox(height: 12),
                      NgaoButton(
                        label: 'Add allocation',
                        onPressed: _addAllocation,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                NgaoCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _SummaryRow(
                        label: 'Total allocated',
                        amount: totalAllocated(plan.allocations),
                      ),
                      _SummaryRow(
                        label: 'Remaining',
                        amount: remaining(plan),
                      ),
                      _SummaryRow(
                        label: 'Flexible amount',
                        amount: flexibleAmount(plan.allocations),
                      ),
                      if (overIncome) ...[
                        const SizedBox(height: 12),
                        const NgaoStatusIndicator(
                          status: NgaoStatus.warning,
                          label: 'Adjust your allocations to fit your income.',
                        ),
                      ],
                      if (_formMessage != null && !overIncome) ...[
                        const SizedBox(height: 12),
                        NgaoStatusIndicator(
                          status: NgaoStatus.warning,
                          label: _formMessage!,
                        ),
                      ],
                      const SizedBox(height: 16),
                      NgaoButton(
                        label: _isSaving ? 'Saving...' : 'Save plan',
                        onPressed: _isLoading || _isSaving || overIncome
                          ? null
                          : _savePlan,
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

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({required this.label, required this.amount});

  final String label;
  final int amount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text('KES $amount'),
        ],
      ),
    );
  }
}