<div align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&color=gradient&customColorList=0,2&height=250&section=header&text=Initial%20Server%20Configuration&fontSize=48&fontAlignY=35&desc=Module%203%20%7C%20Preparing%20SRV01%20for%20Enterprise%20Deployment&descSize=20&descAlignY=55" alt="Initial Server Configuration Banner" width="100%">
</div>

---

# Overview

This module documents the initial configuration of **SRV01** after successfully installing Windows Server 2025.

Before deploying infrastructure services such as Active Directory Domain Services (AD DS), a newly installed Windows Server should be configured according to enterprise standards. This includes verifying the installation, renaming the server, reviewing network settings, assigning a static IP address, and validating the final configuration.

Completing these tasks ensures the server is ready to host critical infrastructure services and provides a stable foundation for the remainder of the homelab.

---

# Business Scenario

The Infrastructure Team has completed the installation of Windows Server 2025 on the organization's first virtual server.

Before the server can be promoted to a Domain Controller, it must be configured according to company deployment standards. Proper hostname assignment, network configuration, and IP address planning help ensure reliable communication between servers and client devices throughout the enterprise.

---

# Learning Objectives

By the end of this module, I was able to:

- Verify a successful Windows Server installation
- Navigate Server Manager
- Review Local Server properties
- Understand the importance of proper server naming
- Examine current network settings using `ipconfig /all`
- Configure a static IPv4 address
- Configure DNS settings manually
- Verify the completed network configuration
- Prepare a Windows Server for Active Directory deployment

---

# Lab Environment Specifications

| Component | Configuration |
| :--- | :--- |
| **Server Name** | SRV01 |
| **Operating System** | Windows Server 2025 Standard Evaluation |
| **Hypervisor** | VMware Workstation Pro |
| **Network Mode** | NAT |
| **IP Address** | 192.168.241.10 |
| **Subnet Mask** | 255.255.255.0 |
| **Default Gateway** | 192.168.241.2 |
| **Preferred DNS Server** | 192.168.241.2 |

---

# Step-by-Step Implementation

## Step 1 — Open Server Manager

After signing in for the first time, **Server Manager** launched automatically.

Server Manager serves as the central management console for Windows Server. It allows administrators to monitor server health, install roles and features, manage services, and configure networking from a single interface.

<p align="center">
<img src="/00-Lab-Setup/03-Initial-Server-Configuration/Evidence/Screenshots/22-Server-Manager-Dashboard.png" width="900" alt="Server Manager Dashboard">
</p>

---

## Step 2 — Review Local Server

Selected **Local Server** to review the current configuration of the server.

This page provides an overview of important system information, including:

- Computer name
- Workgroup membership
- Windows Update status
- Firewall status
- Remote Desktop
- NIC Teaming
- Installed memory
- Operating system version

Reviewing these settings confirms that the operating system was installed successfully before making additional configuration changes.

<p align="center">
<img src="/00-Lab-Setup/03-Initial-Server-Configuration/Evidence/Screenshots/23-Local-Server.png" width="900" alt="Local Server">
</p>

---

## Step 3 — Verify the Server Name

Confirmed that the server had been renamed to **SRV01** through the System Properties window.

Using descriptive hostnames instead of randomly generated names makes servers easier to identify, document, and manage in enterprise environments.

<p align="center">
<img src="/00-Lab-Setup/03-Initial-Server-Configuration/Evidence/Screenshots/24-System-Properties-SRV01.png" width="450" alt="System Properties">
</p>

---

## Step 4 — Review the Current Network Configuration

Before assigning a static IP address, the existing network configuration was reviewed using the following command:

```powershell
ipconfig /all
```

This command displays detailed TCP/IP information such as:

- Host name
- IPv4 address
- Subnet mask
- Default gateway
- DNS server
- DHCP status
- MAC address

At this stage, the server was still obtaining its IP address automatically from VMware's NAT DHCP service.

