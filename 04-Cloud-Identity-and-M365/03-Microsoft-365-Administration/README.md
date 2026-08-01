<div align="center">

<img src="https://capsule-render.vercel.app/api?type=waving&color=0:0A66C2,50:0078D4,100:00A4EF&height=250&section=header&text=Microsoft%20365%20Administration&fontSize=46&fontColor=FFFFFF&fontAlignY=35&desc=Tenant%20Administration%20%E2%80%A2%20Identity%20Review%20%E2%80%A2%20Service%20Health%20%E2%80%A2%20Microsoft%20Graph&descSize=17&descAlignY=57&animation=fadeIn" width="100%" alt="Microsoft 365 Administration Homelab Module">

<br>

<img src="https://img.shields.io/badge/Status-Completed-2EA44F?style=for-the-badge&logo=checkmarx&logoColor=white" alt="Completed">
<img src="https://img.shields.io/badge/Platform-Microsoft%20365-0078D4?style=for-the-badge&logo=microsoft365&logoColor=white" alt="Microsoft 365">
<img src="https://img.shields.io/badge/Identity-Microsoft%20Entra%20ID-0078D4?style=for-the-badge&logo=microsoftazure&logoColor=white" alt="Microsoft Entra ID">
<img src="https://img.shields.io/badge/Automation-Microsoft%20Graph%20PowerShell-5391FE?style=for-the-badge&logo=powershell&logoColor=white" alt="Microsoft Graph PowerShell">
<img src="https://img.shields.io/badge/Licence%20State-Unlicensed-5E5E5E?style=for-the-badge&logo=microsoft&logoColor=white" alt="Unlicensed tenant">

<br><br>

<a href="../../">
  <img src="https://img.shields.io/badge/Back%20to%20Main%20Homelab-181717?style=for-the-badge&logo=github&logoColor=white" alt="Back to main homelab">
</a>

<a href="Evidence/Screenshots">
  <img src="https://img.shields.io/badge/View%20Evidence-0078D4?style=for-the-badge&logo=files&logoColor=white" alt="View evidence">
</a>

<a href="Scripts">
  <img src="https://img.shields.io/badge/View%20PowerShell%20Scripts-5391FE?style=for-the-badge&logo=powershell&logoColor=white" alt="View PowerShell scripts">
</a>

</div>

---

# Microsoft 365 Administration

This module documents the review, administration, validation, monitoring, and reporting of a Microsoft 365 tenant.

The project continues from the previous cloud identity modules:

```text
Microsoft Entra ID
        ↓
Hybrid Identity
        ↓
Microsoft 365 Administration
```

The tenant contains both cloud-only identities and users synchronized from the on-premises Active Directory environment.

The Microsoft 365 tenant did not contain an active Microsoft 365 product licence during this module.

The project therefore focused on the administrative capabilities that remained available without a product licence:

- Organisation information
- Active-user administration
- Cloud-only and synchronized identity review
- Domain review
- Security-group review
- Group-membership review
- Administrative-role review
- Service-health monitoring
- Message Center monitoring
- User-account review
- Microsoft Graph PowerShell reporting
- Licence-state validation
- Operational documentation

Licence-dependent workloads were documented as **out of scope**, not as failed implementations.

These workloads included:

```text
Exchange Online mailboxes
Shared mailboxes
Microsoft Teams workload testing
SharePoint Online
OneDrive
Microsoft 365 desktop applications
Group-based licensing
Licence-based mail flow
```

---

# Business Scenario

The Homelab IT Administration team already operates:

```text
SRV01
Windows Server 2025
Domain Controller and DNS
homelab.local

SYNC02
Windows Server 2022
Microsoft Entra Cloud Sync Agent

Microsoft Entra ID
Cloud identity and access platform

Microsoft 365
Cloud administration platform
```

The previous Hybrid Identity module synchronized selected Active Directory users to Microsoft Entra ID.

The next requirement was to review how those identities appeared and could be administered through Microsoft 365.

The required administration flow was:

```text
On-premises Active Directory
            ↓
Microsoft Entra Cloud Sync
            ↓
Microsoft Entra ID
            ↓
Microsoft 365 admin center
            ↓
Tenant administration
```

The organisation needed to review:

- Current tenant information
- Existing users
- User account states
- Licence availability
- Current domains
- Security groups
- Group membership
- Administrative roles
- Microsoft service health
- Service announcements
- Microsoft Graph reporting
- Security and operational limitations

---

# Project Objectives

By completing this module, I practised:

- Reviewing Microsoft 365 organisation information
- Reviewing tenant-level settings
- Reviewing active users
- Identifying cloud-only users
- Identifying synchronized users
- Reviewing account state
- Reviewing sign-in state
- Reviewing licence availability
- Reviewing the current Microsoft 365 domain
- Reviewing Microsoft Entra security groups
- Reviewing security-group membership
- Reviewing administrative roles
- Applying least-privilege principles
- Reviewing Microsoft 365 service health
- Reviewing Message Center announcements
- Reviewing user-administration options
- Installing Microsoft Graph PowerShell
- Connecting to Microsoft Graph using delegated permissions
- Reviewing the Microsoft Graph session context
- Retrieving tenant information
- Retrieving user inventory
- Retrieving group inventory
- Retrieving licence inventory
- Retrieving domain inventory
- Retrieving active administrative roles
- Disconnecting the Microsoft Graph session
- Documenting licence limitations honestly
- Protecting tenant identifiers in public evidence
- Producing professional portfolio documentation

---

# Lab Environment

| Component | Configuration |
|---|---|
| Cloud platform | Microsoft 365 |
| Identity platform | Microsoft Entra ID |
| Default cloud domain | `yourtenant.onmicrosoft.com` |
| On-premises domain | `homelab.local` |
| Domain controller | `SRV01` |
| Domain controller address | `192.168.241.10` |
| Domain controller operating system | Windows Server 2025 |
| Cloud Sync server | `SYNC02` |
| Cloud Sync server address | `192.168.241.112` |
| Cloud Sync server operating system | Windows Server 2022 |
| Synchronization technology | Microsoft Entra Cloud Sync |
| Administrative device | Windows administrative workstation |
| User types | Cloud-only and synchronized |
| Microsoft 365 product licences | None |
| Automation platform | Microsoft Graph PowerShell |
| Authentication type | Delegated |
| Microsoft Graph context scope | Process |
| Evidence format | PNG screenshots |
| Documentation format | Markdown |

