<div align="center">

<img src="https://capsule-render.vercel.app/api?type=waving&color=gradient&customColorList=0,2&height=260&section=header&text=IT%20Operations%20Homelab&fontSize=52&fontAlignY=35&desc=Windows%20Server%20%7C%20Active%20Directory%20%7C%20Infrastructure%20%7C%20Automation%20%7C%20Security&descSize=18&descAlignY=56" alt="IT Operations Homelab Banner" width="100%">

### A hands-on Microsoft infrastructure environment built for systems administration, identity management, troubleshooting, automation, and security operations.

<br>

<a href="https://github.com/derrickernestperez/IT-Operations-Homelab">
  <img src="https://img.shields.io/badge/Repository-IT%20Operations%20Homelab-181717?style=for-the-badge&logo=github&logoColor=white" alt="GitHub Repository">
</a>

<a href="https://www.linkedin.com/in/derrickperez2002/">
  <img src="https://img.shields.io/badge/LinkedIn-Derrick%20Perez-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white" alt="LinkedIn">
</a>

<a href="mailto:derickernestp@gmail.com">
  <img src="https://img.shields.io/badge/Email-Contact%20Me-EA4335?style=for-the-badge&logo=gmail&logoColor=white" alt="Email">
</a>

<br><br>

<img src="https://readme-typing-svg.demolab.com?font=Fira+Code&weight=500&size=18&duration=2800&pause=900&color=0078D4&center=true&vCenter=true&width=950&lines=Windows+Server+2025;Active+Directory+and+Group+Policy;DNS%2C+DHCP%2C+File+and+Print+Services;PowerShell+Automation;Windows+Admin+Center;Security+Monitoring;Microsoft+Entra+ID+and+Microsoft+365" alt="Technical focus areas">

</div>

---

# Overview

This repository documents the design, deployment, administration, troubleshooting, and continued development of my Microsoft IT Operations Homelab.

The environment was created to build practical experience aligned with the responsibilities of:

- Help Desk Technicians
- Service Desk Analysts
- Junior Systems Administrators
- Infrastructure Support Engineers
- Identity and Access Management Administrators
- Microsoft 365 Administrators
- Junior Security Operations Analysts

The project is not presented as a complete production environment.

It is a structured learning environment where I practice how Windows infrastructure technologies work together, how failures are investigated, and how technical work can be documented clearly.

The main operational workflow used throughout the repository is:

```text
Understand the business requirement
              ↓
Plan the configuration
              ↓
Deploy the technology
              ↓
Validate the result
              ↓
Investigate failures
              ↓
Automate repetitive tasks
              ↓
Document the outcome
```

---

# Why I Built This Homelab

Learning individual technologies is useful, but enterprise IT work requires understanding how multiple systems depend on one another.

Examples from this lab include:

```text
Active Directory depends on DNS.
```

```text
Group Policy depends on Active Directory, DNS, network connectivity, and correct OU placement.
```

```text
Drive mappings depend on security groups, Group Policy, SMB, and file permissions.
```

```text
Folder Redirection depends on Group Policy, DNS, file services, and access control.
```

```text
DHCP may assign a valid IP address while still providing an incorrect DNS server.
```

```text
A backup may complete successfully but still fail during restoration.
```

The homelab allows me to work through these relationships directly.

I also use a consistent troubleshooting model:

```text
S.T.E.P.

See
Think
Examine
Proceed
```

The goal is to collect evidence before making changes.

---

# Current Architecture

```text
                               Internet
                                  │
                       VMware Workstation Pro
                                  │
                          Isolated Lab Network
                                  │
               ┌──────────────────┴──────────────────┐
               │                                     │
             SRV01                                CLIENT01
      Windows Server 2025                  Windows 11 Enterprise
               │                                     │
               ├── Active Directory                  ├── Domain joined
               ├── DNS                               ├── Group Policy managed
               ├── DHCP                              ├── Department drive mapping
               ├── Group Policy                      ├── Folder Redirection
               ├── File Services                     ├── Printer deployment
               ├── Print Services                    ├── Windows LAPS managed
               ├── Windows LAPS                      └── Enterprise authentication
               ├── Windows Admin Center
               ├── PowerShell Automation
               ├── Security Monitoring
               └── Backup and Recovery
```

