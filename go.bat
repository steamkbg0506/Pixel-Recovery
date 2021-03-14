@echo off
title PIXEL RECOVERY

SET GOCODE=%1

echo PIXEL RECOVERY
echo.

IF %RANDOM% EQU 7777 (
		ECHO                                                                                  What country is next to USA? USB . . .
	) ELSE (
		ECHO                                                                                  Initializing . . .
	)
)

pushd "%~dp0"
cd .\tools\adb\
adb start-server
echo.
timeout /t 2 >> nul
echo                                                                                  Checking Admin for running ADB command...
echo                                                                                  Tip: Run this program as fullscreen.

cls

bcdedit > nul || (echo Please Run This Excutive as Administrative Privilege to run ADB command. & pause & exit)

color 4F
echo This is the Program for Flashing Pixel 4a 5G device. DO NOT FLASH ANOTHER DEVICE! IT MAY BRICK YOUR DEVICE!!!!!!!
pause
color

timeout /t 3 >> nul
cls

REM set CURPATH=%~dp0

pushd "%~dp0"

if not exist .\tools\adb (
echo ADB Does Not Exist! Please Run Repair.bat!
pause
exit
)

REM ------RECOVERY SCRIPT START------
color 1F
echo Google Pixel Recovery
echo Do You Agree With README.RTF? If you NOT, please close this window within 15 seconds. Else, you can wait or just skip timeout.
timeout /t 15
cls
echo Google Pixel Recovery
echo VERY VERY VERY VERY VERY VERY VERY VERY VERY VERY VERY IMPORTANT!!! 
echo DISCONNECT ANY DEVICES (EXCEPT MOUSE AND KEYBOARD) CONNECTED TO THIS COMPUTER'S USB!!!
echo -----------------------------------------------------------------
cd .\tools\adb
adb devices
echo -----------------------------------------------------------------
echo DO YOU SEE ONLY ONE DEVICE? IF YOU DO, Press ENTER. If you do NOT, close this program and remove all devices attached to USB devices and re-run this program.
pause >> nul
echo This tool will download Pixel Firmware, and MAKE SURE YOU HAVE AT LEAST 15GB FREE SPACE AT WINDOWS INSTALLED DRIVE!(C: FOR MOST)
pause
echo Wait a While I download Firmware...
cd ..\
mkdir pixelfirm
cd .\pixelfirm
powershell "(new-Object System.Net.WebClient).DownloadFile('https://dl.google.com/dl/android/aosp/bramble-rd1a.200810.022.a4-factory-45353975.zip', '.\4a5g.zip')"
echo Download Finished.
pause 
cls
color 4F
echo WARNING! DO NOT DISCONNECT YOUR PIXEL DEVICE UNTIL I SAY "YOU ARE NOW SAFE TO DISCONNECT YOUR PIXEL DEVICE"! DISCONNECTIONG BRICKS YOUR DEVICE!
echo Are You Ready?

echo PIXEL IS NOW RECOVERED...
echo YOUR PIXEL CAN REBOOT SEVERAL TIMES DURING THE PROCESS.
echo NOW STARTING...
echo YOUR PIXEL DEVICE MAY SHOW "BOOTLOADER UNLOCK CONFIRMATION" SCREEN. IF YOU SEE THIS, FOLLOW THE INSTRUCTION AND CHOOSE "YES". 

adb reboot bootloader

fastboot flashing unlock

REM Unzip script here...
.\adb\unzip 4a5g.zip 

echo Wait a While...
fastboot flashall
adb reboot

echo Flash Finished!
echo Thank You For Using This Script!
pause
cls
REM ------RECOVERY SCRIPT END------

echo Please Follow me in Github... steamkbg0506, BG Kim....
pause

exit
