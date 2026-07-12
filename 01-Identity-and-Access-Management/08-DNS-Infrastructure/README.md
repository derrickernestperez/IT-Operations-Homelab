<div align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&color=gradient&customColorList=0,2&height=250&section=header&text=DNS%20Infrastructure&fontSize=42&fontAlignY=35&desc=Module%208%20%7C%20Active%20Directory-Integrated%20DNS&descSize=20&descAlignY=55" alt="DNS Infrastructure Banner" width="100%">
</div>

---

## Overview

This module documents the deployment, configuration, and validation of a Microsoft Active Directory-integrated Domain Name System (DNS) infrastructure within the homelab environment.

DNS is one of the most critical services in an Active Directory environment, providing hostname resolution, domain controller discovery, authentication support, Group Policy processing, and service location functionality.

This implementation includes verification of Forward Lookup Zones, creation of DNS Host (A) Records, deployment of a Reverse Lookup Zone, validation of Pointer (PTR) Records, and testing of forward and reverse DNS resolution using native Windows networking tools.

---

## Business Scenario

Following the deployment of Active Directory Domain Services and successful domain joining of enterprise workstations, the organization requires centralized name resolution services.

The Infrastructure Team is responsible for implementing and validating DNS services to support:

- Active Directory authentication
- Domain controller discovery
- Hostname resolution
- Reverse DNS lookups
- Future DHCP integration
- Enterprise network administration

The objective is to establish a reliable DNS infrastructure capable of supporting current operations while preparing the environment for future growth.

---

## Learning Objectives

By completing this module, the following competencies were demonstrated:

- Understand DNS functionality within Active Directory environments
- Navigate and administer DNS Manager
- Manage Active Directory-integrated DNS zones
- Create and validate Host (A) Records
- Configure Reverse Lookup Zones
- Validate PTR Records
- Perform DNS troubleshooting using nslookup
- Verify hostname resolution using ICMP testing
- Understand enterprise DNS architecture and administration

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

Launched DNS Manager from the Windows Server administrative tools.

DNS Manager serves as the centralized console used to manage DNS zones, records, replication settings, and enterprise name resolution services.

<p align="center">
<img src="/01-Identity-and-Access-Management/08-DNS-Infrastructure/Evidence/Screenshots/01-Open-DNS-Manager.png" width="800">
</p>

---

## Step 2 — Review Forward Lookup Zones

Reviewed the Forward Lookup Zones automatically created during Active Directory deployment.

These zones provide hostname-to-IP address resolution and contain records required for Active Directory operations.

<p align="center">
<img src="/01-Identity-and-Access-Management/08-DNS-Infrastructure/Evidence/Screenshots/02-Forward-Lookup-Zone.png" width="800">
</p>

---

## Step 3 — Examine the homelab.local Zone

Opened the primary Active Directory-integrated DNS zone and reviewed existing DNS records.

The zone contains records used for:

- Domain controller discovery
- Authentication services
- Service registration
- Enterprise name resolution

<p align="center">
<img src="/01-Identity-and-Access-Management/08-DNS-Infrastructure/Evidence/Screenshots/03-homelab.local-Zone.png" width="800">
</p>

---

## Step 4 — Review Domain Controller DNS Registration

Reviewed the automatically registered DNS A Record for the domain controller (SRV01).

Active Directory-integrated DNS dynamically registers domain controllers to ensure clients can locate authentication and directory services.

<p align="center">
<img src="/01-Identity-and-Access-Management/08-DNS-Infrastructure/Evidence/Screenshots/04-Domain-Controller-A-Record.png" width="800">
</p>

---

## Step 5 — Create a Test Host (A) Record

Created a custom test Host (A) Record within the homelab.local zone.

Host records provide forward DNS resolution by mapping hostnames to IPv4 addresses and are commonly used for servers, applications, and internal resources.

<p align="center">
<img src="/01-Identity-and-Access-Management/08-DNS-Infrastructure/Evidence/Screenshots/05-Create-Test-A-Record.png" width="800">
</p>

---

