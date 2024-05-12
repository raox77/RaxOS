@echo off
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "HubMode" /t REG_DWORD /d "1" /f
Reg.exe delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace_36354489\{f874310e-b6b7-47dc-bc84-b9e6b38f5903}" /f
PowerRun.exe /SW:0 Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Classes\CLSID\{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}\ShellFolder" /v "Attributes" /t REG_DWORD /d "2962489444" /f
PowerRun.exe /SW:0 Reg.exe add "HKCR\CLSID\{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}\ShellFolder" /v "Attributes" /t REG_DWORD /d "2962489444" /f
cls
echo Quick access removed, please reboot your system.
pause