The current environment uses one Windows Server for several infrastructure roles.

This design is appropriate for a resource-limited homelab. A production environment would normally separate critical services across multiple systems and include redundancy, monitoring, high availability, and stronger disaster recovery controls.

---

# Lab Environment

| Component | Configuration |
|---|---|
| Hypervisor | VMware Workstation Pro |
| Server Operating System | Windows Server 2025 Standard Evaluation |
| Client Operating System | Windows 11 Enterprise |
| Active Directory Domain | `homelab.local` |
| Domain Controller | SRV01 |
| Managed Client | CLIENT01 |
| Primary Administration | Server Manager and Windows Admin Center |
| Identity Platform | Active Directory Domain Services |
| Network Services | DNS and DHCP |
| Automation | PowerShell |
| Documentation | Markdown, screenshots, scripts, reports, logs, and notes |

---

# Repository Structure

```text
IT-Operations-Homelab
│
├── README.md
│
├── 00-Lab-Setup
│   ├── 01-Enterprise-Virtualization
│   ├── 02-Windows-Server-Installation
│   └── 03-Windows-11-Deployment
│
├── 01-Identity-and-Access-Management
│   ├── 01-Active-Directory-Domain-Services
│   ├── 02-Active-Directory-Administration
│   ├── 03-Windows-11-Domain-Join
│   ├── 04-Group-Policy-Hardening
│   ├── 05-Windows-LAPS
│   ├── 06-User-Lifecycle-Automation
│   ├── 07-Offboarding-Automation
│   ├── 08-Active-Directory-Auditing
│   ├── 09-Helpdesk-Automation
│   └── 10-Group-Policy-Compliance-Reporting
│
├── 02-Core-Infrastructure
│   ├── 01-DNS-Infrastructure
│   ├── 02-DHCP-Infrastructure
│   ├── 03-File-Services
│   ├── 04-Folder-Redirection
│   ├── 05-Print-Server-Management
│   ├── 06-File-Server-Auditing
│   └── 07-Backup-and-Disaster-Recovery
│
├── 03-Enterprise-Operations
│   ├── 01-Security-Monitoring-Honey-Accounts
│   ├── 02-Windows-Admin-Center
│   ├── 03-WSUS-Patch-Management
│   ├── 04-Server-Monitoring
│   ├── 05-Remote-Administration
│   └── 06-Documentation-and-Knowledge-Base
│
├── 04-Cloud-Identity-and-M365
│   ├── 01-Microsoft-Entra-ID
│   ├── 02-Hybrid-Identity
│   ├── 03-Microsoft-365-Administration
│   ├── 04-MFA-and-Conditional-Access
│   └── 05-Identity-Governance
│
├── 05-Security-Operations
│   ├── 01-Sysmon-Deployment
│   ├── 02-Microsoft-Defender
│   ├── 03-Microsoft-Sentinel
│   ├── 04-Threat-Hunting
│   └── 05-Incident-Response
│
└── 06-GRC-and-Compliance
    ├── 01-NIST-Cybersecurity-Framework
    ├── 02-CIS-Benchmarks
    ├── 03-Risk-Assessment
    ├── 04-Control-Mapping
    └── 05-Audit-and-Compliance
```

---

# Documentation Standard

Each module follows a consistent operational format.

```text
1. Business Problem
        ↓
2. Why the Technology Exists
        ↓
3. Enterprise Scenario
        ↓
4. Core Concepts
        ↓
5. Hands-On Implementation
        ↓
6. Validation
        ↓
7. Troubleshooting
        ↓
8. Security Considerations
        ↓
9. Interview Preparation
        ↓
10. Lessons Learned
```

A typical module structure is:

