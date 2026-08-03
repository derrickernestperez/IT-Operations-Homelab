# FILE 1: `00-Lab-Setup/README.md`

# 00 — Lab Setup

> Foundation of the IT Operations Homelab, covering virtualization, Windows Server deployment, and initial server preparation.

## Overview

This section documents how the core virtual environment was designed and prepared before deploying enterprise services.

It establishes the base infrastructure used by the remaining modules, including the virtual server, Windows Server operating system, networking, security settings, updates, and administrative configuration.

## Modules

| Module | Purpose |
|---|---|
| [01 — Enterprise Virtualization](01-Enterprise-Virtualization/) | Creates the virtual-machine environment using VMware Workstation Pro, planned hardware resources, UEFI, Secure Boot, and NAT networking. |
| [02 — Windows Server Installation](02-Windows-Server-Installation/) | Installs Windows Server and prepares the initial local administrator environment. |
| [03 — Initial Server Configuration](03-Initial-Server-Configuration/) | Configures the server name, static networking, DNS settings, updates, time configuration, and initial operating-system state. |

## Foundation Flow

```text
Plan the virtual infrastructure
            ↓
Create the server virtual machine
            ↓
Install Windows Server
            ↓
Configure server identity and networking
            ↓
Apply updates and security settings
            ↓
Prepare the server for enterprise services
```

## Skills Demonstrated

- VMware Workstation Pro administration
- Virtual hardware planning
- Windows Server installation
- UEFI and Secure Boot configuration
- Static IPv4 configuration
- Windows Server updates
- Initial server validation
- Technical documentation

## Environment

| Component | Purpose |
|---|---|
| Windows 11 host | Runs the virtualized homelab |
| VMware Workstation Pro | Provides the virtualization platform |
| `SRV01` | Main Windows Server virtual machine |
| NAT network | Provides controlled internet connectivity |
| GitHub | Stores implementation guides and validation evidence |

## Outcome

After completing this section, the homelab has a prepared Windows Server environment ready for Active Directory Domain Services and the remaining infrastructure modules.

---

[← Return to the main repository](../README.md)

---

# FILE 2: `01-Identity-and-Access-Management/README.md`

# 01 — Identity and Access Management

> Centralized administration of users, computers, permissions, security policies, account lifecycles, and Active Directory operations.

## Overview

This section focuses on managing identities and access inside a Windows domain environment.

It demonstrates how an IT administrator creates and manages Active Directory, joins client computers to the domain, secures administrator accounts, applies Group Policy, automates user onboarding and offboarding, reviews directory activity, and supports common helpdesk operations.

## Modules

| Module | Purpose |
|---|---|
| [01 — Active Directory Domain Services](01-Active-Directory-Domain-Services/) | Installs Active Directory Domain Services and creates the `homelab.local` Windows domain. |
| [02 — Active Directory Administration](02-Active-Directory-Administration/) | Manages organizational units, users, security groups, computers, permissions, and administrative tasks. |
| [03 — Windows 11 Domain Join](03-Windows-11-Domain-Join/) | Connects a Windows 11 workstation to the domain and validates domain authentication and connectivity. |
| [04 — Group Policy Hardening](04-Group-Policy-Hardening/) | Applies password policies, account-lockout controls, workstation restrictions, and security settings through Group Policy. |
| [05 — Windows LAPS](05-Windows-LAPS/) | Automatically rotates and protects local administrator passwords for domain-managed computers. |
| [06 — User Lifecycle Automation](06-User-Lifecycle-Automation/) | Automates user creation, account configuration, group membership, and onboarding tasks using PowerShell. |
| [07 — Offboarding Automation](07-Offboarding-Automation/) | Disables departing-user accounts, removes access, records actions, and supports secure offboarding. |
| [08 — Active Directory Auditing](08-Active-Directory-Auditing/) | Reviews authentication events, account changes, group activity, and important Active Directory security events. |
| [09 — Helpdesk Automation](09-Helpdesk-Automation/) | Automates common support tasks such as account lookup, lockout review, password administration, and device checks. |
| [10 — Group Policy Compliance Reporting](10-Group-Policy-Compliance-Reporting/) | Verifies whether required Group Policy settings are successfully applied and exports compliance results. |

## Identity Lifecycle

