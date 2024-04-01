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
        "Windows\HelpPane.exe",
        "Windows\SysWOW64\help.exe",
        "Windows\System32\help.exe",
        "Users\Default\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\OneDrive.lnk",
        "Windows\WinSxS\Backup",
        "Windows\PolicyDefinitions\MicrosoftEdge.admx",
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
        "Windows\DtcInstall.log",
        "ProgramData\Microsoft\Windows\Start Menu\Programs\Administrative Tools\Memory Diagnostics Tool.lnk",
        "ProgramData\Microsoft\Windows\Start Menu\Programs\Administrative Tools\ODBC Data Sources (32-bit).lnk",
        "ProgramData\Microsoft\Windows\Start Menu\Programs\Administrative Tools\ODBC Data Sources (64-bit).lnk",
        "ProgramData\Microsoft\Windows\Start Menu\Programs\Administrative Tools\System Configuration.lnk",
        "ProgramData\Microsoft\Windows\Start Menu\Programs\Administrative Tools\RecoveryDrive.lnk",
        "Windows\PolicyDefinitions\ExternalBoot.admx",
        "Windows\PolicyDefinitions\ReAgent.admx",
        "Windows\PolicyDefinitions\VolumeEncryption.admx",
        "Windows\security\EDP",
        "Windows\System32\en-US\baaupdate.exe.mui",
        "Windows\System32\en-US\bdechangepin.exe.mui",
        "Windows\System32\en-US\BdeHdCfg.exe.mui",
        "Windows\System32\en-US\BdeHdCfgLib.dll.mui",
        "Windows\System32\en-US\bdesvc.dll.mui",
        "Windows\System32\en-US\bdeunlock.exe.mui",
        "Windows\System32\en-US\BitLockerWizard.exe.mui",
        "Windows\System32\en-US\BitLockerWizardElev.exe.mui",
        "Windows\System32\en-US\CloudRestoreLauncher.dll.mui",
        "Windows\System32\en-US\edptask.dll.mui",
        "Windows\System32\en-US\edputil.dll.mui",
        "Windows\System32\en-US\fveapi.dll.mui",
        "Windows\System32\en-US\fvecpl.dll.mui",
        "Windows\System32\en-US\fvenotify.exe.mui",
        "Windows\System32\en-US\fveprompt.exe.mui",
        "Windows\System32\en-US\fveui.dll.mui",
        "Windows\System32\en-US\fvewiz.dll.mui",
        "Windows\System32\en-US\manage-bde.exe.mui",
        "Windows\System32\en-US\pwlauncher.dll.mui",
        "Windows\System32\en-US\pwlauncher.exe.mui",
        "Windows\System32\en-US\pwsso.dll.mui",
        "Windows\System32\en-US\reagentc.exe.mui",
        "Windows\System32\en-US\ReAgentTask.dll.mui",
        "Windows\System32\en-US\recdisc.exe.mui",
        "Windows\System32\en-US\RecoveryDrive.exe.mui",
        "Windows\System32\en-US\repair-bde.exe.mui",
        "Windows\System32\en-US\reseteng.dll.mui",
        "Windows\System32\en-US\ResetEngine.dll.mui",
        "Windows\System32\en-US\ResetEngOnline.dll.mui",
        "Windows\System32\en-US\SettingsHandlers_CloudPC.dll.mui",
        "Windows\System32\en-US\SyncSettings.dll.mui",
        "Windows\System32\en-US\sysreseterr.exe.mui",
        "Windows\System32\en-US\systemreset.exe.mui",
        "Windows\System32\en-US\Windows.CloudStore.EarlyDownloader.dll.mui",
        "Windows\System32\en-US\Windows.SharedPC.CredentialProvider.dll.mui",
        "Windows\System32\en-US\WinREAgent.dll.mui",
        "Windows\System32\en-US\WofTasks.dll.mui",
        "Windows\System32\wbem\Win32_EncryptableVolume.dll",
        "Windows\System32\wbem\win32_encryptablevolume.mof",
        "Windows\System32\wbem\Win32_EncryptableVolumeUninstall.mof",
        "Windows\System32\WindowsPowerShell\v1.0\Modules\BitLocker",
        "Windows\System32\Pbr",
        "Windows\System32\SystemResetPlatform",
        "Windows\System32\@bitlockertoastimage.png",
        "Windows\System32\@edptoastimage.png",
        "Windows\System32\baaupdate.exe",
        "Windows\System32\bdechangepin.exe",
        "Windows\System32\BdeHdCfg.exe",
        "Windows\System32\BdeHdCfgLib.dll",
        "Windows\System32\bderepair.dll",
        "Windows\System32\bdesvc.dll",
        "Windows\System32\BdeSysprep.dll",
        "Windows\System32\bdeui.dll",
        "Windows\System32\BdeUISrv.exe",
        "Windows\System32\bdeunlock.exe",
        "Windows\System32\BitLockerCsp.dll",
        "Windows\System32\BitLockerDeviceEncryption.exe",
        "Windows\System32\BitLockerWizard.exe",
        "Windows\System32\BitLockerWizardElev.exe",
        "Windows\System32\boot.sdi",
        "Windows\System32\CleanPCCSP.dll",
        "Windows\System32\CloudDesktopCSP.dll",
        "Windows\System32\CloudRecoveryDownloadTool.dll",
        "Windows\System32\CloudRestoreLauncher.dll",
        "Windows\System32\edpauditapi.dll",
        "Windows\System32\edpnotify.exe",
        "Windows\System32\edptask.dll",
        "Windows\System32\fveapibase.dll",
        "Windows\System32\fvecerts.dll",
        "Windows\System32\fvecpl.dll",
        "Windows\System32\fvenotify.exe",
        "Windows\System32\fveprompt.exe",
        "Windows\System32\fveskybackup.dll",
        "Windows\System32\fveui.dll",
        "Windows\System32\fvewiz.dll",
        "Windows\System32\manage-bde.exe",
        "Windows\System32\ortcengine.dll",
        "Windows\System32\pwlauncher.dll",
        "Windows\System32\pwlauncher.exe",
        "Windows\System32\pwsso.dll",
        "Windows\System32\ReAgentc.exe",
        "Windows\System32\ReAgentTask.dll",
        "Windows\System32\recdisc.exe",
        "Windows\System32\recovery.dll",
        "Windows\System32\RecoveryDrive.exe",
        "Windows\System32\RemoteWipeCSP.dll",
        "Windows\System32\repair-bde.exe",
        "Windows\System32\reseteng.dll",
        "Windows\System32\ResetEngine.dll",
        "Windows\System32\ResetEngine.exe",
        "Windows\System32\ResetEngOnline.dll",
        "Windows\System32\rtmcodecs.dll",
        "Windows\System32\rtmmvrortc.dll",
        "Windows\System32\rtmpal.dll",
        "Windows\System32\rtmpltfm.dll",
        "Windows\System32\SettingsHandlers_CloudPC.dll",
        "Windows\System32\SettingsHandlers_Flights.dll",
        "Windows\System32\SettingSyncDownloadHelper.dll",
        "Windows\System32\SharedPCCSP.dll",
        "Windows\System32\SyncSettings.dll",
        "Windows\System32\SysResetErr.exe",
        "Windows\System32\systemreset.exe",
        "Windows\System32\SystemSettings.DeviceEncryptionHandlers.dll",
        "Windows\System32\windlp.dll",
        "Windows\System32\Windows.CloudStore.EarlyDownloader.dll",
        "Windows\System32\Windows.Internal.Shell.CloudDesktop.TransitionScreen.dll",
        "Windows\System32\Windows.SharedPC.AccountManager.dll",
        "Windows\System32\Windows.SharedPC.CredentialProvider.dll",
        "Windows\System32\WinREAgent.dll",
        "Windows\System32\WofTasks.dll",
        "Windows\System32\wpbcreds.dll",
        "Windows\System32\manage-bde.wsf",
        "Windows\System32\srms.dat",
        "Windows\SystemResources\edputil.dll.mun",
        "Windows\SysWOW64\WindowsPowerShell\v1.0\Modules\BitLocker",
        "Windows\SysWOW64\SettingSyncDownloadHelper.dll",
        "Windows\SysWOW64\SyncSettings.dll",
        "Windows\SysWOW64\wpbcreds.dll",
        "Windows\SysWOW64\ctac.json",
        "Windows\System32\JpMapControl.dll",
        "Windows\System32\MapConfiguration.dll",
        "Windows\System32\MapControlCore.dll",
        "Windows\System32\MapControlStringsRes.dll",
        "Windows\System32\MapGeocoder.dll",
        "Windows\System32\MapRouter.dll",
        "Windows\System32\MapsBtSvc.dll",
        "Windows\System32\MapsBtSvcProxy.dll",
        "Windows\System32\MapsCSP.dll",
        "Windows\System32\MapsStore.dll",
        "Windows\System32\mapstoasttask.dll",
        "Windows\System32\mapsupdatetask.dll",
        "Windows\System32\BingFilterDS.dll",
        "Windows\System32\BingASDS.dll",
        "Program Files (x86)\Common Files\System\en-US",
        "Program Files (x86)\Common Files\System\wab32.dll",
        "Program Files (x86)\Common Files\System\wab32res.dll",
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
        "ProgramData\Microsoft\WinMSIPC",
        "Windows\assembly\GAC_32\srmlib",
        "Windows\assembly\GAC_64\srmlib",
        "Windows\PolicyDefinitions\DiskDiagnostic.admx",
        "Windows\servicing\InboxFodMetadataCache\metadata\Microsoft.Windows.IoTDeviceUpdateCenter*",
        "Windows\servicing\Packages\Microsoft-OneCore-DeviceUpdateCenter-Package*",
        "Windows\servicing\Packages\Microsoft-OneCore-WindowsIoT-Package*",
        "Windows\servicing\Packages\Microsoft-Shielded-VM-Service-Package*",
        "Windows\servicing\Packages\Microsoft-Windows-FCI-Client-Package*",
        "Windows\servicing\Packages\Microsoft-Windows-FCI-Client-WOW64-Package*",
        "Windows\servicing\Packages\Microsoft-Windows-Host-Guardian-Deployment-merged-Package*",
        "Windows\servicing\Packages\Microsoft-Windows-Host-Guardian-Deployment-Package*",
        "Windows\servicing\Packages\Microsoft-Windows-Not-Supported-On-LTSB-WOW64-Package*",
        "Windows\servicing\Packages\Microsoft-Windows-OneDrive-Setup-Package*",
        "Windows\servicing\Packages\Microsoft-Windows-OneDrive-Setup-WOW64-Package*",
        "Windows\servicing\Packages\Microsoft-Windows-PAW-Feature-Package*",
        "Windows\servicing\Packages\Microsoft-Windows-PAW-merged-Package*",
        "Windows\servicing\Packages\Microsoft-Windows-PAW-Package*",
        "Windows\servicing\Packages\Microsoft-Windows-RecDisc-SDP-removable-Package*",
        "Windows\servicing\Packages\Microsoft-Windows-RecoveryDrive-Package*",
        "Windows\servicing\Packages\Microsoft-Windows-ScreenSavers-3D-Package*",
        "Windows\servicing\Packages\Microsoft-Windows-SecureStartup-Package*",
        "Windows\servicing\Packages\Microsoft-Windows-SecureStartup-Subsystem-Package*",
        "Windows\servicing\Packages\Microsoft-Windows-SecureStartup-Subsystem-WOW64-Package*",
        "Windows\System32\CatRoot\{F750E6C3-38EE-11D1-85E5-00C04FC295EE}\Microsoft-OneCore-DeviceUpdateCenter-Package*",
        "Windows\System32\CatRoot\{F750E6C3-38EE-11D1-85E5-00C04FC295EE}\Microsoft-OneCore-WindowsIoT-Package*",
        "Windows\System32\CatRoot\{F750E6C3-38EE-11D1-85E5-00C04FC295EE}\Microsoft-Windows-FCI-Client-Package*",
        "Windows\System32\CatRoot\{F750E6C3-38EE-11D1-85E5-00C04FC295EE}\Microsoft-Windows-FCI-Client-WOW64-Package*",
        "Windows\System32\CatRoot\{F750E6C3-38EE-11D1-85E5-00C04FC295EE}\Microsoft-Windows-Host-Guardian-Deployment-merged-Package*",
        "Windows\System32\CatRoot\{F750E6C3-38EE-11D1-85E5-00C04FC295EE}\Microsoft-Windows-Host-Guardian-Deployment-Package*",
        "Windows\System32\CatRoot\{F750E6C3-38EE-11D1-85E5-00C04FC295EE}\Microsoft-Windows-Not-Supported-On-LTSB-WOW64-Package*",
        "Windows\System32\CatRoot\{F750E6C3-38EE-11D1-85E5-00C04FC295EE}\Microsoft-Windows-OneDrive-Setup-Package*",
        "Windows\System32\CatRoot\{F750E6C3-38EE-11D1-85E5-00C04FC295EE}\Microsoft-Windows-OneDrive-Setup-WOW64-Package*",
        "Windows\System32\CatRoot\{F750E6C3-38EE-11D1-85E5-00C04FC295EE}\Microsoft-Windows-PAW-Feature-Package*",
        "Windows\System32\CatRoot\{F750E6C3-38EE-11D1-85E5-00C04FC295EE}\Microsoft-Windows-PAW-merged-Package*",
        "Windows\System32\CatRoot\{F750E6C3-38EE-11D1-85E5-00C04FC295EE}\Microsoft-Windows-PAW-Package*",
        "Windows\System32\CatRoot\{F750E6C3-38EE-11D1-85E5-00C04FC295EE}\Microsoft-Windows-RecDisc-SDP-removable-Package*",
        "Windows\System32\CatRoot\{F750E6C3-38EE-11D1-85E5-00C04FC295EE}\Microsoft-Windows-RecoveryDrive-Package*",
        "Windows\System32\CatRoot\{F750E6C3-38EE-11D1-85E5-00C04FC295EE}\Microsoft-Windows-ScreenSavers-3D-Package*",
        "Windows\System32\CatRoot\{F750E6C3-38EE-11D1-85E5-00C04FC295EE}\Microsoft-Windows-SecureStartup-Package*",
        "Windows\System32\CatRoot\{F750E6C3-38EE-11D1-85E5-00C04FC295EE}\Microsoft-Windows-SecureStartup-Subsystem-Package*",
        "Windows\System32\CatRoot\{F750E6C3-38EE-11D1-85E5-00C04FC295EE}\Microsoft-Windows-SecureStartup-Subsystem-WOW64-Package*",
        "Windows\System32\en-US\ActionCenter.dll.mui",
        "Windows\System32\en-US\adrclient.dll.mui",
        "Windows\System32\en-US\Bubbles.scr.mui",
        "Windows\System32\en-US\CloudNotifications.exe.mui",
        "Windows\System32\en-US\dcsvc.dll.mui",
        "Windows\System32\en-US\DeviceUpdateAgent.dll.mui",
        "Windows\System32\en-US\DFDTS.dll.mui",
        "Windows\System32\en-US\DFDWiz.exe.mui",
        "Windows\System32\en-US\hcproviders.dll.mui",
        "Windows\System32\en-US\Mystify.scr.mui",
        "Windows\System32\en-US\PhotoScreensaver.scr.mui",
        "Windows\System32\en-US\recovery.dll.mui",
        "Windows\System32\en-US\Ribbons.scr.mui",
        "Windows\System32\en-US\RMActivate_*",
        "Windows\System32\en-US\scrnsave.scr.mui",
        "Windows\System32\en-US\SettingsHandlers_OneDriveBackup.dll.mui",
        "Windows\System32\en-US\srm.dll.mui",
        "Windows\System32\en-US\srmshell.dll.mui",
        "Windows\System32\en-US\ssText3d.scr.mui",
        "Windows\System32\en-US\winmsipc.dll.mui",
        "Windows\System32\MSDRM",
        "Windows\System32\UNP",
        "Windows\System32\ActionCenter.dll",
        "Windows\System32\ActionCenterCPL.dll",
        "Windows\System32\adrclient.dll",
        "Windows\System32\Bubbles.scr",
        "Windows\System32\CloudNotifications.exe",
        "Windows\System32\dcsvc.dll",
        "Windows\System32\declaredconfiguration.dll",
        "Windows\System32\DeviceUpdateAgent.dll",
        "Windows\System32\DeviceUpdateCenterCsp.dll",
        "Windows\System32\dfdts.dll",
        "Windows\System32\DFDWiz.exe",
        "Windows\System32\hcproviders.dll",
        "Windows\System32\Mystify.scr",
        "Windows\System32\OneDrive.ico",
        "Windows\System32\PhotoScreensaver.scr",
        "Windows\System32\Ribbons.scr",
        "Windows\System32\RMActivate.exe",
        "Windows\System32\RMActivate_*",
        "Windows\System32\scrnsave.scr",
        "Windows\System32\secproc.dll",
        "Windows\System32\secproc_*",
        "Windows\System32\SecurityAndMaintenance.png",
        "Windows\System32\SettingsHandlers_OneDriveBackup.dll",
        "Windows\System32\srm.dll",
        "Windows\System32\srm_ps.dll",
        "Windows\System32\srmclient.dll",
        "Windows\System32\srmlib.dll",
        "Windows\System32\srmscan.dll",
        "Windows\System32\srmshell.dll",
        "Windows\System32\srmstormod.dll",
        "Windows\System32\srmtrace.dll",
        "Windows\System32\ssText3d.scr",
        "Windows\System32\SustainabilityService.dll",
        "Windows\System32\WindowsIoTCsp.dll",
        "Windows\System32\winipcfile.dll",
        "Windows\System32\winipcsecproc.dll",
        "Windows\System32\winmsipc.dll",
        "Windows\System32\WinMsoIrmProtector.dll",
        "Windows\System32\WinOpcIrmProtector.dll",
        "Windows\SystemResources\ActionCenterCPL.dll.mun",
        "Windows\SysWOW64\en-US\ActionCenter.dll.mui",
        "Windows\SysWOW64\en-US\ActionCenterCPL.dll.mui",
        "Windows\SysWOW64\en-US\adrclient.dll.mui",
        "Windows\SysWOW64\en-US\CloudNotifications.exe.mui",
        "Windows\SysWOW64\en-US\hcproviders.dll.mui",
        "Windows\SysWOW64\en-US\msdrm.dll.mui",
        "Windows\SysWOW64\en-US\PhotoScreensaver.scr.mui",
        "Windows\SysWOW64\en-US\RMActivate.exe.mui",
        "Windows\SysWOW64\en-US\RMActivate_*",
        "Windows\SysWOW64\en-US\scrnsave.scr.mui",
        "Windows\SysWOW64\en-US\srm.dll.mui",
        "Windows\SysWOW64\en-US\srmshell.dll.mui",
        "Windows\SysWOW64\en-US\winmsipc.dll.mui",
        "Windows\SysWOW64\MSDRM",
        "Windows\SysWOW64\ActionCenter.dll",
        "Windows\SysWOW64\ActionCenterCPL.dll",
        "Windows\SysWOW64\adrclient.dll",
        "Windows\SysWOW64\BitLockerCsp.dll",
        "Windows\SysWOW64\boot.sdi",
        "Windows\SysWOW64\CloudNotifications.exe",
        "Windows\SysWOW64\edpauditapi.dll",
        "Windows\SysWOW64\edpnotify.exe",
        "Windows\SysWOW64\edputil.dll",
        "Windows\SysWOW64\fveapi.dll",
        "Windows\SysWOW64\fveapibase.dll",
        "Windows\SysWOW64\fvecerts.dll",
        "Windows\SysWOW64\hcproviders.dll",
        "Windows\SysWOW64\msdrm.dll",
        "Windows\SysWOW64\PhotoScreensaver.scr",
        "Windows\SysWOW64\ortcengine.dll",
        "Windows\SysWOW64\ReAgent.dll",
        "Windows\SysWOW64\ReAgentc.exe",
        "Windows\SysWOW64\ReInfo.dll",
        "Windows\SysWOW64\RMActivate.exe",
        "Windows\SysWOW64\RMActivate_*",
        "Windows\SysWOW64\rtmcodecs.dll",
        "Windows\SysWOW64\rtmmvrortc.dll",
        "Windows\SysWOW64\rtmpal.dll",
        "Windows\SysWOW64\rtmpltfm.dll",
        "Windows\SysWOW64\scrnsave.scr",
        "Windows\SysWOW64\secproc.dll",
        "Windows\SysWOW64\secproc_isv.dll",
        "Windows\SysWOW64\secproc_ssp.dll",
        "Windows\SysWOW64\secproc_ssp_isv.dll",
        "Windows\SysWOW64\SecurityAndMaintenance.png",
        "Windows\SysWOW64\SecurityAndMaintenance_Alert.png",
        "Windows\SysWOW64\SecurityAndMaintenance_Error.png",
        "Windows\SysWOW64\srm.dll",
        "Windows\SysWOW64\srm_ps.dll",
        "Windows\SysWOW64\srmclient.dll",
        "Windows\SysWOW64\srmlib.dll",
        "Windows\SysWOW64\srmscan.dll",
        "Windows\SysWOW64\srmshell.dll",
        "Windows\SysWOW64\srmstormod.dll",
        "Windows\SysWOW64\srmtrace.dll",
        "Windows\SysWOW64\Windows.Services.TargetedContent.dll",
        "Windows\SysWOW64\winipcfile.dll",
        "Windows\SysWOW64\winipcsecproc.dll",
        "Windows\SysWOW64\winmsipc.dll",
        "Windows\SysWOW64\WinMsoIrmProtector.dll",
        "Windows\SysWOW64\WinOpcIrmProtector.dll",
        "Windows\WinSxS\amd64_microsoft-windows-onedrive-setup_*"
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