> Sensitive identifiers such as the real tenant domain, tenant ID, administrator email address, user principal names, organisation address, technical contact, object IDs, subscription details, and authentication tokens must not be published.

---

# Architecture

```text
                         Microsoft Cloud
                               │
                       Microsoft 365 Tenant
                               │
              ┌────────────────┼────────────────┐
              │                │                │
         Active Users     Security Groups   Admin Roles
              │                │                │
              ├─────────┐      │                │
              │         │      │                │
       Cloud-only    Synchronized          Service Health
          users          users                  │
                           │                Message Center
                           │
                    Microsoft Entra ID
                           │
                    Entra Cloud Sync
                           │
                         SYNC02
                  Windows Server 2022
                           │
                    LDAP / DNS / Kerberos
                           │
                         SRV01
                  Windows Server 2025
                           │
                     homelab.local
```

## Identity Flow

```text
Active Directory identity
            ↓
Microsoft Entra Cloud Sync
            ↓
Microsoft Entra ID identity
            ↓
Microsoft 365 user object
            ↓
Licence and service assignment
```

## Administrative Flow

```text
Tenant review
      ↓
Identity review
      ↓
Domain review
      ↓
Group review
      ↓
Role review
      ↓
Service-health review
      ↓
Message Center review
      ↓
Microsoft Graph reporting
      ↓
Validation
      ↓
Documentation
```

---

# Repository Structure

```text
03-Microsoft-365-Administration
│
├── README.md
│
├── Evidence
│   └── Screenshots
│       ├── 01-Microsoft-365-Organization-Information.png
│       ├── 02-Microsoft-365-Active-Users-and-Licences.png
│       ├── 03-Microsoft-365-Current-Domain-State.png
│       ├── 04-Microsoft-365-Active-Groups.png
│       ├── 05-SG-Cloud-IT-General-Details.png
│       ├── 06-SG-Cloud-IT-Members.png
│       ├── 07-Microsoft-365-Administrative-Roles.png
│       ├── 08-Microsoft-365-Service-Health.png
│       ├── 09-Microsoft-365-Message-Center.png
│       ├── 10-Microsoft-365-User-Administration-Review.png
│       ├── 11-Microsoft-Graph-Tenant-Summary.png
│       ├── 12-Microsoft-Graph-User-Inventory.png
│       ├── 13-Microsoft-Graph-Group-Inventory.png
│       ├── 14-Microsoft-Graph-Licence-Inventory.png
│       ├── 15-Microsoft-Graph-Domain-Inventory.png
│       ├── 16-Microsoft-Graph-Administrative-Roles.png
│       └── 17-Microsoft-Graph-Session-Disconnected.png
│
├── Procedures
│   └── SOP-Microsoft-365-Tenant-Administration.md
│
├── Reports
│   ├── Microsoft-365-Tenant-Summary.txt
│   ├── Microsoft-365-User-Inventory.csv
│   ├── Microsoft-365-Group-Inventory.csv
│   ├── Microsoft-365-Licence-Inventory.csv
│   ├── Microsoft-365-Domain-Inventory.csv
│   └── Microsoft-365-Administrative-Roles.csv
│
└── Scripts
    └── Export-Microsoft365Inventory.ps1
```

---

# Implementation Summary

## Step 1 — Review Microsoft 365 Organisation Information

The first task was to review the Microsoft 365 organisation profile.

The page was opened through:

```text
Microsoft 365 admin center
        ↓
Settings
        ↓
Org settings
        ↓
Organization profile
        ↓
Organization information
```

The following fields were available:

```text
Default domain
Tenant ID
Sold-to address
Technical contact
Preferred language
Country or region
```

<p align="center">
  <img src="Evidence/Screenshots/01-Microsoft-365-Organization-Information.png" width="850" alt="Microsoft 365 organization information">
</p>

### Result

The organisation information page loaded successfully and displayed the current Microsoft 365 tenant information.

The preferred language and regional organisation information were reviewable.

Sensitive values were removed from the public screenshot.

### Security Review

The following fields were hidden or cropped:

```text
Real tenant domain
Tenant ID
Sold-to address
Technical contact
Administrator email address
Personal organisation name
```

Public documentation uses placeholders such as:

```text
yourtenant.onmicrosoft.com
<tenant-id-redacted>
<address-redacted>
<admin-email-redacted>
```

### Key Lesson

```text
Microsoft 365 organisation settings
contain operational and sensitive tenant data.
```

---

## Step 2 — Review Active Users and Licence Status

The Active users page was opened through:

```text
Microsoft 365 admin center
        ↓
Users
        ↓
Active users
```

<p align="center">
  <img src="Evidence/Screenshots/02-Microsoft-365-Active-Users-and-Licences.png" width="850" alt="Microsoft 365 active users and licences">
</p>

The list contained both:

```text
Cloud-only identities
        +
Synchronized Active Directory identities
```

### Identity Sources

Cloud-only users were created directly in Microsoft Entra ID.

Synchronized users originated from the on-premises Active Directory environment.

```text
homelab.local
      ↓
Microsoft Entra Cloud Sync
      ↓
Microsoft Entra ID
      ↓
Microsoft 365 admin center
```

### Fields Reviewed

The following properties were reviewed:

```text
Display name
Username
Licence status
Sign-in state
User source
```

### Licence Result

The users appeared in the tenant, but no Microsoft 365 product licences were available.

```text
Identity exists
        ↓
User appears in Microsoft 365
        ↓
No product licence assigned
        ↓
Licence-dependent services unavailable
```

### Important Difference

```text
Microsoft Entra identity
does not automatically mean
Microsoft 365 service entitlement.
```

Without a valid product licence, users cannot use licence-dependent services such as:

```text
Exchange Online
OneDrive
SharePoint Online
Microsoft Teams licensed features
Microsoft 365 desktop applications
```

### Result

```text
Cloud-only users: Visible
Synchronized users: Visible
User account states: Reviewable
Product licences: None available
Visible user licence state: Unlicensed
```

### Key Lesson

```text
Identity administration
and
service licensing
are separate functions.
```

