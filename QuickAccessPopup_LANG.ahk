global lAboutText1 := "~1~ ~2~ (~3~ bits)"
global lAboutText2 := "~1~ is written by Jean Lalonde using the`n<a href=""http://ahkscript.org/"">AutoHotkey</a> programming language.`n`nGerman translation: Edgar ""Fast Edi"" Hoffmann`nFrench translation: Jean Lalonde`nDutch translation: Pieter Dejonghe`nKorean translation: Om Il-Sung`nSwedish translation:�ke Engelbrektson`nItalian translation: Riccardo Leone`nSpanish translation: kiketrucker`nBrazilian Portuguese translation: Igor Ruckert`nOther languages translation: (help welcomed)`nEnglish proof checking: (help welcomed)`n`nIcons by: <a href=""http://www.visualpharm.com"">Visual Pharm</a>`nInstall program: <a href=""http://www.jrsoftware.org/isinfo.php"">Inno Setup</a> by jrsoftware.org`nAutoHotkey_L v1.1 sources: <a href=""https://github.com/JnLlnd/QuickAccessPopup"">GitHub</a>"
global lAboutText3 := "~1~ Jean Lalonde 2013-2014. Freeware."
global lAboutText4 := "Support on <a href=""http://www.quickaccesspopup.com"">www.quickaccesspopup.com</a>"
global lAboutTitle := "About - ~1~ ~2~"
global lAppTagline := "Move like a breeze between your frequently used folders and documents!"
global lCopyLocationCopiedToClipboard := "Path or URL copied to the Clipboard"
global lDiagModeCaution := "~1~ is running in diagnostic mode.`n`nInformation about the app's execution will be collected in the file:`n~2~`n`nNothing will be sent without your consent.`n`nDo you want to keep diagnostic mode ON?"
global lDiagModeExit := "~1~ colleted diagnostic information in the file ~2~."
global lDiagModeIntro := "Send this file to ahk@jeanlalonde.ca with a description of the situation requiring diagnostic."
global lDiagModeSee := "Do you want to see the diagnostic file?"
global lDialogAdd := "Add"
global lDialogAddEditFavoriteTitle := "~1~ Favorite: ~4~ - ~2~ ~3~" ; changed
global lDialogAddFavoriteSelectTitle := "Add Favorite - ~1~ ~2~" ; new
global lDialogAddFavoriteTabs := "Basic Settings|Menu Options|Window Options|Advanced Settings" ; new
global lDialogAddFileSelect := "Choose the new document:"
global lDialogAddFolderManuallyPrompt := "Sorry, we can't detect the current folder in this type of window.`n`nDo you want to add it manually now?"
global lDialogAddFolderManuallyTitle := "Add This Folder - ~1~ ~2~"
global lDialogAddFolderSelect := "Choose or create the new folder:"
global lDialogAlt := "Alt" ; lOptionsAlt renamed
global lDialogApplicationLabel := "Application"
global lDialogArgumentsLabel := "Parameters"
global lDialogArgumentsPlaceholders := "You can insert the location of this favorite or part of it using these placeholders: {LOC} (full location), {NAME} (file name), {DIR} (directory), {EXT} (extension), {NOEXT} (file name without extension) or {DRIVE} (drive)"
global lDialogArgumentsPlaceholdersCheckLabel := "Current parameters with expanded placeholders"
global lDialogBrowseButton := "Browse"
global lDialogBrowseOrSelectApplication := "Browse for an executable file or`nselect a running application in this list" ; new
global lDialogCancelButton := "Cancel"
global lDialogCancelPrompt := "Discard changes?"
global lDialogCancelTitle := "Cancel - ~1~ ~2~"
global lDialogChangeHotkeyNote := "Note: The location ""~1~"" will be linked to the new hotkey in all menus."
global lDialogChangeHotkeyPopup := "This is a popup menu hotkey.`n`nDo you want to manage ""~1~"" in ""~2~""?" ; new
global lDialogChangeHotkeyTitle := "Change hotkey - ~1~ ~2~" ; lOptionsChangeHotkeyTitle renamed
global lDialogContinue := "Continue" ; added
global lDialogCtrl := "Control" ; renamed
global lDialogCtrlShort := "Ctrl" ; renamed
global lDialogEdit := "Edit"
global lDialogEndOfMenu := "end of menu"
global lDialogFavoriteDoesNotExistPrompt := "The favorite ""~1~"" does not exist or is not available.`n`nIf this favorite is on a network drive, please try again after network authentification.`n`nIf a favorite is a link to a web page, select the ""Link"" option when you add the favorite." ; changed
global lDialogFavoriteDoesNotExistTitle := "Favorite does not exist - ~1~"
global lDialogFavoriteDropdownEmpty := "Please choose an item in the ~1~ drop-down list." ; new
global lDialogFavoriteLocationEmpty := "The location is empty. Please, choose a location."
global lDialogFavoriteMenuPosition := "Insert the new favorite before this item"
global lDialogFavoriteNameEmpty := "The favorite name is empty. Please, choose a name."
global lDialogFavoriteNameNoColumnBreak := "The submenu name cannot start the reserved characters ""~1~""." ; changed
global lDialogFavoriteNameNoSeparator := "This item name cannot include the reserved character ""~1~""." ; changed
global lDialogFavoriteNameNotAllowed := "Favorites of type ""~1~"" are not allowed in groups. Please, select another ""~2~"" in the ""Menu Options"" tab." ; new
global lDialogFavoriteNameNotNew := "The name ""~1~"" is already used in this menu. Please, choose a new name."
global lDialogFavoriteNameNotNewQAPfeature := "The name ""~1~"" is already used in this menu. Please, rename the existing favorite and try again." ; new
global lDialogFavoriteParentMenu := "Favorite parent menu"
global lDialogFavoriteRemovePrompt := "Remove the submenu ""~1~""`nand ALL its content (folders and submenus)?"
global lDialogFavoriteRemoveTitle := "Remove Favorite - ~1~"
global lDialogFavoriteSelectType := "Select the type of favorite to add.`n`nIn the next window, you will give your favorite:`n- a name`n- a content (depending on the type)`n- various settings (icon, shortcut, etc.)`n`nChoose the new favorite's type and click ""~1~""."
global lDialogFavoriteShortNameLabel := "~1~ short name for menu" ; new (remove in other languages: lDialogApplicationShortName, lDialogFileShortName, lDialogFolderShortName, lDialogSubmenuShortName, lDialogURLShortName)
global lDialogFavoriteType := "Favorite Type" ; new
global lDialogFavoriteTypesHelp1 := "Create a shortcut to a frequently used ""Folder"".`n`nSet the favorite's menu name, path and various menu options.`n`nAdvanced settings allow to set the window position and file manager options." ; new
global lDialogFavoriteTypesHelp2 := "Create a shortcut to a ""Document"".`n`nSet the favorite's menu name, path and various menu options.`n`nAdvanced settings allow to choose a specific application to launch the document, add optional parameters and set the window position." ; new
global lDialogFavoriteTypesHelp3 := "Create a shortcut to an ""Application"" (program, batch or script).`n`nBrowse for the executable file or select one of the currently running programs. Set various menu options.`n`nAdvanced settings allow to select a ""Start In"" directory, add parameters and set the window position." ; new
global lDialogFavoriteTypesHelp4 := "Create a shortcut to one of the 50 pre-defined Windows ""Special Folders"" suchs as: Libraries, My Pictures, Recycle Bin, Downloads, etc.`n`nSet various menu options. Advanced settings allow to set the window position and file manager options." ; new
global lDialogFavoriteTypesHelp5 := "Create a ""Link"" to a web page.`n`nSet menu name, web page's address (URL) and various menu options.`n`nAdvanced settings allow to select a specific browser to launch the link, add optional parameters and set the window position." ; new
global lDialogFavoriteTypesHelp6 := "Create a shortcut to an ""FTP site"".`n`nSet menu name, FTP site's address (URL), login name, password and various menu options.`n`nAdvanced settings allow to select a specific FTP program to access this site, add optional parameters, set the window position and encode login name and password.`n`nNote: the password is NOT encrypted when sent on Internet." ; new
global lDialogFavoriteTypesHelp7 := "Insert anywhere in your menu ""Quick Access Popup Features"" such as:`n`n- ~1~`n- ~2~`n- ~3~`n- ~4~`n- ~5~`n- etc." ; new
global lDialogFavoriteTypesHelp8 := "Gather related favorites in a ""Submenu"".`n`nGive your submenu a name and select menu options. That's it!`n`nAdd favorites to your submenu or move them from other submenus or groups using the ""Edit"" button." ; new
global lDialogFavoriteTypesHelp9 := "Launch a ""Group"" of favorites, all in one shortcut!`n`nGive your group a name and set various options for your group.`n`nAdd favorites to your group or move them from other submenus or groups using the ""Edit"" button.`n`nAdvanced settings allow to control restoring speed by inserting a delay between each favorite to restore." ; new
global lDialogFavoriteTypesLabels := "&Folder|&Document|&Application|&Special Folder|&Link|F&TP site|&QAP Feature|Sub&menu|&Group" ; new (but replace lDialogFolderLabel, lDialogFileLabel, lDialogApplicationLabel, lDialogSpecialLabel, lDialogURLLabel, lDialogSubmenuLabel ("FTP site", "QAP Feature" and "Group" are new)
global lDialogFavoriteTypesLocationLabels := "Folder (path)|Document (path and file name)|Application (path and file name)||Link (URL)|FTP site (URL)|||" ; new
global lDialogFavoriteTypesShortNames := "Folder|Doc|App|Special|Link|FTP|QAP|Menu|Group" ; new
global lDialogFavoritesParentMenuMove := "Move ~1~ favorites to this menu"
global lDialogFileLabel := "Document"
global lDialogFolderLabel := "Folder"
global lDialogGroupDelete := "Delete"
global lDialogGroupDeleteError := "delete"
global lDialogGroupDeletePrompt := "Delete the group ""~1~""?"
global lDialogGroupDeleteTitle := "Delete group - ~1~"
global lDialogGroupEdit := "Edit"
global lDialogGroupEditError := "edit"
global lDialogGroupLoad := "Load"
global lDialogGroupLoadError := "load"
global lDialogGroupLoadErrorLoading := "Error loading group window:`n`n""~1~"""
global lDialogGroupManageAbout := "About Groups"
global lDialogGroupManageCannotSave := "Warning: There is no open folder to save in a new group. Open at least one Explorer or Directory Opus window and try again to save a new group."
global lDialogGroupManageCreatingPrompt := "To create a group, click the ""~1~"" button or select the ""~2~"" menu at any time."
global lDialogGroupManageCreatingTitle := "Create a group"
global lDialogGroupManageGroupsTitle := "Manage Groups - ~1~ ~2~"
global lDialogGroupManageIntro := "With ""Groups"", you can save and restore your workspace to efficiently switch between your work sessions. ""Groups"" remember the folder, size, position and state (normal, minimized or maximized) of Windows Explorer and Directory Opus windows (Total Commander not supported yet)."
global lDialogGroupManageManagingTitle := "Manage Groups"
global lDialogGroupNew := "Save a new group"
global lDialogGroupSelect := "Select a group"
global lDialogGroupSelectError := "Please, select the group to ~1~."
global lDialogGroups := "Groups"
global lDialogHotkeys := "Hotkeys" ; new
global lDialogHotkeysManageAbout := "Shortcuts currently active in ~1~"
global lDialogHotkeysManageIntro := "Double-click on a favorite line to change its shortcut."
global lDialogHotkeysManagePopup := "Popup"
global lDialogHotkeysManageListHeader := "Menu|Favorite Name|Type|Hotkey|Favorite Location" ; new
global lDialogHotkeysManageListSeeAllFavorites := "See all favorites" ; new
global lDialogHotkeysManageListSeeShortHotkeyNames := "See abbreviated hotkey names" ; new
global lDialogHotkeysManageTitle := "Manage Hotkeys - ~1~ ~2~" ; new
global lDialogIcon := "Favorite Icon" ; changed
global lDialogInvalidHotkey := "With your current system keyboard layout, the hotkey ""~1~"" could not be used as a trigger for the popup menu (not a valid key name error).`n`nPlease, open the ""Settings"" window from the Tray menu and click ""Options"". In this dialog box, choose another shortcut for ""~2~""."
global lDialogInvalidHotkeyFavorite := "With your current system keyboard layout, the hotkey ""~1~"" could not be used as a trigger for the location ""~2~"" (not a valid key name error).`n`nPlease, choose another shortcut for location ""~2~""." ; new
global lDialogKeyboard := "Keyboard" ; lOptionsKeyboard renamed
global lDialogLaunchWith := "Launch with this application" ; new
global lDialogMaximized := "Maximized"
global lDialogMenuNotMoveUnderItself := "Menu ""~1~"" cannot be moved under itself"
global lDialogMinimized := "Minimized"
global lDialogMouse := "Mouse" ; lOptionsMouse renamed
global lDialogMouseButtonsText := "Left Mouse Button|Middle Mouse Button|Right Mouse Button|Special Mouse Button 1|Special Mouse Button 2|Wheel Up|Wheel Down|Wheel Left|Wheel Right|" ; lOptionsMouseButtonsText renamed
global lDialogMouseCheckLButton := "You can't assign the ""Left Mouse Button"" without a modifier`n(like ~1~, ~2~, ~3~ or ~4~ keys)." ; lOptionsMouseCheckLButton renamed, changed
global lDialogNone := "None" ; lOptionsMouseNone renamed
global lDialogMoveFavoritesTitle := "Move Favorites - ~1~ ~2~"
global lDialogNormal := "Normal"
global lDialogOK := "OK" ; new
global lDialogOpenThisMenu := "Open this menu"
global lDialogOr := "or" ; new (lowercase)
global lDialogRememberWindowPosition := "Remember window position" ; new
global lDialogRemoveMultipleFavorites := "Do you realy want to remove ~1~ favorites or submenus?"
global lDialogSave := "Save"
global lDialogSelectIcon := "Select icon"
global lDialogSelectItemToAdd := "Select the item to add" ; new
global lDialogSelectItemToEdit := "Please, select the item to edit."
global lDialogSelectItemToMove := "Please, select the item to move." ; new
global lDialogSelectItemToRemove := "Please, select the item to remove."
global lDialogShift := "Shift" ; renamed
global lDialogShortcut := "Shortcut"
global lDialogSpacebarTab := "choose <a id=""Space"">space bar</a> or <a id=""Tab"">tab</a>" ; renamed, changed (was "use space bar")
global lDialogSpecialLabel := "Special Folder"
global lDialogState := "Window State:" ; new
global lDialogSubmenuLabel := "Submenu"
global lDialogSubmenuNameEmpty := "The submenu name is empty. Please, choose a name."
global lDialogSubmenuParentMenu := "Submenu parent menu"
global lDialogTabNext := "Next"
global lDialogThirdPartyDetected := "~1~ detected that ~2~ is installed on your system.`n`nDo you want to enable ~2~ integration?"
global lDialogTriggerFor := "Trigger for:" ; renamed
global lDialogURLLabel := "Link" ; changed
global lDialogUseDefaultSettings := "Use default advanced settings" ; new
global lDialogWin := "Windows" ; renamed
global lDialogWinShort := "Win" ; renamed
global lDialogWindowPosition := "Window position:" ; new
global lDialogWindowPositionDelay := "Delay"
global lDialogWindowPositionH := "Height" ; new
global lDialogWindowPositionW := "Width" ; new
global lDialogWindowPositionX := "Left" ; new
global lDialogWindowPositionY := "Top" ; new
global lDialogWorkingDirLabel := "Start in"
global lDonateButton := "Support Freeware!"
global lDonateCheckPrompt := "Are you happy with ~1~?`n`n~1~ is not only FREE of charge but also FREE of nasty advertising or adware that you never know if they carry spyware or malware.`n`n~2~ times so far, ~1~ has helped you in your daily work. How about supporting freeware now?"
global lDonateCheckTitle := "~1~ times! - ~2~"
global lDonateMenu := "Support Freeware!"
global lDonatePlatformComment1 := "The most flexible way using your PayPal account or your credit card"
global lDonatePlatformComment2 := "Receive an official invoice if you need it to be refunded"
global lDonatePlatformName1 := "Using Paypal"
global lDonatePlatformName2 := "Using Share-it"
global lDonateReviewNameLeft1 := "Download.com"
global lDonateReviewNameLeft2 := "PortableFreeware.com"
global lDonateReviewNameLeft3 := "Softpedia.com"
global lDonateReviewNameRight1 := "BetaNews.com"
global lDonateReviewNameRight2 := "FileCluster.com"
global lDonateReviewNameRight3 := "Freewares && Tutos (FR)"
global lDonateText1 := "Support ~1~ development!"
global lDonateText2 := "<a href=""~1~"">Why support freeware?</a>"
global lDonateText3 := "... or support freeware for free!"
global lDonateText4 := "Give a favorable review to ~1~ on:"
global lDonateText5 := "Send me your link"
global lDonateThankyou := "Thank you for supporting freeware!"
global lDonateTitle := "Support freeware! - ~1~ ~2~"
global lGui2Close := "Close"
global lGuiAbout := "About"
global lGuiAddFavorite := "Add"
global lGuiCancel := "&Cancel"
global lGuiClose := "&Close"
global lGuiDonate := "Support"
global lGuiDropFilesHelp := "Drag && Drop Help"
global lGuiDropFilesIncentive := "You can Drag & Drop the following types of favorites`nto the ~1~ window:`n`n- ~2~`n- ~3~`n- ~4~" ; changed translated
global lGuiEditFavorite := "Edit"
global lGuiGroupClosing := "Closing windows"
global lGuiGroupExplorerDelay := "Delay between Explorer launch retries:"
global lGuiGroupOf := "of"
global lGuiGroupRestoreDelay := "Delay between favorites to restore:"
global lGuiGroupRestoreDelayMilliseconds := "milliseconds"
global lGuiGroupSaveAddWindowsLabel := "Add to existing Explorer windows"
global lGuiGroupSaveDeselectAll := "Deselect All"
global lGuiGroupSaveEditPrompt := "~1~ this group"
global lGuiGroupSaveEditTitle := "~1~ a group of windows - ~2~ ~3~"
global lGuiGroupSaveLvHeader := "Path|Application|Window state|Left|Top|Width|Height|Side"
global lGuiGroupSaveNameEmpty := "The group name is empty. Please, choose a group name."
global lGuiGroupSaveNewGroup := "New group"
global lGuiGroupSaveReplaceGroup := "Group ""~1~"" exists. Replace it?"
global lGuiGroupSaveReplaceWindowsLabel := "Replace existing Explorer windows" ; changed
global lGuiGroupSaveRestoreOption := "When restoring this group:"
global lGuiGroupSaveSelect := "Select the favorites to save in this group" ; changed was "... the folders to..."
global lGuiGroupSaveSelectAll := "Select All"
global lGuiGroupSaveSelectExisting := "or select an existing group to overwrite:"
global lGuiGroupSaveShortName := "Group short name for menu" ; changed
global lGuiGroupSaved := "Group ""~1~"" saved.`n`nClick the menu ""~2~"" to load this group."
global lGuiHelp := "Help"
global lGuiHotkeysHelp := "Favorites Shortcuts Help"
global lGuiHotkeysHelpText := "Down: Select next favorite`nUp: Select previous favorite`nCtrl-N: Add a new favorite`nEnter: Edit favorite`n`nShift-Up/Down: Select contiguous favorites`nCtrl-Click: Select non-contiguous favorites`nCtrl-A: Select all favorites`n`nCtrl-Down: Move favorite(s) down`nCtrl-Up: Move favorite(s) up`nDel: Remove favorite(s)`n`nCtrl-Right: Open selected submenu`nCtrl-Left: Open parent menu"
global lGuiLoginName := "Login name" ; new
global lGuiLvFavoritesHeader := "Name|Type|Location" ; changed
global lGuiMove := "Move"
global lGuiOptions := "Options"
global lGuiPassword := "Password" ; new
global lGuiRemoveFavorite := "Remove"
global lGuiResetDefault := "Reset default hotkey"
global lGuiSave := "&Save"
global lGuiSubmenuDropdownLabel := "Menu or group to edit:" ; changed
global lGuiTitle := "Settings - ~1~ ~2~"
global lHelpTabAddingFavorite := "Adding Favorites" ; changed
global lHelpTabGettingStarted := "Getting Started"
global lHelpTabQAPFeatures := "QAP Features" ; new
global lHelpTabTipsAndTricks := "Tips and Tricks" ; variable name changed
global lHelpText11 := "At its launch, Quick Access Popup adds an icon in the System Tray and awaits your orders. When you want to launch one of your preferred FOLDERS, DOCUMENTS, APPLICATIONS or WEB LINKS, just hit the QAP hotkey [~1~] or [~2~] and, in the popup menu, select the desired favorite."
global lHelpText12 := "When you select a favorite FOLDER in Windows Explorer or a file dialog box, Quick Access Popup  instantly ""navigate"" the current window to this folder!"
global lHelpText13 := "To force opening the folder in a new window, hit the Power hotkeys [~1~] or [~2~]. In the Power menu, select ""Open in new window"", then select the desired folder. The Power menu offers several other functionalities."
global lHelpText14 := "Choose ""Settings"" to customize your Quick Access Popup menu. You can add favorites to your menu. You can move, rename or delete them. You can also add SUBMENUS or GROUPS. Choose the ""Menu or group to edit:"" in the  drop-down list. Click ""Save"" to keep your changes."
global lHelpText21 := "To add favorites, in the Settings window, click the ""Add"" button. Select the type of the new favorite and see the tips on the right side of the widow. Click ""Continue"" to open the ADD FAVORITE dialog box."
global lHelpText22 := "In the four tabs of the ""Add favorite"" dialog box, enter the Basic Settings, Menu Options, Window Options and Advanced Settings. Click ""Add"" to insert the favorite in your menu and ""Save"" in the Settings window."
global lHelpText23 := "ADD THIS FOLDER`n`nTo quickly ADD a new favorite FOLDER to the popup menu:`n1) Go to a frequently used folder.`n2) Click the QAP hotkey [~1~] or [~2~], choose the ""My QAP Essentials"" menu and click ""Add This Folder"".`n3) Give the folder a short name, click ""Add"", then ""Save"" in the Settings window."
global lHelpText31 := "In the ""My QAP Essentials"" menu:"
global lHelpText32 := "- Choose the ""Recent folders..."" menu to show an updated list of the Windows recent folders.`n- Use the ""Current Folders"" menu to open one of the folders already open in an Explorer window.`n- Access the files or URLs in your Clipboard with the ""Clipboard"" menu.`n- Copy the path or URL of any favorite to the Clipboard using the ""Copy a Favorite's Path or URL"" menu."
global lHelpText33 := "CUSTOMIZE YOUR QAP FEATURES MENU`n`nYou can move the QAP features menu items to the main menu or to other submenus as you wish.`n`n1) Select the ""Settings"" menu (or hit [~1~]).`n2) In the ""Menu or group to edit:"" drop-down list, select ""Main > My QAP Essentials"".`n3) Select the QAP feature to move and click ""Edit"".`n4) In the ""Menu Options"" tab, select the new ""Favorite Parent menu"".5) Save your changes."
global lHelpText41 := "- Use the Quick Access Popup icon in the Tray menu (lower right of Windows screen) in one of these three ways:`n1) Double-click the icon to open the ""Settings"" dialog box.`n2) Left-click the icon to open the QAP popup menu`n3) Right-click the icon to open the QAP system menu."
global lHelpText42 := "- In the Tray menu, right-click on the Quick Access Popup icon and check the ""Run at Startup"" option to launch Quick Access Popup automatically at start-up."
global lHelpText43 := "- Configure your Quick Access Popup menu triggers: choose your preferred mouse buttons or keyboard shortcuts in ""Settings, Options""."
global lHelpText44 := "- Also in ""Options"": choose your preferred language, menu icons size, windows colors. Select the number of recent folders to display, add numeric keyboard shortcuts to the folders menu or shortcut reminders. Pin the popup menu at a fix position or remember the Settings window position."
global lHelpText45 := "- Directory Opus users, see <a href=""http://code.jeanlalonde.ca/using-folderspopup-with-directory-opus/"">this page</a> for additional information.`n- Total Commander users, see <a href=""http://code.jeanlalonde.ca/using-folderspopup-with-total-commander/"">this page</a> for additional information.`n- Other file managers users, see <a href=""http://code.jeanlalonde.ca/using-folders-popup-with-various-file-managers-and-fpconnect/"">this page</a> for additional information on FPconnect."
global lHelpTextLead := "Quick Access Popup lets you move like a breeze between your frequently used folders, documents, applications, web pages and much more!"
global lHelpTitle := "Help - ~1~ ~2~"
global lMainMenuName := "Main"
global lMenuAbout := "A&bout"
global lMenuAddThisFolder := "Add This Folder"
global lMenuAppData := "Application Data"
global lMenuCache := "Cache"
global lMenuClipboard := "Clipboard"
global lMenuColumnBreak := "column"
global lMenuCommonAppData := "Common Application Data"
global lMenuCommonDesktop := "Common Desktop"
global lMenuCommonStartMenu := "Common Start Menu"
global lMenuCommonStartupMenu := "Common Startup Menu"
global lMenuControlPanel := "&Control Panel"
global lMenuCookies := "Cookies"
global lMenuCopyLocation := "Copy a Favorite's Path or URL"
global lMenuCurrentFolders := "Current Folders" ; lMenuFoldersInExplorer renamed
global lMenuDesktop := "Desktop"
global lMenuDocuments := "D&ocuments"
global lMenuDownloads := "Downloads"
global lMenuExitApp := "Exit ~1~"
global lMenuFPMenu := "~1~ ~2~"
global lMenuFavoritesInternet := "Favorites (Internet)"
global lMenuFonts := "Fonts"
global lMenuGroup := "Groups of Favorites" ; changed, was "Groups of Folders"
global lMenuGroupAdd := "add"
global lMenuGroupManage := "Manage Groups" ; new
global lMenuGroupReplace := "replace"
global lMenuGroupSave := "Save Current Folders as Group"
global lMenuHelp := "Help"
global lMenuHistory := "History"
global lMenuMenu := "Menu"
global lMenuMyComputer := "&My Computer"
global lMenuMyMusic := "My Music"
global lMenuMyQAPMenu := "My QAP Esssentials"
global lMenuMySpecialMenu := "My Special Folders"
global lMenuMyVideo := "My Video"
global lMenuNetworkNeighborhood := "&Network Neighborhood"
global lMenuNoClipboard := "Clipboard contains no path or URL..."
global lMenuNoCurrentFolder := "No currently open folders..."
global lMenuPictures := "Pictures"
global lMenuPowerNewWindow := "Open in new window"
global lMenuProgramFiles := "Program Files"
global lMenuProgramsFolderStartMenu := "Programs Folder (Start Menu)"
global lMenuPublicLibraries := "Public Libraries"
global lMenuQuickLaunch := "Quick Launch"
global lMenuRecentFolders := "Recent Folders"
global lMenuRecentItems := "Recent Items"
global lMenuRecycleBin := "&Recycle Bin"
global lMenuRefreshRecent := "Refreshing Recent folders menu"
global lMenuRunAtStartup := "&Run at Startup"
global lMenuSettings := "Settings"
global lMenuSpecialFolders := "Special Folders"
global lMenuStartMenu := "Start Menu"
global lMenuStartup := "Startup"
global lMenuSuspendHotkeys := "Suspend Hotkeys"
global lMenuSystemCertificates := "System Certificates"
global lMenuTemplates := "Templates"
global lMenuTemporaryFiles := "Temporary Files"
global lMenuUpdate := "Check for &update"
global lMenuUserFolder := "User Folder"
global lMenuUserPinned := "User Pinned"
global lNavigateFileError := "An error occurred while opening the folder:`n~1~."
global lNavigateSpecialError := "An error occurred while opening the special folder #~1~."
global lOopsCouldNotOpenSpecialFolder := "~1~ could not open the special folder: ""~2~""."
global lOopsDialogBox := "The dialog box"
global lOopsFtpLocationProtocol := "FTP location must start with ""ftp://""."
global lOopsHotkeyAlreadyUsed := "The hotkey ""~1~"" is already used for ~2~.`n`nPlease, choose another hotkey for ~3~." ; new
global lOopsHotkeyNotInMenus := "Error: location ""~1~"" for hotkey ""~1~"" not found in menus."
global lOopsInvalidWindowPosition := "Invalid window position value(s)" ; new
global lOopsGroup := "group" ; new
global lOopsLocation := "location" ; new
global lOopsQAPfeature := "QAP feature" ; new
global lOopsTitle := "~1~ (~2~)"
global lOopsWriteProtectedError := "It appears that ~1~ is running from a WRITE-PROTECTED folder where the configuration file ""~1~.ini"" could not be created.`n`nMove the ~1~ .EXE file to the REGULAR folder of your choice and re-run it from this folder.`n`n~1~ will quit."
global lOopsWrongFPconnectAppPathFilename := "Wrong path or file name for parameter ""AppPath"" in FPconnect configuration:`n~1~.`n`nCheck the .exe file path for ""AppPath"" in FCConnect ini file:`n~2~"
global lOopsWrongThirdPartyPath := "Wrong path or file name for ~1~:`n~2~.`n`nCheck the .exe file selected for ~1~ in ""Options"", tab ""~3~""."
global lOopsZipFileError := "It appears that ~1~ is running directly from a .ZIP file.`n`nYou must extract the ~1~ .EXE file from the .ZIP file to the folder of your choice before running it.`n`n~1~ will quit."
; global lOptionsArrDescriptions1 := "Choose the MOUSE button and modifiers combination that will open the popup menu in Windows Explorer or file dialog boxes. By default, this is the middle mouse button without any modifier key."
; global lOptionsArrDescriptions2 := "Choose the MOUSE button and modifiers combination that will open the popup menu in ANY window and navigate to the selected folder in a NEW Windows Explorer window. By default, this is the middle mouse button while the Shift key is pressed."
; global lOptionsArrDescriptions3 := "Choose the KEYBOARD hotkey combination that will open the popup menu in the active Windows Explorer or file dialog box. By default, this is Windows+W (the ""W"" letter while the Windows key is pressed)."
; global lOptionsArrDescriptions4 := "Choose the KEYBOARD hotkey combination that will open the popup menu in ANY window and navigate to the selected folder in a NEW Windows Explorer window. By default, this is Shift+Windows+A (the ""A"" letter while the Shift and Control keys are pressed)."
; global lOptionsArrDescriptions5 := "Choose the hotkey or mouse button combination that will open the ""Settings"" dialog box. By default, this is Shift+Control+S."
; global lOptionsArrDescriptions6 := "Choose the hotkey or mouse button combination that will open the ""Current Folders"" menu. By default, this is Shift+Control+F."
; global lOptionsArrDescriptions7 := "Choose the hotkey or mouse button combination that will open the ""Groups of Folders"" menu. By default, this is Shift+Control+G."
; global lOptionsArrDescriptions8 := "Choose the hotkey or mouse button combination that will open the ""Recent Folders"" menu. By default, this is Shift+Control+R."
; global lOptionsArrDescriptions9 := "Choose the hotkey or mouse button combination that will open the ""Clipboard"" menu. By default, this is Shift+Control+C."
; global lOptionsArrDescriptions10 := "Choose the hotkey or mouse button combination that will open the ""Copy a Favorite's Location"" menu. By default, this is Shift+Control+V."
global lOptionsChangeHotkey := "Change"
global lOptionsCheck4Update := "Check for update"
global lOptionsDirectoryOpusUseTabs := "Use tabs"
global lOptionsDisplayClipboardMenu := "Clipboard"
global lOptionsDisplayCopyLocationMenu := "Copy a Favorite's Path or URL"
global lOptionsDisplayCurrentFoldersMenu := "Current Folders"
; global lOptionsDisplayGroupMenu := "&Group of Favorites" ; REMOVED
global lOptionsDisplayIcons := "Display Menu &Icons"
global lOptionsDisplayMenuShortcuts := "Display &Numeric Menu Shortcuts"
global lOptionsDisplayMenus := "Display Menus:"
global lOptionsDisplayRecentFolders := "R&ecent Folders"
global lOptionsDisplaySpecialFolders := "S&pecial Folders"
; global lOptionsDisplaySpecialMenusShortcuts := "Display these shortcuts in main menu" ; removed
global lOptionsDisplayFavoritesHotkeysInMenus := "Display favorites shortcuts in menus" ; new
global lOptionsGuiTitle := "Options - ~1~ ~2~"
global lOptionsExclusionList := "Exclusion list" ; new
global lOptionsFtpEncoding := "Encode FTP username and password" ; new
global lOptionsHotkeyRemindersFull := "Display full names"
global lOptionsHotkeyRemindersNo := "Do not display"
global lOptionsHotkeyRemindersPrompt := "Hotkey reminders in menu:"
global lOptionsHotkeyRemindersShort := "Display abbreviated names"
global lOptionsIconSize := "Menu icons size"
global lOptionsLanguage := "Language"
global lOptionsLanguageLabels := "English|French|German|Dutch|Korean|Swedish|Italian|Spanish|Brazilian Portuguese"
global lOptionsMenuActiveWindow := "Top-left of active window"
global lOptionsMenuFixPosition := "At a fix position"
global lOptionsMenuNearMouse := "Near the mouse pointer"
global lOptionsMenuPositionPrompt := "Popup the menu:"
global lOptionsMouseAndKeyboard := "Menu hotkeys"
global lOptionsOpenMenuOnTaskbar := "Open menu on taskbar"
global lOptionsOtherOptions := "General"
global lOptionsPopupFixPositionX := "Position X:"
global lOptionsPopupFixPositionY := "Y:"
global lOptionsRecentFolders := "Number of folders in menu" ; changed
global lOptionsRecentFoldersPrompt := "Recent Folders:" ; new
global lOptionsRememberSettingsPosition := "Remember window position"
global lOptionsRunAtStartup := "&Run at Startup"
global lOptionsTabFileManagersIntro := "For users of third-party file managers"
; global lOptionsTabHotkeysIntro := "Define the mouse buttons or keyboard hotkeys that will trigger these window or menus." ; removed
global lOptionsTabMouseAndKeyboardIntro := "Define the mouse buttons and keyboard hotkeys that will trigger the ~1~ main menu." ; changed
global lOptionsTabOtherOptionsIntro := "Make ~1~ work the way you like!"
global lOptionsTheme := "Theme"
global lOptionsThirdParty := "File managers support"
global lOptionsThirdPartyDetail := "Select the ~1~ program file (.exe) to enable ~1~ integration."
global lOptionsThirdPartyDetailFPconnect := "Select the FPconnect program file (.exe) to enable other file managers integration."
global lOptionsThirdPartyPrompt := "Program file:"
global lOptionsThirdPartyTitle := "~1~ users"
global lOptionsThirdPartyTitleFPconnect := "Other file managers users using FPconnect"
global lOptionsPopupHotkeyTitles := "Quick Access Popup Mouse button|Quick Access Popup Keyboard shortcut|Power Menu Mouse button|Power Menu Keyboard shortcut" ; changed variable name
global lOptionsPopupHotkeyTitlesSub := "This mouse button pops the menu anywhere (except over <a>excluded applications</a>) and launch your favorite or navigate to your folder.|This hotkey the menu anywhere (except over <a>excluded applications</a>) and launch your favorite or navigate to your folder.|This mouse pops an alternate menu offering various features. This menu can pop anywhere (without exception).|This hotkey pops an alternate menu offering various features. This menu can pop anywhere (without exception)." ; changed and changed variable name
global lOptionsTotalCommanderUseTabs := "Use tabs"
global lOptionsTrayTip := "&Display Startup Tray Tip"
global lPickIconNoLocation := "First select a favorite before choosing an icon."
global lPopupMenuCopyLocationTrayTip := "Select the favorite to copy"
global lReloadPrompt := "~1~ changed to ~2~. Do you want to reload ~3~ in ~2~ now? Unsaved changes to the folders menu will be lost."
global lReloadPromptDefaultHotkey := "Hotkey changed to default value. This change will be effective only after you reload ~1~.`n`nDo you want to reload ~1~ now? Unsaved changes to the folders menu will be lost."
global lTrayTipInstalledDetail := "To show ~1~ menu, press:`n`n~2~ / ~3~`nto navigate to a folder or launch a favorite`n`n~3~ / ~4~`nto open the Power menu" ; changed
global lTrayTipInstalledTitle := "~1~ ~2~ ready!"
; global lTrayTipNoClipboardMenuDetail := "There is currently no folder, document, application or URL in the Clipboard menu" ; removed
; global lTrayTipNoClipboardMenuTitle := "~1~ - Clipboard menu" ; removed
; global lTrayTipNoCurrentFoldersMenuDetail := "There is currently no folder to display in the Current Folders menu" ; removed
; global lTrayTipNoCurrentFoldersMenuTitle := "~1~ - Current folders" ; removed
global lTrayTipWorkingDetail := "Building menus"
global lTrayTipWorkingDetailFinished := "The menu has been updated."
global lTrayTipWorkingTitle := "~1~ ~2~ working..."
global lUpdateButtonRemind := "Remind me"
global lUpdateError := "An error occurred while accessing the latest version number. Checking for update interrupted."
global lUpdatePrompt := "Update ~1~ from v~2~ to v~3~?"
global lUpdatePromptBeta := "There is a new ~1~ BETA version.`n`nUpdate ~1~ from v~2~ to v~3~?"
global lUpdatePromptBetaContinue := "Do you still want to to be informed of future beta versions?"
global lUpdateTitle := "Update ~1~?"
global lUpdateYouHaveLatest := "You have the latest version: ~1~.`n`nVisit the ~2~ web page anyway?"
global lWindowIsTreeviewText := "Sorry... Because of a Windows limitation, this type of dialog box (TreeView) is currently not supported by ~1~."
global lWindowIsTreeviewTitle := "Tree view dialog box not supported"
