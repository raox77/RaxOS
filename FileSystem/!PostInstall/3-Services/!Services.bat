@echo off
:menu
cls
echo ---------- Configuring Services ----------
echo 1. Wi-Fi
echo 2. Bluetooth
echo 3. Hyper-V, Remote Desktop
echo 4. Microsoft Store
echo 5. Clipboard
echo 6. Printing
echo 7. Windows Defender
echo 0. Exit
echo -----------------------------------------
echo.

set /p option=Choose an option: 

if %option%==1 (
    call :wifi_menu
) else if %option%==2 (
    call :bluetooth_menu
) else if %option%==3 (
    call :hyperv_menu
) else if %option%==4 (
    call :store_menu
) else if %option%==5 (
    call :clipboard_menu
) else if %option%==6 (
    call :printing_menu
) else if %option%==7 (
    call :defender_menu
) else if %option%==0 (
    exit
) else (
    echo Invalid option!
    timeout 2 > nul
    goto :menu
)

:wifi_menu
cls
echo ---------- Wi-Fi Services ----------
echo 1. Enable
echo 2. Disable
echo 3. Back to main menu
echo ------------------------------------

set /p wifi_option=Choose an option: 

if %wifi_option%==1 (
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WlanSvc" /v "Start" /t REG_DWORD /d "2" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\EventLog" /v "Start" /t REG_DWORD /d "2" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Wcmsvc" /v "Start" /t REG_DWORD /d "2" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\vwififlt" /v "Start" /t REG_DWORD /d "2" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Netman" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\nsi" /v "Start" /t REG_DWORD /d "2" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NlaSvc" /v "Start" /t REG_DWORD /d "2" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Dhcp" /v "Start" /t REG_DWORD /d "2" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\netprofm" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NetSetupSvc" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\tdx" /v "Start" /t REG_DWORD /d "1" /f   
    cls
    echo Wi-Fi has been Enabled
    timeout 2 > nul
    goto :menu
) else if %wifi_option%==2 (
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WlanSvc" /v "Start" /t REG_DWORD /d "4" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\vwififlt" /v "Start" /t REG_DWORD /d "4" /f
    cls
    echo Wi-Fi has been Disabled
    timeout 2 > nul
    goto :menu
) else if %wifi_option%==3 (
    goto :menu
) else (
    echo Invalid option!
    timeout 2 > nul
    goto :wifi_menu
)

:bluetooth_menu
cls
echo ---------- Bluetooth Services ----------
echo 1. Enable
echo 2. Disable
echo 3. Back to main menu
echo ------------------------------------

set /p bluetooth_option=Choose an option: 

if %bluetooth_option%==1 (
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BthA2dp" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BthEnum" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BthHFEnum" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BthLEEnum" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BTHMODEM" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Microsoft_Bluetooth_AvrcpTransport" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BluetoothUserService" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BthAvctpSvc" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\RFCOMM" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\bthserv" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BTAGService" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BTHUSB" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BTHPORT" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BthMini" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\HidBth" /v "Start" /t REG_DWORD /d "3" /f
    devmanview /enable "Microsoft Radio Device Enumeration Bus" > NUL 2>&1
    cls
    echo Bluetooth has been Enabled
    timeout 2 > nul
    goto :menu
) else if %bluetooth_option%==2 (
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BthA2dp" /v "Start" /t REG_DWORD /d "4" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BthEnum" /v "Start" /t REG_DWORD /d "4" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BthHFEnum" /v "Start" /t REG_DWORD /d "4" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BthLEEnum" /v "Start" /t REG_DWORD /d "4" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BTHMODEM" /v "Start" /t REG_DWORD /d "4" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Microsoft_Bluetooth_AvrcpTransport" /v "Start" /t REG_DWORD /d "4" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BluetoothUserService" /v "Start" /t REG_DWORD /d "4" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BthAvctpSvc" /v "Start" /t REG_DWORD /d "4" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\RFCOMM" /v "Start" /t REG_DWORD /d "4" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\bthserv" /v "Start" /t REG_DWORD /d "4" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BTAGService" /v "Start" /t REG_DWORD /d "4" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BTHUSB" /v "Start" /t REG_DWORD /d "4" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BTHPORT" /v "Start" /t REG_DWORD /d "4" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BthMini" /v "Start" /t REG_DWORD /d "4" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\HidBth" /v "Start" /t REG_DWORD /d "4" /f
    devmanview /disable "Microsoft Radio Device Enumeration Bus" > NUL 2>&1
    cls
    echo Bluetooth has been Disabled
    timeout 2 > nul
    goto :menu
) else if %bluetooth_option%==3 (
    goto :menu
) else (
    echo Invalid option!
    timeout 2 > nul
    goto :bluetooth_menu
)

