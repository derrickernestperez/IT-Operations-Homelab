<div align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&color=gradient&customColorList=0,2&height=250&section=header&text=File%20Server%20Auditing&fontSize=42&fontAlignY=35&desc=Module%2019%20%7C%20NTFS%20and%20Share%20Permission%20Auditing&descSize=20&descAlignY=55" alt="File Server Auditing Banner" width="100%">
</div>

---

# Overview

This module documents the implementation of File Server Auditing within the Windows Server environment.

The objective was to audit departmental file shares, review NTFS permissions, export access reports, and validate file access controls across the organization.

This implementation simulates how enterprise administrators perform permission reviews, compliance checks, and security audits of shared resources.

---

# Business Scenario

Management requires visibility into file share access and permissions to ensure that users only have access to resources appropriate for their department.

The Infrastructure Team must review departmental shares, validate NTFS permissions, and generate audit reports that can be used for compliance and security reviews.

This process helps reduce unauthorized access and supports enterprise governance requirements.

---

# Learning Objectives

By completing this module, the following competencies were demonstrated:

- NTFS Permission Auditing
- File Share Security Reviews
- PowerShell Automation
- Access Control Validation
- CSV Reporting
- Security Compliance
- File Services Administration
- Windows Server Management

---

# Lab Environment Specifications

| Component | Configuration |
|------------|------------|
| Server Name | SRV01 |
| Operating System | Windows Server 2025 Standard Evaluation |
| Domain | homelab.local |
| File Server | SRV01 |
| Audit Tool | PowerShell |
| Report Format | CSV |
| Shares Audited | HR, Finance, IT, Sales |

---

# Folder Structure

```text
19-File-Server-Auditing
│
├── README.md
│
├── Scripts
│   └── FileAudit.ps1
│
├── Reports
│   └── SharePermissions.csv
│
└── Evidence
    └── Screenshots
        ├── 01-Project-Folder.png
        ├── 02-Create-Audit-Script.png
        ├── 03-Run-Audit-Script.png
        ├── 04-HR-Share-Permissions.png
        ├── 05-Finance-Share-Permissions.png
        ├── 06-Export-CSV-Report.png
        ├── 07-SharePermissions-CSV.png
        └── 08-Module-Complete.png
```

---

# Step-by-Step Implementation

---

## Step 1 — Create Project Structure

Created folders for scripts, reports, and evidence.

<p align="center">
<img src="/01-Identity-and-Access-Management/19-File-Server-Auditing/Evidence/Screenshots/01-Project-Folder.png" width="900">
</p>

---

## Step 2 — Create File Audit Script

Developed a PowerShell script to audit departmental file shares and export permission information.

The script captures:

- Folder Name
- Security Principal
- Permission Level
- Access Type

<p align="center">
<img src="/01-Identity-and-Access-Management/19-File-Server-Auditing/Evidence/Screenshots/02-Create-Audit-Script.png" width="900">
</p>

---

## Step 3 — Execute Audit Script

Executed the PowerShell audit script to collect file share permissions.

The script successfully processed all departmental shares and generated a report.

<p align="center">
<img src="/01-Identity-and-Access-Management/19-File-Server-Auditing/Evidence/Screenshots/03-Run-Audit-Script.png" width="900">
</p>

---

## Step 4 — Review HR Share Permissions

Validated NTFS permissions assigned to the HR department share.

Confirmed access controls matched organizational requirements.

<p align="center">
<img src="/01-Identity-and-Access-Management/19-File-Server-Auditing/Evidence/Screenshots/04-HR-Share-Permission.png" width="900">
</p>

---

## Step 5 — Review Finance Share Permissions

Validated NTFS permissions assigned to the Finance department share.

Confirmed appropriate security groups maintained access.

<p align="center">
<img src="/01-Identity-and-Access-Management/19-File-Server-Auditing/Evidence/Screenshots/05-Finance-Share-Permissions.png" width="900">
</p>

---

## Step 6 — Export Permission Report

Verified successful creation of the audit report.

Generated file:

```text
SharePermissions.csv
```

<p align="center">
<img src="/01-Identity-and-Access-Management/19-File-Server-Auditing/Evidence/Screenshots/06-Export-CSV-Report.png" width="900">
</p>

---

## Step 7 — Validate CSV Report

Reviewed exported permission data.

Verified:

- Folder Path
- Identity Reference
- Permission Level
- Access Type

<p align="center">
<img src="/01-Identity-and-Access-Management/19-File-Server-Auditing/Evidence/Screenshots/07-SharePermissions-CSV.png" width="900">
</p>

---

## Step 8 — Final Validation

Validated complete File Server Auditing deployment.

Confirmed:

- Audit Script Execution
- Permission Collection
- CSV Export
- Security Review Completion

<p align="center">
<img src="/01-Identity-and-Access-Management/19-File-Server-Auditing/Evidence/Screenshots/08-Module-Complete.png" width="900">
</p>

---

# Auditing Workflow

```text
Department Shares
        │
        ▼
PowerShell Audit Script
        │
        ▼
NTFS Permission Collection
        │
        ▼
SharePermissions.csv
        │
        ▼
Administrative Review
```

---

# Validation Results

| Validation Check | Status |
|------------------|--------|
| Project Structure Created | ✅ |
| Audit Script Created | ✅ |
| Audit Script Executed | ✅ |
| HR Share Reviewed | ✅ |
| Finance Share Reviewed | ✅ |
| CSV Report Generated | ✅ |
| Report Validated | ✅ |
| File Server Audit Completed | ✅ |

---

# Skills Demonstrated

- Windows File Services
- NTFS Permissions
- Share Permissions
- Access Control Reviews
- PowerShell Automation
- Security Auditing
- CSV Reporting
- Windows Server Administration
- IT Operations

---

# Key Takeaways

This module demonstrated how administrators can audit file shares and validate access permissions using PowerShell automation.

By exporting permission information into structured reports, administrators gain visibility into access control assignments and can perform compliance reviews more efficiently.

This reflects real-world enterprise practices where file server audits are routinely performed to support security, compliance, and governance initiatives.

---

<div align="center">

### Module Status

✅ Completed Successfully

**Next Module:** Backup & Disaster Recovery

</div>