---

## Step 3 — Review the Current Domain State

The domain page was opened through:

```text
Microsoft 365 admin center
        ↓
Settings
        ↓
Domains
```

<p align="center">
  <img src="Evidence/Screenshots/03-Microsoft-365-Current-Domain-State.png" width="850" alt="Microsoft 365 current domain state">
</p>

### Domain Reviewed

The tenant contained the original Microsoft-provided domain:

```text
yourtenant.onmicrosoft.com
```

The real domain was hidden because it contained personally identifying information.

### Properties Reviewed

```text
Domain name
Domain status
Default domain state
Domain type
Available services
```

### Result

```text
Domain count: 1
Domain type: onmicrosoft.com
Domain status: Healthy
Default domain: Yes
```

### What Is an `onmicrosoft.com` Domain?

Microsoft creates an initial `onmicrosoft.com` domain when a Microsoft 365 tenant is created.

It may be used for:

- Initial administrator sign-in
- Cloud user principal names
- Microsoft service configuration
- Tenant identity operations
- Fallback domain operations

### Future Domain Improvements

Possible future improvements include:

```text
Add a cleaner onmicrosoft.com fallback domain
Add a verified custom domain
Configure a new default domain
Update future user sign-in suffixes
Validate required DNS records
```

### Key Lesson

```text
The default domain affects
new identity creation and tenant administration.
```

---

## Step 4 — Review Active Security Groups

The group page was opened through:

```text
Microsoft 365 admin center
        ↓
Teams & groups
        ↓
Active teams & groups
        ↓
Security groups
```

<p align="center">
  <img src="Evidence/Screenshots/04-Microsoft-365-Active-Groups.png" width="850" alt="Microsoft 365 active security groups">
</p>

### Groups Reviewed

```text
SG-Cloud-Finance
SG-Cloud-HR
SG-Cloud-IT
```

These groups were previously created in Microsoft Entra ID and were visible in the Microsoft 365 admin center.

### Naming Standard

```text
SG-Cloud-Department
```

Examples:

```text
SG-Cloud-IT
SG-Cloud-HR
SG-Cloud-Finance
```

### Naming Meaning

```text
SG
= Security Group

Cloud
= Created and managed in Microsoft Entra ID

IT / HR / Finance
= Department or business function
```

### Administrative Purpose

Security groups may be used to assign:

- Application access
- File access
- SharePoint permissions
- Azure permissions
- Conditional Access policy scope
- Future licence assignments
- Department-specific resources

### Access-Control Model

```text
User account
      ↓
Security-group membership
      ↓
Permission or policy
      ↓
Access granted
```

### Result

```text
Visible security groups: 3
Group category: Security
Management platform: Microsoft Entra ID
Purpose: Departmental access control
```

### Key Lesson

```text
Permissions should be assigned
to groups whenever practical
instead of directly to users.
```

---

## Step 5 — Review `SG-Cloud-IT` General Details

The `SG-Cloud-IT` security group was opened to review its general properties.

<p align="center">
  <img src="Evidence/Screenshots/05-SG-Cloud-IT-General-Details.png" width="850" alt="SG Cloud IT general details">
</p>

### Properties Reviewed

```text
Group name
Group type
Mail state
Membership model
Synchronization state
Description
```

### Expected Configuration

```text
Group name: SG-Cloud-IT
Group category: Security
Security enabled: Yes
Mail enabled: No
Membership model: Assigned
Management source: Microsoft Entra ID
```

### What Security Enabled Means

```text
SecurityEnabled: True
```

A security-enabled group can be used for access control.

Possible uses include:

- Application permissions
- Resource access
- Conditional Access targeting
- SharePoint permissions
- Azure permissions
- Departmental authorization

### What Mail Enabled Means

```text
MailEnabled: False
```

This means:

```text
The group does not have email capability
The group does not have a mailbox
Users cannot send email to the group
```

This is normal for a standard security group.

### Membership Type

The group used assigned membership.

```text
Administrator
      ↓
Adds or removes a user
      ↓
Group membership changes
```

This differs from dynamic membership, where membership is controlled automatically by a rule.

### Result

```text
Group found: Yes
Group category: Security
Security enabled: Yes
Mail enabled: No
Membership model: Assigned
Cloud managed: Yes
```

### Key Lesson

```text
A cloud security group
can control access
without being mail-enabled.
```

---

## Step 6 — Review `SG-Cloud-IT` Membership

The Members page was opened for the `SG-Cloud-IT` group.

<p align="center">
  <img src="Evidence/Screenshots/06-SG-Cloud-IT-Members.png" width="850" alt="SG Cloud IT members">
</p>

### Review Purpose

The membership review confirmed which identities were associated with the security group.

The group was reviewed without changing membership.

### Membership Administration Model

```text
User joins department
        ↓
Administrator adds user to group
        ↓
Group-based access becomes available
```

During offboarding:

```text
User leaves department
        ↓
Administrator removes user from group
        ↓
Group-based access is removed
```

### Result

```text
Group: SG-Cloud-IT
Membership page: Accessible
Membership: Reviewed
Changes made: None
```

### Key Lesson

```text
Group membership should be reviewed
regularly to prevent unnecessary access.
```

---

## Step 7 — Review Administrative Roles

The administrative-role page was opened through:

```text
Microsoft 365 admin center
        ↓
Roles
        ↓
Role assignments
```

<p align="center">
  <img src="Evidence/Screenshots/07-Microsoft-365-Administrative-Roles.png" width="850" alt="Microsoft 365 administrative roles">
</p>

### Roles Reviewed

Visible roles included:

```text
Global Administrator
Global Reader
Helpdesk Administrator
Service Support Administrator
SharePoint Administrator
Exchange Administrator
User Administrator
```

### Administrative Purpose

| Role | General Purpose |
|---|---|
| Global Administrator | Full tenant administration |
| Global Reader | Read-only access to tenant settings |
| Helpdesk Administrator | Password and support-related tasks |
| Service Support Administrator | Service-health and support visibility |
| SharePoint Administrator | SharePoint and OneDrive administration |
| Exchange Administrator | Exchange Online administration |
| User Administrator | User and group administration |

### Least-Privilege Model

