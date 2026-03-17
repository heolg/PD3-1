<#
.SYNOPSIS
    #>

Write-Host "Checking for updates..." -ForegroundColor Cyan
$upgradeList = winget upgrade

$upgrades = $upgradeList | Select-Object -Skip 3 | Where-Object { $_ -match '\w+' }

$count = $upgrades.Count

if ($count -gt 0) {
    Write-Host "`nВ sistem have [$count] programm, what need update:`n" -ForegroundColor Yellow
    
    
    $upgrades | ForEach-Object { Write-Host $_ }
} else {
    Write-Host "`nAll programmes updates." -ForegroundColor Green
}
