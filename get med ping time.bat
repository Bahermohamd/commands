@echo off

set /A counter=0
set /A total=0
set /A resault=0

:LOOP



ping -n 1 10.20.0.2 | find /I "Lost = 0" 1> %TEMP%\temp.txt  
echo %errorlevel%
	IF %errorlevel% == 0 (
		set /A counter+=1
		for /f "tokens=5" %%f in ('ping ^-n 1 8.8.8.8 ^| findstr /c:"time="') do (set var=%%f && set /A total+=%var:~5,-3% )
		set /A resault=%total%/%counter%
		echo %resault%
	) ElSE (echo timed out)
goto LOOP:

