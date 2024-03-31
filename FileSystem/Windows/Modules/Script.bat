@Echo off
Title RaxOS
setlocal EnableDelayedExpansion

Echo "Installing Visual C Runtimes"
start /b /wait "" "C:\Modules\VisualCAIO\install_all.bat" >nul 2>&1
cls

Echo "Disabling Process Mitigations"
call C:\Modules\disable-process-mitigations.bat >nul 2>&1
cls

Echo "Execution Policy To Unrestricted"
powershell set-executionpolicy unrestricted -force >nul 2>&1
cls

Echo "Disabling reserved storage"
DISM /Online /Set-ReservedStorageState /State:Disabled >nul 2>&1
cls

Echo "Configuring "Keyboard and Mouse Settings"
Reg.exe add "HKCU\Control Panel\Keyboard" /v "InitialKeyboardIndicators" /t REG_SZ /d "0" /f >nul 2>&1
Reg.exe add "HKCU\Control Panel\Keyboard" /v "KeyboardDelay" /t REG_SZ /d "0" /f >nul 2>&1
Reg.exe add "HKCU\Control Panel\Keyboard" /v "KeyboardSpeed" /t REG_SZ /d "31" /f >nul 2>&1
Reg.exe add "HKCU\Control Panel\Mouse" /v "MouseSpeed" /t REG_SZ /d "0" /f >nul 2>&1
Reg.exe add "HKCU\Control Panel\Mouse" /v "MouseThreshold1" /t REG_SZ /d "0" /f >nul 2>&1
Reg.exe add "HKCU\Control Panel\Mouse" /v "MouseThreshold2" /t REG_SZ /d "0" /f >nul 2>&1
cls

Echo "Disabling Write Cache Buffer"
	for /f "tokens=*" %%i in ('reg query "HKLM\SYSTEM\CurrentControlSet\Enum\SCSI"^| findstr "HKEY"') do (
		for /f "tokens=*" %%a in ('reg query "%%i"^| findstr "HKEY"') do reg.exe add "%%a\Device Parameters\Disk" /v "CacheIsPowerProtected" /t REG_DWORD /d "1" /f > NUL 2>&1
	)
	for /f "tokens=*" %%i in ('reg query "HKLM\SYSTEM\CurrentControlSet\Enum\SCSI"^| findstr "HKEY"') do (
		for /f "tokens=*" %%a in ('reg query "%%i"^| findstr "HKEY"') do reg.exe add "%%a\Device Parameters\Disk" /v "UserWriteCacheSetting" /t REG_DWORD /d "1" /f > NUL 2>&1
	)
)
cls

Echo "Visual Effects"
Reg.exe add "HKCU\Control Panel\Desktop" /v "UserPreferencesMask" /t REG_BINARY /d "9012038010000000" /f > NUL 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewShadow" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewAlphaSelect" /t REG_DWORD /d "0" /f > NUL 2>&1
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /t REG_DWORD /d "3" /f > NUL 2>&1
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAnimations" /t REG_DWORD /d "0" /f > NUL 2>&1
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\DWM" /v "Blur" /t REG_DWORD /d "0" /f > NUL 2>&1
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\DWM" /v "Animations" /t REG_DWORD /d "0" /f > NUL 2>&1
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DWM" /v "DWMA_TRANSITTIONS_FORCEDISABLED" /t REG_DWORD /d "1" /f > NUL 2>&1
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DWM" /v "DisallowAnimations" /t REG_DWORD /d "1" /f > NUL 2>&1
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DWM" /v "AnimationAttributionEnabled" /t REG_DWORD /d "0" /f > NUL 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "UseOLEDTaskbarTransparency" /t REG_DWORD /d "0" /f > NUL 2>&1
Reg.exe add "HKCU\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /t REG_DWORD /d "0" /f > NUL 2>&1
Reg.exe add "HKCU\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /t REG_SZ /d "0" /f > NUL 2>&1
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "IconsOnly" /t REG_DWORD /d "0" /f > NUL 2>&1
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\DWM" /v "EnableAeroPeek" /t REG_DWORD /d "0" /f > NUL 2>&1
Reg.exe add "HKCU\Control Panel\Desktop" /v "DragFullWindows" /t REG_SZ /d "0" /f > NUL 2>&1
Reg.exe add "HKCU\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /t REG_SZ /d "0" /f > NUL 2>&1
Reg.exe Add "HKCU\Software\Microsoft\Windows\DWM" /v "AlwaysHibernateThumbnails" /t REG_DWORD /d 0 /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "SystemUsesLightTheme" /t REG_DWORD /d "0" /f > NUL 2>&1
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AppsUseLightTheme" /t REG_DWORD /d "0" /f > NUL 2>&1
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Hidden" /t REG_DWORD /d "1" /f > NUL 2>&1
Reg.exe delete "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "DisableNotificationCenter" /f >nul 2>&1
Reg.exe delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v "DisableNotificationCenter" /f >nul 2>&1
cls

