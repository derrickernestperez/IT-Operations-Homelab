<div align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&color=gradient&customColorList=0,2&height=250&section=header&text=Domain%20Controller%20Promotion&fontSize=48&fontAlignY=35&desc=Module%204%20%7C%20Completing%20Active%20Directory%20Deployment&descSize=20&descAlignY=55" alt="Domain Controller Promotion Banner" width="100%">
</div>

---

# Overview

This document continues the deployment of **Active Directory Domain Services (AD DS)** by completing the promotion of **SRV01** into the organization's first **Domain Controller (DC)**.

After installing the AD DS role, Windows Server was configured to create a new Active Directory forest, install DNS, initialize the Active Directory database, and verify that all directory services were successfully deployed.

---

# Step-by-Step Implementation

## Step 14 — Verify the NetBIOS Domain Name

Windows automatically generated the NetBIOS domain name:

```
HOMELAB
```

The NetBIOS name provides backward compatibility with legacy Windows systems while modern clients primarily use DNS for name resolution.

No changes were required since the automatically generated name matched the intended environment.

<p align="center">
<img src="/00-Lab-Setup/04-Active-Directory-Domain-Services/Evidence/Screenshots/36-NetBIOS-Name.png" width="900" alt="NetBIOS Name">
</p>

---

## Step 15 — Review Active Directory Database Paths

The Active Directory installation wizard displayed the default storage locations for the Active Directory database.

| Component | Default Path |
| :--- | :--- |
| Database | C:\Windows\NTDS |
| Log Files | C:\Windows\NTDS |
| SYSVOL | C:\Windows\SYSVOL |

The **NTDS** folder stores the Active Directory database, while the **SYSVOL** folder stores Group Policy Objects (GPOs) and logon scripts that are replicated to every Domain Controller within the domain.

For a small homelab, the default locations are sufficient and follow Microsoft's recommended configuration.

<p align="center">
<img src="/00-Lab-Setup/04-Active-Directory-Domain-Services/Evidence/Screenshots/37-Active-Directory-Paths.png" width="900" alt="Active Directory Paths">
</p>

---

## Step 16 — Review Deployment Configuration

Before the installation began, Windows displayed a summary of all selected configuration options.

This review page confirmed:

- New Forest deployment
- Domain Name: homelab.local
- NetBIOS Name: HOMELAB
- DNS installation
- Forest Functional Level
- Domain Functional Level

Windows also generated the equivalent PowerShell deployment script.

This demonstrates that every graphical installation performed through Server Manager can also be automated using PowerShell, which is commonly used in enterprise environments.

<p align="center">
<img src="/00-Lab-Setup/04-Active-Directory-Domain-Services/Evidence/Screenshots/38-Review-Options.png" width="900" alt="Review Options">
</p>

---

## Step 17 — Complete the Prerequisite Checks

Before promoting the server into a Domain Controller, Windows performed several prerequisite validations.

The wizard verified:

- Operating System compatibility
- DNS configuration
- Active Directory database paths
- Required server roles
- Network configuration
- Forest configuration

A DNS Delegation warning appeared because there was no existing parent DNS server.

Since this homelab was creating a brand-new Active Directory forest, the warning was expected and did not prevent installation.

After all prerequisite checks passed successfully, Windows began configuring Active Directory and automatically restarted the server.

<p align="center">
<img src="/00-Lab-Setup/04-Active-Directory-Domain-Services/Evidence/Screenshots/39-Prerequisites-Check.png" width="900" alt="Prerequisites Check">
</p>

---

## Step 18 — Verify the Domain Controller

After restarting, Server Manager was opened to verify that the promotion completed successfully.

The successful promotion confirms that:

- Active Directory Domain Services is operational
- DNS Server is operational
- The server is now functioning as a Domain Controller
- The Active Directory database was successfully created

SRV01 is now the primary Domain Controller for the **homelab.local** domain.

<p align="center">
<img src="/00-Lab-Setup/04-Active-Directory-Domain-Services/Evidence/Screenshots/40-Server-Manager-After-Promotion.png" width="900" alt="Server Manager After Promotion">
</p>

---

