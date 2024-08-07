@echo off
:: Checking for admin
fltmc >nul 2>&1 || (
    echo Administrator privileges are required.
    PowerShell Start -Verb RunAs '%0' 2> nul || (
        echo Right-click on the script and select "Run as administrator".
        pause & exit 1
    )
    exit 0
)
:: Initialize environment
setlocal EnableExtensions DisableDelayedExpansion


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
    pause