<div align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&color=gradient&customColorList=0,2&height=250&section=header&text=Windows%20LAPS&fontSize=42&fontAlignY=35&desc=Module%2011%20%7C%20Local%20Administrator%20Password%20Solution&descSize=20&descAlignY=55" alt="Windows LAPS Banner" width="100%">
</div>

---

# Overview

This module documents the deployment and configuration of **Windows Local Administrator Password Solution (Windows LAPS)** within the Active Directory environment.

Windows LAPS is a Microsoft security feature that automatically manages and rotates local administrator passwords on domain-joined devices. Instead of using a shared local administrator password across all endpoints, each computer receives a unique, randomly generated password that is securely stored in Active Directory.

This implementation significantly reduces the risk of lateral movement attacks, credential reuse, and unauthorized privileged access.

---

# Business Scenario

The organization currently uses local administrator accounts on workstations for troubleshooting and maintenance tasks.

Using the same password across multiple devices creates a significant security risk because compromising a single endpoint could provide attackers administrative access to every workstation in the environment.

To strengthen endpoint security, the Infrastructure Team has been tasked with deploying **Windows LAPS** to automatically generate unique local administrator passwords for all domain-joined workstations and securely store those credentials in Active Directory.

Only authorized administrators should be able to retrieve these passwords when required.

---

# Learning Objectives

By completing this module, the following competencies were achieved:

- Understand the purpose and security benefits of Windows LAPS
- Extend the Active Directory schema for Windows LAPS
- Delegate LAPS permissions to computer objects
- Configure Windows LAPS through Group Policy
- Enable password backup to Active Directory
- Configure password complexity and rotation policies
- Force LAPS policy processing on managed endpoints
- Retrieve and validate managed passwords from Active Directory
- Implement privileged access management best practices

---

# Lab Environment Specifications

| Component | Configuration |
|------------|------------|
| Server Name | SRV01 |
| Client Machine | CLIENT01 |
| Operating System | Windows Server 2025 Standard Evaluation |
| Client OS | Windows 11 Enterprise |
| Domain | homelab.local |
| Active Directory | AD DS |
| Management Tool | Group Policy Management |
| Security Feature | Windows LAPS |

---

# Step-by-Step Implementation

---

## Step 1 — Verify Windows LAPS Availability

Before deployment, Windows PowerShell was used to confirm that the Windows LAPS management module was installed and available on the Domain Controller.

The available LAPS cmdlets provide functionality for schema updates, password retrieval, auditing, policy processing, and administrative delegation.

<p align="center">
<img src="/01-Identity-and-Access-Management/11-Windows-LAPS/Evidence/Screenshots/02-Verify-LAPS-Commands.png" width="900" alt="Verify LAPS Commands">
</p>

---

## Step 2 — Extend the Active Directory Schema

Windows LAPS requires additional Active Directory attributes to securely store password information.

The Active Directory schema was extended using the `Update-LapsADSchema` cmdlet.

This operation creates the required LAPS attributes such as:

- ms-LAPS-Password
- ms-LAPS-PasswordExpirationTime

These attributes allow managed devices to store and rotate passwords within Active Directory.

<p align="center">
<img src="/01-Identity-and-Access-Management/11-Windows-LAPS/Evidence/Screenshots/03-Update-LAPS-AD-Schema.png" width="900" alt="Update LAPS AD Schema">
</p>

---

## Step 3 — Delegate Computer Self Permissions

The Workstations Organizational Unit (OU) was granted permission to update its own LAPS password attributes within Active Directory.

This delegation enables computers to automatically write their password information without requiring manual administrative intervention.

Command used:

```powershell
Set-LapsADComputerSelfPermission -Identity "Workstations"
```

<p align="center">
<img src="/01-Identity-and-Access-Management/11-Windows-LAPS/Evidence/Screenshots/04-Grant-LAPS-Self-Permission.png" width="900" alt="Grant LAPS Self Permission">
</p>

---

## Step 4 — Create the Windows LAPS Group Policy Object

A dedicated Group Policy Object named:

```text
Workstation - Windows LAPS
```

was created and linked to the Workstations Organizational Unit.

This allows all computers within the OU to automatically receive LAPS configuration settings.

<p align="center">
<img src="/01-Identity-and-Access-Management/11-Windows-LAPS/Evidence/Screenshots/05-Create-LAPS-GPO.png" width="900" alt="Create LAPS GPO">
</p>

---

## Step 5 — Configure Password Backup Directory

The Group Policy setting:

```text
Configure password backup directory
```

was enabled and configured to store passwords directly within Active Directory.

This ensures that password information remains centrally managed and available to authorized administrators.

<p align="center">
<img src="/01-Identity-and-Access-Management/11-Windows-LAPS/Evidence/Screenshots/06-LAPS-Backup-Directory.png" width="900" alt="LAPS Backup Directory">
</p>

---

## Step 6 — Configure Password Policy

Password complexity and rotation requirements were defined using the Windows LAPS password policy settings.

Configuration:

