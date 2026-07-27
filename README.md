<div align="center">

<img
  src="https://capsule-render.vercel.app/api?type=waving&color=0:0A66C2,50:0078D4,100:00A4EF&height=250&section=header&text=%20%20&fontSize=46&fontColor=FFFFFF&fontAlignY=35&desc=Systems%20Administration%20%E2%80%A2%20Infrastructure%20Operations%20%E2%80%A2%20Identity%20and%20Access%20Management&descSize=16&descAlignY=56&animation=fadeIn"
  width="100%"
  alt=" IT Operations Homelab"
/>

<br>

<a href="https://github.com/derrickernestperez/IT-Operations-Homelab">
  <img src="https://img.shields.io/badge/Explore%20the%20Homelab-181717?style=for-the-badge&logo=github&logoColor=white" alt="Explore the IT Operations Homelab">
</a>

<a href="https://www.linkedin.com/in/derrickperez2002/">
  <img src="https://img.shields.io/badge/Connect%20on%20LinkedIn-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white" alt="Connect on LinkedIn">
</a>

<a href="mailto:derickernestp@gmail.com">
  <img src="https://img.shields.io/badge/Contact%20Me-EA4335?style=for-the-badge&logo=gmail&logoColor=white" alt="Email Derrick Perez">
</a>

<br><br>

<img
  src="https://readme-typing-svg.demolab.com?font=Fira+Code&weight=600&size=18&duration=2800&pause=900&color=0078D4&center=true&vCenter=true&width=900&lines=Windows+Server+Administration;Active+Directory+and+Group+Policy;Identity+Lifecycle+Management;DNS%2C+DHCP%2C+File+and+Print+Services;PowerShell+Automation+and+Reporting;Infrastructure+Troubleshooting;Security+Monitoring+and+Operational+Documentation"
  alt="Technical focus areas"
/>

<br>

<img src="https://img.shields.io/badge/Environment-Windows%20Enterprise%20Homelab-0078D4?style=flat-square" alt="Windows Enterprise Homelab">
<img src="https://img.shields.io/badge/Domain-homelab.local-5E5E5E?style=flat-square" alt="homelab.local">
<img src="https://img.shields.io/badge/Server-SRV01-0078D4?style=flat-square" alt="SRV01">
<img src="https://img.shields.io/badge/Client-CLIENT01-0078D4?style=flat-square" alt="CLIENT01">
<img src="https://img.shields.io/badge/Automation-PowerShell-5391FE?style=flat-square&logo=powershell&logoColor=white" alt="PowerShell automation">
<img src="https://img.shields.io/badge/Documentation-Markdown-000000?style=flat-square&logo=markdown&logoColor=white" alt="Markdown documentation">

</div>

---

# IT Operations Homelab

A hands-on Microsoft infrastructure portfolio demonstrating practical skills in Windows Server administration, Active Directory, Group Policy, PowerShell automation, enterprise troubleshooting, security monitoring, and technical documentation.

This project recreates common responsibilities performed by:

- Help Desk technicians
- Service Desk analysts
- Desktop support technicians
- Junior systems administrators
- Infrastructure support engineers
- Identity and Access Management analysts
- Microsoft 365 administrators
- Junior security operations analysts

The repository focuses on more than installing technology.

Each module demonstrates the complete operational lifecycle:

```text
Business Requirement
        ↓
Architecture and Dependencies
        ↓
Implementation
        ↓
Validation
        ↓
Troubleshooting
        ↓
Security Review
        ↓
Automation and Reporting
        ↓
Operational Documentation
        ↓
Lessons Learned
```

---

## About Me

I am a Computer Science student developing practical experience in systems administration, infrastructure operations, identity management, automation, troubleshooting, and security.

My primary technical project is this Microsoft-based enterprise homelab.

I use the environment to practice how IT teams deploy, manage, validate, troubleshoot, secure, automate, and document business technology.

My current technical focus includes:

- Windows Server administration
- Active Directory Domain Services
- Group Policy
- Identity lifecycle management
- DNS and DHCP
- File and print services
- PowerShell automation
- Windows Admin Center
- Patch management
- Infrastructure monitoring
- Security monitoring
- Technical documentation
- Microsoft cloud identity

---

## Homelab Architecture

