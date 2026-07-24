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

    $ExistingUser = Get-ADUser -Filter "SamAccountName -eq '$Username'" -ErrorAction SilentlyContinue

    [PSCustomObject]@{
        Name = "$FirstName $LastName"
        Username = $Username
        Department = $Department
        Group = $Group
        UserExists = if ($ExistingUser) { "YES" } else { "NO" }
    }
}