Echo "Editing Bcdedit"
bcdedit /set {current} nx optin
bcdedit /set disabledynamictick yes
bcdedit /deletevalue useplatformclock
bcdedit /set bootmenupolicy legacy
bcdedit /set hypervisorlaunchtype off
bcdedit /set isolatedcontext No
bcdedit /set vsmlaunchtype Off 
bcdedit /set vm No
bcdedit /set disableelamdrivers Yes
bcdedit /set {globalsettings} custom:16000067 true
bcdedit /set {globalsettings} custom:16000068 true
bcdedit /set {globalsettings} custom:16000069 true
bcdedit /timeout 10
bcdedit /set {current} description "RaxOS"
label C: RaxOS
cls

Echo "Restore old context menu"
Reg add "HKEY_CURRENT_USER\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32"
@=""
cls

Echo "Disabling network adapters"
powershell -NoProfile -Command "Disable-NetAdapterBinding -Name "*" -ComponentID ms_tcpip6, ms_msclient, ms_server, ms_rspndr, ms_lltdio, ms_implat, ms_lldp" >nul 2>&1
cls

Echo "Disabling NetBIOS over TCP/IP"
for /f "delims=" %%u in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services\NetBT\Parameters\Interfaces" /s /f "NetbiosOptions" ^| findstr "HKEY"') do (
    reg add "%%u" /v "NetbiosOptions" /t REG_DWORD /d "2" /f
)
cls

Echo "Disabling AutoLoggers and Firewall Rules"
C:\Windows\PowerRun.exe "powershell.exe" Remove-AutologgerConfig -Name "autologger-diagtrack-listener", "cellcore", "cloudexperiencehostoobe", "lwtnetlog", "mellanox-Kernel", "microsoft-windows-assignedaccess-trace", "microsoft-windows-rdp-graphics-rdpidd-trace"
cls

Echo "Disabling DMA Remapping"
for %%a in (DmaRemappingCompatible) do for /f "delims=" %%b in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services" /s /f "%%a" ^| findstr "HKEY"') do Reg.exe add "%%b" /v "%%a" /t REG_DWORD /d "0" /f >nul 2>&1
cls

Echo "Disabling Exclusive Mode On Audio Devices"
for /f "delims=" %%a in ('reg query HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\MMDevices\Audio\Capture') do PowerRun.exe /SW:0 Reg.exe add "%%a\Properties" /v "{b3f8fa53-0004-438e-9003-51a46e139bfc},3" /t REG_DWORD /d "0" /f >nul 2>&1
for /f "delims=" %%a in ('reg query HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\MMDevices\Audio\Capture') do PowerRun.exe /SW:0 Reg.exe add "%%a\Properties" /v "{b3f8fa53-0004-438e-9003-51a46e139bfc},4" /t REG_DWORD /d "0" /f >nul 2>&1
for /f "delims=" %%a in ('reg query HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\MMDevices\Audio\Render') do PowerRun.exe /SW:0 Reg.exe add "%%a\Properties" /v "{b3f8fa53-0004-438e-9003-51a46e139bfc},3" /t REG_DWORD /d "0" /f >nul 2>&1
for /f "delims=" %%a in ('reg query HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\MMDevices\Audio\Render') do PowerRun.exe /SW:0 Reg.exe add "%%a\Properties" /v "{b3f8fa53-0004-438e-9003-51a46e139bfc},4" /t REG_DWORD /d "0" /f >nul 2>&1
cls

