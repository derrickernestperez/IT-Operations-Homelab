<!-- ====================================================== -->
<!-- FILE: 04-Cloud-Identity-and-M365/README.md             -->
<!-- ====================================================== -->

<div align="center">

<img src="https://capsule-render.vercel.app/api?type=waving&color=0:0A66C2,42:0078D4,72:00A4EF,100:5C2D91&height=245&section=header&text=04%20Cloud%20Identity%20%26%20M365&fontSize=47&fontColor=FFFFFF&fontAlignY=35&desc=Microsoft%20Entra%20ID%20%E2%80%A2%20Hybrid%20Identity%20%E2%80%A2%20MFA%20%E2%80%A2%20Governance&descSize=17&descAlignY=56&animation=fadeIn" width="100%" alt="Cloud Identity and Microsoft 365">

<br>

<img src="https://img.shields.io/badge/Section-Cloud%20Identity-0078D4?style=for-the-badge&logo=microsoftazure&logoColor=white" alt="Cloud Identity">
<img src="https://img.shields.io/badge/Platform-Microsoft%20365-D83B01?style=for-the-badge&logo=microsoft&logoColor=white" alt="Microsoft 365">
<img src="https://img.shields.io/badge/Security-MFA%20%26%20Governance-5C2D91?style=for-the-badge&logo=microsoft&logoColor=white" alt="MFA and Governance">

<br><br>

**Extending on-premises identity into Microsoft Entra ID and Microsoft 365 with secure authentication and governance.**

[← Previous Section](../03-Enterprise-Operations/README.md) • [🏠 Main Repository](../README.md)

</div>

---

## 📌 Section Overview

The **Cloud Identity and Microsoft 365** section extends the Windows domain into Microsoft cloud services.

It covers cloud-only identity administration, hybrid synchronization, Microsoft 365 tenant operations, multifactor authentication, Conditional Access planning, emergency access, and identity governance.

---

## ☁️ Hybrid Identity Architecture

```text
On-Premises Active Directory
        homelab.local
              │
              │ LDAP / DNS / Kerberos
              ▼
            SYNC02
Microsoft Entra Cloud Sync Agent
              │
              │ HTTPS 443
              ▼
      Microsoft Entra ID
              │
      ┌───────┼────────┐
      │       │        │
 Cloud Users  │   Security Groups
          Synced Users
              │
              ▼
       Microsoft 365
              │
              ▼
MFA, Access Controls and Governance
```

---

## 📂 Modules

| # | Module | What It Demonstrates |
|---:|---|---|
| 01 | [Microsoft Entra ID](01-Microsoft-Entra-ID/) | Cloud-only users, security groups, lifecycle testing, role review, audit logs, sign-in logs, Graph inventory, and validation. |
| 02 | [Hybrid Identity](02-Hybrid-Identity/) | Microsoft Entra Cloud Sync, scoped provisioning, Password Hash Sync, failed-agent investigation, replacement-agent validation, and handoff. |
| 03 | [Microsoft 365 Administration](03-Microsoft-365-Administration/) | Tenant information, users, groups, domains, roles, service health, Message Center, and Microsoft Graph reporting. |
| 04 | [MFA and Conditional Access](04-MFA-and-Conditional-Access/) | Microsoft Authenticator, authentication methods, MFA validation, emergency access, Conditional Access design, and rollback planning. |
| 05 | [Identity Governance](05-Identity-Governance/) | Identity lifecycle oversight, access-review design, role governance, least privilege, evidence collection, and governance documentation. |

---

## 🧰 Technologies

<div align="center">

<img src="https://img.shields.io/badge/Microsoft%20Entra%20ID-Cloud%20Identity-0078D4?style=flat-square&logo=microsoftazure&logoColor=white" alt="Microsoft Entra ID">
<img src="https://img.shields.io/badge/Cloud%20Sync-Hybrid%20Identity-00A4EF?style=flat-square&logo=microsoft&logoColor=white" alt="Cloud Sync">
<img src="https://img.shields.io/badge/Microsoft%20365-Tenant%20Administration-D83B01?style=flat-square&logo=microsoft&logoColor=white" alt="Microsoft 365">
<img src="https://img.shields.io/badge/Microsoft%20Graph-Reporting-5C2D91?style=flat-square&logo=microsoft&logoColor=white" alt="Microsoft Graph">
<img src="https://img.shields.io/badge/MFA-Authentication-2EA44F?style=flat-square&logo=microsoft&logoColor=white" alt="MFA">

</div>

---

## 🔐 Security and Privacy

Published evidence should redact or exclude:

- Tenant domains and user principal names
- Passwords and temporary passwords
- QR codes and OATH secret keys
- Object, request, and correlation identifiers
- Public IP addresses and device identifiers
- Recovery information and authentication secrets

Licence-dependent features should be clearly labelled as either:

```text
COMPLETED AND VALIDATED
```

or:

```text
DESIGN ONLY — LICENCE REQUIRED
```

---

## 🎯 Skills Demonstrated

- Microsoft Entra ID administration
- Cloud-only and synchronized identity management
- Microsoft Entra Cloud Sync
- Password Hash Sync
- Microsoft 365 admin center
- Microsoft Graph PowerShell
- Authentication Methods policy
- Microsoft Authenticator and MFA validation
- Sign-in and audit-log analysis
- Emergency-access planning
- Conditional Access design
- Identity-governance documentation

---

## ✅ Section Outcome

This section demonstrates how on-premises and cloud identity services work together to provide:

```text
Centralized cloud identity
Hybrid user synchronization
Microsoft 365 tenant administration
Secure authentication
Emergency access
Access-control planning
Identity governance
```

---

<div align="center">

### Repository Navigation

[⬅️ Enterprise Operations](../03-Enterprise-Operations/README.md) · [🏠 Main Repository](../README.md)

<br>

<img src="https://capsule-render.vercel.app/api?type=waving&color=0:0A66C2,42:0078D4,72:00A4EF,100:5C2D91&height=115&section=footer" width="100%" alt="Footer">

</div>
