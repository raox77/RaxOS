@echo off 
Title RaxOS 
setlocal EnableDelayedExpansion

Echo "Installing Visual C Runtimes"
start /b /wait "" "C:\Modules\VisualCAIO\install_all.bat" >nul 2>&1
cls

Echo "Installing 7zip"
start /b /wait "" "C:\Modules\7z2201-x64.msi" /passive >nul 2>&1
cls

Echo "Installing OpenShell"
start /b /wait "" "C:\Modules\OpenShellSetup_4_4_189.exe" /qn ADDLOCAL=StartMenu >nul 2>&1
cls

Echo "Installing LowAudioLatency"
start /b /wait "" "C:\Modules\LowAudioLatency_2.0.0.0.msi" /passive >nul 2>&1
cls

echo "7zip Settings"
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\.7z" /ve /t REG_SZ /d "7-Zip.7z" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.7z" /ve /t REG_SZ /d "7z Archive" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.7z\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,0" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.7z\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.7z\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.7z\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.7z" /ve /t REG_SZ /d "7-Zip.7z" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.7z" /ve /t REG_SZ /d "7z Archive" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.7z\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,0" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.7z\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.7z\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.7z\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\.zip" /ve /t REG_SZ /d "7-Zip.zip" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.zip" /ve /t REG_SZ /d "zip Archive" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.zip\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,1" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.zip\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.zip\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.zip\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.zip" /ve /t REG_SZ /d "7-Zip.zip" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.zip" /ve /t REG_SZ /d "zip Archive" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.zip\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,1" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.zip\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.zip\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.zip\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\.rar" /ve /t REG_SZ /d "7-Zip.rar" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.rar" /ve /t REG_SZ /d "rar Archive" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.rar\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,3" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.rar\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.rar\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.rar\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.rar" /ve /t REG_SZ /d "7-Zip.rar" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.rar" /ve /t REG_SZ /d "rar Archive" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.rar\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,3" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.rar\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.rar\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.rar\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\.001" /ve /t REG_SZ /d "7-Zip.001" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.001" /ve /t REG_SZ /d "001 Archive" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.001\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,9" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.001\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.001\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.001\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.001" /ve /t REG_SZ /d "7-Zip.001" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.001" /ve /t REG_SZ /d "001 Archive" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.001\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,9" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.001\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.001\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.001\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\.cab" /ve /t REG_SZ /d "7-Zip.cab" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.cab" /ve /t REG_SZ /d "cab Archive" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.cab\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,7" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.cab\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.cab\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.cab\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.cab" /ve /t REG_SZ /d "7-Zip.cab" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.cab" /ve /t REG_SZ /d "cab Archive" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.cab\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,7" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.cab\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.cab\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.cab\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\.iso" /ve /t REG_SZ /d "7-Zip.iso" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.iso" /ve /t REG_SZ /d "iso Archive" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.iso\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,8" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.iso\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.iso\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.iso\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.iso" /ve /t REG_SZ /d "7-Zip.iso" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.iso" /ve /t REG_SZ /d "iso Archive" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.iso\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,8" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.iso\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.iso\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.iso\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\.xz" /ve /t REG_SZ /d "7-Zip.xz" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.xz" /ve /t REG_SZ /d "xz Archive" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.xz\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,23" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.xz\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.xz\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.xz\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.xz" /ve /t REG_SZ /d "7-Zip.xz" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.xz" /ve /t REG_SZ /d "xz Archive" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.xz\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,23" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.xz\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.xz\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.xz\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\.txz" /ve /t REG_SZ /d "7-Zip.txz" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.txz" /ve /t REG_SZ /d "txz Archive" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.txz\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,23" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.txz\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.txz\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.txz\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.txz" /ve /t REG_SZ /d "7-Zip.txz" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.txz" /ve /t REG_SZ /d "txz Archive" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.txz\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,23" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.txz\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.txz\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.txz\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\.lzma" /ve /t REG_SZ /d "7-Zip.lzma" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.lzma" /ve /t REG_SZ /d "lzma Archive" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.lzma\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,16" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.lzma\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.lzma\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.lzma\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.lzma" /ve /t REG_SZ /d "7-Zip.lzma" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.lzma" /ve /t REG_SZ /d "lzma Archive" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.lzma\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,16" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.lzma\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.lzma\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.lzma\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\.tar" /ve /t REG_SZ /d "7-Zip.tar" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.tar" /ve /t REG_SZ /d "tar Archive" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.tar\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,13" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.tar\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.tar\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.tar\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.tar" /ve /t REG_SZ /d "7-Zip.tar" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.tar" /ve /t REG_SZ /d "tar Archive" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.tar\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,13" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.tar\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.tar\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.tar\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\.cpio" /ve /t REG_SZ /d "7-Zip.cpio" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.cpio" /ve /t REG_SZ /d "cpio Archive" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.cpio\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,12" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.cpio\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.cpio\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.cpio\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.cpio" /ve /t REG_SZ /d "7-Zip.cpio" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.cpio" /ve /t REG_SZ /d "cpio Archive" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.cpio\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,12" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.cpio\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.cpio\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.cpio\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\.bz2" /ve /t REG_SZ /d "7-Zip.bz2" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.bz2" /ve /t REG_SZ /d "bz2 Archive" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.bz2\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,2" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.bz2\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.bz2\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.bz2\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.bz2" /ve /t REG_SZ /d "7-Zip.bz2" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.bz2" /ve /t REG_SZ /d "bz2 Archive" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.bz2\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,2" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.bz2\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.bz2\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.bz2\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\.bzip2" /ve /t REG_SZ /d "7-Zip.bzip2" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.bzip2" /ve /t REG_SZ /d "bzip2 Archive" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.bzip2\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,2" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.bzip2\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.bzip2\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.bzip2\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.bzip2" /ve /t REG_SZ /d "7-Zip.bzip2" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.bzip2" /ve /t REG_SZ /d "bzip2 Archive" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.bzip2\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,2" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.bzip2\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.bzip2\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.bzip2\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\.tbz2" /ve /t REG_SZ /d "7-Zip.tbz2" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.tbz2" /ve /t REG_SZ /d "tbz2 Archive" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.tbz2\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,2" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.tbz2\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.tbz2\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.tbz2\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.tbz2" /ve /t REG_SZ /d "7-Zip.tbz2" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.tbz2" /ve /t REG_SZ /d "tbz2 Archive" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.tbz2\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,2" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.tbz2\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.tbz2\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.tbz2\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\.tbz" /ve /t REG_SZ /d "7-Zip.tbz" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.tbz" /ve /t REG_SZ /d "tbz Archive" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.tbz\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,2" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.tbz\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.tbz\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.tbz\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.tbz" /ve /t REG_SZ /d "7-Zip.tbz" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.tbz" /ve /t REG_SZ /d "tbz Archive" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.tbz\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,2" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.tbz\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.tbz\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.tbz\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\.gz" /ve /t REG_SZ /d "7-Zip.gz" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.gz" /ve /t REG_SZ /d "gz Archive" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.gz\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,14" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.gz\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.gz\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.gz\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.gz" /ve /t REG_SZ /d "7-Zip.gz" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.gz" /ve /t REG_SZ /d "gz Archive" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.gz\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,14" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.gz\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.gz\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.gz\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\.gzip" /ve /t REG_SZ /d "7-Zip.gzip" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.gzip" /ve /t REG_SZ /d "gzip Archive" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.gzip\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,14" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.gzip\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.gzip\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.gzip\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.gzip" /ve /t REG_SZ /d "7-Zip.gzip" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.gzip" /ve /t REG_SZ /d "gzip Archive" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.gzip\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,14" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.gzip\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.gzip\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.gzip\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\.tgz" /ve /t REG_SZ /d "7-Zip.tgz" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.tgz" /ve /t REG_SZ /d "tgz Archive" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.tgz\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,14" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.tgz\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.tgz\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.tgz\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.tgz" /ve /t REG_SZ /d "7-Zip.tgz" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.tgz" /ve /t REG_SZ /d "tgz Archive" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.tgz\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,14" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.tgz\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.tgz\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.tgz\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\.tpz" /ve /t REG_SZ /d "7-Zip.tpz" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.tpz" /ve /t REG_SZ /d "tpz Archive" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.tpz\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,14" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.tpz\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.tpz\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.tpz\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.tpz" /ve /t REG_SZ /d "7-Zip.tpz" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.tpz" /ve /t REG_SZ /d "tpz Archive" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.tpz\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,14" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.tpz\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.tpz\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.tpz\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\.z" /ve /t REG_SZ /d "7-Zip.z" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.z" /ve /t REG_SZ /d "z Archive" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.z\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,5" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.z\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.z\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.z\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.z" /ve /t REG_SZ /d "7-Zip.z" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.z" /ve /t REG_SZ /d "z Archive" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.z\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,5" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.z\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.z\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.z\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\.taz" /ve /t REG_SZ /d "7-Zip.taz" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.taz" /ve /t REG_SZ /d "taz Archive" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.taz\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,5" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.taz\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.taz\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.taz\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.taz" /ve /t REG_SZ /d "7-Zip.taz" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.taz" /ve /t REG_SZ /d "taz Archive" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.taz\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,5" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.taz\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.taz\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.taz\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\.lzh" /ve /t REG_SZ /d "7-Zip.lzh" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.lzh" /ve /t REG_SZ /d "lzh Archive" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.lzh\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,6" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.lzh\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.lzh\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.lzh\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.lzh" /ve /t REG_SZ /d "7-Zip.lzh" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.lzh" /ve /t REG_SZ /d "lzh Archive" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.lzh\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,6" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.lzh\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.lzh\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.lzh\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\.lha" /ve /t REG_SZ /d "7-Zip.lha" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.lha" /ve /t REG_SZ /d "lha Archive" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.lha\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,6" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.lha\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.lha\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.lha\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.lha" /ve /t REG_SZ /d "7-Zip.lha" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.lha" /ve /t REG_SZ /d "lha Archive" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.lha\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,6" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.lha\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.lha\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.lha\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\.rpm" /ve /t REG_SZ /d "7-Zip.rpm" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.rpm" /ve /t REG_SZ /d "rpm Archive" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.rpm\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,10" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.rpm\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.rpm\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.rpm\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.rpm" /ve /t REG_SZ /d "7-Zip.rpm" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.rpm" /ve /t REG_SZ /d "rpm Archive" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.rpm\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,10" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.rpm\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.rpm\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.rpm\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\.deb" /ve /t REG_SZ /d "7-Zip.deb" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.deb" /ve /t REG_SZ /d "deb Archive" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.deb\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,11" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.deb\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.deb\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.deb\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.deb" /ve /t REG_SZ /d "7-Zip.deb" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.deb" /ve /t REG_SZ /d "deb Archive" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.deb\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,11" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.deb\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.deb\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.deb\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\.arj" /ve /t REG_SZ /d "7-Zip.arj" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.arj" /ve /t REG_SZ /d "arj Archive" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.arj\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,4" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.arj\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.arj\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.arj\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.arj" /ve /t REG_SZ /d "7-Zip.arj" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.arj" /ve /t REG_SZ /d "arj Archive" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.arj\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,4" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.arj\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.arj\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.arj\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\.vhd" /ve /t REG_SZ /d "7-Zip.vhd" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.vhd" /ve /t REG_SZ /d "vhd Archive" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.vhd\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,20" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.vhd\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.vhd\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.vhd\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.vhd" /ve /t REG_SZ /d "7-Zip.vhd" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.vhd" /ve /t REG_SZ /d "vhd Archive" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.vhd\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,20" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.vhd\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.vhd\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.vhd\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\.wim" /ve /t REG_SZ /d "7-Zip.wim" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.wim" /ve /t REG_SZ /d "wim Archive" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.wim\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,15" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.wim\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.wim\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.wim\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.wim" /ve /t REG_SZ /d "7-Zip.wim" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.wim" /ve /t REG_SZ /d "wim Archive" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.wim\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,15" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.wim\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.wim\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.wim\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\.swm" /ve /t REG_SZ /d "7-Zip.swm" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.swm" /ve /t REG_SZ /d "swm Archive" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.swm\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,15" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.swm\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.swm\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.swm\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.swm" /ve /t REG_SZ /d "7-Zip.swm" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.swm" /ve /t REG_SZ /d "swm Archive" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.swm\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,15" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.swm\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.swm\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.swm\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\.fat" /ve /t REG_SZ /d "7-Zip.fat" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.fat" /ve /t REG_SZ /d "fat Archive" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.fat\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,21" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.fat\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.fat\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.fat\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.fat" /ve /t REG_SZ /d "7-Zip.fat" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.fat" /ve /t REG_SZ /d "fat Archive" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.fat\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,21" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.fat\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.fat\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.fat\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\.ntfs" /ve /t REG_SZ /d "7-Zip.ntfs" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.ntfs" /ve /t REG_SZ /d "ntfs Archive" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.ntfs\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,22" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.ntfs\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.ntfs\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.ntfs\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.ntfs" /ve /t REG_SZ /d "7-Zip.ntfs" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.ntfs" /ve /t REG_SZ /d "ntfs Archive" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.ntfs\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,22" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.ntfs\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.ntfs\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.ntfs\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\.dmg" /ve /t REG_SZ /d "7-Zip.dmg" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.dmg" /ve /t REG_SZ /d "dmg Archive" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.dmg\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,17" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.dmg\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.dmg\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.dmg\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.dmg" /ve /t REG_SZ /d "7-Zip.dmg" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.dmg" /ve /t REG_SZ /d "dmg Archive" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.dmg\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,17" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.dmg\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.dmg\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.dmg\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\.hfs" /ve /t REG_SZ /d "7-Zip.hfs" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.hfs" /ve /t REG_SZ /d "hfs Archive" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.hfs\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,18" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.hfs\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.hfs\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.hfs\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.hfs" /ve /t REG_SZ /d "7-Zip.hfs" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.hfs" /ve /t REG_SZ /d "hfs Archive" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.hfs\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,18" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.hfs\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.hfs\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.hfs\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\.xar" /ve /t REG_SZ /d "7-Zip.xar" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.xar" /ve /t REG_SZ /d "xar Archive" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.xar\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,19" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.xar\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.xar\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.xar\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.xar" /ve /t REG_SZ /d "7-Zip.xar" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.xar" /ve /t REG_SZ /d "xar Archive" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.xar\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,19" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.xar\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.xar\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.xar\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\.squashfs" /ve /t REG_SZ /d "7-Zip.squashfs" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.squashfs" /ve /t REG_SZ /d "squashfs Archive" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.squashfs\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,24" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.squashfs\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.squashfs\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Classes\7-Zip.squashfs\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\.squashfs" /ve /t REG_SZ /d "7-Zip.squashfs" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.squashfs" /ve /t REG_SZ /d "squashfs Archive" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.squashfs\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\7-Zip\7z.dll,24" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.squashfs\shell" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.squashfs\shell\open" /ve /t REG_SZ /d "" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\7-Zip.squashfs\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\7-Zip\7zFM.exe\" \"%%1\"" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "GlobalAssocChangedCounter" /t REG_DWORD /d "10" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\7-Zip\FM\Columns" /v "RootFolder" /t REG_BINARY /d "0100000000000000010000000400000001000000A0000000" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\7-Zip\FM" /v "FolderHistory" /t REG_BINARY /d "0000" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\7-Zip\FM" /v "PanelPath0" /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\7-Zip\FM" /v "FlatViewArc0" /t REG_DWORD /d "0" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\7-Zip\FM" /v "PanelPath1" /t REG_SZ /d "" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\7-Zip\FM" /v "FlatViewArc1" /t REG_DWORD /d "0" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\7-Zip\FM" /v "ListMode" /t REG_DWORD /d "771" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\7-Zip\FM" /v "Position" /t REG_BINARY /d "3400000034000000D40500002B03000000000000" /f
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\7-Zip\FM" /v "Panels" /t REG_BINARY /d "0100000000000000C6020000" /f
cls

