import 'domain_enums.dart';

class RiskWindow {
  RiskWindow({
    required this.id,
    required this.userId,
    required this.daysOfWeek,
    required this.startTime,
    required this.endTime,
    required this.trigger,
    required this.enabled,
  }) {
    if (endTime <= startTime) {
      throw ArgumentError.value(
        endTime,
        'endTime',
        'A risk window must end after it starts.',
      );
    }
  }

  final String id;
  final String userId;

  /// ISO weekday values: Monday is 1 and Sunday is 7.
  final Set<int> daysOfWeek;

  /// Time elapsed since midnight. Overnight windows are not represented.
  final Duration startTime;
  final Duration endTime;
  final RiskTrigger trigger;
  final bool enabled;
}
