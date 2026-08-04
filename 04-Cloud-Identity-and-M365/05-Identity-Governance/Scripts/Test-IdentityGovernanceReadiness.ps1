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
                'File exists and is not empty.'
            }
            else {
                'File exists but is empty.'
            })
    }
    else {
        Add-ValidationResult `
            -Check "Required file: $RelativePath" `
            -Passed $false `
            -Details 'File is missing.'
    }
}

Write-Host ''
Write-Host 'Identity Governance Readiness Validation'
Write-Host '========================================'
Write-Host "Module path: $ModulePath"
Write-Host ''

if (-not (Test-Path -LiteralPath $ModulePath -PathType Container)) {
    throw "Module path does not exist: $ModulePath"
}

$requiredDirectories = @(
    'Architecture',
    'Evidence/Screenshots',
    'Procedures',
    'Reports',
    'Scripts',
    'Templates'
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

    'Architecture/Identity-Governance-Architecture.md',

    'Procedures/SOP-Joiner-Mover-Leaver.md',
    'Procedures/SOP-Quarterly-Access-Certification.md',

    'Reports/Disabled-Account-Access-Review.csv',
    'Reports/Manual-Access-Review-Summary.csv',
    'Reports/Privileged-Role-Review.csv',
    'Reports/Identity-Governance-Feature-Inventory.csv',

    'Templates/Separation-of-Duties-Matrix.csv',
    'Templates/Access-Request-Template.md',

    'Evidence/Screenshots/01-identity-governance-licence-baseline.png',
    'Evidence/Screenshots/02-global-administrator-access-review.png',
    'Evidence/Screenshots/03-guest-user-access-review.png',
    'Evidence/Screenshots/04-user-account-baseline.png',
    'Evidence/Screenshots/05-synchronized-user-review.png',
    'Evidence/Screenshots/06-cloud-only-user-review.png',
    'Evidence/Screenshots/07-mfa-pilot-group-access-review.png',
    'Evidence/Screenshots/08-assigned-administrative-roles-review.png',
    'Evidence/Screenshots/09-security-group-owner-review.png',
    'Evidence/Screenshots/10-disabled-user-account-review.png',
    'Evidence/Screenshots/11-disabled-account-access-review.png'
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
    '(?i)temporary password\s*[:=]\s*\S+',
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
            $relativePath = $file.FullName.Substring($ModulePath.Length).TrimStart('\', '/')
            $secretMatches.Add($relativePath)
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
        $relativePath = $file.FullName.Substring($ModulePath.Length).TrimStart('\', '/')
        $tenantDomainMatches.Add($relativePath)
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

$licenceRequiredFiles = @(
    'Reports/Identity-Governance-Feature-Inventory.csv',
    'Reports/Manual-Access-Review-Summary.csv',
    'Architecture/Identity-Governance-Architecture.md'
)

$licenceClassificationPassed = $true
$licenceClassificationDetails = [System.Collections.Generic.List[string]]::new()

foreach ($relativePath in $licenceRequiredFiles) {
    $fullPath = Join-Path $ModulePath $relativePath

    if (-not (Test-Path -LiteralPath $fullPath -PathType Leaf)) {
        $licenceClassificationPassed = $false
        $licenceClassificationDetails.Add("$relativePath is missing.")
        continue
    }

    $content = Get-Content -LiteralPath $fullPath -Raw

    if ($content -notmatch 'DESIGN ONLY\s*[—-]\s*LICEN[CS]E REQUIRED') {
        $licenceClassificationPassed = $false
        $licenceClassificationDetails.Add(
            "$relativePath does not contain the required licence classification."
        )
    }
}

Add-ValidationResult `
    -Check 'Licensed governance features classified correctly' `
    -Passed $licenceClassificationPassed `
    -Details $(if ($licenceClassificationPassed) {
        'Required governance files use DESIGN ONLY — LICENCE REQUIRED.'
    }
    else {
        $licenceClassificationDetails -join ' '
    })

$remediationReportPath = Join-Path $ModulePath 'Reports/Manual-Access-Review-Summary.csv'
$remediationPassed = $false
$remediationDetails = 'Manual access-review report is missing.'

if (Test-Path -LiteralPath $remediationReportPath -PathType Leaf) {
    $remediationContent = Get-Content -LiteralPath $remediationReportPath -Raw

    $containsPilotRemediation =
        $remediationContent -match 'MFA pilot group membership' -and
        $remediationContent -match 'Remediated'

    $containsOwnerRemediation =
        $remediationContent -match 'Security-group ownership' -and
        $remediationContent -match 'Remediated'

    $remediationPassed = $containsPilotRemediation -and $containsOwnerRemediation

    if ($remediationPassed) {
        $remediationDetails =
            'Pilot-group membership and missing group ownership are recorded as remediated.'
    }
    else {
        $remediationDetails =
            'Manual access-review summary does not clearly record both remediation actions.'
    }
}

Add-ValidationResult `
    -Check 'Governance findings and remediation documented' `
    -Passed $remediationPassed `
    -Details $remediationDetails

$guestReviewPath = Join-Path $ModulePath 'Reports/Manual-Access-Review-Summary.csv'
$guestReviewPassed = $false
$guestReviewDetails = 'Guest-user review record is missing.'

if (Test-Path -LiteralPath $guestReviewPath -PathType Leaf) {
    $guestReviewContent = Get-Content -LiteralPath $guestReviewPath -Raw

    $guestReviewPassed =
        $guestReviewContent -match 'Guest-user access' -and
        $guestReviewContent -match 'No guest users found'

    $guestReviewDetails = if ($guestReviewPassed) {
        'Zero guest users is documented in the manual access-review summary.'
    }
    else {
        'Guest-user review result is not clearly documented.'
    }
}

Add-ValidationResult `
    -Check 'Guest-user review result documented' `
    -Passed $guestReviewPassed `
    -Details $guestReviewDetails

$disabledReviewPath = Join-Path $ModulePath 'Reports/Disabled-Account-Access-Review.csv'
$disabledReviewPassed = $false
$disabledReviewDetails = 'Disabled-account review report is missing.'

if (Test-Path -LiteralPath $disabledReviewPath -PathType Leaf) {
    $disabledReviewContent = Get-Content -LiteralPath $disabledReviewPath -Raw

    $hasPlaceholder =
        $disabledReviewContent -match '\[ENTER NUMBER\]'

    $disabledReviewPassed = -not $hasPlaceholder

    $disabledReviewDetails = if ($disabledReviewPassed) {
        'Disabled-account review contains no unfinished number placeholders.'
    }
    else {
        'Replace all [ENTER NUMBER] placeholders with reviewed values.'
    }
}

Add-ValidationResult `
    -Check 'Disabled-account review completed' `
    -Passed $disabledReviewPassed `
    -Details $disabledReviewDetails

$privilegedReviewPath = Join-Path $ModulePath 'Reports/Privileged-Role-Review.csv'
$privilegedReviewPassed = $false
$privilegedReviewDetails = 'Privileged-role review report is missing.'

if (Test-Path -LiteralPath $privilegedReviewPath -PathType Leaf) {
    $privilegedReviewContent = Get-Content -LiteralPath $privilegedReviewPath -Raw

    $hasPlaceholder =
        $privilegedReviewContent -match '\[ENTER NUMBER\]'

    $privilegedReviewPassed = -not $hasPlaceholder

    $privilegedReviewDetails = if ($privilegedReviewPassed) {
        'Privileged-role review contains no unfinished placeholders.'
    }
    else {
        'Replace the [ENTER NUMBER] placeholder with the reviewed role count.'
    }
}

Add-ValidationResult `
    -Check 'Privileged-role review completed' `
    -Passed $privilegedReviewPassed `
    -Details $privilegedReviewDetails

$totalChecks = $results.Count
$passedChecks = @($results | Where-Object Passed).Count
$failedChecks = @($results | Where-Object { -not $_.Passed }).Count

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
    'Identity Governance Readiness — Final Validation'
    '================================================'
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
    $resultText = if ($result.Passed) {
        'PASS'
    }
    else {
        'FAIL'
    }

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

Write-Host 'Validation report written to:'
Write-Host $reportPath

if ($failedChecks -gt 0) {
    exit 1
}

exit 0
