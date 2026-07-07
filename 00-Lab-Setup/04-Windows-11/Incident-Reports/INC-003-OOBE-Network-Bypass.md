---

### 🚨 STEP 10: Incident Report (Troubleshooting)

Inside `00-Lab-Setup\04-Windows-11\Incident-Reports\`, create a file named `INC-003-OOBE-Network-Bypass.md` and paste this:

```markdown
# INC-003: OOBE Network Requirement Bypass

## Problem Statement
During the initial provisioning of the Windows 11 Pro endpoint, the Out-of-Box Experience (OOBE) wizard halted installation, demanding an active internet connection and a Microsoft Account. Because the endpoint is intentionally isolated on `VMnet2`, the installation could not proceed.

## Root Cause
Modern consumer and pro versions of Windows enforce cloud-connected setups by default to drive Microsoft Account adoption. The OS hides the "Offline Account" option unless specific bypass parameters are met.

## Resolution
Invoked the hidden command prompt during the OOBE sequence (`Shift + F10`) and executed the bypass script `OOBE\BYPASSNRO`. This script modified the registry to allow limited network setup and rebooted the machine, successfully exposing the hidden "I don't have internet" option and allowing the creation of an offline Local Administrator account.
