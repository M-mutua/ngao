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
