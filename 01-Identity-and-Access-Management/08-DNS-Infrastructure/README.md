<div align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&color=gradient&customColorList=0,2&height=250&section=header&text=DNS%20Infrastructure&fontSize=42&fontAlignY=35&desc=Module%208%20%7C%20Active%20Directory-Integrated%20DNS&descSize=20&descAlignY=55" alt="DNS Infrastructure Banner" width="100%">
</div>

---

## Overview

This module documents the deployment and validation of a Microsoft Active Directory-integrated Domain Name System (DNS) infrastructure within the homelab environment.

DNS serves as one of the most critical services in an Active Directory environment, enabling domain authentication, resource discovery, Group Policy processing, and hostname resolution across the network.

This implementation includes the creation and verification of Forward Lookup Zones, Reverse Lookup Zones, Host (A) Records, Pointer (PTR) Records, and DNS resolution testing using native Windows administration tools.

---

## Business Scenario

The organization has successfully deployed Active Directory Domain Services and domain-joined workstations. To ensure reliable communication between systems, centralized name resolution services must be implemented.

The Infrastructure Team is responsible for configuring and validating DNS services to support:

- Active Directory authentication
- Domain controller discovery
- Hostname resolution
- Reverse DNS lookups
- Future DHCP integration
- Enterprise network administration

The objective is to establish a resilient DNS infrastructure capable of supporting enterprise services and future network expansion.

---

## Learning Objectives

By completing this module, the following competencies were demonstrated:

- Understand the role of DNS within Active Directory environments
- Navigate and manage DNS Manager
- Examine Active Directory-integrated DNS zones
- Create and manage Host (A) records
- Create and manage Reverse Lookup Zones
- Understand and validate PTR records
- Perform forward and reverse DNS resolution testing
- Troubleshoot DNS resolution using nslookup and ping
- Validate enterprise DNS functionality

---

## Lab Environment Specifications

| Component | Configuration |
|------------|------------|
| Server Name | SRV01 |
| Operating System | Windows Server 2025 Standard Evaluation |
| Domain | homelab.local |
| DNS Type | Active Directory-Integrated DNS |
| Management Tool | DNS Manager |
| Client Device | CLIENT01 |
| Network Range | 192.168.241.0/24 |

---

# Step-by-Step Implementation

## Step 1 — Open DNS Manager

Launched DNS Manager from Server Manager administrative tools.

DNS Manager provides centralized administration of DNS zones, records, replication settings, and name resolution services across the enterprise environment.

<p align="center">
<img src="/01-Identity-and-Access-Management/08-DNS-Infrastructure/Evidence/Screenshots/01-Open-DNS-Manager.png" width="800">
</p>

---

## Step 2 — Review Forward Lookup Zones

Verified the default Active Directory-integrated Forward Lookup Zones automatically created during Active Directory deployment.

These zones allow hostname-to-IP address resolution for domain resources.

<p align="center">
<img src="/01-Identity-and-Access-Management/08-DNS-Infrastructure/Evidence/Screenshots/02-Forward-Lookup-Zone.png" width="800">
</p>

---

## Step 3 — Examine the homelab.local DNS Zone

Opened the primary DNS zone and reviewed Active Directory DNS records.

The zone contains critical records used by Active Directory services including:

- Domain Controller registration
- Service Locator (SRV) records
- Authentication services
- Hostname resolution

<p align="center">
<img src="/01-Identity-and-Access-Management/08-DNS-Infrastructure/Evidence/Screenshots/03-homelab.local-Zone.png" width="800">
</p>

---

## Step 4 — Review Existing Domain Controller A Record

Created a test Host (A) record within the homelab.local DNS zone.

Reviewed the automatically registered DNS A Record for the Domain Controller (SRV01). Active Directory-integrated DNS dynamically registers domain controllers to support authentication, service discovery, and name resolution.

<p align="center">
<img src="/01-Identity-and-Access-Management/08-DNS-Infrastructure/Evidence/Screenshots/04-Domain-Controller-A-Record.png" width="800">
</p>

---

## Step 5 —  Create Test A Record

Created a custom test A Record to demonstrate manual DNS record administration and forward lookup functionality.

<p align="center">
<img src="/01-Identity-and-Access-Management/08-DNS-Infrastructure/Evidence/Screenshots/05-Create-Test-A-Record.png" width="800">
</p>

---

## Step 6 — Verify Test A Record Creation

