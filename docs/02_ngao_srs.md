# Ngao Software Requirements Specification

**Project:** Ngao
**Version:** 1.0
**Status:** MVP Baseline

---

# 1. Purpose

This document defines the functional and non-functional requirements for the Ngao MVP.

The SRS defines **what Ngao must do**, independently of the implementation technology.

The initial client will be implemented in Flutter, but these requirements must remain valid if the client is later rebuilt using another technology.

---

# 2. Scope

## 2.1 In Scope

The MVP shall support:

* user onboarding
* user profile
* financial protection plans
* financial allocations
* risk periods
* trigger configuration
* trusted person configuration
* sober messages
* intervention activation
* cooldowns
* intervention actions
* spending recording
* financial friction
* explicit protection overrides
* intervention history
* post-event reflection
* simple pattern insights
* settings
* local persistence

## 2.2 Deferred

The following are intentionally deferred:

* Supabase backend
* RevenueCat
* subscription purchases
* bank integration
* M-Pesa integration
* actual financial controls
* cloud synchronization
* advanced push notification infrastructure
* machine learning
* clinical services

---

# 3. Functional Requirements

## FR-001 Onboarding

The system shall provide an initial onboarding flow.

The onboarding flow shall collect the minimum information required to configure the MVP.

---

## FR-002 User Profile

The system shall maintain:

* user identifier
* display name
* account creation information

---

## FR-003 Protection Plan

The system shall allow a user to create a protection plan.

A protection plan shall contain:

* planned income
* currency
* allocations

The initial supported currency shall be Kenyan Shilling.

---

## FR-004 Allocation

The user shall be able to create, edit, and delete allocations.

Supported examples shall include:

* rent
* family
* savings
* emergency
* debt
* food
* education
* other
* flexible spending

---

## FR-005 Allocation Validation

The total value of allocations shall not exceed planned income.

The system shall calculate:

* total allocated
* remaining amount
* flexible amount

dynamically.

---

## FR-006 Protected and Flexible Allocations

The user shall be able to identify allocations as protected or flexible.

Protected allocations represent commitments in the user's protection plan.

They do not represent physically inaccessible funds.

---

## FR-007 Risk Period

The user shall be able to configure high risk periods.

A risk period shall include:

* day or days
* start time
* end time
* associated trigger
* enabled state

---

## FR-008 Triggers

The system shall support user selectable triggers including:

* payday
* stress
* argument
* loneliness
* social event
* alcohol availability
* work pressure
* unexpected money
* other

---

## FR-009 Upcoming Risk

The Home screen shall display the next configured high risk period where applicable.

---

## FR-010 Protection Activation

The user shall be able to activate protection for a configured high risk period.

The system shall record the activation.

---

## FR-011 Immediate Intervention

The user shall be able to start an intervention from the Home experience using an action such as:

**I'm feeling the urge**

---

## FR-012 Intervention

The intervention shall provide access to:

* cooldown
* sober message
* trusted person
* financial plan review
* environment change action

---

## FR-013 Cooldown

The MVP shall provide a default 30 minute cooldown.

The remaining duration shall remain logically correct when the application leaves and returns to the foreground.

---

## FR-014 Sober Message

The user shall be able to create a personal message intended to be used during a difficult moment.

The MVP may initially support text and/or locally stored audio.

---

## FR-015 Trusted Person

The user shall be able to configure a trusted person.

The system shall store:

* name
* phone number

The intervention flow shall expose an action to contact that person using supported device functionality.

---

## FR-016 Plan Review

The user shall be able to review protected allocations during an intervention.

---

## FR-017 Environment Change

The user shall be able to indicate that they have changed their immediate environment.

---

## FR-018 Spending Event

The user shall be able to record a spending event.

A spending event shall include:

* amount
* category
* timestamp
* flexible budget relationship
* override state

---

## FR-019 Spending Warning

If the spending amount exceeds the user's remaining flexible allocation, the system shall display a warning.

The warning shall explain that the action conflicts with the user's protection plan.

---

## FR-020 Protection Override

The user shall be able to explicitly override the protection plan.

The system shall require a deliberate confirmation.

---

## FR-021 Override Recording

An overridden spending event shall be clearly recorded as an override.

Ngao shall not claim that an external transaction has been blocked.

---

## FR-022 Reflection

The user shall be able to record a post-intervention reflection.

The reflection shall support:

* trigger
* spending status
* amount spent
* what helped
* optional notes

---

## FR-023 History

The user shall be able to view historical intervention and spending events.

---

## FR-024 Insights

Ngao shall generate simple rule-based observations from recorded history.

Examples:

> Your difficult moments often happen on Friday evenings.

> Most recorded urges happened close to payday.

The MVP shall not present these as clinical predictions.

---

## FR-025 Demo Mode

The MVP shall support a demonstration mode containing realistic sample information.

Demo mode shall allow a reviewer to experience the complete product without manually entering extensive information.

Demo data shall remain separate from actual user data.

---

## FR-026 Local Persistence

The initial client shall persist application data locally.

The local persistence layer shall be abstracted so that a remote backend can replace it later.

---

## FR-027 Settings

Settings shall provide access to:

* profile
* protection plan
* trusted person
* high risk periods
* sober message
* notification preferences where implemented
* privacy
* about
* delete data

---

# 4. Non-Functional Requirements

## NFR-001 Usability

A new user should understand the purpose of Ngao within approximately 30 seconds.

---

## NFR-002 Performance

Normal navigation should feel responsive on supported development devices.

---

## NFR-003 Reliability

Invalid input shall not crash the application.

---

## NFR-004 Privacy

Sensitive information shall not be unnecessarily exposed through logs, notifications, or UI states.

---

## NFR-005 Security

The application shall not contain hardcoded secrets.

---

## NFR-006 Accessibility

The application shall support:

* readable text
* sufficient contrast
* adequate touch targets
* clear validation
* non-color-only status communication

---

## NFR-007 Maintainability

Business rules shall not be embedded directly into presentation components.

---

## NFR-008 Portability

Core product concepts shall remain independent of the client framework.

---

# 5. Safety Requirements

Ngao shall not claim to:

* diagnose alcohol dependence
* treat addiction
* provide medical advice
* provide emergency response
* guarantee sobriety
* guarantee financial protection

Ngao shall clearly communicate that it is a personal support and financial self protection tool.

---

# 6. Acceptance Scenario

The MVP shall support the following end-to-end scenario:

1. User launches Ngao.
2. User completes onboarding.
3. User creates a KSh 50,000 protection plan.
4. User allocates the amount across priorities.
5. User configures Friday evening as a high risk period.
6. User adds a trusted person.
7. User sees the upcoming risk period on Home.
8. User activates protection.
9. User selects "I'm feeling the urge."
10. User starts the cooldown.
11. User accesses the sober message.
12. User can contact the trusted person.
13. User reviews protected allocations.
14. User records a spending attempt.
15. Ngao displays financial friction where appropriate.
16. User cancels or explicitly overrides the protection plan.
17. Ngao records the event.
18. User completes a reflection.
19. The event appears in history.
20. Insights update based on recorded information.

---

# 7. Requirement Boundary

A requirement belongs in the MVP only when it contributes directly to validating:

**PLAN → PREDICT → INTERRUPT → PROTECT → LEARN**

Features that do not materially support this loop should be deferred unless explicitly approved as a product decision.