Echo "Editing POW & power tweaks"
powercfg -import "C:\Modules\RaxOS.pow" 00000000-0000-0000-0000-000000000000
powercfg /setactive 00000000-0000-0000-0000-000000000000
powercfg -h off
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "HiberbootEnabled" /t Reg_DWORD /d "0" /f  >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HibernateEnabled" /t Reg_DWORD /d "0" /f  >nul 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HibernateEnabledDefault" /t Reg_DWORD /d "0" /f  >nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings" /v "ShowHibernateOption" /t Reg_DWORD /d "0" /f  >nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings" /v "ShowLockOption" /t Reg_DWORD /d "0" /f  >nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings" /v "ShowSleepOption" /t Reg_DWORD /d "0" /f >nul 2>&1
wevtutil set-log "Microsoft-Windows-SleepStudy/Diagnostic" /e:false >nul 2>&1
wevtutil set-log "Microsoft-Windows-Kernel-Processor-Power/Diagnostic" /e:false >nul 2>&1
wevtutil set-log "Microsoft-Windows-UserModePowerService/Diagnostic" /e:false >nul 2>&1
cls

Echo "Disabling Device Manager Devices"
devmanview /disable "High precision event timer" > NUL 2>&1
devmanview /disable "System Speaker" > NUL 2>&1
devmanview /disable "Microsoft Radio Device Enumeration Bus" > NUL 2>&1
devmanview /disable "PCI Encryption/Decryption Controller" > NUL 2>&1
devmanview /disable "AMD PSP" > NUL 2>&1
devmanview /disable "Intel SMBus" > NUL 2>&1
devmanview /disable "Intel Management Engine" > NUL 2>&1
devmanview /disable "PCI Memory Controller" > NUL 2>&1
devmanview /disable "PCI standard RAM Controller" > NUL 2>&1
devmanview /disable "System Timer" > NUL 2>&1
devmanview /disable "Programmable Interrupt Controller" > NUL 2>&1
devmanview /disable "Numeric Data Processor" > NUL 2>&1
devmanview /disable "Communications Port (COM1)" > NUL 2>&1
devmanview /disable "Fax" > NUL 2>&1
devmanview /disable "Microsoft Print to PDF" > NUL 2>&1
devmanview /disable "Microsoft XPS Document Writer" > NUL 2>&1
devmanview /disable "Root Print Queue" > NUL 2>&1
devmanview /disable "Remote Desktop Device Redirector Bus" > NUL 2>&1
cls