:hyperv_menu
cls
echo ---------- Hyper-V, Remote Desktop Services ----------
echo 1. Enable
echo 2. Disable
echo 3. Back to main menu
echo ------------------------------------

set /p hyperv_option=Choose an option: 

if %hyperv_option%==1 (
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\vmickvpexchange" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\vmicguestinterface" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\vmicshutdown" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\vmicheartbeat" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\vmicvmsession" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\vmicrdv" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\vmictimesync" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\vmicvss" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\hyperkbd" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\RasMan" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SessionEnv" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TermService" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\hypervideo" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\gencounter" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\vmgid" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\storflt" /v "Start" /t REG_DWORD /d "0" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\bttflt" /v "Start" /t REG_DWORD /d "0" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\vpci" /v "Start" /t REG_DWORD /d "0" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\hvservice" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\hvcrash" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\HvHost" /v "Start" /t REG_DWORD /d "1" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\rdpbus" /v "Start" /t REG_DWORD /d "2" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Vid" /v "Start" /t REG_DWORD /d "2" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TsUsbFlt" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\tsusbhub" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\RDPDR" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\RdpVideominiport" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TsUsbFlt" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\terminpt" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TsUsbGD" /v "Start" /t REG_DWORD /d "3" /f 
    bcdedit /set hypervisorlaunchtype auto
    dism.exe /Online /Enable-Feature:Microsoft-Hyper-V /All /NoRestart
    cls
    echo Hyper-V, Remote Desktop has been Enabled
    timeout 2 > nul
    goto :menu
) else if %hyperv_option%==2 (
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\vmickvpexchange" /v "Start" /t REG_DWORD /d "4" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\vmicguestinterface" /v "Start" /t REG_DWORD /d "4" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\vmicshutdown" /v "Start" /t REG_DWORD /d "4" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\vmicheartbeat" /v "Start" /t REG_DWORD /d "4" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\vmicvmsession" /v "Start" /t REG_DWORD /d "4" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\vmicrdv" /v "Start" /t REG_DWORD /d "4" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\vmictimesync" /v "Start" /t REG_DWORD /d "4" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\vmicvss" /v "Start" /t REG_DWORD /d "4" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\hyperkbd" /v "Start" /t REG_DWORD /d "4" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\RasMan" /v "Start" /t REG_DWORD /d "4" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SessionEnv" /v "Start" /t REG_DWORD /d "4" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TermService" /v "Start" /t REG_DWORD /d "4" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\hypervideo" /v "Start" /t REG_DWORD /d "4" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\gencounter" /v "Start" /t REG_DWORD /d "4" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\vmgid" /v "Start" /t REG_DWORD /d "4" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\storflt" /v "Start" /t REG_DWORD /d "4" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\bttflt" /v "Start" /t REG_DWORD /d "4" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\vpci" /v "Start" /t REG_DWORD /d "4" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\hvservice" /v "Start" /t REG_DWORD /d "4" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\hvcrash" /v "Start" /t REG_DWORD /d "4" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\HvHost" /v "Start" /t REG_DWORD /d "4" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\rdpbus" /v "Start" /t REG_DWORD /d "4" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Vid" /v "Start" /t REG_DWORD /d "4" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TsUsbFlt" /v "Start" /t REG_DWORD /d "4" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\tsusbhub" /v "Start" /t REG_DWORD /d "4" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\RDPDR" /v "Start" /t REG_DWORD /d "4" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\RdpVideominiport" /v "Start" /t REG_DWORD /d "4" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TsUsbFlt" /v "Start" /t REG_DWORD /d "4" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\terminpt" /v "Start" /t REG_DWORD /d "4" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TsUsbGD" /v "Start" /t REG_DWORD /d "4" /f 
    dism.exe /Online /Disable-Feature:Microsoft-Hyper-V-All /NoRestart
    bcdedit /set hypervisorlaunchtype off
    cls
    echo Hyper-V, Remote Desktop has been Disabled
    timeout 2 > nul
    goto :menu
) else if %hyperv_option%==3 (
    goto :menu
) else (
    echo Invalid option!
    timeout 2 > nul
    goto :hyperv_menu
)

