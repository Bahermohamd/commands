$ip = (Get-NetIPConfiguration | Where-Object { $_.IPv4DefaultGateway -ne $null -and $_.NetAdapter.Status -ne "Disconnected"}).IPv4Address.IPAddress
$br = $ip.split('.')[2]

foreach ($i in (11, 12, 13)){
cp .\Receipt.rdlc "\\10.20.$br.$i\c$\Program Files\Microsoft Dynamics 365\10.0\Store Commerce\Extensions\ALOthaim.POSCustomization\HardwareStation"
cp *.dll "\\10.20.$br.$i\c$\Program Files\Microsoft Dynamics 365\10.0\Store Commerce\Microsoft\contentFiles\HardwareStation"
}
