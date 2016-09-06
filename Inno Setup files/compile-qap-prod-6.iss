#define MyAppName "Quick Access Popup"
#define MyAppNameNoSpace "QuickAccessPopup"
#define MyAppNameLower "quickaccesspopup"
#define MyAppPublisher "Jean Lalonde"
#define MyAppURL "http://www.QuickAccessPopup.com"
#define MyAppExeName "QuickAccessPopup.exe"
#define FPImportVersionFileName "ImportFPsettings-1_0-32-bit.exe"
#define QAPmessengerVersionFileName "QAPmessenger-1_1-32-bit.exe"
#define QAPupdateIconsWin10 "QAPupdateIconsWin10-1_1-32-bit.exe"

#define MyAppVersion "v7.4.3"
#define MyVersionFileName "7_4_3"

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
LicenseFile=C:\Dropbox\AutoHotkey\QuickAccessPopup\Inno Setup files\license.txt
OutputDir=C:\Dropbox\AutoHotkey\QuickAccessPopup\build\
OutputBaseFilename={#MyAppNameLower}-setup
SetupIconFile=C:\Dropbox\AutoHotkey\QuickAccessPopup\build\QuickAccessPopup-512.ico
Compression=lzma
SolidCompression=yes
ArchitecturesInstallIn64BitMode=x64
; AppMutex={#MyAppNameNoSpace}Mutex -> do not use AppMutex - Use instead automatic closing when install and [Code] section when uninstall
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
Source: "C:\Dropbox\AutoHotkey\QuickAccessPopup\build\QuickAccessPopup-{#MyVersionFileName}-64-bit.exe"; DestDir: "{app}"; DestName: "QuickAccessPopup.exe"; Check: IsWin64; Flags: 64bit ignoreversion
Source: "C:\Dropbox\AutoHotkey\QuickAccessPopup\build\QuickAccessPopup-{#MyVersionFileName}-32-bit.exe"; DestDir: "{app}"; DestName: "QuickAccessPopup.exe"; Check: "not IsWin64"; Flags: 32bit ignoreversion
Source: "C:\Dropbox\AutoHotkey\QuickAccessPopup\build\{#FPImportVersionFileName}"; DestDir: "{app}"; DestName: "ImportFPsettings.exe"; Flags: ignoreversion
Source: "C:\Dropbox\AutoHotkey\QuickAccessPopup\build-beta\{#QAPmessengerVersionFileName}"; DestDir: "{app}"; DestName: "QAPmessenger.exe"; Flags: ignoreversion
Source: "C:\Dropbox\AutoHotkey\QuickAccessPopup\build-beta\{#QAPupdateIconsWin10}"; DestDir: "{app}"; DestName: "QAPupdateIconsWin10.exe"; Flags: ignoreversion
; Source: "C:\Dropbox\AutoHotkey\QuickAccessPopup\build\OSVersion.exe"; DestDir: "{app}"; DestName: "OSVersion.exe"; Flags: ignoreversion
; Source: "C:\Dropbox\AutoHotkey\QuickAccessPopup\build\QAPconnect.ini"; DestDir: "{commonappdata}\{#MyAppName}"; DestName: "QAPconnect.ini" -> now created by QAP from a default template
Source: "C:\Dropbox\AutoHotkey\QuickAccessPopup\build\_do_not_remove_or_rename.txt"; DestDir: "{app}"; DestName: "_do_not_remove_or_rename.txt"; Flags: ignoreversion
Source: "C:\Dropbox\AutoHotkey\QuickAccessPopup\build\QuickAccessPopup-512.ico"; DestDir: "{app}"; DestName: "QuickAccessPopup.ico"; Flags: ignoreversion
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

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; WorkingDir: "{commonappdata}\{#MyAppName}"
Name: "{group}\Import Folders Popup Settings"; Filename: "{app}\ImportFPsettings.exe"; WorkingDir: "{commonappdata}\{#MyAppName}"
Name: "{group}\Update QAP Icons from Window 7 to Windows 10"; Filename: "{app}\QAPupdateIconsWin10.exe"; WorkingDir: "{commonappdata}\{#MyAppName}"
; Name: "{group}\OS Version Info"; Filename: "{app}\OSVersion.exe"
Name: "{group}\{cm:ProgramOnTheWeb,{#MyAppName}}"; Filename: "{#MyAppURL}";
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"

[Registry]
; ADD FILE
Root: HKCR; Subkey: "*\shell\Add File to Quick Access Popup menu"; ValueType: string; ValueName: ""; ValueData: "Add File to Quick Access Popup menu"; Flags: uninsdeletekey
Root: HKCR; Subkey: "*\shell\Add File to Quick Access Popup menu"; ValueType: string; ValueName: "Icon"; ValueData: """{app}\QuickAccessPopup.exe"""
Root: HKCR; Subkey: "*\shell\Add File to Quick Access Popup menu\command"; ValueType: string; ValueName: ""; ValueData: """{app}\QAPmessenger.exe"" AddFile ""%1"""

; ADD FILE EXPRESS
Root: HKCR; Subkey: "*\shell\Add File to Quick Access Popup menu Express"; ValueType: string; ValueName: ""; ValueData: "Add File to Quick Access Popup menu Express"; Flags: uninsdeletekey
Root: HKCR; Subkey: "*\shell\Add File to Quick Access Popup menu Express"; ValueType: string; ValueName: "Icon"; ValueData: """{app}\QuickAccessPopup.exe"""
Root: HKCR; Subkey: "*\shell\Add File to Quick Access Popup menu Express"; ValueType: string; ValueName: "Extended"; ValueData: ""
Root: HKCR; Subkey: "*\shell\Add File to Quick Access Popup menu Express\command"; ValueType: string; ValueName: ""; ValueData: """{app}\QAPmessenger.exe"" AddFileXpress ""%1"""

; ADD FOLDER
Root: HKCR; Subkey: "Folder\shell\Add Folder to Quick Access Popup menu"; ValueType: string; ValueName: ""; ValueData: "Add Folder to Quick Access Popup menu"; Flags: uninsdeletekey
Root: HKCR; Subkey: "Folder\shell\Add Folder to Quick Access Popup menu"; ValueType: string; ValueName: "Icon"; ValueData: """{app}\QuickAccessPopup.exe"""
Root: HKCR; Subkey: "Folder\shell\Add Folder to Quick Access Popup menu\command"; ValueType: string; ValueName: ""; ValueData: """{app}\QAPmessenger.exe"" AddFolder ""%1"""

; ADD FOLDER EXPRESS
Root: HKCR; Subkey: "Folder\shell\Add Folder to Quick Access Popup menu Express"; ValueType: string; ValueName: ""; ValueData: "Add Folder to Quick Access Popup menu Express"; Flags: uninsdeletekey
Root: HKCR; Subkey: "Folder\shell\Add Folder to Quick Access Popup menu Express"; ValueType: string; ValueName: "Icon"; ValueData: """{app}\QuickAccessPopup.exe"""
Root: HKCR; Subkey: "Folder\shell\Add Folder to Quick Access Popup menu Express"; ValueType: string; ValueName: "Extended"; ValueData: ""
Root: HKCR; Subkey: "Folder\shell\Add Folder to Quick Access Popup menu Express\command"; ValueType: string; ValueName: ""; ValueData: """{app}\QAPmessenger.exe"" AddFolderXpress ""%1"""

; DESKTOP SHOW MENU 
Root: HKCR; Subkey: "DesktopBackground\shell\Show Quick Access Popup menu"; ValueType: string; ValueName: ""; ValueData: "Show Quick Access Popup menu"; Flags: uninsdeletekey
Root: HKCR; Subkey: "DesktopBackground\shell\Show Quick Access Popup menu"; ValueType: string; ValueName: "Icon"; ValueData: """{app}\QuickAccessPopup.exe"""
Root: HKCR; Subkey: "DesktopBackground\shell\Show Quick Access Popup menu\command"; ValueType: string; ValueName: ""; ValueData: "{app}\QAPmessenger.exe ShowMenuLaunch"

; DESKTOP SHOW ALTERNATIVE MENU
Root: HKCR; Subkey: "DesktopBackground\shell\Show Quick Access Popup Alternative menu"; ValueType: string; ValueName: ""; ValueData: "Show Quick Access Popup Alternative menu"; Flags: uninsdeletekey
Root: HKCR; Subkey: "DesktopBackground\shell\Show Quick Access Popup Alternative menu"; ValueType: string; ValueName: "Icon"; ValueData: """{app}\QuickAccessPopup.exe"""
Root: HKCR; Subkey: "DesktopBackground\shell\Show Quick Access Popup Alternative menu"; ValueType: string; ValueName: "Extended"; ValueData: ""
Root: HKCR; Subkey: "DesktopBackground\shell\Show Quick Access Popup Alternative menu\command"; ValueType: string; ValueName: ""; ValueData: """{app}\QAPmessenger.exe"" ShowMenuAlternative"

; FOLDER BACKGROUND SHOW MENU
Root: HKCR; Subkey: "Directory\Background\shell\Show Quick Access Popup menu"; ValueType: string; ValueName: ""; ValueData: "Show Quick Access Popup menu"; Flags: uninsdeletekey
Root: HKCR; Subkey: "Directory\Background\shell\Show Quick Access Popup menu"; ValueType: string; ValueName: "Icon"; ValueData: """{app}\QuickAccessPopup.exe"""
Root: HKCR; Subkey: "Directory\Background\shell\Show Quick Access Popup menu\command"; ValueType: string; ValueName: ""; ValueData: """{app}\QAPmessenger.exe"" ShowMenuNavigate"

; FOLDER BACKGROUND SHOW ALTERNATIVE MENU
Root: HKCR; Subkey: "Directory\Background\shell\Show Quick Access Popup Alternative menu"; ValueType: string; ValueName: ""; ValueData: "Show Quick Access Popup Alternative menu"; Flags: uninsdeletekey
Root: HKCR; Subkey: "Directory\Background\shell\Show Quick Access Popup Alternative menu"; ValueType: string; ValueName: "Icon"; ValueData: """{app}\QuickAccessPopup.exe"""
Root: HKCR; Subkey: "Directory\Background\shell\Show Quick Access Popup Alternative menu"; ValueType: string; ValueName: "Extended"; ValueData: ""
Root: HKCR; Subkey: "Directory\Background\shell\Show Quick Access Popup Alternative menu\command"; ValueType: string; ValueName: ""; ValueData: """{app}\QAPmessenger.exe"" ShowMenuAlternative"

; FOLDER BACKGROUND ADD FOLDER
Root: HKCR; Subkey: "Directory\Background\shell\Add Folder to Quick Access Popup menu"; ValueType: string; ValueName: ""; ValueData: "Add Folder to Quick Access Popup menu"; Flags: uninsdeletekey
Root: HKCR; Subkey: "Directory\Background\shell\Add Folder to Quick Access Popup menu"; ValueType: string; ValueName: "Icon"; ValueData: """{app}\QuickAccessPopup.exe"""
Root: HKCR; Subkey: "Directory\Background\shell\Add Folder to Quick Access Popup menu\command"; ValueType: string; ValueName: ""; ValueData: """{app}\QAPmessenger.exe"" AddFolder ""%V"""

; FOLDER BACKGROUND ADD FOLDER EXPRESS
Root: HKCR; Subkey: "Directory\Background\shell\Add Folder to Quick Access Popup menu Express"; ValueType: string; ValueName: ""; ValueData: "Add Folder to Quick Access Popup menu Express"; Flags: uninsdeletekey
Root: HKCR; Subkey: "Directory\Background\shell\Add Folder to Quick Access Popup menu Express"; ValueType: string; ValueName: "Icon"; ValueData: """{app}\QuickAccessPopup.exe"""
Root: HKCR; Subkey: "Directory\Background\shell\Add Folder to Quick Access Popup menu Express"; ValueType: string; ValueName: "Extended"; ValueData: ""
Root: HKCR; Subkey: "Directory\Background\shell\Add Folder to Quick Access Popup menu Express\command"; ValueType: string; ValueName: ""; ValueData: """{app}\QAPmessenger.exe"" AddFolderXpress ""%V"""

[Run]
Filename: "{app}\ImportFPsettings.exe"; Flags: runhidden waituntilterminated; WorkingDir: "{commonappdata}\{#MyAppName}"; Parameters: "/calledfromsetup"; Tasks: importfpsettings
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; WorkingDir: "{commonappdata}\{#MyAppName}"; Flags: waituntilidle postinstall skipifsilent
Filename: "https://www.generosity.com/fundraisers/stop-malware-false-alerts-against-my-freeware/"; Description: "&HELP me STOP malware false alerts when installing QAP"; Flags: postinstall shellexec

[Tasks]
Name: importfpsettings; Description: "Import &Folders Popup settings and favorites"; Flags: checkedonce unchecked

[UninstallDelete]
Type: files; Name: "{userstartup}\{#MyAppName}.lnk"

[Code]
function IsProcessRunning(FileName: String): Boolean;
var
  objSWbemLocator, objSWbemServices: Variant;
begin
  try
    objSWbemLocator := CreateOleObject('WbemScripting.SWbemLocator');
  except
    ShowExceptionMessage;
    Exit;
  end;
  objSWbemServices := objSWbemLocator.ConnectServer();
  objSWbemServices.Security_.ImpersonationLevel := 3;
  Result := (objSWbemServices.ExecQuery('SELECT * FROM Win32_Process WHERE Name="' + FileName + '"').Count > 0);
end;

function InitializeUninstall(): Boolean;
var
  ResultCode: Integer;
begin
  Result := True;
  while IsProcessRunning('{#MyAppExeName}') do begin
    case MsgBox('{#MyAppName} must be closed before uninstall'+#13#13+'Press OK to close it automatically or CANCEL to close it manually.', mbError, MB_OKCANCEL) of
      IDCANCEL:
      begin
        Result := False;
        Break;
      end;
      IDOK:
      begin
        Exec(ExpandConstant('{cmd}'), '/C taskkill /im "{#MyAppExeName}" /f', '', SW_HIDE, ewWaitUntilTerminated, ResultCode);
        if ResultCode = 0 then
        begin
          Result := True;
        end
        else
        begin
          Result := False;
          MsgBox('An error occurred while closing {#MyAppExeName} process.', mbError, MB_OK);
        end;
      end;
    end;
  end;
end;
