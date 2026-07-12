<div align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&color=gradient&customColorList=0,2&height=250&section=header&text=Group%20Policy%20Hardening&fontSize=42&fontAlignY=35&desc=Module%206%20%7C%20Security%20Baselines%20and%20Access%20Control&descSize=20&descAlignY=55" alt="Group Policy Hardening Banner" width="100%">
</div>

---

## Overview

This module documents the implementation of enterprise security controls through **Group Policy Objects (GPOs)** within the Active Directory environment.

Following the deployment of the Organizational Unit structure and Role-Based Access Control (RBAC) framework, Group Policy was leveraged to enforce workstation security baselines, standardize user configurations, restrict unauthorized activities, and automate access to departmental resources.

The objective was to establish a centralized management framework capable of enforcing security requirements across domain-joined endpoints while adhering to the Principle of Least Privilege (PoLP).

---

## Business Scenario

The organization has completed the initial Active Directory deployment and departmental OU design. As the environment grows, IT administrators must ensure that security configurations are consistently enforced across all workstations and users.

To meet compliance and operational requirements, the infrastructure team must deploy enterprise security baselines that address password security, removable media controls, workstation lock policies, departmental file access, and automated resource provisioning through Group Policy.

These controls help reduce the risk of unauthorized access, data exfiltration, ransomware propagation, and policy drift across the enterprise.

---

## Learning Objectives

By the end of this module, the following competencies were achieved:

* Create and manage Group Policy Objects (GPOs).
* Configure workstation security baselines.
* Enforce corporate desktop standards.
* Implement domain password policies.
* Restrict USB storage devices.
* Configure automatic workstation lock policies.
* Create and secure departmental file shares.
* Apply NTFS and Share permissions.
* Configure Group Policy Preferences Drive Mapping.
* Implement Item-Level Targeting.
* Enforce the Principle of Least Privilege (PoLP).

---

## Lab Environment Specifications

| Component | Configuration Details |
| :--- | :--- |
| **Domain Controller** | SRV01 |
| **Client Workstation** | CLIENT01 |
| **Operating System** | Windows Server 2025 / Windows 11 Enterprise |
| **Domain** | homelab.local |
| **Management Tools** | Group Policy Management Console (GPMC), Active Directory Users and Computers (ADUC) |
| **File Services** | SMB File Shares |
| **Authentication** | Active Directory Domain Services (AD DS) |

---

# Section 1 — Creating the Workstation Security Baseline

## Step 1 — Open Group Policy Management

Launched the Group Policy Management Console (GPMC) to begin creating centralized workstation security controls.

<p align="center">
<img src="/01-Identity-and-Access-Management/06-Group-Policy-Hardening/Evidence/Screenshots/01-Open-Group-Policy-Management.png" width="800">
</p>

---

## Step 2 — Review Existing Group Policy Structure

Reviewed the Active Directory Group Policy hierarchy and existing domain-linked policies before creating a dedicated workstation baseline.

<p align="center">
<img src="/01-Identity-and-Access-Management/06-Group-Policy-Hardening/Evidence/Screenshots/02-Group-Policy-Management-Console.png" width="800">
</p>

---

## Step 3 — Create the Workstation Security Baseline GPO

Created a dedicated Group Policy Object named **Workstation Security Baseline** to centralize workstation security configurations.

<p align="center">
<img src="/01-Identity-and-Access-Management/06-Group-Policy-Hardening/Evidence/Screenshots/03-Create-Workstation-Security-Baseline-GPO.png" width="800">
</p>

---

## Step 4 — Edit the Workstation Security Baseline GPO

Opened the Group Policy Management Editor to configure workstation security settings.

<p align="center">
<img src="/01-Identity-and-Access-Management/06-Group-Policy-Hardening/Evidence/Screenshots/04-Workstation-Security-Baseline-GPO-Editor.png" width="800">
</p>

---

# Section 2 — Corporate Wallpaper Enforcement

## Step 5 — Create a Centralized Wallpaper Repository

Created a shared folder on the Domain Controller to host the corporate desktop wallpaper.

<p align="center">
<img src="/01-Identity-and-Access-Management/06-Group-Policy-Hardening/Evidence/Screenshots/05-Wallpaper-Shared-Folder.png" width="800">
</p>

---

## Step 6 — Configure Desktop Wallpaper Policy

Configured a Group Policy setting to enforce a standardized corporate wallpaper across all domain-joined workstations.

