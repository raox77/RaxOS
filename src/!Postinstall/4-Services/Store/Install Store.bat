@echo off
:: https://privacy.sexy — v0.11.4 — Tue, 04 Apr 2023 18:13:03 GMT
:: Ensure admin privileges
fltmc >nul 2>&1 || (
    echo Administrator privileges are required.
    PowerShell Start -Verb RunAs '%0' 2> nul || (
        echo Right-click on the script and select "Run as administrator".
        pause & exit 1
    )
    exit 0
)


:: ----------------------------------------------------------
:: ---------------Microsoft Store app (revert)---------------
:: ----------------------------------------------------------
echo --- Microsoft Store app (revert)
PowerShell -ExecutionPolicy Unrestricted -Command "$package = Get-AppxPackage -AllUsers 'Microsoft.WindowsStore'; if (!$package) {; Write-Error "^""Cannot reinstall 'Microsoft.WindowsStore'"^"" -ErrorAction Stop; }; $manifest = $package.InstallLocation + '\AppxManifest.xml'; Add-AppxPackage -DisableDevelopmentMode -Register "^""$manifest"^"""
:: ----------------------------------------------------------


exit /b 0