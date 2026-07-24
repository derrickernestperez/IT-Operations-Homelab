<div align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&color=gradient&customColorList=0,2&height=250&section=header&text=DHCP%20Infrastructure&fontSize=50&fontAlignY=35&desc=Core%20Infrastructure%20%7C%20Automated%20IP%20Address%20Assignment%20and%20Client%20Configuration&descSize=17&descAlignY=55" alt="DHCP Infrastructure Banner" width="100%">
</div>

---

# Overview

This module documents the deployment and configuration of the **Dynamic Host Configuration Protocol** service in the `homelab.local` environment.

The objective was to configure SRV01 to automatically provide network settings to domain clients.

The implementation included:

- Installing the DHCP Server role
- Completing post-installation configuration
- Opening the DHCP management console
- Creating an IPv4 scope
- Defining the client address range
- Configuring excluded addresses
- Setting the lease duration
- Configuring scope options
- Assigning the default gateway
- Assigning the internal DNS server
- Activating the DHCP scope
- Renewing CLIENT01's address
- Verifying the client configuration
- Confirming the active DHCP lease

This module also includes a real troubleshooting case involving:

```text
DHCP Event ID 1046
```

The event indicated that the DHCP server was not authorized in Active Directory and had stopped servicing clients.

---

# Why I Built This Module

Before configuring DHCP, network settings could be entered manually on every client.

That approach may work for a very small lab, but it becomes difficult to maintain as more devices are added.

Manual network configuration can lead to:

- Duplicate IP addresses
- Incorrect subnet masks
- Incorrect gateways
- Incorrect DNS servers
- Inconsistent client settings
- Longer workstation deployment time
- More Help Desk incidents

I wanted to understand how organizations automatically provide network settings to client devices while keeping important infrastructure addresses reserved.

The most important lesson was that DHCP provides more than an IP address.

A complete DHCP lease may include:

```text
IPv4 Address
+
Subnet Mask
+
Default Gateway
+
DNS Server
+
Lease Duration
```

I also learned that installing the DHCP role is not enough in an Active Directory domain.

The DHCP server must be authorized before it can service clients.

---

# Business Scenario

The organization is adding more Windows workstations to the `homelab.local` environment.

Manually configuring every workstation is no longer efficient.

The Infrastructure Team must deploy a DHCP service that can automatically provide:

- IPv4 addresses
- Subnet masks
- Default gateway information
- Internal DNS server information
- Lease duration

The DHCP scope must also protect infrastructure addresses from being assigned to clients.

The following systems require stable addresses:

- Domain controller
- DNS server
- DHCP server
- File server
- Printers
- Network devices
- Future infrastructure systems

SRV01 will provide DHCP services to clients on the VMware NAT lab network.

---

# Learning Objectives

By completing this module, I practiced the following:

- Installing the DHCP Server role
- Completing DHCP post-installation configuration
- Opening DHCP Manager
- Understanding DHCP authorization
- Creating an IPv4 scope
- Configuring an address pool
- Configuring excluded addresses
- Setting a lease duration
- Configuring scope options
- Assigning a default gateway
- Assigning the internal DNS server
- Activating a DHCP scope
- Releasing and renewing a client lease
- Verifying client configuration
- Reviewing active DHCP leases
- Troubleshooting DHCP authorization failures
- Distinguishing DHCP problems from DNS problems
- Documenting infrastructure validation

---

# Key Concepts Learned

## DHCP

Dynamic Host Configuration Protocol automatically provides network configuration to clients.

Without DHCP, an administrator may need to configure every device manually.

DHCP can provide:

- IPv4 address
- Subnet mask
- Default gateway
- DNS server
- DNS domain name
- Lease duration
- Additional network options

---

## DHCP Scope

A DHCP scope defines the range of addresses available for a particular network.

Example:

```text
Network: 192.168.241.0/24
```

A scope may include:

- Start address
- End address
- Subnet mask
- Exclusions
- Lease duration
- Scope options
- Reservations
- Active leases

---

## Address Pool