```text
                               Internet
                                  │
                       VMware Workstation Pro
                                  │
                        Isolated Lab Network
                                  │
                ┌─────────────────┴─────────────────┐
                │                                   │
              SRV01                              CLIENT01
       Windows Server 2025                Windows 11 Enterprise
                │                                   │
                ├── Active Directory                ├── Domain joined
                ├── DNS                             ├── Group Policy managed
                ├── DHCP                            ├── Mapped drives
                ├── Group Policy                    ├── Folder Redirection
                ├── File Services                   ├── Deployed printer
                ├── Print Services                  ├── Enterprise authentication
                ├── Windows LAPS                    └── Administrative workstation
                ├── Windows Admin Center
                ├── WSUS
                ├── PowerShell Automation
                ├── Security Monitoring
                └── Backup and Recovery
```

This is currently a single-server learning environment.

Future phases will separate infrastructure services across additional servers and introduce:

- Microsoft Entra ID
- Hybrid identity
- Microsoft 365
- Conditional Access
- Identity governance
- Centralized security monitoring
- Cloud-based logging
- Governance, risk, and compliance controls

---

## Current Environment

| Component | Configuration |
|---|---|
| Hypervisor | VMware Workstation Pro |
| Server Operating System | Windows Server 2025 |
| Client Operating System | Windows 11 Enterprise |
| Active Directory Domain | `homelab.local` |
| Domain Controller | `SRV01` |
| Server FQDN | `SRV01.homelab.local` |
| Server IP Address | `192.168.241.10` |
| Managed Workstation | `CLIENT01` |
| Administrative Account | `homelab\Administrator` |
| Standard Test User | `homelab\John Smith` |
| Active Directory Users | 20+ test accounts |
| Organizational Units | Department and infrastructure OUs |
| Security Groups | Department and resource-access groups |
| Automation Platform | PowerShell |
| Management Tools | Server Manager and Windows Admin Center |
| Documentation | Markdown, screenshots, scripts, reports, and CSV files |

---

# Repository Structure

```text
IT-Operations-Homelab
│
├── 00-Lab-Setup
│   ├── Enterprise-Virtualization
│   ├── Windows-Server-Installation
│   └── Windows-11-Deployment
│
├── 01-Identity-and-Access-Management
│   ├── Active-Directory-Domain-Services
│   ├── Active-Directory-Administration
│   ├── Windows-11-Domain-Join
│   ├── Group-Policy-Hardening
│   ├── Windows-LAPS
│   ├── User-Lifecycle-Automation
│   ├── Offboarding-Automation
│   ├── Active-Directory-Auditing
│   ├── Help-Desk-Automation
│   └── Group-Policy-Compliance-Reporting
│
├── 02-Core-Infrastructure
│   ├── DNS-Infrastructure
│   ├── DHCP-Infrastructure
│   ├── File-Services
│   ├── Folder-Redirection
│   ├── Print-Server-Management
│   ├── File-Server-Auditing
│   └── Backup-and-Disaster-Recovery
│
├── 03-Enterprise-Operations
│   ├── Security-Monitoring-with-Honey-Accounts
│   ├── Windows-Admin-Center
│   ├── WSUS-Patch-Management
│   ├── Server-Monitoring
│   ├── Remote-Administration
│   └── Documentation-and-Knowledge-Base
│
├── 04-Cloud-Identity-and-M365
│   ├── Microsoft-Entra-ID
│   ├── Hybrid-Identity
│   ├── Microsoft-365-Administration
│   ├── MFA-and-Conditional-Access
│   └── Identity-Governance
│
├── 05-Security-Operations
│   ├── Sysmon-Deployment
│   ├── Microsoft-Defender
│   ├── Microsoft-Sentinel
│   ├── Threat-Hunting
│   └── Incident-Response
│
└── 06-GRC-and-Compliance
    ├── NIST-Cybersecurity-Framework
    ├── CIS-Benchmarks
    ├── Risk-Assessment
    ├── Control-Mapping
    └── Audit-and-Compliance
```

---

# Featured Module

## Documentation and Knowledge Base

Built a structured internal IT operations documentation repository containing:

- Infrastructure overview
- SRV01 server inventory
- Network and service reference
- Real incident record
- Reusable knowledge base article
- Remote server health-check SOP
- Change-management log
- Centralized documentation index
- Incident-record template
- Knowledge-article template
- Standard Operating Procedure template
- PowerShell documentation-validation script
- CSV validation report

The module documents a real troubleshooting chain involving:

```text
VMware networking
        ↓
IP connectivity
        ↓
DNS resolution
        ↓
Domain discovery
        ↓
Kerberos authentication
        ↓
PowerShell Remoting
```

