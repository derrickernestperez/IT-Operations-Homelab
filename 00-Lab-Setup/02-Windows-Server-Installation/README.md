<div align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&color=gradient&customColorList=0,2&height=250&section=header&text=Windows%20Server%202025%20Installation&fontSize=45&fontAlignY=35&desc=Module%202%20%7C%20Operating%20System%20Deployment&descSize=20&descAlignY=55" alt="Windows Server Installation Banner" width="100%">
</div>

---

## Overview

This module documents the installation and initial deployment of **Windows Server 2025 Standard Evaluation (Desktop Experience)** on the virtual machine created in Module 1.

After completing the virtualization configuration, the next phase is to deploy the operating system that will serve as the foundation of the enterprise infrastructure. This server will later host critical services including **Active Directory Domain Services (AD DS), DNS, DHCP, Group Policy, File Services, Windows LAPS, Microsoft Entra ID synchronization, and security monitoring tools such as Wazuh SIEM.**

Rather than relying on automated deployment tools, the operating system was installed manually to better understand each stage of the Windows Server installation process.

---

## Business Scenario

The Infrastructure Team has successfully provisioned a virtual machine for the organization's first production server.

The next responsibility is deploying Windows Server 2025 according to enterprise standards. During this stage, the operating system edition is selected, storage is prepared, the installation process is completed, and the initial Administrator account is configured.

A correctly deployed operating system provides the stable platform required before infrastructure services can be installed.

---

## Learning Objectives

By the end of this module, the following competencies were achieved:

* Understand the Windows Server installation workflow.
* Deploy Windows Server 2025 manually using installation media.
* Differentiate between Windows Server editions.
* Configure the initial Administrator account.
* Understand the Secure Attention Sequence (Ctrl + Alt + Delete).
* Prepare the server for post-installation configuration.

---

## Lab Environment Specifications

| Component | Configuration Details |
| :--- | :--- |
| **Operating System** | Windows Server 2025 Standard Evaluation |
| **Installation Type** | Desktop Experience |
| **Virtual Machine** | SRV01 |
| **Disk** | 80 GB NVMe (Thin Provisioned) |
| **Firmware** | UEFI |
| **Secure Boot** | Enabled |
| **Hypervisor** | VMware Workstation Pro |

---

# Step-by-Step Implementation

## Step 1: Windows Setup Language

After booting the virtual machine from the Windows Server installation media, Windows Setup prompted for the installation language, regional format, and keyboard layout.

The default English (United States) settings were retained to maintain consistency with Microsoft documentation and enterprise administration practices.

<p align="center">
<img src="/00-Lab-Setup/02-Windows-Server-Installation/Evidence/Screenshots/14-Windows-Setup-Language.png" width="800" alt="Windows Setup Language">
</p>

---

## Step 2: Start Windows Installation

Selected **Install Windows Server** to begin the operating system deployment.

At this stage, Windows Setup prepares the installation environment before copying the operating system files.

<p align="center">
<img src="/00-Lab-Setup/02-Windows-Server-Installation/Evidence/Screenshots/15-Install-Now.png" width="800" alt="Install Windows Server">
</p>

---

## Step 3: Select Windows Server Edition

Selected:

**Windows Server 2025 Standard Evaluation (Desktop Experience)**

The Standard edition provides all of the infrastructure services required throughout this homelab, while Desktop Experience offers a graphical interface that simplifies administration during the learning process.

<p align="center">
<img src="/00-Lab-Setup/02-Windows-Server-Installation/Evidence/Screenshots/16-Select-Windows-Server-Edition.png" width="800" alt="Windows Server Edition">
</p>

---

## Step 4: Select Installation Disk

Selected the previously created **80 GB virtual NVMe disk**.

Windows Setup automatically creates the required system partitions before installing the operating system.

<p align="center">
<img src="/00-Lab-Setup/02-Windows-Server-Installation/Evidence/Screenshots/17-Select-Installation-Disk.png" width="800" alt="Installation Disk">
</p>

---

## Step 5: Ready to Install

Reviewed the installation summary before proceeding with the deployment.

Verifying the selected edition and installation settings helps prevent configuration mistakes before the operating system is installed.

<p align="center">
<img src="/00-Lab-Setup/02-Windows-Server-Installation/Evidence/Screenshots/18-Ready-To-Install.png" width="800" alt="Ready to Install">
</p>

---

## Step 6: Windows Installation Progress

Windows Server copied files, installed required components, configured system settings, and restarted the virtual machine several times during the deployment process.

This stage completed the operating system installation.

<p align="center">
<img src="/00-Lab-Setup/02-Windows-Server-Installation/Evidence/Screenshots/19-Windows-Installation-Progress.png" width="800" alt="Installation Progress">
</p>

---

## Step 7: Configure the Administrator Account

Configured a strong password for the built-in **Administrator** account.

This account provides full administrative access to the local server before Active Directory is deployed.

<p align="center">
<img src="/00-Lab-Setup/02-Windows-Server-Installation/Evidence/Screenshots/20-Administrator-Password-Setup.png" width="800" alt="Administrator Password">
</p>

---

## Step 8: First Login

After completing the installation, Windows Server presented the Secure Attention Sequence (**Ctrl + Alt + Delete**) login screen.

Successfully reaching this screen confirmed that Windows Server had been installed correctly and was ready for initial configuration.

<p align="center">
<img src="/00-Lab-Setup/02-Windows-Server-Installation/Evidence/Screenshots/21-Ctrl-Alt-Delete-Login-Screen.png" width="800" alt="Windows Server Login">
</p>

---

# Technical Architecture & Justifications

* **Why choose Windows Server Standard?** The Standard edition provides all the infrastructure services required for this homelab, including Active Directory, DNS, DHCP, Group Policy, and File Services, without the additional virtualization features included in Datacenter.

* **Why use Desktop Experience?** Desktop Experience provides a graphical user interface that simplifies administration and learning. Once familiar with Windows Server, transitioning to Server Core becomes significantly easier.

* **Why configure a strong Administrator password?** The built-in Administrator account has unrestricted privileges over the server. Following strong password practices reduces the risk of unauthorized access during the early deployment stages.

* **Why use English (United States)?** Using Microsoft's default language improves consistency with official documentation, PowerShell output, troubleshooting guides, and enterprise support resources.

---

# Skills Demonstrated

* Windows Server Deployment
* Operating System Installation
* Windows Server Edition Selection
* Virtual Disk Deployment
* Local Administrator Configuration
* Enterprise Server Provisioning

---

# Mock Interview Q&A

**Q: Why did you choose Windows Server Standard instead of Datacenter?**

> **A:** Windows Server Standard includes all of the core infrastructure roles required for Active Directory, DNS, DHCP, Group Policy, and File Services. Datacenter is primarily intended for highly virtualized enterprise environments and includes additional features that are unnecessary for this homelab.

---

**Q: Why did you install Desktop Experience instead of Server Core?**

> **A:** Desktop Experience provides a graphical interface that simplifies administration while learning Windows Server. Once the fundamentals are mastered, Server Core becomes easier to manage using PowerShell and Windows Admin Center.

---

**Q: Why is Ctrl + Alt + Delete required before logging in?**

> **A:** Ctrl + Alt + Delete triggers the Secure Attention Sequence, ensuring that login credentials are entered directly into the Windows authentication process. This helps protect against credential spoofing and malicious login screens.

---

<div align="center">
<b><a href="#">Next Module: Initial Windows Server Configuration</a></b><br>
<i>Renaming the server, configuring a static IP address, enabling Remote Desktop, and preparing the server for Active Directory deployment.</i>
</div>
