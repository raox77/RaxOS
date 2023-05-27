:: ENABLE VPN SUPPORT ON GGOS
:: https://github.com/getggos

@echo off
setlocal ENABLEDELAYEDEXPANSION

:: CHECK FOR ADMIN PRIVILEGES
dism >nul 2>&1 || ( echo This script must be Run as Administrator. && pause && exit /b 1 )

:: ENABLE VPN DRIVERS
sc config PptpMiniport start=demand >nul 2>&1
sc config RasAgileVpn start=demand >nul 2>&1
sc config Rasl2tp start=demand >nul 2>&1
sc config RasSstp start=demand >nul 2>&1
sc config RasPppoe start=demand >nul 2>&1

:: ENABLE VPN SERVICES
sc config RasMan start=auto >nul 2>&1
sc config SstpSvc start=demand >nul 2>&1

echo VPN support has been enabled. Please restart your computer.
pause

exit /b 0