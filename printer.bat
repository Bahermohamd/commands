@echo off


echo 1-(EPSON TM-T20III Receipt)
echo 2-(EPSON TM-T20X Receipt)
echo 3-(EPSON TM-T88IV Receipt)
echo 4-(TH230 Receipt)
echo 5-(WINC-TH250)


echo ----------------------
set /p "pr=Enter printer number: "

IF %pr%==1 (
  cscript %WINDIR%\System32\Printing_Admin_Scripts\en-US\prncnfg.vbs -x -p "Receipt" -z "EPSON TM-T20III Receipt" & rundll32 printui.dll,PrintUIEntry /y /n "EPSON TM-T20III Receipt"
) ELSE IF %pr%==2 (
   cscript %WINDIR%\System32\Printing_Admin_Scripts\en-US\prncnfg.vbs -x -p "Receipt" -z  "EPSON TM-T20X Receipt" & rundll32 printui.dll,PrintUIEntry /y /n "EPSON TM-T20X Receipt"
) ELSE IF %pr%==3 (
   cscript %WINDIR%\System32\Printing_Admin_Scripts\en-US\prncnfg.vbs -x -p "Receipt" -z "EPSON TM-T88IV Receipt" & rundll32 printui.dll,PrintUIEntry /y /n "EPSON TM-T88IV Receipt"
) ELSE IF %pr%==4 (
   cscript %WINDIR%\System32\Printing_Admin_Scripts\en-US\prncnfg.vbs -x -p "Receipt" -z "TH230 Receipt" & rundll32 printui.dll,PrintUIEntry /y /n "TH230 Receipt"
) ELSE IF %pr%==5 (
   cscript %WINDIR%\System32\Printing_Admin_Scripts\en-US\prncnfg.vbs -x -p "Receipt" -z "WINC-TH250" & rundll32 printui.dll,PrintUIEntry /y /n "WINC-TH250"
)


::& rundll32 printui.dll,PrintUIEntry /y /n "Receipt"

pause