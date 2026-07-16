<div align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&color=gradient&customColorList=0,2&height=250&section=header&text=User%20Lifecycle%20Automation&fontSize=42&fontAlignY=35&desc=Module%2013%20%7C%20PowerShell%20Onboarding%20Automation&descSize=20&descAlignY=55" alt="User Lifecycle Automation Banner" width="100%">
</div>

---

# Overview

This module documents the development of a PowerShell-based User Lifecycle Automation solution within a Windows Server 2025 Active Directory environment.

The objective was to simulate a real-world enterprise onboarding workflow by importing employee records from a CSV file, validating user information, generating usernames, assigning Organizational Units (OUs), mapping Security Groups, generating reports, and preparing employee accounts for provisioning.

This implementation reflects how enterprise IT teams automate repetitive onboarding tasks to improve consistency, reduce administrative overhead, and accelerate employee provisioning.

---

# Business Scenario

The Human Resources department submits employee onboarding requests through standardized forms and spreadsheets.

The Infrastructure Team is responsible for:

- Validating employee information
- Generating usernames
- Assigning Organizational Units
- Assigning Security Groups
- Preventing duplicate accounts
- Producing onboarding reports

To reduce manual administration and human error, PowerShell automation is used to process onboarding requests consistently and efficiently.

---

# Learning Objectives

By completing this module, the following competencies were demonstrated:

- CSV Data Processing
- PowerShell Automation
- Active Directory User Validation
- Username Generation
- Department-Based Access Control
- Organizational Unit Assignment
- Security Group Mapping
- Report Generation
- Enterprise User Provisioning Workflows
- Administrative Automation

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
| User Source | Employees.csv |
| Report Output | SuccessReport.csv / ErrorReport.csv |

---

# Organizational Structure

## Departments

```text
HR
IT
Finance
Sales
Management
```

## Security Groups

```text
SG-HR-Users
SG-IT-Users
SG-Finance-Users
SG-Sales-Users
SG-Management-Users
```

---

# Step-by-Step Implementation

---

## Step 1 — Active Directory Environment

Verified Active Directory environment and organizational structure before automation development.

<p align="center">
<img src="/01-Identity-and-Access-Management/13-User-Lifecycle-Automation/Evidence/Screenshots/01-AD-Module.png" width="900">
</p>

---

## Step 2 — Review Organizational Units

Validated department-specific Organizational Units used for automated placement.

<p align="center">
<img src="/01-Identity-and-Access-Management/13-User-Lifecycle-Automation/Evidence/Screenshots/02-OU-Structure.png" width="900">
</p>

---

## Step 3 — Review Security Groups

Validated department-specific security groups used for access management.

<p align="center">
<img src="/01-Identity-and-Access-Management/13-User-Lifecycle-Automation/Evidence/Screenshots/03-Security-Groups.png" width="900">
</p>

---

## Step 4 — Prepare Project Structure

Created the automation project directory structure containing scripts, reports, and onboarding datasets.

<p align="center">
<img src="/01-Identity-and-Access-Management/13-User-Lifecycle-Automation/Evidence/Screenshots/04-Project-Folder.png" width="900">
</p>

---

## Step 5 — Create Employee Dataset

Created Employees.csv containing employee onboarding information.

Fields included:

```text
FirstName
LastName
Department
JobTitle
```

<p align="center">
<img src="/01-Identity-and-Access-Management/13-User-Lifecycle-Automation/Evidence/Screenshots/05-Employees-CSV.png" width="900">
</p>

---

## Step 6 — Validate CSV Import

Imported employee records using PowerShell to verify data integrity.

<p align="center">
<img src="/01-Identity-and-Access-Management/13-User-Lifecycle-Automation/Evidence/Screenshots/06-CSV-Validation.png" width="900">
</p>

---

## Step 7 — Generate Usernames

Automatically generated usernames based on employee first and last names.

Example:

```text
Kevin Reyes
↓
kevin.reyes
```

<p align="center">
<img src="/01-Identity-and-Access-Management/13-User-Lifecycle-Automation/Evidence/Screenshots/07-Username-Generation.png" width="900">
</p>

---

## Step 8 — Department Mapping

Mapped departments to Organizational Units and Security Groups.

Example:

