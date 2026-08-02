# CA002 — Require Strong Authentication for Administrators

## Status

**DESIGN ONLY — LICENCE REQUIRED**

This policy was designed but not deployed because the Microsoft Entra tenant does not include the required Conditional Access licence.

---

## Policy objective

Require strong multifactor authentication for privileged administrative accounts when accessing Microsoft Entra and other administrative portals.

Administrative accounts are high-value targets because compromise may allow an attacker to modify users, groups, roles, authentication settings, and tenant-wide security controls.

---

## Policy configuration

| Setting | Planned value |
|---|---|
| Policy name | CA002 — Require Strong Authentication for Administrators |
| Users included | Selected Microsoft Entra administrative roles |
| Users excluded | Emergency Access 01 and Emergency Access 02 |
| Target resources | Microsoft Admin Portals |
| Conditions | None during the initial pilot |
| Grant control | Require multifactor authentication |
| Preferred future control | Require phishing-resistant authentication strength |
| Session controls | Sign-in frequency review, if required |
| Initial deployment state | Report-only |
| Final deployment state | On, after successful validation |
| Current implementation | Not deployed |
| Classification | DESIGN ONLY — LICENCE REQUIRED |

---

## Administrative roles included

The planned policy should target privileged roles such as:

- Global Administrator
- Privileged Role Administrator
- Authentication Administrator
- Privileged Authentication Administrator
- Security Administrator
- Conditional Access Administrator
- Exchange Administrator
- SharePoint Administrator
- User Administrator
- Helpdesk Administrator

The exact role selection must be reviewed before deployment to avoid excluding a privileged role unintentionally.

---

## Exclusions

The following accounts must be excluded:

- Emergency Access 01
- Emergency Access 02

Their real usernames, domains, authentication details, and recovery credentials must never be committed to the repository.

Emergency exclusions exist only for tenant-lockout recovery and must not be used for routine administration.

---

## Authentication requirements

### Minimum planned requirement

Require multifactor authentication.

### Preferred future requirement

Require a phishing-resistant authentication strength, such as:

- Passkey or FIDO2 security key
- Certificate-based authentication
- Another Microsoft-supported phishing-resistant method

The current emergency accounts use Software OATH authentication.

Software OATH provides multifactor authentication but is not considered phishing-resistant. This remains a documented future improvement.

---

## Pilot deployment plan

1. Confirm both emergency-access accounts can sign in.
2. Confirm both emergency accounts remain excluded.
3. Identify all active administrative-role assignments.
4. Verify that each normal administrator has a registered MFA method.
5. Apply the policy to one controlled administrative test account.
6. Set the policy to report-only mode.
7. Perform a controlled administrator sign-in.
8. Review Authentication Details and Conditional Access results.
9. Confirm administrative portals remain accessible.
10. Expand the assignment gradually after successful validation.

---

## Validation requirements

The policy would be considered ready for enforcement only when:

- All normal administrators have working MFA.
- Both emergency accounts are tested and excluded.
- Administrative role assignments have been reviewed.
- A controlled administrator sign-in succeeds.
- Sign-in logs confirm multifactor authentication.
- No synchronization or service dependency is unintentionally affected.
- Rollback steps have been tested and documented.
- No unexpected administrator lockout occurs.

---

## Rollback procedure

If administrators are blocked unexpectedly:

1. Sign in using an excluded emergency-access account.
2. Open Microsoft Entra Conditional Access.
3. Locate `CA002 — Require Strong Authentication for Administrators`.
4. Change the policy state to **Off**.
5. Save the change.
6. Review the affected administrator sign-in logs.
7. Correct user, role, resource, or authentication-strength assignments.
8. Return the policy to report-only mode before additional testing.

---

## Current homelab result

The tenant currently has:

- One normal Global Administrator account
- Two cloud-only emergency-access Global Administrator accounts
- Successful sign-in validation for both emergency accounts
- Software OATH MFA registered for both emergency accounts
- A successful Microsoft Authenticator MFA test for a controlled pilot user

Granular Conditional Access enforcement was unavailable because of licensing.

Therefore:

```text
Implementation status : Not deployed
Design status         : Completed
Licence limitation    : Confirmed
Classification        : DESIGN ONLY — LICENCE REQUIRED