<div align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&color=gradient&customColorList=0,2&height=250&section=header&text=Enterprise%20User%20Provisioning&fontSize=42&fontAlignY=35&desc=Module%205%20Part%202%20%7C%20Identity%20and%20Access%20Management&descSize=20&descAlignY=55" alt="User Provisioning Banner" width="100%">
</div>

---

## Overview

Following the deployment of the enterprise Active Directory hierarchy, this phase focuses on identity lifecycle management. 

This module documents the standardized creation of user accounts, the configuration of critical identity properties, and the assignment of permissions through Security Group membership. These steps ensure that new employees can securely authenticate and access the exact resources required for their job functions immediately upon onboarding.

---

## Business Scenario

The Human Resources department has authorized the onboarding of a new HR Specialist, John Smith. 

The IT department must provision his network identity in Active Directory. The account must be created within the correct Organizational Unit, tagged with accurate organizational metadata (Manager, Job Title), and added to the appropriate Role-Based Access Control (RBAC) groups to grant him access to HR file shares and internal applications.

---

## Learning Objectives

By the end of this module, the following competencies were achieved:

* Provision a standard user account in Active Directory.
* Configure identity metadata and account properties.
* Execute group membership assignments based on departmental roles.
* Validate identity placement within an enterprise OU structure.

---

# Step-by-Step Implementation

## Step 1 — Create the First Enterprise User (John Smith)

Navigated to the `HR` -> `Users` Organizational Unit. Right-clicked and initiated the creation of a new User Object. 

Configured the standard User Principal Name (UPN) format `JSmith@corp.local` and set a complex temporary password, ensuring the "User must change password at next logon" flag was enabled for security compliance.

<p align="center">
<img src="/01-Identity-and-Access-Management/05-Enterprise-Active-Directory-Administration/Evidence/Screenshots/09-Create-User-JohnSmith.png" width="800" alt="Create User">
</p>

---

## Step 2 — Configure User Properties

Opened the properties of the newly created account to populate organizational metadata. 

Updated the **Organization** tab to include the Job Title ("HR Specialist"), Department ("Human Resources"), and assigned a Manager. Populating these fields is critical, as they are often synced to Microsoft Entra ID (formerly Azure AD) and utilized by dynamic security groups and email address books.

<p align="center">
<img src="/01-Identity-and-Access-Management/05-Enterprise-Active-Directory-Administration/Evidence/Screenshots/10-Configure-User-Properties.png" width="800" alt="Configure Properties">
</p>

---

## Step 3 — Add the User to SG-HR-Users

Navigated to the **Member Of** tab within the user's properties and added John Smith to the `SG-HR-Users` Global Security Group. 

Through RBAC, this single action automatically provisions his access to HR-specific network drives, internal web portals, and department printers without requiring individual manual assignments.

<p align="center">
<img src="/01-Identity-and-Access-Management/05-Enterprise-Active-Directory-Administration/Evidence/Screenshots/11-Add-To-HR-Group.png" width="800" alt="Add to Security Group">
</p>

---

## Step 4 — Verify Group Membership

Opened the `SG-HR-Users` Security Group properties and checked the **Members** tab to verify that the user was successfully added. 

Validating group membership at the group level ensures that the directory database has correctly committed the change.

<p align="center">
<img src="/01-Identity-and-Access-Management/05-Enterprise-Active-Directory-Administration/Evidence/Screenshots/12-Verify-Group-Membership.png" width="800" alt="Verify Membership">
</p>

---

## Step 5 — Explain How the Process Applies to Other Departments

This standard operating procedure scales linearly. 

When a developer is hired, they are placed in the `IT` -> `Users` OU and added to `SG-IT-Users`. By standardizing the workflow, IT minimizes provisioning errors and ensures that the Principle of Least Privilege is maintained across the entire organization. 

<p align="center">
<img src="/01-Identity-and-Access-Management/05-Enterprise-Active-Directory-Administration/Evidence/Screenshots/13-Scale-To-Other-Departments.png" width="800" alt="Scaling Provisioning">
</p>

---

# Technical Architecture & Justifications

* **Why require a password change at next logon?** This enforces non-repudiation. If the IT administrator knows the user's password, actions taken on the network cannot be definitively tied to the user. Forcing a change ensures the user is the only person who knows their credentials.
* **Why is populating the Organization tab important?** In modern hybrid environments, attributes like "Department" and "Manager" are heavily utilized by Entra ID dynamic groups to automatically assign Microsoft 365 licenses or route automated approval workflows. Incomplete AD attributes lead to automation failures downstream.

---

# Skills Demonstrated

* Account Provisioning & Lifecycle Management
* Identity Attribute Configuration
* Active Directory Security Group Nesting
* Employee Onboarding Workflows

---

# Mock Interview Q&A

**Q: When creating a new user, you check a box that says "User must change password at next logon." Why is this important from a cybersecurity perspective?**

> **A:** It establishes non-repudiation. If an IT administrator sets a permanent password for a user, both the admin and the user know the credentials. If malicious activity occurs under that account, you cannot prove who committed it. Forcing a reset ensures only the authenticated user holds the secret.

---

**Q: How does populating AD user properties like "Department" or "Manager" benefit the wider IT infrastructure?**

> **A:** It enables automation. In a hybrid environment syncing to Entra ID, dynamic groups can read the "Department" field and automatically assign software licenses or SharePoint access. If those fields are left blank, automation fails and requires manual intervention.

---

<div align="center">
<b><a href="#">Next Module: File Server Resource Manager & Share Permissions</a></b><br>
<i>Configuring NTFS permissions, mapping network drives via Group Policy, and establishing file screening.</i>
</div>