Final validation:

```text
RequiredDocumentsExist     : True
RequiredScreenshotsExist   : True
ValidationReportPassed     : True
InfrastructureDocumented   : True
IncidentDocumented         : True
KnowledgeArticlePublished  : True
SOPCreated                 : True
ChangeLogCreated           : True
TemplatesCreated           : True
FinalValidation            : PASSED
```

<p align="center">
  <a href="03-Enterprise-Operations/06-Documentation-and-Knowledge-Base">
    <img src="https://img.shields.io/badge/View%20Module-Documentation%20and%20Knowledge%20Base-0078D4?style=for-the-badge&logo=readthedocs&logoColor=white" alt="View Documentation and Knowledge Base">
  </a>
</p>

---

# Completed Work

## Identity and Access Management

- Active Directory Domain Services deployment
- Forest and domain configuration
- Organizational Unit design
- User and security-group administration
- Windows 11 domain join
- Group Policy hardening
- Windows LAPS deployment
- Automated employee onboarding
- Automated employee offboarding
- Joiner, Mover, and Leaver workflows
- Active Directory auditing
- Help Desk PowerShell toolkit
- Group Policy compliance reporting
- CSV-based identity automation
- Account-state validation
- Role-based access concepts

## Core Infrastructure

- DNS forward lookup zones
- DNS reverse lookup zones
- DNS record validation
- DHCP installation
- DHCP scope configuration
- DHCP authorization troubleshooting
- Department file shares
- Share and NTFS permissions
- Group Policy drive mapping
- Folder Redirection
- Print server deployment
- Group Policy printer deployment
- File-share permission auditing
- Backup configuration
- File restoration
- Infrastructure validation

## Enterprise Operations

- Honey-account security monitoring
- PowerShell security alert logging
- Windows Admin Center administration
- WSUS patch-management deployment
- Server health monitoring
- Remote administration
- PowerShell Remoting
- Remote service and process management
- Event Viewer analysis
- CPU, memory, disk, and performance review
- Infrastructure inventory documentation
- Network and service dependency documentation
- Incident and root-cause documentation
- Knowledge base article creation
- Standard Operating Procedure development
- Change-management logging
- Reusable IT documentation templates
- PowerShell documentation validation
- CSV validation reporting

---

# Selected Troubleshooting Scenarios

The lab includes problems I encountered and investigated rather than only successful configurations.

| Scenario | Investigation |
|---|---|
| IP connectivity worked but hostnames failed | Client DNS configuration, `nslookup`, DNS records, resolver cache, and DNS server reachability |
| DHCP stopped servicing clients | DHCP Event ID 1046, Active Directory authorization, service state, and scope configuration |
| Group Policy did not apply | OU placement, GPO links, security filtering, `gpupdate`, and `gpresult` |
| User received Access Denied | Security-group membership, share permissions, NTFS permissions, and effective access |
| Mapped drive did not appear | GPO scope, item-level targeting, user context, and policy processing |
| Folder Redirection remained local | User policy scope, UNC access, permissions, and sign-in processing |
| Printer did not deploy | GPO processing, printer permissions, drivers, and Print Spooler status |
| Server appeared to use high CPU | Running processes, System Idle Process, sustained usage, and Performance Monitor |
| Unexpected server shutdown events appeared | Kernel-Power Event ID 41 and surrounding System log events |
| Honey-account activity was detected | Security log review, authentication events, PowerShell filtering, and alert generation |
| Domain controller, DNS, Kerberos, and PowerShell Remoting failed | VMware networking, IP reachability, DNS configuration, domain discovery, Kerberos, and WinRM |

One investigation began as a PowerShell Remoting authentication failure.

Further testing showed:

- Kerberos authentication failure
- Domain discovery failure
- DNS timeouts
- Failure to reach SRV01 by IP address

Direct connectivity testing identified the underlying problem as a broken VMware network path between CLIENT01 and SRV01.

```text
PowerShell Remoting failure
        ↓
Kerberos authentication failure
        ↓
Domain discovery failure
        ↓
DNS timeout
        ↓
Direct IP connectivity test
        ↓
VMware network-path failure identified
        ↓
Virtual network communication restored
        ↓
DNS resolution validated
        ↓
Domain discovery validated
        ↓
Kerberos and WinRM validated
```

The investigation reinforced an important troubleshooting principle:

```text
Fix the lowest failing layer first.
```

---

# Troubleshooting Methodology

