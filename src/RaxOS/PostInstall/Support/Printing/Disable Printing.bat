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


    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Spooler" /v "Start" /t REG_DWORD /d "4" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PrintWorkFlowUserSvc" /v "Start" /t REG_DWORD /d "4" /f
    PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\StiSvc" /v "Start" /t REG_DWORD /d "4" /f
    devmanview /disable "Fax" > NUL 2>&1
    devmanview /disable "Microsoft Print to PDF" > NUL 2>&1
    devmanview /disable "Microsoft XPS Document Writer" > NUL 2>&1
    devmanview /disable "Root Print Queue" > NUL 2>&1
    powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\Printing\PrintJobCleanupTask" >nul 2>&1
    powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\Printing\PrinterCleanupTask" >nul 2>&1
    powerrun "schtasks.exe" /change /disable /TN "\Microsoft\Windows\Printing\EduPrintProv" >nul 2>&1
    dism /online /disable-feature /featurename:Printing-Foundation-Features
    dism /online /disable-feature /featurename:Internet-Printing-Client
    dism /online /disable-feature /featurename:Printing-LPDPrintService
    dism /online /disable-feature /featurename:Printing-LPRPortMonitor
    cls
    echo Printing has been Disabled
    pause