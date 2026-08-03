<!-- ====================================================== -->
<!-- FILE: 00-Lab-Setup/README.md                           -->
<!-- ====================================================== -->

<div align="center">

<img src="https://capsule-render.vercel.app/api?type=waving&color=0:0A66C2,50:0078D4,100:5C2D91&height=245&section=header&text=00%20Lab%20Setup&fontSize=54&fontColor=FFFFFF&fontAlignY=35&desc=Virtualization%20%E2%80%A2%20Windows%20Server%20%E2%80%A2%20Foundation&descSize=18&descAlignY=56&animation=fadeIn" width="100%" alt="Lab Setup">

<br>

<img src="https://img.shields.io/badge/Section-Lab%20Foundation-0078D4?style=for-the-badge&logo=windows&logoColor=white" alt="Lab Foundation">
<img src="https://img.shields.io/badge/Platform-VMware-607078?style=for-the-badge&logo=vmware&logoColor=white" alt="VMware">
<img src="https://img.shields.io/badge/Documentation-Validated-2EA44F?style=for-the-badge&logo=github&logoColor=white" alt="Validated">

<br><br>

**The technical foundation used by every later infrastructure, identity, operations, and cloud module.**

[🏠 Main Repository](../README.md) • [Next Section →](../01-Identity-and-Access-Management/README.md)

</div>

---

## 📌 Section Overview

The **Lab Setup** section documents how the virtual environment and primary Windows Server were planned, installed, configured, secured, and prepared for enterprise services.

It establishes a repeatable foundation before Active Directory, networking, automation, monitoring, and cloud identity are introduced.

---

## 🏗️ Foundation Flow

```text
Physical Windows 11 Host
          │
          ▼
VMware Workstation Pro
          │
          ▼
Create the SRV01 Virtual Machine
          │
          ▼
Install Windows Server
          │
          ▼
Configure Hostname, Networking and Time
          │
          ▼
Apply Updates and Security Settings
          │
          ▼
Ready for Enterprise Services
```

---

## 📂 Modules

| # | Module | What It Demonstrates |
|---:|---|---|
| 01 | [Enterprise Virtualization](01-Enterprise-Virtualization/) | Virtual-machine planning, VMware configuration, virtual hardware, UEFI, Secure Boot, storage, and NAT networking. |
| 02 | [Windows Server Installation](02-Windows-Server-Installation/) | Windows Server installation, edition selection, disk preparation, and initial administrator access. |
| 03 | [Initial Server Configuration](03-Initial-Server-Configuration/) | Server naming, static IPv4 settings, DNS configuration, updates, time settings, and initial validation. |

---

## 🧰 Technologies

<div align="center">

<img src="https://img.shields.io/badge/Windows%2011-Host-0078D4?style=flat-square&logo=windows11&logoColor=white" alt="Windows 11">
<img src="https://img.shields.io/badge/Windows%20Server-SRV01-0078D4?style=flat-square&logo=windows&logoColor=white" alt="Windows Server">
<img src="https://img.shields.io/badge/VMware-Workstation%20Pro-607078?style=flat-square&logo=vmware&logoColor=white" alt="VMware">
<img src="https://img.shields.io/badge/PowerShell-Validation-5391FE?style=flat-square&logo=powershell&logoColor=white" alt="PowerShell">
<img src="https://img.shields.io/badge/GitHub-Documentation-181717?style=flat-square&logo=github&logoColor=white" alt="GitHub">

</div>

---

## 🎯 Skills Demonstrated

- Virtual infrastructure planning
- VMware Workstation Pro administration
- Windows Server installation
- UEFI and Secure Boot configuration
- Static IPv4 and DNS configuration
- Operating-system updating and hardening
- Initial server-health validation
- Evidence-based technical documentation

---

## ✅ Section Outcome

After completing this section, the homelab has a stable and documented Windows Server foundation ready for:

```text
Active Directory
DNS and DHCP
Group Policy
File and Print Services
Automation and Monitoring
Microsoft Entra ID and Microsoft 365
```

---

<div align="center">

### Repository Navigation

[🏠 Main Repository](../README.md) · [➡️ Identity and Access Management](../01-Identity-and-Access-Management/README.md)

<br>

<img src="https://capsule-render.vercel.app/api?type=waving&color=0:0A66C2,50:0078D4,100:5C2D91&height=115&section=footer" width="100%" alt="Footer">

</div>


<!-- ====================================================== -->
<!-- FILE: 01-Identity-and-Access-Management/README.md      -->
<!-- ====================================================== -->

<div align="center">

<img src="https://capsule-render.vercel.app/api?type=waving&color=0:5C2D91,50:0078D4,100:00A4EF&height=245&section=header&text=01%20Identity%20%26%20Access&fontSize=50&fontColor=FFFFFF&fontAlignY=35&desc=Active%20Directory%20%E2%80%A2%20Group%20Policy%20%E2%80%A2%20Automation%20%E2%80%A2%20Auditing&descSize=17&descAlignY=56&animation=fadeIn" width="100%" alt="Identity and Access Management">

<br>