echo "Disabling Process Mitigations"
PowerShell Set-ProcessMitigation -System -Disable CFG
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "MitigationOptions" /t REG_BINARY /d "!mitigation_mask!" /f > nul 2>&1
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "MitigationAuditOptions" /t REG_BINARY /d "!mitigation_mask!" /f > nul 2>&1
cls

Echo Setting "Execution Policy To Unrestricted"
powershell set-executionpolicy unrestricted -force >nul 2>&1
cls

Echo Configuring "Keyboard and Mouse Settings"
Reg.exe add "HKCU\Control Panel\Keyboard" /v "InitialKeyboardIndicators" /t REG_SZ /d "0" /f >nul 2>&1
Reg.exe add "HKCU\Control Panel\Keyboard" /v "KeyboardDelay" /t REG_SZ /d "0" /f >nul 2>&1
Reg.exe add "HKCU\Control Panel\Keyboard" /v "KeyboardSpeed" /t REG_SZ /d "31" /f >nul 2>&1
Reg.exe add "HKCU\Control Panel\Mouse" /v "MouseSpeed" /t REG_SZ /d "0" /f >nul 2>&1
Reg.exe add "HKCU\Control Panel\Mouse" /v "MouseThreshold1" /t REG_SZ /d "0" /f >nul 2>&1
Reg.exe add "HKCU\Control Panel\Mouse" /v "MouseThreshold2" /t REG_SZ /d "0" /f >nul 2>&1
Reg.exe add "HKCU\Control Panel\Mouse" /v "MouseHoverTime" /t REG_SZ /d "0" /f >nul 2>&1
cls

