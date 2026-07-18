# ADR 004: Secure Token Storage

- Date: 2026-07-18
- Status: Accepted
- Author: Pooja Sindhu Mobile Platform Team

## Context

The app will eventually need secure storage for auth tokens and sensitive values.

## Decision

Use `flutter_secure_storage`.

## Rationale

It provides a straightforward secure storage abstraction for mobile platforms.

## Alternatives Considered

- SharedPreferences
- Hive

## Consequences

- Secure storage access should be wrapped behind a service layer.

