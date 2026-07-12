---

# Section 6 — Department File Shares and Access Control

## Step 20 — Create Department File Share Structure

Created dedicated departmental folders on the Domain Controller to store business data for each department.

The following shares were created:

* HR
* Finance
* IT
* Sales

This structure allows departments to maintain separate storage locations while supporting centralized administration.

<p align="center">
<img src="/01-Identity-and-Access-Management/06-Group-Policy-Hardening/Evidence/Screenshots/24-Department-Share-Folders.png" width="800">
</p>

---

## Step 21 — Configure SMB Share Settings

Configured Advanced Sharing settings for the HR departmental share.

This process was later repeated for Finance, IT, and Sales.

<p align="center">
<img src="/01-Identity-and-Access-Management/06-Group-Policy-Hardening/Evidence/Screenshots/25-HR-Advanced-Sharing.png" width="800">
</p>

---

## Step 22 — Configure Share Permissions

Removed broad access permissions and granted access only to the appropriate Active Directory Security Group.

This approach helps reduce unnecessary exposure of departmental data.

<p align="center">
<img src="/01-Identity-and-Access-Management/06-Group-Policy-Hardening/Evidence/Screenshots/26-HR-Share-Permissions.png" width="800">
</p>

---

## Step 23 — Review NTFS Security Configuration

Reviewed the default NTFS permissions applied to the HR departmental folder.

<p align="center">
<img src="/01-Identity-and-Access-Management/06-Group-Policy-Hardening/Evidence/Screenshots/27-Advanced-Security-Settings-HR.png" width="800">
</p>

---

## Step 24 — Disable Permission Inheritance

Disabled inherited permissions and converted existing permissions into explicit entries.

This provides greater control over departmental resource access.

<p align="center">
<img src="/01-Identity-and-Access-Management/06-Group-Policy-Hardening/Evidence/Screenshots/28-Disable-Inheritance-HR.png" width="800">
</p>

---

## Step 25 — Implement Department-Based NTFS Permissions

Configured NTFS permissions to ensure only authorized departmental users can access HR resources.

This configuration follows the Principle of Least Privilege (PoLP).

<p align="center">
<img src="/01-Identity-and-Access-Management/06-Group-Policy-Hardening/Evidence/Screenshots/29-HR-Final-NTFS-Permissions.png" width="800">
</p>

---

## Step 26 — Validate Authorized Access

Verified that authorized users could successfully access their assigned departmental resources.

<p align="center">
<img src="/01-Identity-and-Access-Management/06-Group-Policy-Hardening/Evidence/Screenshots/30-HR-Share-Access-Success.png" width="800">
</p>

---

## Step 27 — Validate Access Restrictions

Attempted to access resources outside of the assigned department.

The access request was denied as expected, confirming successful implementation of access controls.

<p align="center">
<img src="/01-Identity-and-Access-Management/06-Group-Policy-Hardening/Evidence/Screenshots/31-Unauthorized-Access-Denied.png" width="800">
</p>

---

## Step 28 — Confirm Department Resource Availability

Verified successful access to approved departmental resources after permission validation.

<p align="center">
<img src="/01-Identity-and-Access-Management/06-Group-Policy-Hardening/Evidence/Screenshots/32-HR-Share-Access-Granted.png" width="800">
</p>

---

# Section 7 — Drive Mapping with Group Policy Preferences

## Step 29 — Open Group Policy Management for Drive Mapping

Opened Group Policy Management to begin automating departmental drive assignments.

<p align="center">
<img src="/01-Identity-and-Access-Management/06-Group-Policy-Hardening/Evidence/Screenshots/33-Open-Group-Policy-Management-Drive-Mapping.png" width="800">
</p>

---

## Step 30 — Create Department Drive Mapping GPO

Created a dedicated Group Policy Object for departmental drive mapping.

<p align="center">
<img src="/01-Identity-and-Access-Management/06-Group-Policy-Hardening/Evidence/Screenshots/34-Create-HR-Drive-Mapping-GPO.png" width="800">
</p>

---

## Step 31 — Configure Drive Mapping Preferences

Configured Drive Maps using Group Policy Preferences.