```text
Administrative task identified
            ↓
Required permission reviewed
            ↓
Narrowest suitable role selected
            ↓
Role assigned only when needed
            ↓
Role assignment reviewed
```

No role assignments were changed during this module.

### Key Lesson

```text
Global Administrator
should not be used
for every administrative task.
```

---

## Step 8 — Review Microsoft 365 Service Health

The Service health page was opened through:

```text
Microsoft 365 admin center
        ↓
Health
        ↓
Service health
```

<p align="center">
  <img src="Evidence/Screenshots/08-Microsoft-365-Service-Health.png" width="850" alt="Microsoft 365 service health">
</p>

### Observed State

```text
Microsoft 365 suite: 1 advisory
Microsoft 365 Copilot Chat: Healthy
Microsoft Entra: Healthy
```

### Administrative Purpose

Service health helps determine whether a problem is caused by:

```text
Local configuration
        or
Microsoft cloud service condition
```

### Troubleshooting Flow

```text
User reports a cloud-service problem
            ↓
Administrator checks Service health
            ↓
Active incident or advisory reviewed
            ↓
Local troubleshooting begins only if required
```

### Key Lesson

```text
Check Microsoft service health
before making unnecessary
local configuration changes.
```

---

## Step 9 — Review Microsoft 365 Message Center

The Message Center was opened through:

```text
Microsoft 365 admin center
        ↓
Health
        ↓
Message center
```

<p align="center">
  <img src="Evidence/Screenshots/09-Microsoft-365-Message-Center.png" width="850" alt="Microsoft 365 Message Center">
</p>

### Message Center Purpose

Message Center provides information about:

- New Microsoft 365 features
- Planned service changes
- Product retirements
- Required administrator actions
- Planned maintenance
- Security and compliance updates
- Service-specific announcements

### Change-Management Flow

```text
Microsoft publishes an announcement
            ↓
Administrator reviews the impact
            ↓
Required action is identified
            ↓
Documentation is updated
            ↓
Users are prepared for the change
```

### Key Lesson

```text
Message Center supports
proactive administration
instead of reactive troubleshooting.
```

---

## Step 10 — Review User Administration

A user account was opened from the Active users page.

<p align="center">
  <img src="Evidence/Screenshots/10-Microsoft-365-User-Administration-Review.png" width="850" alt="Microsoft 365 user administration review">
</p>

### Properties Reviewed

```text
Account status
Sign-in status
Licence status
Administrative roles
Group membership
General user information
```

### User Administration Model

```text
User object selected
        ↓
Account state reviewed
        ↓
Sign-in state reviewed
        ↓
Licence state reviewed
        ↓
Roles and groups reviewed
        ↓
Findings documented
```

No user account was deleted.

### Common Administrative Actions

The Microsoft 365 admin center may allow an administrator to:

- Reset a password
- Block sign-in
- Review licences
- Review roles
- Review group membership
- Update contact information
- Delete or restore a user
- Review synchronization state

### Key Lesson

```text
User administration should include
identity, access, licence,
role, and group review.
```

---

# Microsoft Graph PowerShell

Microsoft Graph PowerShell was used to retrieve tenant information directly from Microsoft Graph.

The objective was to demonstrate repeatable reporting instead of relying only on manual portal review.

The reporting workflow was:

```text
Install Microsoft Graph
        ↓
Connect using delegated permissions
        ↓
Verify connection context
        ↓
Retrieve organisation information
        ↓
Retrieve users
        ↓
Retrieve groups
        ↓
Retrieve licences
        ↓
Retrieve domains
        ↓
Retrieve administrative roles
        ↓
Disconnect the session
```

---

## Step 11 — Install Microsoft Graph PowerShell

The initial attempt to use `Connect-MgGraph` returned an error indicating that the command was not recognized.

This meant the Microsoft Graph PowerShell module was not installed.

The module was installed with:

```powershell
Install-Module Microsoft.Graph -Scope CurrentUser
```

### Command Meaning

```text
Install-Module
= Downloads and installs a PowerShell module

Microsoft.Graph
= Microsoft Graph PowerShell SDK

-Scope CurrentUser
= Installs the module only for the current Windows user
```

### Installation Prompts

PowerShell requested approval for:

- NuGet provider installation
- PowerShell Gallery repository access

The required prompts were approved.

### Result

```text
Microsoft Graph PowerShell module: Installed
Installation scope: Current user
```

---

## Step 12 — Connect to Microsoft Graph

The following command created a delegated Microsoft Graph session:

```powershell
Connect-MgGraph `
    -Scopes "Organization.Read.All","User.Read.All","Group.Read.All","Directory.Read.All" `
    -UseDeviceCode `
    -ContextScope Process
```

### Permission Scopes

| Scope | Purpose |
|---|---|
| `Organization.Read.All` | Read tenant organisation information |
| `User.Read.All` | Read user objects |
| `Group.Read.All` | Read group objects |
| `Directory.Read.All` | Read directory configuration and roles |

### Authentication Options

```text
-UseDeviceCode
= Uses browser-based device-code authentication

-ContextScope Process
= Limits the Graph context to the current PowerShell process
```

### Security Benefit

The requested scopes were read-only.

No Graph write permission was requested.

```text
Administrative reporting task
            ↓
Read-only scopes requested
            ↓
No directory changes permitted
```

---

## Step 13 — Verify the Microsoft Graph Context

The following command reviewed the active connection:

```powershell
Get-MgContext |
Select-Object Account, TenantId, AuthType, ContextScope, Scopes
```

### Properties

| Property | Meaning |
|---|---|
| `Account` | Signed-in administrator |
| `TenantId` | Microsoft Entra tenant identifier |
| `AuthType` | Authentication type |
| `ContextScope` | Lifetime of the PowerShell context |
| `Scopes` | Granted Microsoft Graph permissions |

### Expected Result

```text
AuthType: Delegated
ContextScope: Process
```

Sensitive account and tenant information was not published.

---

## Step 14 — Retrieve the Microsoft 365 Tenant Summary

The following command retrieved organisation information:

```powershell
Get-MgOrganization |
Select-Object DisplayName, CountryLetterCode, PreferredLanguage
```

<p align="center">
  <img src="Evidence/Screenshots/11-Microsoft-Graph-Tenant-Summary.png" width="850" alt="Microsoft Graph tenant summary">
</p>

### Properties Retrieved

```text
DisplayName
CountryLetterCode
PreferredLanguage
```

### Result

Microsoft Graph successfully returned the Microsoft 365 organisation profile.

The organisation display name was hidden if it contained personally identifying information.

### Key Lesson

```text
Microsoft Graph can retrieve
tenant information without
manual portal navigation.
```

---

## Step 15 — Retrieve the Microsoft 365 User Inventory

The following command retrieved all tenant users:

```powershell
Get-MgUser -All |
Select-Object DisplayName, UserPrincipalName, AccountEnabled, UserType |
Sort-Object DisplayName
```

<p align="center">
  <img src="Evidence/Screenshots/12-Microsoft-Graph-User-Inventory.png" width="850" alt="Microsoft Graph user inventory">
</p>

### Command Meaning

```text
Get-MgUser
= Retrieves Microsoft Entra user objects

