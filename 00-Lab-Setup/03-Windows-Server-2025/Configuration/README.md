Provisioned virtual hardware utilizing UEFI and Secure Boot for modern compliance.

Installed Windows Server 2025 Standard.

Installed VMware Tools to ensure proper hypervisor driver integration (display, input, and network).

Renamed the server hostname to WindowLabServer via Server Manager to adhere to naming conventions.

Assigned a static IPv4 address (10.10.10.10) via ncpa.cpl to prevent dynamic IP shifting, which would sever client connectivity.

Set the Preferred DNS to the IPv4 Loopback address (127.0.0.1) in preparation for the Active Directory Domain Services deployment.
