import 'package:flutter_test/flutter_test.dart';
import 'package:ngao/core/utils/domain_validation.dart';
import 'package:ngao/shared/models/domain_enums.dart';
import 'package:ngao/shared/models/intervention_event.dart';
import 'package:ngao/shared/models/risk_window.dart';

void main() {
  const overnightWindow = RiskWindow(
    id: 'risk-1',
    userId: 'user-1',
    daysOfWeek: {DateTime.friday},
    startTime: Duration(hours: 22),
    endTime: Duration(hours: 2),
    trigger: RiskTrigger.socialEvent,
    enabled: true,
  );

  group('overnight risk windows', () {
    test('validate when end time falls on the following day', () {
      expect(validateRiskWindow(overnightWindow), isNull);
      expect(spansMidnight(overnightWindow), isTrue);
    });

    test('remain active past midnight until the end time', () {
      expect(
        isRiskWindowActive(overnightWindow, DateTime(2026, 9, 11, 23)),
        isTrue,
      );
      expect(
        isRiskWindowActive(overnightWindow, DateTime(2026, 9, 12, 1)),
        isTrue,
      );
    });

    test('are inactive before start and at the end time', () {
      expect(
        isRiskWindowActive(overnightWindow, DateTime(2026, 9, 11, 21, 59)),
        isFalse,
      );
      expect(
        isRiskWindowActive(overnightWindow, DateTime(2026, 9, 12, 2)),
        isFalse,
      );
    });
  });

  test('calculates cooldown remaining time from timestamps', () {
    final event = InterventionEvent(
      id: 'intervention-1',
      userId: 'user-1',
      startedAt: DateTime(2026, 9, 10, 12),
      cooldownDuration: Duration(minutes: 30),
      state: InterventionState.cooldownActive,
      actions: [],
    );

    expect(
      cooldownRemaining(event, DateTime(2026, 9, 10, 12, 10)),
      const Duration(minutes: 20),
    );
    expect(
      cooldownRemaining(event, DateTime(2026, 9, 10, 12, 31)),
      Duration.zero,
    );
  });
}
