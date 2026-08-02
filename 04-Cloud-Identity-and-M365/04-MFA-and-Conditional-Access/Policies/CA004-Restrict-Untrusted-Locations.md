# CA004 — Restrict Untrusted Locations

## Status

**DESIGN ONLY — LICENCE REQUIRED**

This policy was designed but not deployed because the Microsoft Entra tenant does not include the required Conditional Access licence.

---

## Policy objective

Reduce the risk of unauthorized access by applying stronger controls to sign-ins coming from locations that are not recognized as trusted organizational networks.

A trusted location is normally based on a verified public IP address or approved geographic condition. It should not be assumed that every familiar location is automatically safe.

---

## Policy configuration

| Setting | Planned value |
|---|---|
| Policy name | CA004 — Restrict Untrusted Locations |
| Users included | MFA pilot group or selected users |
| Users excluded | Emergency Access 01 and Emergency Access 02 |
| Target resources | All cloud resources |
| Conditions | Locations |
| Trusted locations | Approved organizational public IP ranges |
| Untrusted locations | Any location outside approved ranges |
| Grant control | Require multifactor authentication |
| Optional stricter control | Block access for high-risk scenarios |
| Initial deployment state | Report-only |
| Final deployment state | On, after validation |
| Current implementation | Not deployed |
| Classification | DESIGN ONLY — LICENCE REQUIRED |

---

## Location design

The planned design separates sign-ins into:

### Trusted locations

Examples:

- Verified office public IP address
- Approved VPN egress IP address
- Other documented organizational network ranges

### Untrusted locations

Examples:

- Home internet connections
- Public Wi-Fi
- Mobile networks
- Unknown public IP addresses
- Sign-ins from unexpected countries or regions

A location must not be classified as trusted based only on convenience.

---

## Current homelab limitation

The current homelab does not have:

- A fixed business public IP address
- A production corporate VPN
- Licensed Conditional Access
- A managed office network with verified egress ranges

Therefore, no location-based enforcement was deployed.

Real public IP addresses must not be published in this repository.

---

## Exclusions

The following accounts must be excluded:

- Emergency Access 01
- Emergency Access 02

Emergency-access exclusions are intended to prevent complete tenant lockout.

Their actual usernames, domains, IP addresses, and authentication details must remain private.

---

## Pilot deployment plan

1. Confirm emergency-access accounts are tested and excluded.
2. Identify the approved public IP ranges.
3. Verify that the IP addresses are static and controlled.
4. Create a named location for the trusted network.
5. Apply the policy only to the MFA pilot group.
6. Set the policy to report-only mode.
7. Test a sign-in from the trusted location.
8. Test a sign-in from an untrusted location.
9. Review authentication and Conditional Access results.
10. Confirm that remote users are not unintentionally blocked.
11. Enable enforcement only after successful validation.

---

## Validation scenarios

### Test 1 — Trusted location

Expected result:

```text
Location classification : Trusted
Additional MFA           : Based on final policy design
Access result            : Allowed