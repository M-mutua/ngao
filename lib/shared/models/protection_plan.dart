import 'allocation.dart';

class ProtectionPlan {
  const ProtectionPlan({
    required this.id,
    required this.userId,
    required this.plannedIncome,
    required this.currency,
    required this.allocations,
  });

  final String id;
  final String userId;

  /// Whole Kenyan shillings. Validation belongs in the domain rules layer.
  final int plannedIncome;
  final String currency;
  final List<Allocation> allocations;
}
