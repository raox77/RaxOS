    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Spooler" /v "Start" /t REG_DWORD /d "2" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PrintWorkFlowUserSvc" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\StiSvc" /v "Start" /t REG_DWORD /d "3" /f
    devmanview /enable "Fax" > NUL 2>&1
    devmanview /enable "Microsoft Print to PDF" > NUL 2>&1
    devmanview /enable "Microsoft XPS Document Writer" > NUL 2>&1
    devmanview /enable "Root Print Queue" > NUL 2>&1
    cls
    echo Printing has been Enabled
    pause