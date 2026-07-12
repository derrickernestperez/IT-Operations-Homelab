<div align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&color=gradient&customColorList=0,2&height=250&section=header&text=File%20and%20Print%20Services&fontSize=42&fontAlignY=35&desc=Module%2010%20%7C%20Enterprise%20File%20Sharing&descSize=20&descAlignY=55" alt="File Services Banner" width="100%">
</div>

---

## Overview

This module documents the deployment and administration of enterprise file sharing services within the Windows Server environment.

The objective was to create centralized departmental file shares, apply role-based access control through Active Directory security groups, configure share and NTFS permissions, and validate that users can only access resources authorized for their department.

This implementation simulates a real-world corporate file server used to securely store and distribute departmental data across the organization.

---

## Business Scenario

The organization requires a centralized file server where departments can store and access shared business documents.

The Infrastructure Team must implement file shares for Human Resources, Finance, Information Technology, and Sales while ensuring users can only access data belonging to their respective departments.

Access control must be enforced using Active Directory security groups and NTFS permissions to protect sensitive organizational information.

---

## Learning Objectives

By completing this module, the following competencies were demonstrated:

- Deploy enterprise file sharing services
- Configure departmental network shares
- Configure Share Permissions
- Configure NTFS Permissions
- Implement Role-Based Access Control (RBAC)
- Validate effective permissions
- Troubleshoot file share access
- Manage shared resources using Windows Server

---

## Lab Environment Specifications

| Component | Configuration |
|------------|------------|
| Server Name | SRV01 |
| Operating System | Windows Server 2025 Standard Evaluation |
| Domain | homelab.local |
| File Server | SRV01 |
| Client Device | CLIENT01 |
| Management Tools | Computer Management, File Explorer |
| Security Model | Active Directory Security Groups |

---

# Step-by-Step Implementation

## Step 1 — Open Server Manager

Opened Server Manager to begin file services administration.

Server Manager provides centralized management for Windows Server roles, services, and infrastructure resources.

<p align="center">
<img src="/01-Identity-and-Access-Management/10-File-and-Print-Services/Evidence/Screenshots/01-Open-Server-Manager.png" width="800">
</p>

---

## Step 2 — Verify File Server Role

Verified that File and Storage Services were installed and operational.

This role provides the core functionality required for hosting and managing network file shares.

<p align="center">
<img src="/01-Identity-and-Access-Management/10-File-and-Print-Services/Evidence/Screenshots/02-File-Server-Role-Verification.png" width="800">
</p>

---

## Step 3 — Review Department Share Structure

Verified the departmental folder structure used for centralized file storage.

```text
C:\Shares
├── HR
├── Finance
├── IT
└── Sales
```

Each folder serves as a dedicated departmental repository.

<p align="center">
<img src="/01-Identity-and-Access-Management/10-File-and-Print-Services/Evidence/Screenshots/03-Shares-Folder-Structure.png" width="800">
</p>

---

## Step 4 — Configure HR Share Permissions

Reviewed Share Permissions for the HR department share.

Access was granted only to authorized administrative accounts and Human Resources personnel.

<p align="center">
<img src="/01-Identity-and-Access-Management/10-File-and-Print-Services/Evidence/Screenshots/04-HR-Share-Permissions.png" width="800">
</p>

---

## Step 5 — Configure HR NTFS Permissions

Verified NTFS permissions on the HR folder.

NTFS permissions provide granular access control and serve as the primary security layer protecting departmental data.

<p align="center">
<img src="/01-Identity-and-Access-Management/10-File-and-Print-Services/Evidence/Screenshots/05-HR-NTFS-Permissions.png" width="800">
</p>

---

## Step 6 — Configure Finance Share Permissions

Reviewed Share Permissions for the Finance department share.

Finance resources were restricted to authorized Finance personnel and administrative accounts.

<p align="center">
<img src="/01-Identity-and-Access-Management/10-File-and-Print-Services/Evidence/Screenshots/06-Finance-Share-Permissions.png" width="800">
</p>

---

## Step 7 — Configure IT Share Permissions