The address pool is the range of IPv4 addresses that DHCP may assign to clients.

Example:

```text
192.168.241.100
through
192.168.241.200
```

The actual values should match the environment shown in the DHCP scope configuration.

---

## Exclusion Range

An exclusion range prevents DHCP from assigning selected addresses.

Excluded addresses may be used by:

- Domain controllers
- DNS servers
- DHCP servers
- File servers
- Printers
- Routers
- Network appliances

Example:

```text
192.168.241.1
through
192.168.241.99
```

This protects statically configured infrastructure systems from accidental address conflicts.

---

## DHCP Lease

A DHCP lease is the temporary assignment of an IP address to a client.

A lease contains:

- Assigned address
- Lease start time
- Lease expiration time
- Client identifier
- Hostname
- Scope information

Clients attempt to renew their lease before it expires.

---

## Lease Duration

Lease duration controls how long a client may use an assigned address.

Shorter leases may be useful for networks with frequent device changes.

Longer leases may be appropriate for stable workstation environments.

The correct value depends on:

- Number of available addresses
- Number of clients
- Device turnover
- Network design
- Business requirements

---

## DHCP Options

DHCP options provide additional network settings.

Common options include:

```text
003 Router
006 DNS Servers
015 DNS Domain Name
```

In this lab:

- The router option provides the default gateway
- The DNS option directs clients to SRV01
- The domain name option supports `homelab.local`

---

## DHCP Authorization

In an Active Directory domain, a DHCP server must be authorized before it can service clients.

Authorization prevents unauthorized DHCP servers from distributing incorrect network settings.

An unauthorized server may stop servicing clients and log:

```text
Event ID 1046
```

---

## DHCP Lease Process

The DHCP lease process is commonly described as:

```text
DORA
```

Meaning:

```text
Discover
Offer
Request
Acknowledge
```

### Discover

The client broadcasts a request for DHCP service.

### Offer

The server offers an available address and network configuration.

### Request

The client requests the offered address.

### Acknowledge

The server confirms the lease.

---

## DHCP Reservation

A reservation assigns a consistent address to a device based on its MAC address.

Reservations are useful for systems that should use DHCP but need a predictable address.

Examples include:

- Printers
- Scanners
- Access points
- Lab appliances

---

# Lab Environment Specifications

| Component | Configuration |
|------------|---------------|
| DHCP Server | SRV01 |
| Server Operating System | Windows Server 2025 Standard Evaluation |
| Active Directory Domain | homelab.local |
| Domain Controller IP | 192.168.241.10 |
| Client | CLIENT01 |
| Network Type | VMware NAT |
| DHCP Protocol | IPv4 |
| DNS Server Delivered to Clients | 192.168.241.10 |
| Management Tool | DHCP Manager |
| Verification Tools | `ipconfig`, DHCP Manager, PowerShell |
| Authorization | Active Directory authorization required |

---

# Folder Structure

```text
02-Core-Infrastructure
│
└── 02-DHCP-Infrastructure
    │
    ├── README.md
    │
    └── Evidence
        └── Screenshots
            ├── 01-Open-Add-Roles-and-Features.png
            ├── 02-Select-DHCP-Server-Role.png
            ├── 03-DHCP-Installation-Complete.png
            ├── 04-Complete-DHCP-Configuration-Wizard.png
            ├── 05-DHCP-Manager-Console.png
            ├── 06-New-Scope-Wizard.png
            ├── 07-Scope-IP-Range-Configuration.png
            ├── 08-Exclusion-Range-Configuration.png
            ├── 09-Lease-Duration-Configuration.png
            ├── 10-DHCP-Options-Configuration.png
            ├── 11-Gateway-Configuration.png
            ├── 12-DNS-Server-Configuration.png
            ├── 13-Scope-Activated.png
            ├── 14-DHCP-Scope-Summary.png
            ├── 15-Client-IP-Renewal.png
            ├── 16-IPConfig-Verification.png
            ├── 17-DHCP-Lease-Verification.png
            └── 18-Final-DHCP-Configuration.png
```

