$OS = Get-CimInstance Win32_OperatingSystem

$CPUValue = (
    Get-Counter '\Processor(_Total)\% Processor Time' `
        -SampleInterval 1 `
        -MaxSamples 3
).CounterSamples |
Measure-Object CookedValue -Average |
Select-Object -ExpandProperty Average

$MemoryFreeGB = [math]::Round(
    $OS.FreePhysicalMemory / 1MB,
    2
)

$MemoryUsedPercent = [math]::Round(
    100 - (
        $OS.FreePhysicalMemory /
        $OS.TotalVisibleMemorySize *
        100
    ),
    2
)

$SystemDrive = Get-CimInstance Win32_LogicalDisk `
    -Filter "DeviceID='C:'"

$DiskFreePercent = [math]::Round(
    ($SystemDrive.FreeSpace / $SystemDrive.Size) * 100,
    2
)

$CriticalServices = @(
    "NTDS",
    "DNS",
    "DHCPServer",
    "WsusService",
    "W3SVC",
    "WinRM"
)

$StoppedCriticalServices = foreach ($ServiceName in $CriticalServices) {
    $Service = Get-Service `
        -Name $ServiceName `
        -ErrorAction SilentlyContinue

    if ($Service -and $Service.Status -ne "Running") {
        $ServiceName
    }
}

$RecentCriticalErrors = (
    Get-WinEvent `
        -FilterHashtable @{
            LogName   = "System"
            Level     = 1, 2
            StartTime = (Get-Date).AddHours(-24)
        } `
        -ErrorAction SilentlyContinue
).Count

$HealthStatus = "Healthy"

if (
    $CPUValue -ge 90 -or
    $MemoryUsedPercent -ge 90 -or
    $DiskFreePercent -lt 10 -or
    $StoppedCriticalServices.Count -gt 0
) {
    $HealthStatus = "Critical"
}
elseif (
    $CPUValue -ge 80 -or
    $MemoryUsedPercent -ge 80 -or
    $DiskFreePercent -lt 20 -or
    $RecentCriticalErrors -gt 0
) {
    $HealthStatus = "Warning"
}

[PSCustomObject]@{
    Timestamp               = Get-Date
    ComputerName            = $env:COMPUTERNAME
    UptimeDays              = [math]::Round(
        ((Get-Date) - $OS.LastBootUpTime).TotalDays,
        2
    )
    CPUPercent              = [math]::Round($CPUValue, 2)
    MemoryUsedPercent       = $MemoryUsedPercent
    FreeMemoryGB            = $MemoryFreeGB
    SystemDriveFreePercent  = $DiskFreePercent
    StoppedCriticalServices = if ($StoppedCriticalServices) {
        $StoppedCriticalServices -join ", "
    }
    else {
        "None"
    }
    CriticalErrorsLast24H   = $RecentCriticalErrors
    OverallHealth           = $HealthStatus
}
