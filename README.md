# Pooja Sindhu Mobile Platform

Pooja Sindhu Mobile Platform is a Flutter app for browsing Hindu rituals, booking a pandit for a time slot, and paying via Razorpay, with a shared backend and database alongside the companion website. Day 1 scaffolds the app with Flutter, Riverpod, and go_router so future feature branches can build on a clean, linted base.

## Getting Started

- Required Flutter version: `stable` channel used by CI; confirm locally before release builds.
- Fetch dependencies:
  ```bash
  flutter pub get
  ```
- Run the app:
  ```bash
  flutter run
  ```
- Run a flavor:
  ```bash
  flutter run --flavor dev
  flutter run --flavor staging
  flutter run --flavor production
  ```

TODO(day2): confirm the final Android application ID and iOS bundle identifier before any release build.

## Branching

- `main`: production branch, protected, no direct pushes.
- `develop`: integration branch, protected, no direct pushes.
- `feature/*`: short-lived feature work branches.
- `hotfix/*`: urgent production fixes.
- `release/*`: release preparation branches.

All changes require a pull request, at least 1 approving review, and passing CI before merge.

## Coding Standards

- `dart analyze` must pass with zero warnings.
- Run `dart format` before every commit.
- Do not use `dynamic` in domain or data layers.
- Do not use `print()`; use structured logging instead.
- Use `async`/`await` only for asynchronous work.
- Handle failures with `Either<Failure, Success>` or typed exceptions; never return `null` from a bare `try`/`catch`.
- No widget should use a raw `Color(0x...)` or raw numeric padding; always use the token classes in `lib/core/theme`.

Backend language and framework choice is undecided. ADR-001 is still open, so no network calls or API integration should be added to this repository yet.

