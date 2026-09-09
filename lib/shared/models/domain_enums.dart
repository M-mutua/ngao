/// Categories available for a protection-plan allocation or spending record.
enum AllocationCategory {
  rent,
  family,
  savings,
  emergency,
  debt,
  food,
  education,
  flexible,
  other,
}

/// Deterministic risk triggers supported by the MVP.
enum RiskTrigger {
  payday,
  stress,
  argument,
  loneliness,
  socialEvent,
  alcoholAvailability,
  workPressure,
  unexpectedMoney,
  other,
}

enum SoberMessageType { text, audio }

/// The lifecycle of one intervention session.
enum InterventionState {
  idle,
  started,
  cooldownActive,
  cooldownCompleted,
  reflectionPending,
  completed,
}

/// A timestamped action completed during an intervention session.
enum InterventionActionType {
  soberMessagePlayed,
  trustedContactReached,
  planReviewed,
  environmentChanged,
}

/// Whether the user deliberately continued despite a protection warning.
enum OverrideState { none, overridden }

enum ReflectionSpendingStatus { noSpending, spent }