echo "Editing BCDEDIT"
bcdedit /set {current} nx optin
label C: RaxOS
bcdedit /set {current} description "RaxOS"
bcdedit /set disabledynamictick yes
bcdedit /deletevalue useplatformclock
bcdedit /set isolatedcontext No
bcdedit /set bootmenupolicy legacy
bcdedit /set hypervisorlaunchtype off
bcdedit /set {globalsettings} custom:16000067 true 
bcdedit /set {globalsettings} custom:16000068 true 
bcdedit /set {globalsettings} custom:16000069 true 
bcdedit /timeout 5
cls

echo "Disable Spectre and meltdown"
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d "1" /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d "0" /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettings" /t REG_DWORD /d "0" /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /t REG_DWORD /d "3" /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverrideMask" /t REG_DWORD /d "3" /f >nul
reg add "HKLM\SYSTEM\ControlSet001\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d "0" /f >nul
reg add "HKLM\SYSTEM\ControlSet001\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableSuperfetch" /t REG_DWORD /d "0" /f >nul
cls

Echo Disabling "Exclusive Mode On Audio Devices"
for /f "delims=" %%a in ('reg query HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\MMDevices\Audio\Capture') do PowerRun.exe /SW:0 Reg.exe add "%%a\Properties" /v "{b3f8fa53-0004-438e-9003-51a46e139bfc},3" /t REG_DWORD /d "0" /f >nul 2>&1
for /f "delims=" %%a in ('reg query HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\MMDevices\Audio\Capture') do PowerRun.exe /SW:0 Reg.exe add "%%a\Properties" /v "{b3f8fa53-0004-438e-9003-51a46e139bfc},4" /t REG_DWORD /d "0" /f >nul 2>&1
for /f "delims=" %%a in ('reg query HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\MMDevices\Audio\Render') do PowerRun.exe /SW:0 Reg.exe add "%%a\Properties" /v "{b3f8fa53-0004-438e-9003-51a46e139bfc},3" /t REG_DWORD /d "0" /f >nul 2>&1
for /f "delims=" %%a in ('reg query HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\MMDevices\Audio\Render') do PowerRun.exe /SW:0 Reg.exe add "%%a\Properties" /v "{b3f8fa53-0004-438e-9003-51a46e139bfc},4" /t REG_DWORD /d "0" /f >nul 2>&1
cls

