# Ngao Software Design Document

**Project:** Ngao
**Version:** 1.0
**Status:** MVP Baseline

---

# 1. Purpose

This document defines the technical design for implementing the Ngao MVP.

The SDD describes **how the requirements will be implemented** while preserving portability to future implementations.

The current priority is the Flutter mobile client.

The backend and RevenueCat integrations are deliberately deferred.

---

# 2. Current Architecture

The initial implementation is:

```text
Flutter Client
      |
      v
Application / Domain Logic
      |
      v
Repository Interfaces
      |
      v
Local Persistence
```

Future architecture may become:

```text
Flutter Client
      |
      v
Application / Domain Logic
      |
      v
Repository Interfaces
      |
   +--+------------------+
   |                     |
   v                     v
Local Persistence     Supabase
                         |
                         v
                      Database
```

RevenueCat will later be introduced as an external subscription service.

---

# 3. Architectural Principles

## 3.1 Requirements First

The SRS defines required behavior.

The SDD defines implementation structure.

Technology choices must not redefine product requirements.

---

## 3.2 Local First

The first usable Ngao client shall work without a backend.

Core functionality should therefore operate with local persistence.

---

## 3.3 Replaceable Infrastructure

External dependencies should be isolated.

Examples:

* persistence
* subscription management
* notifications
* audio
* contacts
* future financial integrations

---

## 3.4 Thin UI

Screens should primarily be responsible for:

* presenting state
* receiving user input
* invoking application actions
* displaying results

Business rules should live outside screen widgets.

---

# 4. Suggested Project Structure

The exact Flutter implementation may evolve, but the project should maintain clear separation.

```text
lib/
  app/
    app.dart
    router.dart
    theme/

  core/
    errors/
    constants/
    utils/
    storage/

  shared/
    widgets/
    models/

  features/
    onboarding/
    home/
    protection/
    risk/
    intervention/
    spending/
    reflection/
    insights/
    settings/
```

Do not introduce folders merely to satisfy a pattern.

Responsibilities should remain clear.

---

# 5. Domain Concepts

The core domain entities are:

```text
User
ProtectionPlan
Allocation
RiskWindow
TrustedContact
SoberMessage
InterventionEvent
SpendingEvent
Reflection
```

The domain model should not depend directly on Flutter widgets.

---

# 6. Repository Boundary

The application should use repository abstractions.

Conceptually:

```text
ProtectionPlanRepository
RiskWindowRepository
InterventionRepository
SpendingRepository
ReflectionRepository
TrustedContactRepository
```

The first implementation uses local persistence.

Later implementations may use Supabase.

The feature logic should not need to know whether data came from local storage or a remote backend.

---

# 7. Persistence

The first version shall use a local persistence mechanism appropriate for structured application data.

The implementation may use a local database or local storage solution based on project requirements.

Persistence should support:

* create
* read
* update
* delete
* querying history
* retrieving current protection state

Do not scatter direct persistence calls throughout UI code.

---

# 8. Financial Logic

Core financial calculations should exist independently of UI.

For example:

```text
totalAllocated =
sum(allocation.amount)
```

and:

```text
remaining =
plannedIncome - totalAllocated
```

Flexible spending should be calculated from the defined flexible allocation and relevant spending events.

Validation shall prevent allocations from exceeding the planned income.

---

# 9. Risk Logic

The MVP shall use deterministic rules.

A risk window may be represented using:

```text
dayOfWeek
startTime
endTime
trigger
enabled
```

The application shall determine whether a configured risk window is upcoming or active.

The implementation must not imply predictive machine learning.

---

# 10. Cooldown Logic

Cooldown should use timestamps.

Conceptually:

```text
startedAt
duration
endsAt
```

Remaining time:

```text
remaining = endsAt - currentTime
```

The rendered countdown is not the source of truth.

This ensures that the cooldown remains logically correct after temporary app backgrounding.

---

# 11. Intervention State

The intervention system should model states explicitly.

Example:

```text
Idle
  ↓
Started
  ↓
CooldownActive
  ↓
CooldownCompleted
  ↓
ReflectionPending
  ↓
Completed
```

Additional actions such as trusted contact, sober message, plan review, or environment change should be recorded as intervention events rather than being treated as independent unrelated features.

---

# 12. Financial Friction Logic

Conceptually:

