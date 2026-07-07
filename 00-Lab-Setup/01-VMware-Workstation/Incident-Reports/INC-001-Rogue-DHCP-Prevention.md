# INC-001: Preemptive Rogue DHCP Mitigation

## Problem Statement
When deploying a Windows Server DHCP role on a virtualized network, client endpoints frequently receive incorrect IP addresses (e.g., `192.168.x.x` instead of `10.x.x.x`) or experience IP conflicts.

## Investigation
An audit of Type-2 hypervisor behavior reveals that VMware Workstation Pro natively runs a background DHCP service on all Host-Only and NAT virtual switches by default to assist standard users with immediate connectivity. 

## Root Cause
If a Windows Server DHCP service is spun up on `VMnet2` while VMware's native DHCP is still active, it creates a "Rogue DHCP" race condition. Whichever server answers the client's broadcast request first will lease the IP, leading to split-brain network routing and isolated clients.

## Resolution
Aggressively disabled the "Use local DHCP service" parameter within the VMware Virtual Network Editor for `VMnet2` prior to spinning up any server infrastructure. This enforces a single point of authority for IP allocation.
