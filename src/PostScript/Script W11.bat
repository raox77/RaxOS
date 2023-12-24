@Echo off 
Title RaxOS 
setlocal EnableDelayedExpansion

Echo "Installing Visual C Runtimes"
start /b /wait "" "C:\Modules\VisualCAIO\install_all.bat" >nul 2>&1
cls

Echo "Installing 7zip"
start /b /wait "" "C:\Modules\7z2301-x64.msi" /passive >nul 2>&1
cls

Echo "7zip settings"
Regedit /s "C:\Modules\7-zip_Alternate_Context_Menu.reg" >nul 2>&1
cls

Echo "Installing OpenShell"
start /b /wait "" "C:\Modules\OpenShellSetup_4_4_191.exe" /qn ADDLOCAL=StartMenu >nul 2>&1
cls

Echo "Disabling Process Mitigations"
call C:\Modules\disable-process-mitigations.bat >nul 2>&1
cls

Echo "Execution Policy To Unrestricted"
powershell set-executionpolicy unrestricted -force >nul 2>&1
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
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAnimations" /t REG_DWORD /d "0" /f > NUL 2>&1
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /t REG_DWORD /d "2" /f > NUL 2>&1
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\DWM" /v "Blur" /t REG_DWORD /d "0" /f > NUL 2>&1
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\DWM" /v "Animations" /t REG_DWORD /d "0" /f > NUL 2>&1
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DWM" /v "DWMA_TRANSITTIONS_FORCEDISABLED" /t REG_DWORD /d "1" /f > NUL 2>&1
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DWM" /v "DisallowAnimations" /t REG_DWORD /d "1" /f > NUL 2>&1
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DWM" /v "AnimationAttributionEnabled" /t REG_DWORD /d "0" /f > NUL 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "UseOLEDTaskbarTransparency" /t REG_DWORD /d "0" /f > NUL 2>&1
Reg.exe add "HKCU\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /t REG_DWORD /d "0" /f > NUL 2>&1
Reg.exe add "HKCU\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /t REG_SZ /d "0" /f > NUL 2>&1
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewAlphaSelect" /t REG_DWORD /d "0" /f > NUL 2>&1
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "IconsOnly" /t REG_DWORD /d "1" /f > NUL 2>&1
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\DWM" /v "EnableAeroPeek" /t REG_DWORD /d "0" /f > NUL 2>&1
Reg.exe add "HKCU\Control Panel\Desktop" /v "DragFullWindows" /t REG_SZ /d "0" /f > NUL 2>&1
Reg.exe add "HKCU\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /t REG_SZ /d "0" /f > NUL 2>&1
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "SystemUsesLightTheme" /t REG_DWORD /d "0" /f > NUL 2>&1
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AppsUseLightTheme" /t REG_DWORD /d "0" /f > NUL 2>&1
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Hidden" /t REG_DWORD /d "1" /f > NUL 2>&1
cls

Echo "Editing Bcdedit"
bcdedit /set {current} nx optin
label C: RaxOS
bcdedit /set {current} description "RaxOS W11"
bcdedit /set disabledynamictick yes
bcdedit /set useplatformtick yes
bcdedit /deletevalue useplatformclock
bcdedit /set bootux disabled
bcdedit /set bootmenupolicy legacy
bcdedit /set hypervisorlaunchtype off
bcdedit /set quietboot yes
bcdedit /set debug No
bcdedit /set ems No
bcdedit /set vm No
bcdedit /set {globalsettings} custom:16000067 true
bcdedit /set {globalsettings} custom:16000068 true
bcdedit /set {globalsettings} custom:16000069 true
bcdedit /set {current} recoveryenabled no
bcdedit /timeout 10
cls

Echo "Disabling network adapters"
powershell -NoProfile -Command "Disable-NetAdapterBinding -Name "*" -ComponentID ms_tcpip6, ms_msclient, ms_server, ms_rspndr, ms_lltdio, ms_implat, ms_lldp" >nul 2>&1
cls

Echo "Disabling NetBIOS over TCP/IP"
for /f "delims=" %%u in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services\NetBT\Parameters\Interfaces" /s /f "NetbiosOptions" ^| findstr "HKEY"') do (
    reg add "%%u" /v "NetbiosOptions" /t REG_DWORD /d "2" /f
)
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

