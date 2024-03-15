function image_3_AppxProvisionedPackage {
    $RootDir = $Global:settings.ISO_Root
    $Debug = $Global:Debug

    # Registry keys for provisioned apps https://docs.microsoft.com/en-us/windows/application-management/remove-provisioned-apps-during-update#registry-keys-for-provisioned-apps
    Set-Content -Path "$RootDir\Registry\HKLM_SOFTWARE_ProvisionedApps.reg" -Value "Windows Registry Editor Version 5.00`n`n[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned]"

    # https://docs.microsoft.com/en-us/powershell/module/dism/get-appxprovisionedpackage
    # Get-AppxProvisionedPackage -Path "$RootDir\extractWIMImage" | Out-GridView -Passthru -Title "Get-AppxProvisionedPackage"
    Get-AppxProvisionedPackage -Path "$RootDir\extractWIMImage" | where-object {
        $_.DisplayName -ne "Microsoft.DesktopAppInstaller" -and `
        $_.DisplayName -ne "Microsoft.HEIFImageExtension" -and `
        $_.DisplayName -ne "Microsoft.HEVCVideoExtension" -and `
        $_.DisplayName -ne "Microsoft.ScreenSketch" -and `
        $_.DisplayName -ne "Microsoft.Paint" -and `
        $_.DisplayName -notlike "Microsoft.UI.Xaml.*" -and `
        $_.DisplayName -notlike "Microsoft.VCLibs*" -and `
        $_.DisplayName -notlike "Microsoft.SecHealthUI*" -and `
        $_.DisplayName -notlike "Microsoft.WindowsStore*" -and `
        $_.DisplayName -notlike "Microsoft.NET.Native.Framework.*" -and `
        $_.DisplayName -notlike "Microsoft.NET.Native.Runtime.*" -and `
        $_.DisplayName -ne "Microsoft.WindowsCalculator" -and `
        $_.DisplayName -ne "Microsoft.StorePurchaseApp" -and `
        $_.DisplayName -ne "Microsoft.WindowsNotepad"
    } | ForEach-Object {
        try {
            Write-Verbose "'$($_.PackageName)' will be removed (Remove-AppxProvisionedPackage)"
            Remove-AppxProvisionedPackage -Path "$RootDir\extractWIMImage" -PackageName $_.PackageName | Out-Null

            Add-Content -Path "$RootDir\Registry\HKLM_SOFTWARE_ProvisionedApps.reg" -Value ("`n[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\{0}_{1}]" -f $_.DisplayName, $_.PublisherId)
        }
        catch {
            Write-Warning "Failed: $_"
        }
    }
    if ($Debug -eq $true) {
        Get-AppxProvisionedPackage -Path "$RootDir\extractWIMImage" | where-object {
            Write-Debug "'$($_.PackageName)' stays on the system" -ForegroundColor Green
        }
    }

    # # https://learn.microsoft.com/en-us/powershell/module/dism/get-windowscapability
    # Get-WindowsCapability -Path "$RootDir\extractWIMImage" | Out-GridView -Passthru -Title "Get-WindowsCapability"
    Get-WindowsCapability -Path "$RootDir\extractWIMImage" | where-object {
        $_.State -ne "NotPresent" -and
        (
            $_.Name -like "Hello.Face*" -or `
            $_.Name -like "App.StepsRecorder*" -or `
            $_.Name -like "MathRecognizer*" -or `
            $_.Name -like "OpenSSH.Client*" -or `
            $_.Name -like "Print.Management.Console*" -or `
            $_.Name -like "Microsoft.Windows.WordPad*" -or `
            $_.Name -like "App.Support.QuickAssist*" -or `
            $_.Name -like "Print.Fax.Scan*" -or `
            $_.Name -like "OneCoreUAP.OneSync*" -or `
            $_.Name -like "Media.WindowsMediaPlayer*" `
        )
    } | ForEach-Object {
        try {
            Write-Verbose "'$($_.Name)' will be removed (Remove-WindowsCapability)"
            Remove-WindowsCapability -Path "$RootDir\extractWIMImage" -Name $_.Name | Out-Null
        }
        catch {
            Write-Warning "Failed: $_"
        }
    }

    Get-WindowsOptionalFeature -Path "$RootDir\extractWIMImage" | ForEach-Object {
        try {
            if ($_.State -eq "Enabled") {
                Write-Verbose "'$($_.FeatureName)' will be switched off (Disable-WindowsOptionalFeature)"
                Disable-WindowsOptionalFeature -Path "$RootDir\extractWIMImage" -FeatureName $_.FeatureName
            }
        }
        catch {
            Write-Warning "Failed: $_"
        }
    }
    Enable-WindowsOptionalFeature -Path "$RootDir\extractWIMImage" -FeatureName 'LegacyComponents' -Verbose:$false
    Enable-WindowsOptionalFeature -Path "$RootDir\extractWIMImage" -FeatureName 'DirectPlay' -Verbose:$false
    Enable-WindowsOptionalFeature -Path "$RootDir\extractWIMImage" -FeatureName 'NetFx4-AdvSrvs' -Verbose:$false
    if ($Debug -eq $true) {
        Get-WindowsOptionalFeature -Path "$RootDir\extractWIMImage" | where-object { $_.State -eq "Enabled" } | ForEach-Object {
            Write-Verbose "'$($_.FeatureName)' remains on" -ForegroundColor Green
        }
    }

    # https://docs.microsoft.com/en-us/powershell/module/dism/get-nonremovableappspolicy
    # Get-NonRemovableAppsPolicy -Path "$RootDir\extractWIMImage" | Out-GridView -Passthru -Title "Get-NonRemovableAppsPolicy"
}

Export-ModuleMember -Function '*'