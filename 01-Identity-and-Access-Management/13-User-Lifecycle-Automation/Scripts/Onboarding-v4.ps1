$Employees = Import-Csv ".\Employees.csv"

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
    }

    $Password = ConvertTo-SecureString "Welcome2026!" -AsPlainText -Force

    New-ADUser `
        -Name "$FirstName $LastName" `
        -GivenName $FirstName `
        -Surname $LastName `
        -SamAccountName $Username `
        -UserPrincipalName "$Username@homelab.local" `
        -Path $OU `
        -AccountPassword $Password `
        -Enabled $true `
        -ChangePasswordAtLogon $true

    Add-ADGroupMember -Identity $Group -Members $Username

    Write-Host "Created: $Username"
}