Echo "Optimizing Scheduled Tasks"
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\Diagnosis\Scheduled" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\DiskFootprint\Diagnostics" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\InstallService\ScanForUpdates" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\InstallService\ScanForUpdatesAsUser" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\Registry\RegIdleBackup" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\StateRepository\MaintenanceTasks" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\SystemRestore\SR" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\WDI\ResolutionHost" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\Windows Error Reporting\QueueReporting" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\ApplicationData\appuriverifierdaily" >nul 2>&11
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\Application Experience\StartupAppTask" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\Application Experience\MareBackup" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\Application Experience\ProgramDataUpdater" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\Autochk\Proxy" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\Device Information\Device User" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\Device Information\Device" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\Feedback\Siuf\DmClient" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\Flighting\FeatureConfig\ReconcileFeatures" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\Flighting\FeatureConfig\UsageDataFlushing" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\Flighting\FeatureConfig\UsageDataReporting" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\Input\InputSettingsRestoreDataAvailable" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\Input\LocalUserSyncDataAvailable" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\Input\MouseSyncDataAvailable" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\Input\PenSyncDataAvailable" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\Input\syncpensettings" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\Input\TouchpadSyncDataAvailable" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\Location\Notifications" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\Location\WindowsActionDialog" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\ApplicationData\DsSvcCleanup" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\CloudExperienceHost\CreateObjectTask" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\Maintenance\WinSAT" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\PI\Sqm-Tasks" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\Shell\IndexerAutomaticMaintenance" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\Maps\MapsToastTask" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\Maps\MapsUpdateTask" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\MemoryDiagnostic\ProcessMemoryDiagnosticEvents" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\MemoryDiagnostic\RunFullMemoryDiagnostic" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\defrag\ScheduledDefrag" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\Diagnosis\RecommendedTroubleshootingScanner" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\DUSM\dusmtask" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\FileHistory\File History (maintenance mode)" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\defrag\ScheduledDefrag" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\Printing\EduPrintProv" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\Printing\PrinterCleanupTask" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\Printing\PrintJobCleanupTask" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\RemoteAssistance\RemoteAssistanceTask" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\Sysmain\ResPriStaticDbSync" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\Sysmain\WsSwapAssessmentTask" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\UPnP\UPnPHostConfig" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\DiskFootprint\StorageSense" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\Chkdsk\ProactiveScan" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\Chkdsk\SyspartRepair" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\Data Integrity Scan\Data Integrity Check And Scan" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\Data Integrity Scan\Data Integrity Scan" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\Data Integrity Scan\Data Integrity Scan for Crash Recovery" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\BrokerInfrastructure\BgTaskRegistrationMaintenanceTask" >nul 2>&1
powerrun "schtasks.exe" /delete /f /tn "\Microsoft\Windows\TaskScheduler" >nul 2>&1
powerrun "schtasks.exe" /delete /f /tn "\Microsoft\Windows\WindowsUpdate\Scheduled Start" >nul 2>&1
powerrun "schtasks.exe" /delete /f /tn "\Microsoft\Windows\UpdateOrchestrator\Schedule Scan" >nul 2>&1
powerrun "schtasks.exe" /delete /f /tn "\Microsoft\Windows\UpdateOrchestrator\Schedule Scan Static Task" >nul 2>&1
powerrun "schtasks.exe" /delete /f /tn "\Microsoft\Windows\UpdateOrchestrator\Schedule Wake To Work" >nul 2>&1
powerrun "schtasks.exe" /delete /f /tn "\Microsoft\Windows\UpdateOrchestrator\Start Oobe Expedite Work" >nul 2>&1
powerrun "schtasks.exe" /delete /f /tn "\Microsoft\Windows\Windows Defender\Windows Defender Cache Maintenance" >nul 2>&1
powerrun "schtasks.exe" /delete /f /tn "\Microsoft\Windows\Windows Defender\Windows Defender Cleanup" >nul 2>&1
powerrun "schtasks.exe" /delete /f /tn "\Microsoft\Windows\Windows Defender\Windows Defender Scheduled Scan" >nul 2>&1
powerrun "schtasks.exe" /delete /f /tn "\Microsoft\Windows\Windows Defender\Windows Defender Verification" >nul 2>&1
powerrun "schtasks.exe" /delete /f /tn "\Microsoft\Windows\Windows Defender" >nul 2>&1
powerrun "schtasks.exe" /delete /f /tn "\Microsoft\Windows\BitLocker\BitLocker Encrypt All Drives" >nul 2>&1
powerrun "schtasks.exe" /delete /f /tn "\Microsoft\Windows\BitLocker\BitLocker MDM policy Refresh" >nul 2>&1
powerrun "schtasks.exe" /delete /f /tn "\Microsoft\Windows\BitLocker" >nul 2>&1
powerrun "schtasks.exe" /delete /f /tn "\Microsoft\Windows\EDP\EDP App Launch Task" >nul 2>&1
powerrun "schtasks.exe" /delete /f /tn "\Microsoft\Windows\EDP\EDP Auth Task" >nul 2>&1
powerrun "schtasks.exe" /delete /f /tn "\Microsoft\Windows\EDP\EDP Inaccessible Credentials Task" >nul 2>&1
powerrun "schtasks.exe" /delete /f /tn "\Microsoft\Windows\EDP\StorageCardEncryption Task" >nul 2>&1
powerrun "schtasks.exe" /delete /f /tn "\Microsoft\Windows\EDP" >nul 2>&1
powerrun "schtasks.exe" /delete /f /tn "\Microsoft\Windows\RecoveryEnvironment\VerifyWinRE" >nul 2>&1
powerrun "schtasks.exe" /delete /f /tn "\Microsoft\Windows\RecoveryEnvironment" >nul 2>&1
powerrun "schtasks.exe" /delete /f /tn "\Microsoft\Windows\SharedPC\Account Cleanup" >nul 2>&1
powerrun "schtasks.exe" /delete /f /tn "\Microsoft\Windows\SharedPC" >nul 2>&1
powerrun "schtasks.exe" /delete /f /tn "\Microsoft\Windows\SyncCenter" >nul 2>&1
powerrun "schtasks.exe" /delete /f /tn "\Microsoft\Windows\RetailDemo\CleanupOfflineContent" >nul 2>&1
powerrun "schtasks.exe" /delete /f /tn "\Microsoft\Windows\RetailDemo" >nul 2>&1
cls

