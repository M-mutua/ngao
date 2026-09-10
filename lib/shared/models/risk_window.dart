import 'domain_enums.dart';

class RiskWindow {
  const RiskWindow({
    required this.id,
    required this.userId,
    required this.daysOfWeek,
    required this.startTime,
    required this.endTime,
    required this.trigger,
    required this.enabled,
  });

  final String id;
  final String userId;

  /// ISO weekday values on which this window starts: Monday is 1 and Sunday is 7.
  final Set<int> daysOfWeek;

  /// Time elapsed since midnight. An end time earlier than the start time
  /// represents a window that ends on the following day.
  final Duration startTime;
  final Duration endTime;
  final RiskTrigger trigger;
  final bool enabled;
}