Confirmed successful creation and registration of the test A Record within the homelab.local zone.

<p align="center">
<img src="/01-Identity-and-Access-Management/08-DNS-Infrastructure/Evidence/Screenshots/06-Test-A-Record-Created.png" width="800">
</p>

---

## Step 7 — Create a Reverse Lookup Zone

Launched the Reverse Lookup Zone Wizard and configured a new Active Directory-integrated reverse lookup zone for the 192.168.241.0/24 network.

Reverse zones enable IP address-to-hostname resolution.

<p align="center">
<img src="/01-Identity-and-Access-Management/08-DNS-Infrastructure/Evidence/Screenshots/07-Reverse-Lookup-Zone-Wizard.png" width="800">
</p>

---

## Step 8 — Verify Reverse Lookup Zone Creation

Confirmed successful deployment of the reverse lookup zone.

The newly created zone will be used to host PTR records for reverse DNS resolution.

<p align="center">
<img src="/01-Identity-and-Access-Management/08-DNS-Infrastructure/Evidence/Screenshots/08-Reverse-Lookup-Zone-Created.png" width="800">
</p>

---

## Step 9 — Verify PTR Records

Reviewed Pointer (PTR) records within the reverse lookup zone.

PTR records provide reverse DNS functionality by mapping IP addresses back to hostnames.

This capability is commonly used in enterprise troubleshooting, logging, monitoring, and security investigations.

<p align="center">
<img src="/01-Identity-and-Access-Management/08-DNS-Infrastructure/Evidence/Screenshots/09-PTR-Records-Verification.png" width="800">
</p>

---

## Step 10 — Perform Reverse DNS Resolution Testing

Used nslookup to validate reverse DNS functionality.

Successful reverse lookups confirm PTR records are functioning correctly and returning expected hostnames.

<p align="center">
<img src="/01-Identity-and-Access-Management/08-DNS-Infrastructure/Evidence/Screenshots/10-NSLookup-Test.png" width="800">
</p>

---

## Step 11 — Perform Forward DNS Resolution Testing

Executed nslookup against the SRV01 hostname to verify forward DNS resolution.

This test confirms the DNS server can successfully translate hostnames into IP addresses.

<p align="center">
<img src="/01-Identity-and-Access-Management/08-DNS-Infrastructure/Evidence/Screenshots/11-Reverse-NSLookup-Test.png" width="800">
</p>

---

## Step 12 — Validate Name Resolution Using Ping

Performed hostname-based ICMP testing.

The successful resolution of SRV01 demonstrates that DNS services are operating correctly from the client perspective.

<p align="center">
<img src="/01-Identity-and-Access-Management/08-DNS-Infrastructure/Evidence/Screenshots/12-Ping-Name-Resolution-Test.png" width="800">
</p>

---

## Step 13 — Review Final DNS Configuration

Conducted a final review of the DNS infrastructure.

The environment now includes:

- Active Directory-integrated DNS
- Forward Lookup Zone
- Reverse Lookup Zone
- Host (A) Records
- Pointer (PTR) Records
- Verified forward resolution
- Verified reverse resolution

<p align="center">
<img src="/01-Identity-and-Access-Management/08-DNS-Infrastructure/Evidence/Screenshots/13-DNS-Manager-Final-Configuration.png" width="800">
</p>

---

# Security & Administrative Value

From a systems administration and security perspective, DNS is a foundational enterprise service.

This implementation supports:

- Active Directory authentication
- Domain controller discovery
- Group Policy processing
- Centralized resource access
- Troubleshooting and monitoring
- Security investigations using reverse lookups
- Future DHCP integration

Improper DNS configuration is one of the most common causes of Active Directory failures. Validating both forward and reverse DNS resolution helps ensure operational stability and supports future security monitoring initiatives.

---

# Skills Demonstrated

- Windows Server Administration
- Active Directory DNS Management
- DNS Zone Administration
- Forward Lookup Configuration
- Reverse Lookup Configuration
- A Record Management
- PTR Record Management
- DNS Troubleshooting
- Network Diagnostics
- Enterprise Infrastructure Administration

---

<div align="center">
<b><a href="../09-DHCP-Infrastructure/README.md">Next: Module 9 — DHCP Infrastructure</a></b><br>
<i>Deploying centralized IP address management, DHCP scopes, reservations, exclusions, and DNS integration.</i>
</div>
