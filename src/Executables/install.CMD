@echo off
CD /d %~dp0

mkdir %WINDIR%\Temp\RaxOS
curl -L -o %WINDIR%\Temp\RaxOS\VisualCppRedist_AIO_x86_x64.exe https://github.com/abbodi1406/vcredist/releases/download/v0.81.0/VisualCppRedist_AIO_x86_x64.exe
start %WINDIR%\Temp\RaxOS\VisualCppRedist_AIO_x86_x64.exe /ai