Echo "Creating Default Services Backup"
sc config wlansvc start=auto
set BACKUP="C:\Windows\srvbackup\Windows-Default-services.reg"
echo Windows Registry Editor Version 5.00 >>%BACKUP%

for /f "delims=" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services"') do (
    for /f "tokens=3" %%b in ('reg query "%%~a" /v "Start" 2^>nul') do (
        for /l %%c in (0,1,4) do (
            if "%%b"=="0x%%c" (
                echo. >>%BACKUP%
                echo [%%~a] >>%BACKUP%
                echo "Start"=dword:0000000%%c >>%BACKUP%
            ) 
        ) 
    ) 
) >nul 2>&1
cls

Echo "Changing fsutil behaviors"
fsutil behavior set disable8dot3 1 > NUL 2>&1
fsutil behavior set disablelastaccess 1 > NUL 2>&1
cls

Echo "Disable Driver PowerSaving"
%SYSTEMROOT%\System32\WindowsPowerShell\v1.0\powershell.exe -Command "Get-WmiObject MSPower_DeviceEnable -Namespace root\wmi | ForEach-Object { $_.enable = $false; $_.psbase.put(); }"
cls

Echo "Enabling MSI mode & set to undefined"
for /f %%i in ('wmic path Win32_USBController get PNPDeviceID^| findstr /L "PCI\VEN_"') do reg add "HKLM\System\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t REG_DWORD /d "1" /f
for /f %%i in ('wmic path Win32_USBController get PNPDeviceID^| findstr /L "PCI\VEN_"') do reg delete "HKLM\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\Affinity Policy" /v "DevicePriority" /f >nul 2>nul
:: Probably will be reset by installing GPU driver
for /f %%i in ('wmic path Win32_VideoController get PNPDeviceID^| findstr /L "PCI\VEN_"') do reg add "HKLM\System\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t REG_DWORD /d "1" /f
for /f %%i in ('wmic path Win32_VideoController get PNPDeviceID^| findstr /L "PCI\VEN_"') do reg add "HKLM\System\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\Affinity Policy" /v "DevicePriority" /f >nul 2>nul
for /f %%i in ('wmic path Win32_NetworkAdapter get PNPDeviceID^| findstr /L "PCI\VEN_"') do reg add "HKLM\System\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t REG_DWORD /d "1" /f
for /f %%i in ('wmic path Win32_IDEController get PNPDeviceID^| findstr /L "PCI\VEN_"') do reg add "HKLM\System\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t REG_DWORD /d "1" /f
for /f %%i in ('wmic path Win32_IDEController get PNPDeviceID^| findstr /L "PCI\VEN_"') do reg add "HKLM\System\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\Affinity Policy" /v "DevicePriority" /f >nul 2>nul
for /f %%i in ('wmic path Win32_NetworkAdapter get PNPDeviceID^| findstr /L "PCI\VEN_"') do reg add "HKLM\System\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\Affinity Policy" /v "DevicePriority" /f >nul 2>nul
cls

