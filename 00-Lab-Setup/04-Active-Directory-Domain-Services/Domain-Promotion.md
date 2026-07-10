<div align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&color=gradient&customColorList=0,2&height=250&section=header&text=Domain%20Controller%20Promotion&fontSize=48&fontAlignY=35&desc=Module%204%20%7C%20Completing%20Active%20Directory%20Deployment&descSize=20&descAlignY=55" alt="Domain Controller Promotion Banner" width="100%">
</div>

---

# Overview

This document continues the deployment of **Active Directory Domain Services (AD DS)** by promoting **SRV01** into the organization's first **Domain Controller**.

During this stage, Active Directory creates the domain database, configures DNS integration, initializes the SYSVOL folder, validates deployment prerequisites, and transforms the standalone Windows Server into the primary identity provider for the enterprise environment.

Upon completion, **SRV01** becomes responsible for authenticating users, managing computers, applying Group Policy, and providing centralized administration throughout the domain.

---

# Continuing the Deployment

With the Active Directory Domain Services role installed, the remaining steps configure the logical components required to build the organization's identity infrastructure.

This includes:

- Configuring the NetBIOS name
- Verifying database storage paths
- Reviewing deployment settings
- Validating prerequisites
- Promoting SRV01 into the first Domain Controller
- Verifying Active Directory management tools
- Confirming the successful creation of the Active Directory forest

---

# Step-by-Step Implementation

## Step 8 — Verify the NetBIOS Domain Name

Windows automatically generated the NetBIOS name:

```text
HOMELAB
```

The NetBIOS name provides compatibility with legacy Windows networking and authentication mechanisms.

Although modern environments primarily use DNS names, NetBIOS is still maintained for backward compatibility.

<p align="center">
<img src="/00-Lab-Setup/04-Active-Directory-Domain-Services/Evidence/Screenshots/36-NetBIOS-Name.png" width="900" alt="NetBIOS Name">
</p>

---

## Step 9 — Verify Active Directory Database Paths

Reviewed the default storage locations used by Active Directory.

Windows automatically creates:

| Component | Location |
| :--- | :--- |
| **Database** | C:\Windows\NTDS |
| **Log Files** | C:\Windows\NTDS |
| **SYSVOL** | C:\Windows\SYSVOL |

The **NTDS** folder stores the Active Directory database, while **SYSVOL** stores Group Policy Objects (GPOs), logon scripts, and other files replicated between Domain Controllers.

<p align="center">
<img src="/00-Lab-Setup/04-Active-Directory-Domain-Services/Evidence/Screenshots/37-Active-Directory-Paths.png" width="900" alt="Active Directory Paths">
</p>

---

## Step 10 — Review Deployment Configuration

Reviewed the complete deployment summary before promoting the server.

Windows also generated the equivalent **PowerShell script**, demonstrating that the entire deployment could be automated without using the graphical interface.

Learning both GUI-based administration and PowerShell automation is an essential skill for Windows Server administrators.

<p align="center">
<img src="/00-Lab-Setup/04-Active-Directory-Domain-Services/Evidence/Screenshots/38-Review-Options.png" width="900" alt="Review Options">
</p>

---

## Step 11 — Validate Prerequisites

Windows performed a final validation before promoting SRV01 into a Domain Controller.

The wizard verified:

- Required server roles
- Network configuration
- DNS configuration
- Active Directory paths
- Operating system compatibility
- Forest configuration

The only warning displayed concerned **DNS Delegation**, which is expected when deploying a brand-new Active Directory forest without an existing parent DNS infrastructure.

All prerequisite checks passed successfully.

<p align="center">
<img src="/00-Lab-Setup/04-Active-Directory-Domain-Services/Evidence/Screenshots/39-Prerequisites-Check.png" width="900" alt="Prerequisites Check">
</p>

---