Reviewed Share Permissions for the Information Technology department share.

The share was configured to support secure access by IT personnel while preventing unauthorized access.

<p align="center">
<img src="/01-Identity-and-Access-Management/10-File-and-Print-Services/Evidence/Screenshots/07-IT-Share-Permissions.png" width="800">
</p>

---

## Step 8 — Configure Sales Share Permissions

Reviewed Share Permissions for the Sales department share.

Access was restricted to members of the Sales department security group.

<p align="center">
<img src="/01-Identity-and-Access-Management/10-File-and-Print-Services/Evidence/Screenshots/08-Sales-Share-Permissions.png" width="800">
</p>

---

## Step 9 — Review Shared Folders Console

Opened the Shared Folders management console.

This interface provides visibility into:

- Active Shares
- Open Files
- Connected Users
- Administrative Shares

<p align="center">
<img src="/01-Identity-and-Access-Management/10-File-and-Print-Services/Evidence/Screenshots/09-Shared-Folders-Console.png" width="800">
</p>

---

## Step 10 — Validate HR Access

Logged into CLIENT01 as an HR user and successfully accessed the HR departmental share.

This confirmed that Share and NTFS permissions were functioning correctly.

<p align="center">
<img src="/01-Identity-and-Access-Management/10-File-and-Print-Services/Evidence/Screenshots/10-HR-Access-Success.png" width="800">
</p>

---

## Step 11 — Validate Finance Access Restrictions

Attempted to access the Finance share while logged in as an HR user.

Access was denied as expected.

This validated departmental segregation and RBAC enforcement.

<p align="center">
<img src="/01-Identity-and-Access-Management/10-File-and-Print-Services/Evidence/Screenshots/11-Finance-Access-Denied.png" width="800">
</p>

---

## Step 12 — Validate IT Access Restrictions

Attempted to access the IT share while logged in as an HR user.

Access was denied according to the configured permissions.

<p align="center">
<img src="/01-Identity-and-Access-Management/10-File-and-Print-Services/Evidence/Screenshots/12-IT-Access-Denied.png" width="800">
</p>

---

## Step 13 — Validate Sales Access Restrictions

Attempted to access the Sales share while logged in as an HR user.

The file server correctly prevented unauthorized access.

<p align="center">
<img src="/01-Identity-and-Access-Management/10-File-and-Print-Services/Evidence/Screenshots/13-Sales-Access-Denied.png" width="800">
</p>

---

## Step 14 — Final File Server Validation

Performed a final review of the file server configuration using the Shared Folders console.

The server successfully hosted departmental shares for:

- HR
- Finance
- IT
- Sales

as well as centralized folder redirection storage.

Client connections confirmed that the shares were active and accessible to authorized users.

<p align="center">
<img src="/01-Identity-and-Access-Management/10-File-and-Print-Services/Evidence/Screenshots/14-File-Server-Final-Configuration.png" width="800">
</p>

---

# Access Control Model

The file server uses Role-Based Access Control (RBAC) through Active Directory Security Groups.

```text
HR Users
   └── HR Share

Finance Users
   └── Finance Share

IT Users
   └── IT Share

Sales Users
   └── Sales Share
```

This approach simplifies administration and ensures permissions are managed through group membership rather than individual user assignments.

---

# Share Permissions vs NTFS Permissions

| Permission Type | Purpose |
|-----------------|----------|
| Share Permissions | Control access over the network |
| NTFS Permissions | Control access to files and folders |
| Effective Permissions | Most restrictive combination of both |

Together, these layers provide secure access control for enterprise file services.

---

# Skills Demonstrated

- Windows Server Administration
- File Server Management
- Share Management
- NTFS Permissions
- Share Permissions
- RBAC Implementation
- Active Directory Integration
- Access Control Management
- Network Resource Administration
- Enterprise File Services

---

<div align="center">
<b><a href="../11-Windows-LAPS/README.md">Next: Module 11 — Windows LAPS</a></b><br>
<i>Implementing Local Administrator Password Solution (LAPS) for secure credential management.</i>
</div>