| Setting | Value |
|----------|----------|
| Password Length | 14 Characters |
| Complexity | Uppercase, Lowercase, Numbers, Special Characters |
| Password Age | 30 Days |

These settings ensure strong, unique passwords are generated automatically.

<p align="center">
<img src="/01-Identity-and-Access-Management/11-Windows-LAPS/Evidence/Screenshots/07-LAPS-Password-Policy.png" width="900" alt="LAPS Password Policy">
</p>

---

## Step 7 — Configure Automatic Account Management

Automatic account management was enabled to allow Windows LAPS to manage the designated local administrator account.

This ensures password rotation occurs automatically without manual intervention.

<p align="center">
<img src="/01-Identity-and-Access-Management/11-Windows-LAPS/Evidence/Screenshots/08-LAPS-Automatic-Account-Management.png" width="900" alt="LAPS Automatic Account Management">
</p>

---

## Step 8 — Verify Group Policy Configuration

After configuring all required settings, the Group Policy Object was reviewed to verify successful implementation.

Configured settings included:

- Password Backup Directory
- Password Policy
- Automatic Account Management

<p align="center">
<img src="/01-Identity-and-Access-Management/11-Windows-LAPS/Evidence/Screenshots/09-LAPS-GPO-Configured.png" width="900" alt="LAPS GPO Configured">
</p>

---

## Step 9 — Force Group Policy Update

On CLIENT01, Group Policy was manually refreshed to immediately apply the newly configured Windows LAPS settings.

Command used:

```powershell
gpupdate /force
```

<p align="center">
<img src="/01-Identity-and-Access-Management/11-Windows-LAPS/Evidence/Screenshots/10-GPUpdate-Client01.png" width="900" alt="GPUpdate Client01">
</p>

---

## Step 10 — Trigger LAPS Policy Processing

To accelerate deployment, LAPS policy processing was manually triggered using PowerShell.

Command used:

```powershell
Invoke-LapsPolicyProcessing
```

This forces immediate password generation and Active Directory synchronization.

<p align="center">
<img src="/01-Identity-and-Access-Management/11-Windows-LAPS/Evidence/Screenshots/11-LAPS-Policy-Processing.png" width="900" alt="LAPS Policy Processing">
</p>

---

## Step 11 — Verify Group Policy Application

The Resultant Set of Policy (RSoP) was reviewed to verify that the Windows LAPS Group Policy Object had successfully applied to CLIENT01.

This confirmed proper policy inheritance and workstation compliance.

<p align="center">
<img src="/01-Identity-and-Access-Management/11-Windows-LAPS/Evidence/Screenshots/12-LAPS-GPO-Applied.png" width="900" alt="LAPS GPO Applied">
</p>

---

## Step 12 — Retrieve Managed Password from Active Directory

The password generated by Windows LAPS was successfully retrieved from Active Directory.

Command used:

```powershell
Get-LapsADPassword -Identity CLIENT01
```

The output confirmed:

- Password generation
- Active Directory backup
- Encryption status
- Password expiration schedule
- Authorized password decryptors

<p align="center">
<img src="/01-Identity-and-Access-Management/11-Windows-LAPS/Evidence/Screenshots/13-LAPS-Password-Retrieved.png" width="900" alt="LAPS Password Retrieved">
</p>

---

## Step 13 — Validate Final Configuration

A final validation was performed to verify successful deployment of Windows LAPS within the Active Directory environment.

Validation confirmed:

- Schema extension completed
- Workstation permissions delegated
- Group Policy applied successfully
- Password stored in Active Directory
- Authorized administrators able to retrieve credentials

<p align="center">
<img src="/01-Identity-and-Access-Management/11-Windows-LAPS/Evidence/Screenshots/14-LAPS-Final-Configuration.png" width="900" alt="LAPS Final Configuration">
</p>

---

# Validation Results

| Validation Check | Status |
|------------------|--------|
| LAPS Module Installed | ✅ |
| Active Directory Schema Extended | ✅ |
| Computer Self Permissions Granted | ✅ |
| Windows LAPS GPO Created | ✅ |
| Password Backup Enabled | ✅ |
| Password Policy Applied | ✅ |
| CLIENT01 Received Policy | ✅ |
| Password Stored in AD | ✅ |
| Password Retrieved Successfully | ✅ |
| Password Rotation Enabled | ✅ |

---

# Security Benefits

Windows LAPS provides several enterprise security advantages:

- Unique local administrator passwords per device
- Automatic password rotation
- Reduced credential reuse
- Mitigation against Pass-the-Hash attacks
- Reduced lateral movement opportunities
- Centralized password management
- Secure Active Directory password storage
- Role-based password retrieval

---

# Key Takeaways

This module demonstrated the deployment of a modern privileged access management solution using Microsoft's native Windows LAPS feature.

By integrating Windows LAPS with Active Directory and Group Policy, the environment now enforces unique administrator credentials across managed endpoints while maintaining centralized control and secure password recovery capabilities.

This implementation aligns with enterprise security best practices and significantly improves the overall security posture of the Active Directory environment.

---

<div align="center">

### Module Status

✅ Completed Successfully

**Next Module:** Print Server Management

</div>
