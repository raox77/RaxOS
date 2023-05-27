@echo off
Title Tanks Gosheto
sc config Bowser start=demand >nul 2>&1
sc config rdbss start=demand >nul 2>&1
sc config KSecPkg start=boot >nul 2>&1
sc config mrxsmb20 start=demand >nul 2>&1
sc config mrxsmb start=demand >nul 2>&1
sc config srv2 start=demand >nul 2>&1
sc config LanmanWorkstation start=auto >nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Services\LanmanServer\Parameters" /v "AutoShareServer" /t REG_DWORD /d "1" /f >nul 2>&1
Reg.exe add "HKLM\System\CurrentControlSet\Services\LanmanServer\Parameters" /v "AutoShareWks" /t REG_DWORD /d "1" /f >nul 2>&1
DISM /Online /Enable-Feature /FeatureName:SmbDirect /norestart >nul 2>&1
pause