```text
Module
│
├── README.md
├── Evidence
│   └── Screenshots
├── Scripts
├── Reports
├── Logs
└── Notes
```

Not every module requires every folder.

- Automation modules include scripts.
- Audit modules include reports.
- Monitoring modules include logs.
- Research and concept modules may include notes.
- Evidence folders contain screenshots proving the implementation and validation.

---

# Environment Highlights

## Enterprise Virtualization

The environment was manually provisioned in VMware Workstation Pro to practice virtual hardware planning, network isolation, storage configuration, firmware settings, and server deployment.

<p align="center">
  <img src="/00-Lab-Setup/01-Enterprise-Virtualization/Evidence/Screenshots/12-VM-Hardware-Summary.png"
       width="850"
       alt="SRV01 Virtual Machine Hardware Summary">
</p>

[View Lab Setup](./00-Lab-Setup/)

---

## Active Directory and Identity Management

The domain uses department-based Organizational Units, security groups, Group Policy, Windows LAPS, and automated user lifecycle workflows.

<p align="center">
  <img src="/01-Identity-and-Access-Management/06-User-Lifecycle-Automation/Evidence/Screenshots/02-OU-Structure.png"
       width="850"
       alt="Active Directory Organizational Unit Structure">
</p>

[View Identity and Access Management](./01-Identity-and-Access-Management/)

---

## DNS Infrastructure

DNS supports domain-controller discovery, authentication, Group Policy, host resolution, and internal service access.

The implementation includes forward and reverse lookup zones, A records, PTR records, and name-resolution validation.

<p align="center">
  <img src="/02-Core-Infrastructure/01-DNS-Infrastructure/Evidence/Screenshots/13-DNS-Manager-Final-Configuration.png"
       width="850"
       alt="DNS Manager Final Configuration">
</p>

[View DNS Infrastructure](./02-Core-Infrastructure/01-DNS-Infrastructure/)

---

## DHCP Infrastructure

DHCP automatically provides client IP addresses, subnet masks, gateways, DNS settings, and lease information.

The module also includes a real investigation of DHCP Event ID 1046, where the server stopped servicing clients because it was not authorized in Active Directory.

<p align="center">
  <img src="/02-Core-Infrastructure/02-DHCP-Infrastructure/Evidence/Screenshots/18-Final-DHCP-Configuration.png"
       width="850"
       alt="Final DHCP Infrastructure Configuration">
</p>

[View DHCP Infrastructure](./02-Core-Infrastructure/02-DHCP-Infrastructure/)

---

## Folder Redirection

Desktop and Documents folders were redirected from CLIENT01 to SRV01 through Group Policy.

This centralizes user data and supports backup, recovery, device replacement, and user mobility.

<p align="center">
  <img src="/02-Core-Infrastructure/04-Folder-Redirection/Evidence/Screenshots/10-Server-Redirected-User-Folders.png"
       width="850"
       alt="Redirected User Folders Stored on SRV01">
</p>

[View Folder Redirection](./02-Core-Infrastructure/04-Folder-Redirection/)

---

## Print Server Management

A centralized HR printer was created, shared, secured, and deployed to CLIENT01 through Group Policy.

<p align="center">
  <img src="/02-Core-Infrastructure/05-Print-Server-Management/Evidence/Screenshots/14-Print-Server-Final-Configuration.png"
       width="850"
       alt="Final Print Server Configuration">
</p>

[View Print Server Management](./02-Core-Infrastructure/05-Print-Server-Management/)

---

## Backup and Recovery

A PowerShell backup workflow protects departmental file shares.

The module includes a simulated deletion, restoration, and recovery validation.

<p align="center">
  <img src="/02-Core-Infrastructure/07-Backup-and-Disaster-Recovery/Evidence/Screenshots/09-Restore-Validation.png"
       width="850"
       alt="Backup Restore Validation">
</p>

[View Backup and Disaster Recovery](./02-Core-Infrastructure/07-Backup-and-Disaster-Recovery/)

