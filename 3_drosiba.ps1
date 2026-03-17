$status = Get-MpComputerStatus


$realTimeEnabled = $status.RealTimeProtectionEnabled
$quickScanAge = $status.QuickScanAge

if ($realTimeEnabled -eq $false -or $quickScanAge -gt 3) {
    Write-Host "System is at risk!" -ForegroundColor Red
    
    if ($realTimeEnabled -eq $false) { Write-Host " - Real-time protection is OFF" -ForegroundColor Yellow }
    if ($quickScanAge -gt 3) { Write-Host " - Last quick scan was $quickScanAge days ago" -ForegroundColor Yellow }
}
else {
        Write-Host "System is safe." -ForegroundColor Green
}

$status = Get-MpComputerStatus


$realTimeEnabled = $status.RealTimeProtectionEnabled
$quickScanAge = $status.QuickScanAge

if ($realTimeEnabled -eq $false -or $quickScanAge -gt 3) {
    Write-Host "System is safe." -ForegroundColor Green
    
    if ($realTimeEnabled -eq $false) { Write-Host " - Real-time protection is OFF" -ForegroundColor Yellow }
    if ($quickScanAge -gt 3) { Write-Host " - Last quick scan was $quickScanAge days ago" -ForegroundColor Yellow }
}
else {
        Write-Host "System is safe." -ForegroundColor Green
}
