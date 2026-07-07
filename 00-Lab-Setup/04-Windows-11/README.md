# Windows 11 Endpoint Provisioning

## 1. Overview
Deployed and configured a virtualized Windows 11 Pro endpoint. In an enterprise environment, the client endpoint consumes the resources hosted by the server infrastructure. This machine serves as the primary target for future Group Policy enforcement, DHCP leasing, and security telemetry monitoring.

## 2. Learning Objectives
* Provision a virtualized enterprise endpoint meeting strict TPM and Secure Boot hardware requirements.
* Bypass consumer-level Out-of-Box Experience (OOBE) restrictions to provision an offline local administrator.
* Validate endpoint network isolation via APIPA (Automatic Private IP Addressing).

## 3. Core Concepts
* **Client vs Server OS:** Clients are optimized for single-user productivity; Servers manage centralized infrastructure.
* **OOBE:** The initial setup wizard designed by Microsoft, which heavily favors cloud-connected Microsoft Accounts over enterprise local accounts.
* **APIPA:** A fallback mechanism where a Windows client assigns itself a `169.254.x.x` address when it cannot reach a DHCP server.

## 4. Lab Environment
* **Hypervisor:** VMware Workstation Pro
* **Operating System:** Windows 11 Pro
* **Compute:** 2 vCPU, 4GB RAM, Virtual TPM (Encrypted)
* **Network:** `VMnet2` (Host-Only)

## 5. Architecture
```text
       [Switch: VMnet2] ── (No DHCP, Isolated)
             │
   ┌─────────┴─────────┐
   │ Windows 11 Client │ 
   │ IP: 169.254.x.x   │ <- (APIPA Fallback)
   │ Gateway: None     │
   └───────────────────┘