```text
IT
↓
OU=Users,OU=IT,OU=Company
↓
SG-IT-Users
```

<p align="center">
<img src="/01-Identity-and-Access-Management/13-User-Lifecycle-Automation/Evidence/Screenshots/08-Department-Mapping.png" width="900">
</p>

---

## Step 9 — Existing User Validation

Validated Active Directory accounts to prevent duplicate user creation.

<p align="center">
<img src="/01-Identity-and-Access-Management/13-User-Lifecycle-Automation/Evidence/Screenshots/09-Existing-User-Check.png" width="900">
</p>

---

## Step 10 — Generate Success Report

Successfully processed records were exported to SuccessReport.csv.

<p align="center">
<img src="/01-Identity-and-Access-Management/13-User-Lifecycle-Automation/Evidence/Screenshots/10-Success-Report-Generated.png" width="900">
</p>

---

## Step 11 — Generate Error Report

Invalid or duplicate records were exported to ErrorReport.csv.

<p align="center">
<img src="/01-Identity-and-Access-Management/13-User-Lifecycle-Automation/Evidence/Screenshots/11-Error-Report-Generated.png" width="900">
</p>

---

## Step 12 — Generate Temporary Passwords

Temporary onboarding passwords were generated for employee provisioning.

<p align="center">
<img src="/01-Identity-and-Access-Management/13-User-Lifecycle-Automation/Evidence/Screenshots/12-Password-Generation.png" width="900">
</p>

---

## Step 13 — Create Active Directory Accounts

Automated creation of Active Directory user accounts.

<p align="center">
<img src="/01-Identity-and-Access-Management/13-User-Lifecycle-Automation/Evidence/Screenshots/13-AD-Account-Creation.png" width="900">
</p>

---

## Step 14 — Assign Security Groups

Automatically assigned users to department-specific security groups.

<p align="center">
<img src="/01-Identity-and-Access-Management/13-User-Lifecycle-Automation/Evidence/Screenshots/14-Security-Group-Assignment.png" width="900">
</p>

---

## Step 15 — Verify Organizational Unit Placement

Validated successful placement of users into department-specific Organizational Units.

<p align="center">
<img src="/01-Identity-and-Access-Management/13-User-Lifecycle-Automation/Evidence/Screenshots/15-Users-Created-In-OU.png" width="900">
</p>

---

# Automation Workflow

```text
Employees.csv
        │
        ▼
Import CSV
        │
        ▼
Generate Username
        │
        ▼
Validate Department
        │
        ▼
Assign OU
        │
        ▼
Assign Security Group
        │
        ▼
Check Existing User
        │
        ▼
Generate Reports
        │
        ▼
Generate Temporary Password
        │
        ▼
Provision Active Directory User
```

---

# Validation Results

| Validation Check | Status |
|------------------|--------|
| CSV Imported Successfully | ✅ |
| Username Generation Completed | ✅ |
| Department Mapping Completed | ✅ |
| Security Group Mapping Completed | ✅ |
| Existing User Validation Completed | ✅ |
| Success Report Generated | ✅ |
| Error Report Generated | ✅ |
| Temporary Password Generated | ✅ |
| Active Directory User Created | ✅ |
| OU Placement Verified | ✅ |
| Security Group Membership Verified | ✅ |

---

# Skills Demonstrated

- PowerShell Automation
- Active Directory Administration
- CSV Data Processing
- User Lifecycle Management
- Organizational Unit Administration
- Security Group Administration
- Administrative Reporting
- Identity Management
- Enterprise Onboarding Workflows
- IT Operations Automation

---

# Key Takeaways

This module demonstrated how PowerShell can automate repetitive onboarding tasks commonly performed by Enterprise System Administrators.

By combining CSV processing, Active Directory validation, Security Group assignment, Organizational Unit mapping, and reporting capabilities, employee onboarding can be standardized, accelerated, and managed consistently across the organization.

The project reflects real-world user provisioning workflows used in enterprise IT environments and serves as a foundation for future automation projects such as Offboarding Automation, Compliance Reporting, and Active Directory Auditing.

---

<div align="center">

### Module Status

✅ Completed Successfully

**Next Module:** Real SysAdmin PowerShell Tasks

</div>
