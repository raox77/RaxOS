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
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\wsearch" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d "0" /f
taskkill /f /im explorer.exe
taskkill /f /im SearchApp.exe
taskkill /f /im SearchHost.exe
cd C:\Windows\SystemApps\Microsoft.Windows.Search_cw5n1h2txyewy
takeown /f "SearchApp.exe"
icacls "C:\Windows\SystemApps\Microsoft.Windows.Search_cw5n1h2txyewy\SearchApp.exe" /grant Administrators:F
ren SearchApp.exe SearchApp.old
cd C:\Windows\SystemApps\MicrosoftWindows.Client.CBS_cw5n1h2txyewy
takeown /f "SearchHost.exe"
icacls "C:\Windows\SystemApps\MicrosoftWindows.Client.CBS_cw5n1h2txyewy\SearchHost.exe" /grant Administrators:F
ren SearchHost.exe SearchHost.old
cd C:\Windows\SystemApps\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy
takeown /f "StartMenuExperienceHost.exe"
icacls "C:\Windows\SystemApps\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy\StartMenuExperienceHost.exe" /grant Administrators :F
ren StartMenuExperienceHost.exe StartMenuExperienceHost.old
start /b /wait "" "C:\Modules\OpenShellSetup_4_4_191.exe" /qn ADDLOCAL=StartMenu >nul 2>&1
start explorer.exe
cls
pause
exit

:enable
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\wsearch" /v "Start" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d "1" /f
sc start wsearch
taskkill /f /im explorer.exe
cd C:\Windows\SystemApps\Microsoft.Windows.Search_cw5n1h2txyewy
takeown /f "SearchApp.old"
icacls "C:\Windows\SystemApps\Microsoft.Windows.Search_cw5n1h2txyewy\SearchApp.old" /grant Administrators:F
ren SearchApp.old SearchApp.exe
cd C:\Windows\SystemApps\MicrosoftWindows.Client.CBS_cw5n1h2txyewy
takeown /f "SearchHost.old"
icacls "C:\Windows\SystemApps\MicrosoftWindows.Client.CBS_cw5n1h2txyewy\SearchHost.old" /grant Administrators:F
ren SearchHost.old SearchHost.exe
cd C:\Windows\SystemApps\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy
takeown /f "StartMenuExperienceHost.exe"
icacls "C:\Windows\SystemApps\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy\StartMenuExperienceHost.old" /grant Administrators :F
ren StartMenuExperienceHost.old StartMenuExperienceHost.exe
wmic product where name="Open-Shell" call uninstall /nointeractive
start explorer.exe
cls
pause
exit