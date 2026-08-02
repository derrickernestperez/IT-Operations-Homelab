# SOP — Microsoft Entra Emergency Access

## Document status

**COMPLETED WITH DOCUMENTED LIMITATION**

---

## Purpose

This procedure explains how the organization maintains and uses dedicated cloud-only emergency-access accounts for Microsoft Entra tenant recovery.

Emergency-access accounts are intended for situations where normal administrative accounts cannot sign in or a tenant-wide authentication policy causes administrator lockout.

These accounts are not intended for normal administrative work.

---

## Scope

This SOP applies to:

- Emergency Access 01
- Emergency Access 02
- Microsoft Entra tenant-lockout recovery
- Authentication-policy recovery
- Administrative-role recovery
- Controlled emergency sign-in validation
- Emergency-account monitoring and review

This SOP does not authorize:

- Daily administration using emergency accounts
- Sharing emergency credentials
- Publishing emergency usernames
- Storing passwords in GitHub
- Disabling MFA without approval
- Simultaneously modifying both emergency accounts
- Bypassing incident documentation

---

## Emergency-access architecture

The tenant maintains three Global Administrator identities:

| Account type | Intended use |
|---|---|
| Normal administrator | Routine tenant administration |
| Emergency Access 01 | Primary tenant-recovery account |
| Emergency Access 02 | Secondary tenant-recovery account |

Both emergency accounts are:

- Cloud-only Microsoft Entra identities
- Permanently assigned the Global Administrator role
- Unlicensed
- Reserved for emergency use
- Protected by multifactor authentication
- Independently sign-in tested
- Excluded from future Conditional Access policies that could create tenant lockout

The real usernames and tenant domain are intentionally excluded from this repository.

---

## Current authentication configuration

Both emergency-access accounts currently use:

```text
Registered method      : Software OATH token
System-preferred MFA   : Enabled
Preferred method       : softwareOTP
Sign-in validation     : Successful