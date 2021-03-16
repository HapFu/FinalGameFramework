@ECHO OFF & CD /D %~DP0 & TITLE
>NUL 2>&1 REG.exe query "HKU\S-1-5-19" || (
    ECHO SET UAC = CreateObject^("Shell.Application"^) > "%TEMP%\Getadmin.vbs"
    ECHO UAC.ShellExecute "%~f0", "%1", "", "runas", 1 >> "%TEMP%\Getadmin.vbs"
    "%TEMP%\Getadmin.vbs"
    DEL /f /q "%TEMP%\Getadmin.vbs" 2>NUL
    Exit /b
)

reg add "HKCU\SOFTWARE\Scooter Software\Beyond Compare 4\BcShellEx" /f /v SavedLeft /d "%~dp0BCompare.exe" >NUL

reg add "HKLM\SOFTWARE\Classes\*\shellex\ContextMenuHandlers\CirrusShellEx" /f /ve /d "{57FA2D12-D22D-490A-805A-5CB48E84F12A}" >NUL
reg add "HKLM\SOFTWARE\Classes\Folder\shellex\ContextMenuHandlers\CirrusShellEx" /f /ve /d "{57FA2D12-D22D-490A-805A-5CB48E84F12A}" >NUL
reg add "HKLM\SOFTWARE\Classes\lnkfile\shellex\ContextMenuHandlers\CirrusShellEx" /f /ve /d "{57FA2D12-D22D-490A-805A-5CB48E84F12A}" >NUL
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions\Approved" /f /v {57FA2D12-D22D-490A-805A-5CB48E84F12A} /d "Beyond Compare 4 Shell Extension" >NUL

reg add "HKLM\SOFTWARE\Classes\.bcss" /f /ve /d "BeyondCompare.Snapshot" >NUL
reg add "HKLM\SOFTWARE\Classes\.bcpkg" /f /ve /d "BeyondCompare.SettingsPackage" >NUL
reg add "HKLM\SOFTWARE\Classes\BeyondCompare.Snapshot" /f /ve /d "Beyond Compare Snapshot" >NUL
reg add "HKLM\SOFTWARE\Classes\BeyondCompare.Snapshot\DefaultIcon" /f /ve /d "%~dp0BCompare.exe,0" >NUL
reg add "HKLM\SOFTWARE\Classes\BeyondCompare.Snapshot\shell\open\command" /f /ve /d "\"%~dp0BCompare.exe\" \"%%1\"" >NUL
reg add "HKLM\SOFTWARE\Classes\BeyondCompare.SettingsPackage" /f /ve /d "Beyond Compare Settings Package" >NUL
reg add "HKLM\SOFTWARE\Classes\BeyondCompare.SettingsPackage\DefaultIcon" /f /ve /d "%~dp0BCompare.exe,0" >NUL
reg add "HKLM\SOFTWARE\Classes\BeyondCompare.SettingsPackage\shell\open\command" /f /ve /d "\"%~dp0BCompare.exe\" \"%%1\"" >NUL

reg add "HKLM\SOFTWARE\Classes\CLSID\{57FA2D12-D22D-490A-805A-5CB48E84F12A}\InProcServer32" /f /ve /d "%~dp0BCShellEx64.dll" >NUL
reg add "HKLM\SOFTWARE\Classes\CLSID\{57FA2D12-D22D-490A-805A-5CB48E84F12A}\InProcServer32" /f /v ThreadingModel /d "Apartment" >NUL

reg add "HKLM\SOFTWARE\Scooter Software\Beyond Compare\BcShellEx" /f /v ExePath /d "%~dp0BCompare.exe" >NUL
reg add "HKLM\SOFTWARE\Scooter Software\Beyond Compare 4\BcShellEx" /f /v ExePath /d "%~dp0BCompare.exe" >NUL
reg add "HKLM\SYSTEM\CurrentControlSet\Services\EventLog\Application\Beyond Compare 4" /f /v TypesSupported /t REG_DWORD /d "7" >NUL 
reg add "HKLM\SYSTEM\CurrentControlSet\Services\EventLog\Application\Beyond Compare 4" /f /v EventMessageFile /d "%~dp0BCompare.exe" >NUL 

ECHO.&ECHO 添加完成！创建快捷方式？
ECHO.&ECHO 是按任意键，否直接关闭！&PAUSE >NUL 2>NUL

mshta VBScript:Execute("Set a=CreateObject(""WScript.Shell""):Set b=a.CreateShortcut(a.SpecialFolders(""Desktop"") & ""\BCompare.lnk""):b.TargetPath=""%~dp0BCompare.exe"":b.WorkingDirectory=""%~dp0"":b.Save:close")

CLS &ECHO.&ECHO 完成！&PAUSE >NUL 2>NUL & EXIT