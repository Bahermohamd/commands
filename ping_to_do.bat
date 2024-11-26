@echo off

set str=string

for /L %%a in (9,1,11) do (

	echo %str%
	$str=ping -n 1 10.20.53.%%a | find /I "Lost = 0"  
	IF %errorlevel% == 0 (
		echo  %errorlevel%
		echo 10.20.53.%%a is valid	
	) ELSE (echo error)
)

echo We Are Done
pause