## Step 6 — Verify Test Record Creation

Confirmed successful creation of the new DNS A Record.

Verification ensures the record has been properly registered within the DNS zone and is available for client resolution requests.

<p align="center">
<img src="/01-Identity-and-Access-Management/08-DNS-Infrastructure/Evidence/Screenshots/06-Test-A-Record-Created.png" width="800">
</p>

---

## Step 7 — Create a Reverse Lookup Zone

Launched the Reverse Lookup Zone Wizard and configured a new Active Directory-integrated reverse lookup zone for the 192.168.241.0/24 subnet.

Reverse lookup zones provide IP-to-hostname resolution capabilities.

<p align="center">
<img src="/01-Identity-and-Access-Management/08-DNS-Infrastructure/Evidence/Screenshots/07-Reverse-Lookup-Zone-Wizard.png" width="800">
</p>

---

## Step 8 — Verify Reverse Lookup Zone Deployment

Confirmed successful creation of the reverse lookup zone.

This zone will host PTR records used for reverse DNS resolution throughout the environment.

<p align="center">
<img src="/01-Identity-and-Access-Management/08-DNS-Infrastructure/Evidence/Screenshots/08-Reverse-Lookup-Zone-Created.png" width="800">
</p>

---

## Step 9 — Verify PTR Records

Reviewed Pointer (PTR) records stored within the reverse lookup zone.

PTR records enable reverse DNS functionality by translating IP addresses back into hostnames.

This capability is commonly used in enterprise troubleshooting, monitoring, logging, and security investigations.

<p align="center">
<img src="/01-Identity-and-Access-Management/08-DNS-Infrastructure/Evidence/Screenshots/09-PTR-Records-Verification.png" width="800">
</p>

---

## Step 10 — Test DNS Resolution Using NSLookup

Executed nslookup to validate DNS functionality and confirm successful hostname resolution.

The test verified that the DNS infrastructure can successfully resolve DNS records within the Active Directory environment.

<p align="center">
<img src="/01-Identity-and-Access-Management/08-DNS-Infrastructure/Evidence/Screenshots/10-NSLookup-Test.png" width="800">
</p>

---

## Step 11 — Test Reverse DNS Resolution

Performed reverse DNS testing using nslookup against an IP address.

Successful results confirmed that PTR records were functioning correctly and returning the expected hostname.

<p align="center">
<img src="/01-Identity-and-Access-Management/08-DNS-Infrastructure/Evidence/Screenshots/11-Reverse-NSLookup-Test.png" width="800">
</p>

---

## Step 12 — Validate Hostname Resolution Using Ping

Executed ICMP testing using a hostname rather than an IP address.

The successful resolution of the hostname demonstrates that DNS services are functioning correctly from a client perspective.

<p align="center">
<img src="/01-Identity-and-Access-Management/08-DNS-Infrastructure/Evidence/Screenshots/12-Ping-Name-Resolution-Test.png" width="800">
</p>

---

## Step 13 — Review Final DNS Configuration

Performed a final review of the DNS infrastructure.

The completed implementation includes:

- Active Directory-integrated DNS
- Forward Lookup Zones
- Reverse Lookup Zones
- Host (A) Records
- Pointer (PTR) Records
- Forward DNS Resolution
- Reverse DNS Resolution

<p align="center">
<img src="/01-Identity-and-Access-Management/08-DNS-Infrastructure/Evidence/Screenshots/13-DNS-Manager-Final-Configuration.png" width="800">
</p>

---

# Security & Administrative Value

DNS is a foundational service within enterprise environments and Active Directory infrastructures.

This implementation supports:

- Active Directory authentication
- Domain controller discovery
- Group Policy processing
- Enterprise resource access
- Network troubleshooting
- Security monitoring
- Future DHCP integration

Improper DNS configuration is one of the most common causes of Active Directory failures. Verifying both forward and reverse resolution ensures operational stability and provides a strong foundation for future infrastructure services.

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
<i>Deploying centralized IP address management, DHCP scopes, exclusions, reservations, lease management, and DNS integration.</i>
</div>
