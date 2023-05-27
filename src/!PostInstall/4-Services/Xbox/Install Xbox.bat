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
:: -----------Xbox Console Companion app (revert)------------
:: ----------------------------------------------------------
echo --- Xbox Console Companion app (revert)
PowerShell -ExecutionPolicy Unrestricted -Command "$package = Get-AppxPackage -AllUsers 'Microsoft.XboxApp'; if (!$package) {; Write-Error "^""Cannot reinstall 'Microsoft.XboxApp'"^"" -ErrorAction Stop; }; $manifest = $package.InstallLocation + '\AppxManifest.xml'; Add-AppxPackage -DisableDevelopmentMode -Register "^""$manifest"^"""
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------------Xbox Game Bar app (revert)----------------
:: ----------------------------------------------------------
echo --- Xbox Game Bar app (revert)
PowerShell -ExecutionPolicy Unrestricted -Command "$package = Get-AppxPackage -AllUsers 'Microsoft.XboxGamingOverlay'; if (!$package) {; Write-Error "^""Cannot reinstall 'Microsoft.XboxGamingOverlay'"^"" -ErrorAction Stop; }; $manifest = $package.InstallLocation + '\AppxManifest.xml'; Add-AppxPackage -DisableDevelopmentMode -Register "^""$manifest"^"""
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----------Xbox Identity Provider app (revert)------------
:: ----------------------------------------------------------
echo --- Xbox Identity Provider app (revert)
PowerShell -ExecutionPolicy Unrestricted -Command "$package = Get-AppxPackage -AllUsers 'Microsoft.XboxIdentityProvider'; if (!$package) {; Write-Error "^""Cannot reinstall 'Microsoft.XboxIdentityProvider'"^"" -ErrorAction Stop; }; $manifest = $package.InstallLocation + '\AppxManifest.xml'; Add-AppxPackage -DisableDevelopmentMode -Register "^""$manifest"^"""
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---------Xbox Speech To Text Overlay app (revert)---------
:: ----------------------------------------------------------
echo --- Xbox Speech To Text Overlay app (revert)
PowerShell -ExecutionPolicy Unrestricted -Command "$package = Get-AppxPackage -AllUsers 'Microsoft.XboxSpeechToTextOverlay'; if (!$package) {; Write-Error "^""Cannot reinstall 'Microsoft.XboxSpeechToTextOverlay'"^"" -ErrorAction Stop; }; $manifest = $package.InstallLocation + '\AppxManifest.xml'; Add-AppxPackage -DisableDevelopmentMode -Register "^""$manifest"^"""
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------------Xbox Game Bar Plugin appcache---------------
:: ----------------------------------------------------------
echo --- Xbox Game Bar Plugin appcache
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.XboxGameOverlay' | Remove-AppxPackage"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------------Xbox Live in-game experience app-------------
:: ----------------------------------------------------------
echo --- Xbox Live in-game experience app
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.Xbox.TCUI' | Remove-AppxPackage"
:: ----------------------------------------------------------


exit /b 0