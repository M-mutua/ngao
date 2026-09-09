import '../constants/currency.dart';
import 'financial_rules.dart';
import '../../shared/models/allocation.dart';
import '../../shared/models/domain_enums.dart';
import '../../shared/models/intervention_event.dart';
import '../../shared/models/protection_plan.dart';
import '../../shared/models/reflection.dart';
import '../../shared/models/risk_window.dart';
import '../../shared/models/spending_event.dart';

String? validateRequiredId(String value, {String fieldName = 'ID'}) =>
    value.trim().isEmpty ? '$fieldName is required.' : null;

String? validateDisplayName(String value) =>
    value.trim().isEmpty ? 'Display name is required.' : null;

String? validatePhoneNumber(String value) =>
    value.trim().isEmpty ? 'Phone number is required.' : null;

String? validateMessageContent(String value) =>
    value.trim().isEmpty ? 'Message content is required.' : null;

String? validateNonNegativeAmount(int value, {String fieldName = 'Amount'}) =>
    value < 0 ? '$fieldName cannot be negative.' : null;

String? validateCurrency(String value) =>
    value == defaultCurrency ? null : 'Only $defaultCurrency is supported.';

String? validateAllocation(Allocation allocation) => validateNonNegativeAmount(
  allocation.amount,
  fieldName: 'Allocation amount',
);

String? validateProtectionPlan(ProtectionPlan plan) {
  final incomeError = validateNonNegativeAmount(
    plan.plannedIncome,
    fieldName: 'Planned income',
  );
  if (incomeError != null) {
    return incomeError;
  }
  final currencyError = validateCurrency(plan.currency);
  if (currencyError != null) {
    return currencyError;
  }
  if (plan.allocations.any(
    (allocation) => validateAllocation(allocation) != null,
  )) {
    return 'Allocation amounts cannot be negative.';
  }
  if (allocationsExceedPlannedIncome(plan)) {
    return 'Total allocations cannot exceed planned income.';
  }
  return null;
}

String? validateSpendingEvent(SpendingEvent event) =>
    validateNonNegativeAmount(event.amount, fieldName: 'Spending amount');

String? validateRiskWindow(RiskWindow window) {
  if (window.daysOfWeek.isEmpty) {
    return 'At least one day is required.';
  }
  if (window.daysOfWeek.any(
    (day) => day < DateTime.monday || day > DateTime.sunday,
  )) {
    return 'Days must use ISO weekday values from 1 to 7.';
  }
  if (!_isValidTimeOfDay(window.startTime) ||
      !_isValidTimeOfDay(window.endTime)) {
    return 'Times must fall within a single day.';
  }
  if (window.endTime <= window.startTime) {
    return 'End time must be after start time.';
  }
  return null;
}

bool isRiskWindowActive(RiskWindow window, DateTime at) {
  if (!window.enabled || !window.daysOfWeek.contains(at.weekday)) {
    return false;
  }
  final time = Duration(hours: at.hour, minutes: at.minute, seconds: at.second);
  return time >= window.startTime && time < window.endTime;
}

bool isRiskWindowUpcoming(RiskWindow window, DateTime at) {
  if (!window.enabled) {
    return false;
  }

  for (var offset = 0; offset < 7; offset++) {
    final date = DateTime(
      at.year,
      at.month,
      at.day,
    ).add(Duration(days: offset));
    if (!window.daysOfWeek.contains(date.weekday)) {
      continue;
    }
    final startsAt = date.add(window.startTime);
    if (startsAt.isAfter(at)) {
      return true;
    }
  }
  return false;
}

DateTime cooldownEndsAt(InterventionEvent event) =>
    event.startedAt.add(event.cooldownDuration);

Duration cooldownRemaining(InterventionEvent event, DateTime at) {
  final remaining = cooldownEndsAt(event).difference(at);
  return remaining.isNegative ? Duration.zero : remaining;
}

bool canTransitionIntervention(InterventionState from, InterventionState to) {
  return switch (from) {
    InterventionState.idle => to == InterventionState.started,
    InterventionState.started => to == InterventionState.cooldownActive,
    InterventionState.cooldownActive =>
      to == InterventionState.cooldownCompleted,
    InterventionState.cooldownCompleted =>
      to == InterventionState.reflectionPending,
    InterventionState.reflectionPending => to == InterventionState.completed,
    InterventionState.completed => false,
  };
}

String? validateReflection(Reflection reflection) {
  if (reflection.whatHelped.trim().isEmpty) {
    return 'What helped is required.';
  }
  if (reflection.spendingStatus == ReflectionSpendingStatus.noSpending &&
      reflection.amountSpent != null) {
    return 'Amount spent must be omitted when no spending occurred.';
  }
  if (reflection.spendingStatus == ReflectionSpendingStatus.spent &&
      reflection.amountSpent == null) {
    return 'Amount spent is required when spending occurred.';
  }
  if (reflection.amountSpent != null && reflection.amountSpent! < 0) {
    return 'Amount spent cannot be negative.';
  }
  return null;
}

bool _isValidTimeOfDay(Duration value) =>
    value >= Duration.zero && value < const Duration(days: 1);
