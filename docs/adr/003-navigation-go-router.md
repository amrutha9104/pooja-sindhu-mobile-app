# ADR 003: Navigation with go_router

- Date: 2026-07-18
- Status: Accepted
- Author: Pooja Sindhu Mobile Platform Team

## Context

The app needs a scalable routing solution that can grow with feature branches.

## Decision

Use `go_router` ^14.x.

## Rationale

go_router gives declarative routing and is a clean fit for Flutter app growth.

## Alternatives Considered

- Navigator 1.0
- auto_route

## Consequences

- Route definitions should live in `lib/core/router`.

