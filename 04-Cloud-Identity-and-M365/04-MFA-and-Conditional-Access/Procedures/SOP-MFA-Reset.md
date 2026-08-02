# SOP — Microsoft Entra MFA Reset

## Document status

**COMPLETED WITH DOCUMENTED LIMITATION**

---

## Purpose

This procedure explains how an authorized administrator reviews and resets a user's registered multifactor authentication methods in Microsoft Entra ID.

An MFA reset may be required when:

- A user loses or replaces a mobile device.
- Microsoft Authenticator is removed accidentally.
- A registered method no longer works.
- A device is suspected to be compromised.
- The user repeatedly fails MFA.
- The user must register a new authentication method.

---

## Scope

This SOP applies to:

- Standard Microsoft Entra users
- Controlled pilot users
- Microsoft Authenticator registration problems
- Software OATH methods
- Administrator-initiated authentication-method removal
- Forced MFA re-registration

This SOP does not authorize:

- Resetting an emergency-access account without recovery approval
- Sharing temporary credentials through insecure channels
- Publishing authentication details
- Removing all recovery methods without a tested replacement
- Bypassing identity verification

---

## Required administrator access

The administrator performing the reset must have an appropriate Microsoft Entra role, such as:

- Authentication Administrator
- Privileged Authentication Administrator
- Global Administrator

Use the least-privileged role that can complete the required action.

Global Administrator should not be used for routine help-desk work when a narrower role is available.

---

## User identity verification

Before changing an authentication method, confirm the user's identity using the organization's approved verification process.

Possible verification checks include:

- Employee or student identification
- Manager confirmation
- Known internal contact information
- Existing help-desk ticket
- Verification through a separate trusted communication channel
- Confirmation of recent account activity

Do not rely only on information supplied by the requester during the same conversation.

---

## Reset procedure

1. Open the Microsoft Entra admin center.
2. Go to:

   ```text
   Entra ID
   → Users
   → All users