<div align="center">
  <h1>🛠️ Module 1: Enterprise Virtualization</h1>
  <p><i>Building the virtual foundation of an enterprise IT environment using VMware Workstation Pro.</i></p>
</div>

---

## 📖 Overview
This module documents the deployment of the first virtual machine in my **Enterprise IT Operations Homelab**. 

The goal is to create a Windows Server 2025 virtual machine designated as **SRV01**. This server acts as the primary infrastructure backbone for the lab and will subsequently host core services, including Active Directory, DNS, DHCP, Group Policy, Windows LAPS, Microsoft Entra ID integration, and security monitoring. 

To simulate strict enterprise standards and hardware planning, automated deployment tools (like VMware Easy Install) were bypassed in favor of manual, component-by-component configuration.

## 🏢 Business Scenario
A company has procured a new server to serve as the foundation of its internal IT infrastructure. Before the Windows Server OS can be installed, the Infrastructure Team must provision a virtual machine and configure its virtual hardware to align with company deployment standards.

While production environments typically rely on hypervisors like **VMware ESXi, Microsoft Hyper-V, Nutanix AHV,** or **Proxmox VE**, this lab utilizes **VMware Workstation Pro** to emulate a scalable enterprise virtualization environment.

---

## 🎯 Learning Objectives
By the end of this module, the following competencies were achieved:
* **Hypervisor Architecture:** Understand the core purpose of virtualization and the relationship between Host and Guest operating systems.
* **VM Provisioning:** Deploy a virtual machine manually using VMware Workstation Pro.
* **Resource Allocation:** Configure enterprise virtual hardware, strategically allocating CPU, memory, storage, and networking resources.
* **Architectural Justification:** Articulate the technical reasoning behind each configuration choice.

---

## 🖥️ Lab Environment Specifications

| Component | Configuration Details |
| :--- | :--- |
| **Hypervisor** | VMware Workstation Pro |
| **Host OS** | Windows 11 |
| **Guest OS** | Windows Server 2025 |
| **Hostname** | SRV01 |
| **Firmware** | UEFI (Secure Boot Enabled) |
| **Compute** | 1 Processor / 2 Cores (2 vCPUs total) |
| **Memory** | 4 GB (4096 MB) |
| **Storage** | 80 GB NVMe (Thin Provisioned) |
| **Network** | NAT (Network Address Translation) |

---

## 🚀 Step-by-Step Implementation

### Step 1: Create a New Virtual Machine
Launched the **New Virtual Machine Wizard** to begin provisioning the first enterprise server.

<p align="center">
  <img src="/00-Lab-Setup/01-Enterprise-Virtualization/Evidence/Screenshots/01-New-Virtual-Machine-Wizard.png" width="800" alt="New Virtual Machine">
</p>

### Step 2: Select Custom Configuration
Selected **Custom (Advanced)**. This provides granular control over the virtual hardware, reflecting how VMs are strictly defined in production environments.

<p align="center">
  <img src="/00-Lab-Setup/01-Enterprise-Virtualization/Evidence/Screenshots/02-Custom-Configuration.png" width="800" alt="Custom Configuration">
</p>

### Step 3: Hardware Compatibility
Maintained the latest VMware hardware compatibility version to ensure seamless integration with modern virtual hardware and Windows Server 2025.

<p align="center">
  <img src="/00-Lab-Setup/01-Enterprise-Virtualization/Evidence/Screenshots/03-Hardware-Compatibility.png" width="800" alt="Hardware Compatibility">
</p>

### Step 4: Operating System Installation
Selected **"I will install the operating system later."** This disables VMware Easy Install, allowing for a manual OS installation and providing better visibility into the boot process.

<p align="center">
  <img src="/00-Lab-Setup/01-Enterprise-Virtualization/Evidence/Screenshots/04-Install-Operating-System-Later.png" width="800" alt="Install Later">
</p>

### Step 5: Guest Operating System
Configured the profile for **Microsoft Windows Server 2025** so VMware can apply the appropriate driver optimizations.

<p align="center">
  <img src="/00-Lab-Setup/01-Enterprise-Virtualization/Evidence/Screenshots/05-Guest-Operating-System.png" width="800" alt="Guest Operating System">
</p>

### Step 6: Virtual Machine Naming
Assigned the hostname **SRV01**. Consistent naming conventions are critical for asset management as environments scale.

