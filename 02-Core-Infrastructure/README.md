<!-- ====================================================== -->
<!-- FILE: 02-Core-Infrastructure/README.md                 -->
<!-- ====================================================== -->

<div align="center">

<img src="https://capsule-render.vercel.app/api?type=waving&color=0:006666,45:0078D4,100:00A4EF&height=245&section=header&text=02%20Core%20Infrastructure&fontSize=51&fontColor=FFFFFF&fontAlignY=35&desc=DNS%20%E2%80%A2%20DHCP%20%E2%80%A2%20File%20Services%20%E2%80%A2%20Printing%20%E2%80%A2%20Recovery&descSize=17&descAlignY=56&animation=fadeIn" width="100%" alt="Core Infrastructure">

<br>

<img src="https://img.shields.io/badge/Section-Core%20Infrastructure-006666?style=for-the-badge&logo=windows&logoColor=white" alt="Core Infrastructure">
<img src="https://img.shields.io/badge/Services-DNS%20%26%20DHCP-0078D4?style=for-the-badge&logo=microsoft&logoColor=white" alt="DNS and DHCP">
<img src="https://img.shields.io/badge/Resilience-Backup%20%26%20Recovery-2EA44F?style=for-the-badge&logo=windows&logoColor=white" alt="Backup and Recovery">

<br><br>

**The network, storage, printing, auditing, and recovery services that keep a Windows domain operational.**

[← Previous Section](../01-Identity-and-Access-Management/README.md) • [🏠 Main Repository](../README.md) • [Next Section →](../03-Enterprise-Operations/README.md)

</div>

---

## 📌 Section Overview

The **Core Infrastructure** section provides the shared services required by domain users, computers, applications, and administrators.

It covers name resolution, automatic IP configuration, centralized storage, folder redirection, print services, access auditing, backup, and disaster recovery.

---

## 🌐 Infrastructure Dependency Flow

```text
Active Directory Domain
          │
          ▼
DNS Name Resolution
          │
          ▼
DHCP Client Configuration
          │
          ▼
Domain Connectivity
          │
          ▼
File, Folder and Printer Access
          │
          ▼
Access Auditing
          │
          ▼
Backup and Disaster Recovery
```

---

## 📂 Modules

| # | Module | What It Demonstrates |
|---:|---|---|
| 01 | [DNS Infrastructure](01-DNS-Infrastructure/) | Internal DNS zones, resource records, forwarders, name resolution, validation, and troubleshooting. |
| 02 | [DHCP Infrastructure](02-DHCP-Infrastructure/) | DHCP authorization, IPv4 scopes, exclusions, options, reservations, leases, and client testing. |
| 03 | [File Services](03-File-Services/) | SMB shares, departmental folders, NTFS permissions, share permissions, and access validation. |
| 04 | [Folder Redirection](04-Folder-Redirection/) | Centralized storage of user folders through Group Policy with client-side verification. |
| 05 | [Print Server Management](05-Print-Server-Management/) | Shared printer installation, publication, deployment, queue management, and troubleshooting. |
| 06 | [File Server Auditing](06-File-Server-Auditing/) | Audit policy, SACL configuration, file-access events, investigation, and evidence collection. |
| 07 | [Backup and Disaster Recovery](07-Backup-and-Disaster-Recovery/) | Backup planning, restoration testing, recovery procedures, validation, and continuity documentation. |

---

## 🧰 Technologies

<div align="center">

<img src="https://img.shields.io/badge/DNS-Name%20Resolution-0078D4?style=flat-square&logo=windows&logoColor=white" alt="DNS">
<img src="https://img.shields.io/badge/DHCP-IP%20Management-00A4EF?style=flat-square&logo=microsoft&logoColor=white" alt="DHCP">
<img src="https://img.shields.io/badge/SMB-File%20Services-006666?style=flat-square&logo=windows&logoColor=white" alt="SMB">
<img src="https://img.shields.io/badge/NTFS-Permissions-5C2D91?style=flat-square&logo=windows&logoColor=white" alt="NTFS">
<img src="https://img.shields.io/badge/Backup-Recovery-2EA44F?style=flat-square&logo=windows&logoColor=white" alt="Backup">

</div>

---

## 🎯 Skills Demonstrated

- Windows DNS Server administration
- Windows DHCP Server administration
- DNS and DHCP troubleshooting
- SMB and NTFS permission design
- Centralized user-folder management
- Print-server administration
- File-access auditing
- Backup and restoration testing
- Disaster-recovery planning
- Infrastructure validation with PowerShell

---

## ✅ Section Outcome

After completing this section, domain clients can:

```text
Resolve internal names
Receive network settings automatically
Access authorized departmental data
Use redirected user folders
Connect to shared printers
Generate auditable access events
Recover data through documented procedures
```

---

<div align="center">

### Repository Navigation

[⬅️ Identity and Access](../01-Identity-and-Access-Management/README.md) · [🏠 Main Repository](../README.md) · [➡️ Enterprise Operations](../03-Enterprise-Operations/README.md)

<br>

<img src="https://capsule-render.vercel.app/api?type=waving&color=0:006666,45:0078D4,100:00A4EF&height=115&section=footer" width="100%" alt="Footer">

</div>