---

# Step-by-Step Implementation

---

## Step 1 — Open Add Roles and Features

Opened Server Manager and selected:

```text
Manage
    ↓
Add Roles and Features
```

The wizard is used to install Windows Server roles and management tools.

<p align="center">
  <img src="Evidence/Screenshots/01-Open-Add-Roles-and-Features.png" width="800" alt="Open Add Roles and Features Wizard">
</p>

---

## Step 2 — Select the DHCP Server Role

Selected:

```text
DHCP Server
```

The required management tools and supporting features were included.

Installing the role adds the DHCP service, but the server still requires post-installation configuration and Active Directory authorization.

<p align="center">
  <img src="Evidence/Screenshots/02-Select-DHCP-Server-Role.png" width="800" alt="Select DHCP Server Role">
</p>

---

## Step 3 — Complete the DHCP Role Installation

Completed the role installation and confirmed that the DHCP Server role was installed successfully.

At this stage, the service components were available, but the server still needed authorization and scope configuration.

<p align="center">
  <img src="Evidence/Screenshots/03-DHCP-Installation-Complete.png" width="800" alt="DHCP Server Installation Complete">
</p>

---

## Step 4 — Complete DHCP Post-Installation Configuration

Opened the DHCP post-installation configuration wizard.

This step is used to:

- Create required DHCP security groups
- Authorize the server in Active Directory
- Complete domain-related configuration

The authorization process is important because an unauthorized DHCP server should not distribute network settings in a domain environment.

<p align="center">
  <img src="Evidence/Screenshots/04-Complete-DHCP-Configuration-Wizard.png" width="800" alt="Complete DHCP Configuration Wizard">
</p>

---

## Step 5 — Open the DHCP Manager Console

Opened:

```text
Server Manager
      ↓
Tools
      ↓
DHCP
```

The DHCP Manager console provides access to:

- IPv4 and IPv6 scopes
- Address pools
- Exclusions
- Reservations
- Scope options
- Active leases
- Server options
- Policies
- Filters

<p align="center">
  <img src="Evidence/Screenshots/05-DHCP-Manager-Console.png" width="800" alt="DHCP Manager Console">
</p>

---

## Step 6 — Start the New Scope Wizard

Right-clicked IPv4 and selected:

```text
New Scope
```

The New Scope Wizard defines the range of addresses and network options that DHCP will provide to clients.

<p align="center">
  <img src="Evidence/Screenshots/06-New-Scope-Wizard.png" width="800" alt="New DHCP Scope Wizard">
</p>

---

## Step 7 — Configure the Scope IP Range

Configured the starting and ending IPv4 addresses for the client pool.

The address range was selected from the VMware NAT lab network.

The scope range should:

- Match the correct subnet
- Avoid infrastructure addresses
- Provide enough addresses for clients
- Avoid overlapping another DHCP server
- Match the configured subnet mask

<p align="center">
  <img src="Evidence/Screenshots/07-Scope-IP-Range-Configuration.png" width="800" alt="DHCP Scope IP Range Configuration">
</p>

---

## Step 8 — Configure the Exclusion Range

Configured excluded addresses that DHCP should not assign.

These addresses are reserved for systems using static configuration or separate reservations.

Examples include:

- SRV01
- Gateway
- Future servers
- Printers
- Network appliances

Exclusions reduce the risk of duplicate IP conflicts.

<p align="center">
  <img src="Evidence/Screenshots/08-Exclusion-Range-Configuration.png" width="800" alt="DHCP Exclusion Range Configuration">
</p>

---

## Step 9 — Configure the Lease Duration

Configured the DHCP lease duration.

The lease duration determines how long a client may use an address before renewal is required.

The selected value was appropriate for a small, stable homelab environment.

<p align="center">
  <img src="Evidence/Screenshots/09-Lease-Duration-Configuration.png" width="800" alt="DHCP Lease Duration Configuration">
</p>

---

## Step 10 — Configure DHCP Scope Options

Selected the option to configure DHCP scope options.

Scope options provide additional information required by clients.

