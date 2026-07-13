<div align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&color=gradient&customColorList=0,2&height=250&section=header&text=Print%20Server%20Management&fontSize=42&fontAlignY=35&desc=Module%2012%20%7C%20Enterprise%20Printer%20Deployment&descSize=20&descAlignY=55" alt="Print Server Management Banner" width="100%">
</div>

---

# Overview

This module documents the deployment and administration of a centralized Print Server within the Windows Server environment.

The objective was to install Print Services, create and share a network printer, configure printer permissions, and automatically deploy printers to domain-joined workstations using Group Policy.

This implementation simulates how organizations centrally manage printers and automate printer deployment across multiple departments.

---

# Business Scenario

The organization requires centralized printer management to reduce administrative overhead and ensure users automatically receive printers without manual installation.

The Infrastructure Team must deploy a shared printer hosted on the Print Server, configure appropriate permissions, and automate printer deployment using Active Directory and Group Policy.

This solution provides consistent printer availability while simplifying endpoint administration.

---

# Learning Objectives

By completing this module, the following competencies were demonstrated:

- Deploy Print and Document Services
- Configure Shared Printers
- Manage Printer Permissions
- Deploy Printers using Group Policy
- Validate Group Policy Printer Deployment
- Administer Print Management Console
- Centralize Printer Administration
- Troubleshoot Printer Deployment

---

# Lab Environment Specifications

| Component | Configuration |
|------------|------------|
| Server Name | SRV01 |
| Client Device | CLIENT01 |
| Operating System | Windows Server 2025 Standard Evaluation |
| Client OS | Windows 11 Enterprise |
| Domain | homelab.local |
| Print Server | SRV01 |
| Management Tool | Print Management |
| Deployment Method | Group Policy Preferences |

---

# Step-by-Step Implementation

---

## Step 1 — Install Print Services

Installed the Print and Document Services role on SRV01.

This role provides the infrastructure required to host and manage network printers within the organization.

<p align="center">
<img src="/01-Identity-and-Access-Management/12-Print-Server-Management/Evidence/Screenshots/01-Install-Print-Services.png" width="900">
</p>

---

## Step 2 — Open Print Management

Opened the Print Management Console to administer printers and print servers.

Print Management provides centralized control over printer deployment and monitoring.

<p align="center">
<img src="/01-Identity-and-Access-Management/12-Print-Server-Management/Evidence/Screenshots/02-Open-Print-Management.png" width="900">
</p>

---

## Step 3 — Create Shared Printer

Created a printer named:

```text
HR-Printer
```

using the Generic / Text Only driver for homelab simulation purposes.

<p align="center">
<img src="/01-Identity-and-Access-Management/12-Print-Server-Management/Evidence/Screenshots/03-Create-HR-Printer.png" width="900">
</p>

---

## Step 4 — Share the Printer

Configured the printer as a shared network resource.

Share Name:

```text
HR-Printer
```

This allows clients to access the printer through the Print Server.

<p align="center">
<img src="/01-Identity-and-Access-Management/12-Print-Server-Management/Evidence/Screenshots/04-Share-Printer.png" width="900">
</p>

---

## Step 5 — Verify Printer Installation

Verified successful printer installation and driver assignment.

The printer was successfully registered on SRV01 and became available for management.

<p align="center">
<img src="/01-Identity-and-Access-Management/12-Print-Server-Management/Evidence/Screenshots/05-Printer-Installed.png" width="900">
</p>

---

## Step 6 — Verify Printer Visibility

Confirmed that HR-Printer appeared in the Print Management Console.

The printer status displayed as Ready, indicating successful deployment.

<p align="center">
<img src="/01-Identity-and-Access-Management/12-Print-Server-Management/Evidence/Screenshots/06-Printer-Visible-In-Print-Management.png" width="900">
</p>

---

## Step 7 — Configure Printer Sharing

Reviewed printer sharing configuration to ensure the printer was available for client deployment.

<p align="center">
<img src="/01-Identity-and-Access-Management/12-Print-Server-Management/Evidence/Screenshots/07-Printer-Sharing-Configured.png" width="900">
</p>

