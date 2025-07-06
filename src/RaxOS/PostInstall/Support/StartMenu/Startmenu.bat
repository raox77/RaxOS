@echo off
if /i "%~1"=="/disable"         goto disable

title Startmenu toggle script
cls

echo.	Press [1] to Disable Startmenu
echo.	Press [2] to Enable Startmenu
echo.
set /p c="Enter your answer: "
if /i %c% equ 1 goto :disable
if /i %c% equ 2 goto :enable

:disable
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d "0" /f
taskkill /f /im explorer.exe
taskkill /f /im SearchHost.exe
C:\Modules\NSudo.exe -U:S -P:E cmd.exe /c ren C:\Windows\SystemApps\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy\StartMenuExperienceHost.old StartMenuExperienceHost.exe
C:\Modules\NSudo.exe -U:S -P:E cmd.exe /c ren C:\Windows\SystemApps\MicrosoftWindows.Client.CBS_cw5n1h2txyewy\SearchHost.old SearchHost.exe
start /b /wait "" "C:\Modules\OpenShellSetup_4_4_196.exe" /qn ADDLOCAL=StartMenu >nul 2>&1
start explorer.exe
cls
pause
exit

:enable
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d "3" /f
sc start wsearch
taskkill /f /im explorer.exe
C:\Modules\NSudo.exe -U:S -P:E cmd.exe /c ren C:\Windows\SystemApps\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy\StartMenuExperienceHost.old StartMenuExperienceHost.exe
C:\Modules\NSudo.exe -U:S -P:E cmd.exe /c ren C:\Windows\SystemApps\MicrosoftWindows.Client.CBS_cw5n1h2txyewy\SearchHost.old SearchHost.exe
wmic product where name="Open-Shell" call uninstall /nointeractive
start explorer.exe
cls
pause
exit