---

## Security Monitoring

A decoy Active Directory honey account was created for authentication monitoring.

A PowerShell script reviews Security events, identifies activity involving the account, and writes alerts to a log file.

<p align="center">
  <img src="/03-Enterprise-Operations/01-Security-Monitoring-Honey-Accounts/Evidence/Screenshots/09-Security-Monitoring-Complete.png"
       width="850"
       alt="Honey Account Security Monitoring Workflow">
</p>

[View Security Monitoring](./03-Enterprise-Operations/01-Security-Monitoring-Honey-Accounts/)

---

## Windows Admin Center

Windows Admin Center is being used for browser-based administration, performance monitoring, process investigation, service management, and event-log analysis.

<p align="center">
  <img src="/03-Enterprise-Operations/02-Windows-Admin-Center/Evidence/Screenshots/04-Connected-Server-Dashboard.png"
       width="850"
       alt="Windows Admin Center SRV01 Dashboard">
</p>

[View Windows Admin Center](./03-Enterprise-Operations/02-Windows-Admin-Center/)

---

# Project Status

## 00 — Lab Setup

| Module | Status |
|---|:---:|
| Enterprise Virtualization | ✅ |
| Windows Server Installation | ✅ |
| Windows 11 Deployment | ✅ |

---

## 01 — Identity and Access Management

| Module | Status |
|---|:---:|
| Active Directory Domain Services | ✅ |
| Active Directory Administration | ✅ |
| Windows 11 Domain Join | ✅ |
| Group Policy Hardening | ✅ |
| Windows LAPS | ✅ |
| User Lifecycle Automation | ✅ |
| Offboarding Automation | ✅ |
| Active Directory Auditing | ✅ |
| Help Desk Automation | ✅ |
| Group Policy Compliance Reporting | ✅ |

---

## 02 — Core Infrastructure

| Module | Status |
|---|:---:|
| DNS Infrastructure | ✅ |
| DHCP Infrastructure | ✅ |
| File Services | ✅ |
| Folder Redirection | ✅ |
| Print Server Management | ✅ |
| File Server Auditing | ✅ |
| Backup and Disaster Recovery | ✅ |

---

## 03 — Enterprise Operations

| Module | Status |
|---|:---:|
| Security Monitoring with Honey Accounts | ✅ |
| Windows Admin Center | 🟨 |
| WSUS Patch Management | ⬜ |
| Server Monitoring | ⬜ |
| Remote Administration | ⬜ |
| Documentation and Knowledge Base | ⬜ |

---

## 04 — Cloud Identity and Microsoft 365

| Module | Status |
|---|:---:|
| Microsoft Entra ID | ⬜ |
| Hybrid Identity | ⬜ |
| Microsoft 365 Administration | ⬜ |
| MFA and Conditional Access | ⬜ |
| Identity Governance | ⬜ |

---

## 05 — Security Operations

| Module | Status |
|---|:---:|
| Sysmon Deployment | ⬜ |
| Microsoft Defender | ⬜ |
| Microsoft Sentinel | ⬜ |
| Threat Hunting | ⬜ |
| Incident Response | ⬜ |

---

## 06 — Governance, Risk, and Compliance

| Module | Status |
|---|:---:|
| NIST Cybersecurity Framework | ⬜ |
| CIS Benchmarks | ⬜ |
| Risk Assessment | ⬜ |
| Control Mapping | ⬜ |
| Audit and Compliance | ⬜ |

```text
✅ Completed
🟨 In Progress
⬜ Planned
```

---

# Identity and Access Management

## Active Directory Domain Services

The lab includes:

- Active Directory Domain Services deployment
- `homelab.local` domain
- Domain controller configuration
- Organizational Unit structure
- Department users
- Security groups
- Computer objects
- Domain-joined workstation
- Group-based access control

The identity access model follows:

```text
User
  ↓
Department Security Group
  ↓
Resource Permission
  ↓
Access Granted
```

---

