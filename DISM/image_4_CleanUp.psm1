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
        "Windows\HelpPane.exe",
        "Windows\SysWOW64\help.exe",
        "Windows\System32\help.exe",
        "Users\Default\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\OneDrive.lnk",
        "Windows\WinSxS\Backup",
        "Windows\PolicyDefinitions\MicrosoftEdge.admx",
        "Windows\System32\edgeangle.dll",
        "Windows\System32\EdgeContent.dll",
        "Windows\System32\EdgeResetPlugin.dll",
        "Windows\System32\MicrosoftEdge*",
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
        "Windows\System32\smartscreen*",
        "Windows\en-US\helppane.exe.mui",
        "Windows\en-US\hh.exe.mui",
        "Windows\en-US\winhlp32.exe.mui",
        "Windows\Microsoft.NET\assembly\GAC_MSIL\Windows.Help.Runtime",
        "Windows\PolicyDefinitions\Help.admx",
        "Windows\PolicyDefinitions\HelpAndSupport.admx",
        "Windows\PolicyDefinitions\Reliability.admx",
        "Windows\Resources\Ease of Access Themes",
        "Windows\System32\en-US\apds.dll.mui",
        "Windows\System32\en-US\help.exe.mui",
        "Windows\System32\en-US\hhctrl.ocx.mui",
        "Windows\System32\en-US\Windows.Data.Pdf.dll.mui",
        "Windows\System32\oobe\en-US\privacy.rtf",
        "Windows\System32\oobe\en-US\vofflps.rtf",
        "Windows\System32\oobe\en-US\OOBE_HELP_Cortana_Learn_More.rtf",
        "Windows\System32\hhsetup.dll",
        "Windows\System32\mobsync.exe",
        "Windows\System32\Windows.Data.Pdf.dll",
        "Windows\System32\Windows.Help.Runtime.dll",
        "Windows\SystemResources\Windows.Data.Pdf.dll.mun",
        "Windows\SysWOW64\en-US\hh.exe.mui",
        "Windows\SysWOW64\HelpPaneProxy.dll",
        "Windows\SysWOW64\hh.exe",
        "Windows\SysWOW64\hhsetup.dll",
        "Windows\SysWOW64\mobsync.exe",
        "Windows\SysWOW64\msoert2.dll",
        "Windows\SysWOW64\Windows.Data.Pdf.dll",
        "Windows\Help",
        "Windows\hh.exe",
        "Windows\winhlp32.exe",
        "Windows\DtcInstall.log",
        "ProgramData\Microsoft\Windows\Start Menu\Programs\Administrative Tools\Memory Diagnostics Tool.lnk",
        "ProgramData\Microsoft\Windows\Start Menu\Programs\Administrative Tools\ODBC Data Sources (32-bit).lnk",
        "ProgramData\Microsoft\Windows\Start Menu\Programs\Administrative Tools\ODBC Data Sources (64-bit).lnk",
        "ProgramData\Microsoft\Windows\Start Menu\Programs\Administrative Tools\System Configuration.lnk",
        "ProgramData\Microsoft\Windows\Start Menu\Programs\Administrative Tools\RecoveryDrive.lnk",
        "Windows\SysWOW64\wpbcreds.dll",
        "Windows\SysWOW64\ctac.json",
        "Windows\System32\BingFilterDS.dll",
        "Windows\System32\BingASDS.dll",
        "Windows\PolicyDefinitions\AppHVSI.admx",
        "Windows\PolicyDefinitions\ExploitGuard.admx",
        "Windows\PolicyDefinitions\Securitycenter.admx",
        "Windows\PolicyDefinitions\WindowsDefender.admx",
        "Windows\PolicyDefinitions\WindowsDefenderSecurityCenter.admx",
        "Windows\System32\en-US\hvsievaluator.exe.mui",
        "Windows\System32\en-US\hvsigpext.dll.mui",
        "Windows\System32\en-US\MitigationConfiguration.dll.mui",
        "Windows\System32\en-US\SecurityHealthAgent.dll.mui",
        "Windows\System32\en-US\securityhealthsso.dll.mui",
        "Windows\System32\en-US\wscapi.dll.mui",
        "Windows\System32\en-US\wscsvc.dll.mui",
        "Windows\System32\en-US\wscui.cpl.mui",
        "Windows\System32\wbem\wscenter.mof",
        "Windows\System32\wbem\en-US\wscenter.mfl",
        "Windows\System32\FeatureToastBulldogImg.png",
        "Windows\System32\FeatureToastDlpImg.png",
        "Windows\System32\hvsievaluator.exe",
        "Windows\System32\hvsigpext.dll",
        "Windows\System32\HvsiManagementApi.dll",
        "Windows\System32\MitigationConfiguration.dll",
        "Windows\System32\mssecuser.dll",
        "Windows\System32\mssecwfpu.dll",
        "Windows\System32\RemoteAppLifetimeManager.exe",
        "Windows\System32\RemoteAppLifetimeManagerProxyStub.dll",
        "Windows\System32\tellib.dll",
        "Windows\System32\WebRuntimeManager.dll",
        "Windows\System32\winshfhc.dll",
        "Windows\System32\wscadminui.exe",
        "Windows\System32\wscapi.dll",
        "Windows\System32\wscinterop.dll",
        "Windows\System32\wscisvif.dll",
        "Windows\System32\wscproxystub.dll",
        "Windows\System32\wscui.cpl",
        "Windows\System32\ThirdPartyNoticesBySHS.txt",
        "Windows\SystemResources\wscui.cpl.mun",
        "Windows\SysWOW64\fcon.dll",
        "Windows\SysWOW64\FlightSettings.dll",
        "Windows\SysWOW64\HvsiManagementApi.dll",
        "Windows\SysWOW64\MitigationConfiguration.dll",
        "Windows\SysWOW64\winshfhc.dll",
        "Windows\SysWOW64\wscadminui.exe",
        "Windows\SysWOW64\wscapi.dll",
        "Windows\SysWOW64\wscinterop.dll",
        "Windows\SysWOW64\wscproxystub.dll",
        "Windows\SysWOW64\wscui.cpl",
        "Windows\SysWOW64\wbem\wscenter.mof",
        "Windows\SysWOW64\wbem\en-US\wscenter.mfl",
        "Windows\System32\SecurityAndMaintenance_Alert.png",
        "Windows\System32\SecurityAndMaintenance_Error.png",
        "Windows\System32\en-US\SettingsHandlers_OneDriveBackup.dll.mui",
        "Windows\System32\OneDrive.ico",
        "Windows\System32\SecurityAndMaintenance.png",
        "Windows\System32\SettingsHandlers_OneDriveBackup.dll",
        "Windows\SysWOW64\ortcengine.dll",
        "Windows\SysWOW64\SecurityAndMaintenance.png",
        "Windows\SysWOW64\SecurityAndMaintenance_Alert.png",
        "Windows\SysWOW64\SecurityAndMaintenance_Error.png",
        "Windows\WinSxS\amd64_microsoft-windows-onedrive-setup_*",
        "Windows\System32\ortcengine.dll",
        "Windows\SysWOW64\embeddedmodesvcapi.dll",
        "Windows\System32\en-US\embeddedmodesvc.dll.mui",
        "Windows\System32\embeddedmodesvc.dll",
        "Windows\System32\embeddedmodesvcapi.dll",
        "Program Files\WindowsApps\Microsoft.SecHealthUI_*",
        "Program Files\WindowsApps\Microsoft.Services.Store.Engagement_*",
        "Program Files\WindowsApps\Microsoft.WindowsAppRuntime.*",
        "Windows\servicing\Packages\Microsoft-Windows-Client-Features-removable-Package*",
        "Windows\servicing\Packages\Microsoft-Windows-HVSI-Components-Package*",
        "Windows\servicing\Packages\Microsoft-Windows-HVSI-Components-WOW64-Package*",
        "Windows\servicing\Packages\Microsoft-Windows-HVSI-Package*",
        "Windows\servicing\Packages\Microsoft-Windows-HVSI-WOW64-Package*",
        "Windows\servicing\Packages\Microsoft-Windows-SenseClient-Package*",
        "Windows\servicing\Packages\Windows-Defender-AM-Default-Definitions-OptionalWrapper-Package*",
        "Windows\servicing\Packages\Windows-Defender-ApplicationGuard-Inbox-Package*",
        "Windows\servicing\Packages\Windows-Defender-ApplicationGuard-Inbox-WOW64-Package*",
        "Windows\servicing\Packages\Windows-Defender-Group-Policy-Package*",
        "Windows\System32\CatRoot\{F750E6C3-38EE-11D1-85E5-00C04FC295EE}\Microsoft-Windows-Client-Features-removable-Package*",
        "Windows\System32\CatRoot\{F750E6C3-38EE-11D1-85E5-00C04FC295EE}\Microsoft-Windows-HVSI-Components-Package*",
        "Windows\System32\CatRoot\{F750E6C3-38EE-11D1-85E5-00C04FC295EE}\Microsoft-Windows-HVSI-Components-WOW64-Package*",
        "Windows\System32\CatRoot\{F750E6C3-38EE-11D1-85E5-00C04FC295EE}\Microsoft-Windows-HVSI-Package*",
        "Windows\System32\CatRoot\{F750E6C3-38EE-11D1-85E5-00C04FC295EE}\Microsoft-Windows-HVSI-WOW64-Package*",
        "Windows\System32\CatRoot\{F750E6C3-38EE-11D1-85E5-00C04FC295EE}\Microsoft-Windows-SenseClient-Package*",
        "Windows\System32\CatRoot\{F750E6C3-38EE-11D1-85E5-00C04FC295EE}\Windows-Defender-AM-Default-Definitions-OptionalWrapper-Package*",
        "Windows\System32\CatRoot\{F750E6C3-38EE-11D1-85E5-00C04FC295EE}\Windows-Defender-ApplicationGuard-Inbox-Package*",
        "Windows\System32\CatRoot\{F750E6C3-38EE-11D1-85E5-00C04FC295EE}\Windows-Defender-ApplicationGuard-Inbox-WOW64-Package*",
        "Windows\System32\CatRoot\{F750E6C3-38EE-11D1-85E5-00C04FC295EE}\Windows-Defender-Group-Policy-Package*",
        "Windows\servicing\Packages\Microsoft-Windows-OneDrive-Setup-Package*",
        "Windows\servicing\Packages\Microsoft-Windows-OneDrive-Setup-WOW64-Package*",
        "Windows\System32\CatRoot\{F750E6C3-38EE-11D1-85E5-00C04FC295EE}\Microsoft-Windows-OneDrive-Setup-Package*",
        "Windows\System32\CatRoot\{F750E6C3-38EE-11D1-85E5-00C04FC295EE}\Microsoft-Windows-OneDrive-Setup-WOW64-Package*",
        "Users\Default\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Accessibility",
        "Users\Default\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Maintenance",
        "Users\Default\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Accessories",
        "Users\Default\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Administrative Tools.lnk",
        "ProgramData\Microsoft\DeviceSync",
        "Windows\assembly\GAC_32\srmlib",
        "Windows\assembly\GAC_64\srmlib",
        "Windows\servicing\Packages\Microsoft-Windows-FCI-Client-Package*",
        "Windows\servicing\Packages\Microsoft-Windows-FCI-Client-WOW64-Package*",
        "Windows\System32\CatRoot\{F750E6C3-38EE-11D1-85E5-00C04FC295EE}\Microsoft-Windows-FCI-Client-Package*",
        "Windows\System32\CatRoot\{F750E6C3-38EE-11D1-85E5-00C04FC295EE}\Microsoft-Windows-FCI-Client-WOW64-Package*",
        "Windows\System32\en-US\ActionCenter.dll.mui",
        "Windows\System32\en-US\adrclient.dll.mui",
        "Windows\System32\en-US\CloudNotifications.exe.mui",
        "Windows\System32\en-US\DxpTaskSync.dll.mui",
        "Windows\System32\en-US\hcproviders.dll.mui",
        "Windows\System32\en-US\SettingsHandlers_CloudPC.dll.mui",
        "Windows\System32\en-US\srm.dll.mui",
        "Windows\System32\en-US\srmshell.dll.mui",
        "Windows\System32\en-US\SyncInfrastructure.dll.mui",
        "Windows\System32\en-US\SyncSettings.dll.mui",
        "Windows\System32\en-US\Windows.CloudStore.EarlyDownloader.dll.mui",
        "Windows\System32\en-US\WinSync.rll.mui",
        "Windows\System32\ActionCenter.dll",
        "Windows\System32\ActionCenterCPL.dll",
        "Windows\System32\adrclient.dll",
        "Windows\System32\CloudDesktopCSP.dll",
        "Windows\System32\CloudNotifications.exe",
        "Windows\System32\DxpTaskSync.dll",
        "Windows\System32\hcproviders.dll",
        "Windows\System32\SettingsHandlers_CloudPC.dll",
        "Windows\System32\SettingSyncDownloadHelper.dll",
        "Windows\System32\srm.dll",
        "Windows\System32\srm_ps.dll",
        "Windows\System32\srmclient.dll",
        "Windows\System32\srmlib.dll",
        "Windows\System32\srmscan.dll",
        "Windows\System32\srmshell.dll",
        "Windows\System32\srmstormod.dll",
        "Windows\System32\srmtrace.dll",
        "Windows\System32\SyncInfrastructure.dll",
        "Windows\System32\SyncInfrastructureps.dll",
        "Windows\System32\SyncSettings.dll",
        "Windows\System32\Windows.CloudStore.EarlyDownloader.dll",
        "Windows\System32\Windows.Internal.Shell.CloudDesktop.TransitionScreen.dll",
        "Windows\System32\WinSync.dll",
        "Windows\SystemResources\ActionCenterCPL.dll.mun",
        "Windows\SystemResources\DxpTaskSync.dll.mun",
        "Windows\SysWOW64\en-US\ActionCenter.dll.mui",
        "Windows\SysWOW64\en-US\ActionCenterCPL.dll.mui",
        "Windows\SysWOW64\en-US\adrclient.dll.mui",
        "Windows\SysWOW64\en-US\CloudNotifications.exe.mui",
        "Windows\SysWOW64\en-US\hcproviders.dll.mui",
        "Windows\SysWOW64\en-US\PortableDeviceSyncProvider.dll.mui",
        "Windows\SysWOW64\en-US\srm.dll.mui",
        "Windows\SysWOW64\en-US\srmshell.dll.mui",
        "Windows\SysWOW64\en-US\WABSyncProvider.dll.mui",
        "Windows\SysWOW64\ActionCenter.dll",
        "Windows\SysWOW64\ActionCenterCPL.dll",
        "Windows\SysWOW64\adrclient.dll",
        "Windows\SysWOW64\CloudNotifications.exe",
        "Windows\SysWOW64\DxpTaskSync.dll",
        "Windows\SysWOW64\hcproviders.dll",
        "Windows\SysWOW64\PortableDeviceSyncProvider.dll",
        "Windows\SysWOW64\SettingSyncDownloadHelper.dll",
        "Windows\SysWOW64\srm.dll",
        "Windows\SysWOW64\srm_ps.dll",
        "Windows\SysWOW64\srmclient.dll",
        "Windows\SysWOW64\srmlib.dll",
        "Windows\SysWOW64\srmscan.dll",
        "Windows\SysWOW64\srmshell.dll",
        "Windows\SysWOW64\srmstormod.dll",
        "Windows\SysWOW64\srmtrace.dll",
        "Windows\SysWOW64\SyncInfrastructure.dll",
        "Windows\SysWOW64\SyncInfrastructureps.dll",
        "Windows\SysWOW64\Syncreg.dll",
        "Windows\SysWOW64\SyncSettings.dll",
        "Windows\SysWOW64\WABSyncProvider.dll",
        "Windows\SysWOW64\WinSync.dll",
        "Windows\SysWOW64\WinSyncMetastore.dll",
        "Windows\SysWOW64\WinSyncProviders.dll"
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