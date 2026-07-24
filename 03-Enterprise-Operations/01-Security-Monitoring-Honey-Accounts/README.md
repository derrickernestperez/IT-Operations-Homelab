<div align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&color=gradient&customColorList=0,2&height=250&section=header&text=Security%20Monitoring&fontSize=42&fontAlignY=35&desc=Module%2016%20%7C%20Honey%20Account%20Detection&descSize=20&descAlignY=55" alt="Security Monitoring Banner" width="100%">
</div>

---

# Overview

This module documents the implementation of a Security Monitoring solution using a Honey Account within Active Directory.

The objective was to simulate how Security Operations teams detect suspicious activity by monitoring a dormant account that should never be used by legitimate users.

The solution uses PowerShell to monitor activity and generate alerts whenever the honey account is referenced.

---

# Business Scenario

Security Operations Centers (SOCs) often deploy Honey Accounts to detect unauthorized access attempts.

These accounts:

- Are never assigned to users
- Have no legitimate business purpose
- Generate alerts when accessed

Any activity involving the honey account may indicate:

- Credential harvesting
- Unauthorized enumeration
- Insider threats
- Lateral movement attempts
- Privilege escalation reconnaissance

This implementation simulates an enterprise detection mechanism used by Blue Teams and SOC Analysts.

---

# Learning Objectives

By completing this module, the following competencies were demonstrated:

- Security Monitoring
- PowerShell Scripting
- Active Directory Security
- Threat Detection Concepts
- Honey Account Deployment
- Alert Logging
- Security Operations
- Blue Team Methodologies
- Windows Security Monitoring
- Identity Protection

---

# Lab Environment Specifications

| Component | Configuration |
|------------|------------|
| Server Name | SRV01 |
| Operating System | Windows Server 2025 Standard Evaluation |
| Domain | homelab.local |
| Monitoring Tool | PowerShell |
| Detection Method | Honey Account |
| Honey Account | sql_backup_admin |
| Alert Output | Log File |
| Log Location | HoneyAccountAlerts.log |

---

# Folder Structure

```text
16-Security-Monitoring
│
├── README.md
│
├── Scripts
│   └── Watch-HoneyAccount.ps1
│
├── Logs
│   └── HoneyAccountAlerts.log
│
├── Reports
│
└── Evidence
    └── Screenshots
        ├── 01-Security-Monitoring-Project-Folder.png
        ├── 02-Honey-Account-Created.png
        ├── 03-Verify-Honey-Account.png
        ├── 04-Monitoring-Script-Created.png
        ├── 05-Monitoring-Script-Running.png
        ├── 06-Security-Event-Detected.png
        ├── 07-HoneyAccount-Alert-Generated.png
        ├── 08-HoneyAccount-Log-File.png
        └── 09-Security-Monitoring-Complete.png
```

---

# Step-by-Step Implementation

---

## Step 1 — Create Project Structure

Created the project structure used to store monitoring scripts, logs, reports, and evidence.

<p align="center">
<img src="/01-Identity-and-Access-Management/16-Security-Monitoring/Evidence/Screenshots/01-Security-Monitoring-Project-Folder.png" width="900">
</p>

---

## Step 2 — Create Honey Account

Created a dormant Active Directory account:

```text
sql_backup_admin
```

This account serves as a security monitoring trigger.

No legitimate user should ever access this account.

<p align="center">
<img src="/01-Identity-and-Access-Management/16-Security-Monitoring/Evidence/Screenshots/02-Honey-Account-Created.png" width="900">
</p>

---

## Step 3 — Verify Honey Account

Verified successful account creation within Active Directory.

<p align="center">
<img src="/01-Identity-and-Access-Management/16-Security-Monitoring/Evidence/Screenshots/03-Verify-Honey-Account.png" width="900">
</p>

---

## Step 4 — Create Monitoring Script

Developed a PowerShell monitoring solution.

Script:

```text
Watch-HoneyAccount.ps1
```

The script continuously monitors for references to the honey account and records detection events.

<p align="center">
<img src="/01-Identity-and-Access-Management/16-Security-Monitoring/Evidence/Screenshots/04-Monitoring-Script-Created.png" width="900">
</p>

---

## Step 5 — Execute Monitoring Script

Executed the monitoring solution.

The script entered continuous monitoring mode and waited for account activity.

<p align="center">
<img src="/01-Identity-and-Access-Management/16-Security-Monitoring/Evidence/Screenshots/05-Monitoring-Script-Running.png" width="900">
</p>

---

## Step 6 — Simulate Detection Event

Generated activity involving the honey account.

The monitoring process detected the event and triggered an alert.

<p align="center">
<img src="/01-Identity-and-Access-Management/16-Security-Monitoring/Evidence/Screenshots/06-Security-Event-Detected.png" width="900">
</p>

---

## Step 7 — Generate Security Alert

The monitoring solution created a log entry documenting the detection.

Alert information included:

- Timestamp
- Alert Type
- Honey Account Name

<p align="center">
<img src="/01-Identity-and-Access-Management/16-Security-Monitoring/Evidence/Screenshots/07-HoneyAccount-Alert-Generated.png" width="900">
</p>

---

## Step 8 — Validate Log File

Reviewed the generated security log.

File:

```text
HoneyAccountAlerts.log
```

This log serves as the security event record.

<p align="center">
<img src="/01-Identity-and-Access-Management/16-Security-Monitoring/Evidence/Screenshots/08-HoneyAccount-Log-File.png" width="900">
</p>

---

## Step 9 — Final Monitoring Validation

Validated successful deployment of the monitoring solution.

Confirmed:

- Honey Account Exists
- Monitoring Script Executes
- Detection Event Logged
- Alert File Generated

<p align="center">
<img src="/01-Identity-and-Access-Management/16-Security-Monitoring/Evidence/Screenshots/09-Security-Monitoring-Complete.png" width="900">
</p>

---

# Detection Workflow

```text
Honey Account
(sql_backup_admin)
        │
        ▼
Monitoring Script
        │
        ▼
Account Activity Detected
        │
        ▼
Alert Generated
        │
        ▼
Log File Created
        │
        ▼
SOC Review
```

---

# Validation Results

| Validation Check | Status |
|------------------|--------|
| Honey Account Created | ✅ |
| Honey Account Verified | ✅ |
| Monitoring Script Created | ✅ |
| Monitoring Script Executed | ✅ |
| Detection Event Generated | ✅ |
| Alert Logged | ✅ |
| Log File Validated | ✅ |
| Security Monitoring Operational | ✅ |

---

# Skills Demonstrated

- Security Monitoring
- Blue Team Operations
- Threat Detection
- PowerShell Automation
- Active Directory Security
- Security Event Logging
- Identity Monitoring
- Security Operations Concepts
- Enterprise Security Practices
- Windows Server Administration

---

# Key Takeaways

This module demonstrated how security monitoring concepts can be implemented using a Honey Account and PowerShell automation.

By deploying a dormant account and monitoring activity against it, organizations can improve visibility into suspicious behavior and detect unauthorized access attempts earlier in the attack lifecycle.

This approach reflects real-world detection techniques used by Security Operations Centers and Blue Team defenders.

---

<div align="center">

### Module Status

✅ Completed Successfully

**Next Module:** Helpdesk Automation

</div>
