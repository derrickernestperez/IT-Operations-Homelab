[CmdletBinding()]
param(
    [string]$ModulePath = (Split-Path -Parent $PSScriptRoot)
)

$ErrorActionPreference = 'Stop'

$results = [System.Collections.Generic.List[object]]::new()

function Add-ValidationResult {
    param(
        [Parameter(Mandatory)]
        [string]$Check,

        [Parameter(Mandatory)]
        [bool]$Passed,

        [Parameter(Mandatory)]
        [string]$Details
    )

    $results.Add([pscustomobject]@{
        Check   = $Check
        Passed  = $Passed
        Details = $Details
    })
}

function Test-RequiredFile {
    param(
        [Parameter(Mandatory)]
        [string]$RelativePath
    )

    $fullPath = Join-Path $ModulePath $RelativePath
    $exists = Test-Path -LiteralPath $fullPath -PathType Leaf

    if ($exists) {
        $file = Get-Item -LiteralPath $fullPath
        $notEmpty = $file.Length -gt 0

        Add-ValidationResult `
            -Check "Required file: $RelativePath" `
            -Passed $notEmpty `
            -Details $(if ($notEmpty) {
                "File exists and is not empty."
            }
            else {
                "File exists but is empty."
            })
    }
    else {
        Add-ValidationResult `
            -Check "Required file: $RelativePath" `
            -Passed $false `
            -Details "File is missing."
    }
}

Write-Host ''
Write-Host 'MFA and Conditional Access Readiness Validation'
Write-Host '================================================'
Write-Host "Module path: $ModulePath"
Write-Host ''

if (-not (Test-Path -LiteralPath $ModulePath -PathType Container)) {
    throw "Module path does not exist: $ModulePath"
}

$requiredDirectories = @(
    'Architecture',
    'Evidence/Screenshots',
    'Policies',
    'Procedures',
    'Reports',
    'Scripts'
)

