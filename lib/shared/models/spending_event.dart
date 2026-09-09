import 'domain_enums.dart';

class SpendingEvent {
  const SpendingEvent({
    required this.id,
    required this.userId,
    required this.protectionPlanId,
    required this.amount,
    required this.category,
    required this.occurredAt,
    required this.overrideState,
  });

  final String id;
  final String userId;
  final String protectionPlanId;

  /// Whole Kenyan shillings. Validation belongs in the domain rules layer.
  final int amount;
  final AllocationCategory category;
  final DateTime occurredAt;
  final OverrideState overrideState;
}
