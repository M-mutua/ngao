import 'dart:async';
import 'package:flutter/material.dart';
import 'app/app.dart';
import 'core/storage/app_database.dart';
import 'core/storage/drift_repositories/drift_repositories.dart';

void main() {
  final database = AppDatabase();
  final userRepository = DriftUserRepository(database);
  final protectionPlanRepository = DriftProtectionPlanRepository(database);

  runZonedGuarded(
    () => runApp(
      NgaoApp(
        userRepository: userRepository,
        protectionPlanRepository: protectionPlanRepository,
      ),
    ),
    (error, stackTrace) {
      // Phase 1: minimal top-level error capture.
      // Replace with structured logging once core/errors/ is built out in a later phase.
      debugPrint('Uncaught error: $error');
      debugPrint('$stackTrace');
    },
  );
}