## Group Policy

Group Policy is used to standardize and secure domain users and workstations.

Implemented policies include:

- Corporate desktop wallpaper
- Password policy review
- USB storage restriction
- Screen saver enforcement
- Inactivity timeout
- Folder Redirection
- Drive mapping
- Printer deployment
- Windows LAPS
- Group Policy compliance reporting

The validation process is:

```text
Create
  ↓
Configure
  ↓
Link
  ↓
Refresh
  ↓
Verify
  ↓
Test
```

---

## Windows LAPS

Windows LAPS manages the local administrator password on CLIENT01.

The deployment included:

- Verifying LAPS PowerShell commands
- Updating the Active Directory schema
- Granting computer self-permission
- Creating a LAPS GPO
- Configuring Active Directory password backup
- Applying the policy
- Retrieving the managed password
- Protecting sensitive password evidence

---

## User Lifecycle Automation

PowerShell automation was developed for onboarding and offboarding.

### Joiner Workflow

```text
Import employee data
        ↓
Validate required fields
        ↓
Generate username
        ↓
Check duplicate account
        ↓
Select department OU
        ↓
Create Active Directory user
        ↓
Assign security groups
        ↓
Generate success or error report
```

### Leaver Workflow

```text
Validate termination request
        ↓
Locate Active Directory account
        ↓
Disable account
        ↓
Remove group memberships
        ↓
Move account to Disabled Users OU
        ↓
Generate offboarding report
```

This follows the identity lifecycle model:

```text
Joiner
Mover
Leaver
```

---

## Active Directory Auditing

A PowerShell audit script generates reports for:

- Disabled users
- Security groups
- Organizational Units

These reports support:

- Access review
- Administrative cleanup
- Directory documentation
- Security assessment
- Compliance evidence

---

## Help Desk Automation

A menu-driven PowerShell toolkit supports common Help Desk investigations.

Current functions include:

- Find an Active Directory user
- Review account properties
- Display group memberships
- Generate a user report
- Export results to CSV

Future versions will include controlled account unlock and password-reset workflows.

---

# Core Infrastructure

## DNS

The DNS environment includes:

- Active Directory-integrated forward lookup zone
- Reverse lookup zone
- Domain-controller A record
- Test A record
- PTR records
- Forward lookup validation
- Reverse lookup validation
- Client DNS troubleshooting

An important troubleshooting pattern is:

```text
IP connectivity works
+
Hostname resolution fails
=
Investigate DNS
```

Useful commands include:

```cmd
ipconfig /all
nslookup SRV01.homelab.local
nslookup 192.168.241.10
ipconfig /flushdns
```

---

## DHCP

The DHCP environment includes:

- DHCP Server role
- Active Directory authorization
- IPv4 scope
- Address pool
- Exclusion range
- Lease duration
- Default gateway option
- Internal DNS option
- Client lease renewal
- Server-side lease verification

A real troubleshooting case involved:

```text
DHCP Event ID 1046
```

The service determined that it was not authorized in Active Directory and stopped servicing clients.

The investigation included:

```powershell
Get-DhcpServerInDC
Get-Service DHCPServer
Restart-Service DHCPServer
```

---

## File Services

The file server provides departmental shares for areas such as:

- Human Resources
- Finance
- Information Technology
- Sales
- Management

The implementation includes:

- SMB shares
- Share permissions
- NTFS permissions
- Security-group-based access
- Permission inheritance
- Authorized-access testing
- Unauthorized-access testing
- Group Policy drive mappings
- Item-level targeting

---

## Folder Redirection

Desktop and Documents folders are redirected from CLIENT01 to SRV01.

The complete dependency chain is:

```text
Working DNS
+
Available SMB Share
+
Correct Share Permissions
+
Correct NTFS Permissions
+
Correct User GPO Scope
+
User Sign-Out and Sign-In
```

---

## Print Services

The centralized print environment includes:

