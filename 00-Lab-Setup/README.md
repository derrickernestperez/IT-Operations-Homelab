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
