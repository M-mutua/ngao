import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:ngao/app/app.dart';
import 'package:ngao/core/storage/repositories/repositories.dart';
import 'package:ngao/features/protection/protection_plan_screen.dart';
import 'package:ngao/features/risk/risk_period_screen.dart';
import 'package:ngao/shared/models/allocation.dart';
import 'package:ngao/shared/models/domain_enums.dart';
import 'package:ngao/shared/models/protection_plan.dart';
import 'package:ngao/shared/models/risk_window.dart';
import 'package:ngao/shared/models/trusted_contact.dart';
import 'package:ngao/shared/models/user.dart';

void main() {
  testWidgets('app launches to the welcome screen', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      NgaoApp(
        userRepository: _FakeUserRepository(),
        protectionPlanRepository: _FakeProtectionPlanRepository(),
        riskWindowRepository: _FakeRiskWindowRepository(),
        trustedContactRepository: _FakeTrustedContactRepository(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Ngao'), findsOneWidget);
    expect(find.text('Welcome to Ngao'), findsOneWidget);
    expect(find.text('Display name'), findsOneWidget);
  });

  testWidgets('blocks saving when allocations exceed income', (
    WidgetTester tester,
  ) async {
    final protectionPlanRepository = _FakeProtectionPlanRepository();

    await tester.pumpWidget(
      MaterialApp(
        home: ProtectionPlanScreen(
          protectionPlanRepository: protectionPlanRepository,
          riskWindowRepository: _FakeRiskWindowRepository(),
        ),
      ),
    );

    await tester.enterText(find.byType(TextField).at(0), '1000');
    await tester.tap(find.text('rent'));
    await tester.enterText(find.byType(TextField).at(1), '1001');
    await tester.tap(find.text('Add allocation'));
    await tester.pump();

    expect(
      find.text('Adjust your allocations to fit your income.'),
      findsOneWidget,
    );
    final saveButton = tester.widget<ElevatedButton>(
      find.widgetWithText(ElevatedButton, 'Save plan'),
    );
    expect(saveButton.onPressed, isNull);

    await tester.tap(find.text('Save plan'), warnIfMissed: false);
    expect(protectionPlanRepository.savedPlans, isEmpty);
  });

  testWidgets('routes a user without a plan to protection plan', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      NgaoApp(
        userRepository: _FakeUserRepository(
          user: User(
            id: 'current-user',
            displayName: 'Amina',
            createdAt: DateTime(2026, 9, 16),
          ),
        ),
        protectionPlanRepository: _FakeProtectionPlanRepository(),
        riskWindowRepository: _FakeRiskWindowRepository(),
        trustedContactRepository: _FakeTrustedContactRepository(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Protection plan'), findsOneWidget);
    expect(find.text('Plan your income'), findsOneWidget);
  });

  testWidgets('routes a user with a plan to home', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      NgaoApp(
        userRepository: _FakeUserRepository(
          user: User(
            id: 'current-user',
            displayName: 'Amina',
            createdAt: DateTime(2026, 9, 16),
          ),
        ),
        protectionPlanRepository: _FakeProtectionPlanRepository(
          plan: const ProtectionPlan(
            id: 'current-user-plan',
            userId: 'current-user',
            plannedIncome: 1000,
            currency: 'KES',
            allocations: [
              Allocation(
                id: 'allocation-rent',
                protectionPlanId: 'current-user-plan',
                category: AllocationCategory.rent,
                amount: 1000,
                isProtected: true,
              ),
            ],
          ),
        ),
        riskWindowRepository: _FakeRiskWindowRepository(
          windows: [_sampleRiskWindow],
        ),
        trustedContactRepository: _FakeTrustedContactRepository(
          contacts: [_sampleTrustedContact],
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(
      find.text('Ngao Phase 1: navigation and theme scaffold.'),
      findsOneWidget,
    );
    expect(find.text('Plan your income'), findsNothing);
  });

  testWidgets('routes a planned user without a risk window to risk period', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      NgaoApp(
        userRepository: _FakeUserRepository(user: _sampleUser),
        protectionPlanRepository: _FakeProtectionPlanRepository(
          plan: _samplePlan,
        ),
        riskWindowRepository: _FakeRiskWindowRepository(),
        trustedContactRepository: _FakeTrustedContactRepository(
          contacts: [_sampleTrustedContact],
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Risk period'), findsOneWidget);
    expect(find.text('Choose the days and time'), findsOneWidget);
  });

  testWidgets('routes a user with a risk window but no contact to trusted person', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      NgaoApp(
        userRepository: _FakeUserRepository(user: _sampleUser),
        protectionPlanRepository: _FakeProtectionPlanRepository(
          plan: _samplePlan,
        ),
        riskWindowRepository: _FakeRiskWindowRepository(
          windows: [_sampleRiskWindow],
        ),
        trustedContactRepository: _FakeTrustedContactRepository(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Trusted person'), findsOneWidget);
    expect(find.text('Add someone you trust'), findsOneWidget);
  });

  testWidgets('validates and saves an overnight risk window', (
    WidgetTester tester,
  ) async {
    final repository = _FakeRiskWindowRepository();
    Future<TimeOfDay?> timePicker(
      BuildContext context,
      TimeOfDay initialTime,
      String label,
    ) async {
      return label == 'Starts'
          ? const TimeOfDay(hour: 22, minute: 0)
          : const TimeOfDay(hour: 2, minute: 0);
    }

    await tester.pumpWidget(
      MaterialApp.router(
        routerConfig: GoRouter(
          initialLocation: '/risk-period',
          routes: [
            GoRoute(
              path: '/risk-period',
              builder: (context, state) => RiskPeriodScreen(
                riskWindowRepository: repository,
                timePicker: timePicker,
              ),
            ),
            GoRoute(
              path: '/trusted-person',
              builder: (context, state) => const SizedBox(),
            ),
          ],
        ),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('Friday'));
    await tester.tap(find.text('6:00 PM'));
    await tester.tap(find.text('10:00 PM'));
    await tester.tap(find.text('Social event'));
    await tester.ensureVisible(find.text('Save risk period'));
    await tester.tap(find.text('Save risk period'));
    await tester.pumpAndSettle();

    expect(repository.savedWindows, hasLength(1));
    expect(repository.savedWindows.single.daysOfWeek, {DateTime.friday});
    expect(repository.savedWindows.single.startTime, const Duration(hours: 22));
    expect(repository.savedWindows.single.endTime, const Duration(hours: 2));
    expect(repository.savedWindows.single.trigger, RiskTrigger.socialEvent);
  });
}

final _sampleUser = User(
  id: 'current-user',
  displayName: 'Amina',
  createdAt: DateTime(2026, 9, 16),
);

const _samplePlan = ProtectionPlan(
  id: 'current-user-plan',
  userId: 'current-user',
  plannedIncome: 1000,
  currency: 'KES',
  allocations: [
    Allocation(
      id: 'allocation-rent',
      protectionPlanId: 'current-user-plan',
      category: AllocationCategory.rent,
      amount: 1000,
      isProtected: true,
    ),
  ],
);

const _sampleRiskWindow = RiskWindow(
  id: 'current-user-risk-window',
  userId: 'current-user',
  daysOfWeek: {DateTime.friday},
  startTime: Duration(hours: 22),
  endTime: Duration(hours: 2),
  trigger: RiskTrigger.socialEvent,
  enabled: true,
);

const _sampleTrustedContact = TrustedContact(
  id: 'current-user-trusted-contact',
  userId: 'current-user',
  name: 'Njeri',
  phoneNumber: '+254700000001',
);

class _FakeUserRepository implements UserRepository {
  _FakeUserRepository({this.user});

  final User? user;

  @override
  Future<void> deleteById(String id) async {}

  @override
  Future<User?> findById(String id) async => user;

  @override
  Future<void> save(User user) async {}
}

class _FakeProtectionPlanRepository implements ProtectionPlanRepository {
  _FakeProtectionPlanRepository({this.plan});

  final ProtectionPlan? plan;
  final savedPlans = <ProtectionPlan>[];

  @override
  Future<void> deleteById(String id) async {}

  @override
  Future<ProtectionPlan?> findByUserId(String userId) async => plan;

  @override
  Future<void> save(ProtectionPlan plan) async => savedPlans.add(plan);
}

class _FakeRiskWindowRepository implements RiskWindowRepository {
  _FakeRiskWindowRepository({this.windows = const []});

  final List<RiskWindow> windows;
  final savedWindows = <RiskWindow>[];

  @override
  Future<void> deleteById(String id) async {}

  @override
  Future<List<RiskWindow>> listByUserId(String userId) async => windows;

  @override
  Future<void> save(RiskWindow window) async => savedWindows.add(window);
}

class _FakeTrustedContactRepository implements TrustedContactRepository {
  _FakeTrustedContactRepository({this.contacts = const []});

  final List<TrustedContact> contacts;

  @override
  Future<void> deleteById(String id) async {}

  @override
  Future<List<TrustedContact>> listByUserId(String userId) async => contacts;

  @override
  Future<void> save(TrustedContact contact) async {}
}