:store_menu
cls
echo ---------- Microsoft Store Services ----------
echo 1. Enable
echo 2. Disable
echo 3. Back to main menu
echo ------------------------------------

set /p store_option=Choose an option: 

if %store_option%==1 (
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\InstallService" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wlidsvc" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AppXSvc" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TokenBroker" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LicenseManager" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\FileInfo" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DoSvc" /v "Start" /t REG_DWORD /d "2" /f /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wuauserv" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BFE" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ClipSVC" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\StorSvc" /v "Start" /t REG_DWORD /d "2" /f
    PowerShell -ExecutionPolicy Unrestricted -Command "$package = Get-AppxPackage -AllUsers 'Microsoft.WindowsStore'; if (!$package) {; Write-Error "^""Cannot reinstall 'Microsoft.WindowsStore'"^"" -ErrorAction Stop; }; $manifest = $package.InstallLocation + '\AppxManifest.xml'; Add-AppxPackage -DisableDevelopmentMode -Register "^""$manifest"^"""
    cls
    echo Microsoft Store has been Enabled
    timeout 2 > nul
    goto :menu
) else if %store_option%==2 (
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\InstallService" /v "Start" /t REG_DWORD /d "4" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wlidsvc" /v "Start" /t REG_DWORD /d "4" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TokenBroker" /v "Start" /t REG_DWORD /d "4" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LicenseManager" /v "Start" /t REG_DWORD /d "4" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\FileInfo" /v "Start" /t REG_DWORD /d "4" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wuauserv" /v "Start" /t REG_DWORD /d "4" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DoSvc" /v "Start" /t REG_DWORD /d "4" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BFE" /v "Start" /t REG_DWORD /d "4" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ClipSVC" /v "Start" /t REG_DWORD /d "4" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\StorSvc" /v "Start" /t REG_DWORD /d "4" /f
    PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.WindowsStore' | Remove-AppxPackage"
    cls
    echo Microsoft Store has been Disabled
    timeout 2 > nul
    goto :menu
) else if %store_option%==3 (
    goto :menu
) else (
    echo Invalid option!
    timeout 2 > nul
    goto :store_menu
)

:clipboard_menu
cls
echo ---------- Clipboard Services ----------
echo 1. Enable
echo 2. Disable
echo 3. Back to main menu
echo ------------------------------------

set /p clipboard_option=Choose an option: 

if %clipboard_option%==1 (
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\cbdhsvc" /v "Start" /t REG_DWORD /d "3" /f
    cls
    echo Clipboard has been Enabled
    timeout 2 > nul
    goto :menu
) else if %clipboard_option%==2 (
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\cbdhsvc" /v "Start" /t REG_DWORD /d "4" /f
    cls
    echo Clipboard has been Disabled
    timeout 2 > nul
    goto :menu
) else if %clipboard_option%==3 (
    goto :menu
) else (
    echo Invalid option!
    timeout 2 > nul
    goto :clipboard_menu
)

