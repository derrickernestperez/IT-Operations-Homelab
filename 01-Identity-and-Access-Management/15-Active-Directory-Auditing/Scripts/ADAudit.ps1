# Disabled Users

Get-ADUser `
    -Filter 'Enabled -eq $false' `
    -Properties Enabled |
Select Name,SamAccountName,Enabled |
Export-Csv `
"C:\Homelab\Active-Directory-Auditing\Reports\DisabledUsers.csv" `
-NoTypeInformation

# Security Groups

Get-ADGroup `
    -Filter * |
Select Name,GroupScope |
Export-Csv `
"C:\Homelab\Active-Directory-Auditing\Reports\SecurityGroups.csv" `
-NoTypeInformation

# Organizational Units

Get-ADOrganizationalUnit `
    -Filter * |
Select Name,DistinguishedName |
Export-Csv `
"C:\Homelab\Active-Directory-Auditing\Reports\OUSummary.csv" `
-NoTypeInformation

Write-Host "Audit Complete" -ForegroundColor Green