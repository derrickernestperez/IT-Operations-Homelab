<div align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&color=gradient&customColorList=0,2&height=250&section=header&text=Active%20Directory%20Auditing&fontSize=42&fontAlignY=35&desc=Module%2015%20%7C%20Identity%20Monitoring%20and%20Reporting&descSize=20&descAlignY=55" alt="Active Directory Auditing Banner" width="100%">
</div>

---

# Overview

This module documents the development of an Active Directory Auditing solution using PowerShell.

The objective was to automate the collection of Active Directory information and generate audit reports for administrative review.

The solution gathers information regarding:

- Disabled Users
- Security Groups
- Organizational Units
- Active Directory Structure

and exports the data into CSV reports for operational visibility and auditing purposes.

---

# Business Scenario

System Administrators regularly perform audits to answer questions such as:

- Which user accounts are disabled?
- Which security groups exist?
- What Organizational Units are configured?
- What Active Directory objects currently exist?

Manually collecting this information is time-consuming and prone to human error.

To improve efficiency and visibility, PowerShell automation was used to generate repeatable audit reports.

---

# Learning Objectives

By completing this module, the following competencies were demonstrated:

- Active Directory Auditing
- PowerShell Automation
- Administrative Reporting
- CSV Export Operations
- Organizational Unit Enumeration
- Security Group Enumeration
- Identity Administration
- IT Operations Reporting
- Windows Server Administration
- Active Directory Analysis

---

# Lab Environment Specifications

| Component | Configuration |
|------------|------------|
| Server Name | SRV01 |
| Operating System | Windows Server 2025 Standard Evaluation |
| Domain | homelab.local |
| Automation Tool | PowerShell 5.1 |
| Directory Service | Active Directory Domain Services |
| Report Format | CSV |
| Report Storage | Reports Folder |

---

# Folder Structure

```text
15-Active-Directory-Auditing
│
├── README.md
│
├── Scripts
│   └── ADAudit.ps1
│
├── Reports
│   ├── DisabledUsers.csv
│   ├── SecurityGroups.csv
│   └── OUSummary.csv
│
└── Evidence
    └── Screenshots
        ├── 01-Audit-Project-Folder.png
        ├── 02-Audit-Script-Execution.png
        ├── 03-Audit-Reports-Generated.png
        ├── 04-Disabled-Users-Report.png
        ├── 05-Security-Groups-Report.png
        ├── 06-OU-Summary-Report.png
        └── 07-Final-Audit-Reports.png
```

---

# Step-by-Step Implementation

---

## Step 1 — Create Project Structure

Created the auditing project structure used to store scripts, reports, and evidence.

<p align="center">
<img src="/01-Identity-and-Access-Management/15-Active-Directory-Auditing/Evidence/Screenshots/01-Audit-Project-Folder.png" width="900">
</p>

---

## Step 2 — Develop Audit Script

Created ADAudit.ps1 to automate Active Directory auditing tasks.

The script collects information from Active Directory and exports the results into CSV reports.

<p align="center">
<img src="/01-Identity-and-Access-Management/15-Active-Directory-Auditing/Evidence/Screenshots/02-Audit-Script-Execution.png" width="900">
</p>

---

## Step 3 — Generate Audit Reports

Executed the audit script and generated multiple reports.

Generated files:

```text
DisabledUsers.csv
SecurityGroups.csv
OUSummary.csv
```

<p align="center">
<img src="/01-Identity-and-Access-Management/15-Active-Directory-Auditing/Evidence/Screenshots/03-Audit-Reports-Generated.png" width="900">
</p>

---

## Step 4 — Review Disabled Users Report

Reviewed disabled accounts discovered during the audit process.

This report provides visibility into inactive user accounts.

<p align="center">
<img src="/01-Identity-and-Access-Management/15-Active-Directory-Auditing/Evidence/Screenshots/04-Disabled-Users-Report.png" width="900">
</p>

---

## Step 5 — Review Security Groups Report

Reviewed Active Directory security groups.

This report assists with access control reviews and identity audits.

<p align="center">
<img src="/01-Identity-and-Access-Management/15-Active-Directory-Auditing/Evidence/Screenshots/05-Security-Groups-Report.png" width="900">
</p>

---

## Step 6 — Review Organizational Unit Report

Reviewed the Organizational Unit hierarchy.

This report provides visibility into the Active Directory structure.

<p align="center">
<img src="/01-Identity-and-Access-Management/15-Active-Directory-Auditing/Evidence/Screenshots/06-OU-Summary-Report.png" width="900">
</p>

---

## Step 7 — Final Report Validation

Validated successful report generation and confirmed the presence of all exported files.

<p align="center">
<img src="/01-Identity-and-Access-Management/15-Active-Directory-Auditing/Evidence/Screenshots/07-Final-Audit-Reports.png" width="900">
</p>

---

# Audit Workflow

```text
Active Directory
        │
        ▼
PowerShell Audit Script
        │
        ▼
Collect AD Information
        │
        ▼
Generate CSV Reports
        │
        ▼
Administrative Review
```

---

# Generated Reports

| Report | Purpose |
|----------|----------|
| DisabledUsers.csv | Identify disabled accounts |
| SecurityGroups.csv | Review group structure |
| OUSummary.csv | Review OU hierarchy |

---

# Validation Results

| Validation Check | Status |
|------------------|--------|
| Audit Script Created | ✅ |
| Audit Script Executed | ✅ |
| Disabled User Report Generated | ✅ |
| Security Group Report Generated | ✅ |
| OU Summary Report Generated | ✅ |
| Reports Validated | ✅ |
| Administrative Review Completed | ✅ |

---

# Skills Demonstrated

- Active Directory Administration
- Active Directory Auditing
- PowerShell Automation
- Identity Management
- CSV Reporting
- Organizational Unit Administration
- Security Group Management
- Windows Server Administration
- IT Operations Reporting
- Enterprise Auditing

---

# Key Takeaways

This module demonstrated how PowerShell can be used to automate Active Directory auditing and reporting tasks.

By generating structured reports, administrators can improve visibility, simplify compliance reviews, and reduce manual administrative effort.

The implementation reflects real-world auditing activities commonly performed by System Administrators, IT Operations teams, and Identity & Access Management professionals.

---

<div align="center">

### Module Status

✅ Completed Successfully

**Next Module:** Security Monitoring & Honey Account Detection

</div>
