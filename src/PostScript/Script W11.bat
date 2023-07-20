@Echo off 
Title RaxOS 
setlocal EnableDelayedExpansion

taskkill /f /im explorer.exe

Echo "Installing Visual C Runtimes"
start /b /wait "" "C:\Modules\VisualCAIO\install_all.bat" >nul 2>&1
cls

Echo "Installing 7zip"
start /b /wait "" "C:\Modules\7z2301-x64.msi" /passive >nul 2>&1
cls

Echo "7zip settings"
Regedit.exe /s "C:\Modules\7ZIP.reg"
PowerRun.exe /SW:0 regedit.exe /s "C:\Modules\7ZIP.reg"
cls

Echo "Installing LowAudioLatency"
start /b /wait "" "C:\Modules\LowAudioLatency_2.0.0.0.msi" /passive >nul 2>&1
cls

Echo "Disabling Process Mitigations"
:  Thanks AMIT
call C:\Modules\disable-process-mitigations.bat
powershell set-ProcessMitigation -System -Disable  DEP, EmulateAtlThunks, SEHOP, ForceRelocateImages, RequireInfo, BottomUp, HighEntropy, StrictHandle, DisableWin32kSystemCalls, AuditSystemCall, DisableExtensionPoints, BlockDynamicCode, AllowThreadsToOptOut, AuditDynamicCode, CFG, SuppressExports, StrictCFG, MicrosoftSignedOnly, AllowStoreSignedBinaries, AuditMicrosoftSigned, AuditStoreSigned, EnforceModuleDependencySigning, DisableNonSystemFonts, AuditFont, BlockRemoteImageLoads, BlockLowLabelImageLoads, PreferSystem32, AuditRemoteImageLoads, AuditLowLabelImageLoads, AuditPreferSystem32
cls

echo "Disabling NetBios"
Reg.exe add "HKLM\SOFTWARE\Microsoft\Internet Explorer\Main" /v "Autorun" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoAutorun" /t REG_DWORD /d "1" /f >nul 2>&1 
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoAutoplayfornonVolume" /t REG_DWORD /d "1" /f >nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoDriveTypeAutoRun" /t REG_DWORD /d "255" /f >nul 2>&1 
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "DontSetAutoplayCheckbox" /t REG_DWORD /d "1" /f >nul 2>&1 
cls

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
Reg.exe add "HKCU\Control Panel\Desktop" /v "UserPreferencesMask" /t REG_BINARY /d "9012038010000000" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAnimations" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\DWM" /v "Blur" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\DWM" /v "Animations" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DWM" /v "DWMA_TRANSITTIONS_FORCEDISABLED" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DWM" /v "DisallowAnimations" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DWM" /v "AnimationAttributionEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "UseOLEDTaskbarTransparency" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /t REG_SZ /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewAlphaSelect" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "IconsOnly" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\DWM" /v "EnableAeroPeek" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "DragFullWindows" /t REG_SZ /d "0" /f
Reg.exe add "HKCU\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /t REG_SZ /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "SystemUsesLightTheme" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AppsUseLightTheme" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Hidden" /t REG_DWORD /d "1" /f
cls

Echo "Disable Meltdown"
; credits privacy.sexy
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverrideMask" /t REG_DWORD /d 3 /f
wmic cpu get name | findstr "Intel" >nul && (
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /t REG_DWORD /d 0 /f
)
wmic cpu get name | findstr "AMD" >nul && (
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /t REG_DWORD /d 64 /f
)
cls

Echo "Editing Bcdedit"
bcdedit /set {current} nx optin
label C: RaxOS
bcdedit /set {current} description "RaxOS W11"
bcdedit /set disabledynamictick yes
bcdedit /set useplatformtick yes
bcdedit /set tpmbootentropy ForceDisable
bcdedit /deletevalue useplatformclock
bcdedit /set bootux disabled
bcdedit /set bootmenupolicy legacy
bcdedit /set hypervisorlaunchtype off
bcdedit /set quietboot yes
bcdedit /set allowedinmemorysettings 0x0
bcdedit /set isolatedcontext No
bcdedit /set {globalsettings} custom:16000067 true
bcdedit /set {globalsettings} custom:16000068 true
bcdedit /set {globalsettings} custom:16000069 true
bcdedit /set {current} recoveryenabled no
bcdedit /timeout 10
cls

Echo "Disabling network adapters"
powershell -NoProfile -Command "Disable-NetAdapterBinding -Name "*" -ComponentID ms_tcpip6, ms_msclient, ms_server, ms_rspndr, ms_lltdio, ms_implat, ms_lldp" >nul 2>&1
cls

