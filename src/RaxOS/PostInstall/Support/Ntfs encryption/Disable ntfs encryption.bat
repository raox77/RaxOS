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



fsutil behavior set disableencryption 1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Policies" /v "NtfsDisableEncryption" /t REG_DWORD /d "1" /f
cls
echo NTFS Encryption disabled, please reboot.
pause