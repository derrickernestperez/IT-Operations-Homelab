$Computer = $env:COMPUTERNAME

$Report = @()

$AppliedGPOs = gpresult /R

$Report += [PSCustomObject]@{
    ComputerName = $Computer
    ReportDate   = Get-Date
    Status       = "GPO Report Generated"
}

$Report | Export-Csv `
"C:\Homelab\Group-Policy-Compliance-Reporting\Reports\ComplianceReport.csv" `
-NoTypeInformation

Write-Host ""
Write-Host "Compliance Report Generated" -ForegroundColor Green