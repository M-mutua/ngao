import 'domain_enums.dart';

class Allocation {
  const Allocation({
    required this.id,
    required this.protectionPlanId,
    required this.category,
    required this.amount,
    required this.isProtected,
  });

  final String id;
  final String protectionPlanId;
  final AllocationCategory category;

  /// Whole Kenyan shillings. Validation belongs in the domain rules layer.
  final int amount;
  final bool isProtected;
}
