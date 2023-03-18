@echo
PowerRun.exe /SW:0 "Reg.exe" add "HKLM\SYSTEM\CurrentControlSet\Services\Schedule" /v "Start" /t REG_DWORD /d "4" /f
PowerRun.exe /SW:0 "Reg.exe" add "HKLM\SYSTEM\CurrentControlSet\Services\timebrokersvc" /v "Start" /t REG_DWORD /d "4" /f
PowerRun.exe /SW:0 "Reg.exe" add "HKLM\SYSTEM\CurrentControlSet\Services\tiledatamodelsvc" /v "Start" /t REG_DWORD /d "2" /f
PowerRun.exe /SW:0 Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\Schedule" /v "ErrorControl" /f
