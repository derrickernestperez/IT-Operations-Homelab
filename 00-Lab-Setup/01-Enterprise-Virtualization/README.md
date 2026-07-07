# Module 1 – Enterprise Virtualization

> Build the virtual foundation of an enterprise IT environment using VMware Workstation Pro.

---

## 📖 Overview

This module documents the deployment of the first virtual machine in my **Enterprise IT Operations Homelab**.

The objective is to create a Windows Server 2025 virtual machine that will become **SRV01**, the primary server for the lab. This server will later host services such as Active Directory, DNS, DHCP, Group Policy, Windows LAPS, Microsoft Entra ID integration, and security monitoring.

Instead of relying on VMware's default settings, I manually configured each component to better understand enterprise virtualization and hardware planning.

---

## 🏢 Business Scenario

A company has purchased a new server that will become the foundation of its internal IT infrastructure.

Before Windows Server can be installed, the Infrastructure Team must create a virtual machine and configure its virtual hardware according to company standards.

In production environments, organizations commonly use platforms such as:

- VMware ESXi
- Microsoft Hyper-V
- Nutanix AHV
- Proxmox VE

For this homelab, **VMware Workstation Pro** is used to simulate an enterprise virtualization environment.

---

# 🎯 Learning Objectives

After completing this module, I can:

- Explain the purpose of virtualization
- Differentiate between the Host and Guest operating systems
- Create a virtual machine using VMware Workstation Pro
- Configure enterprise virtual hardware
- Allocate CPU, memory, storage, and networking resources
- Explain why each configuration was selected

---

# 🖥️ Lab Environment

| Component | Configuration |
|-----------|---------------|
| Hypervisor | VMware Workstation Pro |
| Host OS | Windows 11 |
| Guest OS | Windows Server 2025 |
| Server Name | SRV01 |
| Firmware | UEFI |
| Secure Boot | Enabled |
| CPU | 2 vCPUs |
| Memory | 4 GB |
| Storage | 80 GB NVMe (Thin Provisioned) |
| Network | NAT |

---

# 🚀 Implementation

## Step 1 — Create a New Virtual Machine

Opened VMware Workstation Pro and launched the **New Virtual Machine Wizard** to begin creating the first enterprise server.

**Screenshot**

![New Virtual Machine](Evidence/Screenshots/01-New-Virtual-Machine-Wizard.png)

---

## Step 2 — Select Custom Configuration

Selected **Custom (Advanced)** instead of the Typical configuration.

Using the Custom option provides complete control over the virtual hardware configuration, which more closely reflects how virtual machines are deployed in enterprise environments.

**Screenshot**

![Custom Configuration](Evidence/Screenshots/02-Custom-Configuration.png)

---

## Step 3 — Select Hardware Compatibility

Kept the latest VMware hardware compatibility version.

This ensures compatibility with modern virtual hardware and Windows Server 2025.

**Screenshot**

![Hardware Compatibility](Evidence/Screenshots/03-Hardware-Compatibility.png)

---

## Step 4 — Install the Operating System Later

Selected **I will install the operating system later**.

This disables VMware Easy Install and allows Windows Server to be installed manually, providing better visibility into the installation process.

**Screenshot**

![Install Later](Evidence/Screenshots/04-Install-Operating-System-Later.png)

---

## Step 5 — Select the Guest Operating System

Configured the virtual machine for **Microsoft Windows Server 2025**.

Selecting the correct operating system ensures VMware applies the appropriate virtual hardware optimizations.

**Screenshot**

![Guest Operating System](Evidence/Screenshots/05-Guest-Operating-System.png)

---

## Step 6 — Name the Virtual Machine

Assigned the virtual machine the name **SRV01**.

Using a consistent naming convention helps identify servers as the environment grows.

**Screenshot**

![VM Name](Evidence/Screenshots/06-VM-Name.png)

---

## Step 7 — Configure Firmware

Changed the firmware to **UEFI** and enabled **Secure Boot**.

These settings reflect current enterprise standards and improve the security of the boot process.

**Screenshot**

![UEFI](Evidence/Screenshots/07-UEFI-SecureBoot.png)

---

## Step 8 — Configure the Processor

Assigned:

- 1 Processor
- 2 Cores

This provides enough processing power for Windows Server infrastructure services while leaving resources available for the host system.

**Screenshot**

![CPU Configuration](Evidence/Screenshots/08-CPU-Configuration.png)

---

## Step 9 — Configure Memory

Allocated **4 GB (4096 MB)** of memory.

This amount is sufficient for Windows Server in a lab environment while allowing additional virtual machines to run later.

**Screenshot**

![Memory Configuration](Evidence/Screenshots/09-Memory-Configuration.png)

---

## Step 10 — Configure Storage

Created an **80 GB NVMe virtual disk** using **Thin Provisioning**.

Thin Provisioning allows the virtual disk to consume physical storage only as data is written.

**Screenshot**

![Storage Configuration](Evidence/Screenshots/10-NVMe-Disk.png)

---

## Step 11 — Configure Networking

Selected **NAT** networking.

NAT allows the virtual machine to access the internet while remaining isolated from the home network.

**Screenshot**

![Network Configuration](Evidence/Screenshots/11-NAT-Network.png)

---

## Step 12 — Review the Virtual Hardware

Reviewed all virtual hardware settings before powering on the virtual machine.

Verifying the configuration helps prevent deployment issues before the operating system is installed.

**Screenshot**

![Hardware Summary](Evidence/Screenshots/12-VM-Hardware-Summary.png)

---

# 📚 Technical Notes

### Why use UEFI?

UEFI is the modern firmware standard used by enterprise systems. It supports Secure Boot, GPT partitions, and improved hardware compatibility.

### Why enable Secure Boot?

Secure Boot verifies trusted boot components during startup and helps protect against unauthorized bootloaders.

### Why allocate 4 GB of RAM?

Windows Server infrastructure services such as Active Directory, DNS, and DHCP have relatively low memory requirements in a lab environment. Allocating only the required memory leaves resources available for future virtual machines.

### Why use Thin Provisioning?

Thin Provisioning saves storage by allocating physical disk space only when data is written instead of reserving the full virtual disk size immediately.

### Why use NAT?

NAT provides internet access for updates and downloads while keeping the lab isolated from the home network.

---

# ✅ Skills Demonstrated

- VMware Workstation Pro Administration
- Enterprise Virtualization
- Virtual Machine Deployment
- Virtual Hardware Configuration
- Resource Planning
- Storage Planning
- Network Planning

---

# 💡 Key Takeaways

Building the virtual machine manually provided a deeper understanding of how enterprise servers are deployed. Each hardware component was configured intentionally to balance performance, security, and efficient resource usage. This virtual machine is now ready for the installation of Windows Server 2025.

---

# 🎤 Interview Questions

### Why did you choose Custom instead of Typical?

Custom configuration provides complete control over virtual hardware settings and more closely reflects how enterprise administrators deploy production virtual machines.

### Why did you choose NAT networking?

NAT provides internet access while keeping the lab isolated from the physical network, making it ideal for the initial deployment.

### Why use Thin Provisioning?

Thin Provisioning conserves storage by allocating physical disk space only as data is written.

### Why did you enable Secure Boot?

Secure Boot helps ensure that only trusted software loads during the boot process, improving system security.

---

# ⏭️ Next Module

**Module 2 – Installing Windows Server 2025**

The next module covers installing Windows Server 2025, selecting the appropriate edition, completing the initial configuration, and preparing the server for infrastructure roles.
