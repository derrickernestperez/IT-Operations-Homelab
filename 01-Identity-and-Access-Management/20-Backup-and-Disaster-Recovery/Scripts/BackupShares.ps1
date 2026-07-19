$Source = "C:\Shares"
$Destination = "C:\Backups"

Copy-Item `
    -Path $Source `
    -Destination $Destination `
    -Recurse `
    -Force

Write-Host ""
Write-Host "Backup Completed Successfully" -ForegroundColor Green