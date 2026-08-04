# Microsoft Entra Identity Governance Architecture

## Document status

**COMPLETED WITH DOCUMENTED LIMITATION**

---

## Purpose

This document describes the identity-governance architecture used in the Microsoft Entra homelab.

The current tenant does not include the licences required for advanced Microsoft Entra Identity Governance capabilities such as:

- Access Reviews
- Entitlement Management
- Lifecycle Workflows
- Privileged Identity Management
- Detailed inactive-user reporting

Because those features were unavailable, this module implements a manual governance model using:

- User account reviews
- Guest-user reviews
- Administrative-role reviews
- Group-membership certification
- Group-owner assignment
- Disabled-account reviews
- Joiner–Mover–Leaver procedures
- Quarterly access certification
- Separation-of-duties controls
- Access-request templates
- Manual remediation tracking

No licensed feature is represented as deployed.

---

## High-level architecture

```text
                    Microsoft Entra ID
                           │
              ┌────────────┴────────────┐
              │                         │
        Identity population       Governance controls
              │                         │
     ┌────────┼────────┐       ┌────────┼─────────┐
     │        │        │       │        │         │
Cloud-only  Synced   Guest   Manual   Role      Group
 users      users    users   reviews  reviews   reviews
     │        │        │       │        │         │
     └────────┴────────┴───────┴────────┴─────────┘
                           │
                           ▼
                  Access certification
                           │
            ┌──────────────┼──────────────┐
            │              │              │
         Approve         Modify         Remove
            │              │              │
            └──────────────┴──────────────┘
                           │
                           ▼
                       Remediation
                           │
                           ▼
                  Validation and evidence
