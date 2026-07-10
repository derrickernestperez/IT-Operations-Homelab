<div align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&color=gradient&customColorList=0,2&height=250&section=header&text=Active%20Directory%20Domain%20Services&fontSize=48&fontAlignY=35&desc=Module%204%20%7C%20Deploying%20the%20First%20Domain%20Controller&descSize=20&descAlignY=55" alt="Active Directory Domain Services Banner" width="100%">
</div>

---

# Overview

This module documents the deployment of **Active Directory Domain Services (AD DS)** on **SRV01**, transforming a standalone Windows Server into the organization's first **Domain Controller (DC)**.

After completing the initial server configuration, the server was prepared for enterprise identity management by installing the Active Directory Domain Services role, promoting the server into a Domain Controller, creating the first Active Directory forest, and integrating DNS.

Completing this module establishes the core identity infrastructure that will support centralized authentication, authorization, Group Policy, DNS, and future enterprise services throughout the homelab.

---

# Business Scenario

The company has grown from a few standalone computers to dozens of employees.

Managing local accounts on every computer is no longer practical. Passwords become difficult to maintain, security policies become inconsistent, and administrators spend unnecessary time configuring every workstation individually.

To solve this problem, the Infrastructure Team has decided to deploy **Active Directory Domain Services (AD DS)**. By promoting **SRV01** into the organization's first **Domain Controller**, user authentication, computer management, DNS, and Group Policies can now be centrally managed from a single server.

---

# Learning Objectives

By the end of this module, I was able to:

- Explain the purpose of Windows Server Roles
- Understand Active Directory Domain Services (AD DS)
- Differentiate a Forest, Domain, and Domain Controller
- Explain why DNS is required by Active Directory
- Install the Active Directory Domain Services server role
- Promote Windows Server into a Domain Controller
- Create the first Active Directory Forest
- Verify a successful Active Directory deployment
- Explore the default Active Directory administrative tools

---

# Lab Environment Specifications

| Component | Configuration |
| :--- | :--- |
| **Server Name** | SRV01 |
| **Operating System** | Windows Server 2025 Standard Evaluation |
| **Hypervisor** | VMware Workstation Pro |
| **Network Mode** | NAT |
| **Static IP Address** | 192.168.241.10 |
| **Domain Name** | homelab.local |
| **NetBIOS Name** | HOMELAB |
| **DNS** | Installed with Active Directory |

---

# Step-by-Step Implementation

## Step 1 — Verify Initial Server Configuration

Before installing Active Directory, I verified that **SRV01** had been properly configured during the previous module.

This included reviewing the Server Manager dashboard, Local Server information, hostname, and network configuration to ensure the server was ready for enterprise infrastructure deployment.

<p align="center">
<img src="/00-Lab-Setup/04-Active-Directory-Domain-Services/Evidence/Screenshots/22-Server-Manager-Dashboard.png" width="900" alt="Server Manager Dashboard">
</p>

---

## Step 2 — Review Local Server

Selected **Local Server** to verify the current server configuration.

The Local Server page provides a summary of important system information including:

- Computer Name
- Workgroup
- Ethernet Configuration
- Windows Update
- Windows Firewall
- Remote Desktop
- NIC Teaming
- Installed Memory
- Operating System Version

Reviewing these settings confirms the operating system is healthy before deploying infrastructure services.

<p align="center">
<img src="/00-Lab-Setup/04-Active-Directory-Domain-Services/Evidence/Screenshots/23-Local-Server.png" width="900" alt="Local Server">
</p>

---

## Step 3 — Verify the Server Name

Opened **System Properties** to confirm that the server had been renamed to **SRV01**.

Using meaningful server names instead of randomly generated hostnames improves administration, monitoring, troubleshooting, and documentation within enterprise environments.

Examples include:

- SRV01
- DC01
- FILE01
- SQL01

<p align="center">
<img src="/00-Lab-Setup/04-Active-Directory-Domain-Services/Evidence/Screenshots/24-System-Properties-SRV01.png" width="500" alt="System Properties">
</p>

---

## Step 4 — Verify the Current Network Configuration

Before deploying Active Directory, the network configuration was reviewed using:

```powershell
ipconfig /all
```

This command displays detailed TCP/IP information including:

- Hostname
- IPv4 Address
- Subnet Mask
- Default Gateway
- DNS Server
- DHCP Status
- MAC Address

Verifying network information before installing Active Directory helps prevent DNS and connectivity issues during deployment.

<p align="center">
<img src="/00-Lab-Setup/04-Active-Directory-Domain-Services/Evidence/Screenshots/25-Current-Network-Configuration.png" width="900" alt="Current Network Configuration">
</p>

---

## Step 5 — Review IPv4 Properties

Opened the IPv4 properties of the Ethernet adapter.

Enterprise infrastructure servers should use static network addressing rather than DHCP because clients must always be able to locate critical services such as Active Directory and DNS.

