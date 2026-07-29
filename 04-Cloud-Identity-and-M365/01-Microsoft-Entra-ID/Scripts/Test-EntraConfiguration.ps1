$BasePath = "C:\Homelab\04-Cloud-Identity-and-M365\01-Microsoft-Entra-ID"
$ReportPath = "$BasePath\Reports\Entra-Configuration-Validation.csv"
$TenantDomain = "derrickernestpgmail.onmicrosoft.com"

if (-not (Get-MgContext)) {
    throw "No Microsoft Graph connection found. Connect with Connect-MgGraph first."
}

$Context = Get-MgContext
$Organization = Get-MgOrganization

$Users = Get-MgUser -All -Property "id,displayName,userPrincipalName,userType,accountEnabled,department,jobTitle,onPremisesSyncEnabled"
$Groups = Get-MgGroup -All -Property "id,displayName,securityEnabled,mailEnabled,groupTypes"

$ExpectedUsers = @(
    [PSCustomObject]@{
        DisplayName = "Alex Rivera"
        UserPrincipalName = "alex.rivera@$TenantDomain"
        Department = "IT"
        JobTitle = "Cloud Support Analyst"
    }
    [PSCustomObject]@{
        DisplayName = "Maya Santos"
        UserPrincipalName = "maya.santos@$TenantDomain"
        Department = "Finance"
        JobTitle = "Finance Associate"
    }
    [PSCustomObject]@{
        DisplayName = "Jordan Lee"
        UserPrincipalName = "jordan.lee@$TenantDomain"
        Department = "Human Resources"
        JobTitle = "HR Coordinator"
    }
)

$ExpectedGroups = @(
    [PSCustomObject]@{
        GroupName = "SG-Cloud-IT"
        ExpectedMember = "Alex Rivera"
    }
    [PSCustomObject]@{
        GroupName = "SG-Cloud-Finance"
        ExpectedMember = "Maya Santos"
    }
    [PSCustomObject]@{
        GroupName = "SG-Cloud-HR"
        ExpectedMember = "Jordan Lee"
    }
)

$Results = @()

$Results += [PSCustomObject]@{
    Category = "Connection"
    Item = "Microsoft Graph account"
    Expected = "Connected Entra work account"
    Actual = $Context.Account
    Status = if ($Context.Account) { "Passed" } else { "Failed" }
}

$Results += [PSCustomObject]@{
    Category = "Tenant"
    Item = "Microsoft Entra tenant"
    Expected = "Tenant returned by Microsoft Graph"
    Actual = $Organization.DisplayName
    Status = if ($Organization.DisplayName) { "Passed" } else { "Failed" }
}

foreach ($ExpectedUser in $ExpectedUsers) {
    $User = $Users | Where-Object UserPrincipalName -eq $ExpectedUser.UserPrincipalName

    $Results += [PSCustomObject]@{
        Category = "User"
        Item = "$($ExpectedUser.DisplayName) exists"
        Expected = $ExpectedUser.UserPrincipalName
        Actual = if ($User) { $User.UserPrincipalName } else { "Not found" }
        Status = if ($User) { "Passed" } else { "Failed" }
    }

    $Results += [PSCustomObject]@{
        Category = "User"
        Item = "$($ExpectedUser.DisplayName) enabled"
        Expected = "True"
        Actual = if ($User) { [string]$User.AccountEnabled } else { "Not found" }
        Status = if ($User -and $User.AccountEnabled -eq $true) { "Passed" } else { "Failed" }
    }

    $Results += [PSCustomObject]@{
        Category = "User"
        Item = "$($ExpectedUser.DisplayName) department"
        Expected = $ExpectedUser.Department
        Actual = if ($User) { $User.Department } else { "Not found" }
        Status = if ($User -and $User.Department -eq $ExpectedUser.Department) { "Passed" } else { "Failed" }
    }

    $Results += [PSCustomObject]@{
        Category = "User"
        Item = "$($ExpectedUser.DisplayName) job title"
        Expected = $ExpectedUser.JobTitle
        Actual = if ($User) { $User.JobTitle } else { "Not found" }
        Status = if ($User -and $User.JobTitle -eq $ExpectedUser.JobTitle) { "Passed" } else { "Failed" }
    }

    $Results += [PSCustomObject]@{
        Category = "User"
        Item = "$($ExpectedUser.DisplayName) cloud-only identity"
        Expected = "Not synchronised from on-premises"
        Actual = if ($User) { [string]$User.OnPremisesSyncEnabled } else { "Not found" }
        Status = if ($User -and $User.OnPremisesSyncEnabled -ne $true) { "Passed" } else { "Failed" }
    }
}

