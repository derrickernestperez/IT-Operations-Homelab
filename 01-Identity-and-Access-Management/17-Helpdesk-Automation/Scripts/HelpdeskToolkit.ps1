Write-Host ""
Write-Host "=== HELPDESK TOOLKIT ===" -ForegroundColor Cyan
Write-Host "1 - Find User"
Write-Host "2 - View Group Membership"
Write-Host "3 - Generate User Report"
Write-Host ""

$Choice = Read-Host "Select Option"

switch ($Choice)
{
    "1"
    {
        $Username = Read-Host "Enter Username"

        $User = Get-ADUser -Identity $Username -ErrorAction SilentlyContinue

        if (!$User)
        {
            Write-Host ""
            Write-Host "User not found." -ForegroundColor Red
            break
        }

        $Groups = Get-ADPrincipalGroupMembership $Username |
                  Select-Object -ExpandProperty Name

        $Department = "Unknown"

        if ($Groups -contains "SG-IT-Users")
        {
            $Department = "IT"
        }
        elseif ($Groups -contains "SG-HR-Users")
        {
            $Department = "HR"
        }
        elseif ($Groups -contains "SG-Finance-Users")
        {
            $Department = "Finance"
        }
        elseif ($Groups -contains "SG-Sales-Users")
        {
            $Department = "Sales"
        }

        Write-Host ""

        [PSCustomObject]@{
            Name       = $User.Name
            Username   = $User.SamAccountName
            Department = $Department
        }
    }

    "2"
    {
        $Username = Read-Host "Enter Username"

        $User = Get-ADUser -Identity $Username -ErrorAction SilentlyContinue

        if (!$User)
        {
            Write-Host ""
            Write-Host "User not found." -ForegroundColor Red
            break
        }

        Write-Host ""
        Write-Host "Group Memberships:" -ForegroundColor Yellow

        Get-ADPrincipalGroupMembership $Username |
        Select-Object Name
    }

    "3"
    {
        $Users = Get-ADUser -Filter *

        $Report = foreach ($User in $Users)
        {
            $Groups = Get-ADPrincipalGroupMembership $User.SamAccountName |
                      Select-Object -ExpandProperty Name

            $Department = "Unknown"

            if ($Groups -contains "SG-IT-Users")
            {
                $Department = "IT"
            }
            elseif ($Groups -contains "SG-HR-Users")
            {
                $Department = "HR"
            }
            elseif ($Groups -contains "SG-Finance-Users")
            {
                $Department = "Finance"
            }
            elseif ($Groups -contains "SG-Sales-Users")
            {
                $Department = "Sales"
            }

            [PSCustomObject]@{
                Name       = $User.Name
                Username   = $User.SamAccountName
                Department = $Department
            }
        }

        $Report | Export-Csv `
        "C:\Homelab\Helpdesk-Automation\Reports\UserReport.csv" `
        -NoTypeInformation

        Write-Host ""
        Write-Host "Report Created Successfully" -ForegroundColor Green
        Write-Host "Location:" -ForegroundColor Yellow
        Write-Host "C:\Homelab\Helpdesk-Automation\Reports\UserReport.csv"
    }

    default
    {
        Write-Host ""
        Write-Host "Invalid Option Selected" -ForegroundColor Red
    }
} 