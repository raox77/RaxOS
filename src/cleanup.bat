@echo off
takeown /f "%WinDir%\Modules" /a & icacls "%WinDir%\Modules" /grant Administrators:F
rd /s /q "%WinDir%\Modules"
powershell.exe C:\Modules\!disable-pnp-powersaving.ps1
takeown /f "C:\Modules" /a & icacls "C:\Modules" /grant Administrators:F
rd /s /q "C:\Modules"
del "%~f0"&exit