echo "Disabling Loggers and Useless Network Adapters"
powershell disable-netadapterbinding -name "*" -componentid vmware_bridge, ms_lldp, ms_lltdio, ms_implat, ms_tcpip6, ms_rspndr, ms_server, ms_msclient
cls

echo "editing POW & power tweaks"
powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
powercfg /delete 381b4222-f694-41f0-9685-ff5bb260df2e
powercfg /delete e9a42b02-d5df-448d-aa00-03f14749eb61
powercfg -changename 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c "RaxOS powerplan"
powercfg /delete a1841308-3541-4fab-bc81-f71556f20b4a
powercfg /setacvalueindex scheme_current 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0
powercfg /setacvalueindex scheme_current 7516b95f-f776-4464-8c53-06167f40cc99 3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e 0
powercfg /setacvalueindex scheme_current 2a737441-1930-4402-8d77-b2bebba308a3 d4e98f31-5ffe-4ce1-be31-1b38b384c009 0
powercfg -setacvalueindex scheme_current sub_processor THROTTLING 0
powercfg -setacvalueindex scheme_current sub_none DEVICEIDLE 0
powercfg -setacvalueindex scheme_current SUB_SLEEP AWAYMODE 0 
powercfg -setacvalueindex scheme_current SUB_SLEEP ALLOWSTANDBY 0 
powercfg -setacvalueindex scheme_current SUB_SLEEP HYBRIDSLEEP 0
powercfg /setactive scheme_current
powercfg -h off
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "HiberbootEnabled" /t Reg_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HibernateEnabled" /t Reg_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HibernateEnabledDefault" /t Reg_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "CoalescingTimerInterval" /t Reg_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t Reg_DWORD /d "1" /f 
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings" /v "ShowHibernateOption" /t Reg_DWORD /d "0" /f 
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings" /v "ShowLockOption" /t Reg_DWORD /d "0" /f 
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings" /v "ShowSleepOption" /t Reg_DWORD /d "0" /f
cls

