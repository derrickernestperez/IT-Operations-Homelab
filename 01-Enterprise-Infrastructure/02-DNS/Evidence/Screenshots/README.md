# Enterprise Virtualization with VMware Workstation Pro

## Overview

Enterprise virtualization allows multiple operating systems to run on a single physical computer by creating virtual machines (VMs). Each virtual machine behaves like an independent computer with its own CPU, memory, storage, network adapter, and operating system.

For this homelab, VMware Workstation Pro is used as the hypervisor to build an enterprise environment consisting of Windows Server 2025, Windows 11, and future Linux virtual machines. This virtual infrastructure will become the foundation for Active Directory, DNS, DHCP, Microsoft 365, Microsoft Entra ID, security monitoring, and incident response.

---

# Objectives

After completing this module, I was able to:

- Understand the concept of virtualization
- Differentiate between a Host and Guest operating system
- Install VMware Workstation Pro
- Create a Windows Server 2025 virtual machine
- Configure enterprise virtual hardware
- Prepare the virtual environment for Windows Server installation

---

# Why Virtualization?

Modern organizations rarely purchase a dedicated physical server for every service. Instead, they use virtualization to maximize hardware utilization, reduce costs, simplify backups, improve disaster recovery, and accelerate deployment.

Using virtualization allows multiple servers to operate independently on a single physical machine while remaining isolated from one another.

Benefits include:

- Better hardware utilization
- Reduced infrastructure costs
- Easier backups and snapshots
- Rapid deployment of new servers
- Safe environment for testing and learning
- Isolation between operating systems

---

# Host vs Guest Operating System

### Host Operating System

The host operating system is the physical computer running VMware Workstation Pro.

In this homelab:

- Physical Device: Laptop
- RAM: 16 GB
- Storage Available: ~200 GB
- Hypervisor: VMware Workstation Pro

---

### Guest Operating System

A guest operating system is installed inside a virtual machine.

For this module:

- Windows Server 2025
- Future Windows 11 Client
- Future Ubuntu Linux Server

Each guest has its own virtual hardware and operates independently from the host system.

---

# Virtual Machine Configuration

| Component | Configuration |
|-----------|---------------|
| Hypervisor | VMware Workstation Pro |
| Guest OS | Windows Server 2025 |
| Firmware | UEFI |
| Secure Boot | Enabled |
| CPU | 2 vCPUs |
| Memory | 4 GB |
| Storage | 80 GB NVMe (Thin Provisioned) |
| Network | NAT |
| Installation Media | Windows Server 2025 ISO |

---

# Step-by-Step Deployment

## Step 1 - Create a New Virtual Machine

Created a new virtual machine using VMware Workstation Pro.

**Screenshot**

![](Evidence/Screenshots/01-New-VM-Wizard.png)

---

## Step 2 - Select the Installation Media

Attached the Windows Server 2025 ISO image to the virtual machine.

**Screenshot**

![](Evidence/Screenshots/02-Windows-Server-ISO.png)

---

## Step 3 - Configure Firmware

Configured the virtual machine to use UEFI firmware with Secure Boot enabled.

UEFI provides modern boot capabilities and Secure Boot helps verify trusted boot components.

**Screenshot**

![](Evidence/Screenshots/03-UEFI-SecureBoot.png)

---

## Step 4 - Configure Virtual Hardware

Configured:

- 2 vCPUs
- 4 GB RAM
- NAT Networking
- 80 GB NVMe Disk

These settings provide sufficient resources while maintaining good performance on the host system.

**Screenshot**

![](Evidence/Screenshots/04-Virtual-Hardware.png)

---

## Step 5 - Configure Storage

Created a new virtual NVMe disk with:

- 80 GB Capacity
- Thin Provisioning
- Single File

Thin provisioning conserves host storage by allocating disk space only as data is written.

**Screenshot**

![](Evidence/Screenshots/05-Virtual-Disk.png)

---

# Verification

Verified that:

- Windows Server ISO was attached
- Virtual hardware matched the design
- UEFI firmware was enabled
- Secure Boot was enabled
- NAT networking was configured
- VM was ready to boot

---

# Skills Demonstrated

- VMware Workstation Administration
- Enterprise Virtualization
- Resource Planning
- Virtual Hardware Configuration
- Network Planning
- Storage Provisioning

---

# Key Takeaways

Virtualization enables organizations to consolidate multiple servers onto a single physical host while maintaining isolation between workloads. Proper planning of CPU, memory, storage, and networking is essential for building scalable enterprise infrastructure.

---

# Interview Questions

### What is virtualization?

Virtualization is the process of creating virtual versions of computing resources such as servers, storage, and networks, allowing multiple operating systems to run on a single physical computer.

---

### What is the difference between a Host and Guest Operating System?

The host operating system runs directly on the physical computer and manages the virtualization software. A guest operating system runs inside a virtual machine and uses virtualized hardware provided by the hypervisor.

---

### Why did you use NAT networking?

NAT provides internet access while isolating the virtual machine from the physical network. This allows updates and downloads without exposing the lab environment directly to other devices.

---

### Why use Thin Provisioning?

Thin provisioning saves physical disk space by allocating storage only as needed, making it ideal for home labs with limited storage capacity.

---

# Next Module

Windows Server 2025 Installation