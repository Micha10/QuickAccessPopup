;===============================================
/*

Quick Access Popup Messenger
Written using AutoHotkey_L v1.1.09.03+ (http://ahkscript.org/)
By Jean Lalonde (JnLlnd on AHKScript.org forum)
	
DESCRIPTION

Called from Explorer context menus to send messages to QAP in order to launch various actions like:
- add the selected folder to favorites (message "AddFolder")
- add the selected file to favorites (message "AddFile")
- add the selected folder to favorites in express mode (message "AddFolderXpress")
- add the selected file tofavorites in express mode (message "AddFileXpress")

HISTORY
=======

Version: 1.1 BETA (2016-09-01)
- addig diagnostic code activated by value DiagMode in section Global of QAP ini file
- find the working directory to read the QAP ini file and write its diag file to this directory

Version: 1.0 (2016-06-20)
- small adjustment to prevent the cursor to shortly turn to wait image when showing menu from Desktop background

Version: 0.4 beta (2016-06-06)
- check if QAP is running before sending message; if not display error message
- improved message if QAPmessenger is launched directly

Version: 0.3 beta (2016-05-24)
- improve version number and branch mangement

Version: 0.2 beta (2016-04-29)
- check for result 0xFFFF flagging an open settings window in QAP

Version: 0.1 beta (2016-04-25)
- initial alpha test release
- implement message "AddFolder", "AddFile", "AddFolderXpress" and "AddFileXpress"
- manage result codes sent by QAP: 1 for success, FAIL or 0 if an error occurred

*/ 
;========================================================================================================================
; --- COMPILER DIRECTIVES ---
;========================================================================================================================

