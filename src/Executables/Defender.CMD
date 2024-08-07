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