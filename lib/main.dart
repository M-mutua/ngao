import 'dart:async';

import 'package:flutter/material.dart';
import 'app/app.dart';

void main() {
  runZonedGuarded(
    () => runApp(const NgaoApp()),
    (error, stackTrace) {
      // Phase 1: minimal top-level error capture.
      // Replace with structured logging once core/errors/ is built out in a later phase.
      debugPrint('Uncaught error: $error');
      debugPrint('$stackTrace');
    },
  );
}