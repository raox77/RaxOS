@echo off
for /f %%i in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /s /f "Scaling"^| findstr "HKEY"') do reg.exe add "%%i" /v "Scaling" /t REG_DWORD /d "1" /f >nul 2>&1