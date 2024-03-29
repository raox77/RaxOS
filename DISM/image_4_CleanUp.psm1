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
        "Windows\WinSxS\Backup",
        "Windows\PolicyDefinitions\MicrosoftEdge.admx",
        "Windows\servicing\InboxFodMetadataCache\metadata\Microsoft.Wallpapers.Extended~~1.0.mum",
        "Windows\servicing\Packages\Microsoft-Windows-Shell-Wallpaper-Common-Package~31bf3856ad364e35~amd64~~10.0.22621.2506.cat",
        "Windows\servicing\Packages\microsoft-windows-wallpaper-content-extended-fod-package-Wrapper~31bf3856ad364e35~amd64~~10.0.22621.3296.cat",
        "Windows\servicing\Packages\Microsoft-Windows-Wallpaper-Content-Extended-FoD-Package~31bf3856ad364e35~amd64~~10.0.22621.3296.cat",
        "Windows\servicing\Packages\Microsoft-Windows-Wallpaper-Content-Extended-Package~31bf3856ad364e35~amd64~~10.0.22621.1.cat",
        "Windows\servicing\Packages\Microsoft-Windows-Shell-Wallpaper-Common-Package~31bf3856ad364e35~amd64~~10.0.22621.2506.mum",
        "Windows\servicing\Packages\microsoft-windows-wallpaper-content-extended-fod-package-Wrapper~31bf3856ad364e35~amd64~~10.0.22621.3296.mum",
        "Windows\servicing\Packages\Microsoft-Windows-Wallpaper-Content-Extended-FoD-Package~31bf3856ad364e35~amd64~~10.0.22621.3296.mum",
        "Windows\servicing\Packages\Microsoft-Windows-Wallpaper-Content-Extended-Package~31bf3856ad364e35~amd64~~10.0.22621.1.mum",
        "Windows\System32\CatRoot\{F750E6C3-38EE-11D1-85E5-00C04FC295EE}\Microsoft-Windows-Shell-Wallpaper-Common-Package~31bf3856ad364e35~amd64~~10.0.22621.2506.cat",
        "Windows\System32\CatRoot\{F750E6C3-38EE-11D1-85E5-00C04FC295EE}\microsoft-windows-wallpaper-content-extended-fod-package-Wrapper~31bf3856ad364e35~amd64~~10.0.22621.3296.cat",
        "Windows\System32\CatRoot\{F750E6C3-38EE-11D1-85E5-00C04FC295EE}\Microsoft-Windows-Wallpaper-Content-Extended-FoD-Package~31bf3856ad364e35~amd64~~10.0.22621.3296.cat",
        "Windows\System32\CatRoot\{F750E6C3-38EE-11D1-85E5-00C04FC295EE}\Microsoft-Windows-Wallpaper-Content-Extended-Package~31bf3856ad364e35~amd64~~10.0.22621.1.cat",
        "Windows\System32\edgeangle.dll",
        "Windows\System32\EdgeContent.dll",
        "Windows\System32\EdgeResetPlugin.dll",
        "Windows\System32\MicrosoftEdgeBCHost.exe",
        "Windows\System32\MicrosoftEdgeCP.exe",
        "Windows\System32\MicrosoftEdgeDevTools.exe",
        "Windows\System32\MicrosoftEdgeSH.exe",
        "Program Files\Windows Defender",
        "Program Files\Windows Defender Advanced Threat Protection",
        "Program Files (x86)\Windows Defender",
        "ProgramData\Microsoft\Windows Defender",
        "ProgramData\Microsoft\Windows Defender Advanced Threat Protection",
        "ProgramData\Microsoft\Windows Security Health",
        "Windows\System32\drivers\WdNisDrv.sys",
        "Windows\System32\drivers\WdFilter.sys",
        "Windows\System32\drivers\WdDevFlt.sys",
        "Windows\System32\drivers\WdBoot.sys",
        "Windows\System32\drivers\mssecwfp.sys",
        "Windows\System32\drivers\mssecflt.sys",
        "Windows\System32\drivers\msseccore.sys",
        "Windows\System32\drivers\mde",
        "Windows\System32\drivers\en-US\msseccore.sys.mui",
        "Windows\System32\drivers\en-US\mssecflt.sys.mui",
        "Windows\System32\drivers\en-US\mssecwfp.sys.mui",
        "Windows\System32\SecurityHealth",
        "Windows\System32\SecurityCenterBroker.dll",
        "Windows\System32\SecurityCenterBrokerPS.dll",
        "Windows\System32\SecurityHealthAgent.dll",
        "Windows\System32\SecurityHealthCore.dll",
        "Windows\System32\SecurityHealthHost.exe",
        "Windows\System32\SecurityHealthProxyStub.dll",
        "Windows\System32\SecurityHealthService.exe",
        "Windows\System32\SecurityHealthSSO.dll",
        "Windows\System32\SecurityHealthSsoUdk.dll",
        "Windows\System32\SecurityHealthSystray.exe",
        "Windows\System32\SecurityHealthUdk.dll",
        "Windows\System32\SenseSubAuth.dll",
        "Windows\System32\WindowsSecurityIcon.png",
        "Windows\System32\wscsvc.dll",
        "Windows\SysWOW64\SecurityCenterBrokerPS.dll",
        "Windows\SysWOW64\windowsdefenderapplicationguardcsp.dll"
        "Windows\System32\smartscreen.exe",
        "Windows\System32\smartscreen.dll",
        "Windows\System32\Microsoft-Edge-WebView",
        "ProgramData\Microsoft\DeviceSync",
        "Windows\en-US\helppane.exe.mui",
        "Windows\en-US\hh.exe.mui",
        "Windows\en-US\winhlp32.exe.mui",
        "Windows\Microsoft.NET\assembly\GAC_MSIL\Windows.Help.Runtime",
        "Windows\PolicyDefinitions\fthsvc.admx",
        "Windows\PolicyDefinitions\Help.admx",
        "Windows\PolicyDefinitions\HelpAndSupport.admx",
        "Windows\PolicyDefinitions\LAPS.admx",
        "Windows\PolicyDefinitions\RacWmiProv.admx",
        "Windows\PolicyDefinitions\Reliability.admx",
        "Windows\Resources\Ease of Access Themes",
        "Windows\System32\en-US\apds.dll.mui",
        "Windows\System32\en-US\DxpTaskSync.dll.mui",
        "Windows\System32\en-US\embeddedmodesvc.dll.mui",
        "Windows\System32\en-US\fthsvc.dll.mui",
        "Windows\System32\en-US\help.exe.mui",
        "Windows\System32\en-US\hhctrl.ocx.mui",
        "Windows\System32\en-US\inetres.dll.mui",
        "Windows\System32\en-US\laps.dll.mui",
        "Windows\System32\en-US\msoert2.dll.mui",
        "Windows\System32\en-US\racengn.dll.mui",
        "Windows\System32\en-US\RDXService.dll.mui",
        "Windows\System32\en-US\RDXTaskFactory.dll.mui",
        "Windows\System32\en-US\RelPost.exe.mui",
        "Windows\System32\en-US\SyncCenter.dll.mui",
        "Windows\System32\en-US\SyncInfrastructure.dll.mui",
        "Windows\System32\en-US\Windows.Data.Pdf.dll.mui",
        "Windows\System32\en-US\WinSync.rll.mui",
        "Windows\System32\oobe\en-US\privacy.rtf",
        "Windows\System32\oobe\en-US\vofflps.rtf",
        "Windows\System32\oobe\en-US\OOBE_HELP_Cortana_Learn_More.rtf",
        "Windows\System32\Tasks\Microsoft\Windows\SyncCenter",
        "Windows\System32\wbem\RacWmiProv.dll",
        "Windows\System32\wbem\RacWmiProv.mof",
        "Windows\System32\wbem\en-US\RacWmiProv.dll.mui",
        "Windows\System32\wbem\en-US\RacWmiProv.mfl",
        "Windows\System32\WindowsPowerShell\v1.0\Modules\LAPS",
        "Windows\System32\migwiz",
        "Windows\System32\apds.dll",
        "Windows\System32\DxpTaskSync.dll",
        "Windows\System32\embeddedmodesvc.dll",
        "Windows\System32\embeddedmodesvcapi.dll",
        "Windows\System32\fthsvc.dll",
        "Windows\System32\hhsetup.dll",
        "Windows\System32\inetcomm.dll",
        "Windows\System32\INETRES.dll",
        "Windows\System32\itircl.dll",
        "Windows\System32\itss.dll",
        "Windows\System32\laps.dll",
        "Windows\System32\lapscsp.dll",
        "Windows\System32\migisol.dll",
        "Windows\System32\mobsync.exe",
        "Windows\System32\msoert2.dll",
        "Windows\System32\RacEngn.dll",
        "Windows\System32\RDXService.dll",
        "Windows\System32\RDXTaskFactory.dll",
        "Windows\System32\RelPost.exe",
        "Windows\System32\SmartWorkflows.dll",
        "Windows\System32\SyncCenter.dll",
        "Windows\System32\SyncInfrastructure.dll",
        "Windows\System32\SyncInfrastructureps.dll",
        "Windows\System32\Windows.Data.Pdf.dll",
        "Windows\System32\Windows.Help.Runtime.dll",
        "Windows\System32\WinSync.dll",
        "Windows\SystemResources\DxpTaskSync.dll.mun",
        "Windows\SystemResources\SyncCenter.dll.mun",
        "Windows\SystemResources\Windows.Data.Pdf.dll.mun",
        "Windows\SysWOW64\en-US\hh.exe.mui",
        "Windows\SysWOW64\en-US\inetres.dll.mui",
        "Windows\SysWOW64\en-US\msoert2.dll.mui",
        "Windows\SysWOW64\en-US\PortableDeviceSyncProvider.dll.mui",
        "Windows\SysWOW64\en-US\WABSyncProvider.dll.mui",
        "Windows\SysWOW64\Tasks\Microsoft\Windows\SyncCenter",
        "Windows\SysWOW64\wbem\RacWmiProv.dll",
        "Windows\SysWOW64\wbem\RacWmiProv.mof",
        "Windows\SysWOW64\migwiz",
        "Windows\SysWOW64\apds.dll",
        "Windows\SysWOW64\DxpTaskSync.dll",
        "Windows\SysWOW64\embeddedmodesvcapi.dll",
        "Windows\SysWOW64\HelpPaneProxy.dll",
        "Windows\SysWOW64\hh.exe",
        "Windows\SysWOW64\hhsetup.dll",
        "Windows\SysWOW64\inetcomm.dll",
        "Windows\SysWOW64\INETRES.dll",
        "Windows\SysWOW64\itircl.dll",
        "Windows\SysWOW64\itss.dll",
        "Windows\SysWOW64\migisol.dll",
        "Windows\SysWOW64\mobsync.exe",
        "Windows\SysWOW64\msoert2.dll",
        "Windows\SysWOW64\PortableDeviceSyncProvider.dll",
        "Windows\SysWOW64\RacEngn.dll",
        "Windows\SysWOW64\SyncCenter.dll",
        "Windows\SysWOW64\SyncInfrastructure.dll",
        "Windows\SysWOW64\SyncInfrastructureps.dll",
        "Windows\SysWOW64\Syncreg.dll",
        "Windows\SysWOW64\WABSyncProvider.dll",
        "Windows\SysWOW64\Windows.Data.Pdf.dll",
        "Windows\SysWOW64\Windows.System.Profile.RetailInfo.dll",
        "Windows\SysWOW64\WinSync.dll",
        "Windows\SysWOW64\WinSyncMetastore.dll",
        "Windows\SysWOW64\WinSyncProviders.dll",
        "Windows\Help",
        "Windows\hh.exe",
        "Windows\winhlp32.exe",
        "Windows\DtcInstall.log"
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