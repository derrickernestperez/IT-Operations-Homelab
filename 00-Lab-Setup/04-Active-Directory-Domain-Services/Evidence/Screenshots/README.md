## Step 12 — Verify Successful Domain Controller Promotion

After selecting **Install**, Windows promoted **SRV01** into the organization's first Domain Controller.

The server automatically restarted to complete the installation.

Following the reboot, **Server Manager** recognized the server as a fully functional Domain Controller capable of hosting centralized identity and directory services for the **homelab.local** domain.

The successful installation of the Active Directory Domain Services role can also be confirmed by the green status indicator in Server Manager, showing that no further configuration is required.

<p align="center">
<img src="/00-Lab-Setup/04-Active-Directory-Domain-Services/Evidence/Screenshots/22-Server-Manager-Dashboard.png" width="900" alt="Server Manager Dashboard">
</p>

---

## Step 13 — Verify Administrative Tools

Opened **Server Manager → Tools**.

Several new management consoles became available after the Domain Controller promotion, including:

- Active Directory Users and Computers
- Active Directory Administrative Center
- DNS Manager
- Active Directory Domains and Trusts
- Active Directory Sites and Services
- Group Policy Management
- ADSI Edit

These administrative tools provide centralized management for users, computers, Organizational Units (OUs), Group Policies, DNS, trusts, and other Active Directory services.

<p align="center">
<img src="/00-Lab-Setup/04-Active-Directory-Domain-Services/Evidence/Screenshots/41-Administrative-Tools.png" width="900" alt="Administrative Tools">
</p>

---

## Step 14 — Verify Active Directory Deployment

Opened **Active Directory Users and Computers** to confirm that the new domain had been created successfully.

Windows automatically generated several default containers, including:

- Builtin
- Computers
- Domain Controllers
- ForeignSecurityPrincipals
- Managed Service Accounts
- Users

The successful creation of these default containers confirms that Active Directory was deployed correctly and that **SRV01** is now functioning as the first Domain Controller for the **homelab.local** forest.

<p align="center">
<img src="/00-Lab-Setup/04-Active-Directory-Domain-Services/Evidence/Screenshots/42-Default-Active-Directory.png" width="900" alt="Default Active Directory">
</p>

---

# Technical Concepts & Justifications

### Why install Active Directory Domain Services?

Active Directory centralizes authentication, authorization, and administration across an organization.

Instead of maintaining separate local user accounts on every workstation, administrators create a single domain account that users can access from any domain-joined computer.

This approach simplifies user management, improves security, and enables centralized policy enforcement.

---

### What is a Domain Controller?

A Domain Controller (DC) is a Windows Server responsible for:

- Authenticating users
- Managing computer accounts
- Hosting the Active Directory database
- Applying Group Policy
- Providing centralized identity management
- Replicating directory data with other Domain Controllers

Every authentication request within a Windows domain is processed by a Domain Controller.

---

### Why is DNS required?

Active Directory relies on DNS to locate Domain Controllers and directory services.

Without DNS:

- Domain joins fail
- User authentication fails
- Group Policy processing fails
- Clients cannot locate Active Directory services
- Enterprise applications cannot discover directory resources

DNS is one of the core infrastructure services required for a healthy Active Directory environment.

---

### What is NTDS.dit?

**NTDS.dit** is the Active Directory database.

It stores:

- User accounts
- Computer accounts
- Security groups
- Organizational Units (OUs)
- Password hashes
- Domain configuration
- Directory objects

This database is one of the most critical components of every Active Directory deployment.

---

### What is SYSVOL?

SYSVOL stores files that are shared across Domain Controllers, including:

- Group Policy Objects (GPOs)
- Logon scripts
- Administrative templates
- Public domain files

When multiple Domain Controllers exist, SYSVOL is automatically replicated to maintain consistency across the entire Active Directory forest.

---

# Skills Demonstrated

- Active Directory Deployment
- Domain Controller Promotion
- Windows Server Administration
- Active Directory Forest Creation
- DNS Integration
- Identity and Access Management
- Enterprise Infrastructure Deployment
- Windows Server Role Installation
- Active Directory Verification
- Server Manager Administration

---

# Mock Interview Q&A

### Q: What is the difference between installing the AD DS role and promoting a Domain Controller?

> **A:** Installing the AD DS role only copies the required software components onto Windows Server. Promoting the server creates the Active Directory database, configures DNS, establishes the domain and forest, creates SYSVOL, and transforms the server into a fully functional Domain Controller.

---

### Q: Why does Active Directory automatically install DNS?

> **A:** Active Directory depends on DNS for service discovery. Clients use DNS to locate Domain Controllers for authentication, Group Policy processing, directory searches, and other domain services.

---

### Q: What is the purpose of the NTDS database?

> **A:** NTDS.dit is the central database of Active Directory. It stores users, computers, security groups, Organizational Units, password hashes, security identifiers (SIDs), and all directory objects required for authentication and centralized administration.

---

### Q: Why is SYSVOL important?

> **A:** SYSVOL stores Group Policy Objects, logon scripts, and other shared files required by the domain. It is automatically replicated between Domain Controllers to ensure every controller provides the same policies and authentication experience.

---

<div align="center">
  <b><a href="#">Next Module: Active Directory Administration</a></b><br>
  <i>Creating Organizational Units (OUs), domain users, security groups, and designing an enterprise Active Directory structure.</i>
</div>