<img src="https://img.shields.io/badge/Section-Identity%20%26%20Access-5C2D91?style=for-the-badge&logo=microsoft&logoColor=white" alt="Identity and Access">
<img src="https://img.shields.io/badge/Directory-Active%20Directory-0078D4?style=for-the-badge&logo=windows&logoColor=white" alt="Active Directory">
<img src="https://img.shields.io/badge/Automation-PowerShell-5391FE?style=for-the-badge&logo=powershell&logoColor=white" alt="PowerShell">

<br><br>

**Centralized administration of users, computers, permissions, policies, account lifecycles, and directory security.**

[← Previous Section](../00-Lab-Setup/README.md) • [🏠 Main Repository](../README.md) • [Next Section →](../02-Core-Infrastructure/README.md)

</div>

---

## 📌 Section Overview

The **Identity and Access Management** section builds and operates the Windows domain environment.

It demonstrates how administrators create identities, organize directory objects, join client devices, enforce security policies, protect local administrator credentials, automate account lifecycles, audit activity, and support common helpdesk requests.

---

## 🔐 Identity Lifecycle

```text
Create the Windows Domain
          │
          ▼
Design Organizational Units
          │
          ▼
Create Users, Groups and Computers
          │
          ▼
Join Windows 11 to the Domain
          │
          ▼
Apply Group Policy and Windows LAPS
          │
          ▼
Automate Onboarding and Offboarding
          │
          ▼
Audit, Report and Support
```

---

## 📂 Modules

| # | Module | What It Demonstrates |
|---:|---|---|
| 01 | [Active Directory Domain Services](01-Active-Directory-Domain-Services/) | AD DS installation, domain-controller promotion, forest creation, DNS integration, and domain validation. |
| 02 | [Active Directory Administration](02-Active-Directory-Administration/) | Organizational units, users, groups, permissions, computer objects, and daily directory administration. |
| 03 | [Windows 11 Domain Join](03-Windows-11-Domain-Join/) | Client DNS preparation, domain joining, domain authentication, and workstation validation. |
| 04 | [Group Policy Hardening](04-Group-Policy-Hardening/) | Password policy, account lockout, workstation restrictions, security settings, and policy verification. |
| 05 | [Windows LAPS](05-Windows-LAPS/) | Automated local administrator password rotation, protected retrieval, and access control. |
| 06 | [User Lifecycle Automation](06-User-Lifecycle-Automation/) | PowerShell-based account creation, attributes, group assignment, and onboarding reports. |
| 07 | [Offboarding Automation](07-Offboarding-Automation/) | Account disabling, access removal, group cleanup, movement to disabled-user containers, and logging. |
| 08 | [Active Directory Auditing](08-Active-Directory-Auditing/) | Authentication events, account changes, group modifications, lockouts, and security-log investigation. |
| 09 | [Helpdesk Automation](09-Helpdesk-Automation/) | Account lookup, lockout checks, password operations, device checks, and support reporting. |
| 10 | [Group Policy Compliance Reporting](10-Group-Policy-Compliance-Reporting/) | Policy-result collection, compliance checks, exported reports, and remediation evidence. |

---

## 🧰 Technologies

<div align="center">

<img src="https://img.shields.io/badge/Active%20Directory-Domain%20Services-0078D4?style=flat-square&logo=windows&logoColor=white" alt="Active Directory">
<img src="https://img.shields.io/badge/Group%20Policy-Security-5C2D91?style=flat-square&logo=microsoft&logoColor=white" alt="Group Policy">
<img src="https://img.shields.io/badge/Windows%20LAPS-Password%20Protection-2EA44F?style=flat-square&logo=windows&logoColor=white" alt="Windows LAPS">
<img src="https://img.shields.io/badge/PowerShell-Automation-5391FE?style=flat-square&logo=powershell&logoColor=white" alt="PowerShell">
<img src="https://img.shields.io/badge/Event%20Logs-Auditing-D83B01?style=flat-square&logo=windows&logoColor=white" alt="Event Logs">

</div>

---

## 🎯 Skills Demonstrated

- Active Directory Domain Services administration
- Organizational-unit and security-group design
- Windows client domain joining
- Group Policy creation and troubleshooting
- Windows LAPS deployment
- Joiner, mover, and leaver lifecycle operations
- PowerShell identity automation
- Authentication and directory auditing
- Helpdesk account troubleshooting
- Compliance reporting and validation

---

## ✅ Section Outcome

This section produces a centralized identity environment where:

- Users and computers are managed through Active Directory.
- Access is assigned through security groups and policies.
- Local administrator passwords are protected.
- Repetitive lifecycle tasks are automated.
- Security events and configuration compliance are documented.

---

<div align="center">

### Repository Navigation

[⬅️ Lab Setup](../00-Lab-Setup/README.md) · [🏠 Main Repository](../README.md) · [➡️ Core Infrastructure](../02-Core-Infrastructure/README.md)

<br>

<img src="https://capsule-render.vercel.app/api?type=waving&color=0:5C2D91,50:0078D4,100:00A4EF&height=115&section=footer" width="100%" alt="Footer">

</div>
