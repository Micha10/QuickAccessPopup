;
; DO NOT RUN FROM INNO SETUP EDITOR
; THIS SCRIPT REQUIRES ENVIRONMENT VARIABLES FROM BATCH
; C:\Dropbox\AutoHotkey\QuickAccessPopup\Setup Script files\Compile-v8.bat
;

#define MyBetaProd GetEnv('QAPBETAPROD')
#define MyAppVersion GetEnv('QAPVERSIONTEXT') ; exemple "v1.2.3.4 BETA"
#define MyVersionFileName GetEnv('QAPVERSIONFILE') ; exemple "1_2_3_4 ou 1_2_3_4-beta"

#define MyAppName "Quick Access Popup"
#define MyAppNameNoSpace "QuickAccessPopup"
#define MyAppNameLower "quickaccesspopup"
#define MyAppPublisher "Jean Lalonde"
#define MyAppURL "http://www.QuickAccessPopup.com"
#define MyAppExeName "QuickAccessPopup.exe"
#define FPImportVersionFileName "ImportFPsettings-1_0-32-bit.exe"
#define QAPmessengerVersionFileName "QAPmessenger-1_1-32-bit.exe"
#define JLdir "JeanLalonde"
#define JLicons "JLicons-1_2.dll"

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
LicenseFile=C:\Dropbox\AutoHotkey\QuickAccessPopup\Distribution-files\license.txt
OutputDir=C:\temp\InnoSetup-OutputDir\
OutputBaseFilename={#MyAppNameLower}-setup{#MyBetaProd}
SetupIconFile=C:\Dropbox\AutoHotkey\QuickAccessPopup\Distribution-files\iconQAP{#MyBetaProd}.ico
Compression=lzma
SolidCompression=yes
ArchitecturesInstallIn64BitMode=x64
; AppMutex={#MyAppNameNoSpace}Mutex -> do not use AppMutex - Use instead automatic closing when install and [Code] section when uninstall
; DisableWelcomePage=yes -> keep default and display (make it is displayed)
DisableWelcomePage=no
; DisableReadyPage=yes -> keep default and display
; display Dir page only at first install but show dir on ready page
DisableDirPage=auto
AlwaysShowDirOnReadyPage=yes
; display Group page only at first install but show group on ready page
DisableProgramGroupPage=auto
AlwaysShowGroupOnReadyPage=yes
SignTool=JeanLalondeCustom sign /t http://timestamp.digicert.com /a $f

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
Source: "C:\Dropbox\AutoHotkey\QuickAccessPopup\build-v8{#MyBetaProd}\QuickAccessPopup-64-bit.exe"; DestDir: "{app}"; DestName: "QuickAccessPopup.exe"; Check: IsWin64; Flags: 64bit ignoreversion signonce
Source: "C:\Dropbox\AutoHotkey\QuickAccessPopup\build-v8{#MyBetaProd}\QuickAccessPopup-32-bit.exe"; DestDir: "{app}"; DestName: "QuickAccessPopup.exe"; Check: "not IsWin64"; Flags: 32bit ignoreversion signonce
Source: "C:\Dropbox\AutoHotkey\QuickAccessPopup\Distribution-files\{#FPImportVersionFileName}"; DestDir: "{app}"; DestName: "ImportFPsettings.exe"; Flags: ignoreversion signonce
Source: "C:\Dropbox\AutoHotkey\QuickAccessPopup\Distribution-files\{#QAPmessengerVersionFileName}"; DestDir: "{app}"; DestName: "QAPmessenger.exe"; Flags: ignoreversion signonce
Source: "C:\Dropbox\AutoHotkey\QuickAccessPopup\Distribution-files\Setup-Only\_do_not_remove_or_rename.txt"; DestDir: "{app}"; DestName: "_do_not_remove_or_rename.txt"; Flags: ignoreversion
Source: "C:\Dropbox\AutoHotkey\QuickAccessPopup\Distribution-files\iconQAP.ico"; DestDir: "{app}"; DestName: "QuickAccessPopup.ico"; Flags: ignoreversion
Source: "C:\Dropbox\AutoHotkey\QuickAccessPopup\Distribution-files\{#JLicons}"; DestDir: "{commonappdata}\{#JLdir}"; DestName: "JLicons.dll"; Flags: sharedfile ignoreversion signonce
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
Name: "{group}\{cm:ProgramOnTheWeb,{#MyAppName}}"; Filename: "{#MyAppURL}";
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"

[Registry]
; APP PATH
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\{#MyAppExeName}"; ValueType: string; ValueName: ""; ValueData: "{app}\{#MyAppExeName}"; Flags: uninsdeletekey
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\{#MyAppExeName}"; ValueType: string; ValueName: "Path"; ValueData: "{app}"; Flags: uninsdeletekey

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
Filename: "{app}\{#MyAppExeName}"; WorkingDir: "{commonappdata}\{#MyAppName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: waituntilidle postinstall skipifsilent
Filename: "{app}\ImportFPsettings.exe"; WorkingDir: "{commonappdata}\{#MyAppName}"; Parameters: "/calledfromsetup"; Tasks: importfpsettings; Flags: runhidden waituntilterminated
Filename: "https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=TE8TR28QKM3Z8"; Description: "&HELP me pay EXPENSES for making QAP (Paypal account or credit cards)"; Flags: postinstall shellexec unchecked
Filename: "https://www.patreon.com/JeanLalonde"; Description: "&PATRON my work with monthly micro-donations (starting at only $1)"; Flags: postinstall shellexec unchecked

[Tasks]
Name: importfpsettings; Description: "Import &Folders Popup settings and favorites"; Flags: unchecked

[UninstallDelete]
Type: files; Name: "{userstartup}\{#MyAppNameLower}.lnk"

[Code]
function ShouldSkipPage(PageID: Integer): Boolean;
begin
  // if the page that is asked to be skipped is the licence page, then...
  if (PageID = wpLicense) or (PageID = wpSelectTasks) then
  begin
    // if the app was already installed, skip the page
    Result := (Length(WizardForm.PrevAppDir) > 0);
  end
  else
  begin
    // do not skip other pages (not necessary, but safer)
    Result := False;
  end;
end;

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
