@echo off

sc delete bravem >nul 2>&1
sc delete brave >nul 2>&1
rmdir /s /q "C:\Program Files (x86)\BraveSoftware\Update" >nul 2>&1
