# CA003 — Block Legacy Authentication

## Status

**DESIGN ONLY — LICENCE REQUIRED**

This policy was designed but not deployed because the Microsoft Entra tenant does not include the required Conditional Access licence.

---

## Policy objective

Block legacy authentication protocols that do not support modern authentication and multifactor authentication.

Legacy authentication increases account-compromise risk because older protocols may rely only on a username and password and may not support modern security controls.

---

## Policy configuration

| Setting | Planned value |
|---|---|
| Policy name | CA003 — Block Legacy Authentication |
| Users included | All users |
| Users excluded | Emergency Access 01 and Emergency Access 02 |
| Target resources | All cloud resources |
| Client apps included | Exchange ActiveSync clients and other legacy authentication clients |
| Grant control | Block access |
| Initial deployment state | Report-only |
| Final deployment state | On, after dependency validation |
| Current implementation | Not deployed |
| Classification | DESIGN ONLY — LICENCE REQUIRED |

---

## Legacy authentication examples

The planned policy is intended to block older authentication methods and clients such as:

- POP3 using basic authentication
- IMAP using basic authentication
- SMTP AUTH using basic authentication
- Older Microsoft Office clients without modern authentication
- Legacy Exchange ActiveSync clients
- Other clients identified as using legacy authentication

The exact protocols available depend on the organization’s Microsoft 365 services and licensing.

---

## Current tenant limitation

The current homelab does not have licensed Exchange Online mailboxes or production email workloads.

Therefore:

- Exchange Online legacy-protocol testing was not performed.
- POP, IMAP, SMTP AUTH, and Exchange ActiveSync were not validated.
- No email client was falsely represented as tested.
- The policy remains a professional design and readiness artifact.

---

## Exclusions

The following accounts must be excluded during the initial deployment:

- Emergency Access 01
- Emergency Access 02

Emergency exclusions reduce the risk of complete tenant lockout.

The real usernames and tenant domain must not appear in this repository.

---

## Dependency review

Before enforcement, administrators should identify any systems that still rely on legacy authentication, including:

- Older email clients
- Multifunction printers
- Scanners that send email
- Monitoring systems
- Line-of-business applications
- Scripts using username-and-password authentication
- Older mobile mail clients
- Service accounts

Any dependency must be upgraded, reconfigured, replaced, or formally accepted as a temporary risk.

---

## Pilot deployment plan

1. Review recent sign-in logs for legacy authentication activity.
2. Identify users, applications, and service accounts using older clients.
3. Confirm emergency-access accounts are excluded.
4. Apply the policy to a controlled pilot group.
5. Set the policy to report-only mode.
6. Review simulated policy results.
7. Contact affected system owners.
8. Upgrade or reconfigure incompatible applications.
9. Repeat testing until no required dependency is blocked.
10. Enable the policy gradually.

---

## Validation requirements

The policy would be considered ready for enforcement only when:

- Recent sign-in logs have been reviewed.
- Required legacy dependencies have been identified.
- Modern authentication is available for required applications.
- Emergency-access accounts are excluded.
- No critical business process depends on basic authentication.
- Report-only results show no unexpected impact.
- Rollback steps are documented.
- Service owners approve the change.

---

## Rollback procedure

If required services stop working:

1. Sign in using an excluded emergency-access account.
2. Open Microsoft Entra Conditional Access.
3. Locate `CA003 — Block Legacy Authentication`.
4. Change the policy state to **Off**.
5. Save the change.
6. Review sign-in logs for the affected user