echo "Changing fsutil behaviors"
::Thanks to AMITXV
fsutil behavior set disable8dot3 1
fsutil behavior set disablelastaccess 1
fsutil behavior set DisableDeleteNotify 0
cls

echo "Disabling powersaving features"
::Thanks to AMITXV
for %%a in (
	EnhancedPowerManagementEnabled
	AllowIdleIrpInD3
	EnableSelectiveSuspend
	DeviceSelectiveSuspended
	SelectiveSuspendEnabled
	SelectiveSuspendOn
	WaitWakeEnabled
	D3ColdSupported
	WdfDirectedPowerTransitionEnable
	EnableIdlePowerManagement
	IdleInWorkingState
) do for /f "delims=" %%b in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum" /s /f "%%a" ^| findstr "HKEY"') do Reg.exe add "%%b" /v "%%a" /t REG_DWORD /d "0" /f > NUL 2>&1
cls

echo "Enabling MSI mode & set to undefined"
::Credits to AMITXV & Artanis
for /f %%i in ('wmic path Win32_IDEController get PNPDeviceID^| findstr /l "PCI\VEN_"') do Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t REG_DWORD /d "1" /f >nul 2>&1
for /f %%i in ('wmic path Win32_USBController get PNPDeviceID^| findstr /l "PCI\VEN_"') do Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t REG_DWORD /d "1" /f >nul 2>&1
for /f %%i in ('wmic path Win32_VideoController get PNPDeviceID^| findstr /l "PCI\VEN_"') do Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t REG_DWORD /d "1" /f >nul 2>&1
for /f %%i in ('wmic path Win32_NetworkAdapter get PNPDeviceID^| findstr /l "PCI\VEN_"') do Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t REG_DWORD /d "1" /f >nul 2>&1
for /f %%i in ('wmic path Win32_SoundDevice get PNPDeviceID^| findstr /l "PCI\VEN_"') do Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t REG_DWORD /d "0" /f >nul 2>&1
for /f "tokens=*" %%i in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\PCI"^| findstr "HKEY"') do (
			for /f "tokens=*" %%a in ('reg query "%%i"^| findstr "HKEY"') do Reg.exe delete "%%a\Device Parameters\Interrupt Management\Affinity Policy" /v "DevicePriority" /f > NUL 2>&1
		)
)
cls

