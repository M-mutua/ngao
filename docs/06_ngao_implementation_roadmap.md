# Ngao Implementation Roadmap

**Version:** 1.0
**Status:** Current

---

# 1. Objective

Build a complete and usable Ngao mobile MVP locally before introducing backend infrastructure or subscription infrastructure.

The implementation should proceed incrementally.

Each phase should end with a working state.

---

# Phase 0: Product Baseline

**Status:** Complete

Completed:

* product concept
* product vision
* SRS
* SDD
* MVP scope
* decision log
* core user journey
* initial visual direction

---

# Phase 1: Flutter Foundation

**Status:** Next

Objectives:

* create Flutter project
* configure application identity
* establish application entry point
* establish navigation
* establish base theme
* establish project structure
* configure development environment
* establish basic error handling

Deliverable:

A running Ngao application with working navigation and theme.

---

# Phase 2: Design System

**Status:** Pending

Objectives:

* establish color tokens
* establish typography
* establish spacing
* establish radius
* establish elevation
* establish component conventions
* create reusable buttons
* create reusable cards
* create inputs
* create status indicators

Deliverable:

A consistent visual language used across the application.

---

# Phase 3: Domain Models

**Status:** Pending

Implement core entities:

* User
* ProtectionPlan
* Allocation
* RiskWindow
* TrustedContact
* SoberMessage
* InterventionEvent
* SpendingEvent
* Reflection

Implement validation and domain rules.

Deliverable:

Testable application/domain models independent from screens.

---

# Phase 4: Local Persistence

**Status:** Pending

Implement the first local persistence solution.

Requirements:

* reliable reads
* reliable writes
* update support
* deletion
* querying history
* session restoration

Introduce repository abstractions.

Deliverable:

Core application information survives application restart.

---

# Phase 5: Onboarding

**Status:** Pending

Build:

* welcome
* personal information
* financial priorities
* risk triggers
* risk period
* trusted person
* protection plan

Deliverable:

A new user can complete onboarding and reach Home with real locally persisted data.

---

# Phase 6: Protection Plan

**Status:** Pending

Build:

* income
* allocations
* protected allocations
* flexible allocation
* total calculation
* remaining calculation
* validation
* editing

Deliverable:

A complete functioning protection plan.

---

# Phase 7: Home

**Status:** Pending

Build:

* protection summary
* upcoming risk period
* protection activation
* immediate intervention action
* trusted person access

Deliverable:

Home clearly communicates the current state of the user's protection plan.

---

# Phase 8: Risk Periods

**Status:** Pending

Build:

* risk period creation
* risk period editing
* trigger configuration
* upcoming risk calculation
* active risk state
* protection activation

Deliverable:

The application can identify the user's configured high risk periods.

---

# Phase 9: Intervention

**Status:** Pending

Build:

* intervention entry
* cooldown
* sober message
* trusted person
* protection review
* environment change

Spend significant design effort here.

Deliverable:

A user can move from "I'm feeling the urge" to a coherent intervention experience.

---

# Phase 10: Financial Friction

**Status:** Pending

Build:

* spending entry
* flexible spending calculation
* protection warnings
* explicit override
* override persistence

Deliverable:

Ngao creates deliberate friction around spending decisions that conflict with the protection plan.

---

# Phase 11: Reflection

**Status:** Pending

Build:

* trigger
* spending outcome
* amount
* what helped
* notes
* association with intervention

Deliverable:

The user can complete a post-event reflection.

---

# Phase 12: History and Insights

**Status:** Pending

Build:

* event history
* intervention history
* spending history
* simple rule-based insights
* pattern suggestions

Deliverable:

The user can understand what has happened and identify recurring patterns.

---

# Phase 13: Settings and Privacy

**Status:** Pending

Build:

* profile
* trusted person
* risk periods
* sober message
* privacy
* delete data
* about

Deliverable:

The MVP has a complete settings experience and basic privacy controls.

---

# Phase 14: Quality

**Status:** Pending

Perform:

* unit testing
* integration testing
* UI testing
* error handling
* accessibility review
* performance review
* offline behavior review
* state restoration testing

Deliverable:

The complete MVP survives the acceptance scenario reliably.

---

# Phase 15: UX Polish

**Status:** Pending

Review:

* navigation
* typography
* spacing
* transitions
* loading states
* empty states
* error states
* intervention experience
* micro interactions

Deliverable:

Ngao feels like a coherent consumer product rather than a student prototype.

---

# Phase 16: RevenueCat

**Status:** Deferred

Only begin after the core MVP is functional.

Implement:

* RevenueCat SDK
* development sandbox
* offerings
* products
* `ngao_pro` entitlement
* purchase
* restore
* premium feature gating

Maintain an abstraction between the product and RevenueCat.

Deliverable:

A real sandbox subscription experience.

---

# Phase 17: Backend

**Status:** Deferred

Evaluate backend requirements after the mobile MVP is stable.

Potential implementation:

* Supabase Auth
* PostgreSQL
* Row Level Security
* remote persistence
* server side functions where necessary

Migrate one domain capability at a time.

Deliverable:

Remote persistence without a major rewrite of the client.

---

# Phase 18: Production Preparation

**Status:** Future**

Potential work:

* production backend
* production RevenueCat
* app signing
* store configuration
* privacy documentation
* release builds
* analytics
* monitoring
* crash reporting
* production notifications
* security review

---

# 2. Current Priority

The immediate objective is:

> **Complete the local Flutter MVP before adding RevenueCat or backend infrastructure.**

---

# 3. Development Rule

Do not jump ahead merely because a future technology is known.

For example:

Do not add Supabase because the final architecture may use Supabase.

Do not add RevenueCat because Ngao will eventually have subscriptions.

Build the core product first.

---

# 4. Milestone Rule

Do not mark a phase complete because code has been written.

A phase is complete when:

* its acceptance criteria work
* relevant tests pass
* the feature behaves correctly on a real device/emulator
* no known critical regression remains
* important architectural decisions are documented

---

# 5. Current State

Current phase:

**Phase 1: Flutter Foundation**

Next major milestone:

**A running Flutter Ngao client with navigation, theme, and project structure established.**