-All
= Returns all available users

Select-Object
= Displays selected properties

Sort-Object DisplayName
= Sorts users alphabetically
```

### Properties Retrieved

| Property | Meaning |
|---|---|
| `DisplayName` | User's visible name |
| `UserPrincipalName` | Cloud sign-in name |
| `AccountEnabled` | Whether sign-in is enabled |
| `UserType` | Member or guest |

### Security Review

Full user principal names and the real tenant domain were hidden.

### Key Lesson

```text
Microsoft Graph provides
repeatable user inventory reporting.
```

---

## Step 16 — Retrieve the Microsoft 365 Group Inventory

The following command retrieved all tenant groups:

```powershell
Get-MgGroup -All |
Select-Object DisplayName, SecurityEnabled, MailEnabled, GroupTypes |
Sort-Object DisplayName
```

<p align="center">
  <img src="Evidence/Screenshots/13-Microsoft-Graph-Group-Inventory.png" width="850" alt="Microsoft Graph group inventory">
</p>

### Properties Retrieved

| Property | Meaning |
|---|---|
| `DisplayName` | Group name |
| `SecurityEnabled` | Whether the group can control access |
| `MailEnabled` | Whether the group has email capability |
| `GroupTypes` | Microsoft 365 or dynamic group classification |

### Observed Group Properties

The departmental groups returned values similar to:

```text
SecurityEnabled: True
MailEnabled: False
GroupTypes: Blank
```

### Interpretation

This combination means:

```text
Standard assigned security group
Non-mail-enabled
Not a Microsoft 365 Unified group
Not a dynamic-membership group
```

### Other Group-Type Examples

```text
GroupTypes: Unified
```

This identifies a Microsoft 365 group.

```text
GroupTypes: DynamicMembership
```

This identifies a dynamic-membership group.

### Key Lesson

```text
SecurityEnabled
+
MailEnabled
+
GroupTypes
=
Group classification
```

---

## Step 17 — Retrieve the Microsoft 365 Licence Inventory

The following command queried subscribed licence products:

```powershell
Get-MgSubscribedSku |
Select-Object SkuPartNumber, ConsumedUnits,
@{Name="EnabledUnits";Expression={$_.PrepaidUnits.Enabled}},
@{Name="AvailableUnits";Expression={$_.PrepaidUnits.Enabled - $_.ConsumedUnits}}
```

<p align="center">
  <img src="Evidence/Screenshots/14-Microsoft-Graph-Licence-Inventory.png" width="850" alt="Microsoft Graph licence inventory">
</p>

### Properties

| Property | Meaning |
|---|---|
| `SkuPartNumber` | Microsoft product licence code |
| `ConsumedUnits` | Number of assigned licences |
| `EnabledUnits` | Number of purchased or activated licences |
| `AvailableUnits` | Number of unused licences |

### Result

```text
No subscribed licence SKU output returned
```

This was a valid administrative result.

The command completed without an error and confirmed that the tenant had no Microsoft 365 product subscription.

### Important Interpretation

```text
No output
does not always mean
the command failed.
```

In this case:

```text
No rows returned
        ↓
No subscribed SKUs found
        ↓
Tenant licence limitation confirmed
```

### Key Lesson

```text
Empty command output
can be a valid finding.
```

---

## Step 18 — Retrieve the Microsoft 365 Domain Inventory

The following command retrieved the tenant domains:

```powershell
Get-MgDomain |
Select-Object Id, IsDefault, IsInitial, IsVerified, AuthenticationType |
Sort-Object Id
```

<p align="center">
  <img src="Evidence/Screenshots/15-Microsoft-Graph-Domain-Inventory.png" width="850" alt="Microsoft Graph domain inventory">
</p>

### Properties

| Property | Meaning |
|---|---|
| `Id` | Domain name |
| `IsDefault` | Whether the domain is the default |
| `IsInitial` | Whether the domain is the original tenant domain |
| `IsVerified` | Whether Microsoft verified the domain |
| `AuthenticationType` | Managed or federated authentication |

### Expected State

```text
IsDefault: True
IsInitial: True
IsVerified: True
AuthenticationType: Managed
```

### Managed Authentication

Managed authentication means that Microsoft Entra ID handles the cloud authentication request.

```text
User sign-in
      ↓
Microsoft Entra ID
      ↓
Credential validation
      ↓
Access decision
```

The real domain value was hidden.

---

## Step 19 — Retrieve Active Administrative Roles

The following command retrieved active directory roles:

```powershell
Get-MgDirectoryRole |
Select-Object DisplayName, Description |
Sort-Object DisplayName
```

<p align="center">
  <img src="Evidence/Screenshots/16-Microsoft-Graph-Administrative-Roles.png" width="850" alt="Microsoft Graph administrative roles">
</p>

### Command Meaning

```text
Get-MgDirectoryRole
= Retrieves directory roles currently activated in the tenant
```

### Properties

```text
DisplayName
Description
```

No role-member names, email addresses, object IDs, or tenant identifiers were published.

### Key Lesson

```text
Microsoft Graph can support
role inventory and
administrative-access review.
```

---

## Step 20 — Disconnect from Microsoft Graph

The Microsoft Graph session was closed with:

```powershell
Disconnect-MgGraph
```

<p align="center">
  <img src="Evidence/Screenshots/17-Microsoft-Graph-Session-Disconnected.png" width="850" alt="Microsoft Graph session disconnected">
</p>

### Security Purpose

```text
Administrative reporting completed
            ↓