Echo "Remove Share from context menu"
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{e2bf9676-5f8f-435c-97eb-11607a5bedf7}" /t REG_SZ /d "" /f > nul
reg add "HKLM\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{e2bf9676-5f8f-435c-97eb-11607a5bedf7}" /t REG_SZ /d "" /f > nul
cls

Echo "Change NTP server to pool.ntp.org"
w32tm /config /syncfromflags:manual /manualpeerlist:"0.pool.ntp.org 1.pool.ntp.org 2.pool.ntp.org 3.pool.ntp.org"
SC queryex "w32time"|Find "STATE"|Find /v "RUNNING">Nul||(
    net stop w32time
)
net start w32time
w32tm /config /update
w32tm /resync
cls

Echo "Removing Quick access"
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "HubMode" /t REG_DWORD /d "1" /f >nul 2>&1
PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Classes\CLSID\{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}\ShellFolder" /v "Attributes" /t REG_DWORD /d "2962489444" /f >nul 2>&1
PowerRun.exe /SW:0 Reg.exe add "HKCR\CLSID\{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}\ShellFolder" /v "Attributes" /t REG_DWORD /d "2962489444" /f >nul 2>&1
cls

Echo "Set Sound Scheme to No Sound"
powershell C:\Modules\sound.ps1 >nul 2>&1
cls

