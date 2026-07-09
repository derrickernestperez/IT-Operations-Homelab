ttps://capsule-render.vercel.app/api?type=waving&color=gradient&customColorList=0,2&height=250&section=header&text=Active%20Directory%20Domain%20Services&fontSize=48&fontAlignY=35&desc=Module%204%20%7C%20Promoting%20SRV01%20to%20a%20Domain%20Controller&descSize=20&descAlignY=55" alt="Active Directory Configuration Banner" width="100%">
--- # Overview This module documents the installation of the **Active Directory Domain Services (AD DS)** role and the promotion of **SRV01** to a Domain Controller. Active Directory is the foundation of enterprise identity and access management in a Windows environment. By deploying AD DS, we transition SRV01 from a standalone workgroup server into the central authentication and management authority for the new homelab domain. This process includes installing the required binaries, configuring a new forest, setting up DNS, and verifying the default directory structure. --- # Business Scenario Following the initial configuration of SRV01, the Infrastructure Team must establish a centralized identity management system. Currently, any deployed servers or client workstations would require localized account management, which is inefficient and unscalable. By promoting SRV01 to a Domain Controller and establishing a new Active Directory forest, the organization can centralize user credentials, enforce security policies via Group Policy, and lay the groundwork for a scalable, enterprise-ready infrastructure. --- # Learning Objectives By the end of this module, I was able to: - Install the Active Directory Domain Services role via Server Manager. - Add required features and management tools associated with AD DS. - Promote a Windows Server to a Domain Controller. - Configure a new Active Directory forest and root domain. - Understand the integration of DNS with Active Directory. - Verify the installation of NTDS and SYSVOL paths. - Navigate standard Active Directory administrative tools. --- # Lab Environment Specifications | Component | Configuration | | :--- | :--- | | **Server Name** | SRV01 | | **Operating System** | Windows Server 2025 Standard Evaluation | | **Domain Name** | `homelab.local` *(Example Domain)* | | **Forest Functional Level** | Windows Server 2025 | | **Domain Functional Level** | Windows Server 2025 | | **Static IP Address** | 192.168.241.10 | | **DNS Server** | 127.0.0.1 (Loopback post-promotion) | --- # Step-by-Step Implementation ## Step 1 — Add Roles and Features Launched the Add Roles and Features wizard from the Server Manager dashboard to begin the installation process. This wizard is the standard method for installing core infrastructure roles on Windows Server.


--- ## Step 2 — Server Selection Selected the local server (SRV01) from the server pool. In a robust environment, Server Manager can be used to deploy roles to remote servers, but for this initial deployment, the local server was chosen.


--- ## Step 3 — Select Server Roles Checked the box for **Active Directory Domain Services** from the list of available server roles.


--- ## Step 4 — Add Required Features When selecting AD DS, Server Manager automatically prompts to install necessary management tools (RSAT: Remote Server Administration Tools). These were accepted and added.


--- ## Step 5 — Promote to Domain Controller After the role installation completed successfully, clicked the post-deployment configuration link to **Promote this server to a domain controller**.


--- ## Step 6 — Deployment Configuration Configured the deployment settings by selecting **Add a new forest**. This establishes the very first domain in the environment. A root domain name (e.g., `homelab.local`) was provided.


--- ## Step 7 — DNS Options Reviewed the DNS Delegation settings. Since this is the first server in a new forest and there is no existing authoritative DNS infrastructure for the chosen domain name, a delegation warning is normal and can be safely ignored.


--- ## Step 8 — NetBIOS Name Verified the auto-populated NetBIOS domain name, which is provided for backward compatibility with legacy applications and older Windows operating systems.


--- ## Step 9 — Active Directory Paths Reviewed the default paths for the Active Directory Database (`NTDS.dit`), Log files, and the SYSVOL folder. These were left at their defaults on the `C:\` drive for this lab environment.


--- ## Step 10 — Review Options Reviewed all configuration choices before proceeding with the promotion. This provides a final opportunity to ensure the domain name, functional levels, and paths are correct.


--- ## Step 11 — Prerequisites Check Ran the prerequisites check to ensure SRV01 met all necessary requirements for promotion. Once all checks passed successfully, the installation was initiated.


--- ## Step 12 — Server Manager After Promotion Following the automatic reboot, Server Manager was opened to verify the successful installation. The dashboard now displays dedicated management tabs for **AD DS** and **DNS**.


--- ## Step 13 — Administrative Tools Opened the Windows Administrative Tools folder (accessible via the Server Manager "Tools" menu) to locate the newly installed Active Directory consoles. These include AD Users and Computers, AD Sites and Services, and AD Domains and Trusts.


--- ## Step 14 — Default Active Directory Structure Launched **Active Directory Users and Computers (ADUC)** to view the default organizational structure. This confirmed the domain was fully operational and ready for the creation of Organizational Units (OUs), Users, and Groups.


--- # Technical Concepts & Justifications ### What is the difference between AD DS and a Domain Controller? **Active Directory Domain Services (AD DS)** is the specific server *role* that provides directory services. A **Domain Controller (DC)** is a server that has the AD DS role installed *and* has been promoted to host a writable copy of the Active Directory database. ### Why does Active Directory require DNS? Active Directory relies entirely on DNS for service discovery. When a client attempts to log in, it queries DNS for Special Service Records (SRV records) to locate an available Domain Controller. Without a properly configured DNS server, Active Directory cannot function. ### What are NTDS and SYSVOL? - **NTDS.dit**: The core Active Directory database file that stores all objects (users, computers, groups, etc.). - **SYSVOL**: A shared directory that stores Group Policy Objects (GPOs) and logon scripts. This folder is replicated automatically to all other Domain Controllers in the domain. --- # Skills Demonstrated - Server Role & Feature Installation - Active Directory Forest Creation - Domain Controller Promotion - DNS Integration and Troubleshooting - Infrastructure Verification - Windows Server Administration - Systems Planning and Deployment --- # Mock Interview Q&A ### Q: What is a Forest Functional Level, and why is it important? > **A:** The Forest Functional Level determines the advanced Active Directory features available within the forest, as well as the minimum Windows Server operating system required for any new Domain Controllers. Once raised, it generally cannot be lowered without restoring from a backup. --- ### Q: Why do you receive a DNS delegation warning during the promotion of a new forest? > **A:** When establishing the root domain in a new environment, there is no parent DNS zone available to create a delegation link. Because we are creating the authoritative zone concurrently with the promotion, this warning is expected and can be safely ignored. --- ### Q: Where is the Active Directory database stored by default? > **A:** By default, the Active Directory database (`NTDS.dit`) is stored in `C:\Windows\NTDS`. ---
Next Module: Active Directory Organizational Structure
Designing and implementing Organizational Units (OUs), Users, and Groups in AD DS.
