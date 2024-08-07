mkdir %USERPROFILE%\Desktop\PostInstall
robocopy "PostInstall" "%USERPROFILE%\Desktop\PostInstall" /E /IM /IT /NP
copy "PowerRun.exe" "%WINDIR%"