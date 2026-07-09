<div align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&color=gradient&customColorList=0,2&height=250&section=header&text=Active%20Directory%20Domain%20Services&fontSize=48&fontAlignY=35&desc=Module%204%20%7C%20Deploying%20the%20First%20Domain%20Controller&descSize=20&descAlignY=55" alt="Active Directory Domain Services Banner" width="100%">
</div>

---

# Overview

This module documents the deployment of **Active Directory Domain Services (AD DS)** on **SRV01**.

After preparing the server with a static IP address and enterprise naming standards in the previous module, the next step is to transform the standalone Windows Server into the organization's first **Domain Controller (DC)**.

Active Directory provides centralized identity management, allowing administrators to manage users, computers, security groups, organizational units (OUs), and Group Policies from a single location. This becomes the foundation for all future infrastructure services throughout the homelab.

---

# Business Scenario

The company has grown from a few standalone computers to dozens of employees.

Managing separate local user accounts on every workstation has become inefficient and difficult to maintain.

To centralize authentication, simplify administration, and improve security, the Infrastructure Team has decided to deploy **Active Directory Domain Services (AD DS)**.

Your task is to install the AD DS server role, create the company's first Active Directory forest, and promote **SRV01** into the organization's first **Domain Controller**.

---

# Learning Objectives

By the end of this module, I was able to:

- Understand the purpose of Windows Server Roles
- Explain Active Directory Domain Services (AD DS)
- Differentiate a Domain, Forest, and Domain Controller
- Understand why DNS is required for Active Directory
- Install the Active Directory Domain Services role
- Promote a Windows Server into a Domain Controller
- Create the organization's first Active Directory Forest
- Verify a successful Active Directory deployment

---

# Lab Environment Specifications

| Component | Configuration |
| :--- | :--- |
| **Server Name** | SRV01 |
| **Operating System** | Windows Server 2025 Standard Evaluation |
| **Hypervisor** | VMware Workstation Pro |
| **Network Mode** | NAT |
| **Domain Name** | homelab.local |
| **NetBIOS Name** | HOMELAB |
| **DNS** | Installed with Active Directory |
| **Database** | NTDS.dit |
| **SYSVOL** | C:\Windows\SYSVOL |

---

# Step-by-Step Implementation

## Step 1 — Open Add Roles and Features

From **Server Manager**, selected **Add Roles and Features** to begin installing a new Windows Server role.

The Add Roles and Features Wizard allows administrators to extend the capabilities of Windows Server by installing enterprise infrastructure services such as Active Directory, DNS, DHCP, File Services, Print Services, and Hyper-V.

<p align="center">
<img src="/01-Identity-and-Access-Management/04-Active-Directory-Domain-Services/Evidence/Screenshots/29-Add-Roles-And-Features.png" width="900" alt="Add Roles and Features">
</p>

---

## Step 2 — Select the Target Server

Selected **SRV01** as the destination server where Active Directory Domain Services will be installed.

In enterprise environments, Server Manager can manage multiple remote servers simultaneously. Selecting the correct target server ensures that the role is installed on the intended infrastructure server.

<p align="center">
<img src="/01-Identity-and-Access-Management/04-Active-Directory-Domain-Services/Evidence/Screenshots/30-Server-Selection.png" width="900" alt="Server Selection">
</p>

---

## Step 3 — Select Active Directory Domain Services

Selected the **Active Directory Domain Services (AD DS)** server role.

A **Server Role** defines the primary function of a Windows Server. By installing the AD DS role, SRV01 is prepared to become a Domain Controller capable of managing centralized authentication and directory services.

Windows automatically detected additional management tools required for administering Active Directory.

<p align="center">
<img src="/01-Identity-and-Access-Management/04-Active-Directory-Domain-Services/Evidence/Screenshots/31-Server-Roles.png" width="900" alt="Server Roles">
</p>

---

## Step 4 — Install Required Features

Accepted the required management tools automatically selected by Windows.

These tools include:

- Active Directory Users and Computers
- Active Directory Administrative Center
- Group Policy Management
- Active Directory Module for Windows PowerShell

These management consoles allow administrators to create users, computers, Organizational Units (OUs), and manage Group Policy after the server is promoted.