```text
Create the domain
        ↓
Create organizational units
        ↓
Create users and groups
        ↓
Join computers to the domain
        ↓
Assign permissions and policies
        ↓
Secure local administrator accounts
        ↓
Monitor and support identities
        ↓
Modify access when roles change
        ↓
Disable and document departing users
```

## Core Areas

### Identity Administration

- Active Directory users
- Security groups
- Organizational units
- Computer accounts
- Administrative delegation
- Group membership
- Account status and password management

### Access Security

- Password policies
- Account-lockout policies
- Group Policy security controls
- Windows LAPS
- Least-privilege administration
- Administrative-account separation

### Automation and Support

- PowerShell user provisioning
- Automated offboarding
- Account-health checks
- Helpdesk reporting
- Group Policy validation
- CSV and text-based reports

### Monitoring and Auditing

- Windows Security logs
- User-account changes
- Group-membership changes
- Authentication failures
- Account lockouts
- Directory-service events

## Skills Demonstrated

- Active Directory Domain Services
- Active Directory Users and Computers
- Windows 11 domain administration
- Group Policy Management
- Windows LAPS
- PowerShell automation
- Identity lifecycle management
- Access-control administration
- Windows Event Viewer
- Compliance reporting
- Helpdesk troubleshooting

## Outcome

After completing this section, the homelab provides a centralized identity environment where users, devices, permissions, security policies, lifecycle events, and support operations can be managed and validated.

---

[← Return to the main repository](../README.md)

---

# FILE 3: `02-Core-Infrastructure/README.md`

# 02 — Core Infrastructure

> Core Windows infrastructure services supporting domain connectivity, address assignment, file storage, printing, auditing, and recovery.

## Overview

This section documents the infrastructure services required for users, computers, and applications to operate inside the Windows domain.

It covers internal name resolution, automatic network configuration, centralized file storage, user-folder management, shared printers, file-access auditing, backups, and disaster-recovery procedures.

## Modules

| Module | Purpose |
|---|---|
| [01 — DNS Infrastructure](01-DNS-Infrastructure/) | Provides internal name resolution, DNS zones, records, forwarders, testing, and troubleshooting. |
| [02 — DHCP Infrastructure](02-DHCP-Infrastructure/) | Provides centralized IPv4 address allocation using DHCP scopes, exclusions, options, reservations, and leases. |
| [03 — File Services](03-File-Services/) | Creates centralized SMB shares, departmental folders, NTFS permissions, and controlled user access. |
| [04 — Folder Redirection](04-Folder-Redirection/) | Redirects user folders from local workstations to protected server-based storage. |
| [05 — Print Server Management](05-Print-Server-Management/) | Configures shared printers and provides centralized printer deployment and administration. |
| [06 — File Server Auditing](06-File-Server-Auditing/) | Records and reviews access to protected files and folders using Windows auditing. |
| [07 — Backup and Disaster Recovery](07-Backup-and-Disaster-Recovery/) | Documents backup, restoration, recovery testing, and service-continuity procedures. |

## Infrastructure Dependency Flow

```text
Active Directory
        ↓
DNS name resolution
        ↓
DHCP client configuration
        ↓
Domain connectivity
        ↓
Group Policy processing
        ↓
File and folder access
        ↓
Shared printer access
        ↓
Auditing and monitoring
        ↓
Backup and recovery
```

## Core Services

### DNS

DNS allows computers to locate domain controllers, servers, services, and other systems by name instead of relying only on IP addresses.

### DHCP

DHCP automatically provides clients with their IP address, subnet mask, default gateway, DNS server, and other network settings.

### File Services

File services provide centralized departmental storage using SMB shares and NTFS permissions.

### Folder Redirection

Folder Redirection protects user data by storing important folders on the server instead of only on the local workstation.

### Print Services

Print Server Management provides a central location for installing, sharing, monitoring, and troubleshooting organizational printers.

### Auditing

File Server Auditing records access attempts and changes involving important files and folders.

### Recovery

Backup and Disaster Recovery procedures provide documented methods for restoring data and returning services to operation.

## Skills Demonstrated

- Windows DNS Server
- Windows DHCP Server
- DNS and DHCP troubleshooting
- SMB file sharing
- NTFS and share permissions
- Folder Redirection
- Print Management
- Windows file auditing
- Backup planning
- Restoration testing
- Disaster-recovery documentation
- PowerShell validation

## Outcome

After completing this section, the domain environment has the core network and resource services required to support users, workstations, shared data, printers, auditing, and recovery.

