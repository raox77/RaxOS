@echo off

PowerRun.exe /SW:0 Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\DeviceGuard" /v "LsaCfgFlags" /t REG_DWORD /d "3" /f
PowerRun.exe /SW:0 Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\DeviceGuard" /v "ConfigureSystemGuardLaunch" /t REG_DWORD /d "0" /f
PowerRun.exe /SW:0 Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\DeviceGuard" /v "RequirePlatformSecurityFeatures" /t REG_DWORD /d "3" /f
PowerRun.exe /SW:0 Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\DeviceGuard" /v "EnableVirtualizationBasedSecurity" /t REG_DWORD /d "1" /f
PowerRun.exe /SW:0 Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\DeviceGuard" /v "ConfigureKernelShadowStacksLaunch" /t REG_DWORD /d "0" /f
PowerRun.exe /SW:0 Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\DeviceGuard" /v "HypervisorEnforcedCodeIntegrity" /t REG_DWORD /d "3" /f
bcdedit /set hypervisorlaunchtype auto
exit /b 0