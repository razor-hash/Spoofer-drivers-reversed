@echo off

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"

cls



reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BEDaisy" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BEDaisy" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BEDaisy\Instances" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BEDaisy\Instances\BEDaisy Instance" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BEDaisy\Instances" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BEService" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{B0FDA062-7581-4D67-B085-C4E7C358037F}_is1" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BEService\Security" /f
reg delete "HKEY_CURRENT_USER\SOFTWARE\Battlestate Games" /f
reg delete "HKEY_CURRENT_USER\SOFTWARE\Battlestate Games\EscapeFromTarkov" /f
reg delete "HKEY_CURRENT_USER\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\Shell\MuiCache" /f
reg delete "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FeatureUsage\AppSwitched" /f
reg delete "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FeatureUsage\ShowJumpView" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\EscapeFromTarkov" /f
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Roaming\Battlestate Games\Escape from Tarkov\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\LocalLow\Battlestate Games\Escape from Tarkov\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Local\Battlestate Games\BsgLauncher\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Roaming\Battlestate Games\BsgLauncher\*.*"
del /s /f /a:h /a:a /q "%systemdrive%\Users\%username%\AppData\Roaming\Battlestate Games*.*"
del /f /s /q "%systemdrive%\Program Files (x86)\Common Files\BEService.exe*.*"
del /f /s /q "%systemdrive%\Program Files (x86)\Common Files\BEService_eft.exe*.*"
del /f /s /q "x:\%localappdata%\Temp"
RMDIR /S /Q "%HOMEDRIVE%\Battlestate Games"
RMDIR /S /Q "D:\Battlestate Games"
RMDIR /S /Q "E:\Battlestate Games"
RMDIR /S /Q "%systemdrive%\Program Files (x86)\Common Files\BattlEye"
RMDIR /S /Q "%systemdrive%\Users\%username%\AppData\Roaming\Battlestate Games"
RMDIR /S /Q "%systemdrive%\Users\%username%\AppData\LocalLow\Battlestate Games"
RMDIR /S /Q "%systemdrive%\Users\%username%\AppData\Local\Battlestate Games"
RMDIR /S /Q "C:\Users\%username%\AppData\Local\Microsoft\Windows\Temporary Internet Files"
RMDIR /S /Q "C:\Windows\logs\CBS"
RMDIR /S /Q "C:\Windows\Temp"
RMDIR /S /Q "C:\Windows\System32\config\systemprofile\AppData\Local\ScreenTime"
RMDIR /S /Q "C:\Windows\System32\config\systemprofile\AppData\Local\Microsoft\Vault\UserProfileRoaming"
RMDIR /S /Q "C:\Windows\System32\config\systemprofile\AppData\Local\D3DSCache"
RMDIR /S /Q "C:\Windows\System32\config\TxR"
RMDIR /S /Q "C:\Windows\System32\WDI\LogFiles\StartpInfo"
RMDIR /S /Q "C:\Windows\System32\WDI\LogFiles"
RMDIR /S /Q "C:\Windows\SoftwareDistribution\"
RMDIR /S /Q "C:\Windows\UserviceProfiles\NetworkService\AppData\Local\Microsoft\Windows\deliveryOptimization\Logs"
RMDIR /S /Q "C:\Windows\UserviceProfiles\NetworkService\AppData\Local\Microsoft\Windows\DeliveryOptimization\State"
RMDIR /S /Q "C:\Users\%username%\AppData\Roaming\Microsoft\Protect"
RMDIR /S /Q "C:\Users\%username%\AppData\Local\VirtalStore"
RMDIR /S /Q "C:\Users\%username%\AppData\Local\UnrealEngine"
RMDIR /S /Q "C:\Users\%username%\AppData\Local\Temp"
RMDIR /S /Q "C:\Users\%username%\AppData\Local\Packages\Microsoft.Windows.Search_cw5n1h2txyewy\LocalState\DeviceSearchCache"
RMDIR /S /Q "C:\Users\%username%\AppData\Local\Packages\Microsoft.Windows.Search_cw5n1h2txyewy\LocalState\ConstraintIndex"
RMDIR /S /Q "C:\Users\%username%\AppData\Local\Microsoft\Windows\WebCache"
RMDIR /S /Q "C:\Users\%username%\AppData\Local\Microsoft\Windows\WER"
RMDIR /S /Q "C:\Users\%username%\AppData\Local\Microsoft\Windows\INetCookies"
RMDIR /S /Q "C:\Users\%username%\AppData\Local\Microsoft\Windows\INetCache"
RMDIR /S /Q "C:\Users\%username%\AppData\Local\Microsoft\Windows\IEDownloadHistory"
RMDIR /S /Q "C:\Users\%username%\AppData\Local\Microsoft\Windows\IECompataCache"
RMDIR /S /Q "C:\Users\%username%\AppData\Local\Microsoft\Windows\IECompatCache"
RMDIR /S /Q "C:\Users\%username%\AppData\Local\Microsoft\Windows\Caches"
RMDIR /S /Q "C:\Users\%username%\AppData\Local\Microsoft\Terminal Server Client\Cache"
RMDIR /S /Q "C:\Users\%username%\AppData\Local\Microsoft\Internet Explorer\CacheStorage"
RMDIR /S /Q "C:\Users\%username%\AppData\Local\D3DSCache"
RMDIR /S /Q "C:\Users\%username%\AppData\Local\CrashDmps"
RMDIR /S /Q "C:\Users\%username%\AppData\Local\ConnectedDevicesPlatform"
RMDIR /S /Q "C:\ProgramData\NVIDIA Corporation\NV_Cache"
RMDIR /S /Q "C:\ProgramData\NVIDIA Corporation\Drs\nvAppTimestamps"
RMDIR /S /Q "C:\ProgramData\Microsoft\Windows\WER"
RMDIR /S /Q "C:\PerfLogs"
RMDIR /S /Q "C:\Documents and Settings\%username%\AppData\Local\Application Data\Microsoft\Windows\Caches"
RMDIR /S /Q "%localappdata%\Microsoft\Windows\Caches"
del /s /q "C:\Windows\System32\restore\MachineGuid.txt"
del /s /q "%systemdrive%\Users\Public\Libraries\collection.dat"
RMDIR /S /Q "%systemdrive%\System Volume Information\IndexerVolumeGuid"
del /s /q "%systemdrive%\System Volume Information\WPSettings.dat"
del /s /q "%systemdrive%\System Volume Information\tracking.log"
RMDIR /S /Q "%systemdrive%\ProgramData\Microsoft\Windows\WER"
RMDIR /S /Q "%systemdrive%\Users\Public\Shared Files"
del /s /q "%systemdrive%\Windows\INF\setpapi.dev.log"
del /s /q "%systemdrive%\Windows\INF\setpapi.setp.log"
RMDIR /S /Q "%systemdrive%\Users\Public\Libraries"
RMDIR /S /Q "%systemdrive%\MSOCache"
del /s /q "%systemdrive%\ProgramData\ntser.pol"
del /s /q "%systemdrive%\Users\Defalt\NTSER.DAT"
del /s /q "%systemdrive%\Recovery\ntser.sys"
del /s /q "%systemdrive%\desktop.ini"
netsh winsock reset

cls

exit