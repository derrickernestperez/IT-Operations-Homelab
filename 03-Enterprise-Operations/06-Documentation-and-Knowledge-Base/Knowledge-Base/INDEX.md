# Knowledge Base Index

## Purpose

This page provides centralized navigation for environment documentation, incident records, troubleshooting articles, operating procedures, reports, and change records.

---

## Environment Documentation

| Document | Description |
|---|---|
| [Infrastructure Overview](../Environment/Infrastructure-Overview.md) | High-level summary of SRV01, CLIENT01, services, and management architecture |
| [SRV01 Server Inventory](../Environment/Server-Inventory.md) | Asset, operating system, roles, services, storage, and management details |
| [Network and Service Reference](../Environment/Network-and-Service-Reference.md) | IP addresses, ports, services, dependencies, and validation commands |

---

## Knowledge Base Articles

| Article ID | Title | Category | Status |
|---|---|---|---|
| KB-005 | [Domain Controller and DNS Unreachable](KB-005-Domain-Controller-and-DNS-Unreachable.md) | Networking and Active Directory | Published |

---

## Incident Records

| Incident ID | Title | Category | Status |
|---|---|---|---|
| INC-005 | [CLIENT01 Could Not Reach SRV01](../Incident-Records/INC-005-CLIENT01-Could-Not-Reach-SRV01.md) | Network and Domain Connectivity | Resolved |

---

## Standard Operating Procedures

| Procedure ID | Title | Status |
|---|---|---|
| SOP-003 | [Remote Server Health Check](../Procedures/SOP-003-Remote-Server-Health-Check.md) | Approved |

---

## Reports

| Report | Description |
|---|---|
| [SRV01 Infrastructure Data](../Reports/SRV01-Infrastructure-Data.txt) | Raw live data collected remotely from SRV01 |

---

## Change Management

| Document | Description |
|---|---|
| [Change Management Log](../Change-Management/CHANGELOG.md) | Infrastructure and documentation change history |

---

## Common Support Scenarios

### Domain login or Kerberos failure

Use:

- KB-005
- Network and Service Reference
- INC-005

### SRV01 connectivity failure

Check:

1. VMware power state
2. Virtual adapter connection
3. IP addressing
4. DNS configuration
5. Domain discovery
6. Required service ports

### Routine server review

Use:

- SOP-003
- SRV01 Server Inventory
- SRV01 Infrastructure Data

---

## Documentation Status

| Area | Status |
|---|---|
| Environment documentation | Complete |
| Incident documentation | Complete |
| Knowledge article | Complete |
| Standard operating procedure | Complete |
| Change management | Complete |
| Automated validation | Pending |

---

## Document Ownership

| Field | Value |
|---|---|
| Owner | Homelab IT Administration |
| Maintainer | Derrick Ernest Perez |
| Environment | homelab.local |
| Review Method | Manual review and PowerShell validation |
