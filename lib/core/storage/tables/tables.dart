import 'package:drift/drift.dart';

import '../../../shared/models/domain_enums.dart';

class Users extends Table {
  TextColumn get id => text()();
  TextColumn get displayName => text()();
  DateTimeColumn get createdAt => dateTime()();
  @override
  Set<Column<Object>> get primaryKey => {id};
}

class ProtectionPlans extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text().references(Users, #id, onDelete: KeyAction.cascade)();
  IntColumn get plannedIncome => integer()();
  TextColumn get currency => text()();
  @override
  Set<Column<Object>> get primaryKey => {id};
}

class Allocations extends Table {
  TextColumn get id => text()();
  TextColumn get protectionPlanId => text().references(ProtectionPlans, #id, onDelete: KeyAction.cascade)();
  TextColumn get category => textEnum<AllocationCategory>()();
  IntColumn get amount => integer()();
  BoolColumn get isProtected => boolean()();
  @override
  Set<Column<Object>> get primaryKey => {id};
}

class RiskWindows extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text().references(Users, #id, onDelete: KeyAction.cascade)();
  IntColumn get startTimeMicroseconds => integer()();
  IntColumn get endTimeMicroseconds => integer()();
  TextColumn get trigger => textEnum<RiskTrigger>()();
  BoolColumn get enabled => boolean()();
  @override
  Set<Column<Object>> get primaryKey => {id};
}

class RiskWindowDays extends Table {
  /// Decision 021: stored days are days on which a risk window starts, not every day it is active.
  TextColumn get riskWindowId => text().references(RiskWindows, #id, onDelete: KeyAction.cascade)();
  IntColumn get dayOfWeek => integer()();
  @override
  Set<Column<Object>> get primaryKey => {riskWindowId, dayOfWeek};
}

class TrustedContacts extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text().references(Users, #id, onDelete: KeyAction.cascade)();
  TextColumn get name => text()();
  TextColumn get phoneNumber => text()();
  @override
  Set<Column<Object>> get primaryKey => {id};
}

class SoberMessages extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text().references(Users, #id, onDelete: KeyAction.cascade)();
  TextColumn get type => textEnum<SoberMessageType>()();
  TextColumn get content => text()();
  DateTimeColumn get createdAt => dateTime()();
  @override
  Set<Column<Object>> get primaryKey => {id};
}

class InterventionEvents extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text().references(Users, #id, onDelete: KeyAction.cascade)();
  DateTimeColumn get startedAt => dateTime()();
  IntColumn get cooldownMicroseconds => integer()();
  TextColumn get state => textEnum<InterventionState>()();
  DateTimeColumn get completedAt => dateTime().nullable()();
  @override
  Set<Column<Object>> get primaryKey => {id};
}

class InterventionActions extends Table {
  TextColumn get id => text()();
  TextColumn get interventionEventId => text().references(InterventionEvents, #id, onDelete: KeyAction.cascade)();
  TextColumn get type => textEnum<InterventionActionType>()();
  DateTimeColumn get recordedAt => dateTime()();
  @override
  Set<Column<Object>> get primaryKey => {id};
}

class SpendingEvents extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text().references(Users, #id, onDelete: KeyAction.cascade)();
  TextColumn get protectionPlanId => text().references(ProtectionPlans, #id, onDelete: KeyAction.cascade)();
  IntColumn get amount => integer()();
  TextColumn get category => textEnum<AllocationCategory>()();
  DateTimeColumn get occurredAt => dateTime()();
  TextColumn get overrideState => textEnum<OverrideState>()();
  @override
  Set<Column<Object>> get primaryKey => {id};
}

class Reflections extends Table {
  TextColumn get id => text()();
  TextColumn get interventionEventId => text().references(InterventionEvents, #id, onDelete: KeyAction.cascade)();
  TextColumn get trigger => textEnum<RiskTrigger>()();
  TextColumn get spendingStatus => textEnum<ReflectionSpendingStatus>()();
  IntColumn get amountSpent => integer().nullable()();
  TextColumn get whatHelped => text()();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  @override
  Set<Column<Object>> get primaryKey => {id};
  @override
  List<Set<Column<Object>>> get uniqueKeys => [{interventionEventId}];
}