echo "Deleting Leftovers"
PowerRun.exe /SW:0 "Reg.exe" delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce" /v "POST INSTALL" /f 
PowerRun.exe /SW:0 "Reg.exe" delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" /v "Open-Shell Start Menu" /f
cls

echo "Changing Time Provider to ntp.org"
::Credits to privacy.sexy
w32tm /config /syncfromflags:manual /manualpeerlist:"0.pool.ntp.org 1.pool.ntp.org 2.pool.ntp.org 3.pool.ntp.org"
cls

echo "Deleting Microcode updates"
takeown /f "%WinDir%\System32\mcupdate_AuthenticAMD.dll" /a  & icacls "%WinDir%\System32\mcupdate_AuthenticAMD.dll" /grant Administrators:(F) 
del "%WinDir%\System32\mcupdate_AuthenticAMD.dll" /s /f /q 
takeown /f "%WinDir%\System32\mcupdate_GenuineIntel.dll" /a  & icacls "%WinDir%\System32\mcupdate_GenuineIntel.dll" /grant Administrators:(F) 
del "%WinDir%\System32\mcupdate_GenuineIntel.dll" /s /f /q 
cls

echo "Uninstalling Edge"
PowerShell -ExecutionPolicy Unrestricted -Command "$installer = (Get-ChildItem "^""$env:ProgramFiles*\Microsoft\Edge\Application\*\Installer\setup.exe"^""); if (!$installer) {; Write-Host 'Could not find the installer'; } else {; & $installer.FullName -Uninstall -System-Level -Verbose-Logging -Force-Uninstall; }"
cls

del /q/f/s %TEMP%\*

shutdown -r -t 0 /c "Rebooting RaxOS"
start /b "" cmd /c del "%~f0"&exit /b
Exit
