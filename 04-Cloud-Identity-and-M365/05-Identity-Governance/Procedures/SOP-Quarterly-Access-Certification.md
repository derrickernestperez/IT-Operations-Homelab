# SOP — Quarterly Access Certification

## Document status

**COMPLETED WITH DOCUMENTED LIMITATION**

---

## Purpose

This procedure defines how user accounts, group memberships, administrative roles, disabled accounts, guest accounts, and authentication-related access should be reviewed every quarter.

The objective is to confirm that each identity still requires access and that unnecessary or excessive permissions are removed.

Microsoft Entra Access Reviews were unavailable under the tenant's current licensing. Therefore, this homelab uses a documented manual access-certification process.

---

## Scope

This quarterly review applies to:

- Cloud-only Microsoft Entra users
- Synchronized Microsoft Entra users
- Guest users
- Disabled users
- Security-group memberships
- Administrative-role assignments
- Group ownership
- MFA pilot membership
- Emergency-access accounts
- Available licence assignments
- Authentication-method readiness

This procedure does not authorize:

- Removing access without review
- Deleting accounts without retention approval
- Modifying emergency accounts through the normal review process
- Publishing user identities or tenant information
- Claiming that automated Access Reviews were deployed

---

## Review frequency

The review should occur:

```text
Quarterly
After a major organizational change
After a security incident
After a privileged-access change
After a significant authentication-policy change
Before deleting disabled accounts
