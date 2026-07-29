# Cloud User Lifecycle Test

## Purpose

This procedure demonstrates Microsoft Entra user lifecycle operations by modifying, suspending, validating, and restoring a cloud-only user.

---

## Test User

| Field | Initial Value |
|---|---|
| Display name | Maya Santos |
| User type | Member |
| Identity source | Microsoft Entra ID |
| Department | Finance |
| Job title | Finance Associate |
| Initial group | SG-Cloud-Finance |
| Account state | Enabled |

---

## Lifecycle Scenario

Maya Santos was temporarily transferred from Finance to IT and later returned to her original position.

```text
Finance user
    ↓
Finance access removed
    ↓
IT attributes assigned
    ↓
IT group membership assigned
    ↓
Account temporarily blocked
    ↓
Account restored
    ↓
Finance attributes and access restored
```

---

## Mover Actions

1. Removed Maya Santos from SG-Cloud-Finance
2. Added Maya Santos to SG-Cloud-IT
3. Changed the department from Finance to IT
4. Changed the job title to IT Support Trainee

---

## Temporary Suspension

The user account was blocked from signing in without deleting the directory object.

| Validation | Result |
|---|---|
| User object remained present | Passed |
| Account was disabled | Passed |
| Group membership remained visible | Passed |
| User properties remained available | Passed |

---

## Restoration Actions

1. Re-enabled the user account
2. Restored the department to Finance
3. Restored the job title to Finance Associate
4. Removed Maya Santos from SG-Cloud-IT
5. Added Maya Santos back to SG-Cloud-Finance

---

## Final Validation

| Check | Expected Result |
|---|---|
| Account enabled | Yes |
| Department | Finance |
| Job title | Finance Associate |
| SG-Cloud-Finance membership | Present |
| SG-Cloud-IT membership | Not present |
| On-premises synchronization | No |

---

## Security Lessons

- Block sign-in when temporary suspension is sufficient
- Do not delete an account when access may need to be restored quickly
- Remove access that is no longer required
- Group membership should reflect current job responsibilities
- User attributes and access should be validated after every lifecycle change
- Administrative actions should be recorded in audit logs
