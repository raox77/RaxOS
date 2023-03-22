@Echo off 
Title RaxOS 
setlocal EnableDelayedExpansion

Echo "Installing Visual C Runtimes"
start /b /wait "" "C:\Modules\VisualCAIO\install_all.bat" >nul 2>&1
cls

Echo "Installing 7zip"
start /b /wait "" "C:\Modules\7z2201-x64.msi" /passive >nul 2>&1
cls

Echo "Installing OpenShell"
start /b /wait "" "C:\Modules\OpenShellSetup_4_4_189.exe" /qn ADDLOCAL=StartMenu >nul 2>&1
cls

Echo "Installing LowAudioLatency"
start /b /wait "" "C:\Modules\LowAudioLatency_2.0.0.0.msi" /passive >nul 2>&1
cls

Echo :7zipSetings"
Regedit.exe /s "C:\Windows\Modules\7ZIP.reg"
PowerRun.exe /SW:0 regedit.exe /s "C:\Windows\Modules\7ZIP.reg"
del /f /q "C:\Windows\Modules\7ZIP.reg" > NUL 2>&1
cls

Echo "Disabling Process Mitigations"
PowerShell Set-ProcessMitigation -System -Disable CFG
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "MitigationOptions" /t REG_BINARY /d "!mitigation_mask!" /f > nul 2>&1
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "MitigationAuditOptions" /t REG_BINARY /d "!mitigation_mask!" /f > nul 2>&1cls

Echo Setting "Execution Policy To Unrestricted"
powershell set-executionpolicy unrestricted -force >nul 2>&1
cls

Echo Configuring "Keyboard and Mouse Settings"
Reg.exe add "HKCU\Control Panel\Keyboard" /v "InitialKeyboardIndicators" /t REG_SZ /d "0" /f >nul 2>&1
Reg.exe add "HKCU\Control Panel\Keyboard" /v "KeyboardDelay" /t REG_SZ /d "0" /f >nul 2>&1
Reg.exe add "HKCU\Control Panel\Keyboard" /v "KeyboardSpeed" /t REG_SZ /d "31" /f >nul 2>&1
Reg.exe add "HKCU\Control Panel\Mouse" /v "MouseSpeed" /t REG_SZ /d "0" /f >nul 2>&1
Reg.exe add "HKCU\Control Panel\Mouse" /v "MouseThreshold1" /t REG_SZ /d "0" /f >nul 2>&1
Reg.exe add "HKCU\Control Panel\Mouse" /v "MouseThreshold2" /t REG_SZ /d "0" /f >nul 2>&1
Reg.exe add "HKCU\Control Panel\Mouse" /v "MouseHoverTime" /t REG_SZ /d "0" /f >nul 2>&1
cls

Echo "Editing BCDEDIT"
bcdedit /set {current} nx optin
label C: RaxOS
bcdedit /set {current} description "RaxOS"
bcdedit /set disabledynamictick yes
bcdedit /deletevalue useplatformclock
bcdedit /set isolatedcontext No
bcdedit /set bootmenupolicy legacy
bcdedit /set hypervisorlaunchtype off
bcdedit /set {globalsettings} custom:16000067 true 
bcdedit /set {globalsettings} custom:16000068 true 
bcdedit /set {globalsettings} custom:16000069 true 
bcdedit /timeout 5
cls

Echo "Disable Spectre and meltdown"
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d "1" /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d "0" /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettings" /t REG_DWORD /d "0" /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /t REG_DWORD /d "3" /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverrideMask" /t REG_DWORD /d "3" /f >nul
reg add "HKLM\SYSTEM\ControlSet001\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d "0" /f >nul
reg add "HKLM\SYSTEM\ControlSet001\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableSuperfetch" /t REG_DWORD /d "0" /f >nul
cls

Echo Disabling "Exclusive Mode On Audio Devices"
for /f "delims=" %%a in ('reg query HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\MMDevices\Audio\Capture') do PowerRun.exe /SW:0 Reg.exe add "%%a\Properties" /v "{b3f8fa53-0004-438e-9003-51a46e139bfc},3" /t REG_DWORD /d "0" /f >nul 2>&1
for /f "delims=" %%a in ('reg query HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\MMDevices\Audio\Capture') do PowerRun.exe /SW:0 Reg.exe add "%%a\Properties" /v "{b3f8fa53-0004-438e-9003-51a46e139bfc},4" /t REG_DWORD /d "0" /f >nul 2>&1
for /f "delims=" %%a in ('reg query HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\MMDevices\Audio\Render') do PowerRun.exe /SW:0 Reg.exe add "%%a\Properties" /v "{b3f8fa53-0004-438e-9003-51a46e139bfc},3" /t REG_DWORD /d "0" /f >nul 2>&1
for /f "delims=" %%a in ('reg query HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\MMDevices\Audio\Render') do PowerRun.exe /SW:0 Reg.exe add "%%a\Properties" /v "{b3f8fa53-0004-438e-9003-51a46e139bfc},4" /t REG_DWORD /d "0" /f >nul 2>&1
cls

