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


<!-- ====================================================== -->
<!-- FILE: 03-Enterprise-Operations/README.md               -->
<!-- ====================================================== -->

<div align="center">

<img src="https://capsule-render.vercel.app/api?type=waving&color=0:C94B00,50:D83B01,100:5C2D91&height=245&section=header&text=03%20Enterprise%20Operations&fontSize=49&fontColor=FFFFFF&fontAlignY=35&desc=Monitoring%20%E2%80%A2%20Patching%20%E2%80%A2%20Remote%20Administration%20%E2%80%A2%20Documentation&descSize=16&descAlignY=56&animation=fadeIn" width="100%" alt="Enterprise Operations">

<br>

<img src="https://img.shields.io/badge/Section-Enterprise%20Operations-D83B01?style=for-the-badge&logo=windows&logoColor=white" alt="Enterprise Operations">
<img src="https://img.shields.io/badge/Operations-Monitor%20%26%20Manage-5C2D91?style=for-the-badge&logo=microsoft&logoColor=white" alt="Monitor and Manage">
<img src="https://img.shields.io/badge/Automation-PowerShell-5391FE?style=for-the-badge&logo=powershell&logoColor=white" alt="PowerShell">

<br><br>

**Day-to-day infrastructure operations: monitor, detect, patch, troubleshoot, administer, validate, and document.**

[← Previous Section](../02-Core-Infrastructure/README.md) • [🏠 Main Repository](../README.md) • [Next Section →](../04-Cloud-Identity-and-M365/README.md)

</div>

---

## 📌 Section Overview

The **Enterprise Operations** section focuses on recurring administrative work performed after infrastructure has been deployed.

It demonstrates security monitoring, centralized server management, patch operations, health monitoring, remote administration, incident handling, and knowledge-base documentation.

---

## 🔄 Operations Lifecycle

```text
Monitor Systems
      │
      ▼
Detect an Issue or Risk
      │
      ▼
Investigate the Cause
      │
      ▼
Remediate or Patch
      │
      ▼
Validate Service Health
      │
      ▼
Document the Result
      │
      ▼
Automate and Improve
```

---

## 📂 Modules

| # | Module | What It Demonstrates |
|---:|---|---|
| 01 | [Security Monitoring with Honey Accounts](01-Security-Monitoring-Honey-Accounts/) | Decoy identity monitoring, Windows Security events, PowerShell detection, alert logging, and investigation. |
| 02 | [Windows Admin Center](02-Windows-Admin-Center/) | Browser-based server management, performance review, event analysis, service control, and process inspection. |
| 03 | [WSUS Patch Management](03-WSUS-Patch-Management/) | Update synchronization, classifications, pilot groups, approvals, client policy, and compliance reporting. |
| 04 | [Server Monitoring](04-Server-Monitoring/) | CPU, memory, disks, services, events, networking, domain health, scheduled checks, and historical reports. |
| 05 | [Remote Administration](05-Remote-Administration/) | RDP, Server Manager, Computer Management, WinRM, PowerShell Remoting, SMB, and OpenSSH validation. |
| 06 | [Documentation and Knowledge Base](06-Documentation-and-Knowledge-Base/) | Incident records, root-cause analysis, SOPs, knowledge articles, inventories, templates, and validation reports. |

---

## 🧰 Technologies

<div align="center">

<img src="https://img.shields.io/badge/Windows%20Admin%20Center-Administration-0078D4?style=flat-square&logo=windows&logoColor=white" alt="Windows Admin Center">
<img src="https://img.shields.io/badge/WSUS-Patch%20Management-D83B01?style=flat-square&logo=windows&logoColor=white" alt="WSUS">
<img src="https://img.shields.io/badge/PowerShell-Monitoring-5391FE?style=flat-square&logo=powershell&logoColor=white" alt="PowerShell">
<img src="https://img.shields.io/badge/WinRM-Remote%20Management-5C2D91?style=flat-square&logo=windows&logoColor=white" alt="WinRM">
<img src="https://img.shields.io/badge/GitHub-Knowledge%20Base-181717?style=flat-square&logo=github&logoColor=white" alt="GitHub">

</div>

---

## 🎯 Skills Demonstrated

- Windows security-event monitoring
- Windows Admin Center administration
- WSUS deployment and patch approval
- PowerShell health monitoring
- Performance and service troubleshooting
- RDP, WinRM, PowerShell Remoting, and SSH
- Scheduled operational checks
- Root-cause analysis
- Incident and knowledge-base writing
- Evidence-based change validation

---

## ✅ Section Outcome

This section demonstrates an operational support cycle that can:

- Detect suspicious authentication activity.
- Centralize server administration.
- Deploy and report on Windows updates.
- Identify service and performance problems.
- Manage systems remotely through multiple protocols.
- Preserve troubleshooting knowledge for future incidents.

---

<div align="center">

### Repository Navigation

[⬅️ Core Infrastructure](../02-Core-Infrastructure/README.md) · [🏠 Main Repository](../README.md) · [➡️ Cloud Identity and M365](../04-Cloud-Identity-and-M365/README.md)

<br>

<img src="https://capsule-render.vercel.app/api?type=waving&color=0:C94B00,50:D83B01,100:5C2D91&height=115&section=footer" width="100%" alt="Footer">

</div>
