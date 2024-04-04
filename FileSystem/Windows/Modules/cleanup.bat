@echo off
takeown /f "%WinDir%\Modules" /a & icacls "%WinDir%\Modules" /grant Administrators:F
rd /s /q "%WinDir%\Modules"
Echo "Set Sound Scheme to No Sound"
powershell C:\Modules\sound.ps1 >nul 2>&1
cls
del "%~f0"&exit