The main settings configured were:

- Default gateway
- DNS server
- DNS domain name

<p align="center">
  <img src="Evidence/Screenshots/10-DHCP-Options-Configuration.png" width="800" alt="DHCP Scope Options Configuration">
</p>

---

## Step 11 — Configure the Default Gateway

Configured the router option.

The default gateway allows clients to communicate with networks outside the local subnet.

The value must match the VMware NAT network gateway.

<p align="center">
  <img src="Evidence/Screenshots/11-Gateway-Configuration.png" width="800" alt="DHCP Default Gateway Configuration">
</p>

---

## Step 12 — Configure the DNS Server

Configured the DNS option to provide:

```text
192.168.241.10
```

This is the address of SRV01.

Domain clients must use the internal Active Directory DNS server so they can locate:

- Domain controllers
- Kerberos
- LDAP
- Group Policy
- Internal resources

Public DNS should not be delivered directly to domain clients as their primary resolver.

<p align="center">
  <img src="Evidence/Screenshots/12-DNS-Server-Configuration.png" width="800" alt="DHCP DNS Server Configuration">
</p>

---

## Step 13 — Activate the DHCP Scope

Activated the new scope.

An inactive scope does not issue addresses even if the role and server are configured correctly.

Activation allowed the server to begin servicing DHCP clients.

<p align="center">
  <img src="Evidence/Screenshots/13-Scope-Activated.png" width="800" alt="DHCP Scope Activated">
</p>

---

## Step 14 — Review the DHCP Scope Summary

Reviewed the completed scope configuration.

The summary confirmed:

- Scope name
- Address range
- Subnet mask
- Excluded addresses
- Lease duration
- Gateway
- DNS server
- Activation status

<p align="center">
  <img src="Evidence/Screenshots/14-DHCP-Scope-Summary.png" width="800" alt="DHCP Scope Summary">
</p>

---

## Step 15 — Renew the CLIENT01 Address

On CLIENT01, released and renewed the DHCP lease.

Commands:

```cmd
ipconfig /release
```

```cmd
ipconfig /renew
```

This forced the client to request a new configuration from the DHCP server.

<p align="center">
  <img src="Evidence/Screenshots/15-Client-IP-Renewal.png" width="800" alt="CLIENT01 DHCP IP Renewal">
</p>

---

## Step 16 — Verify the Client IP Configuration

Ran:

```cmd
ipconfig /all
```

Verified that CLIENT01 received:

- IPv4 address from the configured scope
- Correct subnet mask
- Correct default gateway
- SRV01 as DNS server
- DHCP enabled
- DHCP server information
- Lease start and expiration time

<p align="center">
  <img src="Evidence/Screenshots/16-IPConfig-Verification.png" width="800" alt="CLIENT01 IPConfig Verification">
</p>

---

## Step 17 — Verify the DHCP Lease

Opened DHCP Manager and reviewed:

```text
Address Leases
```

Confirmed that CLIENT01 appeared with:

- Assigned IP address
- Client name
- Lease expiration
- Client identifier
- Active lease status

This validated that SRV01 issued the lease.

<p align="center">
  <img src="Evidence/Screenshots/17-DHCP-Lease-Verification.png" width="800" alt="DHCP Lease Verification">
</p>

---

## Step 18 — Review the Final DHCP Configuration

Reviewed the completed DHCP configuration.

The final environment included:

- Installed DHCP Server role
- Completed post-installation configuration
- Authorized DHCP service
- Active IPv4 scope
- Configured address pool
- Excluded infrastructure addresses
- Lease duration
- Gateway option
- Internal DNS option
- Active CLIENT01 lease

<p align="center">
  <img src="Evidence/Screenshots/18-Final-DHCP-Configuration.png" width="800" alt="Final DHCP Configuration">
</p>

---

# DHCP Client Workflow

