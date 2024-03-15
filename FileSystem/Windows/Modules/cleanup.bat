@echo off
takeown /f "%WinDir%\Modules" /a & icacls "%WinDir%\Modules" /grant Administrators:F
rd /s /q "%WinDir%\Modules"
del "%~f0"&exit