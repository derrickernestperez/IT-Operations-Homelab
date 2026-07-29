# Microsoft Entra Tenant Overview

## Document Purpose

This document records the basic identity, configuration, and administrative scope of the Microsoft Entra tenant used by the homelab.

---

## Tenant Information

| Property | Value |
|---|---|
| Tenant display name | REPLACE-WITH-TENANT-NAME |
| Primary domain | REPLACE-WITH-PRIMARY-DOMAIN.onmicrosoft.com |
| Tenant ID | REDACTED-FOR-PUBLIC-DOCUMENTATION |
| Tenant type | Microsoft Entra ID Workforce Tenant |
| Country or region | Philippines |
| Licence level | REPLACE-WITH-LICENCE |
| Environment | Training and homelab |
| Status | Active |

---

## Administrative Environment

| System | Role |
|---|---|
| SRV01 | Active Directory Domain Services domain controller |
| CLIENT01 | Administrative workstation |
| SYNC01 | Windows Server 2022 identity synchronization server |
| Microsoft Entra ID | Cloud identity and access-management platform |

---

## Tenant Purpose

The tenant is used to practise cloud identity administration, user and group management, administrative-role review, activity monitoring, hybrid identity, and Microsoft 365 administration.

---

## Identity Model

The environment will use two identity sources:

1. Cloud-only identities created directly in Microsoft Entra ID
2. Hybrid identities synchronized from homelab.local through SYNC01

---

## Current Configuration

| Area | Current State |
|---|---|
| Microsoft Entra tenant | Configured |
| Administrative account | Configured |
| Cloud test users | Pending validation |
| Cloud security groups | Pending validation |
| Sign-in log review | Pending |
| Audit log review | Pending |
| Hybrid synchronization | Configured or pending validation |
| Microsoft 365 services | Future module |

---

## Security Considerations

- Administrative access should use a dedicated privileged account
- Multifactor authentication should protect privileged roles
- Global Administrator should not be used for routine administration
- Administrative roles should follow least privilege
- Tenant screenshots should not expose sensitive account details
- Client secrets and authentication tokens must never be stored in GitHub

---

## Planned Validation

- Confirm tenant name and primary domain
- Confirm current licence level
- Review existing users
- Review existing groups
- Review assigned administrative roles
- Review sign-in activity
- Review audit activity
- Export tenant inventory