Graph session disconnected
            ↓
Delegated context removed
            ↓
Unused access no longer retained
```

### Result

```text
Microsoft Graph session: Disconnected
```

### Key Lesson

```text
Administrative sessions
should be closed
when work is complete.
```

---

# PowerShell Automation

A PowerShell script file was created:

```text
Scripts\Export-Microsoft365Inventory.ps1
```

The script is intended to automate:

- Microsoft Graph connection
- Graph context validation
- Tenant-summary retrieval
- User-inventory retrieval
- Group-inventory retrieval
- Licence-inventory retrieval
- Domain-inventory retrieval
- Administrative-role retrieval
- Report export
- Error handling
- Graph session disconnection

## Planned Report Files

```text
Reports\Microsoft-365-Tenant-Summary.txt
Reports\Microsoft-365-User-Inventory.csv
Reports\Microsoft-365-Group-Inventory.csv
Reports\Microsoft-365-Licence-Inventory.csv
Reports\Microsoft-365-Domain-Inventory.csv
Reports\Microsoft-365-Administrative-Roles.csv
```

## Automation Flow

```text
Start script
     ↓
Verify Microsoft.Graph module
     ↓
Connect using delegated scopes
     ↓
Retrieve tenant information
     ↓
Retrieve users and groups
     ↓
Retrieve licences and domains
     ↓
Retrieve administrative roles
     ↓
Export reports
     ↓
Disconnect from Microsoft Graph
     ↓
End script
```

---

# Operational Standard Operating Procedure

## Routine Tenant Review

1. Sign in to the Microsoft 365 admin center.
2. Confirm the correct tenant.
3. Review organisation information.
4. Review the current default domain.
5. Review active users.
6. Review user sign-in states.
7. Review licence availability.
8. Review security groups.
9. Review administrative roles.
10. Review service health.
11. Review Message Center.
12. Record findings.
13. Remove sensitive identifiers from public evidence.

---

## User Administration Review

```text
Open Active users
        ↓
Select user
        ↓
Review account state
        ↓
Review sign-in state
        ↓
Review licence state
        ↓
Review roles
        ↓
Review groups
        ↓
Document findings
```

Do not delete or block a user unless the approved administrative request requires it.

---

## Group Review Procedure

```text
Open Active teams and groups
        ↓
Select Security groups
        ↓
Open target group
        ↓
Review general properties
        ↓
Review membership
        ↓
Confirm business purpose
        ↓
Document findings
```

---

## Service-Health Review Procedure

1. Open **Health**.
2. Select **Service health**.
3. Review active incidents and advisories.
4. Identify affected services.
5. Review Microsoft updates.
6. Record the current state.
7. Avoid unnecessary local changes when Microsoft has confirmed a cloud issue.

---

## Message Center Review Procedure

1. Open **Health**.
2. Select **Message center**.
3. Review recent announcements.
4. Identify administrator action requirements.
5. Record important deadlines.
6. Document service changes.
7. Prepare users before the change takes effect.

---

## Microsoft Graph Reporting Procedure

```text
Open PowerShell
      ↓
Install or import Microsoft.Graph
      ↓
Connect with read-only scopes
      ↓
Verify Graph context
      ↓
Retrieve tenant information
      ↓
Retrieve users
      ↓
Retrieve groups
      ↓
Retrieve licences
      ↓
Retrieve domains
      ↓
Retrieve administrative roles
      ↓
Export reports
      ↓
Disconnect the session
```

---

# Troubleshooting Scenarios

| Scenario | Finding | Resolution |
|---|---|---|
| `Connect-MgGraph` was not recognized | Microsoft Graph module was missing | Installed `Microsoft.Graph` |
| NuGet provider was required | PowerShell needed the package provider | Approved NuGet installation |
| PowerShell Gallery warning appeared | Repository installation required approval | Approved PSGallery access |
| No licence rows were returned | Tenant had no subscribed SKUs | Documented valid unlicensed state |
| `MailEnabled` returned `False` | Groups had no email capability | Confirmed expected security-group state |
| `GroupTypes` was blank | Groups were standard assigned groups | Documented normal result |
| Workloads were unavailable | No Microsoft 365 product licence | Marked workloads out of scope |
| Real tenant domain contained personal information | Initial domain used personal naming | Redacted the domain from public evidence |
| Administrator identifiers appeared in output | Graph context displayed account and tenant data | Removed sensitive values from screenshots |

---

# Root-Cause Lessons

## Missing Graph Command

```text
Connect-MgGraph failed
        ↓
Command not recognized
        ↓
Module availability reviewed
        ↓
Microsoft.Graph installed
        ↓
Connection succeeded
```

The lesson:

```text
A PowerShell command requires
the correct module
to be installed and available.
```

---

## Empty Licence Output

```text
Licence query executed
        ↓
No rows returned
        ↓
No PowerShell error occurred
        ↓
No subscribed licence SKUs existed
```

The lesson:

```text
No output can be
a valid administrative finding.
```

---

## Group Property Interpretation

```text
SecurityEnabled: True
MailEnabled: False
GroupTypes: Blank
        ↓
Assigned non-mail-enabled security group
```

The lesson:

```text
Multiple properties must be
evaluated together
to classify a group correctly.
```

---

## Licence Limitation

```text
User identities exist
        ↓
Tenant administration works
        ↓
No product licence
        ↓
