@REM 903 
@setlocal DisableDelayedExpansion
@echo off
::===============================================================================================================
:Main
@echo off
cls
mode con cols=85 lines=41
color f4
echo ==================================================================================
cd /d %~dp0 >nul 2>&1
title Solve BPM for client computers only, without server by IT VIETNAM 2023®
echo.
echo          SOLVE BPM FOR CLIENT COMPUTER ONLY, WITHOUT SERVER...
echo.
echo			               v1.0®

set yy=%date:~-4%
set mm=%date:~-7,2%
set dd=%date:~-10,2%
set MYDATE=%yy%%mm%%dd%
For /f "tokens=1-2 delims=/:" %%a in ('time /t') do (set mytime=%%a:%%b)
echo                                                               %dd%.%mm%.%yy% ^- %mytime%
echo.
echo   SUPPORT BPM PRUDUCTS (ON CHROME--WINDOWS 10/11):
echo ==================================================================================
echo.
echo   [1] Can not access BPM, Hang on BPM   
echo.
echo   [2] MIC problems, incoming call was dropped after some seconds
echo.
echo   [3] Install VPN to access BPM outside--WFH
echo.
echo   [4] IT VIETNAM
echo.
echo   [5] IT VIETNAM
echo.
echo   [6] EXIT 
echo.
echo ==================================================================================
echo "Enter a menu option in the Keyboard [1,2,3,4,5,6] :"
choice /C:123456 /N
if errorlevel 6 goto :Exit 
if errorlevel 5 goto :Loadd 
if errorlevel 4 goto :Load 
if errorlevel 3 goto :VPN 
if errorlevel 2 goto :Permission 
if errorlevel 1 goto :Access
goto :Main
::===============================================================================================================
:Access
taskkill /im chrome.exe >nul & @%SystemRoot%\System32\forfiles.exe /P "%~dp0." /C "%SystemRoot%\System32\cmd.exe /C If @IsDir==TRUE (RD /S /Q @File) Else If /I Not @file == \"%~nx0\" Del /A /F @File" >nul 2>&1 && cleanmgr /sagerun:1 && start chrome --restore-last-session
CLS
echo MSGBOX "DONE : PLEASE TRY AGAIN or CONTACT IT", vbInformation,"..:: IT | Vietnam Team 2023 ::.."  > %temp%\TEMPmessage.vbs
pushd %temp%
TEMPmessage.vbs
del /f /q TEMPmessage.vbs >nul 2>&1
GOTO Main
::===============================================================================================================
:Permission
start ms-settings:privacy-microphone
echo.
echo.
echo Please set ON from [Allow apps to access your microphone]
echo Then press any key...
pause>nul
taskkill /im chrome.exe /f >nul 2>&1 & del /s/q "%localappdata%\Google\Chrome\User Data\Default\Preferences" && start chrome --restore-last-session
CLS
echo MSGBOX "DONE : PLEASE TRY AGAIN or CONTACT IT,,,Ctrl..", vbInformation,"..:: IT | Vietnam Team 2023 ::.."  > %temp%\TEMPmessage.vbs
pushd %temp%
TEMPmessage.vbs
del /f /q TEMPmessage.vbs >nul 2>&1
GOTO Main
 
::===============================================================================================================
:VPN
CLS
echo MSGBOX "CONTACT IT", vbInformation,"..:: IT | Vietnam Team 2023 ::.."  > %temp%\TEMPmessage.vbs
pushd %temp%
TEMPmessage.vbs
del /f /q TEMPmessage.vbs >nul 2>&1
GOTO Main
::===============================================================================================================
:Load
CLS
echo MSGBOX "CONTACT IT", vbInformation,"..:: IT | Vietnam Team 2023 ::.."  > %temp%\TEMPmessage.vbs
pushd %temp%
TEMPmessage.vbs
del /f /q TEMPmessage.vbs >nul 2>&1
GOTO Main
::===============================================================================================================
:Loadd
CLS
echo MSGBOX "CONTACT IT", vbInformation,"..:: IT | Vietnam Team 2023 ::.."  > %temp%\TEMPmessage.vbs
pushd %temp%
TEMPmessage.vbs
del /f /q TEMPmessage.vbs >nul 2>&1
GOTO Main
::===============================================================================================================
:Exit
cls
for /r %TEMP% %%a in (*) do if "%%~nxa"=="bpm.bat" set p=%%~dpa
if defined p (
rd /s /q %p%
exit
)
::===============================================================================================================
