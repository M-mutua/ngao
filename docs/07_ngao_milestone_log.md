# Ngao Milestone Log

**Version:** 1.0

---

# Milestone M01: Flutter Foundation

**Date:** 2026-09-08

**Status:** COMPLETE

## Objective

Establish a running Flutter Ngao application with working navigation, base theme, and project structure, per Roadmap Phase 1.

## Implemented

* Flutter project created with identifier `com.ngao.ngao`
* Project structure per SDD §4 (`app/`, `core/`, `shared/`, `features/`)
* App entry point (`main.dart`) with top-level error capture via `runZonedGuarded`
* Routing established using `go_router`, single stub route to Home
* Centralized theme (`app_theme.dart`) implementing deep teal on warm off-white per Decision 016
* Stub `HomeScreen` widget

## Tested

* App launched on developer's local emulator/device
* Result: launched without errors, reached Home screen
* Result: theme (warm off-white background, deep teal accents) rendered as expected

## Verification Evidence

Developer confirmed local run: app launches cleanly, no console errors, navigates to Home, theme colors visible as specified.

## Deviations

None from Phase 1 scope as defined in the roadmap.

## Decisions Introduced

Decision 020 (package identifier)

## Known Issues

None.

## Next Milestone

Phase 2: Design System (color tokens, typography, spacing, reusable components).

---
---

# Milestone M02: Design System

**Date:** 2026-09-08

**Status:** COMPLETE

## Objective

Establish a consistent visual language (color tokens, typography, spacing, radius, reusable components, intervention mode variant) per Roadmap Phase 2.

## Implemented

* Design tokens (`design_tokens.dart`): color palette, spacing scale, radius scale
* Standard theme and intervention mode theme (`app_theme.dart`)
* Reusable components: `NgaoButton`, `NgaoCard`, `NgaoTextField`, `NgaoStatusIndicator`
* Temporary component showcase screen (`/showcase` route) for visual verification, reachable via a dev-only button on Home
* `NgaoStatusIndicator` pairs icon and text per NFR-006 (no color-only status)

## Tested

* Showcase screen reviewed on developer's local emulator/device
* Result: standard theme renders correctly (warm off-white background, deep teal accents, card borders visible)
* Result: intervention mode toggle switches to dark teal palette with legible light text and controls

## Verification Evidence

Developer confirmed local run: navigated Home to showcase via new button, reviewed both theme variants, confirmed correct rendering.

## Deviations

None from Phase 2 scope as defined in the roadmap.

## Decisions Introduced

None. Palette and component choices treated as design execution under existing Decision 016, not a new product decision.

## Known Issues

Showcase screen and its route are dev-only and must be removed before Phase 18 (Production Preparation).

## Next Milestone

Phase 3: Domain Models.

---

# Milestone M03: Domain Models

**Date:** 2026-09-09

**Status:** COMPLETE

## Objective

Implement testable, framework-independent domain entities and business rules per Roadmap Phase 3 and SDD §5.

## Implemented

* Pure Dart domain entities: `User`, `ProtectionPlan`, `Allocation`, `RiskWindow`, `TrustedContact`, `SoberMessage`, `InterventionEvent`, `SpendingEvent`, and `Reflection`
* Closed domain enums for allocation categories, risk triggers, sober-message types, intervention states and actions, override state, and reflection spending status
* Timestamped intervention actions attached to one intervention session event
* Financial rules: total allocation, remaining income, flexible amount, relevant flexible spending, and spending-warning calculations
* Validation and deterministic domain rules for currency, amounts, protection plans, risk windows, cooldowns, intervention transitions, and reflections
* Fixed MVP currency constant: `KES`

## Tested

* Developer performed local verification
* Result: implementation works correctly in the local development environment

## Verification Evidence

Developer confirmed: "works fine".

## Deviations

None from Phase 3 scope as defined in the roadmap. Risk windows intentionally require an end time after the start time within the same day; overnight windows are not represented.

## Decisions Introduced

None. Whole-KES integer amounts and same-day risk windows are implementation details within the approved Phase 3 model design, not new product decisions.

## Known Issues

None.

## Next Milestone

Phase 4: Local Persistence.

---

# Milestone M04: Local Persistence

**Date:** 2026-09-16

**Status:** COMPLETE

## Objective

Implement reliable local persistence for the Phase 4 objectives in the roadmap and SDD §6–7, including repository abstractions, CRUD, history queries, current-state queries, and data survival across a database close and reopen.

## Implemented

* Drift/SQLite database and generated database code
* Tables for users, protection plans, allocations, risk windows, risk-window days, trusted contacts, sober messages, intervention events, intervention actions, spending events, and reflections
* `risk_window_days` table with the Decision 021 source comment that stored days are the days on which a risk window starts
* Repository interfaces using only Phase 3 domain models
* Drift-backed repository implementations kept inside the storage layer
* Transactional protection-plan-plus-allocations writes
* Transactional intervention-event-plus-actions writes
* Reflection uniqueness constraint on `interventionEventId`
* Enum persistence as text and foreign-key cascade deletion through dependent records

## Tested

* 11/11 repository persistence tests passed:
	* user CRUD
	* protection-plan-plus-allocations aggregate persistence
	* risk-window history query and deletion
	* trusted-contact CRUD
	* sober-message CRUD
	* intervention-event-plus-actions aggregate persistence
	* current active-intervention query excluding completed events
	* spending history queries by user and protection plan
	* reflection CRUD
	* rejection of a second reflection for the same intervention event
	* file-backed database close, reopen, and read-back persistence
* Full test suite: 20/20 passed, up from 9 tests before the Phase 4 repository suite was added
* `flutter analyze`: clean, with no issues found
* Android app built and launched successfully on the Samsung SM-A145F after `flutter clean` resolved an unrelated stale Gradle incremental-resource cache

## Verification Evidence

The automated repository suite verifies that data written to a file-backed SQLite database remains available after closing and reopening the database. This proves persistence at the automated file-backed test level.

No manual on-device check of data surviving an app restart was performed. The Samsung SM-A145F verification confirms build and launch success only; data survival after a physical-device app restart remains for developer confirmation.

## Deviations

None from Phase 4 scope.

## Decisions Introduced

None. The persistence technology and schema decisions are recorded as Architecture Change A02, not as a new product decision.

## Known Issues

No manual on-device restart-persistence check has been performed. Automated file-backed persistence is verified; physical-device restart survival remains unverified until developer confirmation.

## Next Milestone

Phase 5: Onboarding.

---
