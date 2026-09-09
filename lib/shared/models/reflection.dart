import 'domain_enums.dart';

class Reflection {
  const Reflection({
    required this.id,
    required this.interventionEventId,
    required this.trigger,
    required this.spendingStatus,
    required this.amountSpent,
    required this.whatHelped,
    required this.createdAt,
    this.notes,
  });

  final String id;
  final String interventionEventId;
  final RiskTrigger trigger;
  final ReflectionSpendingStatus spendingStatus;
  final int? amountSpent;
  final String whatHelped;
  final String? notes;
  final DateTime createdAt;
}