; Doc: http://fincs.ahk4.net/Ahk2ExeDirectives.htm
; Note: prefix comma with `

;@Ahk2Exe-SetName QAP Messenger
;@Ahk2Exe-SetDescription Send messages to Quick Access Popup
;@Ahk2Exe-SetVersion 1.0
;@Ahk2Exe-SetOrigFilename QAPmessenger.exe


;========================================================================================================================
; INITIALIZATION
;========================================================================================================================

#NoEnv
#SingleInstance force
#KeyHistory 0
ListLines, Off

g_strAppNameText := "Quick Access Popup Messenger"
g_strAppNameFile := "QAPmessenger"
g_strAppVersion := "1.1"
g_strAppVersionBranch := "beta"
g_strAppVersionLong := "v" . g_strAppVersion . (g_strAppVersionBranch <> "prod" ? " " . g_strAppVersionBranch : "")
g_stTargetAppTitle := "Quick Access Popup ahk_class JeanLalonde.ca"
g_stTargetAppTitleDev := "Quick Access Popup ahk_class AutoHotkeyGUI"
g_stTargetAppName := "Quick Access Popup"
g_strQAPNameFile := "QuickAccessPopup"

gosub, SetQAPWorkingDirectory

; Force A_WorkingDir to A_ScriptDir if uncomplied (development environment)
;@Ahk2Exe-IgnoreBegin
; Start of code for development environment only - won't be compiled
; see http://fincs.ahk4.net/Ahk2ExeDirectives.htm
SetWorkingDir, %A_ScriptDir%
ListLines, On
; to test user data directory: SetWorkingDir, %A_AppData%\Quick Access Popup
; / End of code for developement enviuronment only - won't be compiled
;@Ahk2Exe-IgnoreEnd

g_blnDiagMode := False
g_strDiagFile := A_WorkingDir . "\" . g_strAppNameFile . "-DIAG.txt"
g_strIniFile := A_WorkingDir . "\" . g_strQAPNameFile . ".ini"

;@Ahk2Exe-IgnoreBegin
; Start of code for developement environment only - won't be compiled
if (A_ComputerName = "JEAN-PC") ; for my home PC
	g_strIniFile := A_WorkingDir . "\" . g_strQAPNameFile . "-HOME.ini"
else if InStr(A_ComputerName, "STIC") ; for my work hotkeys
	g_strIniFile := A_WorkingDir . "\" . g_strQAPNameFile . "-WORK.ini"
; / End of code for developement environment only - won't be compiled
;@Ahk2Exe-IgnoreEnd

IniRead, g_blnDiagMode, %g_strIniFile%, Global, DiagMode, 0

if QAPisRunning()
{
	; Use traditional method, not expression
	g_strParam0 = %0% ; number of parameters
	g_strParam1 = %1% ; fisrt parameter, the command name
	g_strParam2 = %2% ; second parameter, the selected path or filename
	
	Diag("g_strParam0", g_strParam0)

	if (g_strParam0 > 0) and StrLen(g_strParam1)
	{
		Diag("Send_WM_COPYDATA:Param", g_strParam1 . "|" . g_strParam2)
		Diag("Send_WM_COPYDATA:g_stTargetAppTitle", g_stTargetAppTitle)
		; try to send message to compiled QAP
		intResult := Send_WM_COPYDATA(g_strParam1 . "|" . g_strParam2, g_stTargetAppTitle)
		; returns FAIL or 0 if an error occurred, 0xFFFF if a QAP window is open or 1 if success
		Diag("Send_WM_COPYDATA (1=OK)", intResult)
		
		; if error, check if running in dev
		if (intResult <> 1) and (intResult <> 0xFFFF)
		{
			intResult := Send_WM_COPYDATA(g_strParam1 . "|" . g_strParam2, g_stTargetAppTitleDev)
			Diag("Send_WM_COPYDATA-DEV:intResult", intResult)
		}
		
		if (intResult = 0xFFFF)
			Oops("A settings window is open in ~1~ with unsaved changes.`n`nPlease, close settings window before using this context menu.", g_stTargetAppName)
	}
	else
		Oops("Do not run ~1~ directly. You can:`n`n- right-click a file or a folder icon in Explorer to add them to the menu`n- right-click Explorer window background to add the current folder`n- right-click the Desktop background to popup the menu.`n`nMake sure ~2~ is launched before using its context menus. See ""Context menus"" checkbox in ~2~ ""Options"" window.", g_strAppNameText, g_stTargetAppName)
}
else
	Oops("An error occurred.`n`nMake sure ~1~ is running before using its context menus.", g_stTargetAppName)

return


;-----------------------------------------------------------
Send_WM_COPYDATA(ByRef strStringToSend, ByRef strTargetScriptTitle) ; ByRef saves a little memory in this case.
; Adapted from AHK documentation (https://autohotkey.com/docs/commands/OnMessage.htm)
; This function sends the specified string to the specified window and returns the reply.
; The reply is 1 if the target window processed the message, or 0 if it ignored it.
;-----------------------------------------------------------
{
    VarSetCapacity(varCopyDataStruct, 3 * A_PtrSize, 0) ; Set up the structure's memory area.
	
    ; First set the structure's cbData member to the size of the string, including its zero terminator:
    intSizeInBytes := (StrLen(strStringToSend) + 1) * (A_IsUnicode ? 2 : 1)
    NumPut(intSizeInBytes, varCopyDataStruct, A_PtrSize) ; OS requires that this be done.
    NumPut(&strStringToSend, varCopyDataStruct, 2 * A_PtrSize) ; Set lpData to point to the string itself.

	strPrevDetectHiddenWindows := A_DetectHiddenWindows
    intPrevTitleMatchMode := A_TitleMatchMode
    DetectHiddenWindows On
    SetTitleMatchMode 2
	
    SendMessage, 0x4a, 0, &varCopyDataStruct, , %strTargetScriptTitle% ; 0x4a is WM_COPYDATA. Must use Send not Post.
	
    DetectHiddenWindows %strPrevDetectHiddenWindows% ; Restore original setting for the caller.
    SetTitleMatchMode %intPrevTitleMatchMode% ; Same.
	
    return ErrorLevel ; Return SendMessage's reply back to our caller.
}
;-----------------------------------------------------------


;------------------------------------------------
Oops(strMessage, objVariables*)
;------------------------------------------------
{
	global g_strAppNameText
	global g_strAppVersionLong
	
	MsgBox, 48, % L("~1~ (~2~)", g_strAppNameText, g_strAppVersionLong), % L(strMessage, objVariables*)
}
; ------------------------------------------------


;------------------------------------------------
L(strMessage, objVariables*)
;------------------------------------------------
{
	Loop
	{
		if InStr(strMessage, "~" . A_Index . "~")
			StringReplace, strMessage, strMessage, ~%A_Index%~, % objVariables[A_Index], A
 		else
			break
	}
	
	return strMessage
}
;------------------------------------------------


;------------------------------------------------------------
QAPisRunning()
;------------------------------------------------------------
{
    strPrevDetectHiddenWindows := A_DetectHiddenWindows
    intPrevTitleMatchMode := A_TitleMatchMode
    DetectHiddenWindows, On
    SetTitleMatchMode, 2
	
	SendMessage, 0x2224, , , , Quick Access Popup ahk_class JeanLalonde.ca ; USE v7.2 OR ahk_class JeanLalonde.ca
	intErrorLevel := ErrorLevel
	Diag("QAPisRunning:ErrorLevel (1=OK)", intErrorLevel)
    DetectHiddenWindows, %strPrevDetectHiddenWindows%
    SetTitleMatchMode, %intPrevTitleMatchMode%
	Sleep, -1 ; prevent the cursor to turn to WAIT image for 5 seconds (did not search why) when showing menu from Desktop background
	
    return (intErrorLevel = 1) ; QAP reply 1 if it runs, else SendMessage returns "FAIL".
}
;------------------------------------------------------------


;-----------------------------------------------------------
SetQAPWorkingDirectory:
;-----------------------------------------------------------

; See the same command in QuickAccessPopup0.ahk for explanations
if !FileExist(A_ScriptDir . "\_do_not_remove_or_rename.txt")
{
	g_blnPortableMode := true ; set this variable for use later during init
	return
}
else
	g_blnPortableMode := false ; set this variable for use later during init

if (A_WorkingDir = A_ScriptDir) and FileExist(A_WorkingDir . "\_do_not_remove_or_rename.txt")
	SetWorkingDir, %A_AppDataCommon%\Quick Access Popup

SetWorkingDir, %A_AppData%\Quick Access Popup

return
;-----------------------------------------------------------


;------------------------------------------------
Diag(strName, strData)
;------------------------------------------------
{
	global g_blnDiagMode
	global g_strDiagFile

	if !(g_blnDiagMode)
		return

	FormatTime, strNow, %A_Now%, yyyyMMdd@HH:mm:ss
	loop
	{
		FileAppend, %strNow%.%A_MSec%`t%strName%`t%strData%`n, %g_strDiagFile%
		if ErrorLevel
			Sleep, 20
	}
	until !ErrorLevel or (A_Index > 50) ; after 1 second (20ms x 50), we have a problem
}
;------------------------------------------------


