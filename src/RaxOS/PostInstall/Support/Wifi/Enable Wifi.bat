@echo off
:: Checking for admin
fltmc >nul 2>&1 || (
    echo Administrator privileges are required.
    PowerShell Start -Verb RunAs '%0' 2> nul || (
        echo Right-click on the script and select "Run as administrator".
        pause & exit 1
    )
    exit 0
)
:: Initialize environment
setlocal EnableExtensions DisableDelayedExpansion


    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\netprofm" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NlaSvc" /v "Start" /t REG_DWORD /d "2" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WlanSvc" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\vwififlt" /v "Start" /t REG_DWORD /d "1" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WlanSvc" /v "Start" /t REG_DWORD /d "2" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\eventlog" /v "Start" /t REG_DWORD /d "2" /f
    powerrun "schtasks.exe" /change /enable /TN "\Microsoft\Windows\WCM\WiFiTask" >nul 2>&1
    powerrun "schtasks.exe" /change /enable /TN "\Microsoft\Windows\WlanSvc\CDSSync" >nul 2>&1
    powerrun "schtasks.exe" /change /enable /TN "\Microsoft\Windows\WlanSvc\MoProfileManagement" >nul 2>&1
    powerrun "schtasks.exe" /change /enable /TN "\Microsoft\Windows\WwanSvc\NotificationTask" >nul 2>&1
    powerrun "schtasks.exe" /change /enable /TN "\Microsoft\Windows\WwanSvc\OobeDiscovery" >nul 2>&1
    cls
    echo Wifi has been Enabled
    pause