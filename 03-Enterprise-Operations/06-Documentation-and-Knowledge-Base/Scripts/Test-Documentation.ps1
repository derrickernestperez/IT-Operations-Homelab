$BasePath = "C:\Homelab\03-Enterprise-Operations\06-Documentation-and-Knowledge-Base"
$ReportPath = "$BasePath\Reports\Documentation-Validation.csv"

$RequiredFiles = @(
    "README.md",
    "Environment\Infrastructure-Overview.md",
    "Environment\Server-Inventory.md",
    "Environment\Network-and-Service-Reference.md",
    "Incident-Records\INC-005-CLIENT01-Could-Not-Reach-SRV01.md",
    "Knowledge-Base\KB-005-Domain-Controller-and-DNS-Unreachable.md",
    "Knowledge-Base\INDEX.md",
    "Procedures\SOP-003-Remote-Server-Health-Check.md",
    "Change-Management\CHANGELOG.md",
    "Templates\Incident-Record-Template.md",
    "Templates\Knowledge-Article-Template.md",
    "Templates\Standard-Operating-Procedure-Template.md",
    "Reports\SRV01-Infrastructure-Data.txt"
)

$Results = foreach ($RelativePath in $RequiredFiles) {
    $FullPath = Join-Path $BasePath $RelativePath
    $Exists = Test-Path $FullPath

    if ($Exists) {
        $Item = Get-Item $FullPath
        $Length = $Item.Length
        $HasContent = $Length -gt 0
        $Modified = $Item.LastWriteTime
    }
    else {
        $Length = 0
        $HasContent = $false
        $Modified = $null
    }

    $Status = if ($Exists -and $HasContent) { "Passed" } else { "Failed" }

    [PSCustomObject]@{
        File = $RelativePath
        Exists = $Exists
        HasContent = $HasContent
        SizeBytes = $Length
        LastModified = $Modified
        Status = $Status
    }
}

$Results | Export-Csv -Path $ReportPath -NoTypeInformation -Encoding UTF8

$Results | Format-Table File,Exists,HasContent,SizeBytes,Status -AutoSize

$Passed = ($Results | Where-Object Status -eq "Passed").Count
$Failed = ($Results | Where-Object Status -eq "Failed").Count

[PSCustomObject]@{
    TotalFiles = $Results.Count
    PassedFiles = $Passed
    FailedFiles = $Failed
    ReportPath = $ReportPath
    FinalStatus = if ($Failed -eq 0) { "PASSED" } else { "REVIEW REQUIRED" }
} | Format-List
