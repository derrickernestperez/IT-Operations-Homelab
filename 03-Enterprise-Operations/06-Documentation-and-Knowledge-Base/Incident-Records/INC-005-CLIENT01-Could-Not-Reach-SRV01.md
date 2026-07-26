# INC-005 — CLIENT01 Could Not Reach SRV01

## Incident Information

| Field | Value |
|---|---|
| Incident ID | INC-005 |
| Environment | homelab.local |
| Affected System | CLIENT01 |
| Target System | SRV01 |
| Category | Network and Domain Connectivity |
| Priority | Medium |
| Status | Resolved |
| Assigned Technician | Derrick Ernest Perez |
| Resolution Type | Infrastructure Configuration Correction |
| Environment Type | Isolated Homelab |

---

## Summary

CLIENT01 could not reach SRV01, which prevented DNS resolution, Active Directory domain discovery, Kerberos authentication, and PowerShell Remoting.

The issue was identified while attempting to collect infrastructure information remotely from SRV01.

---

## User and Service Impact

The following functions were affected:

- SRV01 name resolution
- Domain controller discovery
- Kerberos authentication
- PowerShell Remoting
- Remote infrastructure data collection
- Domain-dependent administrative tasks

The issue affected the lab management workstation only.

---

## Symptoms

The following errors were observed:

```text
ERROR_NO_SUCH_DOMAIN
Status = 1355 0x54b
Kerberos authentication failed
Resolve-DnsName timed out
Destination host unreachable
```

PowerShell Remoting returned:

```text
We cannot sign you in with this credential because your domain is not available.
```

Domain controller discovery returned:

```text
Getting DC name failed: Status = 1355 0x54b ERROR_NO_SUCH_DOMAIN
```

A connectivity test returned:

```text
Reply from 192.168.241.130: Destination host unreachable.
```

---

## Troubleshooting Timeline

### 1. Verified the active CLIENT01 adapter

```powershell
Get-NetAdapter | Where-Object Status -eq "Up"
```

The active adapter was identified as:

```text
Ethernet0
```

### 2. Verified CLIENT01 DNS configuration

```powershell
Get-DnsClientServerAddress -InterfaceAlias "Ethernet0" -AddressFamily IPv4
```

CLIENT01 was configured to use SRV01 as its DNS server:

```text
192.168.241.10
```

### 3. Cleared and refreshed DNS registration

```powershell
ipconfig /flushdns
ipconfig /registerdns
```

### 4. Tested DNS resolution

```powershell
Resolve-DnsName SRV01.homelab.local
```

The request timed out.

### 5. Tested direct IP connectivity

```powershell
ping 192.168.241.10
```

The result showed that CLIENT01 could not reach SRV01.

### 6. Verified VMware connectivity

The following were reviewed:

- SRV01 power state
- CLIENT01 power state
- Virtual network adapter connection status
- Connect at power on setting
- VMware network type
- Current SRV01 IP configuration
- Current CLIENT01 IP configuration

Both virtual machines were restored to the same working VMware network.

---

## Root Cause

CLIENT01 and SRV01 were not communicating correctly through the VMware virtual network.

Because CLIENT01 could not reach SRV01 at the network layer, DNS queries to SRV01 timed out. This caused secondary failures in domain discovery, Kerberos authentication, and PowerShell Remoting.

The initial authentication and DNS errors were symptoms of the underlying network-path failure.

---

## Resolution

The VMware network configuration and virtual adapter connectivity were reviewed and corrected.

The following actions were completed:

- Confirmed both virtual machines were powered on
- Confirmed both virtual adapters were connected
- Confirmed both systems used the same VMware network
- Verified the current IP addresses
- Restored communication between CLIENT01 and SRV01
- Configured CLIENT01 to use SRV01 for DNS
- Cleared the CLIENT01 DNS resolver cache
- Retested domain discovery
- Retested PowerShell Remoting

---

## Validation

| Validation Check | Result |
|---|---|
| SRV01 reachable by IP | Passed |
| SRV01 resolved by FQDN | Passed |
| Domain controller discovered | Passed |
| WinRM TCP 5985 reachable | Passed |
| Kerberos authentication successful | Passed |
| PowerShell Remoting successful | Passed |

Validation commands:

```powershell
ping 192.168.241.10
Resolve-DnsName SRV01.homelab.local
nltest /dsgetdc:homelab.local
Test-NetConnection SRV01.homelab.local -Port 5985
Invoke-Command -ComputerName SRV01.homelab.local -ScriptBlock { hostname; whoami }
```

Final status:

```text
Resolved
```

---

## Preventive Actions

- Keep both virtual machines on the same VMware network
- Enable Connect at power on for both virtual adapters
- Confirm SRV01 retains the expected IP configuration
- Confirm CLIENT01 uses SRV01 for DNS
- Test IP connectivity before troubleshooting DNS or Kerberos
- Record VMware network changes in the change log

---

## Escalation Criteria

Escalate when:

- SRV01 remains unreachable after adapter verification
- The VMware virtual network is unavailable
- Multiple domain clients are affected
- DNS and Active Directory services are running but domain discovery still fails
- The secure channel cannot be repaired
- Data corruption or security compromise is suspected

---

## Related Documentation

- [Infrastructure Overview](../Environment/Infrastructure-Overview.md)
- [Network and Service Reference](../Environment/Network-and-Service-Reference.md)
- [KB-005 — Domain Controller and DNS Unreachable](../Knowledge-Base/KB-005-Domain-Controller-and-DNS-Unreachable.md)
