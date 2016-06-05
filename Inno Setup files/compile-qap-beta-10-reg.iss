#define MyAppName "Quick Access Popup"
#define MyAppNameLower "quickaccesspopup"
#define MyAppPublisher "Jean Lalonde"
#define MyAppURL "http://wwww.QuickAccessPopup.com"
#define MyAppExeName "QuickAccessPopup.exe"
#define FPImportVersionFileName "ImportFPsettings-1_0-32-bit.exe"
#define QAPmessengerVersionFileName "QAPmessenger-0_3-32-bit.exe"
#define QAPupdateIconsWin10 "QAPupdateIconsWin10-0_1-32-bit.exe"

#define MyAppVersion "v7.2.3.2 BETA"
#define MyVersionFileName "7_2_3_2-beta"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{BE9D760B-0D64-40BD-9F24-B5B8AB90131B}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppName}
DefaultGroupName={#MyAppName}
LicenseFile=C:\Dropbox\AutoHotkey\QuickAccessPopup\Inno Setup files\licence.txt
OutputDir=C:\Dropbox\AutoHotkey\QuickAccessPopup\build-beta\
OutputBaseFilename={#MyAppNameLower}-setup-beta
SetupIconFile=C:\Dropbox\AutoHotkey\QuickAccessPopup\build-beta\QuickAccessPopup-BETA-green-512.ico
Compression=lzma
SolidCompression=yes
ArchitecturesInstallIn64BitMode=x64
AppMutex={#MyAppName}Mutex
UsePreviousTasks=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "french"; MessagesFile: "compiler:Languages\French.isl"
Name: "german"; MessagesFile: "compiler:Languages\German.isl"
; Name: "dutch"; MessagesFile: "compiler:Languages\Dutch.isl"
; Name: "korean"; MessagesFile: "compiler:Languages\Korean.isl"
Name: "swedish"; MessagesFile: "compiler:Languages\Swedish.isl"
Name: "italian"; MessagesFile: "compiler:Languages\Italian.isl"
Name: "spanish"; MessagesFile: "compiler:Languages\Spanish.isl"
Name: "brazilportuguese"; MessagesFile: "compiler:Languages\BrazilianPortuguese.isl"
Name: "chinesetraditional"; MessagesFile: "compiler:Languages\ChineseTraditional.isl"
Name: "portuguese"; MessagesFile: "compiler:Languages\Portuguese.isl"
Name: "chinesesimplified"; MessagesFile: "compiler:Languages\ChineseSimplified.isl"

[Dirs]
; repository for files to be copied to "{userappdata}\{#MyAppName}" at first QAP execution with quickaccesspopup.ini and _temp subfolder
Name: "{commonappdata}\{#MyAppName}" 

[Files]
Source: "C:\Dropbox\AutoHotkey\QuickAccessPopup\build-beta\QuickAccessPopup-{#MyVersionFileName}-64-bit.exe"; DestDir: "{app}"; DestName: "QuickAccessPopup.exe"; Check: IsWin64; Flags: 64bit ignoreversion
Source: "C:\Dropbox\AutoHotkey\QuickAccessPopup\build-beta\QuickAccessPopup-{#MyVersionFileName}-32-bit.exe"; DestDir: "{app}"; DestName: "QuickAccessPopup.exe"; Check: "not IsWin64"; Flags: 32bit ignoreversion
Source: "C:\Dropbox\AutoHotkey\QuickAccessPopup\build-beta\{#FPImportVersionFileName}"; DestDir: "{app}"; DestName: "ImportFPsettings.exe"
Source: "C:\Dropbox\AutoHotkey\QuickAccessPopup\build-beta\{#QAPmessengerVersionFileName}"; DestDir: "{app}"; DestName: "QAPmessenger.exe"
Source: "C:\Dropbox\AutoHotkey\QuickAccessPopup\build-beta\{#QAPupdateIconsWin10}"; DestDir: "{app}"; DestName: "QAPupdateIconsWin10.exe"
; Source: "C:\Dropbox\AutoHotkey\QuickAccessPopup\build-beta\OSVersion.exe"; DestDir: "{app}"; DestName: "OSVersion.exe"
; Source: "C:\Dropbox\AutoHotkey\QuickAccessPopup\build-beta\QAPconnect.ini"; DestDir: "{commonappdata}\{#MyAppName}"; DestName: "QAPconnect.ini" -> now created by QAP from a default template
Source: "C:\Dropbox\AutoHotkey\QuickAccessPopup\build-beta\_do_not_remove_or_rename.txt"; DestDir: "{app}"; DestName: "_do_not_remove_or_rename.txt"; Flags: ignoreversion
Source: "C:\Dropbox\AutoHotkey\QuickAccessPopup\build-beta\QuickAccessPopup-BETA-green-512.ico"; DestDir: "{app}"; DestName: "QuickAccessPopup-BETA.ico"; Flags: ignoreversion
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[INI]
Filename: "{commonappdata}\{#MyAppName}\{#MyAppNameLower}-setup.ini"; Section: "Global"; Key: "LanguageCode"; String: "EN"; Languages: english
Filename: "{commonappdata}\{#MyAppName}\{#MyAppNameLower}-setup.ini"; Section: "Global"; Key: "LanguageCode"; String: "FR"; Languages: french
Filename: "{commonappdata}\{#MyAppName}\{#MyAppNameLower}-setup.ini"; Section: "Global"; Key: "LanguageCode"; String: "DE"; Languages: german
; Filename: "{commonappdata}\{#MyAppName}\{#MyAppNameLower}-setup.ini"; Section: "Global"; Key: "LanguageCode"; String: "NL"; Languages: dutch
; Filename: "{commonappdata}\{#MyAppName}\{#MyAppNameLower}-setup.ini"; Section: "Global"; Key: "LanguageCode"; String: "KO"; Languages: korean
Filename: "{commonappdata}\{#MyAppName}\{#MyAppNameLower}-setup.ini"; Section: "Global"; Key: "LanguageCode"; String: "SV"; Languages: swedish
Filename: "{commonappdata}\{#MyAppName}\{#MyAppNameLower}-setup.ini"; Section: "Global"; Key: "LanguageCode"; String: "IT"; Languages: italian
Filename: "{commonappdata}\{#MyAppName}\{#MyAppNameLower}-setup.ini"; Section: "Global"; Key: "LanguageCode"; String: "ES"; Languages: spanish
Filename: "{commonappdata}\{#MyAppName}\{#MyAppNameLower}-setup.ini"; Section: "Global"; Key: "LanguageCode"; String: "PT-BR"; Languages: brazilportuguese
Filename: "{commonappdata}\{#MyAppName}\{#MyAppNameLower}-setup.ini"; Section: "Global"; Key: "LanguageCode"; String: "ZH-TW"; Languages: chinesetraditional
Filename: "{commonappdata}\{#MyAppName}\{#MyAppNameLower}-setup.ini"; Section: "Global"; Key: "LanguageCode"; String: "PT"; Languages: portuguese
Filename: "{commonappdata}\{#MyAppName}\{#MyAppNameLower}-setup.ini"; Section: "Global"; Key: "LanguageCode"; String: "ZH-CN"; Languages: chinesesimplified
; Filename: "{commonappdata}\{#MyAppName}\{#MyAppNameLower}-setup.ini"; Section: "Global"; Key: "ExplorerContextMenus"; String: "1"; Tasks: enablecontextmenus

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; WorkingDir: "{commonappdata}\{#MyAppName}"
Name: "{group}\Import Folders Popup Settings"; Filename: "{app}\ImportFPsettings.exe"; WorkingDir: "{commonappdata}\{#MyAppName}"
Name: "{group}\Update QAP Icons from Window 7 to Windows 10"; Filename: "{app}\QAPupdateIconsWin10.exe"; WorkingDir: "{commonappdata}\{#MyAppName}"
Name: "{group}\OS Version Info"; Filename: "{app}\OSVersion.exe"
Name: "{group}\{cm:ProgramOnTheWeb,{#MyAppName}}"; Filename: "{#MyAppURL}";
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"

[Registry]
Root: HKCR; Subkey: "*\shell\Add File to Quick Access Popup menu"; ValueType: string; ValueName: ""; ValueData: "Add File to Quick Access Popup menu"; Flags: uninsdeletekey
Root: HKCR; Subkey: "*\shell\Add File to Quick Access Popup menu"; ValueType: string; ValueName: "Icon"; ValueData: "{app}\QuickAccessPopup.exe"
Root: HKCR; Subkey: "*\shell\Add File to Quick Access Popup menu\command"; ValueType: string; ValueName: ""; ValueData: """{app}\QAPmessenger.exe"" AddFile ""%1\"""

[Run]
Filename: "{app}\ImportFPsettings.exe"; Flags: runhidden waituntilterminated; WorkingDir: "{commonappdata}\{#MyAppName}"; Parameters: "/calledfromsetup"; Tasks: importfpsettings
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; WorkingDir: "{commonappdata}\{#MyAppName}"; Flags: waituntilidle postinstall skipifsilent

[CustomMessages]
ContextMenuTaskDescription=Enable Windows Explorer &Context Menus%n(Windows Registry script must be accepted at first QAP execution)

[Tasks]
; Name: enablecontextmenus; Description: "{cm:ContextMenuTaskDescription}"; Flags: checkedonce
Name: importfpsettings; Description: "Import &Folders Popup settings and favorites"; GroupDescription: "For users upgrading from Folders Popup"; Flags: checkedonce unchecked

[UninstallDelete]
Type: files; Name: "{userstartup}\{#MyAppName}.lnk"
