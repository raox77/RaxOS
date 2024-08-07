@echo off
:: Checking for admin
fltmc >nul 2>&1 || (
    echo Administrator privileges are required.
    PowerShell Start -Verb RunAs '%0' 2> nul || (
        echo Right-click on the script and select "Run as administrator".
        pause & exit 1
    )
    exit 0
)
:: Initialize environment
setlocal EnableExtensions DisableDelayedExpansion


    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\vmickvpexchange" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\vmicguestinterface" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\vmicshutdown" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\vmicheartbeat" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\vmicvmsession" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\vmicrdv" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\vmictimesync" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\vmicvss" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\hyperkbd" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\RasMan" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SessionEnv" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TermService" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\hypervideo" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\gencounter" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\vmgid" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\storflt" /v "Start" /t REG_DWORD /d "0" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\bttflt" /v "Start" /t REG_DWORD /d "0" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\vpci" /v "Start" /t REG_DWORD /d "0" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\hvservice" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\hvcrash" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\HvHost" /v "Start" /t REG_DWORD /d "1" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\rdpbus" /v "Start" /t REG_DWORD /d "2" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Vid" /v "Start" /t REG_DWORD /d "2" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TsUsbFlt" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\tsusbhub" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\RDPDR" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\RdpVideominiport" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TsUsbFlt" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\terminpt" /v "Start" /t REG_DWORD /d "3" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TsUsbGD" /v "Start" /t REG_DWORD /d "3" /f 
    bcdedit /set hypervisorlaunchtype auto
    dism.exe /Online /Enable-Feature:Microsoft-Hyper-V /All /NoRestart
    devmanview /enable "Remote Desktop Device Redirector Bus"
    cls
    echo Hyper-V, Remote Desktop has been Enabled
    pause