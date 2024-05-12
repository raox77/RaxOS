    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WlanSvc" /v "Start" /t REG_DWORD /d "2" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\vwififlt" /v "Start" /t REG_DWORD /d "2" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\tdx" /v "Start" /t REG_DWORD /d "1" /f   
    cls
    echo Wi-Fi has been Enabled
    pause