# SOP — Joiner, Mover, and Leaver Identity Lifecycle

## Document status

**COMPLETED WITH DOCUMENTED LIMITATION**

---

## Purpose

This procedure defines how user identities and access should be created, changed, reviewed, disabled, and removed throughout the employee lifecycle.

The workflow covers three stages:

- Joiner — a new user enters the organization.
- Mover — an existing user changes role, department, manager, or responsibility.
- Leaver — a user leaves the organization or no longer requires access.

Advanced Microsoft Entra Lifecycle Workflows were not available under the tenant’s current licensing. Therefore, this module documents and validates a manual governance process.

---

## Scope

This SOP applies to:

- On-premises Active Directory users
- Microsoft Entra cloud-only users
- Hybrid synchronized users
- Security-group memberships
- Administrative roles
- Microsoft Entra authentication methods
- Microsoft 365 licence assignments, when available
- Emergency-access exclusions
- Disabled accounts
- Access-review records

This SOP does not authorize:

- Creating users without approval
- Assigning Global Administrator for convenience
- Sharing credentials
- Leaving unnecessary access after a role change
- Deleting accounts before retention requirements are reviewed
- Publishing personal account information in the repository

---

# Joiner Workflow

## Objective

Provide a new user with only the access required for their approved role.

## Required information

Before creating the account, confirm:

- Full name
- Approved username format
- Department
- Job role
- Manager or requester
- Start date
- Required applications
- Required security groups
- Required shared resources
- Device requirement
- MFA requirement
- Licence requirement, when applicable
- Approval record or ticket

## Joiner process

1. Confirm the onboarding request is approved.
2. Verify the user does not already have an account.
3. Determine whether the account will be:
   - On-premises and synchronized
   - Cloud-only
4. Create the account using the approved naming standard.
5. Assign a temporary password securely.
6. Require password change at first sign-in when appropriate.
7. Add only the approved security groups.
8. Assign only the required administrative role, if any.
9. Assign available licences only when required.
10. Add the user to an MFA pilot or production group when approved.
11. Register the approved authentication method.
12. Test sign-in.
13. Confirm required access.
14. Record the completed actions in the related ticket or checklist.
15. Schedule an initial access review.

## Joiner validation

```text
Account created             : Yes
Identity source             : Recorded
Manager or requester        : Recorded
Approved groups             : Assigned
Unapproved groups           : None
Administrative role         : Least privilege
MFA registration            : Completed where required
Licence assignment          : Documented
Sign-in test                : Successful
Ticket or approval record   : Completed
