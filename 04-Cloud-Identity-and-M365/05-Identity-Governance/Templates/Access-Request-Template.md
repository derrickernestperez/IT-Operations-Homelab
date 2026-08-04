# Microsoft Entra Access Request Template

## Request information

| Field | Details |
|---|---|
| Request ID | |
| Request date | |
| Requested by | |
| Requester role | |
| User or account affected | |
| Department or team | |
| Manager or approver | |
| Required completion date | |
| Related ticket or change ID | |

---

## Request type

Select one:

- [ ] New user access
- [ ] Security-group membership
- [ ] Administrative-role assignment
- [ ] Application access
- [ ] MFA registration or reset
- [ ] Access modification
- [ ] Temporary access
- [ ] Access removal
- [ ] Emergency-access change
- [ ] Other

---

## Access requested

| Field | Details |
|---|---|
| Resource, group, role, or application | |
| Access level requested | |
| Business justification | |
| Start date | |
| End date, if temporary | |
| Data sensitivity | |
| Privileged access | Yes / No |
| MFA required | Yes / No |
| Licence required | Yes / No / Not applicable |

---

## Identity source

Select one:

- [ ] On-premises Active Directory
- [ ] Microsoft Entra cloud-only
- [ ] Hybrid synchronized identity
- [ ] Guest or external identity
- [ ] Service identity
- [ ] Emergency-access identity

For synchronized identities, changes should normally be made in the authoritative on-premises source.

---

## Risk review

| Review question | Result |
|---|---|
| Does the access follow least privilege? | |
| Is the access required for the user’s current role? | |
| Does the request create a separation-of-duties conflict? | |
| Is privileged access involved? | |
| Is temporary access more appropriate? | |
| Does the user have working MFA? | |
| Does the request affect an emergency account? | |
| Is an additional approval required? | |
| Is a licence required? | |
| Is the requested feature available in the tenant? | |

---

## Required approvals

| Approval role | Name or reference | Decision | Date |
|---|---|---|---|
| Manager or business owner | | Approved / Rejected | |
| Group or resource owner | | Approved / Rejected | |
| Security or privileged-access approver | | Approved / Rejected / Not required | |
| IT administrator | | Accepted / Returned | |

Do not store passwords, MFA codes, recovery details, or sensitive authentication information in this form.

---

## Administrator implementation

| Implementation check | Result |
|---|---|
| Correct identity selected | |
| Account status verified | |
| Identity source verified | |
| Approved group assigned | |
| Unapproved access avoided | |
| Administrative role assigned using least privilege | |
| MFA status verified | |
| Licence state reviewed | |
| Temporary expiration recorded | |
| Sign-in or access test completed | |
| Evidence recorded | |

---

## Validation

After implementation, confirm:

- [ ] The user can access the approved resource.
- [ ] The user cannot access unapproved resources.
- [ ] MFA works when required.
- [ ] No unnecessary administrative role was assigned.
- [ ] Emergency-access accounts were not affected.
- [ ] The change appears in the relevant audit or sign-in logs.
- [ ] The related ticket or request was updated.
- [ ] A future access-review date was recorded.

---

## Final decision

Select one:

- [ ] APPROVED AND IMPLEMENTED
- [ ] APPROVED WITH LIMITATION
- [ ] REJECTED
- [ ] RETURNED FOR MORE INFORMATION
- [ ] ESCALATED
- [ ] TEMPORARY ACCESS GRANTED
- [ ] ACCESS REMOVED
- [ ] DESIGN ONLY — LICENCE REQUIRED

---

## Completion record

| Field | Details |
|---|---|
| Implemented by | |
| Implementation date | |
| Validated by | |
| Validation date | |
| Evidence reference | |
| Future review date | |
| Final status | |
| Notes | |

---

## Security and privacy rules

Do not record:

- Passwords
- Temporary passwords
- Microsoft Authenticator QR codes
- Software OATH secrets
- Recovery codes
- Temporary Access Pass values
- Access tokens
- Tenant IDs
- Object IDs
- Full emergency-account usernames
- Personal phone numbers
- Sensitive personal data

Use redacted account references when this template is included in the public repository.

---

## Example classification

```text
Request type          : Security-group membership
Business justification: Controlled MFA pilot testing
Approval status       : Approved
Implementation status : Completed
Validation status     : Successful
Final classification  : COMPLETED AND VALIDATED
