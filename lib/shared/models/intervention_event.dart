import 'domain_enums.dart';

class InterventionAction {
  const InterventionAction({required this.type, required this.recordedAt});

  final InterventionActionType type;
  final DateTime recordedAt;
}

class InterventionEvent {
  const InterventionEvent({
    required this.id,
    required this.userId,
    required this.startedAt,
    required this.cooldownDuration,
    required this.state,
    required this.actions,
    this.completedAt,
  });

  final String id;
  final String userId;
  final DateTime startedAt;
  final Duration cooldownDuration;
  final InterventionState state;
  final List<InterventionAction> actions;
  final DateTime? completedAt;
}
