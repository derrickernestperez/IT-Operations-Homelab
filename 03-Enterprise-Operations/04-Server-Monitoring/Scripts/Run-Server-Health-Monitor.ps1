$BasePath = "C:\Homelab\03-Enterprise-Operations\04-Server-Monitoring"
$HealthScript = Join-Path $BasePath "Scripts\Get-Server-Health-Summary.ps1"
$HistoryFile = Join-Path $BasePath "Reports\Server-Health-History.csv"

$Result = & $HealthScript

if (Test-Path $HistoryFile) {
    $Result |
        Export-Csv `
            -Path $HistoryFile `
            -NoTypeInformation `
            -Append
}
else {
    $Result |
        Export-Csv `
            -Path $HistoryFile `
            -NoTypeInformation
}
