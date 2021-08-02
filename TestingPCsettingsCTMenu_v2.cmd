@echo Off

FOR /F "tokens=3" %%a IN ('REG query "HKLM\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "SystemUsesLightTheme" 2^>nul ^| FindStr /i "SystemUsesLightTheme" 2^>nul') DO set "QuerySystemUsesLightTheme=%%a"

IF EXIST "%SystemRoot%\System32\bootux.dll" SET "BootUXIcon=%SystemRoot%\System32\bootux.dll,-1005"
IF NOT DEFINED QuerySystemUsesLightTheme SET "BootUXIcon=SystemSettingsBroker.exe"

REG delete "HKCR\DesktopBackground\Shell\Settings" /f

REG add "HKCR\DesktopBackground\Shell\Settings" /v "Position" /t REG_SZ /d "Bottom" /f
REG add "HKCR\DesktopBackground\Shell\Settings" /v "Icon" /t REG_SZ /d "SystemSettingsBroker.exe" /f
REG add "HKCR\DesktopBackground\Shell\Settings" /v "MUIVerb" /t REG_SZ /d "@%SystemRoot%\system32\shell32.dll,-30618" /f
REG add "HKCR\DesktopBackground\Shell\Settings" /v "SubCommands" /t REG_SZ /d "" /f
REG add "HKCR\DesktopBackground\Shell\Settings" /v "SeparatorBefore" /t REG_SZ /d "" /f >NUL 2>&1
REG add "HKCR\DesktopBackground\Shell\Settings" /v "SeparatorAfter" /t REG_SZ /d "" /f >NUL 2>&1

REG add "HKCR\DesktopBackground\Shell\Settings\shell\01Settings" /v "Icon" /t REG_SZ /d "SystemSettingsBroker.exe" /f
REG add "HKCR\DesktopBackground\Shell\Settings\shell\01Settings" /v "MUIVerb" /t REG_SZ /d "@%SystemRoot%\system32\shell32.dll,-31312" /f
REG add "HKCR\DesktopBackground\Shell\Settings\shell\01Settings" /v "SettingsURI" /t REG_SZ /d "ms-settings:" /f
REG add "HKCR\DesktopBackground\Shell\Settings\shell\01Settings\command" /v "DelegateExecute" /t REG_SZ /d "{556FF0D6-A1EE-49E5-9FA4-90AE116AD744}" /f

REM System/Display
REG add "HKCR\DesktopBackground\Shell\Settings\shell\02System" /v "CommandFlags" /t REG_DWORD /d "32" /f
REG add "HKCR\DesktopBackground\Shell\Settings\shell\02System" /v "MUIVerb" /t REG_SZ /d "@%SystemRoot%\system32\shell32.dll,-8770" /f
REG add "HKCR\DesktopBackground\Shell\Settings\shell\02System" /v "SettingsURI" /t REG_SZ /d "ms-settings:display" /f
REG add "HKCR\DesktopBackground\Shell\Settings\shell\02System" /v "Icon" /t REG_SZ /d "%BootUXIcon%" /f
REG add "HKCR\DesktopBackground\Shell\Settings\shell\02System\command" /v "DelegateExecute" /t REG_SZ /d "{556FF0D6-A1EE-49E5-9FA4-90AE116AD744}" /f

REM Devices
REG add "HKCR\DesktopBackground\Shell\Settings\shell\03Devices" /v "MUIVerb" /t REG_SZ /d "@%SystemRoot%\system32\shell32.dll,-30611" /f
REG add "HKCR\DesktopBackground\Shell\Settings\shell\03Devices" /v "Icon" /t REG_SZ /d "%BootUXIcon%" /f
REG add "HKCR\DesktopBackground\Shell\Settings\shell\03Devices" /v "SettingsURI" /t REG_SZ /d "ms-settings:bluetooth" /f
REG add "HKCR\DesktopBackground\Shell\Settings\shell\03Devices\command" /v "DelegateExecute" /t REG_SZ /d "{556FF0D6-A1EE-49E5-9FA4-90AE116AD744}" /f

REM Network / Internet
REG add "HKCR\DesktopBackground\Shell\Settings\shell\04Network" /v "MUIVerb" /t REG_SZ /d "@%SystemRoot%\system32\shell32.dll,-32010" /f
REG add "HKCR\DesktopBackground\Shell\Settings\shell\04Network" /v "Icon" /t REG_SZ /d "%BootUXIcon%" /f
REG add "HKCR\DesktopBackground\Shell\Settings\shell\04Network" /v "SettingsURI" /t REG_SZ /d "ms-settings:network" /f
REG add "HKCR\DesktopBackground\Shell\Settings\shell\04Network\command" /v "DelegateExecute" /t REG_SZ /d "{556FF0D6-A1EE-49E5-9FA4-90AE116AD744}" /f

REM Appearence/Personalisation
REG add "HKCR\DesktopBackground\Shell\Settings\shell\05Personalization" /v "MUIVerb" /t REG_SZ /d "@%SystemRoot%\system32\shell32.dll,-32018" /f
REG add "HKCR\DesktopBackground\Shell\Settings\shell\05Personalization" /v "Icon" /t REG_SZ /d "%BootUXIcon%" /f
REG add "HKCR\DesktopBackground\Shell\Settings\shell\05Personalization" /v "SettingsURI" /t REG_SZ /d "ms-settings:personalization" /f
REG add "HKCR\DesktopBackground\Shell\Settings\shell\05Personalization\command" /v "DelegateExecute" /t REG_SZ /d "{556FF0D6-A1EE-49E5-9FA4-90AE116AD744}" /f

