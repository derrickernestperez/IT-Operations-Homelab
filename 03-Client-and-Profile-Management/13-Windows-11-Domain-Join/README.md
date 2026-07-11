<div align="center"> <img src="https://capsule-render.vercel.app/api?type=waving&color=gradient&customColorList=0,2&height=250&section=header&text=Windows%2011%20Domain%20Join&fontSize=42&fontAlignY=35&desc=Module%2013%20|%20Client%20Management&descSize=20&descAlignY=55" width="100%"/>
Windows 11 Domain Join
Enterprise IT & Tier 1 SOC Operations Homelab

Module 13 – Client Management

</div>
Overview

After deploying the Active Directory infrastructure and organizing enterprise identities, the next step is onboarding a client workstation into the domain.

In enterprise environments, every workstation must establish a secure trust relationship with the Domain Controller before centralized management features such as Group Policy, authentication, software deployment, and security auditing can be applied.

This module demonstrates the deployment of a Windows 11 Enterprise workstation, network configuration for Active Directory communication, DNS validation, domain enrollment, and verification that the workstation is successfully managed within Active Directory.

Learning Objectives

By completing this module, the following skills were demonstrated:

Deploy Windows 11 Enterprise
Configure enterprise DNS settings
Validate Active Directory connectivity
Verify DNS name resolution
Join a Windows workstation to an Active Directory domain
Authenticate using domain credentials
Verify Computer Objects in Active Directory
Organize workstations into Organizational Units
Core Technical Concepts
Domain Join

A Domain Join establishes a secure trust relationship between a Windows workstation and an Active Directory Domain Controller.

Instead of authenticating locally, users authenticate against Active Directory using centrally managed domain accounts.

Computer Objects

Every domain-joined workstation receives its own Computer Object within Active Directory.

Computer Objects:

authenticate to the domain
receive Computer Configuration Group Policies
maintain their own secure machine password
uniquely identify the workstation within the enterprise
DNS in Active Directory

Active Directory relies heavily on DNS.

Instead of searching for servers by IP address, clients locate Domain Controllers using DNS records.

Without correctly configured DNS, a workstation cannot join the domain.

Organizational Units (OUs)

Once a workstation joins the domain, administrators typically move it into an Organizational Unit.

This enables targeted deployment of:

Group Policies
Security Policies
Software Deployment
Windows Updates
Login Scripts
Lab Environment
Component	Value
Domain	homelab.local
Domain Controller	SRV01
Client Computer	CLIENT01
Operating System	Windows 11 Enterprise
Network	VMware NAT
DNS Server	192.168.241.10
Step-by-Step Implementation
Step 1 — Windows 11 Installation

Installed Windows 11 Enterprise and completed the initial operating system setup.

<p align="center"> <img src="03-Client-and-Profile-Management/13-Windows-11-Domain-Join/Evidence/Screenshots/01-Windows-11-Desktop.png" width="850"> </p>
Step 2 — Rename the Workstation

Renamed the workstation from the default hostname to CLIENT01 following enterprise naming conventions.

<p align="center"> <img src="03-Client-and-Profile-Management/13-Windows-11-Domain-Join/Evidence/Screenshots/02-System-Properties-CLIENT01.png" width="850"> </p>
Step 3 — Configure Active Directory DNS

Configured the workstation to use the Domain Controller (192.168.241.10) as its preferred DNS server while retaining a DHCP-assigned IP address.

<p align="center"> <img src="03-Client-and-Profile-Management/13-Windows-11-Domain-Join/Evidence/Screenshots/03-Network-Adapter-IPv4-Settings.png" width="850"> </p>
Step 4 — Verify Network Configuration

Validated the workstation configuration using ipconfig /all to confirm the correct DNS server assignment.

<p align="center"> <img src="03-Client-and-Profile-Management/13-Windows-11-Domain-Join/Evidence/Screenshots/04-IPConfig-Verification.png" width="850"> </p>
Step 5 — Test Connectivity

Verified communication with the Domain Controller using ICMP.

<p align="center"> <img src="03-Client-and-Profile-Management/13-Windows-11-Domain-Join/Evidence/Screenshots/05-Ping-SRV01.png" width="850"> </p>
Step 6 — Verify DNS Resolution

Validated that CLIENT01 successfully resolved the Active Directory domain using nslookup.

Although the DNS server appeared as Unknown, this is expected because a reverse lookup zone had not yet been configured. The successful resolution of homelab.local confirmed that DNS services were functioning correctly.

<p align="center"> <img src="03-Client-and-Profile-Management/13-Windows-11-Domain-Join/Evidence/Screenshots/06-NSLookup-homelab.local.png" width="850"> </p>
Step 7 — Join the Active Directory Domain

Joined CLIENT01 to the homelab.local domain using Domain Administrator credentials.

Windows successfully established a secure trust relationship with the Domain Controller.

<p align="center"> <img src="03-Client-and-Profile-Management/13-Windows-11-Domain-Join/Evidence/Screenshots/07-Domain-Join-Success.png" width="850"> </p>
Step 8 — Authenticate with a Domain User

Logged into Windows using a domain account created in Module 5.

This verified centralized authentication through Active Directory.

<p align="center"> <img src="03-Client-and-Profile-Management/13-Windows-11-Domain-Join/Evidence/Screenshots/08-Domain-User-Desktop.png" width="850"> </p>
Step 9 — Verify the Computer Object

Confirmed that Active Directory automatically created a Computer Object for CLIENT01 after the successful domain join.

<p align="center"> <img src="03-Client-and-Profile-Management/13-Windows-11-Domain-Join/Evidence/Screenshots/09-CLIENT01-Computer-Object.png" width="850"> </p>
Step 10 — Move CLIENT01 into the Workstations OU

Moved CLIENT01 from the default Computers container into the Workstations Organizational Unit to prepare it for workstation-specific Group Policy deployment.

<p align="center"> <img src="03-Client-and-Profile-Management/13-Windows-11-Domain-Join/Evidence/Screenshots/10-CLIENT01-in-Workstations-OU.png" width="850"> </p>
Skills Demonstrated
Windows 11 Enterprise Deployment
Active Directory Domain Join
DNS Client Configuration
Enterprise Network Validation
Active Directory Computer Object Management
Organizational Unit Administration
Enterprise Client Provisioning
Windows Authentication
Active Directory Infrastructure
Mock Interview Questions
What is a Domain Join?

Answer

A Domain Join establishes a secure trust relationship between a Windows workstation and an Active Directory Domain Controller, allowing centralized authentication, policy management, and administrative control.

Why must a domain client use the Domain Controller as its DNS server?

Answer

Active Directory depends on DNS to locate Domain Controllers and directory services. If a client uses a public DNS server instead of the internal Domain Controller, it cannot locate Active Directory services or join the domain.

What is a Computer Object in Active Directory?

Answer

A Computer Object represents a domain-joined workstation or server. Like user accounts, it has its own identity, secure password, and trust relationship with the Domain Controller. Computer Objects also receive Computer Configuration Group Policies.

Why do administrators move computers into Organizational Units?

Answer

Moving computers into Organizational Units allows administrators to apply different Group Policies, security settings, software deployments, and administrative controls based on the computer's role or department.

<div align="center">
Module Complete

Next Module

Module 6 — Group Policy Hardening

Configure and deploy enterprise Group Policy Objects (GPOs) to centrally manage workstation security, desktop configuration, Windows Updates, and administrative policies across the domain.

</div>
