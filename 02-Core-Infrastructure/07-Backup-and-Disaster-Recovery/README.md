<div align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&color=gradient&customColorList=0,2&height=250&section=header&text=Backup%20and%20Disaster%20Recovery&fontSize=42&fontAlignY=35&desc=Module%2020%20|%20Business%20Continuity%20and%20Data%20Protection&descSize=20&descAlignY=55" width="100%">
</div>

---

# Overview

This module documents the implementation of a basic Backup and Disaster Recovery solution within the Windows Server homelab environment.

The objective was to understand how organizations protect critical business data through backups and how data can be restored after accidental deletion, corruption, or system failure.

The lab simulates real-world backup operations used by enterprise IT teams to support business continuity and disaster recovery planning.

---

# Business Scenario

The organization stores critical departmental data including HR records, financial documents, and operational files.

Management requires a backup solution that allows administrators to recover files if they are accidentally deleted, corrupted, or lost during an outage.

The Infrastructure Team must create a backup process, validate backup integrity, and successfully restore lost data.

---

# Learning Objectives

By completing this module, the following competencies were demonstrated:

- Backup Fundamentals
- Disaster Recovery Concepts
- Business Continuity Planning
- PowerShell Automation
- File Restoration Procedures
- Recovery Validation
- Data Protection
- Enterprise Backup Operations

---

# Key Concepts Learned

## Backup

A backup is a copy of data stored separately from the production environment.

Purpose:

- Protect against accidental deletion
- Protect against hardware failure
- Protect against ransomware
- Support disaster recovery

---

## Disaster Recovery

Disaster Recovery (DR) is the process of restoring systems and business operations after an incident.

Examples:

- Server Failure
- Ransomware Attack
- Data Corruption
- Natural Disaster

---

## Recovery Point Objective (RPO)

RPO measures the maximum acceptable amount of data loss.

Example:

If backups run every night and a file is lost at 4 PM:

```text
Maximum Data Loss = 16 Hours
```

---

# Lab Environment Specifications

| Component | Configuration |
|------------|------------|
| Server Name | SRV01 |
| Operating System | Windows Server 2025 Standard Evaluation |
| Domain | homelab.local |
| Backup Location | C:\Backups |
| Source Data | C:\Shares |
| Automation Tool | PowerShell |
| Recovery Method | File Restoration |

---

# Folder Structure

```text
20-Backup-and-Disaster-Recovery
│
├── README.md
│
├── Scripts
│   └── BackupShares.ps1
│
├── Reports
│
├── Evidence
│   └── Screenshots
│
└── Backups
```

---

# Step-by-Step Implementation

---

## Step 1 — Create Project Structure

Created the module folder structure for scripts, reports, and evidence.

<p align="center">
<img src="/01-Identity-and-Access-Management/20-Backup-and-Disaster-Recovery/Evidence/Screenshots/01-Project-Folder.png" width="900">
</p>

---

## Step 2 — Create Backup Location

Created a dedicated backup repository.

```text
C:\Backups
```

This separates production data from backup data.

<p align="center">
<img src="/01-Identity-and-Access-Management/20-Backup-and-Disaster-Recovery/Evidence/Screenshots/02-Create-Backup-Location.png" width="900">
</p>

---

## Step 3 — Create Backup Script

Developed a PowerShell script to automate backup operations.

Script:

```powershell
$Source = "C:\Shares"
$Destination = "C:\Backups"

Copy-Item `
    -Path $Source `
    -Destination $Destination `
    -Recurse `
    -Force

Write-Host "Backup Completed Successfully"
```

<p align="center">
<img src="/01-Identity-and-Access-Management/20-Backup-and-Disaster-Recovery/Evidence/Screenshots/03-Create-Backup-Script.png" width="900">
</p>

---

## Step 4 — Execute Backup Job

Executed the backup script.

Result:

```text
Backup Completed Successfully
```

<p align="center">
<img src="/01-Identity-and-Access-Management/20-Backup-and-Disaster-Recovery/Evidence/Screenshots/04-Run-Backup-Script.png" width="900">
</p>

---

## Step 5 — Create Restore Test File

Created a test file within the HR share.

Purpose:

To simulate real-world file recovery operations.

<p align="center">
<img src="/01-Identity-and-Access-Management/20-Backup-and-Disaster-Recovery/Evidence/Screenshots/05-Restore-Test-File.png" width="900">
</p>

---

## Step 6 — Update Backup

Executed another backup cycle to ensure the test file was included in the backup repository.

<p align="center">
<img src="/01-Identity-and-Access-Management/20-Backup-and-Disaster-Recovery/Evidence/Screenshots/06-Backup-Updated.png" width="900">
</p>

---

## Step 7 — Simulate Data Loss

Deleted the test file from the production HR share.

This simulates accidental deletion by a user.

<p align="center">
<img src="/01-Identity-and-Access-Management/20-Backup-and-Disaster-Recovery/Evidence/Screenshots/07-Simulate-Data-Loss.png" width="900">
</p>

---

## Step 8 — Restore Lost Data

Recovered the deleted file from the backup repository.

Command:

```powershell
Copy-Item `
"C:\Backups\Shares\HR\RestoreTest.txt" `
"C:\Shares\HR"
```

<p align="center">
<img src="/01-Identity-and-Access-Management/20-Backup-and-Disaster-Recovery/Evidence/Screenshots/08-Restore-File.png" width="900">
</p>

---

## Step 9 — Validate Recovery

Opened the restored file and confirmed the contents matched the original file.

This validates successful recovery.

<p align="center">
<img src="/01-Identity-and-Access-Management/20-Backup-and-Disaster-Recovery/Evidence/Screenshots/09-Restore-Validation.png" width="900">
</p>

---

# Backup and Recovery Workflow

```text
Department Shares
       │
       ▼
Backup Script
       │
       ▼
C:\Backups
       │
       ▼
Data Loss Event
       │
       ▼
Restore Process
       │
       ▼
Business Recovery
```

---

# Validation Results

| Validation Check | Status |
|------------------|--------|
| Backup Location Created | ✅ |
| Backup Script Created | ✅ |
| Backup Executed | ✅ |
| Test File Created | ✅ |
| Backup Updated | ✅ |
| Data Loss Simulated | ✅ |
| File Restored | ✅ |
| Recovery Validated | ✅ |

---

# Skills Demonstrated

- Windows Server Administration
- Business Continuity
- Disaster Recovery
- Backup Operations
- PowerShell Automation
- File Restoration
- Data Protection
- IT Operations
- Enterprise Infrastructure

---

# Key Takeaways

This module demonstrated how backups support business continuity and disaster recovery.

By creating backups, simulating data loss, and successfully restoring files, the lab validated one of the most important responsibilities of enterprise IT teams: protecting organizational data.

The exercise also reinforced the principle that a backup is only valuable if it can be successfully restored and verified.

---

<div align="center">

### Module Status

✅ Completed Successfully

**Next Module:** Windows Admin Center

</div>
