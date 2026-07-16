<div align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&color=gradient&customColorList=0,2&height=250&section=header&text=Offboarding%20Automation&fontSize=42&fontAlignY=35&desc=Module%2014%20%7C%20Active%20Directory%20Deprovisioning&descSize=20&descAlignY=55" alt="Offboarding Automation Banner" width="100%">
</div>

---

# Overview

This module documents the development of an Active Directory Offboarding Automation solution using PowerShell.

The objective was to automate employee deprovisioning by importing terminated employee records from a CSV file, validating Active Directory accounts, disabling user access, removing security group memberships, relocating accounts to a Disabled Users Organizational Unit, and generating audit reports.

This implementation reflects how enterprise IT teams securely remove user access while maintaining proper documentation and audit trails.

---

# Business Scenario

When an employee leaves the organization, IT must immediately revoke access to company resources.

Traditionally, administrators manually:

- Disable accounts
- Remove security groups
- Move users to archive locations
- Generate reports

Manual offboarding introduces delays and security risks.

To reduce human error and improve operational efficiency, PowerShell automation is used to standardize the offboarding process.

---

# Learning Objectives

By completing this module, the following competencies were demonstrated:

- Active Directory User Management
- User Deprovisioning
- PowerShell Automation
- Security Group Administration
- Organizational Unit Administration
- Administrative Reporting
- CSV Processing
- Identity and Access Management
- Enterprise Offboarding Workflows
- Audit Trail Generation

---

# Lab Environment Specifications

| Component | Configuration |
|------------|------------|
| Server Name | SRV01 |
| Client Device | CLIENT01 |
| Operating System | Windows Server 2025 Standard Evaluation |
| Client OS | Windows 11 Enterprise |
| Domain | homelab.local |
| Automation Tool | PowerShell 5.1 |
| User Source | TerminatedEmployees.csv |
| Report Output | OffboardingReport.csv |

---

# Organizational Structure

## Disabled Users OU

```text
OU=Disabled Users
OU=Company
DC=homelab
DC=local
```

This Organizational Unit is used to archive deactivated user accounts after offboarding.

---

# Step-by-Step Implementation

---

## Step 1 — Prepare Offboarding Project Structure

Created the project structure containing scripts, employee datasets, reports, and evidence.

<p align="center">
<img src="/01-Identity-and-Access-Management/14-Offboarding-Automation/Evidence/Screenshots/01-Offboarding-Project-Folder.png" width="900">
</p>

---

## Step 2 — Create Terminated Employee Dataset

Created a CSV file containing employee records scheduled for offboarding.

Fields included:

```text
FirstName
LastName
Username
```

<p align="center">
<img src="/01-Identity-and-Access-Management/14-Offboarding-Automation/Evidence/Screenshots/02-TerminatedEmployees-CSV.png" width="900">
</p>

---

## Step 3 — Import Employee Records

Imported employee records into PowerShell using Import-Csv.

This validates that employee data can be processed correctly before administrative actions occur.

<p align="center">
<img src="/01-Identity-and-Access-Management/14-Offboarding-Automation/Evidence/Screenshots/03-TerminatedEmployees-Import.png" width="900">
</p>

---

## Step 4 — Validate Active Directory Accounts

Validated that specified users existed in Active Directory before processing.

<p align="center">
<img src="/01-Identity-and-Access-Management/14-Offboarding-Automation/Evidence/Screenshots/04-Offboarding-User-Validation.png" width="900">
</p>

---

## Step 5 — Create Disabled Users Organizational Unit

Created a dedicated Organizational Unit used for storing disabled accounts.

This ensures proper segregation and management of inactive users.

<p align="center">
<img src="/01-Identity-and-Access-Management/14-Offboarding-Automation/Evidence/Screenshots/05-Disabled-Users-OU.png" width="900">
</p>

---

## Step 6 — Disable Active Directory Accounts

Automatically disabled user accounts identified within the offboarding dataset.

This immediately revoked user authentication access.

<p align="center">
<img src="/01-Identity-and-Access-Management/14-Offboarding-Automation/Evidence/Screenshots/06-Disable-Accounts.png" width="900">
</p>

---

## Step 7 — Verify Account Disablement

Validated that employee accounts were successfully disabled.

Expected result:

```text
Enabled : False
```

<p align="center">
<img src="/01-Identity-and-Access-Management/14-Offboarding-Automation/Evidence/Screenshots/07-Accounts-Disabled-Verification.png" width="900">
</p>

---

## Step 8 — Remove Security Group Memberships

Removed user memberships from department-specific security groups.

This prevents continued access to protected resources.

<p align="center">
<img src="/01-Identity-and-Access-Management/14-Offboarding-Automation/Evidence/Screenshots/08-Security-Groups-Removed.png" width="900">
</p>

---

## Step 9 — Move Accounts to Disabled Users OU

Relocated disabled accounts into the Disabled Users Organizational Unit.

This provides administrative separation and simplifies account management.

<p align="center">
<img src="/01-Identity-and-Access-Management/14-Offboarding-Automation/Evidence/Screenshots/09-Users-Moved-To-Disabled-OU.png" width="900">
</p>

---

## Step 10 — Generate Offboarding Report

Generated OffboardingReport.csv documenting completed actions.

Report fields:

```text
Username
Status
GroupsRemoved
MovedToOU
```

<p align="center">
<img src="/01-Identity-and-Access-Management/14-Offboarding-Automation/Evidence/Screenshots/10-Offboarding-Report.png" width="900">
</p>

---

# Offboarding Workflow

```text
TerminatedEmployees.csv
            │
            ▼
Import CSV
            │
            ▼
Validate User
            │
            ▼
Disable Account
            │
            ▼
Remove Security Groups
            │
            ▼
Move To Disabled Users OU
            │
            ▼
Generate Report
```

---

# Validation Results

| Validation Check | Status |
|------------------|--------|
| CSV Imported Successfully | ✅ |
| User Validation Completed | ✅ |
| Disabled Users OU Created | ✅ |
| Accounts Disabled | ✅ |
| Account Disablement Verified | ✅ |
| Security Groups Removed | ✅ |
| Users Moved To Disabled OU | ✅ |
| Offboarding Report Generated | ✅ |

---

# Skills Demonstrated

- Active Directory Administration
- User Deprovisioning
- PowerShell Automation
- Identity and Access Management
- Security Group Administration
- Organizational Unit Management
- CSV Processing
- Administrative Reporting
- Enterprise Offboarding
- IT Operations Automation

---

# Key Takeaways

This module demonstrated how PowerShell can automate enterprise offboarding processes within Active Directory.

By combining account disablement, security group removal, Organizational Unit relocation, and reporting capabilities, organizations can reduce administrative overhead while improving security and compliance.

The implementation reflects real-world deprovisioning workflows used by enterprise IT Operations and System Administration teams.

---

<div align="center">

### Module Status

✅ Completed Successfully

**Next Module:** Active Directory Auditing

</div>
