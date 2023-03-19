@echo off

sc delete gupdatem >nul 2>&1
sc delete googlechromeelevationservice >nul 2>&1
sc delete gupdate >nul 2>&1
rmdir /s /q "C:\Program Files\Google\GoogleUpdater" >nul 2>&1
rmdir /s /q "C:\Program Files (x86)\Google\Update" >nul 2>&1
