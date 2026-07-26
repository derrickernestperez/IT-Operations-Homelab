# KB-005 — Domain Controller and DNS Unreachable

## Article Information

| Field | Value |
|---|---|
| Article ID | KB-005 |
| Category | Networking and Active Directory |
| Environment | homelab.local |
| Affected Systems | CLIENT01 and SRV01 |
| Audience | IT Support and Systems Administration |
| Author | Derrick Ernest Perez |
| Status | Published |
| Version | 1.0 |

---

## Purpose

This article explains how to diagnose and resolve a condition where a domain-joined Windows client cannot locate or communicate with the domain controller.

The procedure should be used when DNS resolution, domain discovery, Kerberos authentication, or PowerShell Remoting fails.

---

## Common Symptoms

One or more of the following may occur:

- The domain controller cannot be located
- Domain credentials are rejected
- PowerShell Remoting fails with Kerberos errors
- SRV01 cannot be resolved by name
- Group Policy processing fails
- Domain services appear unavailable

Common messages include:

```text
ERROR_NO_SUCH_DOMAIN
Status = 1355 0x54b
The domain is not available
Resolve-DnsName timed out
Destination host unreachable
```

---

## Scope

This procedure applies to:

- Domain: homelab.local
- Domain controller: SRV01
- Management workstation: CLIENT01
- VMware Workstation Pro
- Windows Server and Windows 11

---

## Required Access

- Local access to CLIENT01
- VMware access to both virtual machines
- Administrative access to SRV01
- Domain administrative credentials when authentication testing is required

---

## Troubleshooting Procedure

### Step 1 — Confirm both virtual machines are running

In VMware Workstation, confirm:

- SRV01 is powered on
- CLIENT01 is powered on
- Both network adapters are connected
- Connect at power on is enabled
- Both systems use the same VMware network

Do not begin with DNS troubleshooting when the server is unreachable at the network layer.

### Step 2 — Identify the active CLIENT01 adapter

```powershell
Get-NetAdapter | Where-Object Status -eq "Up" | Select-Object Name,InterfaceDescription,Status
```

Use the exact interface name returned by the command.

Example:

```text
Ethernet0
```

### Step 3 — Check CLIENT01 IP configuration

```powershell
ipconfig /all
Get-NetIPConfiguration
```

Confirm that CLIENT01 has an address in the expected VMware subnet.

### Step 4 — Test SRV01 by IP address

```powershell
ping 192.168.241.10
```

Interpretation:

| Result | Meaning |
|---|---|
| Reply received | Network path is available |
| Request timed out | Firewall, server state, or network issue |
| Destination host unreachable | Local network path or VMware adapter issue |

If the IP test fails, correct the VMware network or IP configuration before continuing.

### Step 5 — Confirm CLIENT01 DNS server

```powershell
Get-DnsClientServerAddress -InterfaceAlias "Ethernet0" -AddressFamily IPv4
```

CLIENT01 should use SRV01:

```text
192.168.241.10
```

Correct it when necessary:

```powershell
Set-DnsClientServerAddress -InterfaceAlias "Ethernet0" -ServerAddresses "192.168.241.10"
```

### Step 6 — Refresh DNS

```powershell
ipconfig /flushdns
ipconfig /registerdns
```

### Step 7 — Test name resolution

```powershell
Resolve-DnsName SRV01.homelab.local
nslookup SRV01.homelab.local 192.168.241.10
```

Expected result:

```text
SRV01.homelab.local
192.168.241.10
```

### Step 8 — Test domain controller discovery

```powershell
nltest /dsgetdc:homelab.local
```

Expected:

```text
DC: \\SRV01.homelab.local
The command completed successfully
```

### Step 9 — Test required ports

```powershell
Test-NetConnection SRV01 -Port 53
Test-NetConnection SRV01 -Port 88
Test-NetConnection SRV01 -Port 389
Test-NetConnection SRV01 -Port 5985
```

### Step 10 — Validate PowerShell Remoting

```powershell
$Credential = Get-Credential -UserName "homelab\Administrator"
Invoke-Command -ComputerName SRV01.homelab.local -Credential $Credential -ScriptBlock { hostname; whoami }
```

Expected:

```text
SRV01
homelab\administrator
```

---

## Root Cause Patterns

Common causes include:

- SRV01 is powered off
- A VMware network adapter is disconnected
- The two VMs use different VMware networks
- SRV01 no longer uses the expected IP address
- CLIENT01 uses the wrong DNS server
- The DNS service on SRV01 is stopped
- The domain secure channel is broken

---

## Resolution Summary

Restore basic IP connectivity first.

Then confirm CLIENT01 uses SRV01 for DNS, verify domain discovery, and retest authentication and remoting.

Recommended order:

```text
VM power and adapter state
        |
        v
IP addressing
        |
        v
Ping by IP
        |
        v
DNS configuration
        |
        v
Name resolution
        |
        v
Domain discovery
        |
        v
Kerberos and WinRM
```

---

## Validation Checklist

| Check | Expected Result |
|---|---|
| SRV01 responds by IP | Passed |
| SRV01 resolves by FQDN | Passed |
| Domain controller is discovered | Passed |
| TCP 5985 is reachable | Passed |
| Kerberos authentication works | Passed |
| PowerShell Remoting succeeds | Passed |

---

## Escalation Criteria

Escalate when:

- SRV01 remains unreachable after VMware checks
- Multiple clients are affected
- DNS service will not start
- The Active Directory domain cannot be located
- The secure channel cannot be repaired
- Authentication fails despite confirmed connectivity and DNS
- Security compromise is suspected

---

## Related Incident

- [INC-005 — CLIENT01 Could Not Reach SRV01](../Incident-Records/INC-005-CLIENT01-Could-Not-Reach-SRV01.md)

---

## Related Documentation

- [Infrastructure Overview](../Environment/Infrastructure-Overview.md)
- [Network and Service Reference](../Environment/Network-and-Service-Reference.md)
- [Server Inventory](../Environment/Server-Inventory.md)
