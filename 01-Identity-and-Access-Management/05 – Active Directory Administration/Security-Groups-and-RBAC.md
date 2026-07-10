<div align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&color=gradient&customColorList=0,2&height=250&section=header&text=Security%20Groups%20%26%20RBAC&fontSize=42&fontAlignY=35&desc=Module%205%20Part%202%20%7C%20Identity%20and%20Access%20Management&descSize=20&descAlignY=55" alt="Security Groups and RBAC Banner" width="100%">
</div>

---

## Overview

Building upon the Organizational Unit infrastructure established in Part 1, this document covers the implementation of **Role-Based Access Control (RBAC)** via Active Directory Security Groups, as well as the standard provisioning of enterprise user accounts.

Permissions are rarely assigned directly to individual users in an enterprise environment. Instead, this module demonstrates how to configure Global Security Groups mapped to specific departmental roles, allowing users to dynamically inherit access rights based on their group membership.

---

## Core Technical Concepts

### Security Groups vs. Distribution Groups
* **Security Groups:** Used to assign permissions to shared resources (folders, printers, applications). They can also be used as email distribution lists.
* **Distribution Groups:** Used *strictly* for email distribution (e.g., in Exchange). They cannot be used to assign security permissions.

### Role-Based Access Control (RBAC)
RBAC is the practice of assigning system access based on a user's defined role within the organization, rather than creating custom permission sets for every individual. When an employee changes departments, IT simply updates their group membership to instantly revoke old access and grant new access.

### Group Scopes (AGDLP Framework)
* **Global Groups:** Typically contain User accounts. Used to represent business roles (e.g., `SG-HR-Users`).
* **Domain Local Groups:** Typically contain Global Groups. Used to apply permissions to a local resource (e.g., `DL-HR-Folder-Read`).
* **Universal Groups:** Used in multi-domain forests to span access across different domains.

### Computer Objects
Just like user accounts, computers in Active Directory have their own unique identity (Computer Objects) stored in the directory. They authenticate to the domain, have their own secure passwords (managed automatically by AD), and receive their own distinct Group Policy configurations based on their OU placement.

---

# Step-by-Step Implementation

## Step 1 — Create Department Security Groups

Navigated to the respective department OUs to create Global Security Groups. Establishing standardized naming conventions (e.g., `SG-[Department]-Users`) ensures a clean, easily searchable directory.

Created the following Global Security Groups:
* `SG-HR-Users`
* `SG-Sales-Users`
* `SG-IT-Users`
* `SG-Finance-Users`
* `SG-Management-Users`

<p align="center">
<img src="/01-Identity-and-Access-Management/05-Active-Directory-Administration/Evidence/Screenshots/22-Create-HR-Security-Group.png" width="800" alt="Create HR Security Group">
</p>

*(Additional groups provisioned for Sales, IT, Finance, and Management)*

<p align="center">
<img src="/01-Identity-and-Access-Management/05-Active-Directory-Administration/Evidence/Screenshots/23-Create-Sales-Security-Group.png" width="800" alt="Create Sales Security Group">
</p>
<p align="center">
<img src="/01-Identity-and-Access-Management/05-Active-Directory-Administration/Evidence/Screenshots/24-Create-IT-Security-Group.png" width="800" alt="Create IT Security Group">
</p>
<p align="center">
<img src="/01-Identity-and-Access-Management/05-Active-Directory-Administration/Evidence/Screenshots/25-Create-Finance-Security-Group.png" width="800" alt="Create Finance Security Group">
</p>
<p align="center">
<img src="/01-Identity-and-Access-Management/05-Active-Directory-Administration/Evidence/Screenshots/26-Create-Management-Security-Group.png" width="800" alt="Create Management Security Group">
</p>

---

## Step 2 — Create the First Enterprise User

Provisioned the first standard domain user, **John Smith**, inside the HR OU. 

Configured the User Principal Name (UPN) to standard enterprise formats (e.g., `jsmith@homelab.local`). A temporary complex password was generated, and the account was flagged to force a password change at the next login, ensuring administrative non-repudiation.

<p align="center">
<img src="/01-Identity-and-Access-Management/05-Active-Directory-Administration/Evidence/Screenshots/27-Create-HR-User-John-Smith.png" width="800" alt="Create HR User">
</p>

---

## Step 3 — Add User to Security Group

Opened the user properties for John Smith and navigated to the **Member Of** tab. Added the user to the `SG-HR-Users` security group. 

By nesting the user inside this group, John Smith will automatically inherit all HR file share and printer permissions deployed to this group without the need for manual, individual folder permission assignments.

<p align="center">
<img src="/01-Identity-and-Access-Management/05-Active-Directory-Administration/Evidence/Screenshots/28-HR-User-Added-to-Security-Group.png" width="800" alt="Add User to Group">
</p>

---

# Skills Demonstrated

* Implementation of Role-Based Access Control (RBAC)
* Active Directory Security Group Administration
* User Lifecycle & Identity Provisioning
* Enterprise Naming Conventions
* Identity and Access Management (IAM)
* Principle of Least Privilege Configuration

---

# Mock Interview Q&A

**Q: What is the difference between a Security Group and a Distribution Group?**

> **A:** A Security Group is used to assign permissions to network resources like file shares, printers, and applications, and it can also receive emails. A Distribution Group is strictly used for email routing and cannot be used to apply security permissions to a resource.

---

**Q: Why do we assign permissions to groups instead of individual users?**

> **A:** Assigning permissions to groups enables Role-Based Access Control (RBAC). It is highly scalable and reduces administrative overhead. If an employee leaves the HR department, an administrator only has to remove them from the HR Security Group to instantly revoke their access to all HR resources, rather than tracking down their individual permissions across multiple servers.

---

**Q: In an Active Directory environment, what is a Computer Object?**

> **A:** A Computer Object is a unique identity for a physical or virtual machine joined to the domain. Just like a user, the computer has its own secure trust relationship with the Domain Controller, authenticates to the network, and can be targeted by specific Computer Group Policy Objects based on its OU placement.

---

<div align="center">
<b><a href="#">Next Module: Windows 11 Domain Join & Computer Management</a></b><br>
<i>Deploying a Windows 11 enterprise workstation, joining it to the homelab.local domain, and managing computer objects through Active Directory.</i>
</div>
