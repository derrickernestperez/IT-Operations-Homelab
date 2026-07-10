<div align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&color=gradient&customColorList=0,2&height=250&section=header&text=Enterprise%20AD%20Administration&fontSize=42&fontAlignY=35&desc=Module%205%20Part%201%20%7C%20Identity%20and%20Access%20Management&descSize=20&descAlignY=55" alt="Enterprise AD Administration Banner" width="100%">
</div>

---

## Overview

This module documents the architectural design and implementation of **Organizational Units (OUs)** and **Security Groups** within Active Directory Domain Services (AD DS). 

Rather than using the flat, default Active Directory containers, a tiered enterprise organizational structure was deployed. This hierarchical design is required to properly implement Role-Based Access Control (RBAC), enforce Group Policy Objects (GPOs), and lay the groundwork for the AGDLP (Account, Global, Domain Local, Permission) group nesting strategy.

---

## Business Scenario

The organization is scaling rapidly and needs to transition from a decentralized management model to a centralized, secure identity infrastructure. 

The Infrastructure Team is tasked with designing an Active Directory hierarchy that reflects the company's internal departmental structure (HR, IT, Finance, Sales) while securely isolating infrastructure assets (Servers, Workstations, Service Accounts). This foundation must be established before any user accounts are provisioned to ensure security policies and permissions are applied automatically upon creation.

---

## Learning Objectives

By the end of this module, the following competencies were achieved:

* Navigate and utilize Active Directory Users and Computers (ADUC).
* Design and implement an Enterprise Organizational Unit (OU) hierarchy.
* Differentiate between default AD containers and Organizational Units.
* Create and manage Security Groups aligned with departmental roles.
* Understand the principles of Role-Based Access Control (RBAC) and AGDLP.

---

## Lab Environment Specifications

| Component | Configuration Details |
| :--- | :--- |
| **Operating System** | Windows Server 2025 Standard Evaluation |
| **Domain Controller** | SRV01 |
| **Domain Name** | corp.local *(example)* |
| **Tool Utilized** | Active Directory Users and Computers (ADUC) |
| **Design Framework** | Tiered Delegation / RBAC |

---

# Step-by-Step Implementation

## Step 1 — Open ADUC

Launched **Active Directory Users and Computers (ADUC)** from the Server Manager Dashboard. This is the primary Microsoft Management Console (MMC) snap-in used for daily identity management tasks.

<p align="center">
<img src="/01-Identity-and-Access-Management/05 – Active Directory Administration/Evidence/Screenshots/21-Open-Active-Directory-Users-and-Computers.png" width="800" alt="Open ADUC">
</p>

---

## Step 2 — Review the Default Active Directory Structure

Examined the default Active Directory deployment. By default, AD places objects into generic containers (e.g., `Users`, `Computers`). 

These default containers cannot have Group Policy Objects (GPOs) linked directly to them, which necessitates the creation of custom Organizational Units for enterprise management.

<p align="center">
<img src="/01-Identity-and-Access-Management/05 – Active Directory Administration/Evidence/Screenshots/02-Review-Default-Structure.png" width="800" alt="Default AD Structure">
</p>

---

## Step 3 — Create the Company Organizational Unit

Created a top-level parent OU representing the organization (e.g., `Company_Corp`). 

This acts as the root boundary for all enterprise objects, allowing administrative delegation and global policies to be applied from a single, controlled point without affecting built-in domain administrator accounts.

<p align="center">
<img src="/01-Identity-and-Access-Management/05 – Active Directory Administration/Evidence/Screenshots/03-Create-Company-OU.png" width="800" alt="Company OU">
</p>

---

## Step 4 — Create Department Organizational Units

Inside the parent OU, created child OUs for each specific business department: **HR**, **IT**, **Finance**, and **Sales**. 

This logical separation ensures that department-specific Group Policies (like mapping a Finance network drive or deploying HR software) only apply to the relevant users.

<p align="center">
<img src="/01-Identity-and-Access-Management/05 – Active Directory Administration/Evidence/Screenshots/04-Create-Department-OUs.png" width="800" alt="Department OUs">
</p>