:printing_menu
cls
echo ---------- Printing Services ----------
echo 1. Enable
echo 2. Disable
echo 3. Back to main menu
echo ------------------------------------

set /p printing_option=Choose an option: 

if %printing_option%==1 (
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Spooler" /v "Start" /t REG_DWORD /d "2" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PrintWorkFlowUserSvc" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\StiSvc" /v "Start" /t REG_DWORD /d "3" /f
    devmanview /enable "Fax" > NUL 2>&1
    devmanview /enable "Microsoft Print to PDF" > NUL 2>&1
    devmanview /enable "Microsoft XPS Document Writer" > NUL 2>&1
    devmanview /enable "Root Print Queue" > NUL 2>&1
    cls
    echo Printing has been Enabled
    timeout 2 > nul
    goto :menu
) else if %printing_option%==2 (
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Spooler" /v "Start" /t REG_DWORD /d "4" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PrintWorkFlowUserSvc" /v "Start" /t REG_DWORD /d "4" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\StiSvc" /v "Start" /t REG_DWORD /d "4" /f
    devmanview /disable "Fax" > NUL 2>&1
    devmanview /disable "Microsoft Print to PDF" > NUL 2>&1
    devmanview /disable "Microsoft XPS Document Writer" > NUL 2>&1
    devmanview /disable "Root Print Queue" > NUL 2>&1
    cls
    echo Printing has been Disabled
    timeout 2 > nul
    goto :menu
) else if %printing_option%==3 (
    goto :menu
) else (
    echo Invalid option!
    timeout 2 > nul
    goto :printing_menu
)

:defender_menu
cls
echo ---------- Windows Defender ----------
echo 1. Enable
echo 2. Disable
echo 3. Back to main menu
echo ------------------------------------

set /p defender_option=Choose an option: 