Echo "Disabling Drivers and Services"
PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e96c-e325-11ce-bfc1-08002be10318}" /v "UpperFilters" /t REG_MULTI_SZ /d "" /f
PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{6bdd1fc6-810f-11d0-bec7-08002be2092f}" /v "UpperFilters" /t REG_MULTI_SZ /d "" /f
PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{ca3e7ab9-b4c3-4ae6-8251-579ef933890f}" /v "UpperFilters" /t REG_MULTI_SZ /d "" /f
PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e967-e325-11ce-bfc1-08002be10318}" /v "LowerFilters" /t REG_MULTI_SZ /d "" /f
PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{71a27cdd-812a-11d0-bec7-08002be2092f}" /v "LowerFilters" /t REG_MULTI_SZ /d "" /f
PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{71a27cdd-812a-11d0-bec7-08002be2092f}" /v "UpperFilters" /t REG_MULTI_SZ /d "" /f
PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Dhcp" /v "DependOnService" /t REG_MULTI_SZ /d "NSI\0Afd" /f
PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Dnscache" /v "DependOnService" /t REG_MULTI_SZ /d "nsi" /f
Reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SoftwareProtectionPlatform" /v "InactivityShutdownDelay" /t REG_DWORD /d "4294967295" /f
for %%z in (
      AJRouter
      ALG
      AssignedAccessManagerSvc
      AppVClient
      AppIDSvc
      autotimesvc
      AxInstSV
      AarSvc
      acpiex
      acpipagr
      acpipmi
      acpitime
      arcsas
      Beep
      BcastDVRUserService
      bthleenum
      BTHMODEM
      BthA2dp
      BthEnum
      BthHFEnum
      BTAGService
      bthserv
      BluetoothUserService
      BthAvctpSvc
      bttflt
      HidBth
      BthMini
      BTHPORT
      BTHUSB
      CertPropSvc
      CloudBackupRestoreSvc
      COMSysApp
      ConsentUXUserSvc
      CscService
      cdrom
      cnghwassist
      cloudidsvc
      CldFlt
      cdfs
      circlass
      CompositeBus
      DusmSvc
      defragsvc
      DsSvc
      DialogBlockingService
      dispbrokerdesktopsvc
      DiagTrack
      diagsvc
      DPS
      diagnosticshub.standardcollector.service
      dmwappushservice
      dcsvc
      DevQueryBroker
      DmEnrollmentSvc
      dam
      ehstorclass
      ehstortcgdrv
      embeddedmode
      EapHost
      EFS
      EntAppSvc
      FontCache
      FontCache3.0.0.0
      fdPHost
      fhsvc
      FDResPub
      GraphicsPerfSvc
      gencounter
      GameInputSvc
      hyperkbd
      hypervideo
      hvservice
      hvcrash
      HvHost
      IpxlatCfgSvc
      lfsvc
      lltdio
      lltdsvc
      luafv
      InventorySvc
      lltsdvc
      IKEEXT
      lmhosts
      KtmRM
      MSiSCSI
      MessagingService
      McpManagementService
      mslldp
      MixedRealityOpenXRSvc
      microsoft_bluetooth_avrcptransport
      MapsBroker
      Ndu
      NetBIOS
      NetBT
      NetTcpPortSharing
      NaturalAuthentication
      NPSMSvc
      OneSyncSvc
      UsoSvc
      PcaSvc
      PimIndexMaintenanceSvc
      printworkflowusersvc
      PolicyAgent
      PrintNotify
      PenService
      P9RdrService
      PNRPAutoReg
      PNRPsvc
      p2psvc
      p2pimsvc
      PhoneSvc
      perceptionsimulation
      PeerDistSvc
      QWAVE
      QWAVEdrv
      rspndr
	rdyboost
      rdpbus
      RetailDemo
      RasAuto
      RasAcd
      RDPDR
      RdpVideominiport
      RmSvc
      RFCOMM
      SharedAccess
      SysMain
      ShellHWDetection
      SCardSvr
      ScDeviceEnum
      SCPolicySvc
      scfilter
      SDRSVC
      SessionEnv
      smphost
      SNMPTrap
      svsc
      swprv
      spectrum
      SharedRealitySvc
      spooler
      SEMgrSvc
      SSDPSRV
      storflt
      SmsRouter
      spaceport
      SgrmAgent
      SgrmBroker
      Themes
      TrkWks
      tzautoupdate
      troubleshootingsvc
      TapiSrv
      terminpt
      TsUsbGD
      TermService
      tcpipreg
      TsUsbFlt
      tsusbhub
      TieringEngineService
      upnphost
      UserDataSvc
      UnistoreSvc
      udfs
      UmRdpService
      VacSvc
      Vid
      vmickvpexchange
      vmicguestinterface
      vmicshutdown
      vmicheartbeat
      vmicvmsession
      vpci
      vmicrdv
      vmictimesync
      vmicvss
      vmgid
      VSS
      W32Time
      WaaSMedicSvc
      WalletService
      wbengine
      WpnService
      WbioSrvc
      WEPHOSTSVC
      WerSvc
      wercplsupport
      WSearch
      WPDBusEnum
      wdiservicehost
      WarpJITSvc
      wisvc
      wlpasvc
      wmpApSrv
      wdisystemhost
      WMPNetworkSvc
      WpcMonSvc
      wmiApSrv
      WebClient
      webthreatdefsvc
      webthreatdefusersvc
) do (
PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\%%z" /v "Start" /t REG_DWORD /d "4" /f
)
cls

Echo "Setting Timer Resolution"
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "TimerResolution" /t REG_SZ /d "C:\Windows\SetTimerResolution.exe --resolution 5067 --no-console" /f
cls