Echo "Disabling "Exclusive Mode On Audio Devices"
for /f "delims=" %%a in ('reg query HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\MMDevices\Audio\Capture') do PowerRun.exe /SW:0 Reg.exe add "%%a\Properties" /v "{b3f8fa53-0004-438e-9003-51a46e139bfc},3" /t REG_DWORD /d "0" /f >nul 2>&1
for /f "delims=" %%a in ('reg query HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\MMDevices\Audio\Capture') do PowerRun.exe /SW:0 Reg.exe add "%%a\Properties" /v "{b3f8fa53-0004-438e-9003-51a46e139bfc},4" /t REG_DWORD /d "0" /f >nul 2>&1
for /f "delims=" %%a in ('reg query HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\MMDevices\Audio\Render') do PowerRun.exe /SW:0 Reg.exe add "%%a\Properties" /v "{b3f8fa53-0004-438e-9003-51a46e139bfc},3" /t REG_DWORD /d "0" /f >nul 2>&1
for /f "delims=" %%a in ('reg query HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\MMDevices\Audio\Render') do PowerRun.exe /SW:0 Reg.exe add "%%a\Properties" /v "{b3f8fa53-0004-438e-9003-51a46e139bfc},4" /t REG_DWORD /d "0" /f >nul 2>&1
cls

Eccho "Reset Firewall Rules"
reg delete "HKLM\System\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\FirewallRules" /f && reg add "HKLM\System\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\FirewallRules" /f
cls

Echo "editing POW & power tweaks"
powercfg -import "C:\Modules\RaxOS 2.0.1 PowerPlan" 00000000-0000-0000-0000-000000000000
powercfg /setactive 00000000-0000-0000-0000-000000000000
powercfg -h off
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "HiberbootEnabled" /t Reg_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HibernateEnabled" /t Reg_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HibernateEnabledDefault" /t Reg_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "CoalescingTimerInterval" /t Reg_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t Reg_DWORD /d "1" /f 
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings" /v "ShowHibernateOption" /t Reg_DWORD /d "0" /f 
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings" /v "ShowLockOption" /t Reg_DWORD /d "0" /f 
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings" /v "ShowSleepOption" /t Reg_DWORD /d "0" /f
wevtutil set-log "Microsoft-Windows-SleepStudy/Diagnostic" /e:false
wevtutil set-log "Microsoft-Windows-Kernel-Processor-Power/Diagnostic" /e:false
wevtutil set-log "Microsoft-Windows-UserModePowerService/Diagnostic" /e:false
cls

echo "Setting legacy photo viewer as default"
:: Credits to Zusier
for %%a in (tif tiff bmp dib gif jfif jpe jpeg jpg jxr png) do (
    %currentuser% reg add "HKCU\SOFTWARE\Classes\.%%~a" /ve /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
)
cls

Echo "Disabling Device Manager Devices"
devmanview /disable "Microsoft GS Wavetable Synth" > NUL 2>&1
devmanview /disable "Microsoft Device Association Root Enumerator" > NUL 2>&1
devmanview /disable "High precision event timer" > NUL 2>&1
devmanview /disable "System Speaker" > NUL 2>&1
devmanview /disable "Microsoft Radio Device Enumeration Bus" > NUL 2>&1
devmanview /disable "System Timer" > NUL 2>&1
devmanview /disable "WAN Miniport (IKEv2)" > NUL 2>&1
devmanview /disable "WAN Miniport (IP)" > NUL 2>&1
devmanview /disable "WAN Miniport (IPv6)" > NUL 2>&1
devmanview /disable "WAN Miniport (L2TP)" > NUL 2>&1
devmanview /disable "WAN Miniport (Network Monitor)" > NUL 2>&1
devmanview /disable "WAN Miniport (PPPOE)" > NUL 2>&1
devmanview /disable "WAN Miniport (PPTP)" > NUL 2>&1
devmanview /disable "WAN Miniport (SSTP)" > NUL 2>&1
devmanview /disable "Programmable Interrupt Controller" > NUL 2>&1
devmanview /disable "Numeric Data Processor" > NUL 2>&1
devmanview /disable "Communications Port (COM1)" > NUL 2>&1
cls

