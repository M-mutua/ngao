import 'dart:io';

import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ngao/core/storage/app_database.dart' as storage;
import 'package:ngao/core/storage/drift_repositories/drift_repositories.dart';
import 'package:ngao/shared/models/allocation.dart';
import 'package:ngao/shared/models/domain_enums.dart';
import 'package:ngao/shared/models/intervention_event.dart';
import 'package:ngao/shared/models/protection_plan.dart';
import 'package:ngao/shared/models/reflection.dart';
import 'package:ngao/shared/models/risk_window.dart';
import 'package:ngao/shared/models/sober_message.dart';
import 'package:ngao/shared/models/spending_event.dart';
import 'package:ngao/shared/models/trusted_contact.dart';
import 'package:ngao/shared/models/user.dart';

void main() {
  late Directory databaseDirectory;
  late storage.AppDatabase database;

  setUp(() async {
    databaseDirectory = Directory.systemTemp.createTempSync('ngao-storage-test-');
    database = storage.AppDatabase(
      NativeDatabase(File('${databaseDirectory.path}/ngao.sqlite')),
    );
    await DriftUserRepository(database).save(
      User(
        id: 'user-1',
        displayName: 'Amina',
        createdAt: DateTime(2026, 9, 16),
      ),
    );
  });

  tearDown(() async {
    await database.close();
    await databaseDirectory.delete(recursive: true);
  });

  test('persists user CRUD', () async {
    final repository = DriftUserRepository(database);
    final user = User(
      id: 'user-1',
      displayName: 'Amina',
      createdAt: DateTime(2026, 9, 16, 8),
    );

    await repository.save(user);
    expect(await repository.findById(user.id), isA<User>());

    final updated = User(
      id: user.id,
      displayName: 'Amina Wanjiku',
      createdAt: user.createdAt,
    );
    await repository.save(updated);
    expect((await repository.findById(user.id))?.displayName, 'Amina Wanjiku');

    await repository.deleteById(user.id);
    expect(await repository.findById(user.id), isNull);
  });

  test('persists protection plan and allocations as one aggregate', () async {
    final userRepository = DriftUserRepository(database);
    final repository = DriftProtectionPlanRepository(database);
    await userRepository.save(
      User(
        id: 'user-1',
        displayName: 'Amina',
        createdAt: DateTime(2026, 9, 16),
      ),
    );
    final plan = ProtectionPlan(
      id: 'plan-1',
      userId: 'user-1',
      plannedIncome: 50000,
      currency: 'KES',
      allocations: const [
        Allocation(
          id: 'allocation-rent',
          protectionPlanId: 'plan-1',
          category: AllocationCategory.rent,
          amount: 30000,
          isProtected: true,
        ),
        Allocation(
          id: 'allocation-flexible',
          protectionPlanId: 'plan-1',
          category: AllocationCategory.flexible,
          amount: 20000,
          isProtected: false,
        ),
      ],
    );

    await repository.save(plan);
    final restored = await repository.findByUserId('user-1');
    expect(restored?.plannedIncome, 50000);
    expect(restored?.allocations, hasLength(2));
    expect(restored?.allocations.map((allocation) => allocation.category),
        containsAll([AllocationCategory.rent, AllocationCategory.flexible]));

    await repository.deleteById(plan.id);
    expect(await repository.findByUserId('user-1'), isNull);
  });

  test('persists risk windows and returns user history', () async {
    final repository = DriftRiskWindowRepository(database);
    final first = RiskWindow(
      id: 'risk-1',
      userId: 'user-1',
      daysOfWeek: {1, 5},
      startTime: const Duration(hours: 18),
      endTime: const Duration(hours: 23),
      trigger: RiskTrigger.payday,
      enabled: true,
    );
    final second = RiskWindow(
      id: 'risk-2',
      userId: 'user-1',
      daysOfWeek: {6},
      startTime: const Duration(hours: 12),
      endTime: const Duration(hours: 16),
      trigger: RiskTrigger.socialEvent,
      enabled: false,
    );

    await repository.save(first);
    await repository.save(second);
    final history = await repository.listByUserId('user-1');
    expect(history, hasLength(2));
    expect(history.map((window) => window.id), containsAll(['risk-1', 'risk-2']));

    await repository.deleteById(first.id);
    expect((await repository.listByUserId('user-1')).map((window) => window.id),
        isNot(contains('risk-1')));
  });

  test('persists trusted-contact CRUD', () async {
    final repository = DriftTrustedContactRepository(database);
    const contact = TrustedContact(
      id: 'contact-1',
      userId: 'user-1',
      name: 'Njeri',
      phoneNumber: '+254700000001',
    );

    await repository.save(contact);
    final restored = (await repository.listByUserId('user-1')).single;
    expect(restored.id, contact.id);
    expect(restored.name, contact.name);
    expect(restored.phoneNumber, contact.phoneNumber);
    await repository.deleteById(contact.id);
    expect(await repository.listByUserId('user-1'), isEmpty);
  });

  test('persists sober-message CRUD', () async {
    final repository = DriftSoberMessageRepository(database);
    final message = SoberMessage(
      id: 'message-1',
      userId: 'user-1',
      type: SoberMessageType.text,
      content: 'Protect tomorrow morning.',
      createdAt: DateTime(2026, 9, 16, 9),
    );

    await repository.save(message);
    final restored = (await repository.listByUserId('user-1')).single;
    expect(restored.id, message.id);
    expect(restored.type, message.type);
    expect(restored.content, message.content);
    expect(restored.createdAt, message.createdAt);
    await repository.deleteById(message.id);
    expect(await repository.listByUserId('user-1'), isEmpty);
  });

  test('persists intervention and actions as one aggregate', () async {
    final repository = DriftInterventionRepository(database);
    final intervention = InterventionEvent(
      id: 'intervention-1',
      userId: 'user-1',
      startedAt: DateTime(2026, 9, 16, 20),
      cooldownDuration: const Duration(minutes: 30),
      state: InterventionState.started,
      actions: [
        InterventionAction(
          type: InterventionActionType.soberMessagePlayed,
          recordedAt: DateTime(2026, 9, 16, 20, 1),
        ),
        InterventionAction(
          type: InterventionActionType.planReviewed,
          recordedAt: DateTime(2026, 9, 16, 20, 2),
        ),
      ],
    );

    await repository.save(intervention);
    final restored = await repository.findLatestActiveByUserId('user-1');
    expect(restored?.id, intervention.id);
    expect(restored?.actions, hasLength(2));
    expect(restored?.actions.map((action) => action.type), containsAll([
      InterventionActionType.soberMessagePlayed,
      InterventionActionType.planReviewed,
    ]));

    await repository.deleteById(intervention.id);
    expect(await repository.listByUserId('user-1'), isEmpty);
  });

  test('current-state query excludes completed interventions', () async {
    final repository = DriftInterventionRepository(database);
    final completed = InterventionEvent(
      id: 'intervention-completed',
      userId: 'user-1',
      startedAt: DateTime(2026, 9, 16, 18),
      cooldownDuration: const Duration(minutes: 30),
      state: InterventionState.completed,
      actions: const [],
      completedAt: DateTime(2026, 9, 16, 18, 30),
    );
    final active = InterventionEvent(
      id: 'intervention-active',
      userId: 'user-1',
      startedAt: DateTime(2026, 9, 16, 19),
      cooldownDuration: const Duration(minutes: 30),
      state: InterventionState.cooldownActive,
      actions: const [],
    );

    await repository.save(completed);
    await repository.save(active);
    expect((await repository.findLatestActiveByUserId('user-1'))?.id,
        active.id);
  });

  test('persists spending events and returns plan history', () async {
    await DriftProtectionPlanRepository(database).save(
      const ProtectionPlan(
        id: 'plan-1',
        userId: 'user-1',
        plannedIncome: 50000,
        currency: 'KES',
        allocations: [],
      ),
    );
    final repository = DriftSpendingRepository(database);
    final first = SpendingEvent(
      id: 'spending-1',
      userId: 'user-1',
      protectionPlanId: 'plan-1',
      amount: 7000,
      category: AllocationCategory.flexible,
      occurredAt: DateTime(2026, 9, 15),
      overrideState: OverrideState.none,
    );
    final second = SpendingEvent(
      id: 'spending-2',
      userId: 'user-1',
      protectionPlanId: 'plan-1',
      amount: 3000,
      category: AllocationCategory.food,
      occurredAt: DateTime(2026, 9, 16),
      overrideState: OverrideState.overridden,
    );

    await repository.save(first);
    await repository.save(second);
    expect(await repository.listByProtectionPlanId('plan-1'), hasLength(2));
    expect(await repository.listByUserId('user-1'), hasLength(2));

    await repository.deleteById(first.id);
    expect((await repository.listByProtectionPlanId('plan-1')).single.id,
        second.id);
  });

  test('persists reflection CRUD', () async {
    await DriftInterventionRepository(database).save(
      InterventionEvent(
        id: 'intervention-1',
        userId: 'user-1',
        startedAt: DateTime(2026, 9, 16, 20),
        cooldownDuration: const Duration(minutes: 30),
        state: InterventionState.completed,
        actions: const [],
        completedAt: DateTime(2026, 9, 16, 20, 30),
      ),
    );
    final repository = DriftReflectionRepository(database);
    final reflection = Reflection(
      id: 'reflection-1',
      interventionEventId: 'intervention-1',
      trigger: RiskTrigger.stress,
      spendingStatus: ReflectionSpendingStatus.spent,
      amountSpent: 2500,
      whatHelped: 'Calling a friend',
      notes: 'The pause helped.',
      createdAt: DateTime(2026, 9, 16, 21),
    );

    await repository.save(reflection);
    expect(await repository.findByInterventionEventId('intervention-1'),
        isA<Reflection>());
    await repository.deleteById(reflection.id);
    expect(await repository.findByInterventionEventId('intervention-1'), isNull);
  });

  test('rejects a second reflection for the same intervention event', () async {
    await DriftInterventionRepository(database).save(
      InterventionEvent(
        id: 'intervention-1',
        userId: 'user-1',
        startedAt: DateTime(2026, 9, 16, 20),
        cooldownDuration: const Duration(minutes: 30),
        state: InterventionState.completed,
        actions: const [],
        completedAt: DateTime(2026, 9, 16, 20, 30),
      ),
    );
    final repository = DriftReflectionRepository(database);
    final first = Reflection(
      id: 'reflection-1',
      interventionEventId: 'intervention-1',
      trigger: RiskTrigger.stress,
      spendingStatus: ReflectionSpendingStatus.noSpending,
      amountSpent: null,
      whatHelped: 'Breathing',
      createdAt: DateTime(2026, 9, 16, 21),
    );
    final second = Reflection(
      id: 'reflection-2',
      interventionEventId: first.interventionEventId,
      trigger: RiskTrigger.loneliness,
      spendingStatus: ReflectionSpendingStatus.spent,
      amountSpent: 1000,
      whatHelped: 'Walking',
      createdAt: DateTime(2026, 9, 16, 22),
    );

    await repository.save(first);
    await expectLater(repository.save(second), throwsA(anything));
  });

  test('retains repository data after closing and reopening the file database', () async {
    final path = '${databaseDirectory.path}/ngao.sqlite';
    final user = User(
      id: 'persistent-user',
      displayName: 'Persisted User',
      createdAt: DateTime(2026, 9, 16),
    );
    await DriftUserRepository(database).save(user);
    await database.close();

    database = storage.AppDatabase(NativeDatabase(File(path)));
    expect((await DriftUserRepository(database).findById(user.id))?.displayName,
        user.displayName);
  });
}