Echo "editing POW & power tweaks"
powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
powercfg /delete 381b4222-f694-41f0-9685-ff5bb260df2e
powercfg /delete e9a42b02-d5df-448d-aa00-03f14749eb61
powercfg -changename 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c "RaxOS powerplan"
powercfg /delete a1841308-3541-4fab-bc81-f71556f20b4a
powercfg /setacvalueindex scheme_current 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0
powercfg /setacvalueindex scheme_current 7516b95f-f776-4464-8c53-06167f40cc99 3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e 0
powercfg /setacvalueindex scheme_current 2a737441-1930-4402-8d77-b2bebba308a3 d4e98f31-5ffe-4ce1-be31-1b38b384c009 0
powercfg -setacvalueindex scheme_current sub_processor THROTTLING 0
powercfg -setacvalueindex scheme_current sub_none DEVICEIDLE 0
powercfg -setacvalueindex scheme_current SUB_SLEEP AWAYMODE 0 
powercfg -setacvalueindex scheme_current SUB_SLEEP ALLOWSTANDBY 0 
powercfg -setacvalueindex scheme_current SUB_SLEEP HYBRIDSLEEP 0
powercfg -setacvalueindex scheme_current sub_processor PERFINCPOL 2
powercfg -setacvalueindex scheme_current sub_processor PERFDECPOL 1
powercfg -setacvalueindex scheme_current sub_processor PERFINCTHRESHOLD 10
powercfg -setacvalueindex scheme_current sub_processor PERFDECTHRESHOLD 8
powercfg /setactive scheme_current
powercfg -h off
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "HiberbootEnabled" /t Reg_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HibernateEnabled" /t Reg_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HibernateEnabledDefault" /t Reg_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "CoalescingTimerInterval" /t Reg_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t Reg_DWORD /d "1" /f 
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings" /v "ShowHibernateOption" /t Reg_DWORD /d "0" /f 
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings" /v "ShowLockOption" /t Reg_DWORD /d "0" /f 
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings" /v "ShowSleepOption" /t Reg_DWORD /d "0" /f
cls

Echo "Changing fsutil behaviors"
::Thanks to AMITXV
fsutil behavior set disable8dot3 1
fsutil behavior set disablelastaccess 1
fsutil behavior set DisableDeleteNotify 0
cls

Echo "Disabling powersaving features"
::Thanks to AMITXV
for %%a in (
	EnhancedPowerManagementEnabled
	AllowIdleIrpInD3
	EnableSelectiveSuspend
	DeviceSelectiveSuspended
	SelectiveSuspendEnabled
	SelectiveSuspendOn
	WaitWakeEnabled
	D3ColdSupported
	WdfDirectedPowerTransitionEnable
	EnableIdlePowerManagement
	IdleInWorkingState
) do for /f "delims=" %%b in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum" /s /f "%%a" ^| findstr "HKEY"') do Reg.exe add "%%b" /v "%%a" /t REG_DWORD /d "0" /f > NUL 2>&1
cls

Echo "Enabling MSI mode & set to undefined"
::Credits to AMITXV & Artanis
for /f %%i in ('wmic path Win32_IDEController get PNPDeviceID^| findstr /l "PCI\VEN_"') do Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t REG_DWORD /d "1" /f >nul 2>&1
for /f %%i in ('wmic path Win32_USBController get PNPDeviceID^| findstr /l "PCI\VEN_"') do Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t REG_DWORD /d "1" /f >nul 2>&1
for /f %%i in ('wmic path Win32_VideoController get PNPDeviceID^| findstr /l "PCI\VEN_"') do Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t REG_DWORD /d "1" /f >nul 2>&1
for /f %%i in ('wmic path Win32_NetworkAdapter get PNPDeviceID^| findstr /l "PCI\VEN_"') do Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t REG_DWORD /d "1" /f >nul 2>&1
for /f %%i in ('wmic path Win32_SoundDevice get PNPDeviceID^| findstr /l "PCI\VEN_"') do Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t REG_DWORD /d "0" /f >nul 2>&1
for /f "tokens=*" %%i in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\PCI"^| findstr "HKEY"') do (
			for /f "tokens=*" %%a in ('reg query "%%i"^| findstr "HKEY"') do Reg.exe delete "%%a\Device Parameters\Interrupt Management\Affinity Policy" /v "DevicePriority" /f > NUL 2>&1
		)
)
cls

Echo "Deleting Leftovers"
PowerRun.exe /SW:0 "Reg.exe" delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce" /v "POST INSTALL" /f 
PowerRun.exe /SW:0 "Reg.exe" delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" /v "Open-Shell Start Menu" /f
cls