REM Apps / 21765 Application Data
REG add "HKCR\DesktopBackground\Shell\Settings\shell\06Apps" /v "MUIVerb" /t REG_SZ /d "@%SystemRoot%\system32\shell32.dll,-21765" /f
REG add "HKCR\DesktopBackground\Shell\Settings\shell\06Apps" /v "Icon" /t REG_SZ /d "%BootUXIcon%" /f
REG add "HKCR\DesktopBackground\Shell\Settings\shell\06Apps" /v "SettingsURI" /t REG_SZ /d "ms-settings:appsfeatures" /f
REG add "HKCR\DesktopBackground\Shell\Settings\shell\06Apps\command" /v "DelegateExecute" /t REG_SZ /d "{556FF0D6-A1EE-49E5-9FA4-90AE116AD744}" /f

REM Accounts
REG add "HKCR\DesktopBackground\Shell\Settings\shell\07Accounts" /v "MUIVerb" /t REG_SZ /d "@%SystemRoot%\system32\shell32.dll,-24313" /f
REG add "HKCR\DesktopBackground\Shell\Settings\shell\07Accounts" /v "Icon" /t REG_SZ /d "%BootUXIcon%" /f
REG add "HKCR\DesktopBackground\Shell\Settings\shell\07Accounts" /v "SettingsURI" /t REG_SZ /d "ms-settings:yourinfo" /f
REG add "HKCR\DesktopBackground\Shell\Settings\shell\07Accounts\command" /v "DelegateExecute" /t REG_SZ /d "{556FF0D6-A1EE-49E5-9FA4-90AE116AD744}" /f

REM Time/Language
REG add "HKCR\DesktopBackground\Shell\Settings\shell\08Time" /v "MUIVerb" /t REG_SZ /d "@%SystemRoot%\system32\shell32.dll,-32016" /f
REG add "HKCR\DesktopBackground\Shell\Settings\shell\08Time" /v "Icon" /t REG_SZ /d "%BootUXIcon%" /f
REG add "HKCR\DesktopBackground\Shell\Settings\shell\08Time" /v "SettingsURI" /t REG_SZ /d "ms-settings:dateandtime" /f
REG add "HKCR\DesktopBackground\Shell\Settings\shell\08Time\command" /v "DelegateExecute" /t REG_SZ /d "{556FF0D6-A1EE-49E5-9FA4-90AE116AD744}" /f

REM Gaming - 30579 (games) / 
REG add "HKCR\DesktopBackground\Shell\Settings\shell\09Gaming" /v "MUIVerb" /t REG_SZ /d "XBox" /f
REG add "HKCR\DesktopBackground\Shell\Settings\shell\09Gaming" /v "Icon" /t REG_SZ /d "%BootUXIcon%" /f
REG add "HKCR\DesktopBackground\Shell\Settings\shell\09Gaming" /v "SettingsURI" /t REG_SZ /d "ms-settings:gaming-gamebar" /f
REG add "HKCR\DesktopBackground\Shell\Settings\shell\09Gaming\command" /v "DelegateExecute" /t REG_SZ /d "{556FF0D6-A1EE-49E5-9FA4-90AE116AD744}" /f

REM Ease of Access (win 21760) (32000)
REG add "HKCR\DesktopBackground\Shell\Settings\shell\10Ease" /v "MUIVerb" /t REG_SZ /d "@%SystemRoot%\system32\shell32.dll,-32000" /f
REG add "HKCR\DesktopBackground\Shell\Settings\shell\10Ease" /v "Icon" /t REG_SZ /d "%BootUXIcon%" /f
REG add "HKCR\DesktopBackground\Shell\Settings\shell\10Ease" /v "SettingsURI" /t REG_SZ /d "ms-settings:easeofaccess-narrator" /f
REG add "HKCR\DesktopBackground\Shell\Settings\shell\10Ease\command" /v "DelegateExecute" /t REG_SZ /d "{556FF0D6-A1EE-49E5-9FA4-90AE116AD744}" /f

REM Privacy / 9728 = Restrictions
REG add "HKCR\DesktopBackground\Shell\Settings\shell\12Privacy" /v "MUIVerb" /t REG_SZ /d "@%SystemRoot%\system32\shell32.dll,-9728" /f
REG add "HKCR\DesktopBackground\Shell\Settings\shell\12Privacy" /v "Icon" /t REG_SZ /d "%BootUXIcon%" /f
REG add "HKCR\DesktopBackground\Shell\Settings\shell\12Privacy" /v "SettingsURI" /t REG_SZ /d "ms-settings:privacy" /f
REG add "HKCR\DesktopBackground\Shell\Settings\shell\12Privacy\command" /v "DelegateExecute" /t REG_SZ /d "{556FF0D6-A1EE-49E5-9FA4-90AE116AD744}" /f

REM Update/Security
REG add "HKCR\DesktopBackground\Shell\Settings\shell\13Update" /v "MUIVerb" /t REG_SZ /d "@%SystemRoot%\system32\shell32.dll,-22068" /f
REG add "HKCR\DesktopBackground\Shell\Settings\shell\13Update" /v "Icon" /t REG_SZ /d "%BootUXIcon%" /f
REG add "HKCR\DesktopBackground\Shell\Settings\shell\13Update" /v "SettingsURI" /t REG_SZ /d "ms-settings:windowsupdate" /f
REG add "HKCR\DesktopBackground\Shell\Settings\shell\13Update\command" /v "DelegateExecute" /t REG_SZ /d "{556FF0D6-A1EE-49E5-9FA4-90AE116AD744}" /f

