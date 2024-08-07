for /f "tokens=2 delims==" %%I in ('wmic cpu get caption /value ^| find "Caption"') do set "processor=%%I"

echo !processor! | find /i "AMD" >nul
if %errorlevel% equ 0 (
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /t REG_DWORD /d "1" /f
    Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverrideMask" /t REG_DWORD /d "3" /f
) else (
    echo !processor! | find /i "Intel" >nul
    if %errorlevel% equ 0 (
        Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /t REG_DWORD /d "3" /f
        Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverrideMask" /t REG_DWORD /d "3" /f
    ) else (
        echo.
    )
)