<p align="center">
<img src="/00-Lab-Setup/03-Initial-Server-Configuration/Evidence/Screenshots/25-Current-Network-Configuration.png" width="900" alt="Current Network Configuration">
</p>

---

## Step 5 — Open IPv4 Properties

Opened the IPv4 properties of the Ethernet adapter.

By default, Windows Server receives its IP address and DNS server automatically through DHCP. While this is appropriate for client devices, enterprise infrastructure servers should use static addressing.

<p align="center">
<img src="/00-Lab-Setup/03-Initial-Server-Configuration/Evidence/Screenshots/26-IPv4-Properties.png" width="450" alt="IPv4 Properties">
</p>

---

## Step 6 — Configure a Static IPv4 Address

Assigned a static IP configuration to the server.

| Setting | Value |
| :--- | :--- |
| **IP Address** | 192.168.241.10 |
| **Subnet Mask** | 255.255.255.0 |
| **Default Gateway** | 192.168.241.2 |
| **Preferred DNS Server** | 192.168.241.2 |

Using a static IP ensures that the server always remains reachable at the same network address, which is essential for services such as Active Directory and DNS.

<p align="center">
<img src="/00-Lab-Setup/03-Initial-Server-Configuration/Evidence/Screenshots/27-Static-IP-Configuration.png" width="450" alt="Static IP Configuration">
</p>

---

## Step 7 — Verify the Static Network Configuration

After applying the new settings, the network configuration was verified again using:

```powershell
ipconfig /all
```

The verification confirmed that:

- The hostname was **SRV01**
- The static IP address was applied successfully
- DHCP was no longer assigning the address
- The DNS server was configured correctly
- The default gateway was configured correctly

Verifying configuration changes immediately helps identify errors before additional server roles are installed.

<p align="center">
<img src="/00-Lab-Setup/03-Initial-Server-Configuration/Evidence/Screenshots/28-Static-IP-Verification.png" width="900" alt="Static IP Verification">
</p>

---

# Technical Concepts & Justifications

### Why rename the server?

Meaningful server names improve administration, troubleshooting, monitoring, and documentation. Instead of remembering randomly generated names, administrators can immediately identify a server's purpose.

Examples include:

- SRV01
- DC01
- FILE01
- SQL01

---

### Why use a static IP address?

Infrastructure services such as Active Directory, DNS, DHCP, and Certificate Services depend on consistent network addressing.

If these servers receive different IP addresses through DHCP after restarting, clients may fail to locate essential services.

---

### Understanding the Network

The server is configured within the private network:

```
192.168.241.0/24
```

Where:

| Address | Purpose |
| :--- | :--- |
| **192.168.241.0** | Network Address |
| **192.168.241.2** | Default Gateway |
| **192.168.241.10** | SRV01 |
| **255.255.255.0** | Subnet Mask (/24) |

A `/24` network provides up to **254 usable host addresses**, making it suitable for small and medium-sized enterprise environments.

---

# Skills Demonstrated

- Windows Server Administration
- Server Manager Navigation
- Hostname Configuration
- IPv4 Addressing
- Static IP Configuration
- DNS Configuration
- Network Verification
- TCP/IP Fundamentals

---

# Mock Interview Q&A

### Q: Why should a Domain Controller use a static IP address?

> **A:** Active Directory relies heavily on DNS for authentication and service discovery. A static IP address ensures clients can always locate the Domain Controller without interruption.

---

### Q: Why is `ipconfig /all` commonly used by system administrators?

> **A:** It provides detailed network configuration information, including IP addressing, DNS servers, DHCP status, MAC address, and lease information, making it one of the most useful troubleshooting commands.

---

### Q: Why rename servers instead of using the default Windows-generated hostname?

> **A:** Standardized naming conventions improve organization, simplify troubleshooting, and make servers easier to identify as enterprise environments scale.

---

<div align="center">
  <b><a href="#">Next Module: Active Directory Domain Services (AD DS)</a></b><br>
  <i>Installing the AD DS role and promoting SRV01 to the first Domain Controller.</i>
</div>
