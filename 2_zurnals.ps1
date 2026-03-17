$outputPath = Join-Path ([Environment]::GetFolderPath("MyDocuments")) "Errors.txt"

$dateLimit = (Get-Date).AddDays(-7)

$errors = Get-EventLog -LogName System -EntryType Error -After $dateLimit | 
          Select-Object TimeGenerated, Message

$header = if ($errors.Count -gt 10) {
    "[CRITICAL] System is unstable!"
} else {
    "[OK] Error level is normal."
}

$report = New-Object System.Collections.Generic.List[string]
$report.Add($header)
$report.Add("-" * 30)

foreach ($err in $errors) {
    $report.Add("$($err.TimeGenerated) - $($err.Message)")
}

$report | Out-File -FilePath $outputPath -Encoding utf8

Write-Host "Document create: $outputPath" -ForegroundColor Cyan