Echo "Disable Background apps & Deleting TimerRes on W10"
ver | findstr /i "10\.0\.[0-1][0-9][0-9][0-9][0-9]*" > nul
if %errorlevel% equ 0 (
    Reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "GlobalUserDisabled" /t Reg_DWORD /d "1" /f >nul 2>&1
    Reg add "HKLM\Software\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsRunInBackground" /t Reg_DWORD /d "2" /f >nul 2>&1
    Reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "BackgroundAppGlobalToggle" /t Reg_DWORD /d "0" /f >nul 2>&1
    Reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "TimerResolution" /t REG_SZ /d "C:\Windows\SetTimerResolution.exe --resolution 5067 --no-console" >nul 2>&1
    del /q "C:\Windows\SetTimerResolution.exe" >nul 2>&1
    cls
) else (
    echo "This script is compatible with Windows build 19045 or lower."
)
cls

Echo "Renaming microcodes"
cd C:\Windows\System32
takeown /f "mcupdate_AuthenticAMD.dll"
icacls "C:\Windows\System32\mcupdate_AuthenticAMD.dll" /grant Administrators:F
ren mcupdate_AuthenticAMD.dll mcupdate_AuthenticAMD.old
takeown /f "mcupdate_GenuineIntel.dll"
icacls "C:\Windows\System32\mcupdate_GenuineIntel.dll" /grant Administrators:F
ren mcupdate_GenuineIntel.dll mcupdate_GenuineIntel.old
cls

Echo "Laptop stuff"
for /f "delims=:{}" %%a in ('wmic path Win32_SystemEnclosure get ChassisTypes ^| findstr [0-9]') do set "CHASSIS=%%a"
set "DEVICE_TYPE=PC"
for %%a in (8 9 10 11 12 13 14 18 21 30 31 32) do if "%CHASSIS%" == "%%a" (set "DEVICE_TYPE=LAPTOP")

if "%DEVICE_TYPE%" == "LAPTOP" (
    Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\serenum" /v "Start" /t REG_DWORD /d "3" /f >nul 2>&1
    Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\sermouse" /v "Start" /t REG_DWORD /d "3" /f >nul 2>&1
    Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\serial" /v "Start" /t REG_DWORD /d "3" /f >nul 2>&1
    Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d "0" /f
    powercfg /setactive 381b4222-f694-41f0-9685-ff5bb260df2e
    cls
)
) else (
    Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DisplayEnhancementService" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
    Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\bam" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
    Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d "1" /f  >nul 2>&1
    cls
)
cls

Echo "Creating RaxOS Services Backup"
set BACKUP="C:\Windows\srvbackup\RaxOS-Default-services.reg"
echo Windows Registry Editor Version 5.00 >>%BACKUP%

for /f "delims=" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services"') do (
    for /f "tokens=3" %%b in ('reg query "%%~a" /v "Start" 2^>nul') do (
        for /l %%c in (0,1,4) do (
            if "%%b"=="0x%%c" (
                echo. >>%BACKUP%
                echo [%%~a] >>%BACKUP%
                echo "Start"=dword:0000000%%c >>%BACKUP%
            ) 
        ) 
    ) 
) >nul 2>&1
cls

Echo "Disable website access to language list"
reg add "HKEY_CURRENT_USER\Control Panel\International\User Profile" /v "HttpAcceptLanguageOptOut" /t REG_DWORD /d 1 /f
cls

Echo "Fix explorer white bar bug"
cmd /c "start C:\Windows\explorer.exe"
taskkill /f /im explorer.exe >nul 2>&1
taskkill /f /im explorer.exe >nul 2>&1
taskkill /f /im explorer.exe >nul 2>&1
taskkill /f /im explorer.exe >nul 2>&1
taskkill /f /im explorer.exe >nul 2>&1
cmd /c "start C:\Windows\explorer.exe"
cls

Echo "Cleanup"
takeown /f "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup" /a >nul 2>&1 & icacls "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup" /grant Administrators:F >nul 2>&1
xcopy "%WinDir%\Modules\cleanup.bat" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup" /i >nul 2>&1
cls

shutdown -r -t 0