Echo "Changing fsutil behaviors"
:: Thanks to AMITXV
fsutil behavior set allowextchar 0 > NUL 2>&1
fsutil behavior set Bugcheckoncorrupt 0 > NUL 2>&1
fsutil repair set C: 0 > NUL 2>&1
fsutil behavior set disable8dot3 1 > NUL 2>&1
fsutil behavior set disablecompression 1 > NUL 2>&1
fsutil behavior set disableencryption 1 > NUL 2>&1
fsutil behavior set disablelastaccess 1 > NUL 2>&1
fsutil behavior set disablespotcorruptionhandling 1 > NUL 2>&1
fsutil behavior set encryptpagingfile 0 > NUL 2>&1
fsutil behavior set quotanotify 86400 > NUL 2>&1
fsutil behavior set symlinkevaluation L2L:1 > NUL 2>&1
fsutil behavior set disabledeletenotify 0 > NUL 2>&1
cls

@echo off
echo Disabling USB Idle
for %%a in (
	EnhancedPowerManagementEnabled
	AllowIdleIrpInD3
	EnableSelectiveSuspend
	DeviceSelectiveSuspended
	SelectiveSuspendEnabled
	SelectiveSuspendOn
	EnumerationRetryCount
	ExtPropDescSemaphore
	WaitWakeEnabled
	D3ColdSupported
	WdfDirectedPowerTransitionEnable
	EnableIdlePowerManagement
	IdleInWorkingState
	IoLatencyCap
	DmaRemappingCompatible
	DmaRemappingCompatibleSelfhost
) do for /f "delims=" %%b in ('reg query "HKLM\SYSTEM\CurrentControlSet\Enum" /s /f "%%a" ^| findstr "HKEY"') do reg add "%%b" /v "%%a" /t REG_DWORD /d "0" /f >NUL 2>&1
powershell.exe C:\Modules\!disable-pnp-powersaving.ps1
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


Echo "Remove Share with/Give Access To from context menu"
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{f81e9010-6ea4-11ce-a7ff-00aa003ca9f6}" /t REG_SZ /d "" /f > nul
reg add "HKLM\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{f81e9010-6ea4-11ce-a7ff-00aa003ca9f6}" /t REG_SZ /d "" /f > nul
cls

Echo "Remove Share from context menu"
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{e2bf9676-5f8f-435c-97eb-11607a5bedf7}" /t REG_SZ /d "" /f > nul
reg add "HKLM\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{e2bf9676-5f8f-435c-97eb-11607a5bedf7}" /t REG_SZ /d "" /f > nul
cls

Echo "Disabling Nagles Algorithm"
for /f %%i in ('wmic path win32_networkadapter get GUID ^| findstr "{"') do (
	Reg.exe add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%i" /v "TcpAckFrequency" /t REG_DWORD /d "1" /f > NUL 2>&1
	Reg.exe add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%i" /v "TcpDelAckTicks" /t REG_DWORD /d "0" /f > NUL 2>&1
	Reg.exe add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%i" /v "TCPNoDelay" /t REG_DWORD /d "1" /f > NUL 2>&1
)
cls

Echo "Remove Restore Previous Versions from context menu"
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{596AB062-B4D2-4215-9F74-E9109B0A8153}" /t REG_SZ /d "" /f > nul
reg add "HKLM\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{596AB062-B4D2-4215-9F74-E9109B0A8153}" /t REG_SZ /d "" /f > nul
cls

Echo Disabling DMA Remapping...
for %%a in (DmaRemappingCompatible) do for /f "delims=" %%b in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services" /s /f "%%a" ^| findstr "HKEY"') do Reg.exe add "%%b" /v "%%a" /t REG_DWORD /d "0" /f >nul 2>&1
cls

Echo Disabling HIPM, DIPM and HDDParking...
for %%a in (EnableHIPM EnableDIPM EnableHDDParking) do for /f "delims=" %%b in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services" /s /f "%%a" ^| findstr "HKEY"') do Reg.exe add "%%b" /v "%%a" /t REG_DWORD /d "0" /f >nul 2>&1
cls

Echo Disabling StorPort Idle...
for /f "tokens=*" %%s in ('reg query "HKLM\SYSTEM\CurrentControlSet\Enum" /s /f "StorPort" ^| findstr /e "StorPort"') do Reg.exe add "%%s" /v "EnableIdlePowerManagement" /t REG_DWORD /d "0" /f >nul 2>&1
cls

Echo "Remove Troubleshoot Compability from context menu"
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{1d27f844-3a1f-4410-85ac-14651078412d}" /t REG_SZ /d "" /f > nul
reg add "HKLM\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{1d27f844-3a1f-4410-85ac-14651078412d}" /t REG_SZ /d "" /f > nul
cls

