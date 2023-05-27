@echo off
sc config InstallService start=disabled
sc config wlidsvc start=disabled
sc config AppXSvc start=disabled
sc config TokenBroker start=disabled
sc config LicenseManager start=disabled
sc config AppXSVC start=disabled
sc config FileInfo start=disabled
sc config FileCrypt start=disabled
PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BFE" /v "Start" /t REG_DWORD /d "4" /f 
PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ClipSVC" /v "Start" /t REG_DWORD /d "4" /f
cls
echo Store disabled. Please restart.
pause