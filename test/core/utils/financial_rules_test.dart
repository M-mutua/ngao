import 'package:flutter_test/flutter_test.dart';
import 'package:ngao/core/utils/domain_validation.dart';
import 'package:ngao/core/utils/financial_rules.dart';
import 'package:ngao/shared/models/allocation.dart';
import 'package:ngao/shared/models/domain_enums.dart';
import 'package:ngao/shared/models/protection_plan.dart';
import 'package:ngao/shared/models/spending_event.dart';

void main() {
  final exactIncomePlan = ProtectionPlan(
    id: 'plan-1',
    userId: 'user-1',
    plannedIncome: 50000,
    currency: 'KES',
    allocations: const [
      Allocation(
        id: 'allocation-rent',
        protectionPlanId: 'plan-1',
        category: AllocationCategory.rent,
        amount: 40000,
        isProtected: true,
      ),
      Allocation(
        id: 'allocation-flexible',
        protectionPlanId: 'plan-1',
        category: AllocationCategory.flexible,
        amount: 10000,
        isProtected: false,
      ),
    ],
  );

  group('protection-plan validation', () {
    test('accepts allocations exactly equal to planned income', () {
      expect(validateProtectionPlan(exactIncomePlan), isNull);
      expect(totalAllocated(exactIncomePlan.allocations), 50000);
      expect(remaining(exactIncomePlan), 0);
    });

    test('rejects allocations that exceed planned income', () {
      final overAllocatedPlan = ProtectionPlan(
        id: exactIncomePlan.id,
        userId: exactIncomePlan.userId,
        plannedIncome: exactIncomePlan.plannedIncome,
        currency: exactIncomePlan.currency,
        allocations: [
          ...exactIncomePlan.allocations,
          const Allocation(
            id: 'allocation-other',
            protectionPlanId: 'plan-1',
            category: AllocationCategory.other,
            amount: 1,
            isProtected: false,
          ),
        ],
      );

      expect(
        validateProtectionPlan(overAllocatedPlan),
        'Total allocations cannot exceed planned income.',
      );
    });
  });

  group('spending friction', () {
    final recordedSpending = SpendingEvent(
      id: 'spending-1',
      userId: 'user-1',
      protectionPlanId: 'plan-1',
      amount: 7000,
      category: AllocationCategory.flexible,
      occurredAt: DateTime(2026, 9, 10, 12),
      overrideState: OverrideState.overridden,
    );

    test(
      'does not warn when spending exactly matches the flexible balance',
      () {
        expect(
          spendingExceedsFlexibleAmount(
            plan: exactIncomePlan,
            relevantSpendingEvents: [recordedSpending],
            attemptedAmount: 3000,
          ),
          isFalse,
        );
      },
    );

    test(
      'warns when spending exceeds the flexible balance and records override',
      () {
        expect(
          spendingExceedsFlexibleAmount(
            plan: exactIncomePlan,
            relevantSpendingEvents: [recordedSpending],
            attemptedAmount: 3001,
          ),
          isTrue,
        );
        expect(recordedSpending.overrideState, OverrideState.overridden);
      },
    );
  });
}
