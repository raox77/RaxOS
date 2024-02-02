@echo off
setlocal enabledelayedexpansion

echo === Browser Installer ===
echo 1. Google Chrome
echo 2. Brave
echo 3. Firefox (Recommended)
echo 4. Librewolf (Recommended)
echo 0. Exit

set /p choice=Enter your choice: 

if "%choice%"=="1" (
    set "browser=Google Chrome"
    set "downloadUrl=https://dl.google.com/chrome/install/latest/chrome_installer.exe"
) else if "%choice%"=="2" (
    set "browser=Brave"
    set "downloadUrl=https://laptop-updates.brave.com/latest/winx64/BraveBrowserSetup.exe"
) else if "%choice%"=="3" (
    set "browser=Firefox"
    set "downloadUrl=https://download.mozilla.org/?product=firefox-latest&os=win64&lang=en-US"
) else if "%choice%"=="4" (
    set "browser=Librewolf"
    set "downloadUrl=https://gitlab.com/api/v4/projects/44042130/packages/generic/librewolf/120.0.1-1/librewolf-120.0.1-1-windows-x86_64-setup.exe"
) else if "%choice%"=="0" (
    echo Exiting...
    exit /b
) else (
    echo Invalid choice. Please try again.
    pause
    cls
    call "%~f0"
)

echo Downloading %browser%...

:: Create a temporary directory to store the installer
set "tempDir=%temp%\%browser%_Installer"
mkdir "%tempDir%"
cd "%tempDir%"

:: Download the installer silently
powershell -Command "(New-Object System.Net.WebClient).DownloadFile('%downloadUrl%', 'installer.exe')"

echo Installing %browser%...

:: Install the browser silently
start /wait installer.exe

echo %browser% installation completed!

:: Clean up temporary directory
cd ..
rd /s /q "%tempDir%"

:: Run commands after installing Google Chrome
if "%choice%"=="1" (
    taskkill /f /im "GoogleUpdate.exe" >nul 2>&1
    taskkill /f /im "GoogleUpdateSetup.exe" >nul 2>&1
    taskkill /f /im "GoogleCrashHandler.exe" >nul 2>&1
    taskkill /f /im "GoogleCrashHandler64.exe" >nul 2>&1
    taskkill /f /im "GoogleUpdateBroker.exe" >nul 2>&1
    taskkill /f /im "GoogleUpdateCore.exe" >nul 2>&1
    taskkill /f /im "GoogleUpdateOnDemand.exe" >nul 2>&1
    taskkill /f /im "GoogleUpdateComRegisterShell64.exe" >nul 2>&1
    sc delete gupdate >nul 2>&1
    sc delete gupdatem >nul 2>&1
    sc delete googlechromeelevationservice >nul 2>&1
    rmdir /s /q "C:\Program Files (x86)\Google\Update" >nul 2>&1
    rmdir /s /q "C:\Program Files\Google\GoogleUpdater" >nul 2>&1
)

:: Run commands after installing Brave
if "%choice%"=="2" (
    taskkill /f /im "BraveUpdate.exe" >nul 2>&1
    taskkill /f /im "brave_installer-x64.exe" >nul 2>&1
    taskkill /f /im "BraveCrashHandler.exe" >nul 2>&1
    taskkill /f /im "BraveCrashHandler64.exe" >nul 2>&1
    taskkill /f /im "BraveCrashHandlerArm64.exe" >nul 2>&1
    taskkill /f /im "BraveUpdateBroker.exe" >nul 2>&1
    taskkill /f /im "BraveUpdateCore.exe" >nul 2>&1
    taskkill /f /im "BraveUpdateOnDemand.exe" >nul 2>&1
    taskkill /f /im "BraveUpdateSetup.exe" >nul 2>&1
    taskkill /f /im "BraveUpdateComRegisterShell64" >nul 2>&1
    taskkill /f /im "BraveUpdateComRegisterShellArm64" >nul 2>&1
    sc delete brave >nul 2>&1
    sc delete bravem >nul 2>&1
    sc delete BraveElevationService >nul 2>&1
    sc delete BraveVpnService >nul 2>&1
    rmdir /s /q "C:\Program Files (x86)\BraveSoftware\Update" >nul 2>&1
)

:: Run commands after installing Firefox
if "%choice%"=="3" (
    del "C:\Program Files\Mozilla Firefox\defaultagent.ini" /f /q >nul 2>&1
    del "C:\Program Files\Mozilla Firefox\defaultagent_localized.ini" /f /q >nul 2>&1
    del "C:\Program Files\Mozilla Firefox\default-browser-agent.exe" /f /q >nul 2>&1
    del "C:\Program Files\Mozilla Firefox\crashreporter.exe" /f /q >nul 2>&1
    del "C:\Program Files\Mozilla Firefox\crashreporter.ini" /f /q >nul 2>&1
    del "C:\Program Files\Mozilla Firefox\maintenanceservice.exe" /f /q >nul 2>&1
    del "C:\Program Files\Mozilla Firefox\maintenanceservice_installer.exe" /f /q >nul 2>&1
    del "C:\Program Files\Mozilla Firefox\minidump-analyzer.exe" /f /q >nul 2>&1
    del "C:\Program Files\Mozilla Firefox\pingsender.exe" /f /q >nul 2>&1
    del "C:\Program Files\Mozilla Firefox\updater.exe" /f /q >nul 2>&1
    del "C:\Program Files\Mozilla Firefox\updater.ini" /f /q >nul 2>&1
    del "C:\Program Files\Mozilla Firefox\update-settings.ini" /f /q >nul 2>&1
    Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Firefox" /v "DisableTelemetry" /t REG_DWORD /d "1" /f > NUL 2>&1
    Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Firefox" /v "DisableDefaultBrowserAgent" /t REG_DWORD /d "1" /f > NUL 2>&1
)

:: Run commands after installing Librewolf
if "%choice%"=="5" (
    del "C:\Program Files\LibreWolf\pingsender.exe" /f /q >nul 2>&1
)

echo.
echo Press any key to exit...
pause > nul
exit