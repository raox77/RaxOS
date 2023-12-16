@echo off
if /i "%~1"=="/disable"         goto disable

title Startmenu toggle script
cls

echo.	Press [1] to Disable Startmenu
echo.	Press [2] to Enable Startmenu ( uninstall openshell first )
echo.
set /p c="Enter your answer: "
if /i %c% equ 1 goto :disable
if /i %c% equ 2 goto :enable

:disable
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\wsearch" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d "0" /f
taskkill /f /im explorer.exe
taskkill /f /im SearchApp.exe
cd C:\Windows\SystemApps\Microsoft.Windows.Search_cw5n1h2txyewy
takeown /f "SearchApp.exe"
icacls "C:\Windows\SystemApps\Microsoft.Windows.Search_cw5n1h2txyewy\SearchApp.exe" /grant Administrators:F
ren SearchApp.exe SearchApp.old
cd C:\Windows\SystemApps\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy
takeown /f "StartMenuExperienceHost.exe"
icacls "C:\Windows\SystemApps\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy\StartMenuExperienceHost.exe" /grant Administrators :F
ren StartMenuExperienceHost.exe StartMenuExperienceHost.old
start explorer.exe
cls
pause
exit

:enable
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\wsearch" /v "Start" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d "1" /f
sc start wsearch
taskkill /f /im explorer.exe
taskkill /f /im SearchApp.exe
cd C:\Windows\SystemApps\Microsoft.Windows.Search_cw5n1h2txyewy
takeown /f "SearchApp.old"
icacls "C:\Windows\SystemApps\Microsoft.Windows.Search_cw5n1h2txyewy\SearchApp.old" /grant Administrators:F
ren SearchApp.old SearchApp.exe
cd C:\Windows\SystemApps\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy
takeown /f "StartMenuExperienceHost.exe"
icacls "C:\Windows\SystemApps\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy\StartMenuExperienceHost.old" /grant Administrators :F
ren StartMenuExperienceHost.old StartMenuExperienceHost.exe
start explorer.exe
cls
pause
exit