Product workloads unavailable
```

The lesson:

```text
Identity presence
does not guarantee
service entitlement.
```

---

# Security Controls Applied

## Least Privilege

- Read-only Microsoft Graph scopes were requested
- No Graph write permissions were requested
- No administrative roles were changed
- No user was deleted
- No group membership was changed
- The Graph context was limited to the current process

## Credential Protection

- Passwords were not recorded
- Device codes were not published
- Tenant IDs were not published
- Administrator email addresses were hidden
- User principal names were hidden
- No client secret was created
- No certificate private key was stored

## Session Security

- `ContextScope Process` limited the Graph session
- Delegated authentication was used
- The Graph session was disconnected after reporting
- Sensitive PowerShell output was redacted

## Operational Safety

- Licence limitations were documented honestly
- Unavailable workloads were not reported as failed
- Portal changes were avoided during review
- Group membership was reviewed without modification
- Administrative roles were reviewed without reassignment

---

# Public Redaction Rules

The following values must be hidden before publication:

```text
Real tenant domain
Tenant ID
Administrator email
User principal name
Sold-to address
Technical contact
Object ID
Group ID
Role-member identity
Device code
Authentication token
Public IP address
Subscription ID
Billing information
Support case information
```

Use placeholders such as:

```text
yourtenant.onmicrosoft.com
<tenant-id-redacted>
<admin-email-redacted>
<user-upn-redacted>
<address-redacted>
<object-id-redacted>
```

The following internal lab values may be included:

```text
homelab.local
SRV01
SYNC02
Private RFC 1918 addresses
Fictitious test-user names
Cloud security-group names
```

---

# Evidence Index

## Microsoft 365 Administration

| Screenshot | Purpose |
|---|---|
| [`01-Microsoft-365-Organization-Information.png`](Evidence/Screenshots/01-Microsoft-365-Organization-Information.png) | Documents tenant organisation settings |
| [`02-Microsoft-365-Active-Users-and-Licences.png`](Evidence/Screenshots/02-Microsoft-365-Active-Users-and-Licences.png) | Documents active users and licence state |
| [`03-Microsoft-365-Current-Domain-State.png`](Evidence/Screenshots/03-Microsoft-365-Current-Domain-State.png) | Documents the current default domain |
| [`04-Microsoft-365-Active-Groups.png`](Evidence/Screenshots/04-Microsoft-365-Active-Groups.png) | Documents active security groups |
| [`05-SG-Cloud-IT-General-Details.png`](Evidence/Screenshots/05-SG-Cloud-IT-General-Details.png) | Documents general group properties |
| [`06-SG-Cloud-IT-Members.png`](Evidence/Screenshots/06-SG-Cloud-IT-Members.png) | Documents group membership |
| [`07-Microsoft-365-Administrative-Roles.png`](Evidence/Screenshots/07-Microsoft-365-Administrative-Roles.png) | Documents available administrative roles |
| [`08-Microsoft-365-Service-Health.png`](Evidence/Screenshots/08-Microsoft-365-Service-Health.png) | Documents service health and advisory state |
| [`09-Microsoft-365-Message-Center.png`](Evidence/Screenshots/09-Microsoft-365-Message-Center.png) | Documents Microsoft service announcements |
| [`10-Microsoft-365-User-Administration-Review.png`](Evidence/Screenshots/10-Microsoft-365-User-Administration-Review.png) | Documents user-administration review |

## Microsoft Graph PowerShell

| Screenshot | Purpose |
|---|---|
| [`11-Microsoft-Graph-Tenant-Summary.png`](Evidence/Screenshots/11-Microsoft-Graph-Tenant-Summary.png) | Documents Graph tenant reporting |
| [`12-Microsoft-Graph-User-Inventory.png`](Evidence/Screenshots/12-Microsoft-Graph-User-Inventory.png) | Documents Graph user inventory |
| [`13-Microsoft-Graph-Group-Inventory.png`](Evidence/Screenshots/13-Microsoft-Graph-Group-Inventory.png) | Documents Graph group inventory |
| [`14-Microsoft-Graph-Licence-Inventory.png`](Evidence/Screenshots/14-Microsoft-Graph-Licence-Inventory.png) | Confirms that no subscribed licence SKU was available |
| [`15-Microsoft-Graph-Domain-Inventory.png`](Evidence/Screenshots/15-Microsoft-Graph-Domain-Inventory.png) | Documents domain properties |
| [`16-Microsoft-Graph-Administrative-Roles.png`](Evidence/Screenshots/16-Microsoft-Graph-Administrative-Roles.png) | Documents active directory roles |
| [`17-Microsoft-Graph-Session-Disconnected.png`](Evidence/Screenshots/17-Microsoft-Graph-Session-Disconnected.png) | Confirms the Graph session was closed |

---

# Skills Demonstrated

## Microsoft 365 Administration

- Organisation-profile review
- Active-user review
- Licence-state review
- Domain review
- Security-group review
- Group-membership review
- Administrative-role review
- Service-health monitoring
- Message Center monitoring
- User-account administration

## Microsoft Entra ID

- Cloud-only identity recognition
- Synchronized identity recognition
- Group-property interpretation
- Administrative-role awareness
- Managed-domain review
- Account-state validation

## Microsoft Graph PowerShell

- Module installation
- NuGet provider installation
- PowerShell Gallery approval
- Delegated authentication
- Device-code authentication
- Graph-context review
- Organisation inventory
- User inventory
- Group inventory
- Licence inventory
- Domain inventory
- Administrative-role inventory
- Session disconnection

## Security and Operations

- Least-privilege access
- Sensitive-data redaction
- Licence-limitation documentation
- Service-health analysis
- Change-management awareness
- Session cleanup
- Operational SOP creation
- Evidence collection
- Portfolio documentation

---

# Interview Preparation

## What is the Microsoft 365 admin center?

The Microsoft 365 admin center is the main web portal used to manage tenant settings, users, groups, licences, domains, roles, service health, and service announcements.

## Can a user exist without a Microsoft 365 licence?

Yes.

The identity can exist in Microsoft Entra ID and appear in the Microsoft 365 admin center without having a Microsoft 365 product licence.

## What can an unlicensed user access?

An unlicensed user can exist as an identity but cannot use licence-dependent Microsoft 365 workloads such as Exchange Online, OneDrive, SharePoint Online, and licensed Microsoft Teams features.

## What is the difference between Microsoft Entra ID and Microsoft 365?

```text
Microsoft Entra ID
= Identity and access management

