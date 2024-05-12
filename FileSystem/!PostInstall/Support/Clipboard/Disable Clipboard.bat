    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\cbdhsvc" /v "Start" /t REG_DWORD /d "4" /f
    cls
    echo Clipboard has been Disabled
    pause