if %defender_option%==1 (
    PowerRun.exe /SW:0 Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\MsSecCore" /v "Start" /t REG_DWORD /d "0" /f >NUL 2>nul
    PowerRun.exe /SW:0 Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\MsSecFlt" /v "Start" /t REG_DWORD /d "0" /f >NUL 2>nul
    PowerRun.exe /SW:0 Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\MsSecWfp" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>nul
    PowerRun.exe /SW:0 Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\SecurityHealthService" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>nul
    PowerRun.exe /SW:0 Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\Sense" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>nul
    PowerRun.exe /SW:0 Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\WdBoot" /v "Start" /t REG_DWORD /d "0" /f >NUL 2>nul
    PowerRun.exe /SW:0 Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\WdFilter" /v "Start" /t REG_DWORD /d "0" /f >NUL 2>nul
    PowerRun.exe /SW:0 Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\WdNisDrv" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>nul
    PowerRun.exe /SW:0 Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\WdNisSvc" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>nul
    PowerRun.exe /SW:0 Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\WinDefend" /v "Start" /t REG_DWORD /d "2" /f >NUL 2>nul
    PowerRun.exe /SW:0 Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\wscsvc" /v "Start" /t REG_DWORD /d "2" /f >NUL 2>nul
    PowerRun.exe /SW:0 Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\MDCoreSvc" /v "Start" /t REG_DWORD /d "2" /f >NUL 2>nul
    PowerRun.exe /SW:0 Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "SecurityHealth" /t REG_EXPAND_SZ /d "%systemroot%\system32\SecurityHealthSystray.exe" /f >NUL 2>nul
    PowerRun.exe /SW:0 Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\SgrmAgent" /v "Start" /t REG_DWORD /d "0" /f >NUL 2>nul
    PowerRun.exe /SW:0 Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\SgrmBroker" /v "Start" /t REG_DWORD /d "2" /f >NUL 2>nul
    PowerRun.exe /SW:0 Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\webthreatdefsvc" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>nul
    PowerRun.exe /SW:0 Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\webthreatdefusersvc" /v "Start" /t REG_DWORD /d "2" /f >NUL 2>nul
    PowerRun.exe /SW:0 Reg.exe delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\smartscreen.exe" /f >NUL 2>nul
for %%j in (
	"%systemroot%\system32\smartscreen.exe"
) do (
	if not exist %%j if exist "%%j.old" ren "%%j.old" "smartscreen.exe" >NUL 2>nul
)
    PowerRun.exe /SW:0 Reg.exe delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Associations" /f >NUL 2>nul
    PowerRun.exe /SW:0 Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "SmartScreenEnabled" /t REG_SZ /d "On" /f >NUL 2>nul
    PowerRun.exe /SW:0 Reg.exe delete "HKLM\Software\Policies\Microsoft\System" /v "EnableSmartScreen" /f >NUL 2>nul
    PowerRun.exe /SW:0 Reg.exe delete "HKCU\Software\Microsoft\Windows\CurrentVersion\AppHost" /v "EnableWebContentEvaluation" /f >NUL 2>nul
    PowerRun.exe /SW:0 Reg.exe delete "HKCU\Software\Microsoft\Windows\CurrentVersion\AppHost" /v "PreventOverride" /f >NUL 2>nul
    PowerRun.exe /SW:0 Reg.exe delete "HKLM\Software\Microsoft\Windows\CurrentVersion\AppHost" /v "EnableWebContentEvaluation" /f >NUL 2>nul
    PowerRun.exe /SW:0 Reg.exe delete "HKLM\SYSTEM\ControlSet001\Control\CI\Policy" /v "VerifiedAndReputablePolicyState" /f >NUL 2>nul
    PowerRun.exe /SW:0 Reg.exe delete "HKLM\Software\Policies\Microsoft\Windows Defender" /f >NUL 2>nul
    PowerRun.exe /SW:0 Reg.exe delete "HKLM\Software\Policies\Microsoft\Windows Advanced Threat Protection" /f >NUL 2>nul
    PowerRun.exe /SW:0 Reg.exe delete "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender Security Center" /f >NUL 2>nul
    PowerRun.exe /SW:0 Reg.exe add "HKLM\Software\Microsoft\Windows Defender" /v "PUAProtection" /t REG_DWORD /d "1" /f >NUL 2>nul
    PowerRun.exe /SW:0 Reg.exe delete "HKLM\SYSTEM\ControlSet001\Control\CI\Config" /v "VulnerableDriverBlocklistEnable" /f >NUL 2>nul
    PowerRun.exe /SW:0 Reg.exe delete "HKLM\SYSTEM\ControlSet001\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" /v "Enabled" /f >NUL 2>nul
    powerrun "schtasks.exe" /change /enable /TN "\Microsoft\Windows\Windows Defender\Windows Defender Cache Maintenance" >nul 2>&1
    powerrun "schtasks.exe" /change /enable /TN "\Microsoft\Windows\Windows Defender\Windows Defender Cleanup" >nul 2>&1
    powerrun "schtasks.exe" /change /enable /TN "\Microsoft\Windows\Windows Defender\Windows Defender Scheduled Scan" >nul 2>&1
    powerrun "schtasks.exe" /change /enable /TN "\Microsoft\Windows\Windows Defender\Windows Defender Verification" >nul 2>&1
    cls
    echo Windows Defender has been Enabled
    timeout 2 > nul
    goto :menu
) else if %defender_option%==2 (
PowerShell -NonInteractive -NoLogo -NoProfile -C "Set-MpPreference -DisableRealtimeMonitoring 1" >NUL 2>nul
    PowerRun.exe /SW:0 Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\MsSecCore" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>nul
    PowerRun.exe /SW:0 Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\MsSecFlt" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>nul
    PowerRun.exe /SW:0 Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\MsSecWfp" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>nul
    PowerRun.exe /SW:0 Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\SecurityHealthService" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>nul
    PowerRun.exe /SW:0 Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\Sense" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>nul
    PowerRun.exe /SW:0 Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\WdBoot" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>nul
    PowerRun.exe /SW:0 Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\WdFilter" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>nul
    PowerRun.exe /SW:0 Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\WdNisDrv" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>nul
    PowerRun.exe /SW:0 Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\WdNisSvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>nul
    PowerRun.exe /SW:0 Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\WinDefend" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>nul
    PowerRun.exe /SW:0 Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\wscsvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>nul
    PowerRun.exe /SW:0 Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\MDCoreSvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>nul
    PowerRun.exe /SW:0 Reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "SecurityHealth" /f >NUL 2>nul
    PowerRun.exe /SW:0 Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\SgrmAgent" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>nul
    PowerRun.exe /SW:0 Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\SgrmBroker" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>nul
    PowerRun.exe /SW:0 Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\webthreatdefsvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>nul
    PowerRun.exe /SW:0 Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\webthreatdefusersvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>nul
taskkill /f /im smartscreen.exe >NUL 2>nul
for %%j in (
	"%systemroot%\system32\smartscreen.exe"
) do (
	if not exist "%%j.old" if exist %%j (
		takeown /F %%j /A >NUL 2>nul
		icacls %%j /grant Administrators:F >NUL 2>nul
		copy "%%j" "%%j.old" /v >NUL 2>nul
		del "%%j" >NUL 2>nul
	)
)
    PowerRun.exe /SW:0 Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "SmartScreenEnabled" /t REG_SZ /d "Off" /f >NUL 2>nul
    PowerRun.exe /SW:0 Reg.exe add "HKLM\Software\Policies\Microsoft\System" /v "EnableSmartScreen" /t REG_DWORD /d "0" /f >NUL 2>nul
    PowerRun.exe /SW:0 Reg.exe add "HKLM\Software\Policies\Microsoft\Windows Defender\SmartScreen" /v "ConfigureAppInstallControlEnabled" /t REG_DWORD /d "0" /f >NUL 2>nul
    PowerRun.exe /SW:0 Reg.exe add "HKLM\Software\Policies\Microsoft\Windows Defender\SmartScreen" /v "ConfigureAppInstallControl" /t REG_DWORD /d "0" /f >NUL 2>nul
    PowerRun.exe /SW:0 Reg.exe add "HKLM\Software\Policies\Microsoft\Windows Defender\SmartScreen" /v "EnableSmartScreen" /t REG_DWORD /d "0" /f >NUL 2>nul
    PowerRun.exe /SW:0 Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\AppHost" /v "EnableWebContentEvaluation" /t REG_DWORD /d "0" /f >NUL 2>nul
    PowerRun.exe /SW:0 Reg.exe add "HKLM\Software\Microsoft\Windows\CurrentVersion\AppHost" /v "EnableWebContentEvaluation" /t REG_DWORD /d "0" /f >NUL 2>nul
    PowerRun.exe /SW:0 Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\CI\Policy" /v "VerifiedAndReputablePolicyState" /t REG_DWORD /d "0" /f >NUL 2>nul
    PowerRun.exe /SW:0 Reg.exe add "HKLM\Software\Microsoft\Windows Defender" /v "PUAProtection" /t REG_DWORD /d "0" /f >NUL 2>nul
    PowerRun.exe /SW:0 Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\CI\Config" /v "VulnerableDriverBlocklistEnable" /t REG_DWORD /d "0" /f >NUL 2>nul
    PowerRun.exe /SW:0 Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" /v "Enabled" /t REG_DWORD /d "0" /f >NUL 2>nul
    powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\Windows Defender\Windows Defender Cache Maintenance" >nul 2>&1
    powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\Windows Defender\Windows Defender Cleanup" >nul 2>&1
    powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\Windows Defender\Windows Defender Scheduled Scan" >nul 2>&1
    powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\Windows Defender\Windows Defender Verification" >nul 2>&1
    cls
    echo Windows Defender has been Disabled
    timeout 2 > nul
    goto :menu
) else if %defender_option%==3 (
    goto :menu
) else (
    echo Invalid option!
    timeout 2 > nul
    goto :defender_menu
)