<p align="center">
<img src="/01-Identity-and-Access-Management/06-Group-Policy-Hardening/Evidence/Screenshots/06-Desktop-Wallpaper-Policy.png" width="800">
</p>

---

## Step 7 — Apply Group Policy Updates

Forced a Group Policy refresh to apply the new wallpaper settings.

<p align="center">
<img src="/01-Identity-and-Access-Management/06-Group-Policy-Hardening/Evidence/Screenshots/07-GPUpdate-Force.png" width="800">
</p>

---

## Step 8 — Verify GPO Application

Verified that the Workstation Security Baseline GPO was successfully applied to the workstation.

<p align="center">
<img src="/01-Identity-and-Access-Management/06-Group-Policy-Hardening/Evidence/Screenshots/08-GPResult-Workstation-Security-Baseline.png" width="800">
</p>

---

## Step 9 — Validate Corporate Wallpaper Deployment

Confirmed successful deployment of the corporate wallpaper on the client workstation.

<p align="center">
<img src="/01-Identity-and-Access-Management/06-Group-Policy-Hardening/Evidence/Screenshots/09-Corporate-Wallpaper-Applied.png" width="800">
</p>

---

# Section 3 — Password Policy Configuration

## Step 10 — Open the Default Domain Policy

Accessed the Default Domain Policy to configure domain-wide password requirements.

<p align="center">
<img src="/01-Identity-and-Access-Management/06-Group-Policy-Hardening/Evidence/Screenshots/10-Default-Domain-Policy.png" width="800">
</p>

---

## Step 11 — Configure Password Policy Settings

Configured password complexity, history, minimum length, and password age requirements.

<p align="center">
<img src="/01-Identity-and-Access-Management/06-Group-Policy-Hardening/Evidence/Screenshots/11-Password-Policy-Settings.png" width="800">
</p>

---

## Step 12 — Apply Password Policy Updates

Forced Group Policy updates to distribute the new password requirements.

<p align="center">
<img src="/01-Identity-and-Access-Management/06-Group-Policy-Hardening/Evidence/Screenshots/12-GPUpdate-Password-Policy.png" width="800">
</p>

---

# Section 4 — USB Storage Restriction

## Step 13 — Configure USB Storage Restrictions

Created a policy to prevent the use of unauthorized USB storage devices.

<p align="center">
<img src="/01-Identity-and-Access-Management/06-Group-Policy-Hardening/Evidence/Screenshots/13-USB-Storage-Restriction-GPO.png" width="800">
</p>

---

## Step 14 — Apply USB Restriction Policy

Forced Group Policy updates to deploy USB storage restrictions.

<p align="center">
<img src="/01-Identity-and-Access-Management/06-Group-Policy-Hardening/Evidence/Screenshots/14-GPUpdate-USB-Policy.png" width="800">
</p>

---

## Step 15 — Verify USB Restriction Policy

Confirmed successful application of the USB restriction policy.

<p align="center">
<img src="/01-Identity-and-Access-Management/06-Group-Policy-Hardening/Evidence/Screenshots/15-GPResult-USB-Policy.png" width="800">
</p>

---

# Section 5 — Screen Saver Lock Policy

## Step 16 — Enable Screen Saver Enforcement

Configured Group Policy to enforce screen saver usage.

<p align="center">
<img src="/01-Identity-and-Access-Management/06-Group-Policy-Hardening/Evidence/Screenshots/16-Enable-Screen-Saver-Policy.png" width="800">
</p>

---

## Step 17 — Require Password Protection

Configured password protection when resuming from the screen saver.

<p align="center">
<img src="/01-Identity-and-Access-Management/06-Group-Policy-Hardening/Evidence/Screenshots/17-Password-Protect-Screen-Saver-Policy.png" width="800">
</p>

---

## Step 18 — Configure Screen Saver Timeout

Configured an inactivity timeout of 900 seconds before workstation lock.

<p align="center">
<img src="/01-Identity-and-Access-Management/06-Group-Policy-Hardening/Evidence/Screenshots/18-Screen-Saver-Timeout-900-Seconds.png" width="800">
</p>

---

## Step 19 — Force a Specific Screen Saver

Configured a standardized screen saver through Group Policy.

<p align="center">
<img src="/01-Identity-and-Access-Management/06-Group-Policy-Hardening/Evidence/Screenshots/19-Force-Specific-Screen-Saver.png" width="800">
</p>

---
