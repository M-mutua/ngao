# Ngao Architecture Log

**Version:** 1.0

This document is an append-only record of meaningful architectural changes made during Ngao development.

---

# Architecture Change A01: Routing via go_router

**Date:** 2026-09-08

## Context

Phase 1 required establishing navigation. The product roadmap anticipates multi-step flows (onboarding, intervention entry points) in later phases that plain `Navigator` handles poorly at scale.

## Previous Approach

None. No navigation architecture existed prior to this milestone.

## New Approach

`go_router` package used for declarative routing, configured in `lib/app/router.dart`. Currently a single route to `HomeScreen`.

## Rationale

Retrofitting a routing solution after multiple features are built is more disruptive than establishing it now, while the cost of adoption is a single stub route.

## Consequences

Adds one external dependency. Future features must register routes through `AppRouter` rather than ad hoc `Navigator` calls, keeping navigation centralized per SDD §3.4 (thin UI principle).

## Related Requirements

SDD §15 (Navigation)

## Related Decisions

None directly; supports Decision 018 (portability) by keeping navigation logic isolated from screen widgets.

## Status

Accepted

---

# Architecture Change A02: Drift/SQLite Local Persistence

**Date:** 2026-09-16

## Context

SDD §7 left the exact local persistence mechanism open. Phase 4 requires structured local persistence with create, read, update, delete, history queries, and current protection-state queries, as specified by SRS FR-023, FR-024, and FR-026.

## Previous Approach

No persistence implementation existed. The repository boundary was defined by SDD §6, but the first concrete storage mechanism had not been selected.

## New Approach

Drift backed by SQLite is the local persistence mechanism. The schema uses one primary table for each persisted aggregate, with dependent tables for aggregate members such as allocations, risk-window days, intervention actions, and spending/reflection records:

* `users`
* `protection_plans` and `allocations`
* `risk_windows` and `risk_window_days`
* `trusted_contacts`
* `sober_messages`
* `intervention_events` and `intervention_actions`
* `spending_events`
* `reflections`

Repository interfaces depend only on the Phase 3 domain models. Drift row types, companions, generated database types, and SQL details remain inside the storage layer and are never exposed through the repository interfaces.

Domain enums are persisted as text using Drift enum columns rather than integer ordinals. `Reflection.interventionEventId` has a unique constraint so an intervention can have at most one reflection. Protection-plan-plus-allocations and intervention-event-plus-actions writes are transactional. Foreign-key cascade deletes remove dependent records from `User` through the related aggregates and their child records.

## Rationale

Drift was chosen over key-value storage because SRS FR-023 and FR-024 require relational history and insight queries across structured records. SQLite provides those query and integrity guarantees while keeping the first client local, consistent with Decision 007 and the deferred backend in Decision 008.

## Consequences

The project adds Drift, `drift_flutter`, `drift_dev`, and `build_runner` dependencies and introduces a code-generation step for the database implementation. Repository abstractions preserve portability under NFR-008 and Decision 018. A future Supabase implementation requires new repository implementations behind the same interfaces rather than a feature-layer rewrite.

The first Android build took roughly 14 minutes and required `flutter clean` because of a stale Gradle incremental-resource cache. This is recorded as a one-time build-environment cost, not a persistence design limitation.

## Related Requirements

SRS FR-023, FR-024, and FR-026; SDD §6, §7, and §13; NFR-008.

## Related Decisions

Decisions 007, 008, 018, and 021. Decision 021 is reflected in the `risk_window_days` table and its source comment describing the day on which a risk window starts.

## Status

Accepted

---
