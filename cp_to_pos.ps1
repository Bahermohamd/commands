$ip = (Get-NetIPConfiguration | Where-Object { $_.IPv4DefaultGateway -ne $null -and $_.NetAdapter.Status -ne "Disconnected"}).IPv4Address.IPAddress
$br = $ip.split('.')[2]


foreach ($i in (11, 12, 13, 14)){
	cp -r c:\ABD02072024V2 \\10.20.$br.$i\c$\
	write-host "10.20.$br.$i ok"
}