I use a structured troubleshooting model:

```text
See
  ↓
Think
  ↓
Examine
  ↓
Proceed
```

## See

Identify the actual symptoms.

- What failed?
- Who is affected?
- Which systems are involved?
- What error messages appeared?
- When did the issue begin?

## Think

Develop possible causes based on the evidence.

- Network connectivity
- DNS configuration
- Authentication
- Authorization
- Group Policy
- Service state
- Permissions
- Resource usage
- Recent configuration changes

## Examine

Collect technical evidence before making changes.

- PowerShell output
- Event Viewer logs
- Network tests
- DNS queries
- Group Policy reports
- Service status
- Process information
- Permission reports
- Configuration records

## Proceed

Apply the lowest-risk correction and validate the result.

```text
Observe
→ Hypothesize
→ Test
→ Correct
→ Validate
→ Document
```

---

# Repository Roadmap

## 00 — Lab Setup

| Module | Status |
|---|:---:|
| Enterprise Virtualization | ✅ |
| Windows Server Installation | ✅ |
| Windows 11 Deployment | ✅ |

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

## 03 — Enterprise Operations

| Module | Status |
|---|:---:|
| Security Monitoring with Honey Accounts | ✅ |
| Windows Admin Center | ✅ |
| WSUS Patch Management | ✅ |
| Server Monitoring | ✅ |
| Remote Administration | ✅ |
| Documentation and Knowledge Base | ✅ |

## 04 — Cloud Identity and Microsoft 365

| Module | Status |
|---|:---:|
| Microsoft Entra ID | ⬜ |
| Hybrid Identity | ⬜ |
| Microsoft 365 Administration | ⬜ |
| MFA and Conditional Access | ⬜ |
| Identity Governance | ⬜ |

## 05 — Security Operations