foreach ($directory in $requiredDirectories) {
    $fullPath = Join-Path $ModulePath $directory
    $exists = Test-Path -LiteralPath $fullPath -PathType Container

    Add-ValidationResult `
        -Check "Required directory: $directory" `
        -Passed $exists `
        -Details $(if ($exists) {
            'Directory exists.'
        }
        else {
            'Directory is missing.'
        })
}

$requiredFiles = @(
    'README.md',

    'Policies/CA001-Require-MFA-All-Users.md',
    'Policies/CA002-Require-MFA-Administrators.md',
    'Policies/CA003-Block-Legacy-Authentication.md',
    'Policies/CA004-Restrict-Untrusted-Locations.md',
    'Policies/CA005-Require-Managed-Device.md',

    'Procedures/SOP-MFA-Registration.md',
    'Procedures/SOP-MFA-Reset.md',
    'Procedures/SOP-Emergency-Access.md',
    'Procedures/SOP-Conditional-Access-Deployment.md',

    'Reports/MFA-Sign-In-Validation.csv',
    'Reports/Conditional-Access-Readiness.csv',
    'Reports/Security-Defaults-State.txt',
    'Reports/Authentication-Methods-Inventory.csv',

    'Evidence/Screenshots/01-authentication-methods-policy-baseline.png',
    'Evidence/Screenshots/02-security-defaults-baseline.png',
    'Evidence/Screenshots/03-conditional-access-licence-limitation.png',
    'Evidence/Screenshots/04-global-administrator-baseline.png',
    'Evidence/Screenshots/05-emergency-access-account-01-created.png',
    'Evidence/Screenshots/06-emergency-access-account-02-created.png',
    'Evidence/Screenshots/07-emergency-access-01-global-administrator.png',
    'Evidence/Screenshots/08-emergency-access-02-global-administrator.png',
    'Evidence/Screenshots/09-emergency-access-01-signin-validation.png',
    'Evidence/Screenshots/10-mfa-pilot-group-created.png',
    'Evidence/Screenshots/11-mfa-pilot-user-membership.png',
    'Evidence/Screenshots/12-microsoft-authenticator-pilot-policy.png',
    'Evidence/Screenshots/13-pilot-user-authenticator-registration.png',
    'Evidence/Screenshots/14-pilot-mfa-signin-authentication-details.png',
    'Evidence/Screenshots/15-emergency-access-01-authentication-status.png',
    'Evidence/Screenshots/16-emergency-access-02-authentication-status.png'
)

foreach ($file in $requiredFiles) {
    Test-RequiredFile -RelativePath $file
}

$textExtensions = @('.md', '.txt', '.csv', '.ps1')

$textFiles = Get-ChildItem `
    -LiteralPath $ModulePath `
    -Recurse `
    -File |
    Where-Object {
        $_.Extension -in $textExtensions
    }

$secretPatterns = @(
    '(?i)password\s*[:=]\s*[^\s\[\]<]+',
    '(?i)client[_ -]?secret\s*[:=]',
    '(?i)access[_ -]?token\s*[:=]',
    '(?i)refresh[_ -]?token\s*[:=]',
    '(?i)temporary access pass\s*[:=]\s*\S+',
    '(?i)recovery code\s*[:=]\s*\S+'
)

$secretMatches = [System.Collections.Generic.List[string]]::new()

foreach ($file in $textFiles) {
    $content = Get-Content -LiteralPath $file.FullName -Raw

    foreach ($pattern in $secretPatterns) {
        if ($content -match $pattern) {
            $secretMatches.Add(
                $file.FullName.Substring($ModulePath.Length).TrimStart('\', '/')
            )
            break
        }
    }
}

Add-ValidationResult `
    -Check 'No obvious passwords, tokens, or recovery secrets' `
    -Passed ($secretMatches.Count -eq 0) `
    -Details $(if ($secretMatches.Count -eq 0) {
        'No obvious secret patterns detected.'
    }
    else {
        "Review these files: $($secretMatches -join ', ')"
    })

$tenantDomainPattern = '(?i)\b(?!yourtenant\b)[a-z0-9][a-z0-9.-]*\.onmicrosoft\.com\b'
$tenantDomainMatches = [System.Collections.Generic.List[string]]::new()

foreach ($file in $textFiles) {
    $content = Get-Content -LiteralPath $file.FullName -Raw

    if ($content -match $tenantDomainPattern) {
        $tenantDomainMatches.Add(
            $file.FullName.Substring($ModulePath.Length).TrimStart('\', '/')
        )
    }
}

Add-ValidationResult `
    -Check 'No real onmicrosoft.com tenant domain in text files' `
    -Passed ($tenantDomainMatches.Count -eq 0) `
    -Details $(if ($tenantDomainMatches.Count -eq 0) {
        'No real tenant domain detected.'
    }
    else {
        "Review these files: $($tenantDomainMatches -join ', ')"
    })

$policyFiles = Get-ChildItem `
    -LiteralPath (Join-Path $ModulePath 'Policies') `
    -Filter 'CA*.md' `
    -File `
    -ErrorAction SilentlyContinue

$designOnlyCount = 0

foreach ($policyFile in $policyFiles) {
    $content = Get-Content -LiteralPath $policyFile.FullName -Raw

    if ($content -match 'DESIGN ONLY\s*[—-]\s*LICEN[CS]E REQUIRED') {
        $designOnlyCount++
    }
}

Add-ValidationResult `
    -Check 'All five Conditional Access policies classified correctly' `
    -Passed ($policyFiles.Count -eq 5 -and $designOnlyCount -eq 5) `
    -Details "Policy files found: $($policyFiles.Count); correctly classified: $designOnlyCount."

$passedChecks = @($results | Where-Object Passed).Count
$failedChecks = @($results | Where-Object { -not $_.Passed }).Count
$totalChecks  = $results.Count

$finalStatus = if ($failedChecks -eq 0) {
    'PASSED'
}
else {
    'FAILED'
}

Write-Host ''
$results |
    Select-Object Check, Passed, Details |
    Format-Table -AutoSize -Wrap

Write-Host ''
Write-Host "TotalChecks  : $totalChecks"
Write-Host "PassedChecks : $passedChecks"
Write-Host "FailedChecks : $failedChecks"
Write-Host "FinalStatus  : $finalStatus"
Write-Host ''

$reportPath = Join-Path $ModulePath 'Reports/Final-Validation.txt'

$reportLines = @(
    'MFA and Conditional Access Readiness — Final Validation'
    '======================================================='
    ''
    "ValidationDate : $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
    "TotalChecks    : $totalChecks"
    "PassedChecks   : $passedChecks"
    "FailedChecks   : $failedChecks"
    "FinalStatus    : $finalStatus"
    ''
    'Detailed Results'
    '----------------'
)

foreach ($result in $results) {
    $resultText = if ($result.Passed) { 'PASS' } else { 'FAIL' }

    $reportLines += (
        '[{0}] {1} — {2}' -f
        $resultText,
        $result.Check,
        $result.Details
    )
}

$reportLines |
    Set-Content `
        -LiteralPath $reportPath `
        -Encoding UTF8

Write-Host "Validation report written to:"
Write-Host $reportPath

if ($failedChecks -gt 0) {
    exit 1
}

exit 0