Mapped departmental resources to drive letters for simplified user access.

<p align="center">
<img src="/01-Identity-and-Access-Management/06-Group-Policy-Hardening/Evidence/Screenshots/35-HR-Drive-Maps-Node.png" width="800">
</p>

---

## Step 32 — Configure Department Network Drive

Configured the HR departmental share to automatically map as a network drive.

<p align="center">
<img src="/01-Identity-and-Access-Management/06-Group-Policy-Hardening/Evidence/Screenshots/36-HR-Mapped-Drive-General-Settings.png" width="800">
</p>

---

## Step 33 — Enable Item-Level Targeting

Enabled Item-Level Targeting to ensure drive mappings are delivered only to the intended users.

<p align="center">
<img src="/01-Identity-and-Access-Management/06-Group-Policy-Hardening/Evidence/Screenshots/37-HR-Item-Level-Targeting-Enabled.png" width="800">
</p>

---

## Step 34 — Configure Security Group Filtering

Applied Security Group targeting to ensure only HR users receive the HR departmental drive.

<p align="center">
<img src="/01-Identity-and-Access-Management/06-Group-Policy-Hardening/Evidence/Screenshots/38-HR-Security-Group-Targeting.png" width="800">
</p>

---

## Step 35 — Link the Drive Mapping GPO

Linked the Drive Mapping GPO to the appropriate Organizational Unit.

<p align="center">
<img src="/01-Identity-and-Access-Management/06-Group-Policy-Hardening/Evidence/Screenshots/39-Link-HR-Drive-Mapping-GPO.png" width="800">
</p>

---

## Step 36 — Validate Automatic Drive Mapping

Verified successful drive mapping after user logon and Group Policy processing.

<p align="center">
<img src="/01-Identity-and-Access-Management/06-Group-Policy-Hardening/Evidence/Screenshots/40-HR-Drive-Mapped-Successfully.png" width="800">
</p>

---

## Step 37 — Verify Network Drive Assignment

Confirmed drive assignment through command-line validation.

<p align="center">
<img src="/01-Identity-and-Access-Management/06-Group-Policy-Hardening/Evidence/Screenshots/41-Net-Use-HR-Drive-Mapping.png" width="800">
</p>

---

## Step 38 — Configure Department-Wide Drive Mapping Strategy

Implemented drive mappings for all departments using Security Group filtering and Item-Level Targeting.

Drive assignments:

| Department | Drive Letter |
|------------|------------|
| HR | H: |
| Finance | F: |
| IT | I: |
| Sales | S: |

<p align="center">
<img src="/01-Identity-and-Access-Management/06-Group-Policy-Hardening/Evidence/Screenshots/42-All-Department-Drive-Mappings.png" width="800">
</p>

---

## Step 39 — Validate Principle of Least Privilege

Verified that users only received access to resources associated with their department.

The IT user received only the IT departmental drive while access to other departmental resources remained restricted.

<p align="center">
<img src="/01-Identity-and-Access-Management/06-Group-Policy-Hardening/Evidence/Screenshots/43-IT-User-Receives-Only-IT-Drive.png" width="800">
</p>

---

# Security Outcomes

This module demonstrates the implementation of multiple enterprise security controls:

* Group Policy Administration
* Endpoint Security Baselines
* Password Policy Enforcement
* USB Device Restrictions
* Workstation Lock Controls
* Departmental Data Segregation
* NTFS Permission Hardening
* Role-Based Access Control (RBAC)
* Drive Mapping Automation
* Item-Level Targeting
* Principle of Least Privilege (PoLP)
* Insider Threat Mitigation

---

# Skills Demonstrated

* Active Directory Domain Services (AD DS)
* Group Policy Management
* Windows Security Administration
* SMB File Share Administration
* NTFS Permission Management
* Security Group Administration
* Identity and Access Management (IAM)
* Endpoint Hardening
* Principle of Least Privilege
* Security Operations Center (SOC) Fundamentals

---

<div align="center">
<b><a href="../07-Folder-Redirection/">Next Module — Folder Redirection & Centralized User Data Management</a></b><br>
<i>Redirecting user data to centralized storage for backup, recovery, and enterprise data protection.</i>
</div>
