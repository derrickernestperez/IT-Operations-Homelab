<div align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&color=gradient&customColorList=0,2&height=250&section=header&text=DHCP%20Infrastructure&fontSize=42&fontAlignY=35&desc=Module%209%20%7C%20Dynamic%20Host%20Configuration%20Protocol&descSize=20&descAlignY=55" alt="DHCP Infrastructure Banner" width="100%">
</div>

---

## Overview

This module documents the deployment, configuration, and validation of a Microsoft Dynamic Host Configuration Protocol (DHCP) infrastructure within the homelab environment.

DHCP automates the assignment of IP addresses and network configuration settings to client devices, eliminating the need for manual IP configuration and simplifying network administration.

This implementation includes DHCP Server installation, Active Directory authorization, scope creation, exclusion ranges, lease management, DNS integration, client IP assignment, and lease verification.

---

## Business Scenario

As the organization continues expanding its Active Directory environment, manually configuring network settings on every workstation becomes inefficient and difficult to manage.

The Infrastructure Team is tasked with deploying a centralized DHCP service capable of automatically assigning:

- IP Addresses
- Subnet Masks
- Default Gateway
- DNS Server Configuration

The solution must integrate with Active Directory and DNS to ensure consistent network connectivity and centralized management.

---

## Learning Objectives

By completing this module, the following competencies were demonstrated:

- Understand DHCP fundamentals and enterprise use cases
- Install and configure the DHCP Server role
- Authorize DHCP within Active Directory
- Create and manage DHCP scopes
- Configure exclusion ranges
- Configure lease durations
- Configure gateway and DNS options
- Verify DHCP lease assignments
- Validate DHCP and DNS integration
- Troubleshoot client network configuration

---

## Lab Environment Specifications

| Component | Configuration |
|------------|------------|
| Server Name | SRV01 |
| Operating System | Windows Server 2025 Standard Evaluation |
| Domain | homelab.local |
| DHCP Server | SRV01 |
| DNS Server | SRV01 (192.168.241.10) |
| Client Device | CLIENT01 |
| Network Range | 192.168.241.0/24 |
| Default Gateway | 192.168.241.2 |

---

# Step-by-Step Implementation

## Step 1 — Launch Add Roles and Features Wizard

Opened the Add Roles and Features Wizard from Server Manager.

This wizard is used to deploy and manage Windows Server roles and features throughout the enterprise environment.

<p align="center">
<img src="/01-Identity-and-Access-Management/09-DHCP-Infrastructure/Evidence/Screenshots/01-Open-Add-Roles-and-Features.png" width="800">
</p>

---

## Step 2 — Select DHCP Server Role

Selected the DHCP Server role for installation.

This role enables Windows Server to automatically assign IP addresses and network settings to clients across the network.

<p align="center">
<img src="/01-Identity-and-Access-Management/09-DHCP-Infrastructure/Evidence/Screenshots/02-Select-DHCP-Server-Role.png" width="800">
</p>

---

## Step 3 — Complete DHCP Installation

Installed the DHCP Server role on SRV01.

Successful installation prepares the server to begin servicing DHCP requests from client devices.

<p align="center">
<img src="/01-Identity-and-Access-Management/09-DHCP-Infrastructure/Evidence/Screenshots/03-DHCP-Installation-Complete.png" width="800">
</p>

---

## Step 4 — Complete DHCP Post-Deployment Configuration

Executed the DHCP Post-Install Configuration Wizard.

The wizard reported that the DHCP server was already authorized within Active Directory, confirming that the server was recognized and trusted to issue DHCP leases.

<p align="center">
<img src="/01-Identity-and-Access-Management/09-DHCP-Infrastructure/Evidence/Screenshots/04-Complete-DHCP-Configuration-Wizard.png" width="800">
</p>

---

## Step 5 — Verify DHCP Manager

Opened DHCP Manager and verified that SRV01 was operational and authorized.

A properly authorized DHCP server is required before any DHCP leases can be issued within an Active Directory environment.

<p align="center">
<img src="/01-Identity-and-Access-Management/09-DHCP-Infrastructure/Evidence/Screenshots/05-DHCP-Manager-Console.png" width="800">
</p>

---

## Step 6 — Create a New DHCP Scope

Launched the New Scope Wizard under IPv4.

Scopes define the range of addresses that DHCP can distribute to client devices.

<p align="center">
<img src="/01-Identity-and-Access-Management/09-DHCP-Infrastructure/Evidence/Screenshots/06-New-Scope-Wizard.png" width="800">
</p>

---

## Step 7 — Configure Address Pool

Configured the Corporate Workstations scope using the following range:

| Setting | Value |
|----------|----------|
| Start IP | 192.168.241.100 |
| End IP | 192.168.241.200 |
| Subnet Mask | 255.255.255.0 |

This range provides a dedicated pool of addresses for workstation devices while reserving lower addresses for servers and infrastructure systems.

<p align="center">
<img src="/01-Identity-and-Access-Management/09-DHCP-Infrastructure/Evidence/Screenshots/07-Scope-IP-Range-Configuration.png" width="800">
</p>

---

## Step 8 — Configure Exclusion Range

Configured an exclusion range to prevent DHCP from assigning reserved addresses.

| Start | End |
|---------|---------|
| 192.168.241.100 | 192.168.241.110 |

These addresses can later be allocated to infrastructure devices such as printers, appliances, or reserved systems.