Echo "Disable Scheduled Tasks"
schtasks /change /disable /TN "\Microsoft\Windows\AppID\EDP Policy Manager" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\AppID\PolicyConverter" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\AppID\VerifiedPublisherCertStoreCheck" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\Application Experience\PcaPatchDbTask" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\Application Experience\StartupAppTask" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\ApplicationData\appuriverifierdaily" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\ApplicationData\appuriverifierinstall" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\ApplicationData\DsSvcCleanup" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\BrokerInfrastructure\BgTaskregistrationMaintenanceTask" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\CertificateServicesClient\AikCertEnrollTask" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\CertificateServicesClient\KeyPregenTask" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\Clip\License Validation" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\Defrag\ScheduledDefrag" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\DeviceDirectoryClient\HandleCommand" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\DeviceDirectoryClient\HandleWnsCommand" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\DeviceDirectoryClient\IntegrityCheck" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\DeviceDirectoryClient\LocateCommandUserSession" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\DeviceDirectoryClient\registerDeviceAccountChange" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\DeviceDirectoryClient\registerDeviceLocationRightsChange" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\DeviceDirectoryClient\registerDevicePeriodic24" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\DeviceDirectoryClient\registerDevicePolicyChange" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\DeviceDirectoryClient\registerDeviceProtectionStateChanged" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\DeviceDirectoryClient\registerDeviceSettingChange" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\DeviceDirectoryClient\registerUserDevice" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\Diagnosis\Scheduled" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticResolver" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\DiskFootprint\Diagnostics" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\InstallService\ScanForUpdates" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\InstallService\ScanForUpdatesAsUser" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\InstallService\SmartRetry" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\Management\Provisioning\Cellular" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\MemoryDiagnostic\ProcessMemoryDiagnosticEvents" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\MemoryDiagnostic\RunFullMemoryDiagnostic" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\MUI\LPRemove" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\SoftwareProtectionPlatform\SvcRestartTaskNetwork" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\StateRepository\MaintenanceTasks" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\Subscription\EnableLicenseAcquisition" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\Subscription\LicenseAcquisition" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\Sysmain\ResPriStaticDbSync" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\Sysmain\WsSwapAssessmentTask" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\Windows Error Reporting\QueueReporting" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\Windows Filtering Platform\BfeOnServiceStartTypeChange" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\Windows Media Sharing\UpdateLibrary" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\Wininet\CacheTask" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\XblGameSave\XblGameSaveTask" >nul 2>&1
schtasks /change /disable /TN "\Microsoft\Windows\Device Setup\Metadata Refresh" >nul 2>&1
schtasks /delete /f /tn "\Microsoft\Windows\PLA\System" >nul 2>&1
schtasks /delete /f /tn "\Microsoft\Windows\PLA" >nul 2>&1
schtasks /delete /f /tn "\Microsoft\Windows\RetailDemo\CleanupOfflineContent" >nul 2>&1
schtasks /delete /f /tn "\Microsoft\Windows\RetailDemo" >nul 2>&1
schtasks /delete /f /tn "\Microsoft\Windows\SyncCenter" >nul 2>&1
schtasks /delete /f /tn "\Microsoft\Windows\TaskScheduler" >nul 2>&1
schtasks /delete /f /tn "\Microsoft\Windows\Windows Activation Technologies" >nul 2>&1
schtasks /delete /f /tn "\Microsoft\Windows\UpdateOrchestrator\Schedule Scan" >nul 2>&1
schtasks /delete /f /tn "\Microsoft\Windows\UpdateOrchestrator" >nul 2>&1
schtasks /delete /f /tn "\Microsoft\Windows\WindowsUpdate\Scheduled Start" >nul 2>&1
schtasks /delete /f /tn "\Microsoft\Windows\WindowsUpdate" >nul 2>&1
schtasks /delete /f /tn "\Microsoft\Windows\WaaSMedic" >nul 2>&1
cls

Echo "Changing Time Provider to ntp.org"
::Credits to privacy.sexy
w32tm /config /syncfromflags:manual /manualpeerlist:"0.pool.ntp.org 1.pool.ntp.org 2.pool.ntp.org 3.pool.ntp.org"
cls

Echo "Deleting Microcode updates"
takeown /f "%WinDir%\System32\mcupdate_AuthenticAMD.dll" /a  & icacls "%WinDir%\System32\mcupdate_AuthenticAMD.dll" /grant Administrators:(F) 
del "%WinDir%\System32\mcupdate_AuthenticAMD.dll" /s /f /q 
takeown /f "%WinDir%\System32\mcupdate_GenuineIntel.dll" /a  & icacls "%WinDir%\System32\mcupdate_GenuineIntel.dll" /grant Administrators:(F) 
del "%WinDir%\System32\mcupdate_GenuineIntel.dll" /s /f /q 
cls

Echo "Uninstalling Edge"
PowerShell -ExecutionPolicy Unrestricted -Command "$installer = (Get-ChildItem "^""$env:ProgramFiles*\Microsoft\Edge\Application\*\Installer\setup.exe"^""); if (!$installer) {; Write-Host 'Could not find the installer'; } else {; & $installer.FullName -Uninstall -System-Level -Verbose-Logging -Force-Uninstall; }"
cls

del /q/f/s %TEMP%\*

shutdown -r -t 0 /c "Rebooting RaxOS"
start /b "" cmd /c del "%~f0"&exit /b
Exit