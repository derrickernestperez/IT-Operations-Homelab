# CA001 — Require MFA for All Users

## Status

**DESIGN ONLY — LICENCE REQUIRED**

This policy was designed but not deployed because the Microsoft Entra tenant does not include the required Conditional Access licence.

---

## Policy objective

Require multifactor authentication for all standard users when accessing organizational cloud resources.

---

## Policy configuration

| Setting | Planned value |
|---|---|
| Policy name | CA001 — Require MFA for All Users |
| Users included | All users |
| Users excluded | Emergency Access 01 and Emergency Access 02 |
| Target resources | All cloud resources |
| Conditions | None during initial pilot |
| Grant control | Require multifactor authentication |
| Session controls | Not configured |
| Initial deployment state | Report-only |
| Final deployment state | On, after successful validation |
| Current implementation | Not deployed |
| Classification | DESIGN ONLY — LICENCE REQUIRED |

---

## Exclusions

The following accounts must be excluded:

- Emergency Access 01
- Emergency Access 02

The real usernames and tenant domain must not be recorded in this repository.

These exclusions are intended to reduce the risk of complete tenant lockout.

---

## Pilot deployment plan

1. Confirm both emergency-access accounts can sign in.
2. Confirm both emergency-access accounts have working MFA.
3. Create a controlled pilot security group.
4. Add one normal test user to the pilot group.
5. Confirm Microsoft Authenticator registration.
6. Enable the policy in report-only mode for the pilot group.
7. Review successful and failed sign-in events.
8. Confirm that required applications remain accessible.
9. Expand the policy gradually.
10. Enable enforcement only after validation succeeds.

---

## Validation requirements

The policy would be considered ready for enforcement only when:

- Both emergency-access accounts are tested.
- Emergency accounts are excluded from the policy.
- The pilot user can complete MFA successfully.
- Sign-in logs show successful multifactor authentication.
- No required service account is unintentionally blocked.
- Rollback steps are documented.
- No unexpected sign-in failures are detected.

---

## Rollback procedure

If the policy causes an access problem:

1. Sign in using an excluded emergency-access account.
2. Open Microsoft Entra Conditional Access.
3. Locate `CA001 — Require MFA for All Users`.
4. Change the policy state to **Off**.
5. Save the change.
6. Review the affected sign-in logs.
7. Correct the policy assignment or exclusion.
8. Return the policy to report-only mode before further testing.

---

## Current homelab result

The homelab successfully validated MFA using Microsoft Authenticator for one controlled pilot user.

Granular Conditional Access deployment was unavailable because of licensing.

Therefore:

```text
Implementation status : Not deployed
Design status         : Completed
Licence limitation    : Confirmed
Classification        : DESIGN ONLY — LICENCE REQUIRED