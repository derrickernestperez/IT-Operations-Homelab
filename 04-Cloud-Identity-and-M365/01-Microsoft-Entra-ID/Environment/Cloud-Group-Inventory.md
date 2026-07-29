# Microsoft Entra Cloud Group Inventory

## Document Purpose

This document records assigned security groups created in Microsoft Entra ID for departmental access-management testing.

---

## Group Inventory

| Group Name | Group Type | Membership Type | Identity Source | Purpose | Status |
|---|---|---|---|---|---|
| SG-Cloud-IT | Security | Assigned | Microsoft Entra ID | IT cloud-resource access | Active |
| SG-Cloud-Finance | Security | Assigned | Microsoft Entra ID | Finance cloud-resource access | Active |
| SG-Cloud-HR | Security | Assigned | Microsoft Entra ID | Human Resources cloud-resource access | Active |

---

## Group Membership

| Group | Member | User Principal Name | Department |
|---|---|---|---|
| SG-Cloud-IT | Alex Rivera | alex.rivera@REPLACE-WITH-YOUR-TENANT-DOMAIN.onmicrosoft.com | IT |
| SG-Cloud-Finance | Maya Santos | maya.santos@REPLACE-WITH-YOUR-TENANT-DOMAIN.onmicrosoft.com | Finance |
| SG-Cloud-HR | Jordan Lee | jordan.lee@REPLACE-WITH-YOUR-TENANT-DOMAIN.onmicrosoft.com | Human Resources |

---

## Access Model

The groups use an assigned-membership model.

Users are added manually based on department and business-access requirements.

```text
User
  ↓
Department security group
  ↓
Application, licence, or resource assignment
```

---

## Validation Results

| Validation Check | Expected Result |
|---|---|
| Group type | Security |
| Membership type | Assigned |
| Group source | Cloud |
| Role assignment enabled | No |
| Expected user present | Yes |
| Unexpected users present | No |

---

## Security Considerations

- Group names follow a consistent naming convention
- Membership is based on departmental need
- Users are not granted administrative roles through these groups
- Direct resource assignment should be avoided when group-based access is available
- Group membership should be reviewed regularly
- Privileged accounts should not be placed in standard departmental groups unless required

---

## Naming Standard

| Prefix | Meaning |
|---|---|
| SG | Security group |
| Cloud | Microsoft Entra cloud-managed group |
| IT, Finance, HR | Department or business function |

---

## Planned Use

- Application access assignment
- Microsoft 365 licence assignment
- Conditional Access targeting
- Identity-governance testing
- Access-review testing