| Module | Status |
|---|:---:|
| Sysmon Deployment | ⬜ |
| Microsoft Defender | ⬜ |
| Microsoft Sentinel | ⬜ |
| Threat Hunting | ⬜ |
| Incident Response | ⬜ |

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
🟨 In progress
⬜ Planned
```

---

# Technical Skills

## Systems Administration

- Windows Server 2025
- Windows 11 Enterprise
- Server Manager
- Windows Admin Center
- Windows services
- Event Viewer
- Task Scheduler
- Performance Monitor
- Process investigation
- Service troubleshooting
- Remote administration
- Backup and recovery
- Patch management
- Change management
- Server inventory management
- Operational health checks

## Identity and Access Management

- Active Directory Domain Services
- Organizational Unit design
- User and group administration
- Security-group management
- Role-based access concepts
- Joiner, Mover, and Leaver workflows
- Windows LAPS
- Delegated administration
- Account auditing
- Password and account-state management
- Group Policy administration
- Identity lifecycle automation

## Core Infrastructure

- DNS
- DHCP
- SMB file sharing
- Share permissions
- NTFS permissions
- Effective-access analysis
- Folder Redirection
- Group Policy drive mapping
- Print server administration
- Group Policy printer deployment
- Windows Server Update Services
- Backup and file restoration

## Automation and Reporting

- PowerShell
- Active Directory PowerShell module
- PowerShell Remoting
- CSV-based automation
- User onboarding scripts
- Offboarding scripts
- Permission reporting
- Group Policy reporting
- Event-log monitoring
- Server inventory collection
- Service-health validation
- Documentation validation
- CSV compliance and status reports

## Troubleshooting

- Name-resolution failures
- IP configuration
- DHCP authorization
- Domain connectivity
- Group Policy processing
- File-access failures
- Service failures
- Event-log investigation
- CPU and memory investigation
- VMware virtual-network failures
- DNS and domain-controller reachability
- Kerberos authentication failures
- PowerShell Remoting failures
- Service-port validation
- Layered root-cause analysis

## Documentation and IT Operations

- Technical README files
- Infrastructure documentation
- Server inventory records
- Network and service references
- Incident records
- Root-cause analysis
- Knowledge base articles
- Standard Operating Procedures
- Change-management records
- Troubleshooting runbooks
- Validation checklists
- Architecture documentation
- Documentation templates
- PowerShell-based document validation
- CSV reporting
- Screenshots and evidence collection

---

# Technologies and Tools

<div align="center">

## Microsoft Infrastructure

<img src="https://img.shields.io/badge/Windows%20Server%202025-0078D4?style=for-the-badge&logo=windows&logoColor=white" alt="Windows Server 2025">
<img src="https://img.shields.io/badge/Windows%2011%20Enterprise-0078D4?style=for-the-badge&logo=windows11&logoColor=white" alt="Windows 11 Enterprise">
<img src="https://img.shields.io/badge/Active%20Directory-0078D4?style=for-the-badge&logo=microsoft&logoColor=white" alt="Active Directory">
<img src="https://img.shields.io/badge/Group%20Policy-5E5E5E?style=for-the-badge&logo=microsoft&logoColor=white" alt="Group Policy">
<img src="https://img.shields.io/badge/Windows%20LAPS-0078D4?style=for-the-badge&logo=microsoft&logoColor=white" alt="Windows LAPS">

## Administration and Automation

<img src="https://img.shields.io/badge/PowerShell-5391FE?style=for-the-badge&logo=powershell&logoColor=white" alt="PowerShell">
<img src="https://img.shields.io/badge/Windows%20Admin%20Center-0078D4?style=for-the-badge&logo=microsoft&logoColor=white" alt="Windows Admin Center">
<img src="https://img.shields.io/badge/WSUS-0078D4?style=for-the-badge&logo=microsoft&logoColor=white" alt="WSUS">
<img src="https://img.shields.io/badge/Event%20Viewer-5E5E5E?style=for-the-badge&logo=windows&logoColor=white" alt="Event Viewer">
<img src="https://img.shields.io/badge/Performance%20Monitor-5E5E5E?style=for-the-badge&logo=windows&logoColor=white" alt="Performance Monitor">

## Infrastructure Services

<img src="https://img.shields.io/badge/DNS-0078D4?style=for-the-badge&logo=cloudflare&logoColor=white" alt="DNS">
<img src="https://img.shields.io/badge/DHCP-0078D4?style=for-the-badge&logo=windows&logoColor=white" alt="DHCP">
<img src="https://img.shields.io/badge/File%20Services-0078D4?style=for-the-badge&logo=files&logoColor=white" alt="File Services">
<img src="https://img.shields.io/badge/Print%20Services-5E5E5E?style=for-the-badge&logo=windows&logoColor=white" alt="Print Services">

## Virtualization and Documentation

<img src="https://img.shields.io/badge/VMware%20Workstation-607078?style=for-the-badge&logo=vmware&logoColor=white" alt="VMware Workstation">
<img src="https://img.shields.io/badge/Markdown-000000?style=for-the-badge&logo=markdown&logoColor=white" alt="Markdown">
<img src="https://img.shields.io/badge/CSV%20Reporting-217346?style=for-the-badge&logo=microsoftexcel&logoColor=white" alt="CSV Reporting">
<img src="https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white" alt="Git">
<img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white" alt="GitHub">

## Planned Cloud and Security Stack

<img src="https://img.shields.io/badge/Microsoft%20Entra%20ID-0078D4?style=for-the-badge&logo=microsoftazure&logoColor=white" alt="Microsoft Entra ID">
<img src="https://img.shields.io/badge/Microsoft%20365-D83B01?style=for-the-badge&logo=microsoftoffice&logoColor=white" alt="Microsoft 365">
<img src="https://img.shields.io/badge/Microsoft%20Defender-00A4EF?style=for-the-badge&logo=microsoft&logoColor=white" alt="Microsoft Defender">
<img src="https://img.shields.io/badge/Microsoft%20Sentinel-0078D4?style=for-the-badge&logo=microsoftazure&logoColor=white" alt="Microsoft Sentinel">

</div>

---

# Documentation Methodology

Each project is organized around a repeatable technical documentation model.

## 1. Business Requirement

What problem is being solved?

## 2. Technology and Architecture

Which systems, services, accounts, and dependencies are involved?

## 3. Implementation

How was the technology configured?

## 4. Validation

What evidence proves that the configuration works?

## 5. Troubleshooting

What failed, what symptoms appeared, and how was the issue investigated?

## 6. Root Cause

What was the actual underlying cause?

## 7. Security Review

What permissions, risks, controls, and security implications were considered?

## 8. Automation and Reporting

Which tasks were automated, and what reports were generated?

## 9. Operational Documentation

Can another technician understand, repeat, validate, and troubleshoot the work?

```text
Do not only show the configuration.

