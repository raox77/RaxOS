function image_4_CleanUp {
    Write-Verbose "Start: $($MyInvocation.MyCommand)"
    $RootDir = $Global:settings.ISO_Root

    $deleteFiles = {
        param($path)

        if (-Not (Test-Path -Path $path)) {
            Write-Warning "`"$path`" not found"
            return
        }

        if ($path.GetType() -eq [System.String]) {
            if ($path.Contains("*")) {
                Get-ChildItem -Path $path | ForEach-Object {
                    Invoke-Command $deleteFiles -ArgumentList "$_"
                }
                return
            }
        }

        try {
            # PowerRun
            if ((Get-Item $path) -is [System.IO.DirectoryInfo]) { # Folder
                Start-Process "$RootDir\Tools\PowerRun.exe" -ArgumentList "/SW:0 cmd.exe /c rd /S /Q `"$path`"" -Wait -NoNewWindow
            } else { # File
                Start-Process "$RootDir\Tools\PowerRun.exe" -ArgumentList "/SW:0 cmd.exe /c del /F /S /Q `"$path`"" -Wait -NoNewWindow
            }
            Write-Verbose "DELETE: `"$path`""
        }
        catch {
            Write-Host "`nError Message: " $_.Exception.Message
        }
        finally {
            if (Test-Path -Path $path) {
                Write-Warning "Failed: `"$path`""
            }
        }
    }

    # unwanted files and folders
    @(
        # "Program Files\WindowsApps", better use Remove-AppxProvisionedPackage
        "PerfLogs",
        "Program Files (x86)\Microsoft",
        "Windows\Web",
        "Windows\System32\OneDriveSetup.exe",
        "Windows\SysWOW64\OneDriveSetup.exe",
        "Program Files (x86)\Windows Mail",
        "Program Files\Windows Mail",
        "Windows\SysWOW64\MailContactsCalendarSync",
        "Windows\System32\MailContactsCalendarSync",
        "Windows\assembly\NativeImages_v4.0.30319_32",
        "Windows\assembly\NativeImages_v4.0.30319_64",
        "Windows\InboxApps",
        "Windows\System32\Recovery\winre.wim",
        "Windows\System32\BingMaps.dll",
        "Windows\System32\BingOnlineServices.dll",
        "Windows\WinSxS\amd64_microsoft-windows-onedrive-setup_31bf3856ad364e35_10.0.22621.1_none_86d60ce019ce7baf",
        "Windows\HelpPane.exe",
        "Windows\SysWOW64\help.exe",
        "Windows\System32\help.exe",
        "Users\Default\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\OneDrive.lnk",
        "Windows\WinSxS\Backup"
    ) | ForEach-Object {
        Invoke-Command $deleteFiles -ArgumentList "$RootDir\extractWIMImage\$_"
    }

    Get-ChildItem -Path "$RootDir\extractWIMImage\ProgramData\Package" -ErrorAction SilentlyContinue -Force |
        Where-Object { $_.Name -ne "MicrosoftWindows.Client.CBS_cw5n1h2txyewy" } |
        ForEach-Object {
            Invoke-Command $deleteFiles -ArgumentList "$RootDir\extractWIMImage\ProgramData\Package\$_"
    }

    Get-ChildItem -Path "$RootDir\extractWIMImage\Users\*\AppData\Local\Microsoft\WindowsApps\" -ErrorAction SilentlyContinue -Force |
        Where-Object { $_.Name -ne "MicrosoftWindows.Client.CBS_cw5n1h2txyewy" } |
        ForEach-Object {
            Invoke-Command $deleteFiles -ArgumentList $_.FullName
    }

    Get-ChildItem -Path "$RootDir\extractWIMImage\Users\*\AppData\Local\Packages\" -ErrorAction SilentlyContinue -Force |
        Where-Object {
            $_.Name -ne "Microsoft.Windows.ShellExperienceHost_cw5n1h2txyewy" -and `
            $_.Name -ne "windows.immersivecontrolpanel_cw5n1h2txyewy" -and `
            $_.Name -ne "MicrosoftWindows.Client.CBS_cw5n1h2txyewy"
        } |
        ForEach-Object {
            Invoke-Command $deleteFiles -ArgumentList $_.FullName
    }

    if ($Global:settings.Version.MAJOR -eq 10 -and $Global:settings.Version.MINOR -eq 0) {
        if ($Global:settings.Version.BUILD -lt 22000) {
            Get-ChildItem -Path "$RootDir\extractWIMImage\Windows\SystemApps" | Where-Object {
                $_.Name -ne "Microsoft.AAD.BrokerPlugin_cw5n1h2txyewy" -and `
                $_.Name -ne "Microsoft.AccountsControl_cw5n1h2txyewy" -and `
                $_.Name -ne "Microsoft.AsyncTextService_8wekyb3d8bbwe" -and `
                $_.Name -ne "Microsoft.BioEnrollment_cw5n1h2txyewy" -and `
                $_.Name -ne "microsoft.creddialoghost_cw5n1h2txyewy" -and `
                $_.Name -ne "Microsoft.ECApp_8wekyb3d8bbwe" -and `
                $_.Name -ne "Microsoft.LockApp_cw5n1h2txyewy" -and `
                $_.Name -ne "Microsoft.Win32WebViewHost_cw5n1h2txyewy" -and `
                $_.Name -ne "Microsoft.Windows.AddSuggestedFoldersToLibraryDialog_cw5n1h2txyewy" -and `
                $_.Name -ne "Microsoft.Windows.AppRep.ChxApp_cw5n1h2txyewy" -and `
                $_.Name -ne "Microsoft.Windows.AppResolverUX_cw5n1h2txyewy" -and `
                $_.Name -ne "Microsoft.Windows.AssignedAccessLockApp_cw5n1h2txyewy" -and `
                $_.Name -ne "Microsoft.Windows.CallingShellApp_cw5n1h2txyewy" -and `
                $_.Name -ne "Microsoft.Windows.CapturePicker_cw5n1h2txyewy" -and `
                $_.Name -ne "Microsoft.Windows.CloudExperienceHost_cw5n1h2txyewy" -and `
                $_.Name -ne "Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy" -and `
                $_.Name -ne "Microsoft.Windows.FileExplorer_cw5n1h2txyewy" -and `
                $_.Name -ne "Microsoft.Windows.FilePicker_cw5n1h2txyewy" -and `
                $_.Name -ne "microsoft.windows.narratorquickstart_8wekyb3d8bbwe" -and `
                $_.Name -ne "Microsoft.Windows.OOBENetworkCaptivePortal_cw5n1h2txyewy" -and `
                $_.Name -ne "Microsoft.Windows.OOBENetworkConnectionFlow_cw5n1h2txyewy" -and `
                $_.Name -ne "Microsoft.Windows.PeopleExperienceHost_cw5n1h2txyewy" -and `
                $_.Name -ne "Microsoft.Windows.PinningConfirmationDialog_cw5n1h2txyewy" -and `
                $_.Name -ne "Microsoft.Windows.SecureAssessmentBrowser_cw5n1h2txyewy" -and `
                $_.Name -ne "Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy" -and `
                $_.Name -ne "Microsoft.Windows.XGpuEjectDialog_cw5n1h2txyewy" -and `
                $_.Name -ne "Microsoft.XboxGameCallableUI_cw5n1h2txyewy" -and `
                $_.Name -ne "MicrosoftWindows.Client.CBS_cw5n1h2txyewy" -and `
                $_.Name -ne "MicrosoftWindows.UndockedDevKit_cw5n1h2txyewy" -and `
                $_.Name -ne "NcsiUwpApp_8wekyb3d8bbwe" -and `
                $_.Name -ne "ParentalControls_cw5n1h2txyewy" -and `
                $_.Name -ne "Shared" -and `
                $_.Name -ne "ShellExperienceHost_cw5n1h2txyewy" -and `
                $_.Name -ne "Microsoft.Windows.Search_cw5n1h2txyewy" -and `
                $_.Name -ne "Microsoft.Windows.SecHealthUI_cw5n1h2txyewy" -and `
                $_.Name -ne "Windows.CBSPreview_cw5n1h2txyewy"
            } | ForEach-Object {
                Invoke-Command $deleteFiles -ArgumentList "$RootDir\extractWIMImage\Windows\SystemApps\$_"
            }
        }
        else {
            Get-ChildItem -Path "$RootDir\extractWIMImage\Windows\SystemApps" | Where-Object {
                $_.Name -ne "Microsoft.AAD.BrokerPlugin_cw5n1h2txyewy" -and `
                $_.Name -ne "Microsoft.AccountsControl_cw5n1h2txyewy" -and `
                $_.Name -ne "Microsoft.AsyncTextService_8wekyb3d8bbwe" -and `
                $_.Name -ne "Microsoft.BioEnrollment_cw5n1h2txyewy" -and `
                $_.Name -ne "microsoft.creddialoghost_cw5n1h2txyewy" -and `
                $_.Name -ne "Microsoft.ECApp_8wekyb3d8bbwe" -and `
                $_.Name -ne "Microsoft.LockApp_cw5n1h2txyewy" -and `
                $_.Name -ne "Microsoft.UI.Xaml.CBS_8wekyb3d8bbwe" -and `
                $_.Name -ne "Microsoft.Win32WebViewHost_cw5n1h2txyewy" -and `
                $_.Name -ne "Microsoft.Windows.AddSuggestedFoldersToLibraryDialog_cw5n1h2txyewy" -and `
                $_.Name -ne "Microsoft.Windows.AppRep.ChxApp_cw5n1h2txyewy" -and `
                $_.Name -ne "Microsoft.Windows.AppResolverUX_cw5n1h2txyewy" -and `
                $_.Name -ne "Microsoft.Windows.AssignedAccessLockApp_cw5n1h2txyewy" -and `
                $_.Name -ne "Microsoft.Windows.CallingShellApp_cw5n1h2txyewy" -and `
                $_.Name -ne "Microsoft.Windows.CapturePicker_cw5n1h2txyewy" -and `
                $_.Name -ne "Microsoft.Windows.CloudExperienceHost_cw5n1h2txyewy" -and `
                $_.Name -ne "Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy" -and `
                $_.Name -ne "Microsoft.Windows.FileExplorer_cw5n1h2txyewy" -and `
                $_.Name -ne "Microsoft.Windows.FilePicker_cw5n1h2txyewy" -and `
                $_.Name -ne "microsoft.windows.narratorquickstart_8wekyb3d8bbwe" -and `
                $_.Name -ne "Microsoft.Windows.OOBENetworkCaptivePortal_cw5n1h2txyewy" -and `
                $_.Name -ne "Microsoft.Windows.OOBENetworkConnectionFlow_cw5n1h2txyewy" -and `
                $_.Name -ne "Microsoft.Windows.PeopleExperienceHost_cw5n1h2txyewy" -and `
                $_.Name -ne "Microsoft.Windows.PinningConfirmationDialog_cw5n1h2txyewy" -and `
                $_.Name -ne "Microsoft.Windows.PrintQueueActionCenter_cw5n1h2txyewy" -and `
                $_.Name -ne "Microsoft.Windows.SecureAssessmentBrowser_cw5n1h2txyewy" -and `
                $_.Name -ne "Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy" -and `
                $_.Name -ne "Microsoft.Windows.XGpuEjectDialog_cw5n1h2txyewy" -and `
                $_.Name -ne "Microsoft.WindowsAppRuntime.CBS_8wekyb3d8bbwe" -and `
                $_.Name -ne "Microsoft.XboxGameCallableUI_cw5n1h2txyewy" -and `
                $_.Name -ne "MicrosoftWindows.Client.CBS_cw5n1h2txyewy" -and `
                $_.Name -ne "MicrosoftWindows.Client.Core_cw5n1h2txyewy" -and `
                $_.Name -ne "MicrosoftWindows.Client.FileExp_cw5n1h2txyewy" -and `
                $_.Name -ne "MicrosoftWindows.UndockedDevKit_cw5n1h2txyewy" -and `
                $_.Name -ne "NcsiUwpApp_8wekyb3d8bbwe" -and `
                $_.Name -ne "ParentalControls_cw5n1h2txyewy" -and `
                $_.Name -ne "Shared" -and `
                $_.Name -ne "ShellExperienceHost_cw5n1h2txyewy" -and `
                $_.Name -ne "Windows.CBSPreview_cw5n1h2txyewy"
            } | ForEach-Object {
                Invoke-Command $deleteFiles -ArgumentList "$RootDir\extractWIMImage\Windows\SystemApps\$_"
            }
        }
    }
}

Export-ModuleMember -Function '*'
