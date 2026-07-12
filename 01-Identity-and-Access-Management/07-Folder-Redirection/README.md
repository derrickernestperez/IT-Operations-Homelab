<div align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&color=gradient&customColorList=0,2&height=250&section=header&text=Folder%20Redirection&fontSize=42&fontAlignY=35&desc=Module%207%20%7C%20Centralized%20User%20Data%20Management&descSize=20&descAlignY=55" alt="Folder Redirection Banner" width="100%">
</div>

---

## Overview

This module documents the implementation of **Folder Redirection** using **Active Directory Group Policy**.

Folder Redirection is an enterprise feature that automatically stores user profile data such as Desktop and Documents on centralized file servers rather than locally on individual workstations.

By redirecting user data to a network share, organizations improve data availability, simplify backup operations, support roaming users, and reduce the risk of data loss caused by workstation failures, ransomware incidents, or hardware replacement.

This implementation leverages Active Directory, SMB file shares, NTFS permissions, and Group Policy Objects (GPOs) to centrally manage user data storage.

---

## Business Scenario

The organization currently stores user files locally on employee workstations.

This approach presents several operational and security risks:

- Data loss if a workstation fails
- Difficulty backing up user files
- Increased recovery time during incidents
- Lack of centralized file management
- Challenges supporting users across multiple devices

To address these issues, the Infrastructure Team has been tasked with implementing Folder Redirection for Human Resources (HR) users.

The solution will automatically redirect Desktop and Documents folders to a centralized file server while maintaining appropriate access controls through SMB and NTFS permissions.

---

## Learning Objectives

By completing this lab, the following competencies were demonstrated:

- Configure SMB file shares
- Configure NTFS permissions
- Implement Folder Redirection using Group Policy
- Redirect Desktop and Documents folders
- Verify Group Policy deployment
- Manage centralized user data storage
- Apply the Principle of Least Privilege
- Support enterprise backup and recovery strategies
- Improve business continuity through centralized file services

---

## Lab Environment Specifications

| Component | Configuration Details |
| :--- | :--- |
| **Domain Controller** | SRV01 |
| **Operating System** | Windows Server 2025 Standard Evaluation |
| **Domain** | homelab.local |
| **Client Device** | CLIENT01 |
| **Client OS** | Windows 11 Enterprise |
| **Management Tool** | Group Policy Management Console (GPMC) |
| **File Share** | RedirectedFolders |
| **Target OU** | HR |

---

# Step-by-Step Implementation

---

## Step 1 — Create the Folder Redirection Storage Directory

A dedicated directory was created on the file server to store redirected user data.

This folder serves as the centralized repository for user Desktop and Documents folders.

**Path:**

```text
C:\RedirectedFolders
```

<p align="center">
<img src="/01-Identity-and-Access-Management/07-Folder-Redirection/Evidence/Screenshots/44-Create-RedirectedFolders-Directory.png" width="800" alt="Create RedirectedFolders Directory">
</p>

---

## Step 2 — Create the SMB File Share

The RedirectedFolders directory was published as a network share.

This share will be referenced by Group Policy when redirecting user profile folders.

**Share Name:**

```text
RedirectedFolders
```

<p align="center">
<img src="/01-Identity-and-Access-Management/07-Folder-Redirection/Evidence/Screenshots/45-Create-RedirectedFolders-Share.png" width="800" alt="Create RedirectedFolders Share">
</p>

---

## Step 3 — Configure NTFS Permissions

Enterprise-grade permissions were applied to ensure users could create their own redirected folders while preventing unauthorized access to other users' data.

The configuration follows Microsoft's recommended Folder Redirection security model.

Key permissions included:

- Administrators — Full Control
- SYSTEM — Full Control
- CREATOR OWNER — Full Control
- Authenticated Users — Create Folder / Read Permissions

This design supports the Principle of Least Privilege while maintaining functionality.

<p align="center">
<img src="/01-Identity-and-Access-Management/07-Folder-Redirection/Evidence/Screenshots/46-RedirectedFolders-Share-Permissions.png" width="800" alt="Folder Redirection Permissions">
</p>

---

## Step 4 — Create the Folder Redirection GPO

A dedicated Group Policy Object named:

```text
HR Folder Redirection
```

was created and linked to the HR Organizational Unit.

This ensures that only Human Resources users receive the Folder Redirection configuration.

