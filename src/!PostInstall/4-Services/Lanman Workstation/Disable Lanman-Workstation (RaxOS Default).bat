@echo off
Title Tanks Gosheto
sc config Bowser start=disabled >nul 2>&1
sc config rdbss start=disabled >nul 2>&1
sc config KSecPkg start=disabled >nul 2>&1
sc config mrxsmb20 start=disabled >nul 2>&1
sc config mrxsmb start=disabled >nul 2>&1
sc config srv2 start=disabled >nul 2>&1
sc config LanmanWorkstation start=disabled >nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Services\LanmanServer\Parameters" /v "AutoShareServer" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Services\LanmanServer\Parameters" /v "AutoShareWks" /t REG_DWORD /d "0" /f >nul 2>&1
DISM /Online /Disable-Feature /FeatureName:SmbDirect /norestart >nul 2>&1
pause