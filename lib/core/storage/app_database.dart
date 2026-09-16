import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import '../../shared/models/domain_enums.dart';
import 'tables/tables.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [
  Users,
  ProtectionPlans,
  Allocations,
  RiskWindows,
  RiskWindowDays,
  TrustedContacts,
  SoberMessages,
  InterventionEvents,
  InterventionActions,
  SpendingEvents,
  Reflections,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? driftDatabase(name: 'ngao'));

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (migrator) => migrator.createAll(),
    beforeOpen: (details) async => customStatement('PRAGMA foreign_keys = ON'),
  );
}