```text
CLIENT01 Starts
      │
      ▼
DHCP Discover
      │
      ▼
SRV01 Sends Offer
      │
      ▼
CLIENT01 Sends Request
      │
      ▼
SRV01 Sends Acknowledgment
      │
      ▼
CLIENT01 Receives:
      ├── IPv4 Address
      ├── Subnet Mask
      ├── Default Gateway
      ├── DNS Server
      └── Lease Duration
```

---

# DHCP and DNS Relationship

```text
DHCP
  │
  └── Gives CLIENT01:
          ├── IP address
          ├── Gateway
          └── DNS server = SRV01
                        │
                        ▼
                CLIENT01 queries DNS
                        │
                        ▼
               homelab.local resolves
```

DHCP provides the DNS server address.

DNS performs name resolution.

They are different services, but both must be configured correctly.

---

# Real Troubleshooting Case — DHCP Event ID 1046

During the lab, the DHCP service reported:

```text
The DHCP/BINL service on the local machine,
belonging to the Windows Administrative domain homelab.local,
has determined that it is not authorized to start.
It has stopped servicing clients.
```

This corresponds to:

```text
Event ID 1046
```

The message means the DHCP server did not consider itself authorized in Active Directory.

As a result, it stopped servicing clients.

---

## Why DHCP Authorization Exists

Authorization prevents a rogue or accidental DHCP server from distributing incorrect settings.

An unauthorized DHCP server could provide:

- Wrong gateway
- Wrong DNS server
- Wrong IP range
- Attacker-controlled DNS
- Conflicting addresses

In a domain, DHCP servers should be explicitly approved.

---

## Step-by-Step Fix for Event ID 1046

### Step 1 — Confirm the server is domain joined

```powershell
Get-CimInstance Win32_ComputerSystem |
Select-Object Name, Domain, PartOfDomain
```

Expected:

```text
Name         SRV01
Domain       homelab.local
PartOfDomain True
```

---

### Step 2 — Check the server DNS configuration

```cmd
ipconfig /all
```

SRV01 should use the internal Active Directory DNS configuration.

For a single domain controller lab, SRV01 commonly points to itself for DNS.

Avoid configuring public DNS directly on the server network adapter.

---

### Step 3 — Confirm domain-controller discovery

```cmd
nltest /dsgetdc:homelab.local
```

If this fails, investigate DNS or domain connectivity before DHCP authorization.

---

### Step 4 — Check existing authorized DHCP servers

```powershell
Get-DhcpServerInDC
```

Expected entry:

```text
SRV01.homelab.local
192.168.241.10
```

---

### Step 5 — Authorize SRV01 if missing

```powershell
Add-DhcpServerInDC `
    -DnsName "SRV01.homelab.local" `
    -IPAddress "192.168.241.10"
```

Run this with an authorized domain account.

---

### Step 6 — Refresh the DHCP console

In DHCP Manager:

```text
Right-click server
        ↓
Refresh
```

The server icon should no longer indicate an authorization problem.

---

### Step 7 — Restart the DHCP Server service

```powershell
Restart-Service DHCPServer
```

Verify:

```powershell
Get-Service DHCPServer
```

Expected status:

```text
Running
```

---

### Step 8 — Check the DHCP event log again

Open:

```text
Event Viewer
→ Applications and Services Logs
→ Microsoft
→ Windows
→ DHCP-Server
```

Confirm that no new authorization failure appears.

---

### Step 9 — Renew the client lease

On CLIENT01:

```cmd
ipconfig /release
```

```cmd
ipconfig /renew
```

---

### Step 10 — Verify the full client configuration

```cmd
ipconfig /all
```

Confirm:

- Address came from the DHCP scope
- Correct gateway
- DNS server is SRV01
- DHCP server is SRV01
- Lease information is present

---

# Real-World Troubleshooting Guide

## Scenario 1 — Client Receives No Address

Possible symptom:

```text
169.254.x.x
```

This is an APIPA address.

It usually means the client could not obtain a DHCP lease.

Check:

1. Is the DHCP service running?
2. Is the server authorized?
3. Is the scope active?
4. Are addresses available?
5. Is the client connected to the correct virtual network?
6. Is another DHCP server interfering?
7. Is the firewall blocking DHCP?
8. Is the network adapter configured for automatic addressing?

