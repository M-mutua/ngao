# Ngao Product Decisions

**Document type:** Decision Log
**Version:** 1.0
**Status:** Living Document

This document records important product and engineering decisions so that future development does not rely solely on chat history.

---

# Decision 001: Product Name

**Decision**

The product is named:

**Ngao**

Ngao means shield in Swahili.

**Status**

Accepted

---

# Decision 002: Product Tagline

**Decision**

Use:

> **Protect what sober-you built.**

**Status**

Accepted

---

# Decision 003: Core Product Principle

**Decision**

Ngao is based on:

> **Don't ask future-you to make a decision that sober-you could make today.**

**Status**

Accepted

---

# Decision 004: Core Product Loop

**Decision**

The product lifecycle is:

**PLAN → PREDICT → INTERRUPT → PROTECT → LEARN**

**Status**

Accepted

---

# Decision 005: Initial Client Technology

**Decision**

The current real client implementation will be built using Flutter.

**Reason**

Flutter provides the developer with a familiar development environment and allows the first version to be built directly on the local development machine.

**Important constraint**

The product requirements and domain concepts must remain technology independent.

**Status**

Accepted

---

# Decision 006: Bilt.me

**Decision**

Bilt.me is no longer the primary implementation platform.

The project is moving to direct local Flutter development.

**Status**

Accepted

---

# Decision 007: Initial Persistence

**Decision**

The initial client will operate locally without requiring a backend.

The exact persistence mechanism may be selected during implementation.

**Reason**

The goal is to prove the core product experience before introducing infrastructure.

**Status**

Accepted

---

# Decision 008: Backend

**Decision**

A backend is deferred.

Supabase is a strong candidate for the eventual backend but is not yet committed as a mandatory implementation choice.

**Reason**

The developer wants to first complete and validate the mobile client and decide on the backend after the local product is working.

**Future requirement**

The client must use abstractions that allow remote persistence to replace local persistence without a major product rewrite.

**Status**

Accepted

---

# Decision 009: RevenueCat

**Decision**

RevenueCat integration is deferred until the core mobile experience is functional.

When RevenueCat is introduced, it should use the real SDK and sandbox rather than a fake subscription mechanism.

Expected entitlement:

**ngao_pro**

**Status**

Deferred

---

# Decision 010: Production Subscription Migration

When RevenueCat is introduced, the development flow should use the RevenueCat sandbox.

The future production flow should change configuration and store setup rather than requiring a rewrite of subscription business logic.

**Status**

Planned

---

# Decision 011: Real Banking

**Decision**

The MVP will not connect to bank accounts or execute financial transactions.

**Reason**

The primary research question is whether the behavioral protection experience is useful.

Real financial controls are a future product stage.

**Status**

Accepted

---

# Decision 012: Financial Protection Language

Ngao must distinguish between:

**Planned**

A user's stated financial intention.

**Protected in plan**

A financial allocation the user has committed to protect inside Ngao.

**Actually restricted**

Money that is technically inaccessible due to a real financial integration.

The MVP only provides the first two.

It must not claim the third.

**Status**

Accepted

---

# Decision 013: Prediction

The MVP will not use machine learning.

Risk identification will initially be deterministic and based on:

* configured days
* configured times
* user triggers
* historical events
* payday context

**Status**

Accepted

---

# Decision 014: Privacy

Ngao should minimize collection and transmission of sensitive information.

Highly private content such as detailed reflections and audio messages may remain local during the MVP.

**Status**

Accepted

---

# Decision 015: Language

Ngao should avoid judgmental or stigmatizing language.

The product should communicate:

* dignity
* agency
* protection
* support

It should not communicate:

* shame
* punishment
* failure

**Status**

Accepted

---

# Decision 016: Design Direction

Primary theme:

**Deep teal on warm off white**

Intervention state:

**Darker, calmer, low distraction**

**Status**

Accepted

---

# Decision 017: Demo Mode

Ngao should provide realistic demo data to make the MVP easy to evaluate.

Demo data must remain separate from real user data.

**Status**

Accepted

---

# Decision 018: Portability

The product architecture must permit a future client implementation using a different technology.

Flutter is the current implementation, not a permanent product requirement.

**Status**

Accepted

---

# Decision 019: Product Expansion

Alcohol related financial harm is the initial use case.

The longer term product may expand toward broader personal resilience and financial self protection.

The MVP must remain focused on the initial use case.

**Status**

Accepted

---

# Decision Governance

A new architectural or product decision should be added to this document when it materially affects:

* product behavior
* data ownership
* security
* privacy
* architecture
* external services
* user experience
* scope
* monetization

Older decisions should be marked superseded rather than silently deleted.
---

# Decision 020: Package Identifier

**Date:** 2026-09-08

**Context**

Flutter requires a package/application identifier at project creation. No identifier had been chosen yet.

**Decision**

Use `com.ngao.ngao` (org: `com.ngao`, project name: `ngao`) as the application identifier.

**Reason**

Simple, does not depend on a domain the developer may not yet own, and avoids blocking Phase 1 setup on a branding decision.

**Impact**

Affects Android `applicationId` and iOS bundle identifier. Changing this later is possible but touches generated platform files and store listings if already published. Should be finalized before any store submission (Phase 18).

**Status**

Accepted

---

# Decision 021: Overnight Risk Windows

**Date:** 2026-09-10

**Context**

High-risk periods commonly extend from an evening into the following morning. The initial Phase 3 model rejected an end time earlier than the start time, preventing realistic periods such as Friday 22:00 to Saturday 02:00.

**Decision**

Risk windows may span midnight. Their configured day or days represent the calendar days on which the window starts. When a window's end time is earlier than its start time, the end time occurs on the following calendar day.

An end time equal to the start time remains invalid because it represents a zero-length window.

**Reason**

This supports realistic evening and nightlife-related risk periods while preserving deterministic, user-configured risk logic.

**Impact**

Friday 22:00 to 02:00 is active from 22:00 on Friday through, but not including, 02:00 on Saturday. The existing day, start-time, and end-time model remains sufficient; no additional persisted field is required. Risk-window activity calculations must evaluate both the current start day and the immediately preceding start day for overnight windows.

**Status**

Accepted

---
