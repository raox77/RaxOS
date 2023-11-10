@echo off
takeown /f "%WinDir%\Modules" /a & icacls "%WinDir%\Modules" /grant Administrators:F
rd /s /q "%WinDir%\Modules"
takeown /f "C:\Modules" /a & icacls "C:\Modules" /grant Administrators:F
rd /s /q "C:\Modules"
del "%~f0"&exit

for /F "tokens=* skip=1" %%n in ('wmic SYSTEMenclosure get ChassisTypes ^| findstr "."') do set ChassisTypes=%%n
set ChassisTypes=%ChassisTypes:{=% 
set /a ChassisTypes=%ChassisTypes:}=%
if %ChassisTypes% LEQ 7 goto A
if %ChassisTypes% GTR 7 goto B

:A
PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DisplayEnhancementService" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d "1" /f
PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wmiacpi" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
cls
goto end

:B
PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\serenum" /v "Start" /t REG_DWORD /d "3" /f >nul 2>&1
PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\sermouse" /v "Start" /t REG_DWORD /d "3" /f >nul 2>&1
PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\serial" /v "Start" /t REG_DWORD /d "3" /f >nul 2>&1
PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wmiacpi" /v "Start" /t REG_DWORD /d "2" /f >nul 2>&1
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d "0" /f
goto end
cls