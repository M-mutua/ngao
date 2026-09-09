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