## Step 19 — Verify Administrative Tools

Opened **Tools** within Server Manager to verify that the Active Directory management consoles were successfully installed.

The following tools became available:

- Active Directory Users and Computers
- Active Directory Administrative Center
- Active Directory Domains and Trusts
- Active Directory Sites and Services
- DNS
- Group Policy Management
- ADSI Edit

These administrative consoles provide centralized management of users, computers, security policies, DNS records, and the overall Active Directory infrastructure.

<p align="center">
<img src="/00-Lab-Setup/04-Active-Directory-Domain-Services/Evidence/Screenshots/41-Administrative-Tools.png" width="900" alt="Administrative Tools">
</p>

---

## Step 20 — Verify the Default Active Directory Structure

Opened **Active Directory Users and Computers** and expanded the newly created **homelab.local** domain.

The default Active Directory containers were successfully created:

- Builtin
- Computers
- Domain Controllers
- ForeignSecurityPrincipals
- Managed Service Accounts
- Users

This confirms that the Active Directory database was successfully initialized and the directory service is ready to store users, computers, Organizational Units (OUs), security groups, and Group Policies.

<p align="center">
<img src="/00-Lab-Setup/04-Active-Directory-Domain-Services/Evidence/Screenshots/42-Default-Active-Directory.png" width="900" alt="Default Active Directory">
</p>

---

# Technical Concepts & Justifications

## What is Active Directory?

Active Directory is Microsoft's centralized directory service used to manage users, computers, groups, Organizational Units (OUs), printers, servers, and security policies within a Windows domain.

Instead of configuring every workstation individually, administrators manage all resources from a centralized location.

---

## What is a Domain Controller?

A Domain Controller is a Windows Server running the Active Directory Domain Services role.

Its responsibilities include:

- Authenticating users
- Managing computers
- Applying Group Policies
- Hosting the Active Directory database
- Managing Organizational Units
- Providing centralized authentication and authorization

---

## Why is DNS required?

Active Directory relies on DNS to locate Domain Controllers and directory services.

Without DNS:

- Users cannot log in
- Computers cannot join the domain
- Group Policy fails
- Domain services become unavailable

---

## What is NTDS?

The **NTDS.dit** database stores all Active Directory objects, including:

- Users
- Groups
- Computers
- Password hashes
- Organizational Units

---

## What is SYSVOL?

SYSVOL is a shared folder replicated between Domain Controllers.

It stores:

- Group Policy Objects (GPOs)
- Logon Scripts
- Public domain files required by Active Directory

---

# Skills Demonstrated

- Windows Server Administration
- Active Directory Deployment
- Domain Controller Promotion
- DNS Integration
- Enterprise Identity Management
- Active Directory Verification
- Windows Server Roles
- Forest & Domain Configuration
- Basic PowerShell Deployment Awareness

---

# Mock Interview Q&A

### Q: What is the difference between installing Active Directory and promoting a Domain Controller?

> **A:** Installing AD DS copies the required software to Windows Server. Promoting the server creates the Active Directory forest, installs DNS, initializes the NTDS database, creates SYSVOL, and transforms the server into a functioning Domain Controller.

---

### Q: Why is DNS automatically installed with Active Directory?

> **A:** Active Directory depends on DNS to locate Domain Controllers and directory services. Without DNS, clients cannot authenticate or locate network resources.

---

### Q: What is stored inside the NTDS database?

> **A:** The NTDS.dit database stores all Active Directory objects, including users, computers, groups, Organizational Units, password hashes, and security information.

---

### Q: Why did the DNS Delegation warning appear?

> **A:** Because this was the first Domain Controller in a brand-new forest. There was no parent DNS infrastructure available, so the warning is expected and can safely be ignored in a standalone environment.

---

<div align="center">

## 🎉 Module 4 Complete

**SRV01** is now the first **Domain Controller** for the **homelab.local** domain.

The enterprise identity infrastructure has been successfully deployed and is ready for centralized user, computer, and policy management.

**Next Module:** **Active Directory Administration**

*Creating Organizational Units (OUs), domain users, security groups, and designing an enterprise Active Directory structure.*

</div>
