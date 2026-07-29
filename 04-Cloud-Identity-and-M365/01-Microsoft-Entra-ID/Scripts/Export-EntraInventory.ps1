$BasePath = "C:\Homelab\04-Cloud-Identity-and-M365\01-Microsoft-Entra-ID"
$ReportPath = "$BasePath\Reports"

New-Item -Path $ReportPath -ItemType Directory -Force | Out-Null

if (-not (Get-MgContext)) {
    throw "Not connected to Microsoft Graph. Run Connect-MgGraph first."
}

$Organization = Get-MgOrganization
$Users = Get-MgUser -All -Property "id,displayName,userPrincipalName,userType,accountEnabled,department,jobTitle,onPremisesSyncEnabled"
$Groups = Get-MgGroup -All -Property "id,displayName,description,groupTypes,mailEnabled,securityEnabled"

$Organization |
Select-Object DisplayName, Id, CountryLetterCode |
Export-Csv "$ReportPath\Entra-Tenant-Inventory.csv" -NoTypeInformation -Encoding UTF8

$Users |
Select-Object DisplayName, UserPrincipalName, UserType, AccountEnabled, Department, JobTitle, OnPremisesSyncEnabled |
Export-Csv "$ReportPath\Entra-User-Inventory.csv" -NoTypeInformation -Encoding UTF8

$Groups |
Select-Object DisplayName, Description, SecurityEnabled, MailEnabled, GroupTypes |
Export-Csv "$ReportPath\Entra-Group-Inventory.csv" -NoTypeInformation -Encoding UTF8

$Summary = @(
    "MICROSOFT ENTRA INVENTORY SUMMARY"
    "Generated: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
    ""
    "Tenant: $($Organization.DisplayName)"
    "Total users: $($Users.Count)"
    "Enabled users: $(($Users | Where-Object AccountEnabled -eq $true).Count)"
    "Disabled users: $(($Users | Where-Object AccountEnabled -eq $false).Count)"
    "Total groups: $($Groups.Count)"
)

$Summary | Set-Content "$ReportPath\Entra-Inventory-Summary.txt" -Encoding UTF8
$Summary

Write-Host ""
Write-Host "Inventory export completed."
Write-Host "Reports: $ReportPath"
