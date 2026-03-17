# Get the top 5 processes with the highest memory usage (Working Set)
# Sort in descending order and select the first 5 results
$topProcesses = Get-Process | Sort-Object -Property WS -Descending | Select-Object -First 5 Name, WS

Write-Host "--- Top 5 Memory Consuming Processes ---"
Write-Host ""

$totalRamMB = 0

# Iterate through the top processes, display their usage, and calculate the total
foreach ($process in $topProcesses) {
    # Convert WorkingSet (WS) from bytes to megabytes (MB)
    $memoryMB = [math]::Round(($process.WS / 1MB), 2)
    Write-Host ("Name: {0,-25} Memory (MB): {1}" -f $process.Name, $memoryMB)
    $totalRamMB += $memoryMB
}

Write-Host ""
Write-Host "----------------------------------------"
Write-Host ("Total RAM consumption of the top 5 processes: {0} MB" -f [math]::Round($totalRamMB, 2))