---

[← Return to the main repository](../README.md)

---

# FILE 4: `03-Enterprise-Operations/README.md`

# 03 — Enterprise Operations

> Day-to-day server operations covering monitoring, patching, remote administration, security detection, troubleshooting, and documentation.

## Overview

This section moves beyond initial server deployment and focuses on the recurring responsibilities of an IT operations team.

It demonstrates how administrators monitor infrastructure, detect suspicious activity, deploy updates, remotely manage systems, investigate failures, validate remediation, and document operational knowledge.

## Modules

| Module | Purpose |
|---|---|
| [01 — Security Monitoring with Honey Accounts](01-Security-Monitoring-Honey-Accounts/) | Uses a decoy Active Directory account, Windows Security events, PowerShell, and alert logs to detect suspicious authentication activity. |
| [02 — Windows Admin Center](02-Windows-Admin-Center/) | Provides browser-based server administration, performance monitoring, process review, event-log analysis, and service management. |
| [03 — WSUS Patch Management](03-WSUS-Patch-Management/) | Centralizes Windows update synchronization, approvals, client targeting, Group Policy configuration, and compliance reporting. |
| [04 — Server Monitoring](04-Server-Monitoring/) | Monitors CPU, memory, storage, services, events, networking, domain health, and historical performance using PowerShell. |
| [05 — Remote Administration](05-Remote-Administration/) | Validates and documents RDP, Server Manager, Computer Management, WinRM, PowerShell Remoting, SMB, and OpenSSH administration. |
| [06 — Documentation and Knowledge Base](06-Documentation-and-Knowledge-Base/) | Creates incident reports, standard operating procedures, knowledge-base articles, inventories, templates, and validation records. |

## Operations Lifecycle

```text
Monitor systems
      ↓
Detect an issue
      ↓
Investigate the cause
      ↓
Apply remediation
      ↓
Validate service health
      ↓
Document the result
      ↓
Automate repeatable work
      ↓
Review and improve
```

## Operational Areas

### Security Monitoring

- Honey-account monitoring
- Windows Security event analysis
- Authentication-event detection
- PowerShell alerting
- Security log documentation

### Centralized Administration

- Windows Admin Center
- Server Manager
- Computer Management
- Event Viewer
- Service and process administration
- Storage and performance review

### Patch Management

- WSUS synchronization
- Update classifications
- Computer groups
- Pilot deployment
- Update approvals
- Client registration
- Compliance reporting

### Server Monitoring

- CPU utilization
- Available memory
- Disk utilization
- Critical services
- Windows events
- DNS resolution
- Network-port checks
- Domain secure-channel health
- Scheduled monitoring
- Historical CSV reporting

### Remote Administration

- Remote Desktop Protocol
- Windows Remote Management
- PowerShell Remoting
- OpenSSH
- Administrative SMB access
- Remote firewall and connectivity validation

### Documentation

- Incident records
- Root-cause analysis
- Standard operating procedures
- Knowledge-base articles
- Asset inventories
- Troubleshooting records
- Validation reports

## Skills Demonstrated

- Windows Admin Center
- Windows Server Update Services
- Windows Event Logs
- PowerShell monitoring
- Scheduled Tasks
- Remote Desktop
- WinRM
- PowerShell Remoting
- OpenSSH
- Security monitoring
- Root-cause analysis
- Technical documentation

## Outcome

After completing this section, the homelab demonstrates how an IT operations team maintains server availability, deploys updates, detects problems, remotely supports infrastructure, and preserves operational knowledge.

---

[← Return to the main repository](../README.md)

---

# FILE 5: `04-Cloud-Identity-and-M365/README.md`

# 04 — Cloud Identity and Microsoft 365

> Cloud identity, hybrid synchronization, Microsoft 365 tenant administration, multifactor authentication, access security, and identity governance.

## Overview

This section extends the on-premises Active Directory environment into Microsoft Entra ID and Microsoft 365.

It demonstrates cloud-user administration, security groups, hybrid identity synchronization, tenant administration, authentication-method security, emergency-access planning, Conditional Access readiness, and identity-governance concepts.

## Modules

