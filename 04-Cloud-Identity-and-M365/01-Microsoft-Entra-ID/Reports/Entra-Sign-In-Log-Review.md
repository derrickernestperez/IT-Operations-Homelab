# Microsoft Entra Sign-In Log Review

## Purpose

This document records the review of successful and failed Microsoft Entra user sign-in activity.

---

## Test Identity

| Field | Value |
|---|---|
| User | Alex Rivera |
| Identity type | Cloud-only Microsoft Entra user |
| User type | Member |
| Account status | Enabled |

---

## Test Activities

| Test | Expected Result | Actual Result |
|---|---|---|
| Sign in with valid credentials | Success | Passed |
| Sign in with incorrect password | Failure | Passed |
| Successful event appears in logs | Yes | Passed |
| Failed event appears in logs | Yes | Passed |

---

## Successful Sign-In Review

| Property | Observed Value |
|---|---|
| User | Alex Rivera |
| Status | Success |
| Application | Record from portal |
| Resource | Record from portal |
| Browser | Record from portal |
| Operating system | Record from portal |
| Authentication requirement | Record from portal |
| Conditional Access result | Record from portal |

---

## Failed Sign-In Review

| Property | Observed Value |
|---|---|
| User | Alex Rivera |
| Status | Failure |
| Error code | Record exact portal value |
| Failure reason | Record exact portal value |
| Application | Record from portal |
| Resource | Record from portal |

---

## Investigation Model

```text
User sign-in attempt
        ↓
Microsoft Entra authentication
        ↓
Sign-in event created
        ↓
User, application, and resource recorded
        ↓
Authentication result recorded
        ↓
Administrator reviews success or failure
```

---

## Security Findings

- Successful and failed sign-ins were recorded
- Failed attempts included troubleshooting information
- Device, browser, IP address, and application details were available
- Sign-in logs can support authentication troubleshooting
- Repeated failures may indicate a forgotten password or suspicious activity
- Administrative review should consider user, device, location, application, and result
- Public screenshots should not expose unnecessary IP addresses or account identifiers

---

## Validation

| Check | Result |
|---|---|
| Successful sign-in generated | Passed |
| Failed sign-in generated | Passed |
| Successful event reviewed | Passed |
| Failed event reviewed | Passed |
| Sign-in CSV exported | Passed |
| Evidence screenshots captured | Passed |