Commands:

```powershell
Get-Service DHCPServer
```

```powershell
Get-DhcpServerInDC
```

```powershell
Get-DhcpServerv4Scope
```

---

## Scenario 2 — Client Receives an IP but Cannot Resolve Names

Example:

```cmd
ping 192.168.241.10
```

works, but:

```cmd
ping SRV01.homelab.local
```

fails.

This indicates that DHCP assigned an address, but DNS configuration may be wrong.

Check:

```cmd
ipconfig /all
```

Verify that DNS server is:

```text
192.168.241.10
```

Then test:

```cmd
nslookup homelab.local
```

```cmd
nslookup SRV01.homelab.local
```

If IP communication works but hostname communication fails, investigate DNS rather than DHCP address assignment.

---

## Scenario 3 — Client Receives the Wrong DNS Server

Check DHCP option:

```text
006 DNS Servers
```

The option should provide SRV01.

Review with PowerShell:

```powershell
Get-DhcpServerv4OptionValue `
    -ScopeId <ScopeNetworkID>
```

Replace `<ScopeNetworkID>` with the actual network ID.

After correcting the option:

```cmd
ipconfig /release
ipconfig /renew
ipconfig /flushdns
```

---

## Scenario 4 — Client Receives the Wrong Gateway

Check DHCP option:

```text
003 Router
```

An incorrect gateway may allow local communication while preventing external access.

Review scope options and renew the lease after correction.

---

## Scenario 5 — Scope Is Active but No Addresses Are Available

Possible causes:

- Address pool exhausted
- Exclusion range too large
- Stale leases
- Scope range too small
- Too many clients
- Incorrect reservations

Check:

```powershell
Get-DhcpServerv4ScopeStatistics
```

Review:

- Addresses in use
- Addresses available
- Percentage in use

---

## Scenario 6 — Duplicate IP Address

Possible causes:

- Static address overlaps the DHCP pool
- Exclusion range is missing
- Reservation conflicts with a static assignment
- Another DHCP server exists
- Old manual client settings remain

The fix is to document the address plan and ensure static infrastructure addresses are excluded.

---

## Scenario 7 — Client Keeps an Old Configuration

Run:

```cmd
ipconfig /release
```

```cmd
ipconfig /renew
```

If the client still receives the old configuration:

- Check the correct scope
- Check DHCP policies
- Check multiple network adapters
- Check another DHCP server
- Restart the adapter
- Verify the lease in DHCP Manager

---

## Scenario 8 — DHCP Server Is Authorized but Still Shows Unauthorized

Possible causes include:

- Authorization information has not refreshed
- DNS name mismatch
- Old server entry
- Domain connectivity problem
- Active Directory replication delay
- DHCP console cache
- Service restart required

Check:

```powershell
Get-DhcpServerInDC
```

Compare:

- DNS name
- IP address
- Current server identity

Remove an incorrect stale authorization only after confirming it is not needed:

```powershell
Remove-DhcpServerInDC `
    -DnsName "<OldServerName>" `
    -IPAddress "<OldIPAddress>"