- Print and Document Services
- Print Management
- HR printer queue
- Printer sharing
- Printer permissions
- Group Policy deployment
- CLIENT01 printer installation
- Print Spooler validation

---

## File Server Auditing

A PowerShell script reviews SMB share permissions and exports:

```text
SharePermissions.csv
```

The audit identifies:

- Share names
- User and group assignments
- Access-control type
- Permission level
- Excessive or unexpected access

The module also explains the difference between:

```text
Share Permissions
```

and:

```text
NTFS Permissions
```

---

## Backup and Disaster Recovery

The backup workflow includes:

- Creating a backup repository
- Developing a PowerShell backup script
- Copying departmental shares
- Creating a test file
- Updating the backup
- Simulating accidental deletion
- Restoring the file
- Validating recovered content

The main lesson is:

```text
A backup is not proven until a restore succeeds.
```

---

# Enterprise Operations

## Security Monitoring with Honey Accounts

A decoy Active Directory account was created with no legitimate operational use.

The expected normal activity is:

```text
Zero logons
```

A PowerShell monitoring script reviews events such as:

```text
4624 — Successful logon
4625 — Failed logon
4648 — Explicit credentials used
4740 — Account locked out
```

When matching activity is found, the script generates an alert and writes evidence to:

```text
HoneyAccountAlerts.log
```

---

## Windows Admin Center

Windows Admin Center provides browser-based administration for SRV01.

Current work includes:

- Server dashboard review
- CPU analysis
- Memory analysis
- Process investigation
- System Idle Process interpretation
- Event Viewer review
- Kernel-Power Event ID 41 analysis
- DHCP Event ID 1046 analysis
- Performance monitoring
- Service administration

The goal is to investigate server health without depending only on Remote Desktop.

---

# Selected Troubleshooting Scenarios

| Scenario | Investigation |
|---|---|
| IP worked but hostname failed | Client DNS configuration, DNS records, `nslookup`, and resolver cache |
| DHCP stopped servicing clients | Active Directory authorization and Event ID 1046 |
| Group Policy did not apply | OU placement, GPO links, filtering, inheritance, and `gpresult` |
| User received Access Denied | Share permissions, NTFS permissions, and security-group membership |
| Mapped drive did not appear | User GPO scope and item-level targeting |
| Folder Redirection stayed local | UNC path, permissions, user policy scope, and sign-in processing |
| Printer did not deploy | GPO scope, printer share, permissions, driver, and Spooler |
| LAPS password was unavailable | Schema, self-permission, policy, and client processing |
| Server showed high resource use | Dashboard, processes, CPU trends, and memory availability |
| Unexpected shutdown event appeared | Kernel-Power Event ID 41 and surrounding events |
| Honey-account alert appeared | Security event review, source analysis, and alert validation |
| Backup completed but recovery needed proof | File restoration and content validation |

---

# PowerShell Projects

The repository includes PowerShell projects for:

- Employee onboarding
- Employee offboarding
- Active Directory auditing
- Help Desk reporting
- Group Policy compliance
- File-share permission auditing
- Backup operations
- Honey-account monitoring

Examples of automated tasks include:

```text
Create Active Directory users
Disable terminated accounts
Assign security groups
Generate CSV reports
Review share permissions
Generate Group Policy evidence
Back up departmental folders
Monitor Windows Security events
```

The scripts are learning projects and should be reviewed and tested before use in another environment.

---

# Technical Skills Demonstrated

## Systems Administration

- Windows Server 2025
- Windows 11 Enterprise
- Server Manager
- Windows Admin Center
- Event Viewer
- Windows services
- Performance monitoring
- Backup and recovery

## Identity and Access Management

- Active Directory Domain Services
- Organizational Unit design
- User and group administration
- Group Policy
- Windows LAPS
- Joiner and Leaver workflows
- Delegated administration concepts
- Account auditing

## Core Infrastructure

- DNS
- DHCP
- SMB
- NTFS permissions
- File services
- Folder Redirection
- Drive mapping
- Print server management

## Automation and Reporting