Microsoft 365
= Productivity services and tenant administration
```

## What is Microsoft 365 Service health?

Service health displays Microsoft-reported incidents and advisories affecting tenant services.

## What is Message Center?

Message Center provides announcements about new features, planned changes, retirements, maintenance, and required administrator actions.

## Why check Service health before troubleshooting?

It helps determine whether the issue is caused by a Microsoft cloud incident instead of a local configuration problem.

## Why use Microsoft Graph PowerShell?

Microsoft Graph PowerShell allows administrators to automate reporting, validation, inventory, and directory administration.

## Why were delegated read permissions used?

Delegated read permissions allowed tenant information to be retrieved using the signed-in administrator without requesting write permissions.

## What does `ContextScope Process` mean?

It limits the Microsoft Graph authentication context to the current PowerShell process.

## What does `SecurityEnabled: True` mean?

The group can be used for access control.

## What does `MailEnabled: False` mean?

The group does not have email capability.

## What does a blank `GroupTypes` value mean?

When combined with `SecurityEnabled: True` and `MailEnabled: False`, it indicates a standard assigned security group.

## Why did the licence query return no output?

The tenant had no subscribed Microsoft 365 licence SKUs.

## Is empty output always an error?

No.

When a command completes without an error, empty output may mean no matching objects exist.

## Why disconnect from Microsoft Graph?

Disconnecting closes the delegated session and removes the active context from the current PowerShell process.

## Why should Global Administrator not be used for every task?

Using narrower roles reduces unnecessary privilege and limits the effect of account compromise or administrative error.

---

# Validation Results

| Validation Area | Result |
|---|:---:|
| Organisation information reviewed | ✅ |
| Active users reviewed | ✅ |
| Cloud-only users visible | ✅ |
| Synchronized users visible | ✅ |
| Licence state reviewed | ✅ |
| Current domain reviewed | ✅ |
| Security groups reviewed | ✅ |
| Group properties reviewed | ✅ |
| Group membership reviewed | ✅ |
| Administrative roles reviewed | ✅ |
| Service health reviewed | ✅ |
| Message Center reviewed | ✅ |
| User administration reviewed | ✅ |
| Microsoft Graph installed | ✅ |
| Delegated Graph connection established | ✅ |
| Graph context verified | ✅ |
| Tenant summary retrieved | ✅ |
| User inventory retrieved | ✅ |
| Group inventory retrieved | ✅ |
| Licence inventory retrieved | ✅ |
| Domain inventory retrieved | ✅ |
| Administrative roles retrieved | ✅ |
| Graph session disconnected | ✅ |
| Licence-dependent workloads | Out of scope |
| Final status | `PASSED WITH DOCUMENTED LICENCE LIMITATION` |

---

# What I Learned

I learned that Microsoft 365 administration includes more than mailbox and Microsoft Teams management.

A Microsoft 365 administrator must understand:

```text
Tenant configuration
Identity
Groups
Roles
Domains
Licences
Service health
Announcements
Automation
Security
Documentation
```

I learned that a user identity may exist without a Microsoft 365 product licence.

```text
Identity exists
does not mean
service is licensed.
```

I learned that tenant administration can still be reviewed and documented even when product workloads are unavailable.

I learned that Microsoft Graph provides repeatable reporting through PowerShell.

```text
Manual portal review
        +
Automated Graph reporting
        =
Stronger validation
```

I learned that empty output can represent a valid finding.

```text
No rows returned
can confirm
no matching objects exist.
```

I learned that Microsoft Entra group properties must be interpreted together.

```text
SecurityEnabled
+
MailEnabled
+
GroupTypes
=
Group classification
```

I learned that Service health should be checked before assuming a local issue.

```text
User reports a problem
        ↓
Check Service health
        ↓
Review active advisory
        ↓
Then investigate locally
```

I learned that Message Center supports proactive change management.

```text
Review the change
before
the change affects users.
```

The most important lessons were:

```text
Document limitations honestly.
```

```text
Do not report unavailable licensed services as failed.
```

```text
Use least-privilege permissions.
```

```text
Protect tenant identifiers.
```

```text
Close administrative sessions.
```

```text
Combine portal review with automated reporting.
```

---

# Future Improvements

Future work may include:

- Add a cleaner `onmicrosoft.com` fallback domain
- Add a verified custom domain
- Activate a Microsoft 365 Business licence
- Assign licences to test users
- Configure Exchange Online mailboxes
- Create shared mailboxes
- Test internal mail flow
- Configure Microsoft Teams
- Create SharePoint Online sites
- Validate OneDrive provisioning
- Configure group-based licensing
- Review the Exchange admin center
- Review the Teams admin center
- Review the SharePoint admin center
- Configure external sharing
- Configure retention settings
- Configure Microsoft Purview
- Automate licence reporting
- Automate service-health reporting
- Automate Message Center summaries
- Create an unlicensed-user report
- Create a disabled-user report
- Create a stale-account report
- Create a licence-utilisation dashboard
- Create scheduled Microsoft Graph reports
- Add error handling to the inventory script

---

# Next Module

## MFA and Conditional Access

The next module may focus on:

```text
Authentication methods
        ↓
Multifactor authentication
        ↓
Security defaults
        ↓
Conditional Access concepts
        ↓
Policy planning
        ↓
Named locations
        ↓
Emergency-access accounts
        ↓
Sign-in validation
        ↓
Operational documentation
```

Some Conditional Access features may require Microsoft Entra ID Premium licensing.

Any unavailable licensed feature should be documented honestly as a design, planning, or readiness exercise instead of a completed deployment.

---

<div align="center">

## Module Status

<img src="https://img.shields.io/badge/Microsoft%20365%20Administration-Completed-2EA44F?style=for-the-badge&logo=microsoft365&logoColor=white" alt="Microsoft 365 Administration completed">

<br><br>

### Tenant administration, identity review, domain review, service monitoring, Microsoft Graph reporting, and operational documentation successfully validated.

### Licence-dependent workloads were documented as out of scope.

<br>

<a href="../../">
  <img src="https://img.shields.io/badge/Return%20to%20IT%20Operations%20Homelab-181717?style=for-the-badge&logo=github&logoColor=white" alt="Return to IT Operations Homelab">
</a>

<a href="../04-MFA-and-Conditional-Access">
  <img src="https://img.shields.io/badge/Next%20Module-MFA%20and%20Conditional%20Access-0078D4?style=for-the-badge&logo=microsoftazure&logoColor=white" alt="Next module MFA and Conditional Access">
</a>

<br><br>

<img src="https://capsule-render.vercel.app/api?type=waving&color=0:0A66C2,50:0078D4,100:00A4EF&height=120&section=footer" width="100%" alt="Footer">

</div>