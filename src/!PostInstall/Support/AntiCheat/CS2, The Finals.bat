@echo off
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\CI\Config" /v "VulnerableDriverBlocklistEnable" /t REG_DWORD /d "1" /f
cls
echo VulnerableDriverBlocklistEnable enabled, please reboot.
pause