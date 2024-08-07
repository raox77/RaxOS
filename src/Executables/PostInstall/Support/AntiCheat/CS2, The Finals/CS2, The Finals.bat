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



Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\CI\Config" /v "VulnerableDriverBlocklistEnable" /t REG_DWORD /d "1" /f
cls
echo VulnerableDriverBlocklistEnable enabled, please reboot.
pause