```

Then authorize the correct server.

---

# Technical Decisions

## Why Use DHCP for Clients?

Client addresses may change without affecting core infrastructure.

DHCP reduces manual configuration and provides consistent network options.

---

## Why Keep SRV01 Static?

SRV01 provides:

- Active Directory
- DNS
- DHCP
- Group Policy
- File services

Clients and other services must be able to locate it consistently.

A DHCP-assigned address could change and interrupt infrastructure services.

---

## Why Use Exclusions?

Exclusions keep DHCP from assigning addresses already used by infrastructure systems.

This reduces duplicate-address risk.

---

## Why Deliver SRV01 as DNS?

The `homelab.local` domain records exist on SRV01.

Clients need SRV01 for Active Directory name resolution.

External DNS can be reached through DNS forwarders configured on SRV01.

---

## Why Verify the Lease in Two Places?

Client-side verification confirms what CLIENT01 received.

Server-side verification confirms what SRV01 issued.

```text
CLIENT01 ipconfig
+
DHCP Manager lease
=
Stronger validation
```

---

# Validation Results

| Validation Check | Result |
|------------------|--------|
| Add Roles and Features opened | ✅ |
| DHCP Server role selected | ✅ |
| DHCP role installed | ✅ |
| Post-installation configuration completed | ✅ |
| DHCP Manager opened | ✅ |
| IPv4 scope created | ✅ |
| Address range configured | ✅ |
| Exclusion range configured | ✅ |
| Lease duration configured | ✅ |
| Scope options configured | ✅ |
| Default gateway configured | ✅ |
| SRV01 configured as DNS server | ✅ |
| Scope activated | ✅ |
| Scope summary reviewed | ✅ |
| CLIENT01 lease renewed | ✅ |
| CLIENT01 IP configuration verified | ✅ |
| Active lease verified in DHCP Manager | ✅ |
| DHCP authorization issue understood | ✅ |
| Final DHCP configuration reviewed | ✅ |

---

# Security Notes

## Authorize Only Approved DHCP Servers

Unauthorized DHCP servers can disrupt an entire network or redirect traffic.

Only approved servers should be authorized.

---

## Protect DHCP Administration

Only approved administrators should be allowed to:

- Create scopes
- Modify options
- Add reservations
- Change exclusions
- Authorize servers
- Remove authorized servers
- Modify DHCP policies

---

## Avoid Overlapping Scopes

Two DHCP servers should not distribute overlapping address ranges unless the design explicitly supports failover.

Overlapping scopes can create duplicate IP conflicts.

---

## Use Internal DNS for Domain Clients

Domain clients should receive the internal DNS server through DHCP.

Using public DNS directly may break:

- Domain joins
- Authentication
- Group Policy
- Service discovery
- Internal resource resolution

---

## Monitor DHCP Logs

A production environment should monitor:

- Authorization failures
- Scope exhaustion
- Service failures
- Declined addresses
- Duplicate addresses
- Unauthorized DHCP activity
- Lease anomalies

---

# Useful Commands

## View authorized DHCP servers

```powershell
Get-DhcpServerInDC
```

---

## Authorize SRV01

```powershell
Add-DhcpServerInDC `
    -DnsName "SRV01.homelab.local" `
    -IPAddress "192.168.241.10"
```

---

## Check DHCP service status

```powershell
Get-Service DHCPServer
```

---

## Restart the DHCP service

```powershell
Restart-Service DHCPServer
```

---

## View DHCP scopes

```powershell
Get-DhcpServerv4Scope
```

---

## View scope statistics

```powershell
Get-DhcpServerv4ScopeStatistics
```

---

## View active leases

```powershell
Get-DhcpServerv4Lease `
    -ScopeId <ScopeNetworkID>
```

---

## View scope options

```powershell
Get-DhcpServerv4OptionValue `
    -ScopeId <ScopeNetworkID>
```

---

## Release a client address

```cmd
ipconfig /release
```

---

## Renew a client address

```cmd
ipconfig /renew
```

---

## Verify the client configuration

```cmd
ipconfig /all
```

---

## Test DNS after receiving the lease

```cmd
nslookup homelab.local
```

```cmd
nslookup SRV01.homelab.local
```

---

# Skills Demonstrated

- Windows DHCP Server
- DHCP Role Installation
- Active Directory DHCP Authorization
- IPv4 Scope Configuration
- Address Pool Management
- Exclusion Ranges
- Lease Duration
- DHCP Scope Options
- Default Gateway Configuration
- DNS Option Configuration
- Client Lease Renewal
- DHCP Lease Verification
- Event ID 1046 Troubleshooting
- Windows Server 2025
- Network Troubleshooting
- Infrastructure Documentation

---

# Interview Notes

## What is DHCP?

DHCP automatically assigns network configuration to clients, including IP address, subnet mask, gateway, and DNS server.

---

## What is DORA?

DORA describes the DHCP lease process:

```text
Discover
Offer
Request
Acknowledge
```

---

## What is a DHCP scope?

A scope defines the address range and network options available to clients on a subnet.

---

## What is an exclusion range?

An exclusion prevents DHCP from assigning selected addresses.

It is commonly used to protect statically configured infrastructure devices.

---

## Why must DHCP be authorized in Active Directory?

Authorization prevents unauthorized DHCP servers from servicing domain clients.

---

## What does Event ID 1046 indicate?

It indicates that the DHCP server determined it was not authorized in Active Directory and stopped servicing clients.

---

## How do you check DHCP authorization?

```powershell
Get-DhcpServerInDC
```

---

## How do you authorize a DHCP server?

```powershell
Add-DhcpServerInDC `
    -DnsName "SRV01.homelab.local" `
    -IPAddress "192.168.241.10"
