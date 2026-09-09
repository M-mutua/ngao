# Ngao UI/UX Guidelines

**Version:** 1.0
**Status:** Living Document

This document records UI/UX conventions so visual and interaction decisions stay consistent across screens as the product grows. Append new sections as decisions are made; do not rewrite existing sections without noting the change.

---

## Color Palette

**Anchors**

* Deep teal `#0D4F4B` — primary
* Warm off-white `#FAF6F0` — background

**Neutrals**

* Text primary `#2A2A28`
* Text secondary `#6B6B66`
* Border `#E4DED3`
* Surface (cards) `#FFFFFF`

**Functional**

* Warning `#C97A3D` — muted amber/terracotta, deliberately not alarm-red, per Decision 015 (avoid shame/punishment language and tone)
* Error `#B3453B` — desaturated brick red, reserved for genuine system errors, not behavioral warnings
* Success / protected `#3D7A5C`

**Intervention mode** (SDD §18, Decision 016)

* Background `#0F2E2C`
* Surface `#163B38`
* Text primary `#F2EDE3`
* Accent `#6FA89E`

Intervention mode is not a generic dark-mode inversion. It is a distinct, deliberately lower-stimulation palette for use during the intervention flow only.

---

## Typography

Default Material 3 type scale. No custom font in use. Revisit only if a documented brand requirement emerges.

---

## Spacing Scale

4, 8, 12, 16, 24, 32, 48 (`NgaoSpacing.xs` through `xxxl`)

---

## Radius Scale

* Small (8): inputs, small elements
* Medium (16): cards
* Large (24): sheets, modals

---

## Elevation

Flat design. No drop shadows. Surface separation achieved through card color against background color, plus spacing and borders, not shadow. Chosen to support the "calm, spacious, trustworthy" product personality (Vision §7) and avoid a clinical or dashboard feel.

---

## Status Communication

Per NFR-006, status must never be communicated through color alone. All status indicators pair an icon with a text label (see `NgaoStatusIndicator`).

---

## Components

* `NgaoButton` — primary (filled) and secondary (outlined) variants, full width by default
* `NgaoCard` — bordered, flat, rounded corners (medium radius)
* `NgaoTextField` — outlined, small radius, label-based
* `NgaoStatusIndicator` — icon + colored text, success/warning/error variants

Components live in `lib/shared/widgets/`. Feature screens should compose these rather than styling raw Material widgets inline, per SDD §3.4 (thin UI).

---

## Open Questions

* Whether onboarding allocation entry uses preset category chips or a blank form (deferred to Phase 5 design)
* Motion/transition conventions (not yet defined)
* Empty state and error state conventions (not yet defined, relevant from Phase 5 onward)

---
