$Employees = Import-Csv ".\Employees.csv"

foreach ($Employee in $Employees)
{
    $FirstName = $Employee.FirstName
    $LastName = $Employee.LastName

    $Username = "$($FirstName.ToLower()).$($LastName.ToLower())"

    $Password = "Welcome2026!"

    [PSCustomObject]@{
        Name = "$FirstName $LastName"
        Username = $Username
        TemporaryPassword = $Password
    }
}