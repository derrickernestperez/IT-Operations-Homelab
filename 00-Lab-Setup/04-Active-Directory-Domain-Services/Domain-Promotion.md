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
<img src="/01-Identity-and-Access-Management/04-Active-Directory-Domain-Services/Evidence/Screenshots/36-NetBIOS-Name.png" width="900" alt="NetBIOS Name">
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
<img src="/01-Identity-and-Access-Management/04-Active-Directory-Domain-Services/Evidence/Screenshots/37-Active-Directory-Paths.png" width="900" alt="Active Directory Paths">
</p>

---

## Step 10 — Review Deployment Configuration

Reviewed the complete deployment summary before promoting the server.

Windows also generated the equivalent **PowerShell script**, demonstrating that the entire deployment could be automated without using the graphical interface.

Learning both GUI-based administration and PowerShell automation is an essential skill for Windows Server administrators.

<p align="center">
<img src="/01-Identity-and-Access-Management/04-Active-Directory-Domain-Services/Evidence/Screenshots/38-Review-Options.png" width="900" alt="Review Options">
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
<img src="/01-Identity-and-Access-Management/04-Active-Directory-Domain-Services/Evidence/Screenshots/39-Prerequisites-Check.png" width="900" alt="Prerequisites Check">
</p>

---

## Step 12 — Verify Successful Domain Controller Promotion

After selecting **Install**, Windows promoted SRV01 into the organization's first Domain Controller.

The server automatically restarted to complete the installation.

Following the reboot, Server Manager recognized the server as a Domain Controller capable of hosting centralized directory services.

<p align="center">
<img src="/01-Identity-and-Access-Management/04-Active-Directory-Domain-Services/Evidence/Screenshots/40-Server-Manager-After-Promotion.png" width="900" alt="Server Manager After Promotion">
</p>

---

## Step 13 — Verify Administrative Tools

Opened **Server Manager → Tools**.

Several new management consoles became available after Active Directory installation, including:

- Active Directory Users and Computers
- Active Directory Administrative Center
- DNS Manager
- Active Directory Domains and Trusts
- Active Directory Sites and Services
- Group Policy Management
- ADSI Edit

These tools provide centralized administration for Active Directory environments.

<p align="center">
<img src="/01-Identity-and-Access-Management/04-Active-Directory-Domain-Services/Evidence/Screenshots/41-Administrative-Tools.png" width="900" alt="Administrative Tools">
</p>

---

## Step 14 — Verify Active Directory Deployment

Opened **Active Directory Users and Computers** to confirm that the new domain had been created successfully.

Windows automatically generated several default containers, including:

- Builtin
- Computers
- Domain Controllers
- ForeignSecurityPrincipals
- Managed Service Accounts
- Users

The successful creation of these containers confirms that Active Directory was deployed correctly and that SRV01 is now functioning as the first Domain Controller for the **homelab.local** forest.

<p align="center">
<img src="/01-Identity-and-Access-Management/04-Active-Directory-Domain-Services/Evidence/Screenshots/42-Default-Active-Directory.png" width="900" alt="Default Active Directory">
</p>

---

# Technical Concepts & Justifications

### Why install Active Directory Domain Services?

Active Directory centralizes authentication, authorization, and administration across the organization.

Instead of creating separate local accounts on every workstation, administrators create a single domain account that users can access from any domain-joined computer.

---

### What is a Domain Controller?

A Domain Controller (DC) is a Windows Server responsible for authenticating users, managing computer accounts, enforcing Group Policy, hosting Active Directory, and providing centralized identity management across the network.

---

### Why is DNS required?

Active Directory depends on DNS to locate Domain Controllers and directory services.

Without DNS:

- Domain joins fail
- User authentication fails
- Group Policy processing fails
- Clients cannot locate Active Directory services

---

### What is NTDS.dit?

NTDS.dit is the Active Directory database.

It stores:

- User accounts
- Computer accounts
- Security groups
- Organizational Units
- Password hashes
- Directory objects

---

### What is SYSVOL?

SYSVOL stores files that are shared across Domain Controllers, including:

- Group Policy Objects (GPOs)
- Logon scripts
- Administrative templates

When multiple Domain Controllers exist, SYSVOL is automatically replicated to maintain consistency throughout the environment.

---

# Skills Demonstrated

- Active Directory Deployment
- Domain Controller Promotion
- Windows Server Administration
- Active Directory Forest Creation
- DNS Integration
- Identity Management
- Enterprise Infrastructure Deployment
- Windows Server Role Installation

---

# Mock Interview Q&A

### Q: What is the difference between installing the AD DS role and promoting a Domain Controller?

> **A:** Installing the AD DS role only adds the required software components. Promoting the server creates the Active Directory database, configures DNS, establishes the domain and forest, and transforms the server into a functioning Domain Controller.

---

### Q: Why does Active Directory automatically install DNS?

> **A:** Active Directory relies on DNS for service discovery. Clients use DNS to locate Domain Controllers, authenticate users, process Group Policy, and communicate with directory services.

---

### Q: What is the purpose of the NTDS database?

> **A:** NTDS.dit is the central database for Active Directory. It stores users, computers, groups, Organizational Units, password hashes, and other directory objects required for authentication and administration.

---

<div align="center">
  <b><a href="#">Next Module: Active Directory Administration</a></b><br>
  <i>Creating Organizational Units (OUs), domain users, security groups, and designing an enterprise Active Directory structure.</i>
</div>
