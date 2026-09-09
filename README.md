# Ngao

**Protect what sober-you built.**

Ngao is a local-first mobile app for people who want to protect the money and priorities they have already chosen during moments when spending may feel difficult to control. It is being built in Flutter for the Kenyan MVP, using Kenyan Shillings (KES).

The app is designed around a simple loop:

> **PLAN → PREDICT → INTERRUPT → PROTECT → LEARN**

Users will be able to create a protection plan for their income, identify periods that tend to be high risk, start a focused intervention when an urge arises, add deliberate friction before spending beyond their flexible budget, and reflect on what helped afterward.

## What Ngao is—and is not

Ngao supports a user's own financial intentions. A protected allocation is a commitment recorded in the app; it does not make money technically inaccessible.

The MVP does not connect to banks or M-Pesa, move money, block transactions, diagnose alcohol dependence, provide medical advice, or guarantee sobriety or financial protection. It is a personal support and financial self-protection tool.

Sensitive information is intended to remain local during the MVP. Backend synchronization, subscriptions, and external financial integrations are deliberately deferred.

## Planned MVP experience

The completed MVP will let a user:

* create a KES protection plan and assign allocations such as rent, family, savings, debt, food, and flexible spending;
* configure deterministic high-risk windows based on days, times, and personal triggers;
* record a trusted contact and a personal sober message;
* start a 30-minute cooldown and record helpful intervention actions;
* record spending, receive a warning when it conflicts with the remaining flexible budget, and deliberately override that warning if needed;
* record a post-intervention reflection and review simple, descriptive history-based insights.

## Current status

Phases 1–3 are complete:

* Flutter foundation, navigation, and centralized theme
* reusable design-system components
* framework-independent domain models and pure business rules

Local persistence, onboarding, feature screens, and the flows above are still upcoming work. See [the implementation roadmap](docs/06_ngao_implementation_roadmap.md) and [milestone log](docs/07_ngao_milestone_log.md) for the authoritative delivery record.

## Development

Prerequisites: Flutter SDK compatible with the Dart SDK constraint in `pubspec.yaml`.

```bash
flutter pub get
flutter run
```

To run the available automated checks:

```bash
flutter analyze
flutter test
```

## Project documentation

* [Software Requirements Specification](docs/02_ngao_srs.md)
* [Software Design Document](docs/03_ngao_sdd.md)
* [Product decisions](docs/05_ngao_product_decisions.md)
* [Implementation roadmap](docs/06_ngao_implementation_roadmap.md)
* [Milestone log](docs/07_ngao_milestone_log.md)
* [Architecture log](docs/08_ngao_architecture_log.md)
