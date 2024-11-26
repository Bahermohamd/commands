@echo off

echo ip, >> c:\users\baher.mohamed\Desktop\formats.txt
echo copmuter_name, >> c:\users\baher.mohamed\Desktop\formats.txt
echo proudct, >> c:\users\baher.mohamed\Desktop\formats.txt
echo sn, >> c:\users\baher.mohamed\Desktop\formats.txt
echo scproduct_name >> c:\users\baher.mohamed\Desktop\formats.txt
echo ------------------------------ >> c:\users\baher.mohamed\Desktop\formats.txt

for %%a in (10, 12, 11) do (

	echo 10.20.53.%%a, >> c:\users\baher.mohamed\Desktop\formats.txt
	for /f %%x in ('wmic  /node: 10.20.53.%%a computersystem get name ^| FINDSTR /I /V "Name"') do (@echo|set /p="%%x") >> c:\users\baher.mohamed\Desktop\formats.txt
	echo , >> c:\users\baher.mohamed\Desktop\formats.txt
	for /f %%x in ('wmic  /node: 10.20.53.%%a baseboard get product ^| FINDSTR /I /V "product"') do (@echo|set /p="%%x") >> c:\users\baher.mohamed\Desktop\formats.txt
	echo , >> c:\users\baher.mohamed\Desktop\formats.txt
	for /f %%x in ('wmic  /node: 10.20.53.%%a bios get serialnumber ^| FINDSTR /I /V "SerialNumber"') do (@echo|set /p="%%x") >> c:\users\baher.mohamed\Desktop\formats.txt
	echo , >> c:\users\baher.mohamed\Desktop\formats.txt
	wmic /node: 10.20.53.%%a csproduct get name | FINDSTR /I /V "Name" >> c:\users\baher.mohamed\Desktop\formats.txt
)

notepad formats.txt
pause