$HoneyAccount = "sql_backup_admin"

Write-Host "Monitoring Honey Account..." -ForegroundColor Green

while ($true)
{
    $Events = Get-WinEvent `
        -LogName Security `
        -MaxEvents 20 `
        -ErrorAction SilentlyContinue

    foreach ($Event in $Events)
    {
        if ($Event.Message -match $HoneyAccount)
        {
            $Timestamp = Get-Date

            $Alert = @"
[$Timestamp]
ALERT: Honey Account Activity Detected
Account: $HoneyAccount

"@

            Add-Content `
                -Path "C:\Homelab\Security-Monitoring\Logs\HoneyAccountAlerts.log" `
                -Value $Alert

            Write-Host "ALERT DETECTED!" -ForegroundColor Red
        }
    }

    Start-Sleep -Seconds 30
}