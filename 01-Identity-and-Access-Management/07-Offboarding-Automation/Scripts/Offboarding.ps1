$Employees = Import-Csv "C:\Homelab\Offboarding-Automation\Data\TerminatedEmployees.csv"

$Report = @()

foreach ($Employee in $Employees)
{
    $Username = $Employee.Username

    $User = Get-ADUser `
        -Filter "SamAccountName -eq '$Username'" `
        -Properties MemberOf

    if ($User)
    {
        # Disable Account
        Disable-ADAccount -Identity $User

        # Remove Security Groups
        $User.MemberOf | ForEach-Object {

            Remove-ADGroupMember `
                -Identity $_ `
                -Members $User `
                -Confirm:$false

        }

        # Move User to Disabled Users OU
        Move-ADObject `
            -Identity $User.DistinguishedName `
            -TargetPath "OU=Disabled Users,OU=Company,DC=homelab,DC=local"

        # Report
        $Report += [PSCustomObject]@{
            Username      = $Username
            Status        = "Disabled"
            GroupsRemoved = "Yes"
            MovedToOU     = "Disabled Users"
        }

        Write-Host "Disabled: $Username" -ForegroundColor Yellow
        Write-Host "Groups Removed" -ForegroundColor Cyan
        Write-Host "Moved to Disabled Users OU" -ForegroundColor Green
    }
    else
    {
        Write-Host "Not Found: $Username" -ForegroundColor Red

        $Report += [PSCustomObject]@{
            Username      = $Username
            Status        = "Not Found"
            GroupsRemoved = "No"
            MovedToOU     = "N/A"
        }
    }
}

$Report | Export-Csv `
"C:\Homelab\Offboarding-Automation\Reports\OffboardingReport.csv" `
-NoTypeInformation

Write-Host ""
Write-Host "Offboarding Complete" -ForegroundColor Green