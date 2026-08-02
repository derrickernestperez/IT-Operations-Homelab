# SOP — Microsoft Entra Conditional Access Deployment

## Document status

**DESIGN ONLY — LICENCE REQUIRED**

---

## Purpose

This procedure defines a safe method for designing, testing, deploying, validating, and rolling back Microsoft Entra Conditional Access policies.

The current tenant does not include the required Microsoft Entra Conditional Access licence. Therefore, the policy documents in this module were created as professional readiness designs and were not deployed.

---

## Scope

This SOP applies to the following policy designs:

- CA001 — Require MFA for All Users
- CA002 — Require Strong Authentication for Administrators
- CA003 — Block Legacy Authentication
- CA004 — Restrict Untrusted Locations
- CA005 — Require Managed or Hybrid-Joined Device

This SOP does not authorize:

- Enabling policies without the required licence
- Tenant-wide deployment without pilot testing
- Removing emergency-account exclusions
- Publishing tenant identifiers
- Enabling a free trial without approval
- Claiming that design-only policies were implemented

---

## Prerequisites

Before deploying any Conditional Access policy, confirm:

- A valid Microsoft Entra Conditional Access licence is available.
- At least two cloud-only emergency-access accounts exist.
- Both emergency accounts can sign in.
- Both emergency accounts have working MFA.
- Emergency accounts are excluded from applicable policies.
- A controlled pilot group exists.
- Pilot users have registered authentication methods.
- Sign-in logs are available for validation.
- Required applications and service accounts are documented.
- A rollback procedure has been approved.
- The current configuration has been recorded.

---

## Required roles

An administrator performing Conditional Access work should have an appropriate role, such as:

- Conditional Access Administrator
- Security Administrator, where applicable
- Global Administrator, only when necessary

Use least privilege whenever possible.

Emergency-access accounts must not be used for routine policy creation or testing.

---

## Deployment principles

All policies must follow these principles:

1. Design before deployment.
2. Use a controlled pilot group.
3. Start in report-only mode.
4. Exclude emergency-access accounts.
5. Review dependencies.
6. Validate sign-in logs.
7. Document expected and actual behavior.
8. Expand gradually.
9. Maintain a tested rollback path.
10. Never represent an undeployed policy as active.

---

## Phase 1 — Document the current state

Before changing anything, record:

- Security Defaults state
- Authentication Methods policy
- Existing Conditional Access policies
- Current licensing
- Global Administrator assignments
- Emergency-account status
- Pilot-group membership
- Registered authentication methods
- Service-account dependencies
- Recent sign-in behavior

Capture redacted evidence before deployment.

---

## Phase 2 — Review the policy design

For the selected policy, verify:

- Policy objective
- Included users or roles
- Excluded accounts
- Target resources
- Conditions
- Grant controls
- Session controls
- Dependencies
- Pilot scope
- Validation criteria
- Rollback procedure
- Final classification

Do not proceed when the policy scope is unclear.

---

## Phase 3 — Confirm emergency access

Before every policy deployment:

1. Confirm Emergency Access 01 is enabled.
2. Confirm Emergency Access 02 is enabled.
3. Confirm both remain cloud-only.
4. Confirm both retain Global Administrator.
5. Confirm both have working MFA.
6. Test one account through a private browser session.
7. Verify the second account remains available.
8. Confirm both accounts are excluded from the planned policy.
9. Record the validation result.

Do not modify both emergency accounts during the same change window.

---

## Phase 4 — Create the policy

In the Microsoft Entra admin center:

```text
Entra ID
→ Conditional Access
→ Policies
→ New policy