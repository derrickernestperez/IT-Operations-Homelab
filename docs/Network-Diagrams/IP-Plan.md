# Enterprise IP Allocation Plan

## Network Foundation
* **Network Address:** `10.0.0.0`
* **CIDR Prefix:** `/8`
* **Subnet Mask:** `255.0.0.0`
* **Gateway (Exit Node):** Air-gapped / Null (No internet routing)

## Infrastructure Allocation
This subnet is sliced according to standard enterprise engineering practices, separating static infrastructure from dynamic endpoints.

| Device / Role | IP Address / Range | Type | Rationale |
| :--- | :--- | :--- | :--- |
| **Network Gateway** | `Unassigned` | N/A | Strictly isolated Host-Only environment. |
| **WindowLabServer** | `10.10.10.10` | Static | Domain Controller, DNS, and DHCP services require a permanently bolted IP to prevent network-wide authentication failure. |
| **Future Servers** | `10.10.10.11 - 10.10.10.30` | Static | Reserved for future infrastructure (File Servers, Wazuh SIEM, etc.). |
| **DHCP Client Pool** | `10.10.10.100 - 10.10.10.200` | Dynamic | Dynamic scope reserved for end-user endpoints (Windows 11). |
| **Broadcast** | `10.255.255.255` | Unusable | Reserved for Subnet Broadcasts. |

*Note: By utilizing a Class A `/8` subnet for the internal LAN, the environment avoids IP exhaustion and allows for highly scalable future department segmentation.*