```

---

## Why should the DHCP server give clients the internal DNS address?

Domain clients require internal DNS to locate Active Directory services.

---

## What does an APIPA address indicate?

An address in the range:

```text
169.254.x.x
```

usually indicates that the client could not obtain a DHCP lease.

---

## How would you troubleshoot a client that receives an IP but cannot access the domain?

I would check:

1. DNS server received from DHCP
2. Gateway
3. Domain-controller connectivity
4. `nslookup`
5. DHCP scope options
6. Client DNS cache
7. Active Directory DNS records

---

# What I Learned

The most important lesson from this module was that DHCP configuration is more than creating an address range.

A working client lease depends on:

```text
Authorized Server
+
Active Scope
+
Available Address
+
Correct Gateway
+
Correct DNS
```

I also learned how closely DHCP and DNS work together.

DHCP can successfully assign an IP address while still providing the wrong DNS server.

That creates a situation where:

```text
IP connectivity works
```

but:

```text
Domain and hostname resolution fail
```

The Event ID 1046 investigation also showed why Active Directory authorization matters.

The server role was installed, but the service refused to operate because it was not approved in the domain.

The troubleshooting workflow I want to remember is:

```text
Check service
      ↓
Check authorization
      ↓
Check active scope
      ↓
Check available leases
      ↓
Renew client
      ↓
Verify IP
      ↓
Verify gateway
      ↓
Verify DNS
      ↓
Test name resolution
```

---

# Future Improvements

To expand this module, I would add:

- DHCP reservations
- DHCP policies
- MAC-based filtering
- Scope utilization reporting
- DHCP failover
- Second DHCP server
- Multiple VLAN scopes
- DHCP relay
- PowerShell scope creation
- Automated lease reports
- DHCP audit-log review
- DNS dynamic-update validation
- Secure credential configuration for DNS updates
- Monitoring for rogue DHCP servers
- Scope exhaustion alerts
- Backup and restore testing

Example PowerShell scope creation:

```powershell
Add-DhcpServerv4Scope `
    -Name "Homelab Clients" `
    -StartRange "192.168.241.100" `
    -EndRange "192.168.241.200" `
    -SubnetMask "255.255.255.0"
```

Values must match the actual network design before execution.

---

# Key Takeaways

This module deployed and validated DHCP services for the `homelab.local` environment.

The implementation included:

- Installing the DHCP role
- Completing post-installation configuration
- Creating an IPv4 scope
- Configuring exclusions
- Setting lease duration
- Configuring gateway and DNS options
- Activating the scope
- Renewing CLIENT01
- Verifying the client configuration
- Confirming the active lease
- Investigating DHCP Event ID 1046

The main lessons were:

```text
DHCP must be authorized in Active Directory.
```

```text
An active scope is required before clients receive addresses.
```

```text
Exclude infrastructure addresses from the client pool.
```

```text
Deliver the internal DNS server to domain clients.
```

```text
Verify both the client configuration and the server lease.
```

```text
If IP works but names fail, investigate DNS.
```

The network now has automated client addressing and is ready to support the remaining core infrastructure services.

---

<div align="center">

### Module Status

✅ Completed Successfully

**Next Module:** [File Services](../03-File-Services/)

</div>