<p align="center">
<img src="/00-Lab-Setup/04-Active-Directory-Domain-Services/Evidence/Screenshots/26-IPv4-Properties.png" width="500" alt="IPv4 Properties">
</p>

---

## Step 6 — Verify Static IP Configuration

Confirmed the static IPv4 configuration.

| Setting | Value |
| :--- | :--- |
| **IP Address** | 192.168.241.10 |
| **Subnet Mask** | 255.255.255.0 |
| **Default Gateway** | 192.168.241.2 |
| **Preferred DNS Server** | 192.168.241.2 |

A static IP address ensures that the Domain Controller always remains reachable using the same network address.

<p align="center">
<img src="/00-Lab-Setup/04-Active-Directory-Domain-Services/Evidence/Screenshots/27-Static-IP-Configuration.png" width="500" alt="Static IP Configuration">
</p>

---

## Step 7 — Verify the Updated Network Configuration

After applying the static IP address, the configuration was verified once again using:

```powershell
ipconfig /all
```

The verification confirmed that:

- SRV01 retained the correct hostname
- DHCP was no longer assigning an address
- The static IP configuration was correct
- DNS configuration was correct
- The default gateway was configured correctly

<p align="center">
<img src="/00-Lab-Setup/04-Active-Directory-Domain-Services/Evidence/Screenshots/28-Static-IP-Verification.png" width="900" alt="Static IP Verification">
</p>

---

## Step 8 — Launch the Add Roles and Features Wizard

Opened **Server Manager**, selected **Manage**, then clicked **Add Roles and Features**.

Windows Server uses **Roles** to extend its functionality. Installing a role allows the server to perform a specific enterprise service such as:

- Active Directory Domain Services
- DNS Server
- DHCP Server
- File Services
- Print Services
- Hyper-V

In this module, the Active Directory Domain Services role was installed to begin building the organization's centralized identity infrastructure.

<p align="center">
<img src="/00-Lab-Setup/04-Active-Directory-Domain-Services/Evidence/Screenshots/29-Add-Roles-And-Features.png" width="900" alt="Add Roles and Features">
</p>

---

## Step 9 — Select the Destination Server

Selected **SRV01** as the destination server.

Server Manager supports managing multiple Windows Servers simultaneously. Confirming the correct destination server helps prevent accidental installations on production systems.

<p align="center">
<img src="/00-Lab-Setup/04-Active-Directory-Domain-Services/Evidence/Screenshots/30-Server-Selection.png" width="900" alt="Server Selection">
</p>

---

## Step 10 — Install the Active Directory Domain Services Role

Selected **Active Directory Domain Services** from the list of available server roles.

Windows automatically prompted to install the required management tools needed to administer Active Directory after installation.

These tools include:

- Active Directory Users and Computers
- Active Directory Administrative Center
- Group Policy Management
- Active Directory PowerShell Module
- ADSI Edit

<p align="center">
<img src="/00-Lab-Setup/04-Active-Directory-Domain-Services/Evidence/Screenshots/31-Server-Roles.png" width="900" alt="Server Roles">
</p>

<p align="center">
<img src="/00-Lab-Setup/04-Active-Directory-Domain-Services/Evidence/Screenshots/32-Add-Required-Features.png" width="900" alt="Add Required Features">
</p>

---

## Step 11 — Promote the Server to a Domain Controller

After the Active Directory Domain Services role finished installing, a notification appeared in Server Manager prompting the server to be promoted into a Domain Controller.

Selecting **Promote this server to a domain controller** begins the deployment of the Active Directory forest, domain, DNS integration, and the Active Directory database.

<p align="center">
<img src="/00-Lab-Setup/04-Active-Directory-Domain-Services/Evidence/Screenshots/33-Promote-This-Server-to-a-Domain-Controller.png" width="900" alt="Promote Server to Domain Controller">
</p>

---

## Step 12 — Create the First Active Directory Forest

Selected **Add a new forest** and entered the root domain name:

```text
homelab.local
```

Because this is the first Domain Controller in the environment, Windows automatically creates a new Active Directory forest.

A forest is the highest logical structure within Active Directory and contains one or more domains.

<p align="center">
<img src="/00-Lab-Setup/04-Active-Directory-Domain-Services/Evidence/Screenshots/34-Deployment-Configuration.png" width="900" alt="Deployment Configuration">
</p>

---

## Step 13 — Configure DNS Options

The Active Directory installation automatically included the DNS Server role.

During this step, Windows displayed a DNS Delegation warning indicating that no parent DNS zone existed. This warning is expected when deploying a brand-new Active Directory forest and can safely be ignored in a standalone lab environment.

<p align="center">
<img src="/00-Lab-Setup/04-Active-Directory-Domain-Services/Evidence/Screenshots/35-DNS-Delegation.png" width="900" alt="DNS Delegation">
</p>

---

<div align="center">
<b>Continue to <code>Domain-Controller-Promotion.md</code></b><br>
<i>Part 2 covers the final promotion process, verification, Active Directory tools, and post-installation validation.</i>
</div>