<p align="center">
<img src="/01-Identity-and-Access-Management/04-Active-Directory-Domain-Services/Evidence/Screenshots/32-Add-Required-Features.png" width="900" alt="Add Required Features">
</p>

---

## Step 5 — Promote This Server to a Domain Controller

After the installation completed successfully, selected **Promote this server to a domain controller**.

Installing the AD DS role alone does not create Active Directory.

The server must first be promoted, which installs the Active Directory database, creates the domain, configures DNS, and transforms the server into a Domain Controller.

<p align="center">
<img src="/01-Identity-and-Access-Management/04-Active-Directory-Domain-Services/Evidence/Screenshots/33-Promote-This-Server-to-a-Domain-Controller.png" width="900" alt="Promote Server">
</p>

---

## Step 6 — Create a New Forest

Selected **Add a new forest** and specified the root domain name:

```text
homelab.local
```

A **Forest** represents the highest-level logical structure in Active Directory.

Since this homelab does not have an existing Active Directory environment, a brand-new forest was created to serve as the foundation for the enterprise infrastructure.

<p align="center">
<img src="/01-Identity-and-Access-Management/04-Active-Directory-Domain-Services/Evidence/Screenshots/34-Deployment-Configuration.png" width="900" alt="Deployment Configuration">
</p>

---

## Step 7 — Configure DNS

Reviewed the DNS delegation warning.

Because this deployment creates an entirely new Active Directory forest, there is no existing parent DNS zone to delegate authority.

The warning is expected and does not prevent the installation from continuing.

Windows automatically installs and configures the DNS Server role alongside Active Directory, allowing domain clients to locate the Domain Controller for authentication and directory services.

<p align="center">
<img src="/01-Identity-and-Access-Management/04-Active-Directory-Domain-Services/Evidence/Screenshots/35-DNS-Delegation.png" width="900" alt="DNS Delegation">
</p>

---

<div align="center">
<b>Continue → Domain-Promotion.md</b><br>
<i>Continuing the Domain Controller promotion, validation, and Active Directory deployment.</i>
</div><div align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&color=gradient&customColorList=0,2&height=250&section=header&text=Active%20Directory%20Domain%20Services&fontSize=48&fontAlignY=35&desc=Module%204%20%7C%20Deploying%20the%20First%20Domain%20Controller&descSize=20&descAlignY=55" alt="Active Directory Domain Services Banner" width="100%">
</div>

---

# Overview

This module documents the deployment of **Active Directory Domain Services (AD DS)** on **SRV01**.

After preparing the server with a static IP address and enterprise naming standards in the previous module, the next step is to transform the standalone Windows Server into the organization's first **Domain Controller (DC)**.

Active Directory provides centralized identity management, allowing administrators to manage users, computers, security groups, organizational units (OUs), and Group Policies from a single location. This becomes the foundation for all future infrastructure services throughout the homelab.

---

# Business Scenario

The company has grown from a few standalone computers to dozens of employees.

Managing separate local user accounts on every workstation has become inefficient and difficult to maintain.

To centralize authentication, simplify administration, and improve security, the Infrastructure Team has decided to deploy **Active Directory Domain Services (AD DS)**.

Your task is to install the AD DS server role, create the company's first Active Directory forest, and promote **SRV01** into the organization's first **Domain Controller**.

---

# Learning Objectives

By the end of this module, I was able to:

- Understand the purpose of Windows Server Roles
- Explain Active Directory Domain Services (AD DS)
- Differentiate a Domain, Forest, and Domain Controller
- Understand why DNS is required for Active Directory
- Install the Active Directory Domain Services role
- Promote a Windows Server into a Domain Controller
- Create the organization's first Active Directory Forest
- Verify a successful Active Directory deployment

---

# Lab Environment Specifications

| Component | Configuration |
| :--- | :--- |
| **Server Name** | SRV01 |
| **Operating System** | Windows Server 2025 Standard Evaluation |
| **Hypervisor** | VMware Workstation Pro |
| **Network Mode** | NAT |
| **Domain Name** | homelab.local |
| **NetBIOS Name** | HOMELAB |
| **DNS** | Installed with Active Directory |
| **Database** | NTDS.dit |
| **SYSVOL** | C:\Windows\SYSVOL |