| Module | Purpose |
|---|---|
| [01 — Microsoft Entra ID](01-Microsoft-Entra-ID/) | Manages cloud-only users, security groups, administrative roles, user lifecycle testing, audit logs, sign-in logs, Microsoft Graph reporting, and configuration validation. |
| [02 — Hybrid Identity](02-Hybrid-Identity/) | Synchronizes selected on-premises Active Directory identities to Microsoft Entra ID using Microsoft Entra Cloud Sync and Password Hash Sync. |
| [03 — Microsoft 365 Administration](03-Microsoft-365-Administration/) | Reviews tenant information, users, groups, domains, administrator roles, service health, Message Center, and Microsoft Graph inventory. |
| [04 — MFA and Conditional Access](04-MFA-and-Conditional-Access/) | Validates Microsoft Authenticator, emergency-access accounts, authentication methods, MFA sign-ins, and Conditional Access deployment readiness. |
| [05 — Identity Governance](05-Identity-Governance/) | Organizes identity-governance evidence and develops controls for access reviews, privileged access, role governance, and identity lifecycle oversight. |

## Cloud Identity Progression

```text
Create cloud-only identities
            ↓
Create security groups
            ↓
Review administrative roles
            ↓
Investigate audit and sign-in logs
            ↓
Generate Microsoft Graph reports
            ↓
Synchronize on-premises identities
            ↓
Validate Password Hash Sync
            ↓
Administer Microsoft 365
            ↓
Implement MFA controls
            ↓
Prepare Conditional Access designs
            ↓
Develop identity-governance controls
```

## Identity Architecture

```text
On-premises Active Directory
          homelab.local
                │
                │ LDAP, DNS and Kerberos
                ↓
              SYNC02
 Microsoft Entra Cloud Sync Agent
                │
                │ HTTPS 443
                ↓
        Microsoft Entra ID
                │
      ┌─────────┼─────────┐
      │         │         │
 Cloud users  Synced    Security
              users      groups
      │         │         │
      └─────────┼─────────┘
                ↓
    Authentication and access
                ↓
         Microsoft 365
```

## Core Areas

### Microsoft Entra ID

- Cloud-only user administration
- Security-group administration
- Administrative-role review
- User lifecycle testing
- Audit-log investigation
- Sign-in-log investigation
- Microsoft Graph inventory
- Configuration validation

### Hybrid Identity

- Microsoft Entra Cloud Sync
- Scoped organizational-unit synchronization
- Password Hash Sync
- Synchronized users
- Synchronization-agent troubleshooting
- Replacement-agent deployment
- Provisioning validation
- Operational handoff documentation

### Microsoft 365 Administration

- Tenant and organization information
- Active users
- Cloud and synchronized identities
- Security groups
- Domains
- Administrative roles
- Service health
- Message Center
- Microsoft Graph reporting

### MFA and Access Security

- Authentication Methods policy
- Microsoft Authenticator
- Software OATH
- MFA pilot groups
- MFA registration
- Sign-in validation
- Emergency-access accounts
- Tenant-lockout recovery
- Conditional Access designs
- Deployment and rollback planning

### Identity Governance

- Identity lifecycle oversight
- Access reviews
- Privileged-role governance
- Least-privilege access
- Periodic entitlement review
- Governance evidence
- Administrative accountability

## Licensing Limitations

Some Microsoft Entra and Microsoft 365 features require paid licences.

Where a required licence was unavailable, the repository documents the limitation and separates:

```text
COMPLETED AND VALIDATED
```

from:

```text
DESIGN ONLY — LICENCE REQUIRED
```

This prevents unsupported features from being incorrectly presented as deployed.

## Skills Demonstrated

- Microsoft Entra ID
- Microsoft Entra admin center
- Microsoft Entra Cloud Sync
- Password Hash Sync
- Microsoft 365 admin center
- Microsoft Graph PowerShell
- Microsoft Authenticator
- Software OATH
- Authentication Methods policy
- Audit and sign-in log analysis
- Hybrid identity troubleshooting
- Emergency-access planning
- Conditional Access design
- Identity-governance planning

## Security and Privacy

Published evidence should exclude or redact:

- Tenant domains
- User principal names
- Real usernames
- Passwords
- Temporary passwords
- QR codes
- OATH secret keys
- Object IDs
- Request and correlation IDs
- IP addresses
- Device identifiers
- Recovery information
- Authentication secrets

## Outcome

After completing this section, the homelab demonstrates the administration of cloud-only and synchronized identities, Microsoft 365 tenant operations, authentication security, hybrid identity troubleshooting, and governance planning.

---

[← Return to the main repository](../README.md)
