:: DISABLE VPN SUPPORT ON GGOS (DEFAULT)
:: https://github.com/getggos

@echo off
setlocal ENABLEDELAYEDEXPANSION

:: CHECK FOR ADMIN PRIVILEGES
dism >nul 2>&1 || ( echo This script must be Run as Administrator. && pause && exit /b 1 )

:: DISABLE VPN SERVICES
sc config RasMan start=disabled >nul 2>&1
sc config SstpSvc start=disabled >nul 2>&1

echo VPN support has been disabled. Please restart your computer.
pause

exit /b 0