---

## Step 8 — Review Printer Permissions

Reviewed printer security settings and validated administrative access.

Printer permissions determine who can print, manage printers, and manage print jobs.

<p align="center">
<img src="/01-Identity-and-Access-Management/12-Print-Server-Management/Evidence/Screenshots/08-Printer-Permissions.png" width="900">
</p>

---

## Step 9 — Create Printer Deployment GPO

Created a dedicated Group Policy Object:

```text
Workstation - Printer Deployment
```

and linked it to the Workstations Organizational Unit.

<p align="center">
<img src="/01-Identity-and-Access-Management/12-Print-Server-Management/Evidence/Screenshots/09-Create-Printer-GPO.png" width="900">
</p>

---

## Step 10 — Configure Printer Deployment via Group Policy

Configured Group Policy Preferences to automatically deploy the shared printer.

Printer Path:

```text
\\SRV01\HR-Printer
```

This ensures users receive the printer automatically without manual installation.

<p align="center">
<img src="/01-Identity-and-Access-Management/12-Print-Server-Management/Evidence/Screenshots/10-Deploy-Printer-Via-GPO.png" width="900">
</p>

---

## Step 11 — Update Group Policy

Forced Group Policy processing on CLIENT01.

Command used:

```powershell
gpupdate /force
```

This ensured printer deployment settings were applied immediately.

<p align="center">
<img src="/01-Identity-and-Access-Management/12-Print-Server-Management/Evidence/Screenshots/11-GPUpdate-Client01.png" width="900">
</p>

---

## Step 12 — Verify GPO Application

Validated that the Printer Deployment GPO was successfully applied to CLIENT01.

This confirmed proper Group Policy processing and policy inheritance.

<p align="center">
<img src="/01-Identity-and-Access-Management/12-Print-Server-Management/Evidence/Screenshots/12-GPO-Applied-Client01.png" width="900">
</p>

---

## Step 13 — Verify Automatic Printer Installation

Confirmed that the printer automatically appeared on CLIENT01.

Printer:

```text
\\SRV01\HR-Printer
```

This validated successful deployment through Group Policy.

<p align="center">
<img src="/01-Identity-and-Access-Management/12-Print-Server-Management/Evidence/Screenshots/13-Printer-Installed-On-Client01.png" width="900">
</p>

---

## Step 14 — Final Print Server Validation

Performed a final validation using Print Management.

The printer remained:

- Ready
- Shared
- Available for Deployment

This confirmed successful implementation of centralized print services.

<p align="center">
<img src="/01-Identity-and-Access-Management/12-Print-Server-Management/Evidence/Screenshots/14-Print-Server-Final-Configuration.png" width="900">
</p>

---

# Printer Deployment Architecture

```text
SRV01
│
├── HR-Printer
│
└── Group Policy
      │
      ▼
Workstations OU
      │
      ▼
CLIENT01
      │
      ▼
Printer Automatically Installed
```

---

# Validation Results

| Validation Check | Status |
|------------------|--------|
| Print Services Installed | ✅ |
| Printer Created | ✅ |
| Printer Shared | ✅ |
| Printer Permissions Reviewed | ✅ |
| Printer GPO Created | ✅ |
| GPO Applied Successfully | ✅ |
| Printer Deployed Automatically | ✅ |
| Client Printer Verification | ✅ |
| Print Server Validation Completed | ✅ |

---

# Skills Demonstrated

- Windows Server Administration
- Print Server Administration
- Printer Deployment
- Group Policy Management
- Active Directory Integration
- Group Policy Preferences
- Endpoint Configuration Management
- Enterprise Print Services
- Centralized Resource Management

---

# Key Takeaways

This module demonstrated the deployment of a centralized Print Server using Windows Server and Active Directory.

By combining Print Services with Group Policy Preferences, printers can be automatically delivered to users without requiring manual installation. This approach simplifies printer administration, improves consistency, and reflects how enterprise environments manage shared printing resources.

---

<div align="center">

### Module Status

✅ Completed Successfully

**Next Module:** PowerShell Automation

</div>
