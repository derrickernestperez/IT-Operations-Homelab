<div align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&color=gradient&customColorList=6,11&height=250&section=header&text=Active%20Directory%20Domain%20Services&fontSize=46&fontAlignY=35&desc=Module%204%20%7C%20Deploying%20the%20First%20Domain%20Controller&descSize=20&descAlignY=55" alt="AD DS Banner" width="100%">
</div>

---

# Overview

This module documents the deployment of **Active Directory Domain Services (AD DS)** on **SRV01**, transforming the standalone Windows Server into the organization's first **Domain Controller**.

As organizations grow, managing local user accounts on every workstation becomes inefficient and difficult to secure. Active Directory centralizes identity management, authentication, authorization, and policy enforcement across the enterprise.

By promoting SRV01 to a Domain Controller, the server becomes the core identity service responsible for authenticating users, managing computers, applying Group Policies, and hosting the Active Directory database.

This module establishes the foundation for every remaining lab, including Organizational Units (OUs), Group Policy, DNS, DHCP, Windows LAPS, Microsoft Entra ID synchronization, and enterprise identity management.

---

# Business Scenario

Your company has expanded from a small office with a handful of computers into an organization supporting multiple departments, including Human Resources, Sales, IT, and Finance.

Managing separate local user accounts on every workstation has become time-consuming, inconsistent, and difficult to secure.

The Infrastructure Team has decided to deploy **Active Directory Domain Services (AD DS)** to centralize authentication, simplify administration, and enforce consistent security policies across all domain-joined devices.

Your objective is to promote **SRV01** into the organization's first **Domain Controller**, creating a new Active Directory forest that will serve as the foundation of the company's identity infrastructure.

---

# Learning Objectives

By the end of this module, I was able to:

- Explain the purpose of Windows Server Roles
- Understand Active Directory Domain Services (AD DS)
- Differentiate Domains, Forests, and Domain Controllers
- Understand why DNS is required by Active Directory
- Install the Active Directory Domain Services role
- Install the required management tools
- Promote a Windows Server into a Domain Controller
- Create the first Active Directory Forest
- Understand the purpose of NTDS.dit and SYSVOL
- Verify a successful Domain Controller deployment

---

# Lab Environment Specifications

| Component | Configuration |
| :--- | :--- |
| **Server Name** | SRV01 |
| **Operating System** | Windows Server 2025 Standard Evaluation |
| **Hypervisor** | VMware Workstation Pro |
| **Domain Name** | homelab.local |
| **NetBIOS Name** | HOMELAB |
| **Forest Functional Level** | Windows Server 2025 |
| **Domain Functional Level** | Windows Server 2025 |
| **DNS Server** | Installed Automatically |
| **Database Path** | C:\Windows\NTDS |
| **SYSVOL Path** | C:\Windows\SYSVOL |

---

# Step-by-Step Implementation

## Step 1 — Open Add Roles and Features Wizard

Opened **Add Roles and Features** from **Server Manager** to begin installing a new Windows Server role.

Server roles extend the functionality of Windows Server by enabling services such as Active Directory, DNS, DHCP, File Services, Hyper-V, and many others.

<p align="center">
<img src="/00-Lab-Setup/04-Active-Directory-Domain-Services/Evidence/Screenshots/29-Add-Roles-And-Features.png" width="900" alt="Add Roles and Features">
</p>

---

## Step 2 — Select the Target Server

Selected **SRV01** as the destination server where the Active Directory Domain Services role would be installed.

Since this lab currently contains a single server, SRV01 will host all identity services for the environment.

<p align="center">
<img src="/01-Identity-and-Access-Management/04-Active-Directory-Domain-Services/Evidence/Screenshots/30-Server-Selection.png" width="900" alt="Server Selection">
</p>

---

## Step 3 — Select Active Directory Domain Services

Selected **Active Directory Domain Services (AD DS)** from the list of available server roles.

Active Directory Domain Services provides centralized authentication, directory services, identity management, and policy enforcement across Windows enterprise environments.

Unlike local accounts, domain accounts allow users to access multiple computers using a single set of credentials.

<p align="center">
<img src="/01-Identity-and-Access-Management/04-Active-Directory-Domain-Services/Evidence/Screenshots/31-Server-Roles.png" width="900" alt="Server Roles">
</p>

---

## Step 4 — Install Required Management Features

Windows detected several additional management tools required to administer Active Directory.

Accepted the installation of:

- Group Policy Management
- Active Directory Users and Computers
- Active Directory Administrative Center
- Active Directory Module for Windows PowerShell
- AD DS Snap-ins and Command-Line Tools

These management consoles are automatically installed alongside the AD DS role.

<p align="center">
<img src="/01-Identity-and-Access-Management/04-Active-Directory-Domain-Services/Evidence/Screenshots/32-Add-Required-Features.png" width="500" alt="Required Features">
</p>

---

## Step 5 — Promote SRV01 to a Domain Controller

After successfully installing the AD DS role, selected:

**Promote this server to a domain controller**

This launches the **Active Directory Domain Services Configuration Wizard**, which converts the server into a fully functional Domain Controller.

<p align="center">
<img src="/01-Identity-and-Access-Management/04-Active-Directory-Domain-Services/Evidence/Screenshots/33-Promote-This-Server-to-a-Domain-Controller.png" width="900" alt="Promote Server">
</p>

---

## Step 6 — Create a New Active Directory Forest

Selected **Add a new forest** and created the organization's first Active Directory forest.

Configured the following:

| Setting | Value |
| :--- | :--- |
| **Root Domain Name** | homelab.local |

A forest represents the highest-level security boundary in Active Directory and contains one or more domains.

Since this is a brand-new environment, a new forest was created.

<p align="center">
<img src="/01-Identity-and-Access-Management/04-Active-Directory-Domain-Services/Evidence/Screenshots/34-Deployment-Configuration.png" width="900" alt="Deployment Configuration">
</p>

---

## Step 7 — Configure Domain Controller Options

Configured the Domain Controller settings.

Selected:

- DNS Server
- Global Catalog (GC)

Configured the **Directory Services Restore Mode (DSRM)** password.

The DSRM account is used to recover Active Directory if the database becomes corrupted or requires offline maintenance.

Unlike domain accounts, this password only functions while the server is booted into Directory Services Restore Mode.
