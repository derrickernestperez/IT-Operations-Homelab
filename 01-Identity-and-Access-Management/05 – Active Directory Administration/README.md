<div align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&color=gradient&customColorList=0,2&height=250&section=header&text=Active%20Directory%20Administration&fontSize=42&fontAlignY=35&desc=Module%205%20Part%201%20%7C%20Organizational%20Units&descSize=20&descAlignY=55" alt="Active Directory Administration Banner" width="100%">
</div>

---

## Overview

This module documents the initial configuration and architectural layout of **Active Directory Domain Services (AD DS)** following the deployment of the first Domain Controller. 

Rather than relying on the flat, default Active Directory containers, this phase focuses on designing a scalable, tiered enterprise directory structure using Organizational Units (OUs). This foundation is critical for future Group Policy Object (GPO) deployment, administrative delegation, and logical resource grouping.

---

## Business Scenario

Following the successful promotion of the first Domain Controller, the Infrastructure Team is now responsible for organizing the Active Directory environment. 

The company is expanding and requires a directory structure that reflects its internal departmental breakdown (HR, Sales, IT, Finance, Management) while cleanly separating infrastructure assets (Servers, Workstations, Service Accounts). The team must design and implement a scalable Organizational Unit (OU) hierarchy to move away from the unmanaged default AD containers and prepare the environment for centralized enterprise management.

---

## Learning Objectives

By the end of this document, the following competencies were achieved:

* Explain the function and benefits of Organizational Units (OUs).
* Design and implement an enterprise OU hierarchy.
* Navigate and utilize Active Directory Users and Computers (ADUC).
* Differentiate between default AD containers and custom OUs.
* Prepare the directory structure for targeted Group Policy deployment.

---

## Lab Environment Specifications

| Component | Configuration Details |
| :--- | :--- |
| **Server Name** | SRV01 |
| **Operating System** | Windows Server 2025 Standard Evaluation |
| **Directory Service** | Active Directory Domain Services (AD DS) |
| **Domain** | homelab.local |
| **Management Tool** | Active Directory Users and Computers (ADUC) |

---

# Step-by-Step Implementation

## Step 1 — Open Active Directory Users and Computers

Launched **Active Directory Users and Computers (ADUC)** from the Server Manager Tools menu. ADUC is the primary Microsoft Management Console (MMC) utilized for daily directory administration, identity management, and resource provisioning.

<p align="center">
<img src="/01-Identity-and-Access-Management/05-Active-Directory-Administration/Evidence/Screenshots/21-Open-Active-Directory-Users-and-Computers.png" width="800" alt="Open ADUC">
</p>

---

## Step 2 — Review the Default Active Directory Structure

Examined the out-of-the-box Active Directory layout. By default, AD places users and computers into generic containers (e.g., `CN=Users`, `CN=Computers`). 

These default containers lack the ability to have Group Policy Objects (GPOs) directly linked to them, making them unsuitable for scalable enterprise management. 

---

## Step 3 — Create the Company OU

To establish a management boundary, a top-level parent Organizational Unit named **Company** was created at the root of the domain. 

This acts as the master container for all corporate assets, allowing global IT policies to be applied from a single point without accidentally affecting built-in domain administrative accounts. The "Protect object from accidental deletion" safeguard was enabled.

<p align="center">
<img src="/01-Identity-and-Access-Management/05-Active-Directory-Administration/Evidence/Screenshots/22-Create-Company-OU.png" width="800" alt="Create Company OU">
</p>

---

## Step 4 — Build the Enterprise OU Structure

Within the parent `Company` OU, dedicated child OUs were provisioned for each specific business department (HR, IT, Sales, Finance, Management) and infrastructure asset type (Servers, Workstations, Printers, Service Accounts). 

This granular tiering ensures that policies (like mapping a Finance network drive or enforcing a strict Server firewall) only apply to the exact objects residing within their respective containers.

<p align="center">
<img src="/01-Identity-and-Access-Management/05-Active-Directory-Administration/Evidence/Screenshots/23-Enterprise-OU-Structure.png" width="800" alt="Enterprise OU Structure">
</p>

<p align="center">
<img src="/01-Identity-and-Access-Management/05-Active-Directory-Administration/Evidence/Screenshots/31-Completed-Enterprise-OU-Structure.png" width="800" alt="Completed Enterprise OU Structure">
</p>

---

<div align="center">
<b><a href="./Security-Groups-and-RBAC.md">Next: Part 2 — Security Groups & Role-Based Access Control</a></b><br>
<i>Implementing RBAC, provisioning department security groups, and creating enterprise user accounts.</i>
</div>
