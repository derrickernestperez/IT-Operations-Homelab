# Microsoft Entra Administrative Role Review

## Purpose

This document reviews the administrative roles relevant to the Microsoft Entra homelab and records the current privileged-access model.

---

## Current Administrator

| Field | Value |
|---|---|
| Administrator | Derrick Ernest Perez |
| Current role | Global Administrator |
| Identity type | Cloud user |
| Administrative scope | Tenant |
| Environment | Homelab and training |

---

## Standard User Role Validation

| User | Administrative Role | Expected Result |
|---|---|---|
| Alex Rivera | None | Passed |
| Maya Santos | None | Passed |
| Jordan Lee | None | Passed |

---

## Role Reference

| Role | Administrative Purpose | Risk Level |
|---|---|---|
| Global Administrator | Full tenant administration | Critical |
| Privileged Role Administrator | Manage Entra role assignments | Critical |
| User Administrator | Manage users and selected groups | High |
| Groups Administrator | Manage groups and memberships | High |
| Helpdesk Administrator | Perform selected support operations | Medium |
| Conditional Access Administrator | Manage Conditional Access policies | High |
| Security Reader | Review security information | Low |
| Global Reader | Read administrative settings | Low |

---

## Least-Privilege Model

```text
Administrative task
        ↓
Identify required permissions
        ↓
Select the narrowest suitable role
        ↓
Assign only for the required scope
        ↓
Review and remove when no longer needed
```

---

## Example Role Selection

| Task | Preferred Role |
|---|---|
| Create and manage standard users | User Administrator |
| Create and manage security groups | Groups Administrator |
| Review tenant configuration | Global Reader |
| Review security information | Security Reader |
| Manage role assignments | Privileged Role Administrator |
| Manage Conditional Access | Conditional Access Administrator |

---

## Security Findings

- Cloud test users do not have administrative roles
- Departmental security groups are not role-assignable groups
- Administrative roles should not be assigned to standard user accounts
- Global Administrator should not be used for routine administration
- Privileged access should be reviewed regularly
- Administrative accounts should be protected by multifactor authentication
- Temporary or eligible assignments should be preferred when supported

---

## Validation

| Check | Result |
|---|---|
| Current administrator role reviewed | Passed |
| Built-in roles reviewed | Passed |
| Alex Rivera has no admin role | Passed |
| Maya Santos has no admin role | Passed |
| Jordan Lee has no admin role | Passed |
| Least-privilege model documented | Passed |