- PowerShell
- Active Directory PowerShell module
- CSV processing
- Input validation
- Error handling
- Report generation
- Windows event-log querying
- Alert generation

## Security Operations

- Least privilege
- Group-based access
- Honey accounts
- Authentication event review
- Audit reporting
- Credential protection
- Permission review
- Basic incident triage

## Documentation

- Technical README files
- Runbooks
- Troubleshooting guides
- Architecture diagrams
- Validation checklists
- Incident notes
- Screenshots and evidence collection

---

# Technologies

<p align="left">

<img src="https://img.shields.io/badge/Windows%20Server-0078D4?style=for-the-badge&logo=windows&logoColor=white" alt="Windows Server">

<img src="https://img.shields.io/badge/Windows%2011-0078D4?style=for-the-badge&logo=windows11&logoColor=white" alt="Windows 11">

<img src="https://img.shields.io/badge/Active%20Directory-0078D4?style=for-the-badge&logo=microsoft&logoColor=white" alt="Active Directory">

<img src="https://img.shields.io/badge/Group%20Policy-5E5E5E?style=for-the-badge&logo=microsoft&logoColor=white" alt="Group Policy">

<img src="https://img.shields.io/badge/PowerShell-5391FE?style=for-the-badge&logo=powershell&logoColor=white" alt="PowerShell">

<img src="https://img.shields.io/badge/Windows%20Admin%20Center-0078D4?style=for-the-badge&logo=microsoft&logoColor=white" alt="Windows Admin Center">

<img src="https://img.shields.io/badge/Microsoft%20Entra%20ID-0078D4?style=for-the-badge&logo=microsoftazure&logoColor=white" alt="Microsoft Entra ID">

<img src="https://img.shields.io/badge/Microsoft%20365-D83B01?style=for-the-badge&logo=microsoftoffice&logoColor=white" alt="Microsoft 365">

<img src="https://img.shields.io/badge/VMware%20Workstation-607078?style=for-the-badge&logo=vmware&logoColor=white" alt="VMware Workstation">

<img src="https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white" alt="Git">

<img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white" alt="GitHub">

</p>

---

# Useful Administrative Commands

## Active Directory

```powershell
Get-ADUser -Filter *
Get-ADGroup -Filter *
Get-ADOrganizationalUnit -Filter *
Get-ADComputer -Filter *
```

## DNS

```powershell
Resolve-DnsName SRV01.homelab.local
Get-DnsServerZone
Get-DnsServerResourceRecord -ZoneName "homelab.local"
```

## DHCP

```powershell
Get-DhcpServerInDC
Get-DhcpServerv4Scope
Get-DhcpServerv4Lease -ScopeId <ScopeID>
Get-DhcpServerv4OptionValue -ScopeId <ScopeID>
```

## Group Policy

```cmd
gpupdate /force
gpresult /r
gpresult /h C:\Reports\GPResult.html /f
```

## File Services

```powershell
Get-SmbShare
Get-SmbShareAccess -Name "HR"
Get-Acl "C:\Shares\HR"
```

## Print Services

```powershell
Get-Printer
Get-PrinterDriver
Get-PrintJob -PrinterName "HR Printer"
Get-Service Spooler
```

## Performance

```powershell
Get-Counter '\Processor(_Total)\% Processor Time'
Get-Counter '\Memory\Available MBytes'
Get-Counter '\Memory\% Committed Bytes In Use'
```

## Security Events

```powershell
Get-WinEvent `
    -FilterHashtable @{
        LogName = "Security"
        Id      = 4625
    } `
    -MaxEvents 20
```

---

# Security and Privacy

This repository uses a controlled homelab environment.

Before evidence is published, sensitive values should be reviewed and removed.

Examples include:

- Passwords
- Windows LAPS passwords
- Personal information
- Recovery keys
- Authentication tokens
- Private certificates
- Real company data
- Confidential documents
- Sensitive event details
- Production IP addresses

The following values are used only for learning and documentation:

