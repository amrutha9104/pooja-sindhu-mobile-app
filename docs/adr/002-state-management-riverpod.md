# ADR 002: State Management with Riverpod

- Date: 2026-07-18
- Status: Accepted
- Author: Pooja Sindhu Mobile Platform Team

## Context

The app needs a predictable and testable state-management approach.

## Decision

Use `flutter_riverpod` ^2.x.

## Rationale

Riverpod provides compile-time safety, testability, and a clean separation of concerns.

## Alternatives Considered

- setState
- Provider
- BLoC

## Consequences

- Future feature work should use Riverpod-based providers.

