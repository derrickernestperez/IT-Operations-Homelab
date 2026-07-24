$Employees = Import-Csv ".\Employees.csv"

$SuccessReport = @()
$ErrorReport = @()

foreach ($Employee in $Employees)
{
    $FirstName = $Employee.FirstName
    $LastName = $Employee.LastName
    $Department = $Employee.Department

    $Username = "$($FirstName.ToLower()).$($LastName.ToLower())"

    switch ($Department)
    {
        "HR" {
            $OU = "OU=Users,OU=HR,OU=Company,DC=homelab,DC=local"
            $Group = "SG-HR-Users"
        }

        "IT" {
            $OU = "OU=Users,OU=IT,OU=Company,DC=homelab,DC=local"
            $Group = "SG-IT-Users"
        }

        "Finance" {
            $OU = "OU=Users,OU=Finance,OU=Company,DC=homelab,DC=local"
            $Group = "SG-Finance-Users"
        }

        "Sales" {
            $OU = "OU=Users,OU=Sales,OU=Company,DC=homelab,DC=local"
            $Group = "SG-Sales-Users"
        }

        default {
            $ErrorReport += [PSCustomObject]@{
                Name = "$FirstName $LastName"
                Reason = "Invalid Department"
            }
            continue
        }
    }

    $ExistingUser = Get-ADUser -Filter "SamAccountName -eq '$Username'" -ErrorAction SilentlyContinue

    if ($ExistingUser)
    {
        $ErrorReport += [PSCustomObject]@{
            Name = "$FirstName $LastName"
            Username = $Username
            Reason = "User Already Exists"
        }
    }
    else
    {
        $SuccessReport += [PSCustomObject]@{
            Name = "$FirstName $LastName"
            Username = $Username
            Department = $Department
            Group = $Group
            OU = $OU
        }
    }
}

$SuccessReport | Export-Csv ".\Reports\SuccessReport.csv" -NoTypeInformation
$ErrorReport | Export-Csv ".\Reports\ErrorReport.csv" -NoTypeInformation

Write-Host "Processing Complete"