```text
Domain: homelab.local
Server: SRV01
Client: CLIENT01
```

Screenshots containing credentials or recovery information must be blurred, cropped, or replaced before publication.

---

# Current Focus

The active module is:

```text
03-Enterprise-Operations
└── 02-Windows-Admin-Center
```

Current work includes:

- Performance monitoring
- CPU counter review
- Memory analysis
- Disk investigation
- Process correlation
- Event-log analysis
- Evidence-based troubleshooting

Upcoming work includes:

- WSUS patch management
- Server monitoring
- Remote administration
- Microsoft Entra ID
- Hybrid identity
- Microsoft 365
- Sysmon
- Microsoft Defender
- Microsoft Sentinel
- Threat hunting
- Incident response
- NIST and CIS control mapping

---

# Lessons Learned

This project has reinforced several important principles.

```text
Installing a role does not prove that the service works.
```

```text
Creating a GPO does not prove that it applied.
```

```text
Successful access does not prove unauthorized access is blocked.
```

```text
An IP address does not prove DNS is working.
```

```text
A backup does not prove recovery is possible.
```

```text
High resource usage does not automatically mean a server is unhealthy.
```

```text
A security alert is the beginning of an investigation, not the final conclusion.
```

```text
Evidence should come before action.
```

The technical result matters, but the investigation process matters too.

---

# Future Architecture Improvements

The current lab is designed to grow.

Planned improvements include:

- A second domain controller
- Dedicated file server
- Dedicated management server
- Separate monitoring server
- Multiple Windows clients
- Additional user departments
- WSUS
- Windows Event Forwarding
- Sysmon
- Microsoft Defender
- Microsoft Sentinel
- Microsoft Entra ID
- Microsoft 365
- Hybrid identity
- MFA and Conditional Access
- Backup repository on separate storage
- Automated monitoring and alerting
- Security baseline comparison
- GRC control mapping

Future architecture:

```text
                           Internet
                              │
                       Firewall / Router
                              │
                    Segmented Virtual Network
                              │
        ┌─────────────────────┼─────────────────────┐
        │                     │                     │
      DC01                  FILE01                MGMT01
  Active Directory       File Services      Windows Admin Center
  DNS                    Backup              Monitoring
        │                     │                     │
        └─────────────────────┼─────────────────────┘
                              │
                       Windows Clients
                              │
                      Microsoft Entra ID
                              │
                       Microsoft 365
```

---

# Career Direction

This homelab supports my preparation for roles such as:

- IT Support Specialist
- Help Desk Technician
- Service Desk Analyst
- Junior Systems Administrator
- Infrastructure Support Engineer
- Identity and Access Management Analyst
- Microsoft 365 Administrator
- Junior Security Operations Analyst

I am particularly interested in roles that combine:

- User support
- Infrastructure administration
- Identity management
- Troubleshooting
- Automation
- Security monitoring
- Technical documentation

---

# Author

## Derrick Ernest Perez

Computer Science student focused on systems administration, infrastructure operations, identity and access management, Microsoft technologies, automation, and security operations.

<a href="https://www.linkedin.com/in/derrickperez2002/">
  <img src="https://img.shields.io/badge/LinkedIn-Derrick%20Perez-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white" alt="LinkedIn">
</a>

<a href="mailto:derickernestp@gmail.com">
  <img src="https://img.shields.io/badge/Email-derickernestp%40gmail.com-EA4335?style=for-the-badge&logo=gmail&logoColor=white" alt="Email">
</a>

---

<div align="center">

### Practical infrastructure experience through deployment, troubleshooting, automation, security monitoring, and documentation.

<br>

<a href="https://github.com/derrickernestperez/IT-Operations-Homelab">
  <img src="https://img.shields.io/badge/Explore%20the%20Modules-0078D4?style=for-the-badge&logo=github&logoColor=white" alt="Explore the Modules">
</a>

<br><br>

**Current Module:** Windows Admin Center Performance Monitoring

</div>
