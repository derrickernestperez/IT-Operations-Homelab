$RepoPath = "C:\Homelab"

$Folders = @(
    "00-Lab-Setup",
    "01-Identity-and-Access-Management",
    "02-Core-Infrastructure",
    "03-Enterprise-Operations"
)

foreach ($Folder in $Folders) {
    $FullPath = Join-Path $RepoPath $Folder

    Write-Host ""
    Write-Host "========================================"
    Write-Host $Folder
    Write-Host "========================================"

    if (Test-Path $FullPath) {
        Get-ChildItem $FullPath -Recurse |
        Select-Object @{Name="Path";Expression={
            $_.FullName.Replace("$RepoPath\", "")
        }}
    }
    else {
        Write-Host "Folder not found: $FullPath"
    }
}
