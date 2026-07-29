# SOP — Microsoft Entra Cloud Account Administration

## Purpose

This procedure defines the standard process for creating, updating, disabling, restoring, and validating cloud-only Microsoft Entra user accounts.

---

## Scope

This SOP applies to cloud-only test users created directly in Microsoft Entra ID.

---

## Required Access

- Microsoft Entra admin centre access
- User Administrator or equivalent least-privileged role
- Access to audit and sign-in logs
- Microsoft Graph PowerShell for validation when required

---

## Account Creation

1. Open Entra ID > Users > All users
2. Select New user
3. Enter the user principal name and display name
4. Configure department, job title, and usage location
5. Assign a temporary password
6. Require password change at first sign-in
7. Create the account
8. Validate that the account is enabled
9. Confirm on-premises synchronisation is not enabled

---

## Group Assignment

1. Identify the required departmental security group
2. Add the user to the assigned group
3. Confirm the expected membership
4. Confirm no unnecessary group membership exists

---

## Account Modification

1. Review the approved business change
2. Update department and job-title attributes
3. Remove access that is no longer required
4. Add the required new group membership
5. Validate the final user and access state

---

## Temporary Suspension

1. Open the user properties
2. Set Account enabled to No
3. Save the change
4. Confirm the user object remains present
5. Review the audit event

---

## Account Restoration

1. Set Account enabled to Yes
2. Restore the required attributes
3. Restore approved group membership
4. Remove temporary or outdated access
5. Confirm the user can authenticate

---

## Validation

| Check | Expected Result |
|---|---|
| User exists | Yes |
| Account enabled | Matches intended state |
| Department | Correct |
| Job title | Correct |
| Group membership | Correct |
| Administrative role | None unless approved |
| Audit event present | Yes |
| Sign-in activity review completed | Yes |

---

## Security Requirements

- Apply least privilege
- Do not assign Global Administrator for routine work
- Do not store passwords in documentation
- Review group memberships after every lifecycle change
- Review audit logs after administrative actions
- Protect privileged accounts with multifactor authentication
- Remove access that is no longer required

---

## Escalation Criteria

- User cannot be created or updated
- Group membership does not apply
- Audit logs do not record the change
- Sign-in failures continue after account validation
- Privileged-role assignment is requested
- Suspicious authentication activity is detected
