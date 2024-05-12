    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Spooler" /v "Start" /t REG_DWORD /d "4" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PrintWorkFlowUserSvc" /v "Start" /t REG_DWORD /d "4" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\StiSvc" /v "Start" /t REG_DWORD /d "4" /f
    devmanview /disable "Fax" > NUL 2>&1
    devmanview /disable "Microsoft Print to PDF" > NUL 2>&1
    devmanview /disable "Microsoft XPS Document Writer" > NUL 2>&1
    devmanview /disable "Root Print Queue" > NUL 2>&1
    cls
    echo Printing has been Disabled
    pause