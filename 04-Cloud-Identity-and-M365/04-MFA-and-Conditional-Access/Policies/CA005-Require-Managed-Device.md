# CA005 — Require Managed or Hybrid-Joined Device

## Status

**DESIGN ONLY — LICENCE REQUIRED**

This policy was designed but not deployed because the Microsoft Entra tenant does not include the required Conditional Access licence and the homelab does not currently include Microsoft Intune device-compliance management.

---

## Policy objective

Restrict access to selected cloud resources so that only approved, managed, or hybrid Microsoft Entra joined devices can sign in.

This control reduces the risk of users accessing sensitive administrative portals or company data from unmanaged personal devices.

---

## Policy configuration

| Setting | Planned value |
|---|---|
| Policy name | CA005 — Require Managed or Hybrid-Joined Device |
| Users included | Administrators or selected pilot users |
| Users excluded | Emergency Access 01 and Emergency Access 02 |
| Target resources | Microsoft Admin Portals or selected cloud resources |
| Device platforms | Windows |
| Conditions | Device state or device compliance |
| Grant control | Require device to be marked as compliant |
| Alternative grant control | Require Microsoft Entra hybrid joined device |
| Initial deployment state | Report-only |
| Final deployment state | On, after successful validation |
| Current implementation | Not deployed |
| Classification | DESIGN ONLY — LICENCE REQUIRED |

---

## Device trust options

### Compliant device

A compliant device is normally evaluated through Microsoft Intune against configured security requirements such as:

- Supported operating-system version
- Encryption enabled
- Antivirus active
- Firewall enabled
- No prohibited configuration
- Required security updates installed
- Device not marked as compromised

The current homelab does not include licensed Intune compliance management.

### Microsoft Entra hybrid joined device

A hybrid-joined device is joined to the local Active Directory domain and registered with Microsoft Entra ID.

This can provide a device-trust signal for organizations operating both on-premises Active Directory and Microsoft Entra ID.

The existing homelab includes domain-connected Windows systems and hybrid identity, but device-based Conditional Access enforcement was not available under the current licence.

---

## Intended scope

The policy should initially target high-value access, such as:

- Microsoft Entra admin center
- Microsoft 365 admin center
- Azure management
- Security administration portals
- Other sensitive administrative applications

Normal users and applications should not be included until device registration and compatibility have been validated.

---

## Exclusions

The following accounts must be excluded:

- Emergency Access 01
- Emergency Access 02

Emergency accounts should remain able to access the tenant from an independent recovery device if normal managed-device controls fail.

The real account names, tenant domain, device identifiers, and recovery details must not be committed to the repository.

---

## Dependencies

Before deployment, the organization should have:

- Microsoft Entra Conditional Access licensing
- Microsoft Intune or another supported compliance source, if compliant-device enforcement is required
- Correct device registration
- Verified Microsoft Entra hybrid join, if used
- Defined device-security baseline
- Device inventory
- Documented exception process
- Tested emergency-access procedure
- Help-desk support process for device-registration failures

---

## Pilot deployment plan

1. Confirm both emergency-access accounts are tested and excluded.
2. Select one controlled Windows test device.
3. Verify the device appears in Microsoft Entra.
4. Confirm its join type.
5. Confirm its ownership and management state.
6. Add one pilot user to the policy scope.
7. Set the policy to report-only mode.
8. Test sign-in from the approved device.
9. Test sign-in from an unmanaged device.
10. Review sign-in and Conditional Access results.
11. Verify that required administrative work remains available.
12. Expand the policy gradually after successful validation.

---

## Validation scenarios

### Test 1 — Approved managed device

Expected result:

```text
Device state  : Compliant or hybrid joined
Access result : Allowed