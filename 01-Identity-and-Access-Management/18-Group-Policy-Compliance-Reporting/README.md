<div align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&color=gradient&customColorList=0,2&height=250&section=header&text=Group%20Policy%20Compliance%20Reporting&fontSize=42&fontAlignY=35&desc=Module%2018%20%7C%20GPO%20Validation%20and%20Compliance%20Auditing&descSize=20&descAlignY=55" alt="Group Policy Compliance Reporting Banner" width="100%">
</div>

---

# Overview

This module documents the implementation of Group Policy Compliance Reporting within the Windows Server environment.

The objective was to validate Group Policy deployment, generate compliance reports, and document applied policies across domain-joined systems.

This implementation simulates how enterprise IT teams verify policy compliance, audit workstation configurations, and maintain security baselines.

---

# Business Scenario

Management requires confirmation that security and configuration policies are being applied correctly across organizational workstations.

The Infrastructure Team must generate Group Policy reports, validate applied settings, and maintain documentation for compliance and auditing purposes.

This process ensures that administrative and security policies remain enforced throughout the environment.

---

# Learning Objectives

By completing this module, the following competencies were demonstrated:

- Group Policy Validation
- GPO Auditing
- Compliance Reporting
- GPResult Analysis
- HTML Report Generation
- CSV Reporting
- PowerShell Automation
- Enterprise Documentation

---

# Lab Environment Specifications

| Component | Configuration |
|------------|------------|
| Server Name | SRV01 |
| Client Device | CLIENT01 |
| Operating System | Windows Server 2025 Standard Evaluation |
| Client OS | Windows 11 Enterprise |
| Domain | homelab.local |
| Reporting Tool | GPResult |
| Script | GPOCompliance.ps1 |
| Output Formats | HTML, CSV |

---

# Folder Structure

```text
18-Group-Policy-Compliance-Reporting
│
├── README.md
│
├── Scripts
│   └── GPOCompliance.ps1
│
├── Reports
│   ├── GPResult.html
│   └── ComplianceReport.csv
│
└── Evidence
    └── Screenshots
        ├── 01-Project-Folder.png
        ├── 02-Create-Compliance-Script.png
        ├── 03-Run-GPResult.png
        ├── 04-Generate-HTML-Report.png
        ├── 05-Open-GPResult-Report.png
        ├── 06-Create-Compliance-CSV.png
        ├── 07-Compliance-Report-Generated.png
        └── 08-Module-Complete.png
```

---

# Step-by-Step Implementation

---

## Step 1 — Create Project Structure

Created folders for scripts, reports, and evidence.

<p align="center">
<img src="/01-Identity-and-Access-Management/18-Group-Policy-Compliance-Reporting/Evidence/Screenshots/01-Project-Folder.png" width="900">
</p>

---

## Step 2 — Create Compliance Script

Developed a PowerShell script to automate compliance report generation.

The script records:

- Computer Name
- Report Date
- Compliance Status

<p align="center">
<img src="/01-Identity-and-Access-Management/18-Group-Policy-Compliance-Reporting/Evidence/Screenshots/02-Create-Compliance-Script.png" width="900">
</p>

---

## Step 3 — Generate GPResult Report

Executed GPResult to generate a comprehensive Group Policy report.

Command used:

```powershell
gpresult /h GPResult.html
```

<p align="center">
<img src="/01-Identity-and-Access-Management/18-Group-Policy-Compliance-Reporting/Evidence/Screenshots/03-Run-GPResult.png" width="900">
</p>

---

## Step 4 — Verify Report Creation

Confirmed successful creation of the HTML report.

Generated file:

```text
GPResult.html
```

<p align="center">
<img src="/01-Identity-and-Access-Management/18-Group-Policy-Compliance-Reporting/Evidence/Screenshots/04-Generate-HTML-Report.png" width="900">
</p>

---

## Step 5 — Review Applied Policies

Opened the GPResult report and reviewed:

- Applied GPOs
- Security Settings
- User Configuration
- Computer Configuration

<p align="center">
<img src="/01-Identity-and-Access-Management/18-Group-Policy-Compliance-Reporting/Evidence/Screenshots/05-Open-GPResult-Report.png" width="900">
</p>

---

## Step 6 — Generate Compliance Report

Executed the compliance reporting script.

Output file:

```text
ComplianceReport.csv
```

<p align="center">
<img src="/01-Identity-and-Access-Management/18-Group-Policy-Compliance-Reporting/Evidence/Screenshots/06-Create-Compliance-CSV.png" width="900">
</p>

---

## Step 7 — Validate CSV Report

Reviewed exported compliance data.

Verified:

- Computer Name
- Report Date
- Compliance Status

<p align="center">
<img src="/01-Identity-and-Access-Management/18-Group-Policy-Compliance-Reporting/Evidence/Screenshots/07-Compliance-Report-Generated.png" width="900">
</p>

---

## Step 8 — Final Validation

Validated complete Group Policy Compliance Reporting deployment.

Confirmed:

- GPResult Report Generation
- Compliance CSV Export
- PowerShell Automation
- Policy Verification

<p align="center">
<img src="/01-Identity-and-Access-Management/18-Group-Policy-Compliance-Reporting/Evidence/Screenshots/08-Module-Complete.png" width="900">
</p>

---

# Compliance Reporting Workflow

```text
CLIENT01
    │
    ▼
GPResult
    │
    ▼
HTML Report
    │
    ▼
Compliance Script
    │
    ▼
ComplianceReport.csv
    │
    ▼
Administrative Review
```

---

# Validation Results

| Validation Check | Status |
|------------------|--------|
| Project Structure Created | ✅ |
| Compliance Script Created | ✅ |
| GPResult Generated | ✅ |
| HTML Report Verified | ✅ |
| Compliance Report Exported | ✅ |
| CSV Report Validated | ✅ |
| Policy Review Completed | ✅ |
| Compliance Reporting Operational | ✅ |

---

# Skills Demonstrated

- Group Policy Management
- GPO Auditing
- Compliance Reporting
- GPResult Analysis
- PowerShell Automation
- Enterprise Documentation
- Security Validation
- Windows Administration
- IT Operations

---

# Key Takeaways

This module demonstrated how enterprise administrators validate Group Policy deployment and generate compliance reports using built-in Windows tools and PowerShell automation.

By combining GPResult with automated reporting, administrators can verify policy application, document compliance status, and maintain visibility into workstation configurations across the environment.

This reflects real-world enterprise practices used for security validation, auditing, and compliance monitoring.

---

<div align="center">

### Module Status

✅ Completed Successfully

**Next Module:** File Server Auditing

</div>