Echo "Disable Background apps"
Reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "GlobalUserDisabled" /t Reg_DWORD /d "1" /f >nul 2>&1
Reg add "HKLM\Software\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsRunInBackground" /t Reg_DWORD /d "2" /f >nul 2>&1
Reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "BackgroundAppGlobalToggle" /t Reg_DWORD /d "0" /f >nul 2>&1
cls

Echo "Disabling xbox stuff and Enabling FSE"
Reg.exe add "HKCU\Software\Microsoft\GameBar" /v "ShowStartupPanel" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\GameBar" /v "GamePanelStartupTipIndex" /t REG_DWORD /d "3" /f
Reg.exe add "HKCU\Software\Microsoft\GameBar" /v "AllowAutoGameMode" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\GameBar" /v "AutoGameModeEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\GameBar" /v "UseNexusForGameBarEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehaviorMode" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehavior" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\System\GameConfigStore" /v "GameDVR_DXGIHonorFSEWindowsCompatible" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\System\GameConfigStore" /v "GameDVR_EFSEFeatureFlags" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\System\GameConfigStore" /v "GameDVR_DSEBehavior" /t REG_DWORD /d "2" /f
Reg.exe add "HKCU\System\GameConfigStore" /v "UserPreferencesMask" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\System\GameConfigStore" /v "UserPreferencesMask" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v "AllowGameDVR" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Serialize" /v "StartupDelayInMSec" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\ApplicationManagement\AllowGameDVR" /v "value" /t REG_DWORD /d "0" /f
cls

Echo "RW Fix for w11"
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\CI\Config" /v "VulnerableDriverBlocklistEnable" /t REG_DWORD /d "0" /f >NUL 2>&1
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
for %%z in (
	AppVClient
	DiagTrack
	DialogBlockingService
	Diagsvc
	diagnosticshub.standardcollector.service
	DPS
	DsSvc
	DusmSvc
	FontCache
	FontCache3.0.0.0
	MsKeyboardFilter
	NetMsmqActivator
	PcaSvc
	SEMgrSvc
	ShellHWDetection
	shpamsvc
	SysMain
	Themes
	TrkWks
	tzautoupdate
	uhssvc
	W3SVC
	OneSyncSvc
	WdiSystemHost
	WdiServiceHost
	SCardSvr
	ScDeviceEnum
	SCPolicySvc
	SensorDataService
	SensrSvc
	Beep
	cdfs
	cdrom
        acpiex
        acpipagr
        acpipmi
        acpitime
        GPIOCLx0101
        iaLPSS2i_GPI02
        ioLPSS2i_I2C
        iaLPSSi_GPIO
        iaLPSSi_I2C
        msgpiowin32
	cnghwassist
	GpuEnergyDrv
	Telemetry
	VerifierExt
	udfs
	MMCSS
	MsLldp
	lltdio
	NdisVirtualBus
	NDU
	rdbss
        luafv
        fvevol
        CDPUserSvc
        UsoSvc
        cbdhsvc
        BcastDVRUserService
	rdyboost
        rdpbus
        umbus
        vdrvroot
        Vid
        CompositeBus
	rspndr
	NdisCap
	NetBIOS
	NetBT
	KSecPkg
	spaceport
	storqosflt
	bam
	bowser
	CldFlt
	DispBrokerDesktopSvc
	iphlpsvc
	LanmanServer
	lmhosts
	RmSvc
	RFCOMM
	BthEnum
	bthleenum
	BTHMODEM
	BthA2dp
	microsoft_bluetooth_avrcptransport
	BthHFEnum
	BTAGService
	bthserv
	BluetoothUserService
	BthAvctpSvc
	vmickvpexchange
	vmicguestinterface
	vmicshutdown
	vmicheartbeat
	vmicvmsession
	vmicrdv
	vmictimesync
	vmicvss
	hyperkbd
	hypervideo
	gencounter
	vmgid
	storflt
	bttflt
	vpci
	hvservice
	hvcrash
	HvHost
	lfsvc
) do (
PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\%%z" /v "Start" /t REG_DWORD /d "4" /f
)
cls


Echo "Cleanup"
PowerRun.exe /SW:0 "Reg.exe" delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce" /v "POST INSTALL" /f 
takeown /f "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup" /a >nul 2>&1 & icacls "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup" /grant Administrators:F >nul 2>&1
xcopy "%WinDir%\Modules\cleanup.bat" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup" /i >nul 2>&1
cls

shutdown -r -t 0
Exit
