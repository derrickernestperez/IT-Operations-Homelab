<div align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&color=gradient&customColorList=0,2&height=250&section=header&text=Enterprise%20Active%20Directory%20Administration&fontSize=45&fontAlignY=35&desc=Module%205%20%7C%20Organizational%20Units%20and%20Security%20Groups&descSize=20&descAlignY=55" alt="Enterprise Active Directory Administration Banner" width="100%">
</div>

---

## Overview

This module documents the initial administration of **Active Directory Domain Services (AD DS)** after successfully promoting **SRV01** to the organization's first Domain Controller.

With the Active Directory infrastructure now operational, the next phase is organizing the directory according to enterprise best practices. This includes creating a logical Organizational Unit (OU) hierarchy, separating departments, implementing infrastructure containers, and creating Security Groups that will later be used for Role-Based Access Control (RBAC), Group Policy deployment, and resource permissions.

Rather than storing all objects inside the default Active Directory containers, the directory was designed using a structured enterprise layout that mirrors how production Windows environments are commonly administered.

---

## Business Scenario

The company has expanded from a small office into multiple departments including Human Resources, Sales, Information Technology, Finance, and Management.

Managing hundreds of users inside the default Active Directory containers is inefficient and difficult to maintain.

To prepare the environment for future growth, the Infrastructure Team has been tasked with designing an enterprise Organizational Unit structure and implementing departmental Security Groups following Microsoft's recommended Active Directory administration practices.

This directory design will become the foundation for Group Policy, delegated administration, shared folder permissions, printer deployment, and future identity management services.

---

## Learning Objectives

By the end of this module, the following competencies were achieved:

* Understand the purpose of Organizational Units (OUs).
* Design an enterprise Active Directory hierarchy.
* Organize departments using Organizational Units.
* Create infrastructure Organizational Units.
* Understand the purpose of Security Groups.
* Implement Role-Based Access Control (RBAC).
* Apply enterprise naming conventions.
* Prepare Active Directory for future Group Policy deployment.
* Prepare the directory for enterprise user provisioning.

---

## Lab Environment Specifications

| Component | Configuration Details |
| :--- | :--- |
| **Server Name** | SRV01 |
| **Operating System** | Windows Server 2025 Standard Evaluation |
| **Directory Service** | Active Directory Domain Services |
| **Domain Name** | homelab.local |
| **Management Tool** | Active Directory Users and Computers |
| **Hypervisor** | VMware Workstation Pro |

---

# Step-by-Step Implementation

## Step 1: Open Active Directory Users and Computers

Opened **Active Directory Users and Computers (ADUC)** from **Server Manager → Tools**.

ADUC is Microsoft's primary management console for administering users, groups, computers, Organizational Units, and other Active Directory objects.

This console will be used throughout the remainder of the homelab to manage enterprise identities and infrastructure resources.

<p align="center">
<img src="/01-Identity-and-Access-Management/05-Active-Directory-Administration/Evidence/Screenshots/21-Open-Active-Directory-Users-and-Computers.png" width="800" alt="Open Active Directory Users and Computers">
</p>

---

## Step 2: Create the Company Organizational Unit

Created a top-level Organizational Unit named **Company**.

Rather than placing objects directly under the domain root, enterprise environments commonly use a dedicated Organizational Unit to logically separate company resources from Microsoft's default containers.

This approach simplifies administration, improves organization, and prepares the directory for delegated administration and Group Policy deployment.

---

## Step 3: Create Department Organizational Units

Inside the **Company** Organizational Unit, created dedicated Organizational Units for each business department:

* HR
* Sales
* IT
* Finance
* Management

Each department will later contain its own users, computers, and Security Groups.

Separating departments into individual Organizational Units allows administrators to apply department-specific Group Policy Objects (GPOs) and administrative permissions.

---

## Step 4: Create Infrastructure Organizational Units

Created additional Organizational Units for enterprise infrastructure resources:

* Servers
* Workstations
* Printers
* Service Accounts
* Admin Accounts
* Test Lab

Separating infrastructure resources from user accounts improves directory organization and follows Microsoft's enterprise Active Directory recommendations.

---

## Step 5: Review the Completed Organizational Unit Hierarchy

Verified the completed Active Directory structure.

The resulting hierarchy now provides a scalable and organized foundation for managing enterprise resources.

This structure supports future Group Policy deployment, delegated administration, security filtering, and identity management.

---

## Step 6: Create the Human Resources Security Group

Navigated to:

Company

└── HR

  └── Security Groups

Created the first departmental Security Group using the following configuration:

| Setting | Value |
| :--- | :--- |
| **Group Name** | SG-HR-Users |
| **Group Scope** | Global |
| **Group Type** | Security |

Following a standardized naming convention improves readability and administration within enterprise environments.

<p align="center">
<img src="/01-Identity-and-Access-Management/05-Active-Directory-Administration/Evidence/Screenshots/22-Create-HR-Security-Group.png" width="800" alt="Create HR Security Group">
</p>

---

## Step 7: Create Remaining Department Security Groups

Repeated the same process for the remaining departments.

Created:

* SG-Sales-Users
* SG-IT-Users
* SG-Finance-Users
* SG-Management-Users

Each group was configured as a **Global Security Group**, following Microsoft's recommended Role-Based Access Control (RBAC) model.

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

# Technical Architecture & Justifications

* **Why use Organizational Units?** Organizational Units provide a logical structure for organizing Active Directory objects. They enable delegated administration, simplify management, and allow Group Policy Objects (GPOs) to target specific departments or infrastructure resources.

* **Why create separate department OUs?** Separating departments into dedicated Organizational Units allows administrators to apply different security policies, desktop configurations, software deployments, and administrative permissions without affecting other departments.

* **Why create infrastructure OUs?** Servers, workstations, printers, and service accounts often require different Group Policies and security settings than standard user accounts. Keeping these resources separate improves manageability and reduces administrative complexity.

* **Why use Security Groups?** Security Groups simplify permission management by assigning access rights to groups rather than individual users. This approach supports Role-Based Access Control (RBAC) and reduces administrative effort as organizations grow.

---

# Skills Demonstrated

* Active Directory Administration
* Organizational Unit Design
* Enterprise Directory Planning
* Security Group Administration
* Role-Based Access Control (RBAC)
* Microsoft Naming Conventions
* Identity and Access Management (IAM)
* Windows Server Administration

---

# Mock Interview Q&A

**Q: What is an Organizational Unit (OU)?**

> **A:** An Organizational Unit is a logical container within Active Directory used to organize users, computers, groups, and other directory objects. OUs simplify administration, support delegated management, and allow Group Policy Objects (GPOs) to be applied to specific sections of the directory.

---

**Q: Why do companies use Security Groups instead of assigning permissions directly to users?**

> **A:** Security Groups simplify administration by allowing permissions to be assigned once to the group rather than individually to each user. As employees join, leave, or change departments, administrators only update group membership instead of modifying permissions across multiple resources.

---

**Q: What is Role-Based Access Control (RBAC)?**

> **A:** RBAC is a security model that assigns permissions based on job roles rather than individual users. In Active Directory, this is commonly implemented using Security Groups, ensuring consistent and scalable access management.

---

<div align="center">
<b><a href="./User-Provisioning.md">Next Document: Enterprise User Provisioning</a></b><br>
<i>Creating enterprise user accounts, assigning Security Group membership, and preparing Active Directory for Group Policy deployment.</i>
</div>