Echo "Reset Firewall Rules"
reg delete "HKLM\System\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\FirewallRules" /f && reg add "HKLM\System\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\FirewallRules" /f >nul 2>&1
cls

Echo "Editing POW & power tweaks"
powercfg -import "C:\Modules\RaxOS.pow" 00000000-0000-0000-0000-000000000000
powercfg /setactive 00000000-0000-0000-0000-000000000000
powercfg -h off
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "HiberbootEnabled" /t Reg_DWORD /d "0" /f  >nul 2>&1
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d "1" /f
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
cls

Echo "Optimizing Scheduled Tasks"
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\.NET Framework\.NET Framework NGEN v4.0.30319 64 Critical" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\.NET Framework\.NET Framework NGEN v4.0.30319 64" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\.NET Framework\.NET Framework NGEN v4.0.30319 Critical" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\.NET Framework\.NET Framework NGEN v4.0.30319" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\CertificateServicesClient\AikCertEnrollTask" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\CertificateServicesClient\KeyPreGenTask" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\Clip\License Validation" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\Defrag\ScheduledDefrag" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\Device Setup\Metadata Refresh" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\Diagnosis\RecommendedTroubleshootingScanner" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\Diagnosis\Scheduled" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticResolver" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\DiskFootprint\Diagnostics" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\InstallService\ScanForUpdates" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\InstallService\ScanForUpdatesAsUser" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\InstallService\SmartRetry" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\Registry\RegIdleBackup" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\Security\Pwdless\IntelligentPwdlessTask" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\SoftwareProtectionPlatform\SvcRestartTaskNetwork" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\StateRepository\MaintenanceTasks" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\Subscription\EnableLicenseAcquisition" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\Subscription\LicenseAcquisition" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\Sysmain\ResPriStaticDbSync" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\Sysmain\WsSwapAssessmentTask" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\SystemRestore\SR" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\WDI\ResolutionHost" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\Windows Error Reporting\QueueReporting" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\Windows Filtering Platform\BfeOnServiceStartTypeChange" >nul 2>&1
powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\Wininet\CacheTask" >nul 2>&1
powerrun "schtasks.exe" /delete /f /tn "\Microsoft\Windows\TaskScheduler" >nul 2>&1
powerrun "schtasks.exe" /delete /f /tn "\Microsoft\Windows\WaaSMedic" >nul 2>&1
powerrun "schtasks.exe" /delete /f /tn "\Microsoft\Windows\WindowsUpdate" >nul 2>&1
powerrun "schtasks.exe" /delete /f /tn "\Microsoft\Windows\WindowsUpdate\Scheduled Start" >nul 2>&1
powerrun "schtasks.exe" /delete /f /tn "\Microsoft\Windows\UpdateOrchestrator\Schedule Scan" >nul 2>&1
powerrun "schtasks.exe" /delete /f /tn "\Microsoft\Windows\UpdateOrchestrator\Schedule Scan Static Task" >nul 2>&1
powerrun "schtasks.exe" /delete /f /tn "\Microsoft\Windows\UpdateOrchestrator\Schedule Wake To Work" >nul 2>&1
powerrun "schtasks.exe" /delete /f /tn "\Microsoft\Windows\UpdateOrchestrator\Start Oobe Expedite Work" >nul 2>&1
cls

Echo "Changing fsutil behaviors"
fsutil behavior set disable8dot3 1 > NUL 2>&1
fsutil behavior set disablelastaccess 1 > NUL 2>&1
cls

Echo "Disabling DMA Remapping"
for %%a in (DmaRemappingCompatible) do for /f "delims=" %%b in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services" /s /f "%%a" ^| findstr "HKEY"') do Reg.exe add "%%b" /v "%%a" /t REG_DWORD /d "0" /f >nul 2>&1
cls

Echo "Disable Driver PowerSaving"
%SYSTEMROOT%\System32\WindowsPowerShell\v1.0\powershell.exe -Command "Get-WmiObject MSPower_DeviceEnable -Namespace root\wmi | ForEach-Object { $_.enable = $false; $_.psbase.put(); }"
cls