<p align="center">
  <img src="/00-Lab-Setup/01-Enterprise-Virtualization/Evidence/Screenshots/06-VM-Name.png" width="800" alt="VM Name">
</p>

### Step 7: Firmware & Security
Transitioned firmware to **UEFI** and enabled **Secure Boot**, aligning with modern enterprise security standards to protect the boot sequence.

<p align="center">
  <img src="/00-Lab-Setup/01-Enterprise-Virtualization/Evidence/Screenshots/07-UEFI-SecureBoot.png" width="800" alt="UEFI">
</p>

### Step 8: Processor Allocation
Assigned **1 Processor** and **2 Cores**. This provides adequate processing power for core infrastructure services while preserving host resources.

<p align="center">
  <img src="/00-Lab-Setup/01-Enterprise-Virtualization/Evidence/Screenshots/08-CPU-Configuration.png" width="800" alt="CPU Configuration">
</p>

### Step 9: Memory Allocation
Allocated **4 GB (4096 MB)** of memory. This baseline is sufficient for foundational services (AD, DNS, DHCP) and ensures resources remain available for spinning up additional VMs later.

<p align="center">
  <img src="/00-Lab-Setup/01-Enterprise-Virtualization/Evidence/Screenshots/09-Memory-Configuration.png" width="800" alt="Memory Configuration">
</p>

### Step 10: Storage Provisioning
Created an **80 GB NVMe virtual disk** utilizing **Thin Provisioning**. This ensures the VM only consumes physical storage as data is written, maximizing host drive efficiency.

<p align="center">
  <img src="/00-Lab-Setup/01-Enterprise-Virtualization/Evidence/Screenshots/10-NVMe-Disk.png" width="800" alt="Storage Configuration">
</p>

### Step 11: Network Configuration
Selected **NAT**. This provides the VM with internet access for patching and updates while logically isolating the lab from the physical home network.

<p align="center">
  <img src="/00-Lab-Setup/01-Enterprise-Virtualization/Evidence/Screenshots/11-NAT-Network.png" width="800" alt="Network Configuration">
</p>

### Step 12: Hardware Verification
Conducted a final review of the virtual hardware ledger prior to powering on the VM to prevent deployment failures.

<p align="center">
  <img src="/00-Lab-Setup/01-Enterprise-Virtualization/Evidence/Screenshots/12-VM-Hardware-Summary.png" width="800" alt="Hardware Summary">
</p>

---

## 📚 Technical Architecture & Justifications

* **Why use UEFI over BIOS?** UEFI is the modern firmware standard for enterprise systems. It enables Secure Boot, supports GPT partitions (allowing drives larger than 2TB), and offers vastly improved hardware compatibility.
* **Why enable Secure Boot?** It cryptographically verifies trusted boot components during startup, neutralizing rootkits and unauthorized bootloaders.
* **Why Thin Provisioning?** It optimizes physical storage by allocating disk space dynamically as data is written, rather than instantly reserving the entire 80 GB block (Thick Provisioning).
* **Why NAT over Bridged Networking?** NAT acts as a security and routing boundary. It allows the server to fetch external updates while preventing lab traffic (like DHCP broadcasts) from bleeding out and disrupting the physical home network.

---

## ✅ Skills Demonstrated
* VMware Workstation Pro Administration
* Enterprise Virtualization Architecture
* Secure Virtual Machine Provisioning
* Strategic Resource & Capacity Planning
* Network Isolation (NAT)

---

## 🎤 Mock Interview Q&A

**Q: Why did you choose a "Custom" configuration instead of "Typical"?**
> **A:** Custom configuration provides granular control over the virtual hardware stack (firmware, disk controllers, network types). This closely mirrors how systems administrators deploy production VMs via vCenter or Hyper-V, rather than relying on automated defaults.

**Q: What is the benefit of allocating only 4 GB of RAM to a Windows Server?**
> **A:** In a lab setting, foundational roles like Active Directory and DNS have highly predictable, low-memory footprints. Over-provisioning memory leads to resource starvation on the host. 4 GB ensures the server runs smoothly while leaving overhead for additional nodes in the lab environment.

---

<div align="center">
  <b><a href="#">⏭️ Next Module: Installing Windows Server 2025</a></b><br>
  <i>Covering OS installation, edition selection, and initial server configuration.</i>
</div>
