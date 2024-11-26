@echo off

for /L %%a in (10,1,11) do (

	echo 10.20.53.%%a
	ping -n 1 10.20.53.%%a | find /I "Lost = 0"  
	IF %errorlevel% == 0 (
		echo 10.20.53.%%a is valid
		echo 10.20.53.%%a, >> c:\users\baher.mohamed\Desktop\formats.txt
		for /f %%x in ('wmic  /node: 10.20.53.%%a computersystem get name ^| FINDSTR /I /V "Name"') do (@echo|set /p="%%x") >> c:\users\baher.mohamed\Desktop\formats.txt
		echo , >> c:\users\baher.mohamed\Desktop\formats.txt
		for /f %%x in ('wmic  /node: 10.20.53.%%a baseboard get product ^| FINDSTR /I /V "product"') do (@echo|set /p="%%x") >> c:\users\baher.mohamed\Desktop\formats.txt
		echo , >> c:\users\baher.mohamed\Desktop\formats.txt
		for /f %%x in ('wmic  /node: 10.20.53.%%a bios get serialnumber ^| FINDSTR /I /V "SerialNumber"') do (@echo|set /p="%%x") >> c:\users\baher.mohamed\Desktop\formats.txt
		echo , >> c:\users\baher.mohamed\Desktop\formats.txt
		wmic /node: 10.20.53.%%a csproduct get name | FINDSTR /I /V "Name" >> c:\users\baher.mohamed\Desktop\formats.txt
	)

)

echo We Are Done
pause
notepad c:\users\baher.mohamed\Desktop\formats.txt