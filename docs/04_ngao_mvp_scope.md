# Ngao MVP Scope

**Version:** 1.0
**Status:** Implementation Baseline

---

# 1. MVP Objective

The Ngao MVP exists to validate one central hypothesis:

> People may make better financial decisions while clear headed, and those decisions may be easier to protect if friction and support are introduced before or during predictable high risk moments.

The MVP therefore focuses on one complete behavioral and financial protection loop.

---

# 2. MVP Core Loop

```text
PLAN
  ↓
PREDICT
  ↓
INTERRUPT
  ↓
PROTECT
  ↓
LEARN
```

Every MVP feature should directly support one of these stages.

---

# 3. Included Features

## Planning

* onboarding
* income definition
* financial priorities
* allocations
* protected allocations
* flexible spending allocation

## Risk

* trigger selection
* day and time configuration
* payday related context
* upcoming risk display
* protection activation

## Intervention

* "I'm feeling the urge"
* 30 minute cooldown
* sober message
* trusted person
* protection review
* environment change

## Financial Friction

* spending entry
* flexible spending calculation
* protection warning
* explicit override
* override history

## Learning

* intervention history
* spending history
* reflection
* simple pattern insights

## Supporting Experience

* profile
* settings
* local persistence
* demo mode

---

# 4. Deliberately Excluded

The following shall not be implemented as part of the initial MVP:

### Financial infrastructure

* bank account connection
* M-Pesa transaction execution
* bank transaction blocking
* account locking
* actual protected financial accounts
* automatic fund transfer

### Clinical functionality

* addiction diagnosis
* clinical scoring
* therapy
* medical treatment
* emergency response
* medical advice

### Advanced intelligence

* machine learning
* predictive AI
* personalized clinical models
* large scale behavioral analytics

### Social functionality

* social feeds
* community network
* messaging platform
* public profiles

### Commercial infrastructure

* RevenueCat integration
* App Store purchase flow
* Google Play purchase flow

RevenueCat is a later phase.

### Backend infrastructure

* Supabase
* cloud synchronization
* production notification backend

Backend architecture is intentionally deferred.

---

# 5. MVP Data Strategy

The initial application shall be local first.

Core information may be persisted locally:

* profile
* protection plan
* allocations
* risk windows
* trusted person
* intervention events
* spending events
* reflections
* insights data

Highly private information should be minimized.

Detailed audio and personal reflection content may remain local.

---

# 6. MVP Demo Scenario

The product should include realistic demo data.

Example:

```text
User:
Alex

Income:
KSh 50,000

Rent:
KSh 20,000

Family:
KSh 10,000

Savings:
KSh 10,000

Emergency:
KSh 5,000

Flexible:
KSh 5,000

Risk:
Friday, 6 PM to 11 PM

Trusted person:
Brian
```

The demo should also contain historical events illustrating:

* completed cooldown
* skipped cooldown
* protection override
* reflection
* recurring Friday pattern

---

# 7. UX Priorities

Priority order:

1. intervention experience
2. protection plan
3. Home
4. risk periods
5. financial friction
6. reflection
7. insights
8. settings

A beautiful secondary feature should not be prioritized over a broken intervention flow.

---

# 8. Definition of Done

The MVP is done when a user can complete:

```text
Onboard
  ↓
Create protection plan
  ↓
Set risk period
  ↓
Add trusted person
  ↓
Activate protection
  ↓
Trigger intervention
  ↓
Complete or skip cooldown
  ↓
Use support actions
  ↓
Record spending
  ↓
Receive friction
  ↓
Override or cancel
  ↓
Reflect
  ↓
View history
  ↓
View insights
```

The full journey must persist correctly between application sessions.

---

# 9. MVP Success Criteria

The product should demonstrate:

**Comprehension**

A new user understands what Ngao is for.

**Completion**

A user can create a meaningful protection plan.

**Intervention**

A user can activate the intervention quickly.

**Friction**

The system can introduce deliberate friction before an impulsive spending decision.

**Reflection**

The user can record what happened.

**Learning**

The application can surface simple recurring patterns.

---

# 10. Scope Rule

When deciding whether to build a new feature, ask:

> Does this directly improve PLAN, PREDICT, INTERRUPT, PROTECT, or LEARN?

If not, it should normally be deferred.

---

# 11. Future Product Boundary

The MVP is the foundation for future capabilities.

Future development may introduce:

* Supabase
* RevenueCat
* real financial integrations
* stronger financial controls
* advanced personalization
* push notifications
* multi-device synchronization
* regional expansion

These require new design and implementation decisions and must not silently enter the MVP.