foreach ($ExpectedGroup in $ExpectedGroups) {
    $Group = $Groups | Where-Object DisplayName -eq $ExpectedGroup.GroupName

    $Results += [PSCustomObject]@{
        Category = "Group"
        Item = "$($ExpectedGroup.GroupName) exists"
        Expected = "Security group present"
        Actual = if ($Group) { $Group.DisplayName } else { "Not found" }
        Status = if ($Group) { "Passed" } else { "Failed" }
    }

    $Results += [PSCustomObject]@{
        Category = "Group"
        Item = "$($ExpectedGroup.GroupName) security enabled"
        Expected = "True"
        Actual = if ($Group) { [string]$Group.SecurityEnabled } else { "Not found" }
        Status = if ($Group -and $Group.SecurityEnabled -eq $true) { "Passed" } else { "Failed" }
    }

    if ($Group) {
        try {
            $Members = Get-MgGroupMemberAsUser -GroupId $Group.Id -All -ErrorAction Stop
            $ExpectedMemberFound = $Members.DisplayName -contains $ExpectedGroup.ExpectedMember

            $Results += [PSCustomObject]@{
                Category = "Membership"
                Item = "$($ExpectedGroup.ExpectedMember) in $($ExpectedGroup.GroupName)"
                Expected = "Member present"
                Actual = if ($ExpectedMemberFound) { "Member present" } else { "Member not found" }
                Status = if ($ExpectedMemberFound) { "Passed" } else { "Failed" }
            }
        }
        catch {
            $Results += [PSCustomObject]@{
                Category = "Membership"
                Item = "$($ExpectedGroup.ExpectedMember) in $($ExpectedGroup.GroupName)"
                Expected = "Member present"
                Actual = "Unable to retrieve membership"
                Status = "Failed"
            }
        }
    }
}

$RequiredFiles = @(
    "Environment\Tenant-Overview.md"
    "Environment\Cloud-User-Inventory.md"
    "Environment\Cloud-Group-Inventory.md"
    "Environment\Administrative-Role-Review.md"
    "Procedures\Cloud-User-Lifecycle-Test.md"
    "Reports\Entra-Audit-Log-Review.md"
    "Reports\Entra-Sign-In-Log-Review.md"
    "Reports\Entra-Tenant-Inventory.csv"
    "Reports\Entra-User-Inventory.csv"
    "Reports\Entra-Group-Inventory.csv"
    "Reports\Entra-Inventory-Summary.txt"
)

foreach ($RelativePath in $RequiredFiles) {
    $FullPath = Join-Path $BasePath $RelativePath
    $Exists = Test-Path $FullPath
    $HasContent = $false

    if ($Exists) {
        $HasContent = (Get-Item $FullPath).Length -gt 0
    }

    $Results += [PSCustomObject]@{
        Category = "Documentation"
        Item = $RelativePath
        Expected = "Exists and contains content"
        Actual = if ($Exists -and $HasContent) { "Present" } else { "Missing or empty" }
        Status = if ($Exists -and $HasContent) { "Passed" } else { "Failed" }
    }
}

$Results | Export-Csv -Path $ReportPath -NoTypeInformation -Encoding UTF8

$Results | Format-Table Category, Item, Status -AutoSize

$Passed = @($Results | Where-Object Status -eq "Passed").Count
$Failed = @($Results | Where-Object Status -eq "Failed").Count

[PSCustomObject]@{
    Tenant = $Organization.DisplayName
    TotalChecks = $Results.Count
    PassedChecks = $Passed
    FailedChecks = $Failed
    ReportPath = $ReportPath
    FinalStatus = if ($Failed -eq 0) { "PASSED" } else { "REVIEW REQUIRED" }
} | Format-List
