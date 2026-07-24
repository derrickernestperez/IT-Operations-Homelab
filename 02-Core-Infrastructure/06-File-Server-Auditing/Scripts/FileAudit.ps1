$Folders = @(
    "C:\Shares\HR",
    "C:\Shares\Finance",
    "C:\Shares\IT",
    "C:\Shares\Sales"
)

$Report = @()

foreach ($Folder in $Folders)
{
    $ACL = Get-Acl $Folder

    foreach ($Access in $ACL.Access)
    {
        $Report += [PSCustomObject]@{
            Folder     = $Folder
            Identity   = $Access.IdentityReference
            Permission = $Access.FileSystemRights
            AccessType = $Access.AccessControlType
        }
    }
}

$Report | Export-Csv `
"C:\Homelab\File-Server-Auditing\Reports\SharePermissions.csv" `
-NoTypeInformation

Write-Host ""
Write-Host "Audit Complete" -ForegroundColor Green