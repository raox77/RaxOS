@echo off
PowerRun.exe /SW:0 "Reg.exe" add "HKLM\SYSTEM\CurrentControlSet\Services\Wcmsvc" /v "Start" /t REG_DWORD /d "4" /f
PowerRun.exe /SW:0 "Reg.exe" add "HKLM\SYSTEM\CurrentControlSet\Services\Ndisuio" /v "Start" /t REG_DWORD /d "4" /f
PowerRun.exe /SW:0 "Reg.exe" add "HKLM\SYSTEM\CurrentControlSet\Services\NativeWifiP" /v "Start" /t REG_DWORD /d "4" /f
PowerRun.exe /SW:0 "Reg.exe" add "HKLM\SYSTEM\CurrentControlSet\Services\vwifibus" /v "Start" /t REG_DWORD /d "4" /f
PowerRun.exe /SW:0 "Reg.exe" add "HKLM\SYSTEM\CurrentControlSet\Services\vwififlt" /v "Start" /t REG_DWORD /d "4" /f
PowerRun.exe /SW:0 "Reg.exe" add "HKLM\SYSTEM\CurrentControlSet\Services\wdiwifi" /v "Start" /t REG_DWORD /d "4" /f
PowerRun.exe /SW:0 "Reg.exe" add "HKLM\SYSTEM\CurrentControlSet\Services\WlanSvc" /v "Start" /t REG_DWORD /d "4" /f
cls
echo Wifi disabled. Please reboot.
pause