```text
Attempted spending
        |
        v
Compare with flexible amount
        |
  +-----+------+
  |            |
Within       Exceeds
budget       budget
  |            |
  v            v
Continue     Warning
                |
         +------+------+
         |             |
       Cancel       Override
                       |
                       v
                 Confirmation
                       |
                       v
                Record event
```

The system is not a real banking control.

It is a behavioral friction mechanism for the MVP.

---

# 13. Reflection Design

A reflection belongs to an intervention event.

Relationship:

```text
InterventionEvent
        |
        v
Reflection
```

This allows the system to understand what happened around a particular difficult moment.

---

# 14. Insights Design

The MVP uses rule based insight generation.

Inputs may include:

* intervention dates
* risk windows
* triggers
* payday proximity
* spending events
* cooldown outcomes

Output examples:

```text
Friday evenings appear frequently in your difficult moments.

Several recorded urges occurred close to payday.

Cooldowns appear to be one of the interventions you use most often.
```

These are descriptive observations, not medical predictions.

---

# 15. Navigation

Primary navigation:

```text
Home
Protection
Intervene
Insights
```

Settings should remain accessible without competing with the main navigation.

The intervention experience should always be reachable quickly from Home.

---

# 16. Home Design

Home should answer:

**What am I protecting?**

**When is my next difficult period?**

**What can I do right now?**

The order of information should prioritize:

1. protection status
2. upcoming risk
3. immediate intervention
4. trusted person

---

# 17. Intervention Design

The intervention experience should minimize cognitive load.

The primary hierarchy should be:

```text
Don't decide yet.

30:00

Start cooldown

Play sober message

Contact trusted person

Review my protection

Leave this situation
```

The interface should avoid unnecessary navigation during an intervention.

---

# 18. Theme

Primary visual direction:

**Deep teal on warm off white**

Normal interface:

* calm
* light
* spacious
* trustworthy

Intervention interface:

* darker
* calmer
* minimal
* focused

The theme must be centralized so it can be changed without rewriting screens.

---

# 19. Privacy Design

The application deals with sensitive information.

Prefer minimizing cloud transfer and local exposure.

The initial client should avoid unnecessary external transmission.

Detailed private reflections and audio may remain local during the MVP.

The system should not log sensitive financial or behavioral information unnecessarily.

---

# 20. Future Supabase Boundary

When the backend is introduced, the expected model is:

```text
Application Logic
        |
Repository
        |
Supabase Adapter
        |
Supabase
```

The application should not require a complete feature rewrite merely because persistence moves from local to cloud.

Future Supabase capabilities may include:

* authentication
* database persistence
* Row Level Security
* synchronization
* server side functions

---

# 21. Future RevenueCat Boundary

RevenueCat should later be introduced behind:

```text
SubscriptionService
        |
        v
RevenueCat implementation
```

The application should not directly scatter RevenueCat calls throughout feature screens.

Future RevenueCat integration will use:

* real SDK
* sandbox during development
* production configuration later
* entitlement based premium access

Expected entitlement:

**ngao_pro**

---

# 22. Future Financial Integration Boundary

Real financial integrations should be isolated behind a financial service boundary.

Future architecture may become:

```text
Ngao Application
      |
FinancialService
      |
+-----+----------------+
|                      |
M-Pesa              Bank API
```

The MVP shall not implement this.

---

# 23. Security

The client shall never contain:

* database passwords
* service role credentials
* privileged backend secrets
* RevenueCat secret credentials

Future server-side credentials belong in trusted backend environments.

---

# 24. Testing

The implementation should eventually include:

### Unit tests

* allocation validation
* financial calculations
* risk window logic
* cooldown calculations
* spending friction rules
* insight rules

### Integration tests

* persistence
* onboarding flow
* intervention persistence
* spending events
* reflection persistence

### UI tests

Critical flows:

* onboarding
* Home
* Protection
* intervention
* spending warning
* reflection

---

# 25. Migration Strategy

The initial application is:

```text
Flutter
+
Local persistence
```

Then:

```text
Flutter
+
Local persistence
+
Supabase
```

Then:

```text
Flutter
+
Supabase
+
RevenueCat
```

Then potentially:

```text
Flutter
+
Supabase
+
RevenueCat
+
Financial integrations
```

Each stage should add infrastructure without forcing a rewrite of the product's core logic.

---

# 26. Design Principle

The technical architecture should preserve:

> **Sober-you already knows what matters. Ngao helps protect it.**

