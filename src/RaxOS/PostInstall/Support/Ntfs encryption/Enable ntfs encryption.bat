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



fsutil behavior set disableencryption 0
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Policies" /v "NtfsDisableEncryption" /f
cls
echo NTFS Encryption enabled, please reboot.
pause