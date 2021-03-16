@ECHO OFF & CD /D %~DP0 & TITLE
>NUL 2>&1 REG.exe query "HKU\S-1-5-19" || (
    ECHO SET UAC = CreateObject^("Shell.Application"^) > "%TEMP%\Getadmin.vbs"
    ECHO UAC.ShellExecute "%~f0", "%1", "", "runas", 1 >> "%TEMP%\Getadmin.vbs"
    "%TEMP%\Getadmin.vbs"
    DEL /f /q "%TEMP%\Getadmin.vbs" 2>NUL
    Exit /b
)

reg delete "HKLM\SOFTWARE\Classes\.bcss" /F>NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\.bcpkg" /F>NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\BeyondCompare.Snapshot" /F>NUL 2>NUL
reg delete "HKLM\SOFTWARE\Classes\BeyondCompare.SettingsPackage" /F>NUL 2>NUL

reg delete "HKLM\SOFTWARE\Classes\CLSID\{57FA2D12-D22D-490A-805A-5CB48E84F12A}" /F>NUL 2>NUL

reg delete "HKLM\SOFTWARE\Scooter Software\Beyond Compare" /F>NUL 2>NUL
reg delete "HKLM\SOFTWARE\Scooter Software\Beyond Compare 4" /F>NUL 2>NUL
reg delete "HKCU\SOFTWARE\Scooter Software\Beyond Compare 4" /F>NUL 2>NUL
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\EventLog\Application\Beyond Compare 4" /F>NUL 2>NUL

taskkill /f /im explorer.exe >NUL 2>NUL& start explorer.exe 

ECHO. &ECHO É¾³ýÍê³É£¡&PAUSE >NUL 2>NUL & EXIT