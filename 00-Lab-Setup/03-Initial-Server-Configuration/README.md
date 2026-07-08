<div align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&color=gradient&customColorList=0,2&height=250&section=header&text=Initial%20Server%20Configuration&fontSize=48&fontAlignY=35&desc=Module%203%20%7C%20Preparing%20SRV01%20for%20Active%20Directory&descSize=20&descAlignY=55" alt="Module 3 Banner" width="100%">
</div>

---

# Overview

This module covers the initial configuration tasks performed immediately after installing Windows Server 2025.

Rather than deploying Active Directory immediately, enterprise administrators first configure the server with a meaningful hostname, verify network connectivity, assign a static IP address, and validate DNS settings.

These foundational configurations ensure that the server is stable, consistently reachable, and ready to become the first Domain Controller in the environment.

---

# Business Scenario

A newly installed Windows Server has been handed over to the Infrastructure Team.

Before deploying critical services such as Active Directory Domain Services (AD DS), the server must comply with the organization's deployment standards.

The preparation process includes:

- Verifying the installation
- Reviewing system specifications
- Renaming the server
- Configuring a static IP address
- Assigning the preferred DNS server
- Validating network connectivity

Completing these tasks first helps prevent future networking and authentication issues throughout the enterprise.

---

# Learning Objectives

By completing this module, I learned how to:

- Verify a successful Windows Server installation
- Navigate Server Manager
- Understand the importance of meaningful server naming
- Verify DHCP-assigned network settings
- Interpret `ipconfig /all`
- Understand private IPv4 addressing
- Configure a static IPv4 address
- Configure DNS settings manually
- Prepare a Windows Server for Active Directory deployment

---

# Lab Environment Specifications

| Component | Configuration |
|-----------|---------------|
| Server Name | SRV01 |
| Operating System | Windows Server 2025 Standard Evaluation |
| Hypervisor | VMware Workstation Pro |
| Network Mode | NAT |
| IP Address | 192.168.241.10 |
| Subnet Mask | 255.255.255.0 |
| Default Gateway | 192.168.241.2 |
| Preferred DNS | 192.168.241.2 |

---

# Step-by-Step Implementation

---

## Step 1 — Verify Windows Server Installation

After signing in, Server Manager launched automatically.

This dashboard provides administrators with an overview of the server's configuration, installed roles, network status, Windows Update status, firewall settings, and server management tools.

<p align="center">
<img src="/00-Lab-Setup/03-Initial-Server-Configuration/Evidence/Screenshots/22-Server-Manager.png" width="900">
</p>

---

## Step 2 — Review Server Information

Verified the installed operating system and allocated virtual hardware.

Confirmed:

- Windows Server 2025 Standard Evaluation
- 4 GB RAM
- Approximately 80 GB virtual disk
- AMD Ryzen virtual processor presented by VMware

Verifying hardware resources before deployment ensures that the server meets the minimum requirements for future infrastructure roles.

<p align="center">
<img src="/00-Lab-Setup/03-Initial-Server-Configuration/Evidence/Screenshots/23-Server-Information.png" width="650">
</p>

---

## Step 3 — Rename the Server

Changed the default computer name generated during installation.

Old Name

WIN-XXXXXXXX

New Name

SRV01

Using descriptive hostnames makes enterprise environments easier to manage, especially when dozens or hundreds of servers are deployed.

> **Note:** This step was completed before screenshots were taken.

---

## Step 4 — Verify the New Hostname

After restarting the server, verified that the hostname had successfully changed.

The `hostname` command confirmed that the server is now identified as **SRV01**.

<p align="center">
<img src="/00-Lab-Setup/03-Initial-Server-Configuration/Evidence/Screenshots/24-Hostname-Verification.png" width="750">
</p>

---

## Step 5 — Review Current Network Configuration

Executed:

```powershell
ipconfig /all
```

This command displays detailed TCP/IP configuration information, including:

- Current IP address
- DHCP status
- Default gateway
- DNS server
- MAC address
- Lease information

Initially, the server received its IP address dynamically from VMware's NAT DHCP service.

<p align="center">
<img src="/00-Lab-Setup/03-Initial-Server-Configuration/Evidence/Screenshots/25-IPConfig-All.png" width="900">
</p>

---

## Step 6 — Configure a Static IPv4 Address

Changed the network adapter configuration from DHCP to a manually assigned static IP.

Configured:

| Setting | Value |
|---------|------|
| IP Address | 192.168.241.10 |
| Subnet Mask | 255.255.255.0 |
| Default Gateway | 192.168.241.2 |
| Preferred DNS | 192.168.241.2 |

Enterprise infrastructure servers should always use static IP addresses to ensure predictable network communication.

<p align="center">
<img src="/00-Lab-Setup/03-Initial-Server-Configuration/Evidence/Screenshots/26-Static-IP-Configuration.png" width="500">
</p>

---

# Technical Concepts

## Why Rename the Server?

Random computer names become difficult to manage as environments grow.

Meaningful hostnames such as:

- SRV01
- DC01
- FILE01
- SQL01

allow administrators to quickly identify each server's purpose.

---

## Why Use a Static IP Address?

Infrastructure services such as:

- Active Directory
- DNS
- DHCP
- Certificate Services

must always be reachable at the same IP address.

If a Domain Controller receives a different address from DHCP after restarting, authentication and DNS resolution may fail across the network.

---

## Understanding 192.168.241.0/24

The server resides within the private IPv4 network:

```
192.168.241.0/24
```

Where:

Network ID

```
192.168.241.0
```

Gateway

```
192.168.241.2
```

Server

```
192.168.241.10
```

The `/24` subnet mask (255.255.255.0) provides 254 usable host addresses, making it suitable for small to medium-sized enterprise networks.

---

# Skills Demonstrated

- Windows Server Administration
- Server Manager
- Computer Renaming
- IPv4 Addressing
- Static IP Configuration
- DNS Configuration
- Network Verification
- TCP/IP Fundamentals

---

# Mock Interview Questions

### Why should a Domain Controller use a static IP address?

> Active Directory relies heavily on DNS. A changing IP address can prevent clients from locating the Domain Controller, leading to authentication failures and service disruptions.

---

### What does `ipconfig /all` display?

> It provides detailed TCP/IP configuration information, including IP address, subnet mask, gateway, DNS servers, MAC address, DHCP status, and lease details.

---

### Why rename servers instead of keeping the default Windows-generated name?

> Meaningful hostnames improve administration, documentation, troubleshooting, monitoring, and scalability in enterprise environments.

---

<div align="center">

**Next Module:** Installing Active Directory Domain Services (AD DS)

*Promoting SRV01 to the first Domain Controller in the enterprise homelab.*

</div>
