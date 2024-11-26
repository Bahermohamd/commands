$ip = (Get-NetIPConfiguration | Where-Object { $_.IPv4DefaultGateway -ne $null -and $_.NetAdapter.Status -ne "Disconnected"}).IPv4Address.IPAddress
$br = $ip.split('.')[2]


cd 'c:\Dynamics_v5\'

foreach ($i in (11, 12, 13, 14)){
    $pingResult = Test-Connection -ComputerName "10.20.$br.$i" -Count 1

    if ($pingResult.StatusCode -eq 0) {
    Write-Host "Ping successful"
    try {cp .\Receipt.rdlc \\10.20.$br.$i\C$\'Program Files\Microsoft Dynamics 365\10.0\Store Commerce\Extensions\ALOthaim.POSCustomization\HardwareStation\'}
    catch [System.IO.FileNotFoundException] {Write-Host "File not found: " $_.Exception.Message}
    catch [System.UnauthorizedAccessException] {Write-Host "Permission error: " $_.Exception.Message} 
    catch {Write-Host "An unexpected error occurred: " $_.Exception.Message}

    try {cp *.dll \\10.20.$br.$i\c$\'Program Files\Microsoft Dynamics 365\10.0\Store Commerce\Microsoft\contentFiles\HardwareStation\'}
    catch [System.IO.FileNotFoundException] {Write-Host "File not found: " $_.Exception.Message}
    catch [System.UnauthorizedAccessException] {Write-Host "Permission error: " $_.Exception.Message} 
    catch {Write-Host "An unexpected error occurred: " $_.Exception.Message}

    write-host "10.20.$br.$i ok"

    } else {
        Write-Host "10.20.$br.$i offline"
    }
    
}

