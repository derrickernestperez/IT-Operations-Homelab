<div align="center">

![Homelab Infrastructure](https://img.shields.io/badge/🏗️_INFRASTRUCTURE-HOMELAB-0078D6?style=for-the-badge&labelColor=0A0A0A)

# Enterprise IT Operations & Security Homelab

A production-quality simulated corporate environment. Demonstrating the full engineering lifecycle: Building infrastructure, securing endpoints, monitoring traffic, and investigating incidents.

</div>

---

## 💻 Lab Specifications & Architecture
* **Hypervisor:** VMware Workstation (Isolated VMnet2 Host-Only Network)
* **Domain:** `windowlabs.local` (10.0.0.0/8 Subnet)
* **Server Node:** Windows Server 2025 (`10.10.10.10`)
* **Client Node:** Windows 11 Enterprise (Dynamic DHCP)

---

## 🗺️ The Engineering Roadmap

### Phase 1: Build & Secure the Enterprise (Infrastructure)
*Outcome: "I can build, manage, and secure a Windows domain network."*

| Project Module | Status | Core Technologies | Documentation |
| :--- | :--- | :--- | :--- |
| **01. Network Allocation** | 🟡 Configuring | DHCP, IPv4 Subnets, Hypervisor isolation | [View Project](./01-Infrastructure-Security/01-DHCP/) |
| **02. Name Resolution** | ⚪ Pending | DNS, Forwarders, Zones | [View Project](./01-Infrastructure-Security/02-DNS/) |
| **03. Core Identity** | 🟢 Complete | Active Directory, RBAC, OUs | [View Project](./01-Infrastructure-Security/03-Active-Directory/) |
| **04. Endpoint Hardening** | 🟢 Complete | Group Policy (GPO), UAC Hardening | [View Project](./01-Infrastructure-Security/04-Group-Policy/) |
| **05. Centralized Storage** | 🟢 Complete | NTFS, Share Perms, Drive Mapping | [View Project](./01-Infrastructure-Security/05-File-Server/) |

### Phase 2: Defend & Monitor (Security Operations)
*Outcome: "I can detect and understand activity on the network and endpoints."*
* ⚪ Deploy Sysmon & Event Forwarding
* ⚪ Deploy Wazuh SIEM Agent
* ⚪ Network Traffic Analysis (Wireshark/Nmap)

### Phase 3: Investigate & Respond (Incident Response)
*Outcome: "I can respond to and investigate security incidents."*
* ⚪ Malware Triage & Containment
* ⚪ MITRE ATT&CK Mapping
* ⚪ End-to-End Capstone Incident

---

## 🏃 Current Sprint
**Focus:** DHCP Architecture & Client Automation
* [x] Install DHCP Server Role
* [x] Execute Active Directory Authorization
* [x] Engineer 10.0.0.0/8 IPv4 Scope
* [x] Mitigate Hypervisor Rogue DHCP Conflict
* [ ] Configure DHCP Options (003, 006)
* [ ] Test Client DORA Process

---
<div align="center">
  <p><sub>Enterprise IT Operations Homelab · Derrick Ernest Perez</sub></p>
</div>