<p align="center">
<img src="/01-Identity-and-Access-Management/09-DHCP-Infrastructure/Evidence/Screenshots/08-Exclusion-Range-Configuration.png" width="800">
</p>

---

## Step 9 — Configure Lease Duration

Configured DHCP lease settings.

The default lease duration of 8 days was retained.

Lease durations control how long a client may retain an assigned IP address before renewal is required.

<p align="center">
<img src="/01-Identity-and-Access-Management/09-DHCP-Infrastructure/Evidence/Screenshots/09-Lease-Duration-Configuration.png" width="800">
</p>

---

## Step 10 — Configure DHCP Options

Selected the option to configure DHCP scope settings immediately after deployment.

These options allow centralized distribution of network settings to all DHCP clients.

<p align="center">
<img src="/01-Identity-and-Access-Management/09-DHCP-Infrastructure/Evidence/Screenshots/10-DHCP-Options-Configuration.png" width="800">
</p>

---

## Step 11 — Configure Default Gateway

Configured the default gateway:

```text
192.168.241.2
```

The gateway provides clients with a route to external networks and internet connectivity.

<p align="center">
<img src="/01-Identity-and-Access-Management/09-DHCP-Infrastructure/Evidence/Screenshots/11-Gateway-Configuration.png" width="800">
</p>

---

## Step 12 — Configure DNS Settings

Configured DHCP to distribute DNS settings to all clients.

| Setting | Value |
|----------|----------|
| DNS Server | 192.168.241.10 |
| Domain Name | homelab.local |

This integration allows clients to automatically locate Active Directory services and resolve hostnames.

<p align="center">
<img src="/01-Identity-and-Access-Management/09-DHCP-Infrastructure/Evidence/Screenshots/12-DNS-Server-Configuration.png" width="800">
</p>

---

## Step 13 — Activate the Scope

Activated the Corporate Workstations DHCP Scope.

Once activated, DHCP became capable of assigning addresses to requesting clients.

<p align="center">
<img src="/01-Identity-and-Access-Management/09-DHCP-Infrastructure/Evidence/Screenshots/13-Scope-Activated.png" width="800">
</p>

---

## Step 14 — Verify Scope Deployment

Reviewed the completed DHCP scope configuration.

The scope now contains:

- Address Pool
- Address Leases
- Reservations
- Scope Options

<p align="center">
<img src="/01-Identity-and-Access-Management/09-DHCP-Infrastructure/Evidence/Screenshots/14-DHCP-Scope-Summary.png" width="800">
</p>

---

## Step 15 — Renew Client IP Address

Forced CLIENT01 to release and renew its DHCP lease.

This process validates that DHCP services are successfully responding to client requests.

<p align="center">
<img src="/01-Identity-and-Access-Management/09-DHCP-Infrastructure/Evidence/Screenshots/15-Client-IP-Renewal.png" width="800">
</p>

---

## Step 16 — Verify Client Configuration

Used ipconfig /all to verify DHCP-assigned network settings.

Validation confirmed:

- DHCP Enabled
- DHCP Server Assignment
- DNS Server Assignment
- Dynamic IP Configuration

<p align="center">
<img src="/01-Identity-and-Access-Management/09-DHCP-Infrastructure/Evidence/Screenshots/16-IPConfig-Verification.png" width="800">
</p>

---

## Step 17 — Verify DHCP Lease Assignment

Reviewed the Address Leases container within DHCP Manager.

The client device successfully received and registered a DHCP lease from SRV01.

<p align="center">
<img src="/01-Identity-and-Access-Management/09-DHCP-Infrastructure/Evidence/Screenshots/17-DHCP-Lease-Verification.png" width="800">
</p>

---

## Step 18 — Review Final DHCP Configuration

Performed a final review of the DHCP infrastructure.

The completed deployment includes:

- Authorized DHCP Server
- Active DHCP Scope
- Exclusion Ranges
- Lease Management
- Gateway Configuration
- DNS Integration
- Dynamic Client Address Assignment

<p align="center">
<img src="/01-Identity-and-Access-Management/09-DHCP-Infrastructure/Evidence/Screenshots/18-Final-DHCP-Configuration.png" width="800">
</p>

---

# DHCP Process Overview (DORA)

When a client requests an IP address, DHCP uses the DORA process:

| Phase | Description |
|---------|---------|
| Discover | Client searches for a DHCP Server |
| Offer | DHCP Server offers an IP address |
| Request | Client requests the offered address |
| Acknowledge | DHCP Server approves the lease |

This process occurs automatically whenever devices join the network.

---

# Security & Administrative Value

DHCP provides centralized IP address management and reduces administrative overhead.

Benefits include:

- Automated workstation deployment
- Consistent DNS configuration
- Reduced configuration errors
- Centralized network administration
- Improved scalability
- Support for Active Directory environments

Proper DHCP configuration also improves troubleshooting efficiency by maintaining centralized visibility of active IP leases across the network.

---

# Skills Demonstrated

- Windows Server Administration
- DHCP Deployment
- DHCP Scope Management
- DHCP Authorization
- Lease Management
- Network Infrastructure Administration
- DNS & DHCP Integration
- IP Address Management
- Client Network Troubleshooting
- Enterprise Infrastructure Support

---

<div align="center">
<b><a href="../10-File-and-Print-Services/README.md">Next: Module 10 — File and Print Services</a></b><br>
<i>Deploying centralized file shares, access control, network resources, and enterprise data management.</i>
</div>
