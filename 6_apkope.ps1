$logFile = "$env:USERPROFILE\Documents\Apkope.log"
$timestamp = Get-Date -Format "dd.MM.yyyy HH:mm:ss"

$disk = Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='C:'"
$freePercent = ($disk.FreeSpace / $disk.Size) * 100

if ($freePercent -lt 25) {
    $spaceBefore = (Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='C:'").FreeSpace
    
    Get-ChildItem -Path $env:TEMP -Recurse -ErrorAction SilentlyContinue | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue
    
    Clear-RecycleBin -DriveLetter C -Confirm:$false -ErrorAction SilentlyContinue
    
    $spaceAfter = (Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='C:'").FreeSpace
    $freedBytes = $spaceAfter - $spaceBefore
    $freedGB = [Math]::Round($freedBytes / 1GB, 2)
    
    "[$timestamp] Tīrīšana veikta. Atbrīvoti $freedGB GB." | Out-File -FilePath $logFile -Append
} else {
    "[$timestamp] Vieta pietiekama." | Out-File -FilePath $logFile -Append
}
