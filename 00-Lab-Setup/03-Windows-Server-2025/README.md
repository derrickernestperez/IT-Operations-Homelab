# Windows Server 2025 Base Configuration

## 1. Project Overview
Deployed and configured the foundational Windows Server 2025 Virtual Machine. This server will act as the core infrastructure anchor (Domain Controller, DNS, and DHCP) for the enterprise homelab.

## 2. Environment
* **Hypervisor:** VMware Workstation Pro
* **Operating System:** Windows Server 2025 Standard (Desktop Experience)
* **Compute:** 2 vCPU, 4GB RAM, 60GB NVMe
* **Network Adapter:** `VMnet2` (Host-Only)

## 3. Architecture
```text
      [Host: Windows 11]
             │
      (VMware Hypervisor)
             │
       [Switch: VMnet2] ── (No DHCP, Isolated)
             │
   ┌─────────┴─────────┐
   │ WindowLabServer   │
   │ IP: 10.10.10.10   │
   │ SM: 255.0.0.0     │
   │ GW: <Blank>       │
   │ DNS: 127.0.0.1    │
   └───────────────────┘
