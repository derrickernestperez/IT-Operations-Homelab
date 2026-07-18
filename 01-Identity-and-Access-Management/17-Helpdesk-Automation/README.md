<div align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&color=gradient&customColorList=0,2&height=250&section=header&text=Helpdesk%20Automation&fontSize=42&fontAlignY=35&desc=Module%2017%20%7C%20PowerShell%20Support%20Toolkit&descSize=20&descAlignY=55" alt="Helpdesk Automation Banner" width="100%">
</div>

---

# Overview

This module documents the development of a PowerShell-based Helpdesk Automation Toolkit.

The objective was to automate common Help Desk tasks such as:

- User Lookup
- Group Membership Verification
- User Reporting

This implementation demonstrates how PowerShell can improve operational efficiency by reducing repetitive administrative tasks performed by support teams.

---

# Business Scenario

The organization's Help Desk receives frequent requests involving:

- Verifying user information
- Checking group memberships
- Generating user reports

Performing these tasks manually through Active Directory Users and Computers increases response times and administrative overhead.

To improve efficiency, the IT Operations team developed a PowerShell toolkit that allows technicians to perform these actions through a simple menu-driven interface.

---

# Learning Objectives

By completing this module, the following competencies were demonstrated:

- PowerShell Automation
- Active Directory Administration
- Help Desk Operations
- User Account Management
- Group Membership Auditing
- CSV Reporting
- Administrative Scripting
- IT Operations Support

---

# Lab Environment Specifications

| Component | Configuration |
|------------|------------|
| Server Name | SRV01 |
| Operating System | Windows Server 2025 Standard Evaluation |
| Domain | homelab.local |
| Tool | Windows PowerShell |
| Directory Service | Active Directory |
| Script | HelpdeskToolkit.ps1 |
| Report Output | UserReport.csv |

---

# Folder Structure

```text
17-Helpdesk-Automation
│
├── README.md
│
├── Scripts
│   └── HelpdeskToolkit.ps1
│
├── Reports
│   └── UserReport.csv
│
└── Evidence
    └── Screenshots
        ├── 01-Project-Folder.png
        ├── 02-Create-Helpdesk-Script.png
        ├── 03-Menu-Displayed.png
        ├── 04-Find-User-Function.png
        ├── 05-Display-Group-Membership.png
        ├── 06-Generate-User-Report.png
        ├── 07-UserReport-CSV.png
        └── 08-Helpdesk-Toolkit-Complete.png
```

---

# Step-by-Step Implementation

---

## Step 1 — Create Project Structure

Created folders for scripts, reports, and evidence.

<p align="center">
<img src="/01-Identity-and-Access-Management/17-Helpdesk-Automation/Evidence/Screenshots/01-Project-Folder.png" width="900">
</p>

---

## Step 2 — Create Helpdesk Toolkit Script

Developed a menu-driven PowerShell toolkit.

Functions included:

- Find User
- View Group Membership
- Generate User Report

<p align="center">
<img src="/01-Identity-and-Access-Management/17-Helpdesk-Automation/Evidence/Screenshots/02-Create-Helpdesk-Script.png" width="900">
</p>

---

## Step 3 — Display Menu Interface

Executed the toolkit and displayed the available Help Desk functions.

<p align="center">
<img src="/01-Identity-and-Access-Management/17-Helpdesk-Automation/Evidence/Screenshots/03-Menu-Displayed.png" width="900">
</p>

---

## Step 4 — Test User Lookup

Validated the user search functionality.

The toolkit successfully retrieved Active Directory user information.

<p align="center">
<img src="/01-Identity-and-Access-Management/17-Helpdesk-Automation/Evidence/Screenshots/04-Find-User-Function.png" width="900">
</p>

---

## Step 5 — Verify Group Membership

Validated Active Directory group membership retrieval.

The toolkit successfully displayed assigned security groups.

<p align="center">
<img src="/01-Identity-and-Access-Management/17-Helpdesk-Automation/Evidence/Screenshots/05-Display-Group-Membership.png" width="900">
</p>

---

## Step 6 — Generate User Report

Generated a CSV report containing Active Directory user information.

<p align="center">
<img src="/01-Identity-and-Access-Management/17-Helpdesk-Automation/Evidence/Screenshots/06-Generate-User-Report.png" width="900">
</p>

---

## Step 7 — Verify Report Output

Validated successful report creation.

Report:

```text
UserReport.csv
```

<p align="center">
<img src="/01-Identity-and-Access-Management/17-Helpdesk-Automation/Evidence/Screenshots/07-UserReport-CSV.png" width="900">
</p>

---

## Step 8 — Final Validation

Validated complete Helpdesk Automation deployment.

Confirmed:

- Script Execution
- User Lookup
- Group Membership Verification
- CSV Reporting

<p align="center">
<img src="/01-Identity-andAccess-Management/17-Helpdesk-Automation/Evidence/Screenshots/08-Helpdesk-Toolkit-Complete.png" width="900">
</p>

---

# Helpdesk Workflow

```text
Technician
     │
     ▼
Helpdesk Toolkit
     │
     ├── Find User
     ├── Group Membership
     └── Generate Report
             │
             ▼
      Active Directory
```

---

# Validation Results

| Validation Check | Status |
|------------------|--------|
| Script Created | ✅ |
| Menu Displayed | ✅ |
| User Lookup Tested | ✅ |
| Group Membership Tested | ✅ |
| CSV Report Generated | ✅ |
| Report Validated | ✅ |
| Toolkit Operational | ✅ |

---

# Skills Demonstrated

- PowerShell Scripting
- Active Directory Administration
- User Management
- Group Membership Auditing
- CSV Reporting
- IT Operations
- Help Desk Support
- Administrative Automation
- Windows Server Administration

---

# Key Takeaways

This module demonstrated how PowerShell can automate repetitive Help Desk tasks and improve operational efficiency.

By providing a simple menu-driven interface, technicians can quickly retrieve user information, verify group memberships, and generate reports without manually navigating Active Directory tools.

This approach reflects real-world IT Operations practices where automation reduces response times and improves service quality.

---

<div align="center">

### Module Status

✅ Completed Successfully

**Next Module:** Windows Admin Center

</div>