---

## Step 5 — Create Infrastructure Organizational Units

Created dedicated OUs for infrastructure assets, including **Servers**, **Workstations**, and **Service Accounts**. 

Isolating computer objects from user objects is a critical security practice. Servers require entirely different security baselines, patch schedules, and audit policies than standard user laptops.

<p align="center">
<img src="/01-Identity-and-Access-Management/05 – Active Directory Administration/Evidence/Screenshots/05-Create-Infrastructure-OUs.png" width="800" alt="Infrastructure OUs">
</p>

---

## Step 6 — Explain the Enterprise OU Hierarchy

The completed structure provides a scalable framework. **Users** and **Computers** are strictly separated within each department. "Protect object from accidental deletion" was enabled across all custom OUs to prevent catastrophic administrative errors.

<p align="center">
<img src="/01-Identity-and-Access-Management/05 – Active Directory Administration/Evidence/Screenshots/06-Enterprise-Hierarchy-Complete.png" width="800" alt="Enterprise OU Hierarchy">
</p>

---

## Step 7 — Create HR Security Group

Created a Global Security Group named `SG-HR-Users` within the HR OU. 

Instead of assigning folder permissions directly to individual users, permissions are assigned to this Security Group. When new HR employees are hired, they are simply added to the group.

<p align="center">
<img src="/01-Identity-and-Access-Management/05 – Active Directory Administration/Evidence/Screenshots/22-Create-HR-Security-Group.png" width="800" alt="HR Security Group">
</p>

---

## Step 8 — Create Remaining Security Groups

Replicated the security group creation process for the remaining departments, establishing `SG-IT-Users`, `SG-Finance-Users`, `SG-Sales-Users`, and `SG-Management-Users`. Additional specialized groups were created to support tiered access models.

<p align="center">
<img src="/01-Identity-and-Access-Management/05 – Active Directory Administration/Evidence/Screenshots/24-Create-IT-Security-Group.png" width="800" alt="Remaining Security Groups">
</p>

---

# Technical Architecture & Justifications

* **Why use Organizational Units instead of default containers?** Default containers (like `CN=Users`) cannot have Group Policy Objects (GPOs) linked directly to them. OUs are required for targeted policy enforcement and granular administrative delegation.
* **Why separate Users and Computers into different OUs?** User policies (like desktop wallpapers or mapped drives) differ fundamentally from Computer policies (like firewall rules or Windows Update schedules). Keeping them in separate OUs prevents policy conflicts and improves processing speed.
* **Why use Role-Based Access Control (RBAC)?** Assigning permissions to a Security Group rather than an individual user is highly scalable. If an employee changes departments, an administrator only needs to update their group membership rather than tracking down dozens of individual file and system permissions.

---

# Skills Demonstrated

* Enterprise Active Directory Architecture
* Role-Based Access Control (RBAC) Design
* Organizational Unit (OU) Management
* Global Security Group Provisioning
* Principle of Least Privilege (PoLP) Enforcement

---

# Mock Interview Q&A

**Q: If you needed to apply a strict password policy specifically to the IT department, how would you do it?**

> **A:** Assuming Fine-Grained Password Policies (FGPP) are configured, I would apply the policy to the `SG-IT-Users` security group. If relying strictly on traditional Group Policy, I would link a GPO to the IT Department's specific OU, ensuring it only affects the users residing within that container.

---

**Q: Explain the concept of AGDLP.**

> **A:** AGDLP stands for Account, Global, Domain Local, Permission. It is Microsoft's best practice for group nesting. **Accounts** (Users) are put into **Global** groups (like `SG-HR-Users`). Those Global groups are placed into **Domain Local** groups (like `DL-HR-SharedFolder-Modify`). The Domain Local group is then granted the actual **Permissions** on the resource. This makes cross-domain auditing and management highly efficient.

---

<div align="center">
<b><a href="./User-Provisioning.md">Next: Part 2 — Enterprise User Provisioning</a></b><br>
<i>Creating user accounts, configuring identity properties, and managing group memberships.</i>
</div>