<p align="center">
<img src="/01-Identity-and-Access-Management/07-Folder-Redirection/Evidence/Screenshots/47-Create-Folder-Redirection-GPO.png" width="800" alt="Create Folder Redirection GPO">
</p>

---

## Step 5 — Configure Desktop Folder Redirection

The Desktop folder was redirected using Group Policy.

Configuration:

- Basic Redirection
- Create a folder for each user
- Root Path:

```text
\\SRV01\RedirectedFolders\Desktop
```

After policy application, each HR user automatically receives a personal Desktop storage location on the file server.

<p align="center">
<img src="/01-Identity-and-Access-Management/07-Folder-Redirection/Evidence/Screenshots/48-Desktop-Folder-Redirection-Policy.png" width="800" alt="Desktop Folder Redirection Policy">
</p>

---

## Step 6 — Configure Documents Folder Redirection

The Documents folder was redirected using the same centralized storage model.

Configuration:

- Basic Redirection
- Create a folder for each user
- Root Path:

```text
\\SRV01\RedirectedFolders\Documents
```

This ensures user documents are centrally stored and available for backup operations.

<p align="center">
<img src="/01-Identity-and-Access-Management/07-Folder-Redirection/Evidence/Screenshots/49-Documents-Folder-Redirection-Policy.png" width="800" alt="Documents Folder Redirection Policy">
</p>

---

## Step 7 — Apply Group Policy Changes

The client workstation was updated using Group Policy refresh commands.

Because Folder Redirection is a user policy that requires logon processing, the user was required to log off and log back in.

```cmd
gpupdate /force
```

<p align="center">
<img src="/01-Identity-and-Access-Management/07-Folder-Redirection/Evidence/Screenshots/50-GPUpdate-Folder-Redirection.png" width="800" alt="GPUpdate Folder Redirection">
</p>

---

## Step 8 — Verify Desktop Redirection

After policy processing, Desktop folder properties confirmed successful redirection.

The Desktop folder location now points to the centralized file server instead of the local workstation profile.

<p align="center">
<img src="/01-Identity-and-Access-Management/07-Folder-Redirection/Evidence/Screenshots/51-Desktop-Redirected-Successfully.png" width="800" alt="Desktop Redirected Successfully">
</p>

---

## Step 9 — Verify Documents Redirection

The Documents folder location was validated to ensure successful redirection.

User files are now stored on the file server and accessible through the network share.

<p align="center">
<img src="/01-Identity-and-Access-Management/07-Folder-Redirection/Evidence/Screenshots/52-Documents-Redirected-Successfully.png" width="800" alt="Documents Redirected Successfully">
</p>

---

## Step 10 — Validate Server-Side Folder Creation

Upon successful user logon, Active Directory automatically created user-specific folders within the redirected storage locations.

This confirms proper interaction between:

- Active Directory
- Group Policy
- SMB File Shares
- NTFS Permissions

<p align="center">
<img src="/01-Identity-and-Access-Management/07-Folder-Redirection/Evidence/Screenshots/53-Server-Redirected-User-Folders.png" width="800" alt="Server Redirected User Folders">
</p>

---

# Security Impact

From a security and operations perspective, Folder Redirection provides several advantages:

### Data Protection

User files are stored on a centralized server rather than individual endpoints.

### Backup Readiness

Server-based backups automatically include redirected user data.

### Business Continuity

Users can continue working even after workstation replacement or hardware failure.

### Reduced Data Loss Risk

Critical files are not tied to a single endpoint.

### Centralized Administration

Administrators can manage, audit, and secure user data from a central location.

### Principle of Least Privilege

Users only receive access to their own redirected folders.

---

# Skills Demonstrated

- Windows Server Administration
- Active Directory Administration
- Group Policy Management
- SMB File Shares
- NTFS Permissions
- Folder Redirection
- User Profile Management
- File Services
- Enterprise Access Control
- Identity and Access Management (IAM)
- Business Continuity Planning
- Enterprise Data Protection

---

<div align="center">

### Module Complete ✅

**Folder Redirection successfully implemented using Active Directory, Group Policy, SMB Shares, and NTFS Permissions.**

</div>

---

<div align="center">

<b>Next: Module 8 — DNS Infrastructure</b><br>
<i>Implementing enterprise name resolution, DNS zones, host records, and troubleshooting techniques.</i>

</div>