---

# Step-by-Step Implementation

## Step 1 — Open Add Roles and Features

From **Server Manager**, selected **Add Roles and Features** to begin installing a new Windows Server role.

The Add Roles and Features Wizard allows administrators to extend the capabilities of Windows Server by installing enterprise infrastructure services such as Active Directory, DNS, DHCP, File Services, Print Services, and Hyper-V.

<p align="center">
<img src="/01-Identity-and-Access-Management/04-Active-Directory-Domain-Services/Evidence/Screenshots/29-Add-Roles-And-Features.png" width="900" alt="Add Roles and Features">
</p>

---

## Step 2 — Select the Target Server

Selected **SRV01** as the destination server where Active Directory Domain Services will be installed.

In enterprise environments, Server Manager can manage multiple remote servers simultaneously. Selecting the correct target server ensures that the role is installed on the intended infrastructure server.

<p align="center">
<img src="/01-Identity-and-Access-Management/04-Active-Directory-Domain-Services/Evidence/Screenshots/30-Server-Selection.png" width="900" alt="Server Selection">
</p>

---

## Step 3 — Select Active Directory Domain Services

Selected the **Active Directory Domain Services (AD DS)** server role.

A **Server Role** defines the primary function of a Windows Server. By installing the AD DS role, SRV01 is prepared to become a Domain Controller capable of managing centralized authentication and directory services.

Windows automatically detected additional management tools required for administering Active Directory.

<p align="center">
<img src="/01-Identity-and-Access-Management/04-Active-Directory-Domain-Services/Evidence/Screenshots/31-Server-Roles.png" width="900" alt="Server Roles">
</p>

---

## Step 4 — Install Required Features

Accepted the required management tools automatically selected by Windows.

These tools include:

- Active Directory Users and Computers
- Active Directory Administrative Center
- Group Policy Management
- Active Directory Module for Windows PowerShell

These management consoles allow administrators to create users, computers, Organizational Units (OUs), and manage Group Policy after the server is promoted.

<p align="center">
<img src="/01-Identity-and-Access-Management/04-Active-Directory-Domain-Services/Evidence/Screenshots/32-Add-Required-Features.png" width="900" alt="Add Required Features">
</p>

---

## Step 5 — Promote This Server to a Domain Controller

After the installation completed successfully, selected **Promote this server to a domain controller**.

Installing the AD DS role alone does not create Active Directory.

The server must first be promoted, which installs the Active Directory database, creates the domain, configures DNS, and transforms the server into a Domain Controller.

<p align="center">
<img src="/01-Identity-and-Access-Management/04-Active-Directory-Domain-Services/Evidence/Screenshots/33-Promote-This-Server-to-a-Domain-Controller.png" width="900" alt="Promote Server">
</p>

---

## Step 6 — Create a New Forest

Selected **Add a new forest** and specified the root domain name:

```text
homelab.local
```

A **Forest** represents the highest-level logical structure in Active Directory.

Since this homelab does not have an existing Active Directory environment, a brand-new forest was created to serve as the foundation for the enterprise infrastructure.

<p align="center">
<img src="/01-Identity-and-Access-Management/04-Active-Directory-Domain-Services/Evidence/Screenshots/34-Deployment-Configuration.png" width="900" alt="Deployment Configuration">
</p>

---

## Step 7 — Configure DNS

Reviewed the DNS delegation warning.

Because this deployment creates an entirely new Active Directory forest, there is no existing parent DNS zone to delegate authority.

The warning is expected and does not prevent the installation from continuing.

Windows automatically installs and configures the DNS Server role alongside Active Directory, allowing domain clients to locate the Domain Controller for authentication and directory services.

<p align="center">
<img src="/01-Identity-and-Access-Management/04-Active-Directory-Domain-Services/Evidence/Screenshots/35-DNS-Delegation.png" width="900" alt="DNS Delegation">
</p>

---

<div align="center">
<b>Continue → Domain-Promotion.md</b><br>
<i>Continuing the Domain Controller promotion, validation, and Active Directory deployment.</i>
</div>
