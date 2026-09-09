import '../../shared/models/allocation.dart';
import '../../shared/models/domain_enums.dart';
import '../../shared/models/protection_plan.dart';
import '../../shared/models/spending_event.dart';

int totalAllocated(Iterable<Allocation> allocations) =>
    allocations.fold(0, (total, allocation) => total + allocation.amount);

int remaining(ProtectionPlan plan) =>
    plan.plannedIncome - totalAllocated(plan.allocations);

int flexibleAmount(Iterable<Allocation> allocations) => allocations
    .where((allocation) => allocation.category == AllocationCategory.flexible)
    .fold(0, (total, allocation) => total + allocation.amount);

int totalFlexibleSpent(Iterable<SpendingEvent> spendingEvents) =>
    spendingEvents.fold(0, (total, event) => total + event.amount);

int remainingFlexibleAmount(
  ProtectionPlan plan,
  Iterable<SpendingEvent> relevantSpendingEvents,
) =>
    flexibleAmount(plan.allocations) -
    totalFlexibleSpent(relevantSpendingEvents);

bool allocationsExceedPlannedIncome(ProtectionPlan plan) => remaining(plan) < 0;

bool spendingExceedsFlexibleAmount({
  required ProtectionPlan plan,
  required Iterable<SpendingEvent> relevantSpendingEvents,
  required int attemptedAmount,
}) => attemptedAmount > remainingFlexibleAmount(plan, relevantSpendingEvents);
