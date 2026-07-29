# Cloud-Only User Inventory

## Document Purpose

This document records cloud-only test identities created directly in Microsoft Entra ID.

These accounts are separate from identities that may later be synchronized from the homelab.local Active Directory environment through SYNC01.

---

## User Inventory

| User | Current State | Planned Use |
|---|---|---|
| Alex Rivera | Active | IT access and cloud administration testing |
| Maya Santos | Active | Finance group and access testing |
| Jordan Lee | Active | Human Resources group and access testing |

---

## Identity Classification

| Identity Type | Description |
|---|---|
| Cloud-only user | Created directly in Microsoft Entra ID |
| Hybrid user | Created in on-premises Active Directory and synchronized to Microsoft Entra ID |
| Guest user | External identity invited to the tenant |

---

## Validation Results

| Validation Check | Expected Result |
|---|---|
| User type | Member |
| Account enabled | Yes |
| On-premises synchronization | No |
| Department populated | Yes |
| Job title populated | Yes |
| Usage location configured | Philippines |
| Administrative role assigned | No |

---

## Security Controls

- Test users were not assigned administrative roles
- Temporary passwords were not stored in the repository
- Users must change temporary passwords during first sign-in
- Accounts are used only for controlled homelab testing
- Least privilege is maintained

---

## Lifecycle State

| User | Current State | Planned Use |
|---|---|---|
| Alex Rivera | Active | IT access and cloud administration testing |
| Maya Santos | Active | Finance group and access testing |
| Jordan Lee | Active | Human Resources group and access testing |
