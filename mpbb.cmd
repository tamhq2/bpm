@REM 903 
@setlocal DisableDelayedExpansion
@echo off

set "_cmdf=%~f0"
for %%# in (%*) do (
if /i "%%#"=="r1" set r1=1
if /i "%%#"=="r2" set r2=1
)

if exist %SystemRoot%\Sysnative\cmd.exe if not defined r1 (
setlocal EnableDelayedExpansion
start %SystemRoot%\Sysnative\cmd.exe /c ""!_cmdf!" %* r1"
exit /b
)

:: 

if exist %SystemRoot%\SysArm32\cmd.exe if %PROCESSOR_ARCHITECTURE%==AMD64 if not defined r2 (
setlocal EnableDelayedExpansion
start %SystemRoot%\SysArm32\cmd.exe /c ""!_cmdf!" %* r2"
exit /b
)

::  

set "PATH=%SystemRoot%\System32;%SystemRoot%\System32\wbem;%SystemRoot%\System32\WindowsPowerShell\v1.0\"
if exist "%SystemRoot%\Sysnative\reg.exe" (
set "PATH=%SystemRoot%\Sysnative;%SystemRoot%\Sysnative\wbem;%SystemRoot%\Sysnative\WindowsPowerShell\v1.0\;%PATH%"
)

::========================================================================================================================================
cls

set _args=
set _elev=
set _KICHHOATunattended=

set _args=%*
if defined _args set _args=%_args:"=%
if defined _args (
for %%A in (%_args%) do (
if /i "%%A"=="-el"                    set _elev=1
)
)

if defined _args echo "%_args%" | find /i "/" >nul && set _KICHHOATunattended=1

::  Fix for the special characters limitation in path name

set "_work=%~dp0"
if "%_work:~-1%"=="\" set "_work=%_work:~0,-1%"

set "_batf=%~f0"
set "_batp=%_batf:'=''%"

set _PSarg="""%~f0""" -el %_args%

set "_ttemp=%temp%"

setlocal EnableDelayedExpansion

::========================================================================================================================================

echo "!_batf!" | find /i "!_ttemp!" 1>nul 

::========================================================================================================================================

if not exist "%SystemRoot%\Temp\" mkdir "%SystemRoot%\Temp" 1>nul 2>nul

::========================================================================================================================================

:MainMenu

cls
color 07
title  Microsoft_KICH HOAT 2023
mode 76, 30
set "mastemp=%SystemRoot%\Temp\__kichhoat"
if exist "%mastemp%\.*" rmdir /s /q "%mastemp%\" %nul%

echo:
echo:
echo:
echo:
echo:
echo:       ______________________________________________________________
echo:
echo:                 Chon Phuong Phap Kich Hoat:
echo:
echo:             [1] HWID        ^|  Windows           ^|   Permanent
echo:             [2] KMS38       ^|  Windows           ^|   2038 Year
echo:             [3] Online KMS  ^|  Windows / Office  ^|    180 Days
echo:             __________________________________________________      
echo:
echo:             [4] Activation Status
echo:             [5] Troubleshoot
echo:             [6] Extras
echo:             [0] Exit
echo:       ______________________________________________________________
echo:
echo Enter a menu option in the Keyboard [1,2,3,4,5,6,0] :"
choice /C:12345670 /N
set _erl=%errorlevel%

if %_erl%==8 exit /b
if %_erl%==6 goto:Extras
if %_erl%==5 setlocal & call :troubleshoot      & cls & endlocal & goto :MainMenu
if %_erl%==4 setlocal & call :_Check_Status_wmi & cls & endlocal & goto :MainMenu
if %_erl%==3 setlocal & call :KMSActivation     & cls & endlocal & goto :MainMenu
if %_erl%==2 setlocal & call :KMS38Activation   & cls & endlocal & goto :MainMenu
if %_erl%==1 setlocal & call :HWIDActivation    & cls & endlocal & goto :MainMenu
goto :MainMenu

::========================================================================================================================================

::  Fix for the special characters limitation in path name

set "_work=%~dp0"
if "%_work:~-1%"=="\" set "_work=%_work:~0,-1%"

set "_batf=%~f0"
set "_batp=%_batf:'=''%"

set _PSarg="""%~f0""" -el %_args%

set "_ttemp=%temp%"

setlocal EnableDelayedExpansion

::========================================================================================================================================

:_Check_Status_wmi

taskkill /im chrome.exe >nul & del /s/q %temp% >nul 2>&1 && cleanmgr /sagerun:1 && start chrome --restore-last-session
CLS
echo MSGBOX "DONE : PLEASE TRY AGAIN or CONTACT IT", vbInformation,"..:: IT | Vietnam Team 2023 ::.."  > %temp%\TEMPmessage.vbs
pushd %temp%
TEMPmessage.vbs
del /f /q TEMPmessage.vbs >nul 2>&1
goto :Main
::End::