Show the reasoning,
the evidence,
the troubleshooting,
and the operational value.
```

---

# Documentation Standards

## Accuracy

Documentation is based on:

- Live PowerShell output
- Actual system configuration
- Real troubleshooting events
- Validated commands
- Saved technical evidence

## Security

The repository does not intentionally include:

- Passwords
- Authentication tokens
- Private keys
- Recovery secrets
- Sensitive production data

## Repeatability

Procedures include:

- Prerequisites
- Commands
- Expected results
- Validation steps
- Failure handling
- Escalation criteria

## Traceability

Changes are connected to:

- Infrastructure records
- Incidents
- Knowledge articles
- Procedures
- Reports
- Validation evidence

## Maintainability

Reusable templates and validation scripts help future documentation follow a consistent structure.

---

# Current Focus

I am currently working toward:

- Microsoft Entra ID
- Hybrid identity
- Microsoft 365 administration
- MFA and Conditional Access
- Identity governance
- Sysmon deployment
- Microsoft Defender
- Microsoft Sentinel
- Threat hunting
- Incident-response fundamentals
- Governance, risk, and compliance

---

# Certifications and Learning

- Google IT Support Professional Certificate
- ISC2 Certified in Cybersecurity — In progress
- Microsoft Learn — Windows Server
- Microsoft Learn — Microsoft Entra ID
- Microsoft Learn — Microsoft 365
- TryHackMe — Windows learning paths
- TryHackMe — Active Directory learning paths
- TryHackMe — Blue Team learning paths

---

# Career Direction

I am preparing for entry-level and junior roles such as:

- IT Support Specialist
- Help Desk Technician
- Service Desk Analyst
- Desktop Support Technician
- Junior Systems Administrator
- Infrastructure Support Engineer
- Identity and Access Management Analyst
- Microsoft 365 Administrator
- Junior Security Operations Analyst

I am particularly interested in positions that combine:

```text
User Support
     +
Windows Infrastructure
     +
Identity Administration
     +
Troubleshooting
     +
Automation
     +
Technical Documentation
```

---

# What This Repository Demonstrates

This repository demonstrates my ability to:

- Build and manage a Windows enterprise lab
- Deploy Active Directory infrastructure
- Administer users, groups, and policies
- Configure DNS and DHCP
- Manage file and print services
- Automate repetitive tasks with PowerShell
- Investigate service and performance issues
- Read and interpret Windows event logs
- Troubleshoot layered infrastructure failures
- Document incidents and root causes
- Create knowledge base articles
- Write repeatable operating procedures
- Record configuration changes
- Validate documentation programmatically
- Present technical work in a structured portfolio

---

# Key Lessons

```text
Installation is only the beginning.
```

A service must also be:

- Configured
- Secured
- Validated
- Monitored
- Troubleshot
- Documented
- Maintained

```text
The visible error may not be the root cause.
```

An authentication failure may originate from:

- Network connectivity
- DNS configuration
- Domain discovery
- Time synchronization
- Service availability
- Account configuration

```text
Fix the lowest failing layer first.
```

```text
A resolved incident becomes more valuable
when the resolution becomes reusable knowledge.
```

```text
A file existing does not mean
the documentation is complete.
```

```text
Do not assume.
Collect.
Validate.
Document.
```

---

# Contact

<div align="center">

<a href="https://www.linkedin.com/in/derrickperez2002/">
  <img src="https://img.shields.io/badge/LinkedIn-Derrick%20Perez-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white" alt="LinkedIn profile">
</a>

<a href="mailto:derickernestp@gmail.com">
  <img src="https://img.shields.io/badge/Email-derickernestp%40gmail.com-EA4335?style=for-the-badge&logo=gmail&logoColor=white" alt="Email Derrick Perez">
</a>

<a href="https://github.com/derrickernestperez">
  <img src="https://img.shields.io/badge/GitHub-derrickernestperez-181717?style=for-the-badge&logo=github&logoColor=white" alt="GitHub profile">
</a>

<br><br>

### Building practical experience through infrastructure deployment, identity administration, troubleshooting, automation, security monitoring, and operational documentation.

<br>

<a href="https://github.com/derrickernestperez/IT-Operations-Homelab">
  <img src="https://img.shields.io/badge/View%20the%20Full%20IT%20Operations%20Homelab-0078D4?style=for-the-badge&logo=github&logoColor=white" alt="View the full IT Operations Homelab">
</a>

<br><br>

<img
  src="https://capsule-render.vercel.app/api?type=waving&color=0:0A66C2,50:0078D4,100:00A4EF&height=120&section=footer"
  width="100%"
  alt="Footer"
/>

</div>
