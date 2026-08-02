# SOP — Microsoft Entra MFA Registration

## Document status

**COMPLETED AND VALIDATED**

---

## Purpose

This procedure explains how a standard user registers Microsoft Authenticator for multifactor authentication in Microsoft Entra ID.

The process was validated using one controlled cloud-only pilot user assigned to the `SG-MFA-Pilot` security group.

---

## Scope

This SOP applies to:

- Standard cloud-only test users
- Users included in the MFA pilot group
- Microsoft Authenticator registration
- Controlled MFA sign-in testing

This SOP does not apply to:

- Emergency-access accounts
- QR-code publication
- Conditional Access deployment
- FIDO2 security-key registration
- Temporary Access Pass use
- Production-wide deployment

---

## Prerequisites

Before beginning:

- The user account must be enabled.
- The user must know the current password.
- The user must be included in `SG-MFA-Pilot`.
- Microsoft Authenticator must be enabled for the pilot group.
- The Microsoft Authenticator mobile application must be installed.
- The user must have access to a separate browser session.

---

## Registration procedure

1. Open a private or InPrivate browser window.
2. Go to:

   ```text
   https://mysignins.microsoft.com/security-info