# Enterprise IT Operations & Security Homelab

**Objective:** To design, build, and secure a realistic corporate IT environment. This lab demonstrates hands-on experience with Active Directory, Role-Based Access Control (RBAC), Group Policy (GPO), centralized file sharing, and core network services.

---

## 📁 Repository Directory
* **[Network-Infrastructure](./Network-Infrastructure/)**: DHCP/DNS scopes and topology diagrams.
* **[Active-Directory](./Active-Directory/)**: OU hierarchy, security groups, and user provisioning data.
* **[Group-Policy-Objects](./Group-Policy-Objects/)**: Applied GPO configurations (Drive Maps, UAC Hardening).
* **[Hybrid-Cloud-Sync](./Hybrid-Cloud-Sync/)**: Entra ID synchronization logs.
* **[ITSM-Ticketing](./ITSM-Ticketing/)**: Jira Service Management incident workflows.
* **[Scripts-Automation](./Scripts-Automation/)**: PowerShell scripts for automation.

---

## 🏢 Phase 1: Core Identity Architecture & RBAC

**What I Built:**
I configured Windows Server 2022 as a Domain Controller and built out a realistic company directory from scratch. 
* Designed a tiered Organizational Unit (OU) structure for `HR`, `IT`, and `Sales` to keep users and computers organized.
* Provisioned specific employee accounts and placed them into Global Security Groups to manage their permissions centrally.

**Why It Matters:** 
Instead of assigning permissions to individuals one by one, using Role-Based Access Control (RBAC) ensures that access rights automatically follow a user's job title. 

| Employee Name | Department | Privilege Level | Logon Name | Security Group |
| :--- | :--- | :--- | :--- | :--- |
| **Derrick Perez** | IT Department | Domain Administrator | `admin-dperez` | `GG-IT-Helpdesk` |
| **Jane Doe** | HR Department | Standard User | `jdoe` | `GG-HR-Security` |
| **John Smith** | Sales Department | Standard User | `jsmith` | `GG-Sales-Metrics` |

![Active Directory OU Structure](./Active-Directory/active-directory-ou.png)
![Global Security Groups Configuration](./Active-Directory/security-groups.jpg)

---

## 🔒 Phase 2: Endpoint Hardening & Group Policy

**What I Built:**
I joined a Windows 11 virtual machine to the domain and locked it down using Group Policy Objects (GPOs) to enforce the "Principle of Least Privilege."
* **UAC Hardening:** Standard users (Jane and John) are blocked from running programs as an Administrator. The system triggers a Secure Desktop prompt requiring IT credentials. My IT account (`admin-dperez`) bypasses this restriction seamlessly.
* **Policy Verification:** I utilized "Hot Desking" (logging into the same machine as different users) and ran `gpresult /r` in the command line to prove the security policies successfully hit the targeted user.

**Why It Matters:**
This shrinks the attack surface. If a standard user accidentally downloads malware, the restricted account blocks the malware from silently installing itself with administrative rights.

![Command Prompt UAC Secure Desktop Interception](./Group-Policy-Objects/cmd-uac-prompt.png)
![GPResult Verification for Mapped Policies](./Group-Policy-Objects/gpresult-verification.jpg)

---

## 📂 Phase 3: Centralized Data Silos & Automation

**What I Built:**
I created a corporate file server to allow employees to share files, but strictly separated the data so departments cannot see each other's private work.
* **The "Two Doors" Model:** I used *Share Permissions* to broadcast the folder to the network, but used strict *NTFS Permissions* to lock the actual contents inside so only the Sales Security Group can view it.
* **GPO Automation:** I created a Drive Mapping Group Policy that automatically connects the `S:` Drive to John Smith's computer as soon as he logs in, without him needing to know the server's network address.

**Why It Matters:**
It makes data access effortless for employees while preventing critical information leakage between different business departments.

![Successful Deployment of Mapped Sales Shared S: Drive](./Group-Policy-Objects/mapped-s-drive.jpg)

---

## 🌐 Phase 4: Core Networking Services (DHCP/DNS)
*(Status: In Progress - Deploying automated IP allocation and DNS forwarders)*

## 🎫 Phase 5: ITSM Ticket Lifecycle Integration (Jira)
*(Status: Pending - Engineering incident management workflows)*

## 🛡️ Phase 6: Enterprise Security Hardening (Windows LAPS)
*(Status: Pending - Deploying Local Administrator Password Solution)*

## ☁️ Phase 7: Hybrid Cloud Operations (Entra ID)
*(Status: Pending - Synchronizing on-premises AD to Microsoft 365)*

## 📝 Phase 8: Data Audit Trails & Forensic Compliance
*(Status: Pending - Configuring Object Access auditing for file modifications)*