Echo "Set svchost to ffffffff works best for all RAM size"
Reg add HKLM\SYSTEM\CurrentControlSet\Control /t REG_DWORD /v SvcHostSplitThresholdInKB /d 0xffffffff /f >nul 2>&1
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

Echo "RW Fix for w11"
Reg add "HKLM\SYSTEM\CurrentControlSet\Control\CI\Config" /v "VulnerableDriverBlocklistEnable" /t REG_DWORD /d "0" /f >NUL 2>&1
cls

Echo "Change NTP server to pool.ntp.org"
w32tm /config /syncfromflags:manual /manualpeerlist:"0.pool.ntp.org 1.pool.ntp.org 2.pool.ntp.org 3.pool.ntp.org" >nul 2>&1
cls

Echo"Removing Quick access"
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "HubMode" /t REG_DWORD /d "1" /f
PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Classes\CLSID\{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}\ShellFolder" /v "Attributes" /t REG_DWORD /d "2962489444" /f
PowerRun.exe /SW:0 Reg.exe add "HKCR\CLSID\{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}\ShellFolder" /v "Attributes" /t REG_DWORD /d "2962489444" /f
cls

Echo "Set Sound Scheme to no sound"
powershell C:\Modules\sound.ps1  >nul 2>&1

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
	AppVClient
	AJRouter
	AppIDSvc
        DusmSvc
        autotimesvc
        SharedAccess
        W32Time
        icssvc
        WaaSMedicSvc
        MSiSCSI
        defragsvc
        AxInstSV
        DsSvc
	FontCache
	FontCache3.0.0.0
        IKEEXT
	PcaSvc
	ShellHWDetection
	SysMain
	Themes
	TrkWks
	tzautoupdate
	OneSyncSvc
	SensorDataService
	SensrSvc
        SensorService
	Beep
	cdrom
        acpiex
        acpipagr
        acpipmi
        acpitime
	cnghwassist
	VerifierExt
	udfs
        MixedRealityOpenXRSvc
        SharedRealitySvc
        VacSvc
        spectrum
        perceptionsimulation
        svsvc
        ALG
	NdisVirtualBus
        TieringEngineService
        WebClient
        WSearch
        luafv
        UsoSvc
        cbdhsvc
        WinRM
        WPDBusEnum
        cloudidsvc
        BcastDVRUserService
	rdyboost
        rdpbus
        umbus
        vdrvroot
        Vid
        CompositeBus
	NetBIOS
	NetBT
	spaceport
        VaultSvc
        EventSystem
	storqosflt
	bam
        dam
	wdiservicehost
	wdisystemhost
        troubleshootingsvc
	spooler
	stisvc
	printworkflowusersvc
        SEMgrSvc
        RasAuto
        PhoneSvc
        TapiSrv
        diagsvc
        DPS
        diagnosticshub.standardcollector.service
        Wecsvc
        dmwappushservice
        WMPNetworkSvc
        TermService
        UmRdpService
        3ware
        arcsas
        buttonconverter
        VSS
        cdfs
        circlass
        Dfsc
        ErrDev
        QWAVEdrv
        tcpipreg
        SstpSvc
        SSDPSRV
        SmsRouter
	CldFlt
	iphlpsvc
        IpxlatCfgSvc
        P9RdrService
        PNRPsvc
        PNRPAutoReg
        p2psvc
        p2pimsvc
        wlpasvc
        NetTcpPortSharing
	lmhosts
        EntAppSvc
        EapHost
        QWAVE
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
        vpci
        TsUsbFlt
        tsusbhub
        storflt
        RDPDR
        RdpVideominiport
        bttflt
        HidBth
        BthMini
        BTHPORT
        BTHUSB
	vmicrdv
	vmictimesync
	vmicvss
	hyperkbd
	hypervideo
	gencounter
	vmgid
	hvservice
	hvcrash
	HvHost
        XboxNetApiSvc
        XblGameSave
        XblAuthManager
        XboxGipSvc
) do (
PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\%%z" /v "Start" /t REG_DWORD /d "4" /f
)
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
