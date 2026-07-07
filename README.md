<div align="center">

# Windows Infrastructure & Security Homelab

A hands-on enterprise Windows infrastructure lab built using VMware Workstation.

This project documents my journey in building, securing, monitoring, and troubleshooting a Windows-based enterprise environment while preparing for roles in IT Support, Systems Administration, Infrastructure Engineering, and Security Operations.

![Status](https://img.shields.io/badge/Status-In_Progress-brightgreen?style=for-the-badge)
![Windows Server](https://img.shields.io/badge/Windows_Server-2025-blue?style=for-the-badge&logo=windows)
![PowerShell](https://img.shields.io/badge/PowerShell-Automation-blue?style=for-the-badge&logo=powershell)
![GitHub](https://img.shields.io/badge/GitHub-Portfolio-black?style=for-the-badge&logo=github)

</div>

---

# About This Project

This repository serves as my technical portfolio while preparing for a career in Infrastructure, Systems Administration, and Cybersecurity.

Instead of only studying theory, I designed a Windows-based enterprise lab where I can build services, intentionally break configurations, troubleshoot issues, document incident reports, and automate administrative tasks using PowerShell.

Every project includes:

- Infrastructure configuration
- Security hardening
- Troubleshooting documentation
- Evidence (screenshots, logs, PowerShell output)
- Incident reports
- Lessons learned

---

# Lab Environment

## Host Machine

| Component | Specification |
|------------|--------------|
| Hypervisor | VMware Workstation |
| Storage Budget | 100 GB |
| Network | Host-Only (VMnet2) |

---

## Virtual Machines

### VM1

| Component | Value |
|-----------|------|
| OS | Windows Server 2025 |
| RAM | 4 GB |
| CPU | 2 vCPU |
| Roles | Active Directory, DNS, DHCP, File Server, Group Policy |

---

### VM2

| Component | Value |
|-----------|------|
| OS | Windows 11 Enterprise |
| RAM | 4 GB |
| CPU | 2 vCPU |
| Purpose | Domain-Joined Client, Security Monitoring |

---

# Architecture Overview

```
                    Internet
                        │
                 Cloudflare DNS
                        │
────────────────────────────────────
        VMware Host-Only Network
────────────────────────────────────
               │
     Windows Server 2025
               │
      ├── Active Directory
      ├── DNS
      ├── DHCP
      ├── File Server
      └── Group Policy
               │
               │
      Windows 11 Enterprise
               │
      ├── Domain Joined
      ├── Security Testing
      ├── Docker Desktop
      └── Future Wazuh SIEM
```

---

# Skills Demonstrated

## Windows Infrastructure

- Active Directory Domain Services
- Organizational Units (OU)
- Group Policy Objects
- DNS Server
- DHCP Server
- File Server
- NTFS Permissions
- Shared Folders

---

## Networking

- IPv4 Addressing
- DHCP Scope Configuration
- DNS Resolution
- Host-Only Networking
- Network Troubleshooting

---

## Security

- Role-Based Access Control (RBAC)
- Principle of Least Privilege
- Windows Firewall
- Windows LAPS *(Upcoming)*
- Sysmon *(Upcoming)*
- Wazuh SIEM *(Upcoming)*

---

## Administration

- Windows Server Administration
- PowerShell
- Git & GitHub
- Documentation
- Root Cause Analysis

---

# Repository Structure

```
IT-Operations-Homelab/

docs/
Interview-Preparation/

01-Infrastructure-Security/
│
├── DHCP
├── DNS
├── Active-Directory
├── Group-Policy
├── File-Server
└── Windows-LAPS

02-Security-Monitoring/
│
├── Sysmon
├── Wireshark
├── Wazuh
└── Event-Logs

03-Threat-Detection-IR/
│
├── Incident-Reports
├── Threat-Hunting
└── Malware-Triage

04-Purple-Team/
│
└── MITRE-ATTACK

05-Capstone/
```

---

# Current Projects

| Project | Technology | Status |
|----------|------------|--------|
| Active Directory | AD DS | ✅ |
| Organizational Units | Active Directory | ✅ |
| Security Groups | Active Directory | ✅ |
| Group Policy | GPO | ✅ |
| File Server | NTFS / SMB | ✅ |
| DHCP | Windows Server | 🟡 |
| DNS | Windows DNS | 🟡 |
| Windows LAPS | Security | ⏳ |
| Sysmon | Endpoint Monitoring | ⏳ |
| Wireshark | Packet Analysis | ⏳ |
| Wazuh SIEM | Security Monitoring | ⏳ |
| Threat Hunting | Blue Team | ⏳ |

---

# Documentation Standard

Every project follows the same documentation format.

## 1. What did I build?

Describe the technology implemented.

---

## 2. How did I secure it?

Document hardening techniques and security controls.

---

## 3. How did I verify it?

Include screenshots, PowerShell commands, logs, and testing.

---

## 4. What went wrong?

Document troubleshooting.

Include:

- Problem
- Investigation
- Root Cause
- Resolution
- Verification

---

## 5. Lessons Learned

Summarize key takeaways.

---

## 6. Skills Demonstrated

List the technologies used.

---

# Evidence Collected

Each project contains an Evidence folder including:

- Screenshots
- Event Viewer Logs
- PowerShell Output
- Network Captures
- Configuration Files
- Scripts

---

# Industry Standards

This lab aligns with concepts from:

- CompTIA Network+
- CompTIA Security+
- NIST Cybersecurity Framework (CSF)
- MITRE ATT&CK Framework

---

# Current Learning Roadmap

## Phase 1
Infrastructure Security

- Active Directory
- DNS
- DHCP
- Group Policy
- File Server
- Windows LAPS

---

## Phase 2
Security Monitoring

- Sysmon
- Event Viewer
- Windows Firewall
- Wireshark
- Wazuh

---

## Phase 3

Threat Detection & Incident Response

- Log Analysis
- Threat Hunting
- Malware Triage
- Incident Reporting

---

## Phase 4

Purple Team

- MITRE ATT&CK
- Detection Engineering
- Attack Simulation
- Validation

---

# Goal

My goal is to build a practical portfolio demonstrating the skills required for roles such as:

- IT Support Engineer
- Systems Administrator
- Infrastructure Engineer
- SOC Analyst (Tier 1)
- MSP Support Engineer
- Security Operations Engineer

Every configuration in this repository is documented, tested, and supported with evidence to demonstrate practical engineering and troubleshooting skills.
