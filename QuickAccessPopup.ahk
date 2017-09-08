;===============================================
/*

Quick Access Popup
Written using AutoHotkey v1.1.23.00+ (http://ahkscript.org/)
By Jean Lalonde (JnLlnd on AHKScript.org forum)

Based on FoldersPopup from the same author
https://github.com/JnLlnd/FoldersPopup
initialy inspired by Robert Ryan's script DirMenu v2 (rbrtryn on AutoHotkey.com forum)
http://www.autohotkey.com/board/topic/91109-favorite-folders-popup-menu-with-gui/
who was maybe inspired by Savage's script FavoriteFolders
http://www.autohotkey.com/docs/scripts/FavoriteFolders.htm
or Rexx version Folder Menu
http://www.autohotkey.com/board/topic/13392-folder-menu-a-popup-menu-to-quickly-change-your-folders/

Copyright 2013-2017 Jean Lalonde
--------------------------------
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

HISTORY
=======

Version: 8.5.2/8.5.3 (2017-09-08)
- v8.5.3 fixes a comment typo in v8.5.2 preventing the app to load
- reverting change from v8.5.1 causing issues for users having special characters in their favorites paths : at QAP startup, STOPS converting QuickAccessPopup.ini to Unicode encoding if it is is ANSI (until more tests are done)
- for new installations, this change is maintained: create new settings file QuickAccessPopup.ini with Unicode encoding

Version: 8.5.1 (2017-09-07)
- create new settings file QuickAccessPopup.ini with  Unicode encoding; this change allows the use of extended characters in favorite's name, location or content
- at QAP startup, check if QuickAccessPopup.ini encoding is ANSI and, if yes, convert it to Unicode encoding and inform user
- fix bug expand placeholder {CUR_LOC} in application favorite's working directory before checking if directory exists
- fix bug display "Reset default hotkey" in "Select hotkey" dialog box when there is no default

Version: 8.5 (2017-09-04)
  
Menu key
- you can now use the Menu key (also called Context menu key or Application key) to pop up the QAP menu or launch any favorite
- to select the Menu key, in the "Select Hotkey" dialog box, click on the "menu key (application)" link below the hotkey selector
- this hotkey can be combined with any modifiers (Shift, Alt, Ctrl or Win)
  
Snippets
- major improvements to make Snippets easier to create and edit
- a button in snippet add/edit favorite dialog box to enlarge the snippet content text box
- font size selector for snippet text box
- check box to display a snippet with fixed font (useful for code snippets)
- display preferences saved with each snippet
- default preferences for snippets can be selected in Options, General tab
- when launching a snippet with the "Prompt before" option, QAP also accepts Space to kick-off a snippet (in addition to Enter)
- change help link to new FAQ page about snippets (see improved FAQ content about Snippets)
  
Reopen Current Folder in dialog box
- a feature I should have included much earlier... Warning: to take advantage of it, existing users must add themselves this new feature to their menu
- new QAP feature "Reopen Current Folder in dialog box" allowing to reopen in a dialog box the current location in Windows Explorer
- the current location is the folder currently displayed in the active (or in the last active) Windows Explorer window
- current location is also detected in Directory Opus or Total Commander if one of these file magagers is enabled
  
Hotkeys
- set QAP feature default hotkeys for "Reopen Current Folder" to Shift+Ctrl+C  (of course, you can change it at any time)
- change QAP feature "Clipboard" default hotkeys from Shift+Ctrl+C to Shift+Ctrl+V
- this change is only for new installations - exising users must do this change themselves, if they wish
  
Various
- the "Ctrl + Ctrl" option has been moved to the "Alternative menu" tab in Options dialog box, and its presentation has been improved
- add a link beside the "Check for update" checkbox in the Options dialog box to check for update immediately
- check if the "Start in" folder location exists before launching a favorite and do not launch it if the location is not found
- offer to edit the favorite when one of these folder locations is not found: folder, document or application location, "Launch with" application location or "Start in" folder location
  
Language
- new! Dutch language is now available, thanks to Ric Roggeveen
- German translation update for changes since v8
- updates for Spanish, Italian and French language files, thanks to translators
  
Bug fixes
- fix an error in QAP 32-bit executable file preventing the Windows Explorer context menus to work with QAP installed in portable mode
- allow favorite location to be a UNC root path (like \\127.0.0.1\ or \\MyDomain\) assuming the location is online because Windows does not allow to check if an UNC root location is available (on my system, Windows 10 defaults to the "Documents" folder if the UNC drive is not mounted)
- fix bug when adding a QAP feature and when its default hotkey is already in use for another favorite
- fix bug when processing backtick (accent grave) in snippets (used for code snippets) and add help about backticks in add/edit dialog box
- fix bug Alternative menu hotkey reappearing after delete when returning to Options dialog box until QAP is restarted
- fix bug && displayed in Drag & Drop help window title instead of &
- add diagnostic code to track the "71 hotkeys limit" bug - if someone encounter this error message, please contact me

Version BETA: 8.4.9.5 (2017-09-03)
- fix bug Alternative menu hotkey reappearing after delete and returning to Options dialog box
- make backup of Alternative menu hotkey when opening Options dialog box in case user chancels changes
- add to default My Essentials menu the QAP feature "Reopen current folder in dialog box"
- Ctrl+Ctrl option presentation improved in Options diaolog box
- remove default hotkey +^V for Alternative menu Copy Favorite Location
- update to Spanish, Italian, Dutch and French language files

Version BETA: 8.4.9.4 (2017-08-26)
 
Snippets
- add button in snippet add/edit favorite dialog box to enlarge or restore the initial size of the snippet content text box
- default snippet to automatically encode
- save encode value for each snippet
- add fixed font and font size options and save value for each snippet
- add default snippet encode, fixed font, font size and macro mode default values to options General tab, save and retrieve values to ini file
 
Various
- allow favorite location to be a UNC path (like \\127.0.0.1\ or \\MyDomain) assuming the location exists (if network location is offline, it could give an error or open the default Document folder)
- remove tip about {CUR_LOC} in Add/Edit dialog box for snippets because this option is irrelevent for this type of favorite
- Dutch translation (thanks to Ric Roggeveen!)

Version BETA: 8.4.9.3 (2017-08-23)
 
Snippets
- fix bug with processing of backtick in snippets and add help about backticks in add/edit dialog box
- change method to kick-off a snippet when the "Prompt before pasting" option is used (using the Input command instead of KeyWait)
- also accept Space to kick-off a snippet (in addition to Enter)
- change help link to new FAQ page about snippets (see imprioved FAQ content about Snippets)
 
Menu key
- new approach for menu key, more integrated with existing hotkey management, menu key can now be used with modifiers
- in select hotkey dialog box, add "menu key (application)" to options for invisible characters
- when displaying hotkey as text, replace "sc15D" (keyboard scan code for Menu key) with "Menu key"
 
Various
- renamed menu label "Reopen Current Folder" to "Reopen Current Folder in Dialog Box" (because it is of use only in dialog boxes)
- fix bug in "Reopen Current Folder in Dialog Box" if no file manager is running
- fix bug && displayed in Drag & Drop help window title instead of &
- fix bug when adding a QAP feature and its default hotkey is already in use for another favorite
- merge change from v8.4.2 about Explorer context menu for Windows Shortcuts (see change log)
- German translation update for v8.0.4 to v8.3

Version BETA: 8.4.9.2 (2017-08-09)
- Menu key hotkey now removed properly checkbox is turned off
- Menu key now navigate in active Explorer or open in a new window as would do the regular keyboard hotkey

Version BETA: 8.4.9.1 (2017-08-07)
- set QAP feature default hotkeys for "Reopen Current Folder" to Shift + Ctrl + C
- change QAP feature "Clipboard" default hotkeys from Shift + Ctrl + C to Shift + Ctrl + V
- add a link beside "Check for update" checkbox in the Options dialog box to check for update now
- add an option to use "Menu key" (aka Context menu key or AppsKey) to open the QAP pop menu
- move "Ctrl + Ctrl" and "Menu key" options to tab Alternative menu tab in Options dialog box
- check if the "Start in" folder location exists and do not open the favorite if location is not found
- when favorite's location, "Launch with" application location or "Start in" folder location not found, edit the favorite if user answers yes when prompted
- add diagnostic code to track the "71 hotkeys limit" bug

Version BETA: 8.4.9 (2017-08-05)
- new QAP feature "Reopen Current Folder" allowing to reopen the current location in the last active file manager (Windows Explorer or, if enabled, Directory Opus/Total Commander), most useful in file dialog boxes Open, Save As, etc.
- rewrite of internal functions used to detect more reliably the current location in hew active file manager (Windows Explorer, dialog boxes or, if enabled, Directory Opus/Total Commander); potential impacts on Add this folder, drag & drop files to Settings window, Reopen a Folder, Reopen Current Folder, {CUR_LOC} and other {CUR_...} placeholders in favorite location and advanced parameters

Version: 8.4.2 (2017-08-18)
- stop creating Windows Explorer context menu for Windows Shortcuts (.lnk files) because of potential security issue
- if you need to remove this context menu see the FAQ (http://www.quickaccesspopup.com/how-can-i-remove-the-windows-explorer-contextual-menu-for-windows-shortcuts-lnk-files/)

Version: 8.4.1 (2017-08-05)
- fix bug maximum of Live Folders items exceeded (500 items limit) by error
- fix bug last Live folder item duplicated when numeric shortcuts are enabled
 
Version: 8.4 (2017-08-01)
- add "Always on top" option to Settings window to ease drag and drop
- update drag & drop help message
- remember window location when drag & drop a folder favorite to Settings window
- add a tab about Shared Menus in Help window
- add tooltips over left column buttons in Settings window
- fix bug when icon resource filename includes a coma
- fix links in Options tabs and fix links to Shared menu FAQ page on website
- Spanish, Brazilian-Portuguese, Italian and French language updates

Version: 8.3 (2017-07-20)
  
Changes already published in beta version v8.2.9 to v8.2.9.4.
  
Search
- add search text box to filter favorites in all submenus in Settings window
- add an X button to empty the filter text box and restore the full favorites list
- filtering is done based on the existence of the search string in the favorites name (only) in all menus and submenus
- filtering is case insensitive
- filtered favorites are displayed in the order they were found, starting from top main menu
- in filtered favorites list, the Edit button, Enter key or double-click open the edit favorite dialog box with the selected favorite
- double-clicking a menu favorite in filtered favorites list opens this menu unfiltered
- after edition of a favorite, the regular favorites list is restored in the location of the edited favorite
- the Remove button or Delete key removes a favorite from the filtered list (with confirmation before deleting a menu and its submenus); after deletion, the filtered list remains active
- in filtered list, only single selection is available, allowing edition or deletion of only one favorite at a time
- left columns buttons to move favorites or insert separator buttons (and their associated hotkeys) are disabled in filtered list
- in filtered list, the Add button (and its associated hotkey Ctrl-N) adds a new favorite at the top of the main menu
- changing menu using the dropdown list, using back or top arrows and closing and re-opening the Settings window restore the regular unfiltered list
- in Settings window, the new shortcut Ctrl-F moves the cursor to search box
  
Shared menus
- complete rewrite of Shared menus file locking (reservation to avoid conflictual changes by simulatneous users)
- when opening the add/edit favorite dialog box, QAP checks if the favorites belongs to a Shared menu and displays a message if the menu is read-only, locked (reserved) by another user or if it was changed since QAP was launched
- when saving a favorite (or when moving a favorite using arrows in Settings, or when adding a separator or a column break), QAP checks if the favorites belongs to a Shared menu and, if yes, checks if the shared menu was locked or modified since the dialog box was opened and, if yes, displays a message
- after a favorite in a shared menu is saved in QAP "internal" memory, QAP locks (reserves) the shared menu file until the changes in shared menu are actualy saved to the settings file QuickAccessPopup.ini, preventing other users from editing this shared menu
- QAP display "Read-only" in the Settings window's content column and prevent opening this menu in the Settings window if it is saved in a folder where the user has no write access and for shared menus of type "Centralized" where user does not have write-access for this menu
- when creating a Shared menu of type "Centralized", QAP automatically adds the current username to the write-access list (preventing the user to be locked out of its own new menu)
- in "Centralized" Shared menus write-access list, names can also be separated by semicolon (in addition to comma)
- a shared menu cannot be added under another shared menu
- QAP now supports Shared menu file locking when changes are done using the "Manage icons" window
- in Settings window column labeled "Content", QAP now displays the Shared menu settings file location
  
New Explorer Context menu for Windows shortcuts
- add an Explorer context menu for Windows shortcuts file (.lnk files) labeled "Import Windows shortcut to Quick Access Popup menu" to import shortcut settings to QAP favorites
- QAP imports the following settings from Windows shortcut: working directory (for application favorites), window state (for folder favorites) and icon settings (for any type of favorites)
- note for user of portable version: the file ManageContextMenu.bat has been updated to include the new context menu "Import Windows shortcut to Quick Access Popup menu"
  
Various
- add Settings shortcut F1 to open the Help window
- add Settings shortcut Ctrl-H to display the Favorites Shortcuts Help window
- update the Favorites Shortcuts Help window
  
Bug fixes
- fix bug having various side effects after user made changes to Settings and cancelled these changes with the Cancel button
- fix bug when opening a folder and active window is QAP Settings window

Version BETA: 8.2.9.4 (2017-07-20)
- fix bug losing current position in favorites list when adding a favorite in Settings window

Version BETA: 8.2.9.3 (2017-07-15)
- add Explorer context menu labeled "Import Windows shortcut to Quick Access Popup menu" to import .lnk files to QAP favorites
- import following settings from Windows shortcut: working directory (for application favorites), window state (for folder favorites) and icon settings (for any type)
- reset Search label in empty search box when Settings is shown
- fix bug with search filter when showing the gui from add favorite QAP feature
- fix bug when add favorite from QAP showing shared menu error at fresh start only
- fix bug when opening a folder and active window is QAP Settings window
 
Version BETA: 8.2.9.2 (2017-06-26)
 
Search in Settings
- add search text box to Settings window above favorites list with an x button to empty the filter text box
- add a filtered favorites list shown automatically over the regular favorites list when text is typed in the filter text box and hidden when the search text box is emptied
- filtering is done based on the existence of the search string in the name (only) of favorites in all menus and submenus, starting from top main menu
- in filtered favorites list, show the same columns as in the regular list plus the menu path in second column, after favorite name
- Edit button, Enter key or double-click in the filtered list open the edit favorite dialog box with the selected favorite, except if it is a menu where the double-click will open the submenu
- when edited favorites is saved (or cancelled), the regular favorites list is restored in the location of the edited favorite
- Remove button or Delete key removes a favorite from the filtered list (with confirmation before deleting a menu and its submenus); after deletion, the filtered list remains active
- in filtered list, only single selection is available, allowinf edit or deletion of only one favorite at a time (support for multiple deletion or multiple move could be added but requires more work)
- disable left columns move and separator buttons (and associated hotkeys) in Settings when filtered list is active
- in filtered list, the Add button (and its associated hotkey Ctrl-N) adds a new favorite at the top of the main menu
- hide filtered list anjd restore regular favorite list, when changing menu using the dropdown list or back or top arrows in Settings, and when closing and re-opening the Settings window
- add Settings shortcut Ctrl-F to move the cursor to search box
 
Other
- add Settings shortcuts F1 to open Help window
- add Settings shortcut Ctrl-H to display the Favorites Shortcuts Help window
- update the Favorites Shortcuts Help window
- fix bugs having various side effects after user made changes to Settings and cancelled these changes (with the Cancel button), breaking the backlinks ("..") to parent menu, breaking the check for shared menus changes in since menu was loaded
 
Bug fixes from master branch v8.2.3
- fix bug blocking removal of multiple favorites when user answers no when asked to confirm removal of a submenu
- fix label display bug under Remove button preventing showing the number of selected favorites

Version BETA: 8.2.9.1 (2017-06-24)
- include read-only external menu in menus dropdown list in Settings for navigation (not in the same list when in Add/Edit favorite or move favorites)
- fix bug declare a menu read-only when menu is under a read-only shared menu, in save favorite, remove favorite, add separator or column

Version BETA: 8.2.9 (2017-06-19)
- complete rewrite of Shared menus file locking (reservation to avoid conflicutal changes by simulatneous users)
- when opening the add/edit favorite dialog box, QAP checks if the favorites belongs to a Shared menu and displays a message if the menu is read-only, locked (reserved) by another user or if it was changed since QAP was launched
- when saving a new or edited favorite (or when moving a favorite using arrows in Settings, or when adding a separator or a column break), QAP checks if the favorites belongs to a Shared menu and, if yes, checks if the shared menu was locked or modified since the dialog box was opened and, if yes, displays a message
- after the new or edited favorite in a shared menu is saved in QAP "internal" memory, QAP locks (reserves) the shared menu file until the changes in shared menu are actualy saved to its settings file, preventing other users to edit this shared menu
- QAP handles scenarios where the parent menu in the favorites dialog box "Menu Options" tab is changed, handling file locking if one or both menus are shared menus
- QAP display "Read-only" in the Settings window's content column and prevent opening this menu in the Settings window if it is saved in a folder where the user has no write access and for shared menus of type "Centralized" where user does not appear in the write-access users list
- QAP checks if a shared menu is in a read-only folder by attempting to create a temporary settings file in this folder, test filename being "~$_QAP_Test_file_nnn.ini", where "nnn" is a random number (by convention file sync tools like Dropbox ignore file starting with "~$")
- QAP checks if folders containing Shared menus files are read-only only once in a session; if the read-only setting of a folder is changed during QAP is running, QAP will consider it can be written to until QAP is restarted (this could cause a file write error, visible or not)
- when creating a Shared menu of type "Centralized", QAP automatically adds the current username to the write-access list (preventing the user to be locked out of its own new menu)
- in "Centralized" Shared menus write-access list, names can also be separated by semicolon (in addition to comma)
- QAP checks that an external settings file cannot be added under another external settings file (this is not supported in current version)
- QAP now supports Shared menu file locking in the "Manage icons" window (in previous QAP versions, this window was not properly handling shared menu file locking)
- in Settings window's "Content" column, QAP now displays the Shared menu settings file location

Version: 8.2.3 (2017-06-24)
- fix bug blocking removal of multiple favorites when user answers no when asked to confirm removal of a submenu
- fix label display bug under Remove button preventing showing the number of selected favorites

Version: 8.2.2 (2017-06-08)
- Test if user has write access when opening a collaborative Shared menu in Settings and give appropriate error message if user has no access
- In Shared Menus Catalogue, replace "&&" in menu names with single "&"
- Change QAP feature label "Add shared favorites menu from catalogue"
- In the Add Favorite dialog box, add info about Live Folder Options in Folder tip
- Fix display bug in Settings, change cursor to hand when mouse over some icons and labels

Version: 8.2.1 (2017-05-19)
- Multi-user change collision bug fixed (menu loaded on machine A; menu loaded on machine B; shared menu edited and saved on machine B; menu other than the shared menu edited on machine A
  -> BUG: machine A overwrites changes done on machine B; shared menu are now saved only if changes were done to the menu)
- when create Shared menu, force to select shared menu type
- support relative paths and environmenet variables for external menu file path
- fix bug when Add/Edit Favorite of type Shared menu, browse for external file and cancel browse
- add QAP feature to get direct access to the catalogue (Add a Shared menu from the catalogue)
- add tip below Shared menu catalogue list about double-click on a line to view the shared menu info

Version: 8.2 (2017-05-14)
 
Shared menus revamped
- three type of Shared menus
  1) Personal: menu shared on different computers by the same user
  2) Collaborative: menu on a shared drive for a team or a workgroup (every member can edit the menu)
  3) Centralized: menu on a shared drive maintained by one or more menu administrator(s)
- new "Shared menu" tab in shared menu favorites to select shared menu type (radio buttons), name and options
- options for "Centralized" shared menus: list of users with right to edit the shared menu (coma separated list), message about shared menu access shown to users without access
- Shared menu options are saved in the "[Global]" section of the share menu ini file, in variables "MenuName", "WriteAccessUsers", "WriteAccessMessage" and "MenuType"
- in favorites list, display Shared menu name and display "Read-only" if current user does not have write access to the centralized menu
- when adding a Shared menu, get the favorite name from the menu ini file if the variable "MenuName" exists
- deprecate the option "Number of the first favorite" in shared menu files (now favorites always starting at 1 but starting number in old menu are still supported)
 
Shared menus catalogue
- new option in "General" tab to "Enable Shared Menu Catalogue" and select the "Catalogue root folder"
- when user adds a Shared menu and when the catalogue is enabled, give user the option to select the Shared menu from a dialog box
- new Shared menu dialog box containing the shared menu files under the catalogue root with menu names, paths and checkboxes to select menu(s) to add to QAP popup menu
- in Shared menu dialog box, button "Add selected shared menu(s)" to add selected menu(s) from catalogue to the QAP menu at the current menu and position in favorites list
- in Shared menu dialog box, button "Add another shared menu" to browse the file system for any Shared menu settings file and add it to current position in favorites list
- in Shared menu dialog box, respond to double-click on a row by showing Shared menu info and a button to open the settings file in a text editor if it is not read-only
- new "ExternalMenusCataloguePathReadOnly" variable (in QAP ini file only) to prevent user from changing the catalogue root folder when value is 1, and display an error message if user tries to change the root if read-only
 
Shared menus mutli-user edition
- alert message when user tries to edit an external menu that was modified by another user or on another computer, based on last modification date-time
- reserve external menu when user loads a Shared menu in Settings or when user add or move favorites to a Shared menu, user and computer name are savec in the Shared menu variable "MenuReservedBy"
- release Shared menu reservation when user saves or cancels settings changes or quits QAP
- store and read last modified date in Shared menu ini file and update it only when favorites or external menu properties are changed, not when only reserved without changes
- in "About" dialog box, display user name and computer name
 
Other changes
- new Alternative menu QAP features "Open the Containing Folder in the Current Window" and "Open the Containing Folder in a New Window" to open the folder containing the selected document, application  or folder favorite in the current window or in a new window
- in Export file name, translate placeholder "%A_Now%" to current local date-time and "%A_NowUTC%" to current Coordinated Universal Time (based on computer time), using "YYYYMMDDHH24MISS" format
- in "Import/Export Settings", remember lats destination file in quickaccesspopup.ini when exporting and restore last used file name in when exporting settings
- in "Live folders", exclude folders with the Hidden (H) attribute (keeping those having System attribute without the Hidden attribute)
- enlarge submenus dropdown lists to 500 px in "Add/Edit Favorite" dialog box
- disable the popup menu during settings saving
- remove Patreon donation option; add Paypal links to make donations in EUR and CAD funds
- update to Spanish, Portuguese and Brazilian Portuguese language files
 
Bug fixes and improvements
- fix bug in Setup program when updating QAP causing QAP Explorer context menus to be re-enabled even if user turned them off in Settings
- fix bug "Open this menu" button missing in "Edit favorite" dialog box for Shared menus favorites

Version BETA: 8.1.9.6 (2017-04-01)
- in add/edit favorite, shared menu tab, change external type only if a value exists in external file loaded (no more default to type 1)
- adapt Shared menu note depending if we are in Add or Edit dialog box
- during saving settings, do nothing if user tries to open the popup menu
- fix bug in Setup program when updating QAP causing QAP Explorer context menus to be re-enabled even if user turned them off in settings

Version BETA: 8.1.9.5 (2017-03-28)
- when Shared Menu Catalogue root path is set in Options, display the Catalogue when user add Shared menu
- list all shared menu under the root path (excluding backups) to the Catalogue dialog box with shared menu names, shared menu paths and checkboxes to select shared menu to add to current menu at the current position in favorites list
- button Add selected shared menus
- button Add another shared menu to browse the file system for any shared menu settings file
- respond to double-click on a shared menu row by showing shared menu info with a button to open the shared menu settings file if it is not read-only
- update to Spanish, Portuguese and Brazilian Portuguese language files

Version BETA: 8.1.9.4 (2017-03-15)
 
Shared Menus
- in Add/Edit Favorite for external menus, replace the "Advanced Settings" tab with "Shared Menu" tab
- in the "Shared Menu" tab, add radio buttons for external menu types 1) Personal, 2) Collaborative (show menu name only) or 3) Centralized (show menu name, write access users and message)
- display alert message about write access when user change type for type 3
- store external menu type in external menu [Global] value "MenuType"
- for collaborative external menu, save "MenuReservedBy" value as "user (computer)" and prevent access if reserved
- for personal external menu, save "MenuReservedBy" value as "computer (user)" and display only alert and allow access if reserved
- in Options, improve Shared Menu Catalogue root path selection with text box and browse button
- in About, display user name and computer name

Version BETA: 8.1.9.3 (2017-03-10)
 
Shared menus (see updated FAQ page http://www.quickaccesspopup.com/can-a-submenu-be-shared-on-different-pcs-or-by-different-users/)
- error message when user tries to load an external menu that was modified based on file last modified date-time
- store and read last modified date of external file in ini file and update it only when favorites or external menu properties are changed, not when only reserved without changes
- update the last modified date-time of external ini file and in external menu object when user save changes
- reserve external menu when user loads the external menu in Settings or when user selects parent menu menu in add/edit favorite or move dialog boxes
- track user reserving an external menu writing his username in variable MenuReservedBy
- block external menu editing if menu is reserved except if reserved by current user
- release reserved external menus when user saves or cancels settings changes or quits QAP
- fix bug prevent editing favorites in read-only external menu from the Edit Favorite Alternative menu
 
Other changes
- enlarge submenus dropdown lists to 500 px in Add/Edit Favorite dialog box
- remove Patreon donation option; add Paypal links to make donations in EUR and CAD funds

Version BETA: 8.1.9.2 (2017-02-28)
 
Shared menus
- add to Options general tab the "Enable Shared Menu Satalogue" checkbox and prompt user for catalogue root when enabling
- add "ExternalMenusCataloguePathReadOnly" variable to QAP ini file to prevent user from changing the catalogue root and display an error message if user tries to change rthe root when read-only
- when user adds a favorite of type Shared menu and Shared Menu Catalogue root exists, give user the option to select the Shared menu from the catalogue (using file select dialog box at this time - to be improved)
- when adding a Shared menu, get the favorite name from the shared menu file if variable "MenuName" exists
 
Version BETA: 8.1.9.1 (2017-02-28)
 
Shared menus
- in Advanced settings tab, add "Read-only" checkbox and text boxes for "Shared menu name", "Users with write access to this shared menu" (coma separated list) and "Shared menu write access message"
- saving these values to shared menu ini file as soon as user click OK in "Add/Edit favorite" dialog box (not waiting for when user saves the favorites)
- values are saved in "[Global]" section under "MenuName", "WriteAccessUsers" and "WriteAccessMessage"
- grant write access to read-only shared menu to users having their Windows logon name in the "Users with write access to this shared menu" text box
- display shared menu name and write access message in error message when user tries to edit a read-only shared menu
- display shared menu name in content column of shared menu entries in Settings
- deprecate first line number value in external menu files, now always starting at 1 (starting number in old menu still supported; please advise me if this cause issue)

Version: 8.1.1 (2017-03-19)
 
Import/Export
- in Import/Export Settings, save destination file to quickaccesspopup.ini when exporting and restore last used file name in Export dialog dox
- in Export file name, translate placeholder "%A_Now%" to current local date-time and "%A_NowUTC%" to current Coordinated Universal Time (based on computer time), using "YYYYMMDDHH24MISS" format
 
Alternative menu
- new Alternative menu QAP features to open the folder containing the selected document, application  or folder favorite in the current window or in a new window
 
Various improvements
- in Live folders, exclude folders with the Hidden (H) attribute (keeping those having System attribute without the Hidden attribute)
- in Edit Favorite dialog box for a favorite of type Group, add a button to open the group in the Settings window
- enlarge submenus dropdown lists to 500 px in Add/Edit Favorite dialog box
- split Options dialog box first tab in two tabls (General and Menu options) to make some room for future options
- remove "Use Classic buttons" option in General tab ([Global] value "UseClassicButtons" still supported if present in ini file)
- remove Patreon donation option; add Paypal links to make donations in EUR and CAD funds
- tooltip "Saving..." and disable Cancel button in Settings during saving
 
Bug fixes
- support relative paths and environment variables in Live Folders
- fix bug prevent editing favorites in read-only external menu from the Edit Favorite Alternative menu

Version: 8.1 (2017-02-20)
 
Shortcuts
- display favorites shortcuts in a new column in the Settings
- when creating a favorites shortcut, support left only or right only keyboard modifiers for Shift, Alt, Ctrl and Win keys
- support different shortcuts for favorites with the same location (if they have different names), allowing them to have different options (in other words, favorite shortcuts are now linked to "name + location")
- update menu and dialog box labels to include menu shortcuts (underlined character, using the & special character)
 
Various
- in QAP Mouse Hotkey exclusion list, also exclude hotkey in app's dialog boxes when the app's title or class name is prefix an asterisk (*)
- add the QAP Features "Run as administrator" to the Alternative menu (Shift + Middle mouse button or Shift + Windows + W)
- new batch file from Dogan Celik to install/uninstall Windows Explorer context menus registry keys, working as-is with portable version (see instructions in batch file)
- group members can now be disabled (same as favorites being hidden in menu), change disable checkbox label for group members
- renamed the icon file iconQAP.ico to QuickAccessPopup.ico using the same ico file name for context menu registry keys in app, setup and portable batch
 
Bug fixes
- cover exceptional situation where icon "file,index" for an extension is badly encoded in registry (including ")
- fix bug when double-clicking on empty line in Hotkeys list
- fix bug in Hotkeys list, when change hotkey, enable save button only if a hotkey was changed
- fix bug when Menu hotkey in Options is changed from None to a keyboard shortcut
- add delay when changing folder in dialog box to help with an intermittent issue in in some apps like Firefox (delay in milliseconds stored in quickaccesspopup.ini "[Global]" variable "WaitDelayInDialogBox" with default 100)

Version BETA: 8.0.9.2 (2017-02-14)
- exclude QAP mouse hotkey in dialog boxes based on the title or the class name of the dialog boxes parent window; for title or class prefixed with "*" in exclusion list, QAP will also exclude app's dialog box
- group members can now be disabled (same as favorites being hidden in menu), change disable checkbox label for group members
- add delay in navigate dialog box to solve (partly?) an intermittent issue in Firefox (and other apps?) dialog box; store delay in ini file variable WaitDelayInDialogBox (default 100 ms)
- add separator before RunAs in Alternative menu

Version BETA: 8.0.9.1 (2017-02-05)
- add the Run as administrator command to the Alternative menu (Shift + MMB or Shift + Windows + W)
- display shortcuts in a new column in the Settings
- in favorites shortcuts, support left only or right only keyboard modifiers for Shift, Alt, Ctrl and Win keys
- support different shortcuts for favorites with the same location with different options, if they have different names (hotkeys are now linked to "name + location")
- update menu and dialog box labels to include menu shortcuts (underlined character, using the & special character)
- new batch file from Dogan Celik to install/uninstall Windows Explorer context menus registry keys, working with portable version without editing
- renamed the icon file iconQAP.ico to QuickAccessPopup.ico using this ico file for context menu registry keys in app, setup and portable batch
- fix bug double-click on empty line in Hotkeys list stop opening an empty Change hotkey dialog box
- fix bug in Hotkeys list, when change hotkey, enable save button only if a hotkey was changed
- fix bug when Menu hotkey in Options is changed from None to a keyboard shortcut
- cover exceptional situation where icon file,index for an extension is badly encoded in registry (including ")

Version: 8.0.4 (2017-01-11)
- fix bug in Manage Hotkeys list not retrieving correct favorite on double-click
- alert about menu shortcuts to user when inserting ampersand (&) in short name for the menu
- update to Chinese and French language file

Version: 8.0.3 (2017-01-09)
- fix small issue with check for update command

Version: 8.0.2 (2017-01-08)
- fix Settings dialog box issue with Chinese translation
- update current year in About dialog box
- update to Sweeden, Italian, Portuguese, French and Spanish language files

Version: 8.0.1 (2017-01-07)
- add NbLiveFolderItemsMax default value to QuickAccessPopup.ini to make it easier to change this value
- links updated in Support freeware dialog box

Version: 8 (2017-01-03)

Live Folder options
- To enable a Live Folder favorite, add or edit a Folder favorite and go to the new tab "Live Folders Options". In this tab you can select:
  - the checkbox "Live Folder" to transform this favorite into a menu (and submenus) refreshed with the current content of the folder (and its subfolders)
  - an option to set the "Number of subfolders levels to include in the Live Folder menu" (1 by default - keep it low for large folders)
  - an option to "Include Documents" in the Live Folder
  - an option to "Include" or "Exclude" documents by file extensions
  - an option to split Live Folder menu in columns of a given "Number of items per column (0 for no column break)"
- Add the new QAP Feature "Refresh Live Folders menus" to your menu to refresh Live Folder on-demand (normally, Live Folder menus are refreshed when you launch QAP of when you save changes in Settings)
- QAP adds items to Live Folders up to a maximum of 500 items; if this number is exceeded, it displays an alert message
- You can edit a Live Folder favorite in the "Settings" window or using the Alternative menu "Edit a Favorite" (Shift+Middle Mouse Button or Shift+Win+W) and also by clicking any item in a Live Folder menu with Shift+Ctrl menu modifiers pressed
- More info: http://www.quickaccesspopup.com/can-a-menu-be-updated-as-the-content-of-a-folder-changes/

New menu icons
- QAP now uses new color icons from the shared file JLicons.dll installed with QAP
- In "Easy Setup" mode, this file JLicons.dll is saved in the shared applications folder "C:\ProgramData\JeanLalonde"
- In "Portable" mode, the file JLicons.dll is included in the portable ZIP file and must be kept in the same folder as QAP executable file
- This change frees QAP from its dependency on Windows files shell32.dll and imageres.dll
- Using this icons library, menu icons can now be enabled on Windows Server versions.
- Icons from: www.icons8.com

Manage Icons
- The new "Manage Icons" dialog box gives an overview of your current favorites menu icons with buttons to pick a new icon or reset the default icon for each favorite
- Click the new button "Icons" in the Settings window (lower right) or add to your menu the QAP Feature named "Icons"
- In Options (General tab), the numeric value "Manage Icons window rows" alloow to set the height of the window in case the height is calculated based on inaccurate info returned by Windows (this happens sometimes)

Various improvements

Settings window
- New color buttons in Settings window and a new option (first tab) to "Use  classic QAP buttons" (black & white) if you prefer the old style buttons
- Stop rebuilding all menus after each add or edit favorite
- Replace the "Save" button in Settings with two buttons: "Save & Close" and "Save & Reload", the latter keeping the Settings window open after reloading the menu (this replaces holding the Shift or Alt modifier keys when clicking the Save button in previous versions)
- When changes are unsaved in the Settings window, if the QAP menu is called or if a favorite is launched via hokey, QAP will prompt user for one of these actions: "Save" - save settings, "Settings" - go to settings or "Cancel" - just cancel the requested action
- Add a confirmation prompt before deleting a group in Settings

Manage Hotkeys window
- New item order column in Hotkeys list to sort initialy favorites with hotkeys following the QAP menu order
- Stop displaying group members in Hotkeys list (this was useless since hotkeys could not be assigned to individual group members)
- In the "Change hotkey" dialog box, new links "Enter" and "Escape" allow to select Enter or Escape as hotkey (idealy associated with keyboard modifiers like Shift, Alt or Ctrl)

Shared menus
- When saving a Shared menu settings file, compare the last modified date after saving and display an error message if the date was not updated (probably because the target file is read-only)
- Display an error message if a new Shared menu settings file cannot be created (probably because the target folder is read-only)
- Automatically append the .ini extension when selecting a Shared menu settings file
- Note that Quick Access Popup still does not manage conflicts if a Shared menu is modified by different users at the same time (see Shared menu help page for more info)

Other improvements
- New option in Options window (Menu hotkeys tab) to enable left or right double Ctrl hotkey (press left or right Control key twice) to open main QAP menu
- Add .cmd extension to the list of supported application extensions (with .exe, .com, .bat, .ahk and .vbs) when adding a favorite by drag and drop or using Explorer context menus
- Append .ini extension if destination export file has no extension when exporting settings
- Replace the "QAP working" notification when rebuilding menu with a small popup message listing the updated menus, close to mouse cursor location
- Record Windows Explorer window position when adding a folder from Windows Explorer context menu (allowing to restore this window position in the "Window Options" tab when launching the folder)
- Add to QuickAccessPopup.ini the setting "AlternativeTrayIcon" under "[Global]" section to set a tray icon replacement (replacement file must be an .ico file)
- In Options, General tab, the new checkbox "Add automatically at the top of menu" makes sure favorites added automatically with "Add this folder", "Add this folder Express" or "Add favorite" from Windows Explorer context menus are added at the top of main menu (by default they are added at the top and, if unchecked, they are added at the bottom)
- Support the new placeholder "{CUR_LOC}" in folder, document and application favorites locations allowing to create favorite with a location relative to the folder where the QAP menu is opened
- Add up/down buttons to numeric values in various settings in Options and Add/Edit favorite windows
- When installing an update with the "Easy Setup" mode, reduce the number of pages (clicks) in setup procedure from 7 to 3

Bug fixes
- Fix bug working directory not being shown in edit favorite advanced setting tab for application favorites
- Changes made in Hotkeys list window are now properly cancelled if user cancels changes in Settings window
- Fix bug when editing a QAP Feature or Special folder favorite from Alternative menu, QAP Feature or Special folders drop down list is now correctly initialized

Language updates
- Update to Spanish, French, Italian, Portuguese, Chineese (TW), Brazilian-Portuguese and German language files

Version BETA: 7.9.2.4 (2017-01-02)
- re-enable menu icons on Windows Server versions
- translate Left and Right words for Ctrl-Ctrl option in Options 2nd tab
- rework compile and setup tools, change beta app icon

Version BETA: 7.9.2.3 (2016-12-12)
- support {CUR_LOC} placeholder for folder, document and application favorites
- update to PT, ES, FR, IT, PT-BR language files

Version BETA: 7.9.2.2 (2016-12-04)
- in Manage Icons, display default icon as current when current icon is empty in Settings
- fix favorite name header in Manage Icons window
- make bold the parent menu column header in manage icons
- add Paste and Paste Special icons and use the as default icons for text and macro Snippet favorites
- add to Options a numeric value to set the Manage Icons number of rows (in case the number calculated automatically is wrong)
- allow to edit a live folder favorite using Alternative menu or Shift+Ctrl menu modifiers by selecting any item in a live folder
- add up/down buttons to numeric values in options and edit favorite windows
- fix old bug when edit a QAP or Special folder favorite from Alternative menu, QAP feature or Special folders drop down list is now correctly initialized

Version BETA: 7.9.2.1 (2016-11-29)
- add option to add folder automatically at top or bottom of main menu (default at top) when added with Add this folder, Add this folder Express and Add favorite from Explorer context menus
- fix icon for Add Favorite QAP feature
- change approach to getting screen height for Manage Icons window
- add diagnostic code for screen height detection in Manage Icons

Version BETA: 7.9.2 (2016-11-24)
- add Manage Icons dialog box giving an overview of current icons of favorites with buttons to pick a new icon of set the default icon for each favorite
- add Manage icons button in Settings window and rearrange buttons layout in Settings
- add Manage icons QAP feature allowing to add the feature to QAP menu
- new JLicons.dll version 1.1, moved to shared app folder in setup mode

Version BETA: 7.9.1.5 (2016-11-19)
- fix small display bug in Live folder tab of Edit Favorite dialog box

Version BETA: 7.9.1.4 (2016-11-18)
- fix bug with Live folder filtering
- stop building live folders if max number exceeded (default 500 menu items)
- add "NbLiveFolderItems" setting under "[Global]" section of QuickAccessPopup ini file
- display an alert message if Live folders limit is exceeded
- reset live folder options when Live folder checkbox is turned off

Version BETA: 7.9.1.3 (2016-11-17)
- fix bug with language switching
- fix bug with Live folder filtering

Version BETA: 7.9.1.2 (2016-11-16)
- in Live folders, stop showing a virtual sub-menu if folder does not contain sub folders or documents of desired extensions
- add QAP feature Refresh QAP menu (useful when using Live folders - must be added to menu)
- add ini setting AlternativeTrayIcon in Global section to set a tray icon replacement (file must be .ico)
- use new QAP icon for QAP exe files and setup file, add new icon file to portable zip file
- add links allowing to select Enter and Escape as hotkey in the Change hotkey dialog box

Version BETA: 7.9.1.1 (2016-11-13)
- use icons from new JLicons.dll file installed with QAP or included in the portable ZIP file
- save favorite icons reference in ini file using index name for icons from JLicon.dll
- when settings changes are unsaved and menu is called or favorite is launched via hokey, ask user if save settings, go to settings or cancel requested action
- add cmd extension to supported application when adding favorite by drag and drop or using context menu
- record window position when adding a folder from context menu

Version BETA: 7.5.9.8 (2016-11-06)
Settings window:
- stop launching favorites with hotkeys if changes are unsaved in Settings window
- confirm before deleting a group in Settings
Hotkeys:
- changes done in Hotkeys list are now properly cancelled if user cancel changes in settings
- display item order column in Hotkeys list and sort initialy on this column following the QAP menu order
- stop displaying group members in Hotkeys list
Shared menus:
- compare last modified date after saving shared settings file and display an error message if date is identical (probably because the target file is read-only)
- display an error message if a new shared settings file cannot be created (probably because target folder is read-only)
- append .ini extension if destination export file has no extension when exporting settings
- append .ini extension when browsing/creating a shared settings file
- stop prompting to create file when selecting shared menu file

Version BETA: 7.5.9.7 (2016-11-02)
- fix bug when after creating a menu, saving Settings and stay in Settings, the new menu was not properly reloaded
- stop showing the main menu if changes are unsaved in Settings window

Version BETA: 7.5.9.6 (2016-10-30)
- new color buttons for Settings window
- new option (first tab) to keep classic black & white buttons
- reload if classic buttons option changed
- change spacing for big buttons in gui
- disable or hide controls in windows options tab when selecting live folder
- language update for German, Spanish, French, Brazilian-Portuguese

Version: 7.5.4.3 (2016-10-30)
- reduce the number of pages (clicks) in setup procedure from 7 to 3 when installing an update
- language update for German, Spanish, French, Italian, Portuguese, Brazilian-Portuguese and Chineese (TW)
- fix bug working directory not being shown in edit favorite advanced tab for application favorites

Version BETA: 7.5.9.5 (2016-10-23)
- add Save & reload button to Settings (this replaces holding a modifier key when clicking the save button)
- rename existing Save button to Save & Close
- fix bug working directory not being shown in edit fav adv tab for application favorites

Version BETA: 7.5.9.4 (2016-10-18)
- Avoid editing folder favorite in live folder from Alternative menu
- Finish move live folder settings to a new tab in Add/Edit Favorite folders
- Simplified version comparison in Check for updates
- Spanish and Brazilian Portuguese language updates

Version BETA: 7.5.9.3 (2016-10-16)
- Merge changes from master version v7.5.4.2 (update RECOMMENDED: improvements against risk of QAP submenus favorites data loss)
- Move live folder settings to a new tab in Add/Edit Favorite folders
- Add an option in live folder to include or exclude files by extensions
- Italian, Portuguese and Chineese (TW) language updated
- Reduce the number of pages (clicks) in setup procedure from 7 to 3 when installing an update

Version: 7.5.4.2 (2016-10-13)
- Update RECOMMENDED: improvements against risk of QAP submenus favorites data loss
- add external menu values external path and loaded in menu object backup;
- when loading submenu favorite from ini file, recreate menu path in case the value is empty (possible for settings saved with v7.4.0.2 to v7.4.2)

Version BETA: 7.5.9.2 (2016-10-09)
- Update MANDATORY: risk of data loss!
- From v7.5.4.1: Fix bug when canceling changes to Favorites list in Settings, that could then potentially cause loss of data if saving new changes to settings file after cancellation
- Related to this bug: add live folder settings to backup in case user cancels settings changes
 
Live Folders
- Remove Refresh option
- Add Documents option to include files in live folders
- Add Columns option to set the number of items per columns in liove folder menu (empty for no column)
- Sort live folders content with folders first, then files
- Replace the "QAP working" rebuild notification with a tooltip displayed at mouse location and listing the updated menus;
- Stop rebuilding all menus after each add or edit favorite
- Language for live folder options, English and French
 
Other
- Fix bug after favorites saved with Shift-Save

Version BETA: 7.5.9.1 (2016-10-02)
 
Live Folder favorites
- Option in Add favorite dialog box to display a favorite of type Folder as a subfolders menu
- In Advanced Settings, an option to set the number of subfolders levels included in the Live Folder menu, 1 by default (keep it low for large folders)
- In Advanced Settings, an option to refresh the Live Folder every time the menu is displayed, off by default (disabled in this version)
 
Other new feature
- Add left or right Ctrl + Ctrl (press left or right Control twice) to open main QAP menu (enable this in Options, tab 2).
 
Language updates
- Spanish and French

Version: 7.5.4.1 (2016-10-09)
- Fix bug when canceling changes to Favorites list in Settings, that could then potentially cause loss of data if saving new changes to settings file after cancellation

Version: 7.5.4 (2016-09-21)
 
Application favorites
- in advanced settings, support placeholders {CUR_...} for current location where this favorite is launched: {CUR_LOC} (full folder), {CUR_NAME} (last folder), {CUR_DIR} (folder containing last folder) or {CUR_DRIVE}
- in advanced settings, add a check box to set the "Start In" directory (working directory) to the current location where this favorite is launched
 
Various bux fixes or little improvements
- backup [Favorites] under the name [Favorites-backup] section in settings file before save the new favorites
- when using Add this folder command, if folder path starts with "ftp://", add an FTP favorite
- in Settings, block backdoors allowing to enter in read-only shared menu or to move items to these menus
 
Total Commander
- in TC Directory Hotlist, support folders relying on file system plugins like VirtualPanel (stop checking if file exist before launching these folders with TC)
 
Directory Opus
- fix bug then folder includes special characters (like &apos;) when getting the current lister in DOpus (used in Add this folder and in current location placeholders)
 
Language updates
- German, Sweeden, Portuguese, Brazilian-Portuguese and Italian

Version: 7.5.3 (2016-09-15)
(release for translators only)

Version: 7.5.2 (2016-09-12)
- fix bug backup files being deleted/overwritten when the main menu includes a shared menu
 
Version: 7.5.1 (2016-09-11)
- fix bug after switching settings hotkeys could not be read and modified in Options
 
Version: 7.5 (2016-09-11)
 
Import/Export Settings
- add "Import/Export Settings" menu to Tray menu (right-click QAP icon in Notification zone)
- add "Import/Export Settings" to QAP Features list allowing to insert this feature to your QAP menu
- choose to import or export any or all of these settings groups: favorites, hotkeys, alternative menu hotkeys, global settings and themes
- export QuickAccessPopup.ini sections to any existing or to a new configuration (.ini) file
- import from any existing .ini file complying with QuickAccessPopup.ini structure
- replace or append favorites to the destination settings file
- check for unsaved settings before importing or exporting setings
- reload QAP after settings import
 
Switch Settings file
- add "Switch Settings file" menu to Tray menu (right-click QAP icon in Notification zone)
- add "Switch Settings" feature to QAP Features list allowing to insert this feature to your QAP menu
- change the settings file (.ini) to any file complying with QuickAccessPopup.ini structure
- check for unsaved settings before switching settings file
- reload QAP after switching to a new settings file
- settings file can be configured from command-line parameter "/Settings:", for example: QuickAccessPopup.exe "/Settings:C:\My Folder\My Settings.ini"
- settings fle name can include environment variable and support relative paths based on the QAP working directory
 
Other changes or bug fixes
- Total Commander "TC Hotlist" menu can be updated when AlternateUserIni parameter is used in [Configuration] section of wincmd.ini
- QAP feature to "Switch" applications now excludes "ghost" Windows 10 apps (pre-loaded by Windows but never used)
- context menus now use QAPmessenger.exe v1.1 with diagnostic code saved to QAP working directory when debugging is activated
- addition of xplorer2 (v3.2.0.2) to list of supported alternative file managers in QAPconnect.ini
- include external menus in hokeys manager list
- display localized favorite type in hotkeys manager list
- German language update

Version BETA: 7.4.3.3 (2016-09-08)
- Add "Import/Export Settings" and "Switch Settings" features to QAP Features list (allowing to insert these features to any menu)
- Test for code signing certificate

Version BETA: 7.4.3.2 (2016-09-05)
 
Import/Export Settings:
- add "Import/Export Settings" menu to Tray menu (right-click QAP icon in Notification zone)
- choose to import or export any or all of favorites, hotkeys, alternative menu hotkeys, global settings and themes
- import from any existing .ini file complying with QuickAccessPopup.ini structure
- export QuickAccessPopup.ini sections to any existing or new Windows configuration (.ini) file
- replace or append favorites to the destination settings file
- check for unsaved settings before importing or exporting setings
- reload QAP after settings import
 
Switch Settings file:
- add "Switch Settings file" menu to Tray menu (right-click QAP icon in Notification zone)
- change the settings file (.ini) to any file complying with QuickAccessPopup.ini structure
- check for unsaved settings before switching settings file
- reload QAP after switching to a new settings file
- settings file can be configured from command-line parameter "/Settings:<file>", for example: QuickAccessPopup.exe "/Settings:C:\My Folder\My Settings.ini"
- fle name can include environment variable and support relative paths based on the QAP working directory
 
Other:
- Total Commander "TC Hotlist" menu can now read hotlist data when AlternateUserIni parameter is used in [Configuration] section of wincmd.ini
- QAP feature "Switch" excludes Windows 10 apps auto-loaded from Switch app menu (work in progress)

Version BETA: 7.4.3.1 (2016-09-01)
- add diagnostic code to test active window when opening a favorite and context menu messaging

Version: 7.4.3 (2016-08-23)
Bug fix
- revert change done in in v7.4.0.2 and save again to settings the path (for example: "> submenu-1 > submenu-2") for favorites of thypes Menu, Group and Shared; this fixes the broken shortcuts for favorite of these types.
- NOTE for users of Shared menus: favorite shortcuts for items inside shared menus will work only if shared menus has same path from main menu (Main > submenu-1 > submenu-2) on all QAP installations that include this shared menu (this does not impact read-only external menus)
 
Version: 7.4.2 (2016-08-22)
 
New features:
- keyboard modifiers when selecting a favorite in the popup menu (Shift for "Open in New Window", Control for "Copy Favorite Location" and Shift+Control for "Edit Favorite")
- when clicking the "Save" button in the "Settings" window, save the favorites without closing the "Settings" window when one of these keys is pressed: Shift, Control or Alt
 
Icons and desktop.ini (Windows icons)
- when building a menu, if an icon has a relative path, make it absolute based on the QAP working directory
- when retrieving an icon from a desktop.ini file, if the folder location has a relative path, make it absolute based on the QAP working directory before reading desktop.ini
- when retrieving an icon from a desktop.ini file, if the icon resource file has a relative path, make it absolute based on the favorite folder (not the QAP working directory)
- when creating a desktop.ini file if the icon resource file is located in the favorite folder itself, create the icon resource file without its path in order to make it relative to the folder and movable with the folder
 
Language files
- updated Spanish, French, Italian, Portuguese, Portuguese-Brazilian, German and Sweden language files
 
Other improvements or bug fixes
- feature change: when using "Add This Folder", QAP still records the current window position but keep the "Use default window position" checked (user must uncheck it to restore window position when opening the favorite folder)
- simplifiy "Change folder in dialog boxes" option (no more double checkbox)
- show the "Change folder in dialog boxes" alert just before opening a favorite instead of before showing the menu
- show the "Change folder in dialog boxes" alert (only) the first time the user selects a favorite folder over a dialog box
- display proper error message when trying to launch a Link favorite with invalid URL
- fix bug check4update prompt not skipped for beta version after user asked to skipped
- fix bug introduced in v7.4.0.2: save group location to ini file
- fix a bug in v7.4.1 not showing some icons for favorite of type "Special"

Version: 7.4.1 (2016-08-21)
Same features as v7.4.2 minus:
- fix a bug in v7.4.1 not showing some icons for favorite of type "Special"

Version BETA: 7.4.0.2 (2016-08-16)
- show the "change folder in dialog boxes" alert just before opening a favorite instead of before showing the menu
- show the "change folder in dialog boxes" alert (only) the first time the user selects a favorite folder over a dialog box
- simplifiy "change folder in dialog boxes" option (no more double checkbox)
- do not save submenu path to ini file - this is not required and could be misleading when external menu are saved in different locations
- updated Spanish, French, Italian, Portuguese, Portuguese-Brazilian, German and Sweden language files

Version BETA: 7.4.0.1 (2016-08-05)
- keybord modifiers when selecting a favorite in the popup menu (Shift for "Open in New Window", Control for "Copy Favorite Location" and Shift+Control for "Edit Favorite")
- save settings without closing window when one of the keys Shift, Control or Alt is pressed when clicking the Save button
Bug fixes
- when just added a shared menu, location column in Settings favorites now show  ">>" instead of ">"
- display proper error message when trying to launch a Link favorite with invalid URL

Version: 7.4 (2016-07-31)
Hidden (disabled) favorites)
- add favorite option "Hide this favorite in menu" in all types of favorites
- hidden favorites are displayed in favorites list and hotkeys list with type name between parenthesis
Bug fixes
- fix bug when column breaks are inserted in submenus
- make Total commander open folders in new window in the TC active pane instead of always in the left pane
- close QAP automatically if it is running when updating or uninstalling with setup tool

Version BETA: 7.3.9.2 (2016-07-29)
- in hotkeys list, display disabled favorite type between parenthesis
- make Total commander open folders in new window in the TC active pane instead of always in the left pane
- close QAP automatically if it is running when updating with setup tool
- close QAP automatically when uninstalling with setup tool (to prevent restoring the Explorer context menus after uninstall if app is still running)

Version BETA: 7.3.9.1 (2016-07-26)
- add favorite option "Hide this favorite in menu" in all types of favorites
- hidden favorites are displayed in favorites list with type name between parenthesis
- fix bug when column breaks are inserted in submenus

Version: 7.3.2 (2016-07-03)
- completely fix bug Directory Opus and Total Commander path not saved to ini file
- add a note to dialog box about Windows delay when changing folder icon with desktop.ini
- update to Spanish, French, Portuguese and Brazilian Portuguese language files

Version: 7.3.1 (2016-06-26)
- adapted icons management to new icon file imageres.dll dated 2015-10-30 in Windows 10
- adapted QAPupdateIconsWin10 (now v1.1) to new icon file imageres.dll dated 2015-10-30 in Windows 10
- fix GIT sync error impacting code management
- fix bug path not saved until reload after changing file manager from/to Directory Opud or Total Commander
- fix bug preventing to show QAP menu from context menus when a QAP dialog box is open

Version: 7.3 (2016-06-22)
 
Context menus
- context menus for: Explorer folders and files icons, Explorer background (white space) and Desktop background
- context menu actions (right-click): Add Folder to menu, Add File to menu, Show menu
- context menu advanced actions (Shift + right-click): Add Folder to menu Express, Add File to menu Express, Show Alternative menu
 
For the standard "Easy one-step" installation users (Setup)
- change to setup procedure to create registry keys for QAP context menu at installation and removed them when user uninstalls the app (using Inno Setup tool)
- add a check box in Option ("General" tab) to enable/disable QAP Explorer context menus (enabling or disabling scripts will ask to run with elevated administrator privileges)
- creation of the context menus help page (http://www.quickaccesspopup.com/explorer-context-menus-help/)
- fix bug in the uninstall procedure that was not properly checking that QAP was not running before uninstalling it (now, QAP must be closed by the user before installing and uninstalling it)
- fix bug that prevented the Startup folder shortcut to be removed when uninstalling the app 
 
Changes for portable installation users
- addition to the portable package of the scripts to add and delete manually QAP Explorer context menus: QuickAccessPopup-InstallContextMenus_reg.txt and QuickAccessPopup-RemoveContextMenus_bat.txt (see instructions in these files)
- addition of the executable file QAPmessenger-1_0-32-bit.exe required to send commands from the Explorer context menus to QAP (this file should be saved in the same folder as the QAP executable file)
 
Other changes (all users)
- add a check box in Add Application favorite dialog box (in "Advanced Settings" tab) to run favorite application with elevated privileges using the "Run as" command
- for QAP users upgrading from Windows 7 to Windows 10, add the utility to adapt references to icons in the new Windows 10 icons files (see the startup menu "Update QAP Icons from Window 7 to Windows 10" or run the file "QAPupdateIconsWin10-1_0-32-bit.exe")
- when "Add This Folder" command is called from QAP icon in the Notification zone, reactivate the last used file manager window to detect the folder to add
- when called from QAP icon in the Notification zone, display the popup menu a little higher than the taskbar area (preventing occasional overlap)
- disable QAP hotkeys when changing hotkeys, solving assignement issues in some situation

Version BETA: 7.2.3.6 (2016-06-20)
- when called from QAP icon in the Notification zone, display the popup menu higher than the taskbar area
- remove extra & in Language in change language dialog box message
- disable QAP hotkeys when changing hotkeys solving assignement issues in some situation

Version BETA: 7.2.3.5 (2016-06-16)
- fix bug when adding folder from context menu and target folder is a drive root (e.g. C:\)
- reactivate the last file manager window (Explorer, DOpus or TC) before getting the current folder when "Add This Folder" command is called from QAP icon in the Notification zone
- add tip dialog box if "Add This Folder" command failed after being called from QAP icon in the Notification zone

Version BETA: 7.2.3.4 (2016-06-13)
- No change to the main QAP executable file
- Addition od the context menus help page (http://www.quickaccesspopup.com/explorer-context-menus-help/)
 
Changes for portable installation users
- Addition to the portable setup zip file of the executable file QAPmessenger-0_4-32-bit.exe used to send commands from the Explorer context menus to QAP (this file should be saved in the same folder as the QAP executable file)
- Addition to the portable setup zip file of the text files used to add or remove QAP Explorer context menus: QuickAccessPopup-ContextMenus_reg.txt and QuickAccessPopup-RemoveContextMenus_bat.txt (see instructions in these files on how to rename, edit and execute these script files)
 
Change for the standard installation
- fix bug in the uninstall procedure that was not properly checking that QAP was not running before uninstalling it (now, QAP must be closed before uninstall)

Version BETA: 7.2.3.3 (2016-06-08)
- Registry keys for QAP context menu are now created during setup (by Inno Setup tool) and removed when user uninstalls the app
- Context menu registry keys can also be removed or recreated using the "Enable Context menus" checkbox in Options (first tab)
- Create context menus for: Explorer folders and files icons, Explorer background (white space) and Desktop background
- Context menu actions: Add Folder to Quick Access Popup menu (regular and express), Add File to Quick Access Popup menu (regular and express), Show Quick Access Popup menu, Show Quick Access Popup Alternative menu
- Fix bug that prevented the Startup folder shortcut to be remeved when uninstalling the app 

Version BETA: 7.2.3.2 (2016-05-30)
- fix a path bug, now using custom path selected in setup program
 
Version BETA: 7.2.3.1 (2016-05-29)
 
Context menus
- add an option to enable/disable QAP Explorer context menus (enabling or disabling requires running with administrator privileges)
- at first QAP execution (when ini file is absent), if running in setup mode, check the ExplorerContextMenus value in setup ini file and enable context menu if required, and set ExplorerContextMenus value in QAP ini file
- context menu localized language
 
Other
- add advanced option for application favorite to run apps with elevated privileges using the run as command
- remove unused DynamicMenusRefreshRate ini value

Version: 7.2.2.1 (2016-05-25)
- change Add This Folder icon for an icon identical in previous and current Windows 10 icons file (imageres.dll)

Version: 7.2.2 (2016-05-24)
Snippets:
- implement macro snippet commands Sleep, SetKeyDelay and KeyWait
- add configurable prompt before pasting a text snippet or launching a macro snippet
- fix bug Alternative menu Edit a favorite and Copy favorite location not working with snippets
- fix bug when launching Snippet using Alternative menu "Open in new window"
 
Shared menus (aka External menus)
- in Add Favorite dialog and other boxes, change "External menu" to "Shared menu"
 
Other:
- new language Portuguese (PT), thanks to Luis Neves
- new language Simplified Chinese language (ZH-CN), thanks to Jess Yang
- do not display "None" in startup notification if mouse or keyboard hotkey is not used
- in What's new dialog box, add a vertical scroll bar when the text zone is very long
- if a startup shortcut for FoldersPopup exists after QAP installation, remove it
- fix bug double-click on separator was displaying wrong message "cannot be copied"

Version BETA: 7.2.1.3 (2016-05-18)
- fix bug in v7.2.1.2 preventing editing and running macro snippets

Version: 7.2.1.2 BETA (2016-05-12)
Snippets:
- add configurable prompt before pasting a text snippet or launching a macro snippet
- fix bug Alternative menu Edit a favorite and Copy favorite location not working with snippets
- fix bug when launching Snippet using Alternative menu "Open in new window"
 
Shared menus (aka External menus)
- in Add Favorite dialog and other boxes, change "External menu" to "Shared menu"
 
Other:
- new language Portuguese, thanks to Luis Neves
- do not display "None" in startup notification if mouse or keyboard hotkey is not used
- in What's new dialog box, add a vertical scroll bar when the text zone is very long
- if a startup shortcut for FoldersPopup exists after QAP installation, remove it
- fix bug double-click on separator display wrong message "cannot be copied"

Version: 7.2.1.1 BETA (2016-05-03)
- implement macro snippet commands Sleep, SetKeyDelay and KeyWait

Version: 7.2.1 (2016-05-03)
 
SNIPPETS
- add new favorite type "Snippet" to paste pieces of text from the QAP popup menu or hotkeys
- snippet is pasted to the active window at the current insertion point
- an option in "Advanced settings" can make a snippet be sent as "Text" (default) or as "Macro"
- snippets of type "Text" are pasted to the active window using the clipboard (the original clipboard content is preserved)
- snippets of type "Macro" are sent as keystrokes supporting AHK special characters (handle with care - see help page)
- if snippet is selected by clicking on Taskbar, on QAP icon in Notification area (Tray icon) or on Desktop, a keyboard pause allows user to select the insertion point and press the Enter key to start pasting (timeout after 10 seconds)
- in snippet text, end-of-line and tab characters can be processed automatically or entered as special codes (`n for new line and `t for tab)
- add help link in Add/Edit favorite for snippets
 
EXTERNAL MENUS
- add "External menu" favorite type allowing to load favorites from a shared .ini file
- external menu can be modified as regular submenus
- external menu can be made read-only by adding the value "MenuReadOnly=1" in the ini file "[Global]" section
- first favorite number in external settings file can be configured in "Advanced settings"
- external menu settings file path supports relative paths, environment variables, UNC and HTTP paths
- if external menu settings file cannot be loaded properly, give an error message, display menu as unavailable in Settings favorites list and block menu editing
- removing an external menu from QAP menu does not delete the external menu settings file
- add help link in Add/Edit favorite for external menus
 
Bug fixes
- fix bug Settings window occasionally opening inavertandly when clicking on the QAP tray icon (when Total Commander and Directory Opus as file manager only)
- option "Open Menu on Taskbar" is now considered
- column breaks now inserted in menu when called from a hotkey and now inserted at the correct position in submenus
- stop checking for prod update if user decide to download the newest beta version
- stop launching Directory Opus when refreshing the list of open folders in listers if Directory Opus is not running
- add the auto-detection of .ahk and .vbs extensions when user add a favorite using drag-and-drop to the Settings window
 
Other
- French, Italian and Swedish language update new v7.2 features
- new runtime v1.1.23.5 from AHK

Version: 7.2 (2016-05-03)
- incomplete release, fixed in v7.2.1

Version BETA: 7.1.99.11 (2016-05-01)
- fix bug Settings window opening when clicking on the QAP tray icon
- fix bug when trying to get a Snippet location using Alternative menu feature "Copy a Favorite's Path or URL"
- add auto-detection of .ahk and .vbs extensions when user add a favorite using drag-and-drop to the Settings window

Version BETA: 7.1.99.10 (2016-04-30)
- new runtime v1.1.23.5 from AHK
- same features

Version BETA: 7.1.99.9 (2016-04-29)
- fix bug when trying to edit an external submenu just created
- validate that external settings file is an .ini file or add .ini extension if no extension is provided
- completely delete old favorites in external menu settings files when saving current favorites
- stop launching Directory Opus when refreshing the list of open folders in listers if Directory Opus is not running
- update to Portuguese-Brazilian and Swedish language files

Version BETA: 7.1.99.8 (2016-04-23)
- fix bug column breaks now inserted in menu when called from hotkey
- fix bug column breaks now inserted at the correct position in submenus
- fix bug option Open Menu on Tarskbar is now considered
- refactor processing/filtering mouse clicks on taskbar and tray icon, remove unused code
- paste snippet with keyboard pause if menu clicekd on taskbar, on tray icon or on Desktop
- encode external menu settings file path from http to unc format; refactor http to unc transformation as a function
- validate that external menu settings file exists
- do not abort menu load if error is in an external settings file, instead, give adapted error message
- if external settings file did not load, display unavailable in settings gui list, block editing external menu in settings and do not save external menu
- add help link in add/edit favorite for external menus
- italian language update for v7.1.10 features
- french language update for v7.1.99.8 features

Version BETA: 7.1.99.7 (2016-04-17)
External menu:
- add External menu favorite type, label, etc.
- load external menu settings ini file using working directory field for external file location and group settings field for external menu starting line
- manage error reading settings file
- save external menu to external settings ini file
- adapt Add/Edit favorite dialog box to external menus
- adapt settings window to manage external menus (listview, buttons, etc.)
- items in external menu with "[Global]" value "MenuReadOnly=1" cannot be modified
- init read-only value to 0 in new external menu settings file
- removing external menu (does not delete the external menu settings file)
- build menu including external menu
- support relative paths and env vars in external menu settings file path
- make starting line in external ini file read-only when editing favorite (cause error if allowed)
Snippet:
- wait for Enter up to 10 seconds (instead of 5) when paste a snippet with QAP menu popped from QAP icon on the Tray (Notification area)
- wait for Enter when QAP menu is popped from anywhere on the taskbar (Shell_TrayWnd) using the middle mouse button
- improve reliability by inserting 0.1 secs delays before and after modifying or pasting the clipboard's content
- additional code to keep the target active window after QAP menu is closed

Version BETA: 7.1.99.6 (2016-04-07)
- fix bug when pasting snippet from the QAP icon in notification zone (paste must be processes as done using the mouse)
- remove keyboard delay when pasting a snippet from a menu triggered by the mouse
- remove new line created after waiting for the Enter key when pasting snippet using mouse
- decode end-of-line to CR/LF instead of only LF for compatibility with some targets applications
- encode ` character (backtick ) to `` allowing to include backticks in snippets
- insert a 1/10 sec. delay before sending Control-V to paste the snippet content to increase paste reliability

Version BETA: 7.1.99.5 (2016-04-06)
- for snippets of type Text, use clipboard to paste content faster (the original clipboard content is preserved)
- when pasting a snippet from a mouse trigger, pause to ask confirmation of insertion point until user press Enter
- in Settings, limit the displayed length of snippet content to 250 characters
- in Change Hotkey dialog box, limit the displayed length of snippet content to 150 characters
- in Manage Hotkeys list, limit the displayed length of snippet content to 50 characters
- change Send mode to Input globally, except for sending Ctrl-V (use Event mode)


Version BETA: 7.1.99.3/7.1.99.4 (2016-04-05)
Snippets
- add Snippet favorite type, labels, help text and default icons for snippets
- add snippet to add/edit favorite dialog box with help text, checkbox to process end-of-line and tab characters and advanced setting radio buttons to send snippet in text or macro mode
- encode snippet before saving and decode when editing
Hotfix check4update
- fix bug now remember if user skipped the latest beta version
- stop checking for prod update if user decide to download the newest beta version
- remove code checking for alpha version and unused commented code
- add comments to check for update code

Version: 7.1.10 (2016-04-03)
- stop adding the "Close this menu" QAP feature to the default menu created at first QAP execution
- stop changing mouse cursor to hand over buttons in Settings when running uncompiled

Version BETA: 7.1.99.2 (2016-03-31)
- fix bug with application favorite Start in folder (Working directory)
- fix bug exclusion list is now considered only for QAP mouse button (middle mouse button by default)
- fix bug set window info and menu position for alternative menu hotkey command
- fix bug set menu position when menu is called from a hotkey
- fix bug target window now correctly indentified when favorite is called from a favorite hotkey or when submenu is called from a menu favorite hotkey
- fix bug clipboard menu had empty lines at end of menu
- better error messages if a "target app name unknown" occurs when trying to navigate a favorite or open it in a new window

Tried but not retained:
- when menu is called from main hotkey, implemented SwitchToThisWindow and restore active window before open favorite

Version: 7.1.99.1 BETA (2016-03-28)
- add the option "Add Close to menus" and save/retrieve to ini file
- add "Close this menu" to main, alternative menu and dynamic menus if option Add Close to menus is on

Version: 7.1.9 (2016-03-28)
- reverting to v7.1.4 before tentative patches to fix the "close menu issue", keeping the following changes in v7.1.5 to v7.1.8:
- add the QAP feature "Close this menu" to force closing the menu when the issue is present
- add the "Close this menu" to the default menu created at first QAP execution (actual users must add it manually - Settings, Add buton, QAP Feature, Close this menu)
- fix bug Open Menu on Taskbar option not being considered (menu was always shown regardless of the option)
- keep command line parameters when reloading after changing language or theme in options
- stop display the popup menu on unsupported "Select Folder" dialog boxes (with TreeView)
- fix bug in Add This Folder Express window position not correctly saved
- avoid writing diag info if diag mode is off
- additional code to fix bug mouse pointer staying in "wait" state by error when saving options
- addition of Chineese Traditional (Taiwanese Mandarin, ZH-TW), thanks to Jess Yang
- update to language files

Version: 7.1.8 (2016-03-25)
- before showing the menu, keep focus on scripts hidden window and on script's popup menu to avoid the "close menu issue"
- before opening the favorite, give back the focus to the target window 
- fix bug in Add This Folder Express window position not correctly saved
- addition of debugging code about active window id
- avoid writing diag info if diag mode is off
- fix bug Open Menu on Taskbar option not being considered (menu was always shown regardless of the option)
- fix Traditional Chinese language mention in about text

Version: 7.1.7 (2016-03-22)
- addition of Chineese Traditional (Taiwanese Mandarin, ZH-TW), thanks to Jess Yang
- update to Spanish and Swedish language files
- fix Add This Folder bug caused by safety coded introduced in v7.1.5

Version: 7.1.5/7.1.6 (2016-03-20)
- safety code to keep the focus on the popup menu, preventing the issue where, in some situations, the menu was not closing when clicking elsewhere or hitting Escape
- add the QAP feature "Close this menu" to force closing the menu if the issue mentionned above is still present
- add the "Close this menu" to the default menu created at first QAP execution (actual users must add it manually - Settings, Add buton, QAP Feature, Close this menu)
- keep command line parameters when reloading after changing language or theme in options
- stop display the popup menu on unsupported "Select Folder" dialog boxes (with TreeView)
- additional code to fix bug mouse pointer staying in "wait" state by error when saving options
- group calls to show popup menu in a centralized command ShowMenu
- update of Spanish, French, Italian and Portuguese language files

Version: 7.1.3/7.1.4 (2016-03-14)
- fix bug menu icons being unchecked be error after saving options
- fix bug mouse pointer staying in "wait" state by error when saving options

Version: 7.1.2 (2016-02-21)
- stop quitting QAP before downloading the new setup or portable install file (let user quit QAP during install)
- fix website landing plage URL if user checks for update, is already at the current version and visit site
- fix bug disable Display icons checkbox in Option when running on a server OS (icons are only supported on workstations)

Version: 7.1.1 (2016-02-15)
- fix black background bug on check for update screen
- fix wincmd.ini validation bug when adding a QAP feature

Version: 7.1 (2016-02-14)
 
NEW FEATURES:
- more friendly upgrade process with dialog box, direct download links and easy access to change log (will be visible when upgrading from 7.1 to next version)
- add "Shutdown Computer" and "Restart Computer" QAP features (existing users, select in "Add favorite" dialog box, and select favorite type "QAP Feature")
- add a "Restart Quick Access Popup" menu in the QAP system menu (right-click on the QAP icon in the Notification Area) to reload QAP after changes to the ini file
- create the QAPconnect.ini file from a default master if it does not already exist in the working directory (QAPconnect.ini will not be overwritten anymore when installing a new version)
 
TOTAL COMMANDER USERS:
- add the "TC Directory Hotlist" QAP feature showing the TC hotlist content in a hierarchical submenu
  > for new users, "TC Directory Hotlist" menu is added to QAP main menu at the very first use of QAP if Total Commander is detected during installation
  > existig users select in "Add favorite" dialog box, and select favorite type "QAP Feature" and choose "TC Directory Hotlist"
- add an option in "Options", "File Managers" tab, to set the TotalCommander WinCmd.ini file location
- support relative path and environment variables for WinCmd.ini path
- support Windows environment variables in TC Directory hotlist locations
 
BUG FIXES
- fix a bug in code refreshing Clipboard menu causing crash in some situations
- fix a bug in check for update, not remembering when user want to skip the new version
- make Total Commander and Directory Opus application paths saved in ini file as portable values (relative path including environment variables)
- make Total Commander and Directory Opus application paths saved in ini file as portable values (including environment variables)

Version: 7.0.9.7 BETA (2016-02-13)
- add Total Commander icon to QAP feature "TC Directory hotlist"
- support for special folders (starting with "::") in TC Directory hotlist, incuding Windows default icon
- if WinCmd.ini file is not found, give an error message when user try to add the QAP feature "TC Directory Hotlist"
- support relative path and environment variables for WinCmd.ini path
- support Windows environment variables in TC Directory hotlist locations

Version: 7.0.9.6 BETA (2016-02-12)
- add an option in Options, File Managers tab, to remember the TotalCommander WinCmd.ini file location
- save/retrieve option to/from QAP ini file

Version: 7.0.9.5 BETA (2016-02-12)
- add diagnostic code to investigate TC hotlist not opening favorite for some users
- remove/comment unused diagnostic code

Version: 7.0.9.3/7.0.9.4 BETA (2016-02-11)
- add a Restart QAP menu item to the Tray menu to reload QAP after changes in the ini file
- fix a bug in check for update, not remembering when user want to skip the new version
- more friendly upgrade process with dialog box, direct download links and easy access to change log
- add Shutdown and Restart QAP features (select in "Add favorite" dialog box, favorite type "QAP Feature")
- create QAPconnect.ini file from a default master only if it does not exist in the working directory (not overwritten anymore when installing a new version)
- add TC Directory hotlist QAP feature showing the hotlist content a hierarchical submenu (add a QAP feature favorite and select "TC Directory Hotlist")
- adding "TC Directory Hotlist" menu to QAP main menu at first QAP launch if Total Commander is activated
- removed Edit QAPconnect.ini item in tray menu
- fix bug found in v7.0.1 in code refreshing Clipboard menu

Version: 7.0.6 (2016-02-07)
- added Italian translation (thanks to Riccardo Leone!) and fixes to German translation
- add a one-time message informing users who open the QAP menu in a dialog box that an option has to be enabled in order to change folder in a dialog box

Version: 7.0.4/7.0.5 (2016-02-03)
- run at startup option enabled by default only when using the setup install mode (not enabled in portable install mode)
- enable check for updates option enabled by default only when using the setup install mode (not enabled in portable install mode)
- allow top and left positions to be negative in Add/Edit favorite dialog box, Window Options
- fixes in English text and German translation
- in v7.0.5 only version number was incremented

Version: 7.0.3 (2016-02-02)
- fix a typo in Paypal code making QAP donation being sent as Folders Popup donation
- support negative window positions which are normal in multi monitor workspaces
- updated translation tool for production version

Version: 7.0.2 (2016-02-01)
- temporarily removed code supporting PATH in Clipboard menu refresh causing slow down or crash when Clipboard contains URL

Version: 7.0.1 (2016-02-01)
- first production release
- removed languages not yet adapted from Folders Popup (Dutch, Corean and Italian)
- removed favorite windows options for document, application and link favorite types
- refresh dynamic menus "Drives" and "Recent Folders" after Options saved

Version: 6.5.4.1 beta (2016-01-30)
- remove "Drives" and "Recent Folders" from the main menu (back to separate menu) until background refresh solution is ready
- add "Add this Folder Express" QAP feature added
- enable mouse cursor to hand image when hovering buttons image or text in QAP GUI
- add error checking if g_strQAPconnectIniPath is missing
- fix buttons labels alignment in Settings
- v6.5.4.1 fix an error slowing down the menu display

Version: 6.5.3 beta (2016-01-24)
- addition of German translation

Version: 6.5.2 beta (2016-01-24)
- change the mouse cursor to the "wait" image during "Recent Folders" and "Drives" submenus refresh
- make "Recent Folders" and "Drives" submenus back integrated to the main menu (not a separate menu anymore)
- removed tooltip messages when refreshing Recent Folders and Drives menus

Version: 6.5.1 beta (2016-01-18)
- compiled with AHK binary of version 1.1.23.00 (fixing the broken dynamic submenus issue)
- disabled dynamic menus refresh background task ("Recent folders" and "Drives")
- reverted "Recent folders" menu to external menu (not integrated) until the refresh background task is fixed
- changed the "Drives" menu to external menu (not integrated) until the refresh background task is fixed
- update to Swedish and Spanish language

Version: 6.4.4 beta (2016-01-10)
- little changes in the code refreshing the Clipboard menu, trying to find the source of the issue causing a crash of QAP during dynamic menus refresh
- fix bug with numeric shorcuts in Clipboard menu when there are more than 36 items in the menu

Version: 6.4.3 beta (2016-01-06)
- fix bug numeric shortcuts in submenu now always begin at 0
- fix bug icon not set properly when saving after edit favorite
- fix bug when setting alternative menu item hotkey to none, hotkey was not disabled before reboot of QAP
- remove unnecessary values in default ini file
- Addition of browsers to QAPconnect.ini list: ExplorerXP (v1.07), Far Manager (v3.0.4040), IrfanView (v4.38), SpeedCommander (v15.40.7700), Tablacus Explorer (v14.12.30), WinNC (v6.5) and XnView (v2.25)
  (thanks to Roland Toth (tpr) for his help maintaining these settings - https://github.com/rolandtoth)

Version: 6.4.2 beta (2015-12-31)
- add numeric shortcuts to alternative menu
- fix bug when opening Alternative menu item having a shortcut reminder
- refresh alternative menu after options saved
- fix bug when moving multiple submenus or groups from one submenu to another, location was not updated properly
- fix bug hotkey to menu showing error if menu empty
- fix bug when trying to add favorite without selecting a favorite type
- remove support for FTP sites in Reopen menu (still supported in Switch menu)

Version: 6.4.1 beta (2015-12-29)
- new QAP feature "Drives" to show a menu listing drives on the system with label, free space, capacity and icon showing the drive type
- add the Drives QAP ferature to My QAP Essentials (for new users - old usrs must add it themselves)
- in default popup menu (for new users), move Add this folder QAP feature to main menu, below Settings
- refactor build and refresh of Clipboard, Drives, Recent Folders, Switch, and Reopen a Folder (aka Current Folders) submenus
- rename "Reuse an Open Folder" menu to "Reopen a Folder"
- rename "Switch to an open folder or application" menu to "Switch"
- add default hotkey +^W to Switch QAP feature menu (old users must add it themselves)
- make Recent Folders submenu integrated to the main menu (not a separate menu anymore)
- refresh Clipboard, Reopen a Folder, and Switch menus at each call to the main menu
- when submenu called open using its shortcut, check if it contains Clipboard, Reopen a Folder or Switch submenus and, if yes, refresh them
- abort Clipboard menu refresh if clipboard is too big (> 50 K)
- refresh Drives and Recent Folders in a background task and when the menu is called by its shortcut
- add the variable "DynamicMenusRefreshRate=10000" in ini file to set the refresh background task rate in milliseconds (by default 10 seconds)
- add diag code to save refresh times in the diag ini file (set DiagMode in folderspopup.ini to DiagMode=1)
- increase vertical distance between Add / Edit / Remove / Copy buttons in Settings
- create Startup shortcut at first execution (previously, users had to set the "
- removed debugging code in refresh Switch menu

Version: 6.3.2 beta (2015-12-21)
- fix FTP password label alignement in Add/Edit favorite dialog box
- addition of Spanish, Brazilian Portuguese and Swedish translations
- stop showing hidden apps in the running apps dropdown in Add/Edit application favorite
- fix misaligned label in FTP favorite
- add an option in Add/Edit application favorite to flag if we activate an exsiting instance instead of launching a new instance of the application
- add QAP feature Switch to an open folder (supporting Explorer and DOpus) or application
- reorder in main menu My QAP Essentials first before My Special Folders and reorder items insite My QAP Essentials menu

Version: 6.3.1 beta (2015-12-14)
- reading Windows folder icon in desktop.ini supporting IconResource (Vista+) and IconFile,IconIndex format (deprecated after XP)
- save Windows folder icon in desktop.ini using IconResource (Vista+), removing IconFile,IconIndex values deprecated after XP
- set folder to R attribute instead of S to show the custom icon in desktop.ini
- display numeric shortcuts and hotkey reminders in Alternative menu
- remove unused help links in Alternative menu tab in Options
- fix bug when reusing an open folder on a network drive
- does not show icon options in add/edit favorite if running on server OS (actually, icons are supported only on workstations)
- fix bug set Windows folder icon now detect if location is empty
- fix bug when cancelling assign hotkey, the previous hotkey was assigned
- fix bug Add Favorite QAP must show Settings window before Add favorite dialog box to set default destination menu and position

Version: 6.2.5 beta (2015-12-10)
- language files prepared for translators
- implement language debugging tool for translators
- change Settings header to include links to website help pages

Version: 6.2.4 beta (2015-12-07)
- fix bug unable to create folder, document or application favorite on read-only support
- French language translation and adjustments to original English language while translating to French
- rename "Power" menu/hotkey/features to "Alternative" menu/hotkey/features
- when adding favorite transform HTTP (WebDAV) folder and document location to network path (UNC format) for compatibility with Windows Explorer
- get current Windows folder icon (from desktop.ini file) and assign it as default for new folder favorites
- add link to Menu options tab of Add favorite window to set Windows folder icon to the icon currently selected for the favorite
- add link to Menu options tab of Add favorite window to remove Windows folder icon
- limit notification duration to 3 seconds for the message menu has been updated

Version: 6.2.3 beta (2015-11-21)
- more explicit error message if user try to copy submenu, group, separator or column break in settings
- add QAP feature "Get window title and class" and copy info to clipboard
- add button to launch this feature from the Exclusions list in Options
- add help line in favorite advanced settings about double-quotes for parameters
- support favorite locations with relative path, envvars and anywhere in PATH environment variables directories
- Clipboard feature supports relative path, envvars and files in PATH
- icons files support relative path, envvars and files in PATH
- favorite advanced setting "launch with" supports relative path, envvars and files in PATH
- external file managers configuration support relative path, envvars and apps in PATH
- detect Dopus at launch if dopus.exe in PATH or registry App Path key
- allow to edit favorite icon resource in input box (in format "iconfile,index")
- fix bug ghost variable values when add favorite is cancelled


Version: 6.2.2 beta (2015-11-12)
- fix bug minimal value for top/left window position can be 0, not 1
- improve exclusion lists management in Options, add help text and link, support exclusion based on window title or class
- trim each line in exclusion list when saving Options
- remove exclusions for keyboard QAP menu trigger
- change dev icon to red (beta is green, prod will be white)

Version: 6.2.1 beta (2015-11-08)
- renumbered and adapted for beta test phase
- same features as v6.1.7

Version: 6.1.7 alpha (2015-11-07)
- fix bug in Settings, after renaming a submenu, menus index was not updated causing errors when adding fav to submenus or browsing to parent menu
- refactor create a daily backup and keep the 20 last copies for alpha stage, last 10 for beta stage and last 5 for production version
- improve text for Change folder option and move it in first position of General tab
- fix bug when opening folder from popup menu in Settings
- fix bug invalid window position values when Add this folder from a dialog box
- remove default settings checkbox in fav advanced settings and adapt default FTP settings and label for TC
- fix bug path of folder on network (WebDAV) must not be expanded to absolute path

Version: 6.1.6 alpha (2015-11-05)
- sort entries in QAP feature Clipboard menu with files names and URLs merged
- open groups in Total Commander and Directory Opus in a new instance only if group is set to Replace existing windows; remove unnecessary /S switch for TC
- review how first group item is managed in TC and DOpus
- when copying a Special folder or a QAP Feature favorites in Settings, set properly the drop down to the copied value in first tab

Version: 6.1.5 alpha (2015-11-01)
- stop loading not updated translation files until they alre ready, causing error when upgrading from FP
- add Add This Folder QAP feature to My QAP Essentials menu
- fix title in Manage hotkeys dialog box
- add a 20 ms delay after TrayTip to improve display on Windows 10
- add option to TrayTip to stop sound (on Win 10 and maybe before)
- shorten TrayTip texts for better display on Win 10
- shorten executable file description for Win 10
- add a function to return OS version up to WIN_10
- update some menu icons for Windows 10
- update special folders initialization for Windows 10
- adaptation for the new approach implemented setup program using the common AppData folder as repository allowing system admin to setup QAP for end users
- fix bug locations with system variable (like %APPDATA%) not being expanded before sent to Explorer 

Version: 6.1.4 alpha (2015-10-18)
- add copy favorite button to Settings gui; copied favorite inherit all properties except hotkey
- add Ctrl+C hotkey to Settings gui to copy favorite, update gui hotkeys help text
- in groups, with Directory Opus or Total Commander, set in folders and FTP favorites in which side (left or right) display the favorite
- Ctrl+Right on a group in Settings gui now open the group

Version: 6.1.3 alpha (2015-10-17)
- remove Navigate Dialog from QAP features, now in Power menu
- remove Copy location to clipboard from QAP features, now in Power menu
- fix bug list of QAP features in Add Favorite including Power menu features by error
- fix bug validating window position for items without window position like menus
- fix bug after changing a hotkey twice before saving
- fix bug Power menu Copy Location was launching group
- fix bug Power menu Copy Location was copying inexsting favorite path for groups and QAP features items
- fix bug Power menu Open in new window was launching dummy folder
- improved Option, File managers intro text

Version: 6.1.2 alpha (2015-10-13)
- fix bug with file manager detection at startup
- fix bug in setup program installing QAPconnect.ini in the app folder instead of userapp folder

Version: 6.1.1 alpha (2015-10-12)
- support for custom file managers (in addition to Directory Opus and Total Commander) using the settings file QAPconnect.ini; thanks to Roland Toth (tpr) for his help maintaining these settings (https://github.com/rolandtoth)
- refactoring of custom file managers support (including Directory Opus and Total Commander), with a new user interface in Options to select the custom file manager
- add Edit QAPconnect.ini menu to Tray menu
- when running QAP under Win XP or Vista, show a message inviting user to run Folders Popup and qui QAP
- in Add/Edit Favorite dialog box, reword the checkbox label "Remember window position" to "Use default window position" and revert the checkbox behaviour

Version: 6.0.7 alpha (2015-10-01)
- support relative paths for icon file (but they have to be made relative in the ini file)
- fix bug when checking if a file exitst and location has relative path
- empty group settings when favorite is not a group
- stop making FTP favorite always open in a new window or tab
- QA that relative paths are fully supported in: folders, documents, applications, custom icons (relative path must be edited in ini file) and in advanced settings "launch with" and apps "start in" directory
- add windows identification parameter in FPconnect properties for the active file manager.

Version: 6.0.6 alpha (2015-09-27)
- open group completed but not fuly tested
- add an option in groups to determine if folder will be open with Explorer or the active alternative file manager (Directory Opus, Total Commander or FPconnect), FPconnect not fully supported yet
- making default URL encoding to true for FTP favorites, except for Total Commander always set FTP encoding to false
- fix bug, when folder name from DOpus includes HTML entities like apostrophe replaced by "apos;"
- current folders menu now supports FTP listers in DOpus 

Version: 6.0.5 alpha (2015-09-25)
- create a daily backup of ini file for alpha versions users
- fix bug some special folders not working with TC and DOpus
- fix bug prevent inserting separator/column added before back link in menus
- fix bug when accepting change folder in dialog option with checkbox unchecked
- fix bug when DOpus or TC are not supported and we open menu in DOpus or TC window
- fix bug phantom defaut value in group advanced settings after another group has been edited
- fix bugs when moving multiple favorites to another menu
- fix bug power menu Edit a favorite can now edit a Group favorite

Version: 6.0.4 alpha (2015-09-23)
- disable non folder menu items (except QAP features) when power menu features "Change folder in dialog" and "Open in new window" are selected
- re-enable non folder menu items after power menu features is executed
- add an option to enable Change folder in dialog boxes with main QAP hotkeys and make sure user understands the risk of changing folder in non-file dialog boxes
- fix a bug with special folders when using class IDs in Total Commander

Version: 6.0.3 alpha (2015-09-20)
* New tab in Option to set power menu hotkeys
* Show Power menu hotkeys in Manage hotkeys dialog box
* Implement Power key feature "Edit favorite"
* Add Power menu feature "Copy location"
* Add power menu feature "Change folder in dialog box"
* Disable "Change folder in dialog box" in Power menu if target is not dialog box
* Stop changing folder in dialog with regular popup hotkeys (prevent changing values in a non-file dialog box)
* Enable favorite hotkey for sub-menus
* Implement check for update for alpha versions

Version 6.0.2 alpha (2015-09-15)
- First alpha test release. List of work done since v6.0.1:

Initialisation
--------------
System variables
Special folders
Popup menu hotkeys
Themes

Favorite Types
--------------
Convert favorite types: Folder, Document, Application, Special, URL, and Menu
Add favorite types: FTP, QAP and Group

QAP Features
------------
Implement QAP features as favorite type with features:
About: about dialog box
 - Add This Folder: add the current folder to popup menu
 - Clipboard: list of file paths or URL in clipboard
 - Copy Favorite Location: copy location to clipboard
 - Current Folders: list of folders open in Explorer or supported file managers
 - Exit: quit QAP
 - Help: help dialog box
 - Hotkeys: list of favorite hotkeys and edit dialog box
 - Options: options dialog box
 - Recent Folders: list of Windows recent folders
 - Settings: setting dialog box
 - Support: support freeware dialog box
Use default language for QAP features name
Default hotkey to QAP features

Settings dialog box
-------------------
Build Settings dialog box
Open submenu when double-click in favorite list (use the Edit button to edit the menu item)
Add "back" navigation with ".." item in favorite list
Dialog box to manage favorite hotkeys
Remove one or muptiple favorites, remove submenu and underlying items
Add/Edit groups and manage them similarely to sub menus
Save Settings position when exiting

Favorites dialog box
--------------------
Add/Edit favorites dialog box with tabs: Basic Settings, Menu Options, Window Options and Advanced Settings
Add/Edit QAP features
Favorites hotkeys for all favorite types
Parameters advanced setting for all favorite types (except QAP features, Menus and Groups): 
Launch with application advanced setting for all favorite types (except Application, QAP features, Menus and Groups)
Working directory advanced setting for application favorites
Add an application favorite by selecting its path form a dropdown list of running apps
Edit window position for favorite types Folder, Special folders and Application, with a configurable delay when resizing or moving
Remember current window position when using "Add this folder"
Implementy FTP favorite type with login name, password and an option to encode login name and password in URL
Implement Group favorite with configurable delay when opening group (restoring groupe not done yet)

Options
-------
Convert all FP options
Add an exclusion list to disable QAP mouse popup menu hotkey in the selected type of windows
Option to display or not the favorite shortcuts reminders in popup menu (full name or abbreviated name)

Menus
-----
Build main menu
Build Current Folders menu
Build Recent Folders menu
Build Tray menu
Add default "My Special folders" menu at first QAP use
Add default "Essential QAP Features" menu at first QAP use
Convert startup tray tip
Test if current target window can navigate folder
Test if current window is on exclusion list before showing popup up
When Current Folders and Clipboard are empty, attach an "empty" sub menu
Add group indicator [[]] to popup menu with nb of items in groups

Popup menu Hotkeys
------------------
New hotkey approach with two triggers:
 1) QAP hotkey (mouse and keyboard), available in all windows, opens the popup menu to choose the favoriteto launch; if the favorite is a folder and the target app supports it (Explorer, dialog box or other file managers), the window is changed (navigate) to this folder
 2) Alternative hotkey available in all windows, showing a menu of special features before showing the favorites menu (see "Alternative menu features" below)
Replace default keyboard FP hotkey Windows+A (#A) to Windows+W(#W) because #A is now a reserved shortcut in Windows 10

Actions
-------
Open favorite folders and special folders in current window (navigate) or in a new window (launch) if the target window supports navigation (Explorer, Dialog boxes, Directory Opus, TotalCommander, FPconnect and Console)
Navigate favorite with Clover (using keyboard input)
Run application wit working directory and parameters
Launch documents or URL with "launch with" application and parameters
Support location placeholders in parameters
Implement QAP features "Add this folder" and "Copy Location"
Add this folder remembers window position (for use when open the folder in a new window)
Add this folder supports known special folders (50 known special folders)
Open FTP favorite with login name and password in Explorer, Directory Opus and Total Commander
Resize and move window to remembered position when opening folder in a new window (working with Explorer, DOpus, TC, not working with FPconnect yet)
Resize and move window to remembered position when launching application, document or URL (working with some apps, not all, not fully tested)

Alternative menu features
-------------------------
Open folder in a new window (even if the target window could navigate to this folder)
(more to be implemented)

Third party file managers
-------------------------
Support for Directory Opus
Support for Total Commander
Support for other file managers via FPconnect

Transition
----------
ImportFPsettings.ahk:
 - import favorites from Folders Popup and convert them to QAP format(replace all favorites)
 - import options settings from Folders Popup to QAP (overwrite existing options)

InnoSetup installer
-------------------
Prepare the QAP setup file, including ImportFPsettings.exe


Version: 6.0.1 alpha (2015-05-11)
* Replace "FoldersPopup" with "QuickAccessPopup"
* Update @Ahk2Exe-SetVersion with "6.0.1 alpha"
* Update strCurrentVersion with "6.0.1 alpha"
* Update @Ahk2Exe-SetDescription with "Most handy Windows launcher. Freeware!"
* Distinct variables strAppNameFile for "QuickAccessPopup" and strAppNameText for "Quick Access Popup"
* Update strCurrentBranch with "alpha"
* Adapt for alpha version without version checking for alpha branch
* Replace "FoldersPopup" with "QuickAccessPopup" in InitFileInstall, and language variable names
* Replace "strTempDir" with "g_strTempDir"

SEE PREVIOUS HISTORY on FoldersPopup's GitHub or in FoldersPopup.ahk file


VARIABLES NAMING CONVENTION
---------------------------

typNameOfVariable
^^^^^^^^^^^^^^^^^ description of the variable content, with name sections from general to specific

typeNameOfVariable
^^^^ type of variable, str for strings, int for integers (any size), dbl for reals (not used in this app),
     arr for arrays, obj for objects, menu for menus, etc.
  
g_typNameOfVariable
^ g_ for global, nothing for local

f_typNameOfVariable
^ f_ for form (Gui) variables

*/ 
;========================================================================================================================
!_010_COMPILER_DIRECTIVES:
;========================================================================================================================

; Doc: http://fincs.ahk4.net/Ahk2ExeDirectives.htm
; Note: prefix comma with `

;@Ahk2Exe-SetName Quick Access Popup
;@Ahk2Exe-SetDescription Quick Access Popup (freeware)
;@Ahk2Exe-SetVersion v8.5.3
;@Ahk2Exe-SetOrigFilename QuickAccessPopup.exe


;========================================================================================================================
!_011_INITIALIZATION:
;========================================================================================================================

#NoEnv
#SingleInstance force
#KeyHistory 0
ListLines, Off
DetectHiddenWindows, On ; On required for button centering function GuiCenterButtons
SendMode, Input
StringCaseSense, Off
ComObjError(False) ; we will do our own error handling

; avoid error message when shortcut destination is missing
; see http://ahkscript.org/boards/viewtopic.php?f=5&t=4477&p=25239#p25236
DllCall("SetErrorMode", "uint", SEM_FAILCRITICALERRORS := 1)

; make sure the default system mouse pointer are used after a QAP reload
SetWaitCursor(false)

Gosub, CollectCommandLineParameters

Gosub, SetQAPWorkingDirectory

; Force A_WorkingDir to A_ScriptDir if uncomplied (development environment)
;@Ahk2Exe-IgnoreBegin
; Start of code for development environment only - won't be compiled
; see http://fincs.ahk4.net/Ahk2ExeDirectives.htm
SetWorkingDir, %A_ScriptDir%
ListLines, On
BuildUserAhkApi(A_ScriptFullPath,1)
; to test user data directory: SetWorkingDir, %A_AppData%\Quick Access Popup
; / End of code for developement enviuronment only - won't be compiled
;@Ahk2Exe-IgnoreEnd

OnExit, CleanUpBeforeExit ; must be positioned before InitFileInstall to ensure deletion of temporary files

;---------------------------------
; Create temporary folder

g_strTempDir := A_WorkingDir . "\_temp"
FileCreateDir, %g_strTempDir%

;---------------------------------
; Init settings file name
; must be before InitFileInstall because it reads UseClassicButtons setting

g_strAppNameFile := "QuickAccessPopup"
g_strIniFile := A_WorkingDir . "\" . g_strAppNameFile . ".ini"

; Set developement ini file

;@Ahk2Exe-IgnoreBegin
; Start of code for developement environment only - won't be compiled
if (A_ComputerName = "JEAN-PC") ; for my home PC
	g_strIniFile := A_WorkingDir . "\" . g_strAppNameFile . "-HOME.ini"
else if InStr(A_ComputerName, "ELITEBOOK-JEAN") ; for my work hotkeys
	g_strIniFile := A_WorkingDir . "\" . g_strAppNameFile . "-WORK.ini"
; / End of code for developement environment only - won't be compiled
;@Ahk2Exe-IgnoreEnd

;---------------------------------
; Init temporary folder and language files

Gosub, InitFileInstall
Gosub, InitLanguageVariables

; --- Global variables

g_strAppNameText := "Quick Access Popup"
g_strCurrentVersion := "8.5.3" ; "major.minor.bugs" or "major.minor.beta.release", currently support up to 5 levels (1.2.3.4.5)
g_strCurrentBranch := "prod" ; "prod", "beta" or "alpha", always lowercase for filename
g_strAppVersion := "v" . g_strCurrentVersion . (g_strCurrentBranch <> "prod" ? " " . g_strCurrentBranch : "")

g_blnDiagMode := False
g_strDiagFile := A_WorkingDir . "\" . g_strAppNameFile . "-DIAG.txt"

if (g_blnPortableMode)
	g_strJLiconsFile := A_ScriptDir . "\JLicons.dll" ; in portable mode, same folder as QAP exe file or script directory in developement environment
else ; setup mode
	g_strJLiconsFile := A_AppDataCommon . "\JeanLalonde\JLicons.dll" ; in setup mode, shared data folder

g_blnMenuReady := false
g_blnChangeHotkeyInProgress := false

g_arrSubmenuStack := Object()
g_arrSubmenuStackPosition := Object()

g_objJLiconsByName := Object()
g_objJLiconsNames := Object()

g_strMenuPathSeparator := ">" ; spaces before/after are added only when submenus are added, separate submenu levels, not allowed in menu and group names
g_strGuiMenuSeparator := "----------------" ;  single-line displayed as line separators, allowed in item names
g_strGuiMenuSeparatorShort := "---" ;  short single-line displayed as line separators, allowed in item names
g_strGuiDoubleLine := "===" ;  double-line displayed in column break and end of menu indicators, allowed in item names
g_strGroupIndicatorPrefix := Chr(171) ; group item indicator, not allolowed in any item name
g_strGroupIndicatorSuffix := Chr(187) ; displayed in Settings with g_strGroupIndicatorPrefix, and with number of items in menus, allowed in item names
g_intListW := "" ; Gui width captured by GuiSize and used to adjust columns in fav list
g_strEscapePipe := "Ð¡þ€" ; used to escape pipe in ini file, should not be in item names or location but not checked
g_strFolderLiveIndicator := "!"

g_strSnippetCommandStart := "{&" ; start of command in macro snippets
g_strSnippetCommandEnd := "}" ; end of command (including options) in macro snippets
g_strSnippetOptionsSeparator := ":" ; separator between command and options in macro snippets

g_objGuiControls := Object() ; to build Settings gui

g_strMouseButtons := ""
g_arrMouseButtons := ""
g_arrMouseButtonsText := ""

g_objClassIdOrPathByDefaultName := Object() ; used by InitSpecialFolders and CollectExplorers
g_objSpecialFolders := Object()
g_strSpecialFoldersList := ""

g_objQAPFeatures := Object()
g_objQAPFeaturesCodeByDefaultName := Object()
g_objQAPFeaturesDefaultNameByCode := Object()
g_objQAPFeaturesAlternativeCodeByOrder := Object()
g_strQAPFeaturesList := ""

g_objHotkeysByNameLocation := Object() ; Hotkeys by Name|Location (concatenated with "|" pipe separator)

g_objExternaleMenuToRelease := Object() ; Array of file path of External menu reserved by user to release when saving/cancelling Settings changes or quitting QAP
g_objExternalMenuFolderReadOnly := Object() ;  array of folders containing external settings files, registering if these folders are read-only (true) or not (false)

g_objToolTipsMessages := Object() ; messages to display by ToolTip when mouse is over selected buttons in Settings

g_strQAPconnectIniPath := A_WorkingDir . "\QAPconnect.ini"
g_strQAPconnectFileManager := ""
g_strQAPconnectAppFilename := ""
g_strQAPconnectCompanionFilename := ""
g_strQAPconnectAppPath := ""
g_strQAPconnectCommandLine := ""
g_strQAPconnectNewTabSwitch := ""
g_strQAPconnectCompanionPath := ""

;---------------------------------
; Initial validation

if InStr("WIN_VISTA|WIN_2003|WIN_XP|WIN_2000", A_OSVersion)
{
	MsgBox, 4, %g_strAppNameText%, % L(lOopsOSVerrsionError, g_strAppNameText)
	IfMsgBox, Yes
		Run, http://code.jeanlalonde.ca/folderspopup/
	ExitApp
}

; if the app runs from a zip file, the script directory is created under the system Temp folder
if InStr(A_ScriptDir, A_Temp) ; must be positioned after g_strAppNameFile is created
{
	Oops(lOopsZipFileError, g_strAppNameFile)
	ExitApp
}

;---------------------------------
; Check if we received an alternative settings file in parameter /Settings:

if StrLen(g_strParamSettings)
	g_strIniFile := PathCombine(A_WorkingDir, EnvVars(g_strParamSettings))

;---------------------------------
; Init routines

; Keep gosubs in this order
Gosub, InitSystemArrays
Gosub, InitLanguages
Gosub, InitLanguageArrays
Gosub, InitSpecialFolders
Gosub, InitQAPFeatures
Gosub, InitGuiControls

Gosub, LoadIniFile ; load options, load/enable popup hotkeys, load (not enable) name|location hotkeys and populate g_objHotkeysByNameLocation, load favorites to menu object
Gosub, EnableLocationHotkeys ; enable name|location hotkeys from g_objHotkeysByNameLocation

; must be after LoadIniFile
IniWrite, %g_strCurrentVersion%, %g_strIniFile%, Global, % "LastVersionUsed" .  (g_strCurrentBranch = "alpha" ? "Alpha" : (g_strCurrentBranch = "beta" ? "Beta" : "Prod"))

if (g_blnDiagMode)
{
	Gosub, InitDiagMode
	; Diag("A_ScriptHwnd", A_ScriptHwnd)
}
if (g_blnUseColors)
	Gosub, LoadThemeGlobal

; not sure it is required to have a physical file with .html extension - but keep it as is by safety
g_strURLIconFileIndex := GetIcon4Location(g_strTempDir . "\default_browser_icon.html")

Gosub, BuildSwitchAndReopenFolderMenusInit ; will be refreshed at each popup menu call
Gosub, BuildClipboardMenuInit ; will be refreshed at each popup menu call

Gosub, BuildDrivesMenuInit ; show in separate menu until... #### will be refreshed by a background task and after each popup menu call
Gosub, BuildRecentFoldersMenuInit ; show in separate menu until... #### will be refreshed by a background task and after each popup menu call
Gosub, SetTimerRefreshDynamicMenus ; Drives, Recent Folders

Gosub, BuildTotalCommanderHotlist

Gosub, BuildMainMenu
Gosub, BuildAlternativeMenu
Gosub, BuildGui
Gosub, BuildTrayMenu

if (g_blnCheck4Update)
	Gosub, Check4Update

; the startup shortcut was created at first execution of LoadIniFile (if ini file did not exist)
IfExist, %A_Startup%\%g_strAppNameFile%.lnk
{
	; if the startup shortcut exists, update it at each execution in case the exe filename changed
	FileDelete, %A_Startup%\%g_strAppNameFile%.lnk
	FileCreateShortcut, %A_ScriptFullPath%, %A_Startup%\%g_strAppNameFile%.lnk, %A_WorkingDir%
	Menu, Tray, Check, %lMenuRunAtStartupAmpersand%
}
; if the startup shortcut for FoldersPopup still exist after QAP installation, delete it
IfExist, %A_Startup%\FoldersPopup.lnk
	FileDelete, %A_Startup%\FoldersPopup.lnk

if (g_blnDisplayTrayTip)
{
	GetHotkeysText(strMouseHotkey, strKeyboardHotkey)
		
	TrayTip, % L(lTrayTipInstalledTitle, g_strAppNameText)
		, % L(lTrayTipInstalledDetail, strMouseHotkey . " " . lDialogOr . " " . strKeyboardHotkey)
		, , 17 ; 1 info icon + 16 no sound
	Sleep, 20 ; tip from Lexikos for Windows 10 "Just sleep for any amount of time after each call to TrayTip" (http://ahkscript.org/boards/viewtopic.php?p=50389&sid=29b33964c05f6a937794f88b6ac924c0#p50389)
}

g_blnMenuReady := true

; Load the cursor and start the "hook" to change mouse cursor in Settings - See WM_MOUSEMOVE function below
g_objHandCursor := DllCall("LoadCursor", "UInt", NULL, "Int", 32649, "UInt") ; IDC_HAND
OnMessage(0x200, "WM_MOUSEMOVE")

; To prevent double-click on image static controls to copy their path to the clipboard - See WM_LBUTTONDBLCLK function below
; see http://www.autohotkey.com/board/topic/94962-doubleclick-on-gui-pictures-puts-their-path-in-your-clipboard/#entry682595
OnMessage(0x203, "WM_LBUTTONDBLCLK")

; To popup menu when left click on the tray icon - See AHK_NOTIFYICON function below
OnMessage(0x404, "AHK_NOTIFYICON")

; Respond to SendMessage sent by ImportFPsettings to signal that QAP is running
; No specific reason for 0x2224, except that is is > 0x1000 (http://ahkscript.org/docs/commands/OnMessage.htm)
OnMessage(0x2224, "REPLY_QAPISRUNNING")

; Respond to SendMessage sent by QAPmessenger after execution of the requested action from Explorer context menu
OnMessage(0x4a, "RECEIVE_QAPMESSENGER")

; Create a mutex to allow Inno Setup to detect if FP is running before uninstall or update
DllCall("CreateMutex", "uint", 0, "int", false, "str", g_strAppNameFile . "Mutex")

return


;------------------------------------------------------------
;------------------------------------------------------------
#If, CanNavigate(A_ThisHotkey)
; empty - act as a handle for the "Hotkey, If" condition
#If
;------------------------------------------------------------
;------------------------------------------------------------


;------------------------------------------------------------
;------------------------------------------------------------
#If, CanLaunch(A_ThisHotkey)
; empty - act as a handle for the "Hotkey, If" condition
#If
;------------------------------------------------------------
;------------------------------------------------------------


;========================================================================================================================
!_012_GUI_HOTKEYS:
;========================================================================================================================

; Gui Hotkeys
#If WinActive(L(lGuiTitle, g_strAppNameText, g_strAppVersion)) ; main Gui title

^Up::
GuiControlGet, strFocusedControl, FocusV
if (strFocusedControl = "f_strFavoritesListFilter")
	return
if (LV_GetCount("Selected") > 1)
	Gosub, GuiMoveMultipleFavoritesUp
else
	Gosub, GuiMoveFavoriteUp
return

^Down::
GuiControlGet, strFocusedControl, FocusV
if (strFocusedControl = "f_strFavoritesListFilter")
	return
if (LV_GetCount("Selected") > 1)
	Gosub, GuiMoveMultipleFavoritesDown
else
	Gosub, GuiMoveFavoriteDown
return

^Right::
GuiControlGet, strFocusedControl, FocusV
if (strFocusedControl = "f_strFavoritesListFilter")
	return
Gosub, HotkeyChangeMenu
return

^Left::
GuiControlGet, strFocusedControl, FocusV
if (strFocusedControl = "f_strFavoritesListFilter")
	return
GuiControlGet, blnUpMenuVisible, Visible, f_picUpMenu
if (blnUpMenuVisible)
	Gosub, GuiGotoPreviousMenu
return

^A::
GuiControlGet, strFocusedControl, FocusV
if (strFocusedControl = "f_strFavoritesListFilter")
	Send, ^a ; select all search control
else
	LV_Modify(0, "Select") ; select all in listview
return

^N::
GuiControlGet, strFocusedControl, FocusV
if (strFocusedControl = "f_strFavoritesListFilter")
	return
Gosub, GuiAddFavoriteSelectType
return

Enter::
GuiControlGet, strFocusedControl, FocusV
if (strFocusedControl = "f_strFavoritesListFilter")
	return
if (LV_GetCount("Selected") > 1)
	Gosub, GuiMoveMultipleFavoritesToMenu
else
	Gosub, GuiEditFavorite
return

Del::
GuiControlGet, strFocusedControl, FocusV
if (strFocusedControl = "f_strFavoritesListFilter")
	Send, {Del}
else
	if (LV_GetCount("Selected") > 1)
		Gosub, GuiRemoveMultipleFavorites
	else
		Gosub, GuiRemoveFavorite
return

^C::
GuiControlGet, strFocusedControl, FocusV
if (strFocusedControl = "f_strFavoritesListFilter")
	Send, ^c
else
	Gosub, GuiCopyFavorite
return

^F::
GuiControlGet, strFocusedControl, FocusV
if (strFocusedControl = "f_strFavoritesListFilter")
	return
Gosub, GuiFocusFilter
return

^H::
GuiControlGet, strFocusedControl, FocusV
if (strFocusedControl = "f_strFavoritesListFilter")
	return
Gosub, GuiHotkeysHelpClicked
return

F1::
GuiControlGet, strFocusedControl, FocusV
if (strFocusedControl = "f_strFavoritesListFilter")
	return
Gosub, GuiHelp
return

#If
; End of Gui Hotkeys


;========================================================================================================================
; END OF GUI HOTKEYS
;========================================================================================================================



;========================================================================================================================
!_015_INITIALIZATION_SUBROUTINES:
;========================================================================================================================

;-----------------------------------------------------------
CollectCommandLineParameters:
;-----------------------------------------------------------

Loop, %0% ; loop each parameter
{
    strThisParam := %A_Index%
	if SubStr(strThisParam, 1, 10) = "/Settings:"
		StringReplace, g_strParamSettings, strThisParam, % "/Settings:"

	g_strCurrentCommandLineParameters .= strThisParam . " "
}

strThisParam := ""

return
;-----------------------------------------------------------


;-----------------------------------------------------------
SetQAPWorkingDirectory:
;-----------------------------------------------------------

/*

First, the whole story...

Check in what mode QAP is running:
- if the file "_do_not_remove_or_rename.txt" is in A_ScriptDir, we are in Setup mode
- else we are in Portable mode.

IF PORTABLE

If we are in Portable mode, we keep the A_WorkingDir and return. It is equal to A_ScriptDir except if the user set the "Start In" folder in a shortcut.

IF SETUP

In the Start Menu Group "Quick Access Popup", setup program created a shortcut with "Start In" set to "{commonappdata}\Quick Access Popup"
(the Start Menu Group is created under the All Users profile unless the user installing the app does not have administrative privileges,
in which case it is created in the user's profile).

If A_WorkingDir equals A_ScriptDir and we are Setup mode, it means that QAP has been launched directly in the Program Files directory
instead of using the Start menu or Startup shortcuts. In this situation, we know that the working directory has not been set properly.
We change it to "{commonappdata}\Quick Access Popup".

In "{commonappdata}\Quick Access Popup", setup program created or saved the file:
- "quickaccesspopup-setup.ini" (used to set initial QAP language to setup program language)

If, during setup, the user selected the "Import Folders Popup settings and favorites" option, the setup program will import the FP settings
and create the file "quickaccesspopup.ini" in "{commonappdata}\Quick Access Popup". An administrator could also create this file that will
be used as a template to be copied to "{userappdata}\Quick Access Popup" when QAP is launched for the first time.

Normally, when the user starts QAP with the Start Group shortcut, A_WorkingDir is set to "{commonappdata}\Quick Access Popup".
If not, keep the A_WorkingDir set by the user and return.

If A_WorkingDir is "{commonappdata}\Quick Access Popup", check if "{userappdata}\Quick Access Popup" exists. If not, create it.
If the files "quickaccesspopup-setup.ini", "quickaccesspopup.ini" and "QAPconnect.ini" do not exist in "{userappdata}\Quick Access Popup", copy them
from "{commonappdata}\Quick Access Popup" if they exist.

Then, set A_WorkingDir to "{userappdata}\Quick Access Popup" and return.

AFTER A_WORKINGDIR IS SET (PORTABLE OR SETUP)

- QAP copy the FileInstall temporary icon and localisation files.

- QAP checks if QAPconnect.ini exists in A_WorkingDir. If not, it creates a fresh one from the FileInstall file QAPconnect-default.ini.
If QAPconnect.ini already exists, it is not overwritten. Instead, a fresh copy of FileInstall file QAPconnect-default.ini is written to
A_WorkingDir where user can check if new file managers are supported.

- QAP checks if quickaccesspopup.ini exists in A_WorkingDir. If not, it creates a new one from an internal template.

Then, it continues initialization with quickaccesspopup.ini.

STARTUP SHORTCUT

If the "Run at startup" is enabled, a shortcut is created in the user's startup folder with "Start In" set to the current A_WorkingDir.
In Portable mode, A_WorkingDir is what the user decided. In Setup mode, A_WorkingDir is "{userappdata}\Quick Access Popup" (unless user changed it).

*/

; Now, step-by-step...

; Check in what mode QAP is running:
; - if the file "_do_not_remove_or_rename.txt" is in A_ScriptDir, we are in Setup mode
; - else we are in Portable mode.

; If we are in Portable mode, we keep the A_WorkingDir and return. It is equal to A_ScriptDir except if the user set the "Start In" folder in a shortcut.
if !FileExist(A_ScriptDir . "\_do_not_remove_or_rename.txt")
{
	g_blnPortableMode := true ; set this variable for use later during init
	return
}
else
	g_blnPortableMode := false ; set this variable for use later during init

; Now we are in Setup mode

; If A_WorkingDir equals A_ScriptDir and we are Setup mode, it means that QAP has been launched directly in the Program Files directory
; instead of using the Start menu or Startup shortcuts. In this situation, we know that the working directory has not been set properly.
; We change it to "{commonappdata}\Quick Access Popup".

if (A_WorkingDir = A_ScriptDir) and FileExist(A_WorkingDir . "\_do_not_remove_or_rename.txt")
	SetWorkingDir, %A_AppDataCommon%\Quick Access Popup

; Normally, when the user starts QAP with the Start Group shortcut, A_WorkingDir is set to "{commonappdata}\Quick Access Popup".
; If not, QAP was possibily launched with a Startup shortcut that set the A_WorkingDir to "{userappdata}\Quick Access Popup".
; Keep the A_WorkingDir set by the shortcut and return.

if (A_WorkingDir <> A_AppDataCommon . "\Quick Access Popup")
	return

; If A_WorkingDir is "{commonappdata}\Quick Access Popup", check if "{userappdata}\Quick Access Popup" exists. If not, create it.

if !FileExist(A_AppData . "\Quick Access Popup")
	FileCreateDir, %A_AppData%\Quick Access Popup

; If the files "quickaccesspopup-setup.ini", "quickaccesspopup.ini" and "QAPconnect.ini" do not exist in "{userappdata}\Quick Access Popup",
; copy them from "{commonappdata}\Quick Access Popup" if they exist.
if !FileExist(A_AppData . "\Quick Access Popup\quickaccesspopup-setup.ini")
	FileCopy, %A_AppDataCommon%\Quick Access Popup\quickaccesspopup-setup.ini, %A_AppData%\Quick Access Popup
if !FileExist(A_AppData . "\Quick Access Popup\quickaccesspopup.ini")
	FileCopy, %A_AppDataCommon%\Quick Access Popup\quickaccesspopup.ini, %A_AppData%\Quick Access Popup
if !FileExist(A_AppData . "\Quick Access Popup\QAPconnect.ini")
	FileCopy, %A_AppDataCommon%\Quick Access Popup\QAPconnect.ini, %A_AppData%\Quick Access Popup

; Then, set A_WorkingDir to "{userappdata}\Quick Access Popup" and return.

SetWorkingDir, %A_AppData%\Quick Access Popup

return
;-----------------------------------------------------------


;-----------------------------------------------------------
InitFileInstall:
;-----------------------------------------------------------

; Adding a new language:
; 1- add the FileInstall line below
; 2- update strOptionsLanguageCodes
; 3- edit lOptionsLanguageLabels in all languages

FileInstall, FileInstall\QuickAccessPopup_LANG_DE.txt, %g_strTempDir%\QuickAccessPopup_LANG_DE.txt, 1
FileInstall, FileInstall\QuickAccessPopup_LANG_FR.txt, %g_strTempDir%\QuickAccessPopup_LANG_FR.txt, 1
FileInstall, FileInstall\QuickAccessPopup_LANG_SV.txt, %g_strTempDir%\QuickAccessPopup_LANG_SV.txt, 1
FileInstall, FileInstall\QuickAccessPopup_LANG_ES.txt, %g_strTempDir%\QuickAccessPopup_LANG_ES.txt, 1
FileInstall, FileInstall\QuickAccessPopup_LANG_PT-BR.txt, %g_strTempDir%\QuickAccessPopup_LANG_PT-BR.txt, 1
FileInstall, FileInstall\QuickAccessPopup_LANG_IT.txt, %g_strTempDir%\QuickAccessPopup_LANG_IT.txt, 1
FileInstall, FileInstall\QuickAccessPopup_LANG_ZH-TW.txt, %g_strTempDir%\QuickAccessPopup_LANG_ZH-TW.txt, 1
FileInstall, FileInstall\QuickAccessPopup_LANG_PT.txt, %g_strTempDir%\QuickAccessPopup_LANG_PT.txt, 1
FileInstall, FileInstall\QuickAccessPopup_LANG_ZH-CN.txt, %g_strTempDir%\QuickAccessPopup_LANG_ZH-CN.txt, 1
FileInstall, FileInstall\QuickAccessPopup_LANG_NL.txt, %g_strTempDir%\QuickAccessPopup_LANG_NL.txt, 1
; FileInstall, FileInstall\QuickAccessPopup_LANG_KO.txt, %g_strTempDir%\QuickAccessPopup_LANG_KO.txt, 1

FileInstall, FileInstall\default_browser_icon.html, %g_strTempDir%\default_browser_icon.html, 1

IniRead, g_blnUseClassicButtons, %g_strIniFile%, Global, UseClassicButtons, 0
if (g_blnUseClassicButtons)
{
	FileInstall, FileInstall\about-32.png, %g_strTempDir%\about-32.png
	FileInstall, FileInstall\add_property-48.png, %g_strTempDir%\add_property-48.png
	FileInstall, FileInstall\delete_property-48.png, %g_strTempDir%\delete_property-48.png
	FileInstall, FileInstall\copy-48.png, %g_strTempDir%\copy-48.png
	FileInstall, FileInstall\keyboard-48.png, %g_strTempDir%\keyboard-48.png
	FileInstall, FileInstall\details-48.png, %g_strTempDir%\details-48.png
	FileInstall, FileInstall\separator-26.png, %g_strTempDir%\separator-26.png
	FileInstall, FileInstall\column-26.png, %g_strTempDir%\column-26.png
	FileInstall, FileInstall\down_circular-26.png, %g_strTempDir%\down_circular-26.png
	FileInstall, FileInstall\edit_property-48.png, %g_strTempDir%\edit_property-48.png
	; FileInstall, FileInstall\generic_sorting2-26-grey.png, %g_strTempDir%\generic_sorting2-26-grey.png
	FileInstall, FileInstall\help-32.png, %g_strTempDir%\help-32.png
	FileInstall, FileInstall\left-12.png, %g_strTempDir%\left-12.png
	FileInstall, FileInstall\settings-32.png, %g_strTempDir%\settings-32.png
	FileInstall, FileInstall\up-12.png, %g_strTempDir%\up-12.png
	FileInstall, FileInstall\up_circular-26.png, %g_strTempDir%\up_circular-26.png
	FileInstall, FileInstall\QAP-pin-off-26.png, %g_strTempDir%\QAP-pin-off-26.png
	FileInstall, FileInstall\QAP-pin-on-26.png, %g_strTempDir%\QAP-pin-on-26.png

	FileInstall, FileInstall\thumbs_up-32.png, %g_strTempDir%\thumbs_up-32.png
	FileInstall, FileInstall\solutions-32.png, %g_strTempDir%\solutions-32.png
	FileInstall, FileInstall\handshake-32.png, %g_strTempDir%\handshake-32.png
	FileInstall, FileInstall\conference-32.png, %g_strTempDir%\conference-32.png
	FileInstall, FileInstall\gift-32.png, %g_strTempDir%\gift-32.png
}
else
{
	FileInstall, FileInstall\about-32_c.png, %g_strTempDir%\about-32_c.png
	FileInstall, FileInstall\add_property-48_c.png, %g_strTempDir%\add_property-48_c.png
	FileInstall, FileInstall\delete_property-48_c.png, %g_strTempDir%\delete_property-48_c.png
	FileInstall, FileInstall\copy-48_c.png, %g_strTempDir%\copy-48_c.png
	FileInstall, FileInstall\keyboard-48_c.png, %g_strTempDir%\keyboard-48_c.png
	FileInstall, FileInstall\details-48_c.png, %g_strTempDir%\details-48_c.png
	FileInstall, FileInstall\separator-26_c.png, %g_strTempDir%\separator-26_c.png
	FileInstall, FileInstall\column-26_c.png, %g_strTempDir%\column-26_c.png
	FileInstall, FileInstall\down_circular-26_c.png, %g_strTempDir%\down_circular-26_c.png
	FileInstall, FileInstall\edit_property-48_c.png, %g_strTempDir%\edit_property-48_c.png
	FileInstall, FileInstall\help-32_c.png, %g_strTempDir%\help-32_c.png
	FileInstall, FileInstall\left-12_c.png, %g_strTempDir%\left-12_c.png
	FileInstall, FileInstall\settings-32_c.png, %g_strTempDir%\settings-32_c.png
	FileInstall, FileInstall\up-12_c.png, %g_strTempDir%\up-12_c.png
	FileInstall, FileInstall\up_circular-26_c.png, %g_strTempDir%\up_circular-26_c.png
	FileInstall, FileInstall\QAP-pin-off-26_c.png, %g_strTempDir%\QAP-pin-off-26_c.png
	FileInstall, FileInstall\QAP-pin-on-26_c.png, %g_strTempDir%\QAP-pin-on-26_c.png

	FileInstall, FileInstall\thumbs_up-32_c.png, %g_strTempDir%\thumbs_up-32_c.png
	FileInstall, FileInstall\solutions-32_c.png, %g_strTempDir%\solutions-32_c.png
	FileInstall, FileInstall\handshake-32_c.png, %g_strTempDir%\handshake-32_c.png
	FileInstall, FileInstall\conference-32_c.png, %g_strTempDir%\conference-32_c.png
	FileInstall, FileInstall\gift-32_c.png, %g_strTempDir%\gift-32_c.png
}

if FileExist(A_WorkingDir . "\QAPconnect.ini")
	FileInstall, FileInstall\QAPconnect-default.ini, %A_WorkingDir%\QAPconnect-default.ini, 1 ; overwrite
else
	FileInstall, FileInstall\QAPconnect-default.ini, %A_WorkingDir%\QAPconnect.ini ; no overwrite required
	
return
;-----------------------------------------------------------


;-----------------------------------------------------------
InitLanguageVariables:
;-----------------------------------------------------------

#Include %A_ScriptDir%\QuickAccessPopup_LANG.ahk

return
;-----------------------------------------------------------


;-----------------------------------------------------------
InitSystemArrays:
;-----------------------------------------------------------

; ----------------------
; Hotkeys: ini names, hotkey variables name, default values, gosub label and Gui hotkey titles
strPopupHotkeyNames := "NavigateOrLaunchHotkeyMouse|NavigateOrLaunchHotkeyKeyboard|AlternativeHotkeyMouse|AlternativeHotkeyKeyboard"
StringSplit, g_arrPopupHotkeyNames, strPopupHotkeyNames, |
strPopupHotkeyDefaults := "MButton|#W|+MButton|+#W"
StringSplit, g_arrPopupHotkeyDefaults, strPopupHotkeyDefaults, |
g_arrPopupHotkeys := Array ; initialized by LoadIniPopupHotkeys
g_arrPopupHotkeysPrevious := Array ; initialized by GuiOptions and checked in LoadIniPopupHotkeys

g_strMouseButtons := "None|LButton|MButton|RButton|XButton1|XButton2|WheelUp|WheelDown|WheelLeft|WheelRight|"
; leave last | to enable default value on the last item
StringSplit, g_arrMouseButtons, g_strMouseButtons, |

; ----------------------
; Icon files and index tested on Win 7 and Win 10. Win 8.1 assumed as Win 7.

strIconsNames := "iconQAP|iconAbout|iconAddThisFolder|iconApplication|iconCDROM"
	. "|iconChangeFolder|iconClipboard|iconClose|iconControlPanel|iconCurrentFolders"
	. "|iconDesktop|iconDocuments|iconDonate|iconDownloads|iconDrives"
	. "|iconEditFavorite|iconExit|iconFavorites|iconFolder|iconFonts"
	. "|iconFTP|iconGroup|iconHelp|iconHistory|iconHotkeys"
	. "|iconAddFavorite|iconMyComputer|iconMyMusic|iconMyVideo|iconNetwork"
	. "|iconNetworkNeighborhood|iconNoContent|iconOptions|iconPictures|iconRAMDisk"
	. "|iconRecentFolders|iconRecycleBin|iconReload|iconRemovable|iconSettings"
	. "|iconSpecialFolders|iconSubmenu|iconSwitch|iconTemplates|iconTemporary"
	. "|iconTextDocument|iconUnknown|iconWinver|iconFolderLive|iconIcons"
	. "|iconPaste|iconPasteSpecial"

; EXAMPLE
; g_objJLiconsByName["iconAbout"] -> "file,2"
; g_objJLiconsNames[2] -> "iconAbout"
Loop, Parse, strIconsNames, |
{
	g_objJLiconsNames.Insert(A_LoopField)
	g_objJLiconsByName[A_LoopField] := g_strJLiconsFile . "," . A_Index ; change file path
}
; BEFORE: g_objIconsFile["iconPictures"] and g_objIconsIndex["iconPictures"]

; ----------------------
; ACTIVE FILE MANAGER
; g_arrActiveFileManagerSystemNames: array system names (1-4)
; g_arrActiveFileManagerDisplayNames: array system names (1-4)
; g_intActiveFileManager: default 1 for "WindowsExplorer" (replace "blnUseXYZ" variables from FP)

strActiveFileManagerSystemNames := "WindowsExplorer|DirectoryOpus|TotalCommander|QAPconnect"
StringSplit, g_arrActiveFileManagerSystemNames, strActiveFileManagerSystemNames, |

strActiveFileManagerDisplayNames := "Windows Explorer|Directory Opus|Total Commander|QAPconnect"
StringSplit, g_arrActiveFileManagerDisplayNames, strActiveFileManagerDisplayNames, |

; ----------------------

strPopupHotkeyNames := ""
strPopupHotkeyDefaults := ""
strIconsMenus := ""
strIconsFile := ""
strIconsIndex := ""
arrIconsFile := ""
arrIconsIndex := ""
strActiveFileManagerSystemNames := ""
strActiveFileManagerNames := ""
arrActiveFileManagerNames := ""

return
;-----------------------------------------------------------


;------------------------------------------------------------
InitLanguages:
;------------------------------------------------------------

strDebugLanguageFile := A_WorkingDir . "\" . g_strAppNameFile . "_LANG_ZZ.txt"
if FileExist(strDebugLanguageFile)
{
	strLanguageFile := strDebugLanguageFile
	g_strLanguageCode := "EN"
}
else
{
	IfNotExist, %g_strIniFile%
		; read language code from ini file created by the Inno Setup script in the user data folder
		IniRead, g_strLanguageCode, % A_WorkingDir . "\" . g_strAppNameFile . "-setup.ini", Global , LanguageCode, EN
	else
		IniRead, g_strLanguageCode, %g_strIniFile%, Global, LanguageCode, EN

	strLanguageFile := g_strTempDir . "\" . g_strAppNameFile . "_LANG_" . g_strLanguageCode . ".txt"
}
	
strReplacementForSemicolon := "!r4nd0mt3xt!" ; for non-comment semi-colons ";" escaped as ";;"

if FileExist(strLanguageFile)
{
	FileRead, strLanguageStrings, %strLanguageFile%
	Loop, Parse, strLanguageStrings, `n, `r
	{
		if (SubStr(A_LoopField, 1, 1) <> ";") ; skip comment lines
		{
			StringSplit, arrLanguageBit, A_LoopField, `t
			if SubStr(arrLanguageBit1, 1, 1) = "l"
				%arrLanguageBit1% := arrLanguageBit2
			StringReplace, %arrLanguageBit1%, %arrLanguageBit1%, ``n, `n, All
			
			if InStr(%arrLanguageBit1%, ";;") ; preserve escaped ; in string
				StringReplace, %arrLanguageBit1%, %arrLanguageBit1%, % ";;", %strReplacementForSemicolon%, A
			if InStr(%arrLanguageBit1%, ";")
				%arrLanguageBit1% := Trim(SubStr(%arrLanguageBit1%, 1, InStr(%arrLanguageBit1%, ";") - 1)) ; trim comment from ; and trim spaces and tabs
			if InStr(%arrLanguageBit1%, strReplacementForSemicolon) ; restore escaped ; in string
				StringReplace, %arrLanguageBit1%, %arrLanguageBit1%, %strReplacementForSemicolon%, % ";", A
		}
	}
}
else
	g_strLanguageCode := "EN"

strLanguageFile := ""
strReplacementForSemicolon := ""
strLanguageStrings := ""
arrLanguageBit := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
InitLanguageArrays:
;------------------------------------------------------------

; ----------------------
; OPTIONS
StringSplit, g_arrOptionsPopupHotkeyTitles, lOptionsPopupHotkeyTitles, |
strOptionsLanguageCodes := "EN|FR|DE|SV|ES|PT-BR|IT|ZH-TW|PT|ZH-CN|NL" ; removed KO - edit lOptionsLanguageLabels in all languages
StringSplit, g_arrOptionsLanguageCodes, strOptionsLanguageCodes, |
StringSplit, g_arrOptionsLanguageLabels, lOptionsLanguageLabels, |

loop, %g_arrOptionsLanguageCodes0%
	if (g_arrOptionsLanguageCodes%A_Index% = g_strLanguageCode)
		{
			g_strLanguageLabel := g_arrOptionsLanguageLabels%A_Index%
			break
		}

lDialogMouseButtonsText := lDialogNone . "|" . lDialogMouseButtonsText ; use lDialogNone because this is displayed
StringSplit, g_arrMouseButtonsText, lDialogMouseButtonsText, |

; 1 Basic Settings, 2 Menu Options, 3 Window Options, 4 Advanced Settings
StringSplit, g_arrFavoriteGuiTabs, lDialogAddFavoriteTabs, |

; ----------------------
; FAVORITE TYPES
strFavoriteTypes := "Folder|Document|Application|Special|URL|FTP|QAP|Menu|Group|X|K|B|Snippet|External"
StringSplit, g_arrFavoriteTypes, strFavoriteTypes, |
StringSplit, arrFavoriteTypesLabels, lDialogFavoriteTypesLabels, |
g_objFavoriteTypesLabels := Object()
StringSplit, arrFavoriteTypesLocationLabels, lDialogFavoriteTypesLocationLabels, |
g_objFavoriteTypesLocationLabels := Object()
; StringSplit, arrFavoriteTypesHelp, lDialogFavoriteTypesHelp, |
Loop, 9 ; excluding X, K and B
	arrFavoriteTypesHelp%A_Index% := lDialogFavoriteTypesHelp%A_Index%
arrFavoriteTypesHelp13 := lDialogFavoriteTypesHelp13
arrFavoriteTypesHelp14 := lDialogFavoriteTypesHelp14
g_objFavoriteTypesHelp := Object()
StringSplit, arrFavoriteTypesShortNames, lDialogFavoriteTypesShortNames, |
g_objFavoriteTypesShortNames := Object()
Loop, %g_arrFavoriteTypes0%
{
	; example to display favorite type label: g_objFavoriteTypesLabels["Folder"], g_objFavoriteTypesLabels["Document"]
	g_objFavoriteTypesLabels.Insert(g_arrFavoriteTypes%A_Index%, arrFavoriteTypesLabels%A_Index%)
	g_objFavoriteTypesLocationLabels.Insert(g_arrFavoriteTypes%A_Index%, arrFavoriteTypesLocationLabels%A_Index%)
	g_objFavoriteTypesHelp.Insert(g_arrFavoriteTypes%A_Index%, arrFavoriteTypesHelp%A_Index%)
	g_objFavoriteTypesShortNames.Insert(g_arrFavoriteTypes%A_Index%, arrFavoriteTypesShortNames%A_Index%)
}

strOptionsLanguageCodes := ""
strFavoriteTypes := ""
arrFavoriteTypesLabels := ""
arrFavoriteTypesLocationLabels := ""
arrFavoriteTypesHelp := ""
arrFavoriteTypesShortNames := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
InitSpecialFolders:
;------------------------------------------------------------

; Shell numeric Constants
; http://msdn.microsoft.com/en-us/library/windows/desktop/bb774096%28v=vs.85%29.aspx

; Shell Commands:
; http://www.sevenforums.com/tutorials/4941-shell-command.html
; http://www.eightforums.com/tutorials/6050-shell-commands-windows-8-a.html

; Environment system variables
; http://en.wikipedia.org/wiki/Environment_variable#Windows

; InitSpecialFolderObject(strClassIdOrPath, strShellConstant, intShellConstant, strAHKConstant, strDOpusAlias, strTCCommand
;	, strDefaultName, strDefaultIcon
;	, strUse4NavigateExplorer, strUse4NewExplorer, strUse4Dialog, strUse4Console, strUse4DOpus, strUse4TC, strUse4FPc)

; 		CLS: Class ID
;		SCT: Shell Constant Text
;		SCN: Shell Constant Numeric
;		DOA: Directory Opus Alias
;		TCC: Total Commander Commands
;		NEW: Open in new Explorer anyway
;
; NOTES
; - Total Commander commands: cm_OpenDesktop (2121), cm_OpenDrives (2122), cm_OpenControls (2123), cm_OpenFonts (2124), cm_OpenNetwork (2125), cm_OpenPrinters (2126), cm_OpenRecycled (2127)
; - DOpus see http://resource.dopus.com/viewtopic.php?f=3&t=23691
;
; InitSpecialFolderObject(strClassIdOrPath, strShellConstantText, intShellConstantNumeric, strAHKConstant, strDOpusAlias, strTCCommand
;	, strDefaultName, strDefaultIcon
;	, strUse4NavigateExplorer, strUse4NewExplorer, strUse4Dialog, strUse4Console, strUse4DOpus, strUse4TC, strUse4FPc)

;---------------------
; CLSID giving localized name and icon, with valid Shell Command

InitSpecialFolderObject("{D20EA4E1-3957-11d2-A40B-0C5020524153}", "Common Administrative Tools", -1, "", "commonadmintools", ""
	, "Administrative Tools", "" ; Outils d’administration
	, "CLS", "CLS", "NEW", "NEW", "DOA", "NEW", "NEW")
	; OK     OK      OK     OK    OK      OK
InitSpecialFolderObject("{20D04FE0-3AEA-1069-A2D8-08002B30309D}", "MyComputerFolder", 17, "", "mycomputer", 2122
	, "Computer", "" ; Ordinateur
	, "SCT", "SCT", "SCT", "NEW", "DOA", "TCC", "NEW") ; for 1,2,3 CLS works, 7 OK for FPc but CLS does not work with DoubleCommander
	; OK     OK      OK     OK    OK      OK
InitSpecialFolderObject("{21EC2020-3AEA-1069-A2DD-08002B30309D}", "ControlPanelFolder", 3, "", "controls", 2123
	, "Control Panel (Icons view)", "" ; Tous les Panneaux de configuration
	, "SCT", "SCT", "NEW", "NEW", "DOA", "CLS", "NEW")
	; OK     OK      OK     OK    OK  NO-use NEW
InitSpecialFolderObject("{450D8FBA-AD25-11D0-98A8-0800361B1103}", "Personal", 5, "A_MyDocuments", "mydocuments", ""
	, "Documents", "" ; Mes documents
	, "SCT", "SCT", "AHK", "AHK", "DOA", "AHK", "AHK")
	; OK     OK      OK     OK    OK      OK
InitSpecialFolderObject("{ED228FDF-9EA8-4870-83b1-96b02CFE0D52}", "Games", -1, "", "", ""
	, "Games Explorer", "" ; Jeux
	, "SCT", "SCT", "NEW", "NEW", "NEW", "CLS", "NEW")
	; OK     OK      OK     OK    OK      OK
InitSpecialFolderObject("{B4FB3F98-C1EA-428d-A78A-D1F5659CBA93}", "HomeGroupFolder", -1, "", "", ""
	, "HomeGroup", "" ; Groupe résidentiel
	, "SCT", "SCT", "SCT", "NEW", "NEW", "CLS", "NEW")
	; OK     OK      OK     OK    OK     OK
InitSpecialFolderObject("{031E4825-7B94-4dc3-B131-E946B44C8DD5}", "Libraries", -1, "", "libraries", ""
	, "Libraries", "" ; Bibliothèque
	, "SCT", "SCT", "SCT", "NEW", "DOA", "CLS", "NEW")
	; OK     OK      OK     OK     OK      OK
InitSpecialFolderObject("{7007ACC7-3202-11D1-AAD2-00805FC1270E}", "ConnectionsFolder", -1, "", "", ""
	, "Network Connections", "" ; Connexions réseau
	, "SCT", "SCT", "NEW", "NEW", "NEW", "CLS", "NEW")
	; OK     OK      OK     OK     OK    No-OK
InitSpecialFolderObject("{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}", "NetworkPlacesFolder", 18, "", "network", 2125
	, "Network", "" ; Réseau
	, "SCT", "SCT", "SCT", "NEW", "DOA", "TCC", "NEW")
	; OK     OK      OK     OK    OK      OK
InitSpecialFolderObject("{2227A280-3AEA-1069-A2DE-08002B30309D}", "PrintersFolder", -1, "", "printers", 2126
	, "Printers and Faxes", "" ; Imprimantes
	, "SCT", "SCT", "NEW", "NEW", "DOA", "TCC", "NEW")
	; OK     OK      OK     OK    OK      OK
InitSpecialFolderObject("{645FF040-5081-101B-9F08-00AA002F954E}", "RecycleBinFolder", 0, "", "trash", 2127
	, "Recycle Bin", "" ; Corbeille
	, "SCT", "SCT", "NEW", "NEW", "DOA", "TCC", "NEW")
	; OK     OK      OK     OK    OK      OK
InitSpecialFolderObject("{59031a47-3f72-44a7-89c5-5595fe6b30ee}", "Profile", -1, "", "profile", ""
	, lMenuUserFolder, "" ; Dossier de l'utilisateur
	, "SCT", "SCT", "SCT", "NEW", "DOA", "CLS", "NEW")
	; OK     OK      OK     OK    OK      OK
InitSpecialFolderObject("{1f3427c8-5c10-4210-aa03-2ee45287d668}", "User Pinned", -1, "", "", ""
	, lMenuUserPinned, "" ; Epinglé par l'utilisateur
	, "SCT", "SCT", "SCT", "NEW", "NEW", "NEW", "NEW")
	; OK     OK      OK     OK    OK      OK
InitSpecialFolderObject("{BD84B380-8CA2-1069-AB1D-08000948534}", "Fonts", -1, "", "fonts", 2124
	, lMenuFonts, "iconFonts"
	, "SCT", "SCT", "NEW", "NEW", "DOA", "TCC", "NEW")
	; OK     OK      OK     OK    OK      OK

;---------------------
; CLSID giving localized name and icon, no valid Shell Command, must be open in a new Explorer using CLSID - to be tested with DOpus, TC and FPc

InitSpecialFolderObject("{B98A2BEA-7D42-4558-8BD1-832F41BAC6FD}", "", -1, "", "", ""
	, "Backup and Restore", "" ; Sauvegarder et restaurer
	, "CLS", "CLS", "NEW", "NEW", "NEW", "NEW", "NEW")
InitSpecialFolderObject("{ED7BA470-8E54-465E-825C-99712043E01C}", "", -1, "", "", ""
	, "Control Panel (All Tasks)", "" ; Toutes les tâches
	, "CLS", "CLS", "NEW", "NEW", "NEW", "NEW", "NEW")
InitSpecialFolderObject("{323CA680-C24D-4099-B94D-446DD2D7249E}", "", -1, "", "favorites", ""
	, "Favorites", "" ; Favoris (<> Favorites (Internet))
	, "CLS", "CLS", "CLS", "NEW", "DOA", "NEW", "NEW")
if (GetOsVersion() <> "WIN_10")
	InitSpecialFolderObject("{3080F90E-D7AD-11D9-BD98-0000947B0257}", "", -1, "", "", ""
		, "Flip 3D", "" ; Pas de traduction
		, "CLS", "CLS", "NEW", "NEW", "NEW", "NEW", "NEW")
InitSpecialFolderObject("{6DFD7C5C-2451-11d3-A299-00C04F8EF6AF}", "", -1, "", "", ""
	, "Folder Options", "" ; Options des dossiers
	, "CLS", "CLS", "NEW", "NEW", "NEW", "NEW", "NEW")
if (A_OSVersion = "WIN_7") ; Performance Information and Tool not available on Win8+
	InitSpecialFolderObject("{78F3955E-3B90-4184-BD14-5397C15F1EFC}", "", -1, "", "", ""
		, "Performance Information and Tools", "" ; Informations et outils de performance
		, "CLS", "CLS", "NEW", "NEW", "NEW", "NEW", "NEW")
InitSpecialFolderObject("{35786D3C-B075-49b9-88DD-029876E11C01}", "", -1, "", "", ""
	, "Portable Devices", "" ; Appareils mobiles
	, "CLS", "CLS", "NEW", "NEW", "NEW", "NEW", "NEW")
InitSpecialFolderObject("{22877a6d-37a1-461a-91b0-dbda5aaebc99}", "", -1, "", "", ""
	, "Recent Places", "" ; Emplacements récents
	, "CLS", "CLS", "NEW", "NEW", "NEW", "NEW", "NEW")
InitSpecialFolderObject("{3080F90D-D7AD-11D9-BD98-0000947B0257}", "", -1, "", "", ""
	, "Show Desktop", "" ; Afficher le Bureau
	, "CLS", "CLS", "NEW", "NEW", "NEW", "NEW", "NEW")
InitSpecialFolderObject("{BB06C0E4-D293-4f75-8A90-CB05B6477EEE}", "", -1, "", "", ""
	, "System", "" ; Système
	, "CLS", "CLS", "NEW", "NEW", "NEW", "NEW", "NEW")

;---------------------
; Path from registry (no CLSID), localized name and icon provided, no Shell Command - to be tested with DOpus, TC and FPc

RegRead, g_strDownloadPath, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders, {374DE290-123F-4565-9164-39C4925E467B}
InitSpecialFolderObject(g_strDownloadPath, "", -1, "", "downloads", ""
	, lMenuDownloads, "iconDownloads"
	, "CLS", "CLS", "CLS", "CLS", "DOA", "CLS", "CLS")
RegRead, strException, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders, My Music
InitSpecialFolderObject(strException, "", -1, "", "mymusic", ""
	, lMenuMyMusic, "iconMyMusic"
	, "CLS", "CLS", "CLS", "CLS", "DOA", "CLS", "CLS")
RegRead, strException, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders, My Video
InitSpecialFolderObject(strException, "", -1, "", "myvideos", ""
	, lMenuMyVideo, "iconMyVideo"
	, "CLS", "CLS", "CLS", "CLS", "DOA", "CLS", "CLS")
RegRead, strException, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders, Templates
InitSpecialFolderObject(strException, "", -1, "", "templates", ""
	, lMenuTemplates, "iconTemplates"
	, "CLS", "CLS", "CLS", "CLS", "DOA", "CLS", "CLS")
RegRead, g_strMyPicturesPath, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders, My Pictures
InitSpecialFolderObject(g_strMyPicturesPath, "", 39, "", "mypictures", ""
	, lMenuPictures, "iconPictures"
	, "CLS", "CLS", "CLS", "CLS", "DOA", "CLS", "CLS")
RegRead, strException, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders, Favorites ; Favorites (Internet)
InitSpecialFolderObject(strException, "", -1, "", "", ""
	, lMenuFavoritesInternet, "iconFavorites"
	, "CLS", "CLS", "CLS", "CLS", "CLS", "CLS", "CLS")

;---------------------
; Path under %APPDATA% (no CLSID), localized name and icon provided, no Shell Command - to be tested with DOpus, TC and FPc

InitSpecialFolderObject("%APPDATA%\Microsoft\Windows\Start Menu", "", -1, "A_StartMenu", "start", ""
	, lMenuStartMenu, "iconFolder"
	, "CLS", "CLS", "CLS", "CLS", "DOA", "CLS", "CLS")
InitSpecialFolderObject("%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup", "", -1, "A_Startup", "startup", ""
	, lMenuStartup, "iconFolder"
	, "CLS", "CLS", "CLS", "CLS", "DOA", "CLS", "CLS")
InitSpecialFolderObject("%APPDATA%", "", -1, "A_AppData", "appdata", ""
	, lMenuAppData, "iconFolder"
	, "CLS", "CLS", "CLS", "CLS", "DOA", "CLS", "CLS")
InitSpecialFolderObject("%APPDATA%\Microsoft\Windows\Recent", "", -1, "", "recent", ""
	, lMenuRecentItems, "iconRecentFolders"
	, "CLS", "CLS", "CLS", "CLS", "DOA", "CLS", "CLS")
if (GetOsVersion() = "WIN_10")
	InitSpecialFolderObject("%LocalAppData%\Packages\Microsoft.MicrosoftEdge_8wekyb3d8bbwe\AC\MicrosoftEdge\Cookies", "", -1, "", "cookies", ""
		, lMenuCookies, "iconFolder"
		, "CLS", "CLS", "CLS", "CLS", "DOA", "CLS", "CLS")
else
	InitSpecialFolderObject("%APPDATA%\Microsoft\Windows\Cookies", "", -1, "", "cookies", ""
		, lMenuCookies, "iconFolder"
		, "CLS", "CLS", "CLS", "CLS", "DOA", "CLS", "CLS")
InitSpecialFolderObject("%APPDATA%\Microsoft\Internet Explorer\Quick Launch", "", -1, "", "", ""
	, lMenuQuickLaunch, "iconFolder"
	, "CLS", "CLS", "CLS", "CLS", "CLS", "CLS", "CLS")
InitSpecialFolderObject("%APPDATA%\Microsoft\SystemCertificates", "", -1, "", "", ""
	, lMenuSystemCertificates, "iconFolder"
	, "CLS", "CLS", "CLS", "CLS", "CLS", "CLS", "CLS")

;---------------------
; Path under other environment variables (no CLSID), localized name and icon provided, no Shell Command - to be tested with DOpus, TC and FPc

InitSpecialFolderObject("%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu", "", -1, "A_StartMenuCommon", "commonstartmenu", ""
	, lMenuCommonStartMenu, "iconFolder"
	, "CLS", "CLS", "CLS", "CLS", "DOA", "CLS", "CLS")
InitSpecialFolderObject("%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs\Startup", "", -1, "A_StartupCommon", "commonstartup", ""
	, lMenuCommonStartupMenu, "iconFolder"
	, "CLS", "CLS", "CLS", "CLS", "DOA", "CLS", "CLS")
InitSpecialFolderObject("%ALLUSERSPROFILE%", "", -1, "A_AppDataCommon", "commonappdata", ""
	, lMenuCommonAppData, "iconFolder"
	, "CLS", "CLS", "CLS", "CLS", "DOA", "CLS", "CLS")
InitSpecialFolderObject("%LOCALAPPDATA%\Microsoft\Windows\Temporary Internet Files", "", -1, "", "", ""
	, lMenuCache, "iconTemporary"
	, "CLS", "CLS", "CLS", "CLS", "CLS", "CLS", "CLS")
InitSpecialFolderObject("%LOCALAPPDATA%\Microsoft\Windows\History", "", -1, "", "history", ""
	, lMenuHistory, "iconHistory"
	, "CLS", "CLS", "CLS", "CLS", "DOA", "CLS", "CLS")
InitSpecialFolderObject("%ProgramFiles%", "", -1, "A_ProgramFiles", "programfiles", ""
	, lMenuProgramFiles, "iconFolder"
	, "CLS", "CLS", "CLS", "CLS", "DOA", "CLS", "CLS")
if (A_Is64bitOS)
	InitSpecialFolderObject("%ProgramFiles(x86)%", "", -1, "", "programfilesx86", ""
		, lMenuProgramFiles . " (x86)", "iconFolder"
		, "CLS", "CLS", "CLS", "CLS", "DOA", "CLS", "CLS")
InitSpecialFolderObject("%PUBLIC%\Libraries", "", -1, "", "", ""
	, lMenuPublicLibraries, "iconFolder"
	, "CLS", "CLS", "CLS", "CLS", "CLS", "CLS", "CLS")

;---------------------
; Path under the Users folder (no CLSID, localized name and icon provided), no Shell Command

StringReplace, strPathUsername, A_AppData, \AppData\Roaming
StringReplace, strPathUsers, strPathUsername, \%A_UserName%

InitSpecialFolderObject(strPathUsers . "\Public", "Public", -1, "", "common", ""
	, "Public Folder", "" ; Public
	, "SCT", "SCT", "SCT", "CLS", "DOA", "CLS", "CLS")
	; OK     OK      OK     OK    OK      OK

;---------------------
; Path using AHK constants (no CLSID), localized name and icon provided, no Shell Command - to be tested with DOpus, TC and FPc

InitSpecialFolderObject(A_Desktop, "", 0, "A_Desktop", "desktop", 2121
	, lMenuDesktop, "iconDesktop"
	, "CLS", "CLS", "CLS", "CLS", "DOA", "TCC", "CLS")
InitSpecialFolderObject(A_DesktopCommon, "", -1, "A_DesktopCommon", "commondesktopdir", ""
	, lMenuCommonDesktop, "iconDesktop"
	, "CLS", "CLS", "CLS", "CLS", "DOA", "CLS", "CLS")
InitSpecialFolderObject(A_Temp, "", -1, "A_Temp", "temp", ""
	, lMenuTemporaryFiles, "iconTemporary"
	, "CLS", "CLS", "CLS", "CLS", "DOA", "CLS", "CLS")
InitSpecialFolderObject(A_WinDir, "", -1, "A_WinDir", "windows", ""
	, "Windows", "iconWinver"
	, "CLS", "CLS", "CLS", "CLS", "DOA", "CLS", "CLS")
InitSpecialFolderObject(A_Programs, "", -1, "A_Programs", "programs", "" ; CLSID was "{7be9d83c-a729-4d97-b5a7-1b7313c39e0a}" but not working under Win 10
	, lMenuProgramsFolderStartMenu, "" ; Menu Démarrer / Programmes (Menu Start/Programs)
	, "CLS", "CLS", "CLS", "CLS", "DOA", "AHK", "AHK")

;------------------------------------------------------------
; Build folders list for dropdown

g_strSpecialFoldersList := ""
for strSpecialFolderName in g_objClassIdOrPathByDefaultName
	g_strSpecialFoldersList .= strSpecialFolderName . "|"
StringTrimRight, g_strSpecialFoldersList, g_strSpecialFoldersList, 1

strException := ""
strPathUsername := ""
strPathUsers := ""
strSpecialFolderName := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
InitSpecialFolderObject(strClassIdOrPath, strShellConstantText, intShellConstantNumeric, strAHKConstant, strDOpusAlias, strTCCommand
	, strDefaultName, strDefaultIcon
	, strUse4NavigateExplorer, strUse4NewExplorer, strUse4Dialog, strUse4Console, strUse4DOpus, strUse4TC, strUse4FPc)

; strClassIdOrPath: CLSID or Path, used as key to access objSpecialFolder objects
;		CLSID Win_7: http://www.sevenforums.com/tutorials/110919-clsid-key-list-windows-7-a.html
;		CLSID Win_8: http://www.eightforums.com/tutorials/13591-clsid-key-guid-shortcuts-list-windows-8-a.html
; 		Environment system variables: http://en.wikipedia.org/wiki/Environment_variable#Windows
;		HKEY_CLASSES_ROOT Key: http://msdn.microsoft.com/en-us/library/windows/desktop/ms724475(v=vs.85).aspx
; 		NOTES How to call in Explorer...
;		... CLSID: shell:::{{20D04FE0-3AEA-1069-A2D8-08002B30309D}}
;		... ShellConstant: shell:MyComputerFolder

; strShellConstantText: text constant used to navigate using Explorer or Dialog box? What with DOpus and TC?
;		http://www.sevenforums.com/tutorials/4941-shell-command.html
;		http://www.eightforums.com/tutorials/6050-shell-commands-windows-8-a.html

; intShellConstantNumeric: numeric ShellSpecialFolderConstants constant 
;		http://msdn.microsoft.com/en-us/library/windows/desktop/bb774096%28v=vs.85%29.aspx

; CLSID, strShellConstantText (by version XP!, Vista, 7) and intShellConstantNumeric: http://docs.rainmeter.net/tips/launching-windows-special-folders

; strAHKConstant: AutoHotkey constant

; strDOpusAlias: Directory Opus constant

; strTCCommand: Total Commander constant

; strDefaultName: name for menu if path is used, fallback name if CLSID is used to access localized name

; strDefaultIcon: icon in g_objJLiconsByName if path is used, fallback icon (?) if CLSID returns no icon resource

; Constants for "use" flags:
; 		CLS: Class ID
;		SCT: Shell Constant Text
;		SCN: Shell Constant Numeric
;		DOA: Directory Opus Alias
;		TCC: Total Commander Commands

; Usage flags:
; 		strUse4NavigateExplorer
; 		strUse4NewExplorer
; 		strUse4Dialog
; 		strUse4Console
; 		strUse4DOpus
; 		strUse4TC
;		strUse4FPc

; Special Folder Object (objOneSpecialFolder) definition:
;		strClassIdOrPath: key to access one Special Folder object (example: g_objSpecialFolders[strClassIdOrPath], saved to ini file
;		objSpecialFolder.ShellConstantText: text constant used to navigate using Explorer or Dialog box? What with DOpus and TC?
;		objSpecialFolder.ShellConstantNumeric: numeric ShellSpecialFolderConstants constant 
;		objSpecialFolder.AHKConstant: AutoHotkey constant
;		objSpecialFolder.DOpusAlias: Directory Opus constant
;		objSpecialFolder.TCCommand: Total Commander constant
;		objSpecialFolder.DefaultName:
;		objSpecialFolder.DefaultIcon: icon resource name in the format "file,index"
;		objSpecialFolder.Use4NavigateExplorer:
;		objSpecialFolder.Use4NewExplorer:
;		objSpecialFolder.Use4Dialog:
;		objSpecialFolder.Use4Console:
;		objSpecialFolder.Use4DOpus:
;		objSpecialFolder.Use4TC:
;		objSpecialFolder.Use4FPc:

;------------------------------------------------------------
{
	global g_objJLiconsByName
	global g_objClassIdOrPathByDefaultName
	global g_objSpecialFolders
	
	objOneSpecialFolder := Object()
	
	blnIsClsId := (SubStr(strClassIdOrPath, 1, 1) = "{")

	if (blnIsClsId)
		strThisDefaultName := GetLocalizedNameForClassId(strClassIdOrPath)
	If !StrLen(strThisDefaultName)
		strThisDefaultName := strDefaultName
    g_objClassIdOrPathByDefaultName.Insert(strThisDefaultName, strClassIdOrPath)
	objOneSpecialFolder.DefaultName := strThisDefaultName
	
	if (blnIsClsId)
		strThisDefaultIcon := GetIconForClassId(strClassIdOrPath)
	if !StrLen(strThisDefaultIcon) and StrLen(g_objJLiconsByName[strDefaultIcon])
		strThisDefaultIcon := g_objJLiconsByName[strDefaultIcon]
	if !StrLen(strThisDefaultIcon)
		strThisDefaultIcon := "%SystemRoot%\System32\shell32.dll,4" ; fallback folder icon from shell32.dll
	objOneSpecialFolder.DefaultIcon := strThisDefaultIcon

	objOneSpecialFolder.ShellConstantText := strShellConstantText
	objOneSpecialFolder.ShellConstantNumeric := intShellConstantNumeric
	objOneSpecialFolder.AHKConstant := strAHKConstant
	objOneSpecialFolder.DOpusAlias := strDOpusAlias
	objOneSpecialFolder.TCCommand := strTCCommand
	
	objOneSpecialFolder.Use4NavigateExplorer := strUse4NavigateExplorer
	objOneSpecialFolder.Use4NewExplorer := strUse4NewExplorer
	objOneSpecialFolder.Use4Dialog := strUse4Dialog
	objOneSpecialFolder.Use4Console := strUse4Console
	objOneSpecialFolder.Use4DOpus := strUse4DOpus
	objOneSpecialFolder.Use4TC := strUse4TC
	objOneSpecialFolder.Use4FPc := strUse4FPc
	
	g_objSpecialFolders.Insert(strClassIdOrPath, objOneSpecialFolder)
}
;------------------------------------------------------------


;------------------------------------------------------------
GetLocalizedNameForClassId(strClassId)
;------------------------------------------------------------
{
    RegRead, strLocalizedString, HKEY_CLASSES_ROOT, CLSID\%strClassId%, LocalizedString
    ; strLocalizedString example: "@%SystemRoot%\system32\shell32.dll,-9216"

    StringSplit, arrLocalizedString, strLocalizedString, `,
    intDllNameStart := InStr(arrLocalizedString1, "\", , 0)
    StringRight, strDllFile, arrLocalizedString1, % StrLen(arrLocalizedString1) - intDllNameStart
    strDllIndex := arrLocalizedString2
    strTranslatedName := TranslateMUI(strDllFile, Abs(strDllIndex))
    
    return strTranslatedName
}
;------------------------------------------------------------


;------------------------------------------------------------
GetIconForClassId(strClassId)
;------------------------------------------------------------
{
	RegRead, strDefaultIcon, HKEY_CLASSES_ROOT, CLSID\%strClassId%\DefaultIcon
    return strDefaultIcon
}
;------------------------------------------------------------


;------------------------------------------------------------
TranslateMUI(resDll, resID)
; source: 7plus (https://github.com/7plus/7plus/blob/master/MiscFunctions.ahk)
;------------------------------------------------------------
{
	VarSetCapacity(buf, 256) 
	hDll := DllCall("LoadLibrary", "str", resDll, "Ptr") 
	Result := DllCall("LoadString", "Ptr", hDll, "uint", resID, "str", buf, "int", 128)
	return buf
}
;------------------------------------------------------------


;------------------------------------------------------------
InitQAPFeatures:
;------------------------------------------------------------

; InitQAPFeatureObject(strQAPFeatureCode, strThisDefaultName, strQAPFeatureMenuName, strQAPFeatureCommand, intQAPFeatureAlternativeOrder, strThisDefaultIcon, strDefaultHotkey)

; Submenus features
InitQAPFeatureObject("Clipboard",				lMenuClipboard . "...",				"g_menuClipboard",			"ClipboardMenuShortcut",				0, 		"iconClipboard", 		"+^V")
InitQAPFeatureObject("Current Folders",			lMenuCurrentFolders . "...",		"g_menuReopenFolder",		"ReopenFolderMenuShortcut",				0,		"iconCurrentFolders",	"+^F")
InitQAPFeatureObject("Switch Folder or App",	lMenuSwitchFolderOrApp . "...",		"g_menuSwitchFolderOrApp",	"SwitchFolderOrAppMenuShortcut",		0, 		"iconSwitch",			"+^W")
InitQAPFeatureObject("TC Directory hotlist",	lTCMenuName . "...",				lTCMenuName,				"TotalCommanderHotlistMenuShortcut", 	0,		"iconSubmenu",			"+^T")
; InitQAPFeatureObject("Drives",			lMenuDrives . "...",				"g_menuDrives",			"DrivesMenuShortcut",			0, "iconDrives",		"+^D")
; InitQAPFeatureObject("Recent Folders",	lMenuRecentFolders . "...",			"g_menuRecentFolders",	"RecentFoldersMenuShortcut",	0, "iconRecentFolders", "+^R")

; Separated menus in case wait time is too long
InitQAPFeatureObject("Recent Folders", lMenuRecentFolders . "...", "", "RecentFoldersMenuShortcut", 0, "iconRecentFolders", "+^R")
InitQAPFeatureObject("Drives", lMenuDrives . "...",	"", "DrivesMenuShortcut", 0, "iconDrives", "+^D")

; Command features
InitQAPFeatureObject("About",			lGuiAbout . "...",					"", "GuiAbout",							0, "iconAbout")
InitQAPFeatureObject("Add Favorite",	lMenuAddFavorite . "...",			"", "GuiAddFavoriteFromQAP",			0, "iconAddFavorite")
InitQAPFeatureObject("Add This Folder",	lMenuAddThisFolder . "...",			"", "AddThisFolder",					0, "iconAddThisFolder", "+^A")
InitQAPFeatureObject("Add This Folder Express",	lMenuAddThisFolderXpress,	"", "AddThisFolderXpress",				0, "iconAddThisFolder")
InitQAPFeatureObject("Exit",			L(lMenuExitApp, g_strAppNameText),	"", "ExitApp",							0, "iconExit")
InitQAPFeatureObject("Help",			lGuiHelp . "...",					"", "GuiHelp",							0, "iconHelp")
InitQAPFeatureObject("Hotkeys",			lDialogHotkeys . "...",				"", "GuiHotkeysManageFromQAPFeature",	0, "iconHotkeys")
InitQAPFeatureObject("Icons",			lDialogIconsManage . "...",			"", "GuiIconsManageFromQAPFeature",		0, "iconIcons")
InitQAPFeatureObject("Options",			lGuiOptions . "...",				"", "GuiOptionsFromQAPFeature",			0, "iconOptions")
InitQAPFeatureObject("Settings",		lMenuSettings . "...",				"", "SettingsHotkey",					0, "iconSettings", "+^S")
InitQAPFeatureObject("Support",			lGuiDonate . "...",					"", "GuiDonate",						0, "iconDonate")
InitQAPFeatureObject("GetWinInfo",		lMenuGetWinInfo . "...",			"", "GetWinInfo",						0, "iconAbout")
InitQAPFeatureObject("ShutDown",		lMenuComputerShutdown . "...",		"", "ShutdownComputer",					0, "iconExit")
InitQAPFeatureObject("Restart",			lMenuComputerRestart . "...",		"", "RestartComputer",					0, "iconReload")
InitQAPFeatureObject("Reload",			L(lMenuReload, g_strAppNameText),	"", "ReloadQAP",						0, "iconReload")
InitQAPFeatureObject("CloseMenu",		lMenuCloseThisMenu,					"", "DoNothing",						0, "iconClose")
InitQAPFeatureObject("ImportExport",	lImpExpMenu . "...",				"", "ImportExport",						0, "iconSettings")
InitQAPFeatureObject("SwitchSettings",	lMenuSwitchSettings . "...",		"", "SwitchSettings",					0, "iconSettings")
InitQAPFeatureObject("RefreshMenu",		lMenuRefreshMenu,					"", "RefreshQAPMenu",					0, "iconReload")
InitQAPFeatureObject("AddExternalFromCatalogue", lMenuExternalCatalogue, 	"", "AddExternalCatalogueFromQAPFeature",	0, "iconAddFavorite")
InitQAPFeatureObject("ReopenCurrentFolder", lMenuReopenCurrentFolder, 		"", "OpenReopenCurrentFolder",				0, "iconChangeFolder", "+^C")

; Alternative Menu features
InitQAPFeatureObject("Open in New Window",		lMenuAlternativeNewWindow,				"", "", 1, "iconFolder")
InitQAPFeatureObject("Edit Favorite",			lMenuAlternativeEditFavorite,			"", "", 3, "iconEditFavorite")
InitQAPFeatureObject("Copy Favorite Location",	lMenuCopyLocation,						"", "", 5, "iconClipboard")
InitQAPFeatureObject("Run As Administrator",	lMenuAlternativeRunAs,					"", "", 7, "iconApplication")
InitQAPFeatureObject("Open Containing Current",	lMenuAlternativeOpenContainingCurrent,	"", "", 9, "iconSpecialFolders")
InitQAPFeatureObject("Open Containing New",		lMenuAlternativeOpenContainingNew,		"", "", 10, "iconSpecialFolders")

;--------------------------------
; Build folders list for dropdown

g_strQAPFeaturesList := ""
for strQAPFeatureName, strThisQAPFeatureCode in g_objQAPFeaturesCodeByDefaultName
	if !(g_objQAPFeatures[strThisQAPFeatureCode].QAPFeatureAlternativeOrder) ; exclude Alternative menu features
		g_strQAPFeaturesList .= strQAPFeatureName . "|"

StringTrimRight, g_strQAPFeaturesList, g_strQAPFeaturesList, 1

strQAPFeatureName := ""
strThisQAPFeatureCode := ""
strQAPFeatureAlternativeOrder := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
InitQAPFeatureObject(strQAPFeatureCode, strThisLocalizedName, strQAPFeatureMenuName, strQAPFeatureCommand, intQAPFeatureAlternativeOrder, strThisDefaultIcon, strDefaultHotkey := "")

; QAP Feature Objects (g_objQAPFeatures) definition:
;		Key: strQAPFeatureInternalName
;		Value: objOneQAPFeature

; QAP Features Object (objOneQAPFeature) definition:
;		LocalizedName: QAP Feature localized label
;		QAPFeatureMenuName: menu to be added to the menu (excluding the starting ":"), empty if no submenu associated to this QAP feature
;		QAPFeatureCommand: command to be executed when this favorite is selected (excluding the ending ":")
;		QAPFeatureAlternativeOrder: order of feature in the Alternative Menu displayed before user choose the target favorite (0 if not Alternative menu feature)
;		DefaultIcon: default icon (in the "file,index" format)
;		DefaultHotkey: default feature hotkey (string like "+^s")

;------------------------------------------------------------
{
	global g_objQAPFeatures
	global g_objQAPFeaturesCodeByDefaultName
	global g_objQAPFeaturesDefaultNameByCode
	global g_objQAPFeaturesAlternativeCodeByOrder
	global g_objJLiconsByName
	
	objOneQAPFeature := Object()
	
	objOneQAPFeature.LocalizedName := strThisLocalizedName
	objOneQAPFeature.DefaultIcon := g_objJLiconsByName[strThisDefaultIcon]
	objOneQAPFeature.QAPFeatureMenuName := strQAPFeatureMenuName
	objOneQAPFeature.QAPFeatureCommand := strQAPFeatureCommand
	objOneQAPFeature.QAPFeatureAlternativeOrder := intQAPFeatureAlternativeOrder
	objOneQAPFeature.DefaultHotkey := strDefaultHotkey
	
	g_objQAPFeatures.Insert("{" . strQAPFeatureCode . "}", objOneQAPFeature)
	g_objQAPFeaturesCodeByDefaultName.Insert(strThisLocalizedName, "{" . strQAPFeatureCode . "}")
	g_objQAPFeaturesDefaultNameByCode.Insert("{" . strQAPFeatureCode . "}", strThisLocalizedName)
	if (intQAPFeatureAlternativeOrder)
		g_objQAPFeaturesAlternativeCodeByOrder.Insert(intQAPFeatureAlternativeOrder, "{" . strQAPFeatureCode . "}")
}
;------------------------------------------------------------


;------------------------------------------------------------
InitGuiControls:
;------------------------------------------------------------

; Order of controls important to avoid drawgins gliches when resizing

InsertGuiControlPos("f_lnkGuiDropHelpClicked",		 -88, -130)
InsertGuiControlPos("f_lnkGuiHotkeysHelpClicked",	  40, -130)

InsertGuiControlPos("f_picGuiOptions",				 -44,   10, true) ; true = center
InsertGuiControlPos("f_picGuiAddFavorite",			 -44,  120, true) ; 120
InsertGuiControlPos("f_picGuiEditFavorite",			 -44,  195, true) ; 190 + 5
InsertGuiControlPos("f_picGuiRemoveFavorite",		 -44,  270, true) ; 260 + 10
InsertGuiControlPos("f_picGuiCopyFavorite",			 -44,  345, true) ; 330 + 15
InsertGuiControlPos("f_picGuiHotkeysManage",		 -44, -148, true, true) ; -140 true = center, true = draw
InsertGuiControlPos("f_picGuiIconsManage",			 -44,  -78, true, true) ; -140 true = center, true = draw
InsertGuiControlPos("f_picGuiDonate",				-124,  -62, true, true)
InsertGuiControlPos("f_picGuiHelp",					  30,  -62, true, true)
InsertGuiControlPos("f_picGuiAbout",				  72,  -62, true, true)

InsertGuiControlPos("f_picAddColumnBreak",			  10,  255) ; +25 for Search box
InsertGuiControlPos("f_picAddSeparator",			  10,  225)
InsertGuiControlPos("f_picMoveFavoriteDown",		  10,  195)
InsertGuiControlPos("f_picMoveFavoriteUp",			  10,  165)
InsertGuiControlPos("f_picPreviousMenu",			  10,   84)
; InsertGuiControlPos("picSortFavorites",			  10, -165) ; REMOVED
InsertGuiControlPos("f_picUpMenu",					  25,   84)
InsertGuiControlPos("f_picGuiAlwaysOnTopOn",		  10,  -165)
InsertGuiControlPos("f_picGuiAlwaysOnTopOff",		  10,  -165)

InsertGuiControlPos("f_btnGuiSaveAndCloseFavorites",   0,  -80, , true)
InsertGuiControlPos("f_btnGuiSaveAndStayFavorites",    0,  -80, , true)
InsertGuiControlPos("f_btnGuiCancel",				   0,  -80, , true)

InsertGuiControlPos("f_drpMenusList",				  40,   84)

InsertGuiControlPos("f_lblGuiDonate",				-124,  -27, true)
InsertGuiControlPos("f_lblGuiAbout",				  70,  -27, true)
InsertGuiControlPos("f_lblGuiHelp",					  28,  -27, true)
InsertGuiControlPos("f_lblAppName",					  10,   10)
InsertGuiControlPos("f_lblAppTagLine",				  10,   42)
InsertGuiControlPos("f_lblGuiAddFavorite",			 -44,  168, true) ; 170 - 2
InsertGuiControlPos("f_lblGuiEditFavorite",			 -44,  243, true) ; 240 + 5 - 2
InsertGuiControlPos("f_lblGuiOptions",				 -44,   45, true)
InsertGuiControlPos("f_lblGuiRemoveFavorite",		 -44,  318, true)
InsertGuiControlPos("f_lblGuiCopyFavorite",			 -44,  393, true)
InsertGuiControlPos("f_lblSubmenuDropdownLabel",	  40,   66)
InsertGuiControlPos("f_lblGuiHotkeysManage",		 -44,  -97, true)
InsertGuiControlPos("f_lblGuiIconsManage",			 -44,  -27, true)

InsertGuiControlPos("f_strFavoritesListFilter",		  40,  115)
InsertGuiControlPos("f_btnFavoritesListNoFilter",	-110,  115)
InsertGuiControlPos("f_lvFavoritesList",			  40,  140)
InsertGuiControlPos("f_lvFavoritesListFiltered",	  40,  140)

return
;------------------------------------------------------------


;------------------------------------------------------------
InsertGuiControlPos(strControlName, intX, intY, blnCenter := false, blnDraw := false)
;------------------------------------------------------------
{
	global g_objGuiControls
	
	objGuiControl := Object()
	objGuiControl.Name := strControlName
	objGuiControl.X := intX
	objGuiControl.Y := intY
	objGuiControl.Center := blnCenter
	objGuiControl.Draw := blnDraw
	
	g_objGuiControls.Insert(objGuiControl)
	
	objGuiControl := ""
}
;------------------------------------------------------------


;-----------------------------------------------------------
LoadIniFile:
; load options, load/enable popup hotkeys, load (not enable) name|location hotkeys and populate g_objHotkeysByNameLocation, load favorites to menu object
;-----------------------------------------------------------

Gosub, BackupIniFile

; reinit after Settings save if already exist
g_objMenuInGui := Object() ; object of menu currently in Gui

IfNotExist, %g_strIniFile% ; if it exists, it was created by ImportFavoritesFP2QAP.ahk during install
{
	; if not in portable mode, create the startup shortcut at first execution of LoadIniFile (if ini file does not exist)
	if !(g_blnPortableMode)
		FileCreateShortcut, %A_ScriptFullPath%, %A_Startup%\%g_strAppNameFile%.lnk, %A_WorkingDir%

	g_blnExplorerContextMenus := (g_blnPortableMode ? 0 : 1) ; context menus enabled if installed with the setup program (not if portable)

	strNavigateOrLaunchHotkeyMouseDefault := g_arrPopupHotkeyDefaults1 ; "MButton"
	strNavigateOrLaunchHotkeyKeyboardDefault := g_arrPopupHotkeyDefaults2 ; "W"
	strAlternativeHotkeyMouseDefault := g_arrPopupHotkeyDefaults3 ; "+MButton"
	strAlternativeHotkeyKeyboardDefault := g_arrPopupHotkeyDefaults4 ; "+#W"
	
	g_intIconSize := 32

	FileAppend,
		(LTrim Join`r`n
			[Global]
			LanguageCode=%g_strLanguageCode%
			ExplorerContextMenus=%g_blnExplorerContextMenus%
			AvailableThemes=Windows|Grey|Light Blue|Light Green|Light Red|Yellow
			Theme=Windows
			HotkeysUpgradedToNameLocation=1
			[Gui-Grey]
			WindowColor=E0E0E0
			TextColor=000000
			ListviewBackground=FFFFFF
			ListviewText=000000
			MenuBackgroundColor=FFFFFF
			[Gui-Yellow]
			WindowColor=f9ffc6
			TextColor=000000
			ListviewBackground=fcffe0
			ListviewText=000000
			MenuBackgroundColor=fcffe0
			[Gui-Light Blue]
			WindowColor=e8e7fa
			TextColor=000000
			ListviewBackground=e7f0fa
			ListviewText=000000
			MenuBackgroundColor=e7f0fa
			[Gui-Light Red]
			WindowColor=fddcd7
			TextColor=000000
			ListviewBackground=fef1ef
			ListviewText=000000
			MenuBackgroundColor=fef1ef
			[Gui-Light Green]
			WindowColor=d6fbde
			TextColor=000000
			ListviewBackground=edfdf1
			ListviewText=000000
			MenuBackgroundColor=edfdf1
			[Favorites]
			Favorite1=Folder|C:\|C:\
			Favorite2=Folder|Windows|%A_WinDir%
			Favorite3=Folder|Program Files|%A_ProgramFiles%
			Favorite4=Folder|User Profile|`%USERPROFILE`%
			Favorite5=Application|Notepad|%A_WinDir%\system32\notepad.exe
			Favorite6=URL|%g_strAppNameText% web site|http://www.QuickAccessPopup.com
			Favorite7=Z
			[LocationHotkeys]
			Hotkey1=|{Settings}|+^S
			Hotkey2=|{Current Folders}|+^F
			Hotkey3=|{Recent Folders}|+^R
			Hotkey4=|{Clipboard}|+^C
			Hotkey5=|{Switch Folder or App}|+^W

)
		, %g_strIniFile%, % (A_IsUnicode ? "UTF-16" : "")
}
; change from v8.5.1 removed in v8.5.2 after issue reported when user has special characters in their paths
; else
; {
;	check if the ini file is Unicode
	; objIniFile := FileOpen(g_strIniFile, "r") ; open the file read-only
	; strFileEncoding := (InStr(objIniFile.Encoding, "UTF-") ? objIniFile.Encoding : "")
	; objIniFile.Close()
	; if !StrLen(strFileEncoding) ; this is an ANSI file
	; {
		; FileCopy, %g_strIniFile%, %g_strIniFile%-ANSI-BK, 1 ; the backup file should not exist but, in case, overwrite it
		; FileRead, strIniFileContent, %g_strIniFile% ; read the actual ANSI file
		; FileDelete, %g_strIniFile% ; delete the ini file
		; Sleep, 20 ; safety
		; FileAppend, %strIniFileContent%, %g_strIniFile%, UTF-16 ; rewrite the ini file in Unicode UTF-16 (little endian)
		; MsgBox, 0, % L(lOopsTitle, g_strAppNameText, g_strAppVersion), %lDialogIniConvertedToUnicode%
	; }
; }

Gosub, LoadIniPopupHotkeys ; load from ini file and enable popup hotkeys
Gosub, LoadIniLocationHotkeys ; load (but do not enable) name|location hotkeys from ini and populate g_objHotkeysByNameLocation

; ---------------------
; Load Options Tab 1 General

if !(g_blnPortableMode)
	IniRead, g_blnExplorerContextMenus, %g_strIniFile%, Global, ExplorerContextMenus, 1 ; enabled by default for setup install mode
else
	g_blnExplorerContextMenus := 0 ; always disabled in protable mode
IniRead, g_blnAddAutoAtTop, %g_strIniFile%, Global, AddAutoAtTop, 1
IniRead, g_blnDisplayTrayTip, %g_strIniFile%, Global, DisplayTrayTip, 1
IniRead, g_blnCheck4Update, %g_strIniFile%, Global, Check4Update, % (g_blnPortableMode ? 0 : 1) ; enable by default only in setup install mode
IniRead, g_blnRememberSettingsPosition, %g_strIniFile%, Global, RememberSettingsPosition, 1
IniRead, g_intRecentFoldersMax, %g_strIniFile%, Global, RecentFoldersMax, 10

IniRead, g_intPopupMenuPosition, %g_strIniFile%, Global, PopupMenuPosition, 1
IniRead, strPopupFixPosition, %g_strIniFile%, Global, PopupFixPosition, 20,20
StringSplit, g_arrPopupFixPosition, strPopupFixPosition, `,
IniRead, g_intHotkeyReminders, %g_strIniFile%, Global, HotkeyReminders, 3
IniRead, g_blnDisplayNumericShortcuts, %g_strIniFile%, Global, DisplayMenuShortcuts, 0
IniRead, g_blnOpenMenuOnTaskbar, %g_strIniFile%, Global, OpenMenuOnTaskbar, 1
IniRead, g_blnAddCloseToDynamicMenus, %g_strIniFile%, Global, AddCloseToDynamicMenus, 1
IniRead, g_blnDisplayIcons, %g_strIniFile%, Global, DisplayIcons, 1
IniRead, g_intIconSize, %g_strIniFile%, Global, IconSize, 32
IniRead, g_intIconsManageRowsSettings, %g_strIniFile%, Global, IconsManageRows, 0 ; 0 for maximum number of rows
IniRead, g_strExternalMenusCataloguePath, %g_strIniFile%, Global, ExternalMenusCataloguePath, %A_Space%

IniRead, g_blnSnippetDefaultProcessEOLTab, %g_strIniFile%, Global, SnippetDefaultProcessEOLTab, 1
IniRead, g_blnSnippetDefaultFixedFont, %g_strIniFile%, Global, SnippetDefaultFixedFont, 0
IniRead, g_intSnippetDefaultFontSize, %g_strIniFile%, Global, SnippetDefaultFontSize, 10
IniRead, g_blnSnippetDefaultMacro, %g_strIniFile%, Global, SnippetDefaultMacro, 0

IniRead, g_blnChangeFolderInDialog, %g_strIniFile%, Global, ChangeFolderInDialog, 0
if (g_blnChangeFolderInDialog)
	IniRead, g_blnChangeFolderInDialog, %g_strIniFile%, Global, UnderstandChangeFoldersInDialogRisk, 0

IniRead, g_strTheme, %g_strIniFile%, Global, Theme, Windows
IniRead, g_strAvailableThemes, %g_strIniFile%, Global, AvailableThemes
g_blnUseColors := (g_strTheme <> "Windows")
	
; ---------------------
; Load Options Tab 2 Menu Hotkeys

IniRead, g_blnLeftControlDoublePressed, %g_strIniFile%, Global, LeftControlDoublePressed, 0
IniRead, g_blnRightControlDoublePressed, %g_strIniFile%, Global, RightControlDoublePressed, 0

; ---------------------
; Load Options Tab 3 Alternative Menu

; ---------------------
; Options Tab 4 Exclusion List

IniRead, g_strExclusionMouseList, %g_strIniFile%, Global, ExclusionMouseList, %A_Space% ; empty string if not found
SplitExclusionList(g_strExclusionMouseList, g_strExclusionMouseListApp, g_strExclusionMouseListDialog)
; IniRead, g_strExclusionKeyboardList, %g_strIniFile%, Global, ExclusionKeyboardList, %A_Space% ; empty string if not found

; ---------------------
; Load Options Tab 5 File Managers

IniRead, g_intActiveFileManager, %g_strIniFile%, Global, ActiveFileManager ; if not exist returns "ERROR"

if (g_intActiveFileManager = "ERROR") ; no selection
	Gosub, CheckActiveFileManager

; Read values for all options: if user switch back to a previou option we can preset previous values
IniRead, g_strQAPconnectFileManager, %g_strIniFile%, Global, QAPconnectFileManager, %A_Space% ; empty string if not found
Gosub, LoadIniQAPconnectValues

IniRead, g_strDirectoryOpusPathBeforeEnvVars, %g_strIniFile%, Global, DirectoryOpusPath, %A_Space% ; empty string if not found
g_strDirectoryOpusPath := EnvVars(g_strDirectoryOpusPathBeforeEnvVars)
IniRead, g_blnDirectoryOpusUseTabs, %g_strIniFile%, Global, DirectoryOpusUseTabs, 1 ; use tabs by default
IniRead, g_strTotalCommanderPathBeforeEnvVars, %g_strIniFile%, Global, TotalCommanderPath, %A_Space% ; empty string if not found
g_strTotalCommanderPath := EnvVars(g_strTotalCommanderPathBeforeEnvVars)
IniRead, g_blnTotalCommanderUseTabs, %g_strIniFile%, Global, TotalCommanderUseTabs, 1 ; use tabs by default
IniRead, g_strWinCmdIniFile, %g_strIniFile%, Global, TotalCommanderWinCmd, %A_Space%

strActiveFileManagerSystemName := g_arrActiveFileManagerSystemNames%g_intActiveFileManager%
if (g_intActiveFileManager = 4) ; QAPconnect connected File Manager
{
	blnActiveFileManangerOK := StrLen(g_strQAPconnectAppPath)
	if (blnActiveFileManangerOK)
		blnActiveFileManangerOK := FileExistInPath(g_strQAPconnectAppPath)
}
else if (g_intActiveFileManager > 1) ; 2 DirectoryOpus or 3 TotalCommander
{
	blnActiveFileManangerOK := StrLen(g_str%strActiveFileManagerSystemName%Path)
	if (blnActiveFileManangerOK) 
		blnActiveFileManangerOK := FileExistInPath(g_str%strActiveFileManagerSystemName%Path)
}
if (g_intActiveFileManager > 1) ; 2 DirectoryOpus, 3 TotalCommander or 4 QAPconnect
	if (blnActiveFileManangerOK)
		
		Gosub, SetActiveFileManager
		
	else
	{
		if (g_intActiveFileManager = 4) ; QAPconnect
			Oops(lOopsWrongThirdPartyPathQAPconnect, g_strQAPconnectFileManager, g_strQAPconnectAppPath, "QAPconnect.ini", L(lMenuEditIniFile, "QAPconnect.ini"), lOptionsThirdParty)
		else ; 2 DirectoryOpus or 3 TotalCommander
			Oops(lOopsWrongThirdPartyPath, g_arrActiveFileManagerDisplayNames%g_intActiveFileManager%, g_str%strActiveFileManagerSystemName%Path, lOptionsThirdParty)
		g_intActiveFileManager := 1 ; must be after previous line
	}

; ---------------------
; Load internal flags and various values

IniRead, g_blnDiagMode, %g_strIniFile%, Global, DiagMode, 0
IniRead, g_blnDonor, %g_strIniFile%, Global, Donor, 0 ; Please, be fair. Don't cheat with this.
IniRead, g_strUserBanner, %g_strIniFile%, Global, UserBanner, %A_Space%
IniRead, blnDefaultMenuBuilt, %g_strIniFile%, Global, DefaultMenuBuilt, 0 ; default false
if !(blnDefaultMenuBuilt)
 	Gosub, AddToIniDefaultMenu ; modify the ini file Favorites section before reading it

IniRead, g_intDynamicMenusRefreshRate, %g_strIniFile%, Global, DynamicMenusRefreshRate, 10000 ; default 10000 ms
IniRead, g_intNbLiveFolderItemsMax, %g_strIniFile%, Global, NbLiveFolderItemsMax ; ERROR if not found
if (g_intNbLiveFolderItemsMax = "ERROR")
{
	g_intNbLiveFolderItemsMax := 500
	IniWrite, %g_intNbLiveFolderItemsMax%, %g_strIniFile%, Global, NbLiveFolderItemsMax
}
IniRead, g_intWaitDelayInDialogBox, %g_strIniFile%, Global, WaitDelayInDialogBox, 100 ; default 100 ms

; ---------------------
; Load favorites

Gosub, LoadMenuFromIni

arrMainMenu := ""
strNavigateOrLaunchHotkeyMouseDefault := ""
strNavigateOrLaunchHotkeyKeyboard := ""
strAlternativeHotkeyMouseDefault := ""
strAlternativeHotkeyKeyboardDefault := ""
strPopupFixPosition := ""
blnDefaultMenuBuilt := ""
blnMyQAPFeaturesBuilt := ""
strLoadIniLine := ""
arrThisFavorite := ""
objLoadIniFavorite := ""
arrSubMenu := ""
g_intIniLine := ""
blnActiveFileManangerOK := ""
strActiveFileManagerSystemName := ""
strFileList := ""
intNumberOfBackups := ""
objIniFile := ""
strFileEncoding := ""
strIniFileContent := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
LoadMenuFromIni:
;------------------------------------------------------------

IfNotExist, %g_strIniFile%
{
	Oops(lOopsWriteProtectedError, g_strAppNameText)
	ExitApp
}
else
{
	; reinit after Settings save if already exist
	g_objMainMenu := Object() ; object of menu structure entry point
	g_objMainMenu.MenuPath := lMainMenuName ; localized name of the main menu
	g_objMainMenu.MenuType := "Menu" ; main menu is not a group

	g_objMenusIndex := Object() ; index of menus path used in Gui menu dropdown list and to access the menu object for a given menu path
	g_objQAPfeaturesInMenus := Object() ; index of QAP features actualy present in menu
	
	g_intIniLine := 1
	
	if (RecursiveLoadMenuFromIni(g_objMainMenu) <> "EOM") ; build menu tree
		ExitApp
}

return
;------------------------------------------------------------


;------------------------------------------------------------
RecursiveLoadMenuFromIni(objCurrentMenu)
;------------------------------------------------------------
{
	global g_objMenusIndex
	global g_objQAPfeaturesInMenus
	global g_strIniFile
	global g_intIniLine
	global g_strMenuPathSeparator
	global g_strGroupIndicatorPrefix
	global g_strGroupIndicatorSuffix
	global g_strEscapePipe
	global g_objQAPFeaturesDefaultNameByCode
	global g_strAppNameText
	
	g_objMenusIndex.Insert(objCurrentMenu.MenuPath, objCurrentMenu) ; update the menu index
	; intMenuItemPos := 0
	
	; ###_V("RecursiveLoadMenuFromIni Begin", g_strIniFile, g_intIniLine)
	; ###_O("objCurrentMenu", objCurrentMenu)

	Loop
	{
		if (objCurrentMenu.MenuType = "External") and !FileExist(g_strIniFile)
		{
			objCurrentMenu.MenuLoaded := false
			Oops(lOopsErrorIniFileUnavailable . ":`n`n" . g_strIniFile . "`n`n" . L(lOopsErrorIniFileRetry, g_strAppNameText))
			return, "EOM" ; end of menu because of known error (external settings file unavailable) - error is noted in .MenuLoaded false - external menu will be empty
		}
			
		IniRead, strLoadIniLine, %g_strIniFile%, Favorites, Favorite%g_intIniLine%
		; ###_V("Loop Begin", g_strIniFile, g_intIniLine, strLoadIniLine)
		if (strLoadIniLine = "ERROR")
		{
			Oops(lOopsErrorReadingIniFile . "`n`n" . g_strIniFile . "`nFavorite" . g_intIniLine . "=")
			objCurrentMenu.MenuLoaded := false
			if (objCurrentMenu.MenuType = "External")
				return, "EOM" ; end of menu because of error inside settings file - error is noted in .MenuLoaded false - external menu will stop at the previous favorite
			else
				Return, "EOF" ; end of file - an unknown error occurred while reading the ini file - menu loading will be aborted
		}
		else
			objCurrentMenu.MenuLoaded := true
        g_intIniLine++
		
		strLoadIniLine := strLoadIniLine . "|||||||||||||" ; additional "|" to make sure we have all empty items
		; 1 FavoriteType, 2 FavoriteName, 3 FavoriteLocation, 4 FavoriteIconResource, 5 FavoriteArguments, 6 FavoriteAppWorkingDir,
		; 7 FavoriteWindowPosition, (X FavoriteHotkey), 8 FavoriteLaunchWith, 9 FavoriteLoginName, 10 FavoritePassword,
		; 11 FavoriteGroupSettings, 12 FavoriteFtpEncoding, 13 FavoriteElevate, 14 FavoriteDisabled,
		; 15 FavoriteFolderLiveLevels, 16 FavoriteFolderLiveDocuments, 17 FavoriteFolderLiveColumns, 18 FavoriteFolderLiveIncludeExclude, 19 FavoriteFolderLiveExtensions
		StringSplit, arrThisFavorite, strLoadIniLine, |

		if (arrThisFavorite1 = "Z")
			return, "EOM" ; end of menu
		; else
		;	###_V("Loop PAS Z", g_strIniFile, g_intIniLine, strLoadIniLine)
		
		objLoadIniFavorite := Object() ; new favorite item
		
		if InStr("Menu|Group|External", arrThisFavorite1, true) ; begin a submenu / case sensitive because type X is included in External ...
		{
			objNewMenu := Object() ; create the submenu object
			objNewMenu.MenuPath := objCurrentMenu.MenuPath . " " . g_strMenuPathSeparator . " " . arrThisFavorite2 . (arrThisFavorite1 = "Group" ? " " . g_strGroupIndicatorPrefix . g_strGroupIndicatorSuffix : "")
			objNewMenu.MenuType := arrThisFavorite1
			if (objNewMenu.MenuType = "External")
			{
				objNewMenu.MenuExternalPath := arrThisFavorite6 ; FavoriteAppWorkingDir
				; instead of FileGetTime, read last modified date from [Global] value updated only when content is changed
				; FileGetTime, strLastModified, % objNewMenu.MenuExternalPath, M ; modified date
				IniRead, strLastModified, % objNewMenu.MenuExternalPath, Global, LastModified, %A_Space%
				objNewMenu.MenuExternalLastModifiedWhenLoaded := strLastModified
				objNewMenu.MenuExternalLastModifiedNow := strLastModified
			}
			
			; create a navigation entry to navigate to the parent menu
			objNewMenuBack := Object()
			objNewMenuBack.FavoriteType := "B" ; for Back link to parent menu
			objNewMenuBack.FavoriteName := "(" . GetDeepestMenuPath(objCurrentMenu.MenuPath) . ")"
			objNewMenuBack.ParentMenu := objCurrentMenu ; this is the link to the parent menu
			objNewMenu.Insert(objNewMenuBack)
			
			if (arrThisFavorite1 = "External")
			{
				strPreviousIniFile := g_strIniFile
				intPreviousIniLine := g_intIniLine
				g_strIniFile := PathCombine(A_WorkingDir, EnvVars(arrThisFavorite6)) ; FavoriteAppWorkingDir, settings file path
				g_intIniLine := arrThisFavorite11 ; FavoriteGroupSettings, starting number - DEPRECATED since v8.1.9.1
				if !StrLen(g_intIniLine)
					g_intIniLine := 1 ; always 1 for menu added since v8.1.9.1
			}
			
			; build the submenu
			strResult := RecursiveLoadMenuFromIni(objNewMenu) ; RECURSIVE
			
			if (arrThisFavorite1 = "External")
			{
				g_strIniFile := strPreviousIniFile
				g_intIniLine := intPreviousIniLine
			}
			
			if (strResult = "EOF") ; end of file was encountered while building this submenu, exit recursive function
				Return, %strResult%
		}
		
		if (arrThisFavorite1 = "QAP")
		{
			; get QAP feature's name in current language (QAP features names are not saved to ini file)
			arrThisFavorite2 := g_objQAPFeaturesDefaultNameByCode[arrThisFavorite3]
			
			; to keep track of QAP features in menus to allow enable/disable menu items
			g_objQAPfeaturesInMenus.Insert(arrThisFavorite3, 1) ; boolean just to flag that we have this QAP feature in menus
			/*
			if g_objQAPfeaturesInMenus.HasKey(arrThisFavorite3) ; QAP feature already in object
				g_objQAPfeaturesInMenus[arrThisFavorite3] .= objCurrentMenu.MenuPath . g_strSeparatorQAPMenuPath . intMenuItemPos . "|"
			else
				g_objQAPfeaturesInMenus.Insert(arrThisFavorite3, objCurrentMenu.MenuPath . g_strSeparatorQAPMenuPath . intMenuItemPos . "|") ; add it with menu path
			*/
		}

		; this is a regular favorite, add it to the current menu
		objLoadIniFavorite.FavoriteType := arrThisFavorite1 ; see Favorite Types
		objLoadIniFavorite.FavoriteName := ReplaceAllInString(arrThisFavorite2, g_strEscapePipe, "|") ; display name of this menu item
		if InStr("Menu|Group|External", arrThisFavorite1, true)
		; recreate the menu path (without Main menu name), not relying on ini file content because this field could be empty for menu favorites in ini file saved with v7.4.0.2 to v7.4.2)
		{
			strMenuNoMain := objNewMenu.MenuPath
			StringReplace, strMenuNoMain, strMenuNoMain, % lMainMenuName . " " 
			objLoadIniFavorite.FavoriteLocation := strMenuNoMain
		}
		else
			objLoadIniFavorite.FavoriteLocation := ReplaceAllInString(arrThisFavorite3, g_strEscapePipe, "|") ; path, URL or menu path (without "Main") for this menu item
		objLoadIniFavorite.FavoriteIconResource := arrThisFavorite4 ; icon resource in format "iconfile,iconindex"
		objLoadIniFavorite.FavoriteArguments := ReplaceAllInString(arrThisFavorite5, g_strEscapePipe, "|") ; application arguments
		objLoadIniFavorite.FavoriteAppWorkingDir := arrThisFavorite6 ; application working directory
		objLoadIniFavorite.FavoriteWindowPosition := arrThisFavorite7 ; Boolean,Left,Top,Width,Height,Delay,RestoreSide (comma delimited)
		objLoadIniFavorite.FavoriteLaunchWith := arrThisFavorite8 ; launch favorite with this executable, or various options for type Application and Snippet
		objLoadIniFavorite.FavoriteLoginName := ReplaceAllInString(arrThisFavorite9, g_strEscapePipe, "|") ; login name for FTP favorite
		objLoadIniFavorite.FavoritePassword := ReplaceAllInString(arrThisFavorite10, g_strEscapePipe, "|") ; password for FTP favorite
		objLoadIniFavorite.FavoriteGroupSettings := arrThisFavorite11 ; coma separated values for group restore settings or external menu starting line
		objLoadIniFavorite.FavoriteFtpEncoding := arrThisFavorite12 ; encoding of FTP username and password, 0 do not encode, 1 encode
		objLoadIniFavorite.FavoriteElevate := arrThisFavorite13 ; elevate application, 0 do not elevate, 1 elevate
		objLoadIniFavorite.FavoriteDisabled := arrThisFavorite14 ; favorite disabled, not shown in menu, can be a submenu then all subitems are skipped
		objLoadIniFavorite.FavoriteFolderLiveLevels := arrThisFavorite15 ; number of subfolders to include in submenu(s), 0 if not a live folder
		objLoadIniFavorite.FavoriteFolderLiveDocuments := arrThisFavorite16 ; also include documents in live folder
		objLoadIniFavorite.FavoriteFolderLiveColumns := arrThisFavorite17 ; number of items per columns in live folder menus
		objLoadIniFavorite.FavoriteFolderLiveIncludeExclude := arrThisFavorite18 ; if true include extensions in FavoriteFolderLiveExtensions, if false exclude them
		objLoadIniFavorite.FavoriteFolderLiveExtensions := arrThisFavorite19 ; extensions of files to include or exclude in live folder
		
		; this is a submenu favorite, link to the submenu object
		if InStr("Menu|Group|External", arrThisFavorite1, true)
			objLoadIniFavorite.SubMenu := objNewMenu
		
		; update the current menu object
		objCurrentMenu.Insert(objLoadIniFavorite)
		
		; if !InStr("X|K", objLoadIniFavorite.FavoriteType) ; menu separators and column breaks do not use a item position numeric shortcut number
		;	intMenuItemPos++
		; ###_V("Loop Fin", g_strIniFile, g_intIniLine, strLoadIniLine)
	}
}
;-----------------------------------------------------------


;------------------------------------------------------------
AddToIniDefaultMenu:
;------------------------------------------------------------

strThisMenuName := lMenuMyQAPMenu
Gosub, AddToIniGetMenuName ; find next favorite number in ini file and check if strThisMenuName menu name exists
g_intNextFavoriteNumber -= 1 ; minus one to overwrite the existing end of main menu marker

AddToIniOneDefaultMenu("", "", "X")
AddToIniOneDefaultMenu(g_strMenuPathSeparator . " " . strDefaultMenu, strDefaultMenu, "Menu")
AddToIniOneDefaultMenu("{Switch Folder or App}", lMenuSwitchFolderOrApp . "...", "QAP")
AddToIniOneDefaultMenu("", "", "X")
AddToIniOneDefaultMenu("{ReopenCurrentFolder}", lMenuReopenCurrentFolder . "...", "QAP")
AddToIniOneDefaultMenu("{Current Folders}", lMenuCurrentFolders . "...", "QAP")
AddToIniOneDefaultMenu("", "", "X")
AddToIniOneDefaultMenu("{Recent Folders}", lMenuRecentFolders . "...", "QAP")
AddToIniOneDefaultMenu("{Clipboard}", lMenuClipboard . "...", "QAP")
AddToIniOneDefaultMenu("", "", "X")
AddToIniOneDefaultMenu("{Drives}", lMenuDrives . "...", "QAP")
AddToIniOneDefaultMenu("", "", "Z") ; close QAP menu

strThisMenuName := lMenuMySpecialMenu
Gosub, AddToIniGetMenuName ; find next favorite number in ini file and check if strThisMenuName menu name exists

AddToIniOneDefaultMenu(g_strMenuPathSeparator . " " . strDefaultMenu, strDefaultMenu, "Menu")
AddToIniOneDefaultMenu(A_Desktop, lMenuDesktop, "Special") ; Desktop
AddToIniOneDefaultMenu("{450D8FBA-AD25-11D0-98A8-0800361B1103}", "", "Special") ; Documents
AddToIniOneDefaultMenu(g_strMyPicturesPath, "", "Special") ; Pictures
AddToIniOneDefaultMenu(g_strDownloadPath, "", "Special") ; Downloads
AddToIniOneDefaultMenu("", "", "X")
AddToIniOneDefaultMenu("{20D04FE0-3AEA-1069-A2D8-08002B30309D}", "", "Special") ; Computer
AddToIniOneDefaultMenu("{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}", "", "Special") ; Network
AddToIniOneDefaultMenu("", "", "X")
AddToIniOneDefaultMenu("{21EC2020-3AEA-1069-A2DD-08002B30309D}", "", "Special") ; Control Panel
AddToIniOneDefaultMenu("{645FF040-5081-101B-9F08-00AA002F954E}", "", "Special") ; Recycle Bin
AddToIniOneDefaultMenu("", "", "Z") ; close special menu

strThisMenuName := lMenuSettings . "..."
Gosub, AddToIniGetMenuName ; find next favorite number in ini file and check if strThisMenuName menu name exists
if (strThisMenuName = lMenuSettings . "...") ; if equal, it means that this menu is not already there
; (we cannot have this menu twice with "+" because, as all QAP features, lMenuSettings always have the same menu name)
{
	AddToIniOneDefaultMenu("", "", "X")
	AddToIniOneDefaultMenu("{Settings}", lMenuSettings . "...", "QAP") ; back in main menu
}
if (g_intActiveFileManager = 3) ; TotalCommander
{
	strThisMenuName := lTCMenuName . "..."
	Gosub, AddToIniGetMenuName ; find next favorite number in ini file and check if strThisMenuName menu name exists
	if (strThisMenuName = lTCMenuName . "...") ; if equal, it means that this menu is not already there
	; (we cannot have this menu twice with "+" because, as all QAP features, lTCMenuName always have the same menu name)
	{
		AddToIniOneDefaultMenu("", "", "X")
		AddToIniOneDefaultMenu("{TC Directory hotlist}", lTCMenuName . "...", "QAP")
	}
}
AddToIniOneDefaultMenu("", "", "X")
AddToIniOneDefaultMenu("{Add This Folder}", lMenuAddThisFolder . "...", "QAP")

AddToIniOneDefaultMenu("", "", "Z") ; restore end of main menu marker

IniWrite, 1, %g_strIniFile%, Global, DefaultMenuBuilt

g_intNextFavoriteNumber := ""
strThisMenuName := ""
strDefaultMenu := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
AddToIniGetMenuName:
;------------------------------------------------------------

strInstance := ""

Loop
{
	IniRead, strIniLine, %g_strIniFile%, Favorites, Favorite%A_Index%
	if InStr(strIniLine, strThisMenuName . strInstance)
		strInstance .= "+"
	if (strIniLine = "ERROR")
	{
		g_intNextFavoriteNumber := A_Index
		Break
	}
}
strDefaultMenu := strThisMenuName . strInstance

strInstance := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
AddToIniOneDefaultMenu(strLocation, strName, strFavoriteType)
;------------------------------------------------------------
{
	global g_strIniFile
	global g_objSpecialFolders
	global g_objQAPFeatures
	global g_intNextFavoriteNumber
	global g_objJLiconsByName
	global lMenuMyQAPMenu

	; ###_V("AddToIniOneDefaultMenu", strLocation, strName, strFavoriteType)
	if (strFavoriteType = "Z")
		strNewIniLine := strFavoriteType
	else
	{
		if (strFavoriteType = "Menu")
			if (strName = lMenuMyQAPMenu)
				strIconResource := "iconApplication"
			else ; lMenuMySpecialMenu
				strIconResource := "iconSpecialFolders"
		else if (strFavoriteType = "Special")
			strIconResource := g_objSpecialFolders[strLocation].DefaultIcon
		else
			strIconResource := g_objQAPFeatures[strLocation].DefaultIcon

		if !StrLen(strName)
			if (strFavoriteType = "Special")
				strName := g_objSpecialFolders[strLocation].DefaultName
			else
				strName := g_objQAPFeatures[strLocation].DefaultName
		
		strNewIniLine := strFavoriteType . "|" . strName . "|" . strLocation . "|" . strIconResource . "||||||||"
	}
	
	IniWrite, %strNewIniLine%, %g_strIniFile%, Favorites, Favorite%g_intNextFavoriteNumber%
	g_intNextFavoriteNumber++
}
;------------------------------------------------------------


;-----------------------------------------------------------
LoadIniPopupHotkeys:
; load from ini file and enable popup hotkeys
;-----------------------------------------------------------

; Read the values and set hotkey shortcuts
loop, % g_arrPopupHotkeyNames0
; NavigateOrLaunchHotkeyMouse|NavigateOrLaunchHotkeyKeyboard|AlternativeHotkeyMouse|AlternativeHotkeyKeyboard
{
	; Prepare global arrays used by SplitHotkey function
	IniRead, g_arrPopupHotkeys%A_Index%, %g_strIniFile%, Global, % g_arrPopupHotkeyNames%A_Index%, % g_arrPopupHotkeyDefaults%A_Index%
	SplitHotkey(g_arrPopupHotkeys%A_Index%, strModifiers%A_Index%, strOptionsKey%A_Index%, strMouseButton%A_Index%, strMouseButtonsWithDefault%A_Index%)
}

; First, if we can, navigate with QAP hotkeys (1 NavigateOrLaunchHotkeyMouse and 2 NavigateOrLaunchHotkeyKeyboard) 
Hotkey, If, CanNavigate(A_ThisHotkey)
	if HasHotkey(g_arrPopupHotkeysPrevious1)
		Hotkey, % g_arrPopupHotkeysPrevious1, , Off
	if HasHotkey(g_arrPopupHotkeys1)
		Hotkey, % g_arrPopupHotkeys1, NavigateHotkeyMouse, On UseErrorLevel
	if (ErrorLevel)
		Oops(lDialogInvalidHotkey, g_arrPopupHotkeys1, g_arrOptionsTitles1)
	if HasHotkey(g_arrPopupHotkeysPrevious2)
		Hotkey, % g_arrPopupHotkeysPrevious2, , Off
	if HasHotkey(g_arrPopupHotkeys2)
		Hotkey, % g_arrPopupHotkeys2, NavigateHotkeyKeyboard, On UseErrorLevel
	if (ErrorLevel)
		Oops(lDialogInvalidHotkey, g_arrPopupHotkeys2, g_arrOptionsTitles2)
Hotkey, If

; Second, if we can't navigate but can launch, launch with QAP hotkeys (1 NavigateOrLaunchHotkeyMouse and 2 NavigateOrLaunchHotkeyKeyboard) 
Hotkey, If, CanLaunch(A_ThisHotkey)
	if HasHotkey(g_arrPopupHotkeysPrevious1)
		Hotkey, % g_arrPopupHotkeysPrevious1, , Off
	if HasHotkey(g_arrPopupHotkeys1)
		Hotkey, % g_arrPopupHotkeys1, LaunchHotkeyMouse, On UseErrorLevel
	if (ErrorLevel)
		Oops(lDialogInvalidHotkey, g_arrPopupHotkeys1, g_arrOptionsTitles1)
	if HasHotkey(g_arrPopupHotkeysPrevious2)
		Hotkey, % g_arrPopupHotkeysPrevious2, , Off
	if HasHotkey(g_arrPopupHotkeys2)
		Hotkey, % g_arrPopupHotkeys2, LaunchHotkeyKeyboard, On UseErrorLevel
	if (ErrorLevel)
		Oops(lDialogInvalidHotkey, g_arrPopupHotkeys2, g_arrOptionsTitles2)
Hotkey, If

; Then, if QAP hotkey cannot be activated, open the Alternative menu with the Alternative hotkeys (3 AlternativeHotkeyMouse and 4 AlternativeHotkeyKeyboard)
if HasHotkey(g_arrPopupHotkeysPrevious3)
	Hotkey, % g_arrPopupHotkeysPrevious3, , Off
if HasHotkey(g_arrPopupHotkeys3)
	Hotkey, % g_arrPopupHotkeys3, AlternativeHotkeyMouse, On UseErrorLevel
if (ErrorLevel)
	Oops(lDialogInvalidHotkey, g_arrPopupHotkeys3, g_arrOptionsTitles3)
if HasHotkey(g_arrPopupHotkeysPrevious4)
	Hotkey, % g_arrPopupHotkeysPrevious4, , Off
if HasHotkey(g_arrPopupHotkeys4)
	Hotkey, % g_arrPopupHotkeys4, AlternativeHotkeyKeyboard, On UseErrorLevel
if (ErrorLevel)
	Oops(lDialogInvalidHotkey, g_arrPopupHotkeys4, g_arrOptionsTitles4)

; Turn off previous QAP Alternative Menu features hotkeys
for strCode, objThisQAPFeature in g_objQAPFeatures
	if HasHotkey(objThisQAPFeature.CurrentHotkey)
		; use error level in case the hotkey does not exist yet when adding a new alternative hotkey
		Hotkey, % objThisQAPFeature.CurrentHotkey, , Off UseErrorLevel
	
; Load QAP Alternative Menu hotkeys
for intOrder, strCode in g_objQAPFeaturesAlternativeCodeByOrder
{
	IniRead, strHotkey,  %g_strIniFile%, AlternativeMenuHotkeys, %strCode%
	if (strHotkey <> "ERROR")
	{
		Hotkey, %strHotkey%, OpenAlternativeMenuHotkey, On UseErrorLevel
		g_objQAPFeatures[strCode].CurrentHotkey := strHotkey
	}
	if (ErrorLevel)
		Oops(lDialogInvalidHotkey, strHotkey, g_objQAPFeatures[strCode].LocalizedName)
}

strCode := ""
objThisQAPFeature := ""
strHotkey := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
LoadIniLocationHotkeys:
; load (but do not enable) name|location hotkeys from ini and populate g_objHotkeysByNameLocation
;------------------------------------------------------------

; check if location hotkeys need to be converted to v8.1 "name|location|hotkey" format
IniRead, blnHotkeysUpgradedToNameLocation, %g_strIniFile%, Global, HotkeysUpgradedToNameLocation, 0 ; default false

Loop
{
	IniRead, strLocationHotkey, %g_strIniFile%, LocationHotkeys, Hotkey%A_Index%
	if (strLocationHotkey = "ERROR")
		break
	StringSplit, arrLocationHotkey, strLocationHotkey, | ; name|location|hotkey (v8.1+ format)
	if !(blnHotkeysUpgradedToNameLocation)
	; convert format from pre-v8.1 "location|hotkey" to "name|location|hotkey", using the name of the first favorite found for location
	; (if other favorites have the same location, their hotkey is lost and will have to be recreated by user)
	{
		arrLocationHotkey3 := arrLocationHotkey2 ; in this order, move hotkey to 3rd position
		arrLocationHotkey2 := arrLocationHotkey1 ; in this order, move location to 2nd position
		arrLocationHotkey1 := GetFirstName4Location(arrLocationHotkey2) ; get name of first favorite for this location (searching in order of favorites in ini file)
		IniWrite, %arrLocationHotkey1%|%arrLocationHotkey2%|%arrLocationHotkey3%, %g_strIniFile%, LocationHotkeys, Hotkey%A_Index% ; update ini file value
	}
	g_objHotkeysByNameLocation.Insert(arrLocationHotkey1 . "|" . arrLocationHotkey2, arrLocationHotkey3)
}

if !(blnHotkeysUpgradedToNameLocation) ; flag that the convertion to v8.1 has been made
	IniWrite, 1, %g_strIniFile%, Global, HotkeysUpgradedToNameLocation

strLocationHotkey := ""
arrLocationHotkey := ""
blnHotkeysUpgradedToNameLocation := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
InitDiagMode:
;------------------------------------------------------------

MsgBox, 52, %g_strAppNameText%, % L(lDiagModeCaution, g_strAppNameText, g_strDiagFile)
IfMsgBox, No
{
	g_blnDiagMode := False
	IniWrite, 0, %g_strIniFile%, Global, DiagMode
	return
}

if !FileExist(g_strDiagFile)
{
	FileAppend, DateTime`tType`tData`n, %g_strDiagFile%
	Diag("DIAGNOSTIC FILE", lDiagModeIntro)
	Diag("AppNameFile", g_strAppNameFile)
	Diag("AppNameText", g_strAppNameText)
	Diag("AppVersion", g_strAppVersion)
	Diag("A_ScriptFullPath", A_ScriptFullPath)
	Diag("A_WorkingDir", A_WorkingDir)
	Diag("A_AhkVersion", A_AhkVersion)
	Diag("A_OSVersion", A_OSVersion)
	Diag("A_Is64bitOS", A_Is64bitOS)
	Diag("A_IsUnicode", A_IsUnicode)
	Diag("A_Language", A_Language)
	Diag("A_IsAdmin", A_IsAdmin)
}

FileRead, strIniFileContent, %g_strIniFile%
StringReplace, strIniFileContent, strIniFileContent, `", `"`"
Diag("IniFile", """" . strIniFileContent . """")
FileAppend, `n, %g_strDiagFile% ; required when the last line of the existing file ends with "

strIniFileContent := ""

g_intClipboardMenuTickCount := 0
g_intDrivesMenuTickCount := 0
g_intRecentFoldersMenuTickCount := 0
g_intSwitchReopenMenuTickCount := 0

return
;------------------------------------------------------------


;------------------------------------------------------------
LoadThemeGlobal:
;------------------------------------------------------------

IniRead, g_strGuiWindowColor, %g_strIniFile%, Gui-%g_strTheme%, WindowColor, E0E0E0
IniRead, g_strMenuBackgroundColor, %g_strIniFile%, Gui-%g_strTheme%, MenuBackgroundColor, FFFFFF

return
;------------------------------------------------------------



;========================================================================================================================
; END OF INITIALIZATION
;========================================================================================================================


;========================================================================================================================
!_017_EXIT:
;========================================================================================================================

;-----------------------------------------------------------
ExitApp: ; should not be called
TrayMenuExitApp:
;-----------------------------------------------------------

ExitApp
;-----------------------------------------------------------


;-----------------------------------------------------------
CleanUpBeforeExit:
;-----------------------------------------------------------

if (g_blnDiagMode)
	Diag("ListLines", ScriptInfo("ListLines"))

strSettingsPosition := "-1" ; center at minimal size
if (g_blnRememberSettingsPosition)
{
	WinGet, intMinMax, MinMax, ahk_id %g_strAppHwnd%
	if (intMinMax <> 1) ; if window is maximized, we keep the default positionand size (center at minimal size)
	{
		WinGetPos, intX, intY, intW, intH, ahk_id %g_strAppHwnd%
		strSettingsPosition := intX . "|" . intY . "|" . intW . "|" . intH
	}
}
IniWrite, %strSettingsPosition%, %g_strIniFile%, Global, SettingsPosition

FileRemoveDir, %g_strTempDir%, 1 ; Remove all files and subdirectories

Gosub, ExternalMenusRelease ; release reserved external menus

if (g_blnDiagMode)
{
	MsgBox, 52, %g_strAppNameText%, % L(lDiagModeExit, g_strAppNameText, g_strDiagFile) . "`n`n" . lDiagModeIntro . "`n`n" . lDiagModeSee
	IfMsgBox, Yes
		Run, %g_strDiagFile%
}

strSettingsPosition := ""
intMinMax := ""
intX := ""
intY := ""
intW := ""
intH := ""

ExitApp
;-----------------------------------------------------------


;========================================================================================================================
; END OF EXIT
;========================================================================================================================



;========================================================================================================================
!_020_BUILD:
;========================================================================================================================

;------------------------------------------------------------
BuildTrayMenu:
;------------------------------------------------------------

Menu, Tray, Icon, , , 1 ; last 1 to freeze icon during pause or suspend
Menu, Tray, NoStandard
;@Ahk2Exe-IgnoreBegin
; Start of code for developement phase only - won't be compiled
Menu, Tray, Icon, %A_ScriptDir%\QuickAccessPopup-DEV-red-512.ico, 1, 1 ; last 1 to freeze icon during pause or suspend
Menu, Tray, Standard
Menu, Tray, Add
; / End of code for developement phase only - won't be compiled
;@Ahk2Exe-IgnoreEnd
IniRead, strAlternativeTrayIcon, %g_strIniFile%, Global, AlternativeTrayIcon ; returns ERROR if not found
if (strAlternativeTrayIcon <> "ERROR")
	if FileExist(strAlternativeTrayIcon)
		Menu, Tray, Icon, %strAlternativeTrayIcon%, 1, 1 ; last 1 to freeze icon during pause or suspend
	
Menu, Tray, Add, %lMenuSettings%..., GuiShowFromTray
Menu, Tray, Add
Menu, Tray, Add, %lMenuSwitchSettings%..., SwitchSettings
SplitPath, g_strIniFile, strIniFileNameExtOnly
Menu, Tray, Add, % L(lMenuEditIniFile, strIniFileNameExtOnly), ShowSettingsIniFile
Menu, Tray, Add, %lImpExpMenu%..., ImportExport
Menu, Tray, Add
Menu, Tray, Add, % L(lMenuReload, g_strAppNameText), ReloadQAP
Menu, Tray, Add
Menu, Tray, Add, %lMenuRunAtStartupAmpersand%, RunAtStartup
Menu, Tray, Add, %lMenuSuspendHotkeys%, SuspendHotkeys
Menu, Tray, Add
Menu, Tray, Add, %lMenuUpdateAmpersand%, Check4Update
Menu, Tray, Add, %lMenuHelp%, GuiHelp
Menu, Tray, Add, %lMenuAboutAmpersand%, GuiAbout
Menu, Tray, Add, %lDonateMenu%, GuiDonate
Menu, Tray, Add
Menu, Tray, Add, % L(lMenuExitApp, g_strAppNameText), TrayMenuExitApp
Menu, Tray, Default, %lMenuSettings%...
if (g_blnUseColors)
	Menu, Tray, Color, %g_strMenuBackgroundColor%
Menu, Tray, Tip, % g_strAppNameText . " " . g_strAppVersion . " (" . (A_PtrSize * 8) . "-bit)`n" . (g_blnDonor ? lDonateThankyou : lDonateButtonAmpersand) ; A_PtrSize * 8 = 32 or 64

strIniFileNameExtOnly := ""
strAlternativeTrayIcon := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
SetTimerRefreshDynamicMenus:
;------------------------------------------------------------
; ####

; Do nothing until background tasks is fixed...
/*
if g_objQAPfeaturesInMenus.HasKey("{Recent Folders}") or g_objQAPfeaturesInMenus.HasKey("{Drives}") ; we have one of these QAP features in at least one menu
{
	Gosub, RefreshRecentFoldersMenu ; refresh now and in g_intDynamicMenusRefreshRate ms
	Gosub, RefreshDrivesMenu ; refresh now and in g_intDynamicMenusRefreshRate ms
	SetTimer, RefreshBackgroundDynamicMenus, %g_intDynamicMenusRefreshRate% ; 
}
*/

return
;------------------------------------------------------------


;------------------------------------------------------------
RefreshBackgroundDynamicMenus:
; background job started by SetTimer
;------------------------------------------------------------

Gosub, RefreshRecentFoldersMenu
Gosub, RefreshDrivesMenu

/*
if (g_blnDiagMode)
{
	Diag("Background: Recent/Drives", g_intRecentFoldersMenuTickCount . "`t" . g_intDrivesMenuTickCount)
	; ToolTip,  % "QAP background refresh: " . g_intRecentFoldersMenuTickCount . " (Recent) + " . g_intDrivesMenuTickCount . " (Drives) = " . g_intRecentFoldersMenuTickCount + g_intDrivesMenuTickCount . " ms", 10, 10
	; sleep, 5000
	; ToolTip
}
*/

return
;------------------------------------------------------------


;------------------------------------------------------------
BuildClipboardMenuInit:
;------------------------------------------------------------

Menu, g_menuClipboard, Add 
Menu, g_menuClipboard, DeleteAll
if (g_blnUseColors)
    Menu, g_menuClipboard, Color, %g_strMenuBackgroundColor%
AddMenuIcon("g_menuClipboard", lMenuNoClipboard, "GuiShowNeverCalled", "iconNoContent", false) ; will never be called because disabled
AddCloseMenu("g_menuClipboard")

return
;------------------------------------------------------------


;------------------------------------------------------------
ClipboardMenuShortcut:
;------------------------------------------------------------

Gosub, RefreshClipboardMenu

Gosub, SetMenuPosition
CoordMode, Menu, % (g_intPopupMenuPosition = 2 ? "Window" : "Screen")
Menu, g_menuClipboard, Show, %g_intMenuPosX%, %g_intMenuPosY%

return
;------------------------------------------------------------


;------------------------------------------------------------
RefreshClipboardMenu:
;------------------------------------------------------------
intClipboardMenuStartTickCount := A_TickCount

if !g_objQAPfeaturesInMenus.HasKey("{Clipboard}") ; we don't have this QAP feature in at least one menu
	or !StrLen(Clipboard) ; clipboard is empty (or contains only binary data)
	or (StrLen(Clipboard) > 50000) ; Clipboard is too large - 50K of text with 600 file paths takes 0,3 sec to process on my dev machine
	return

intShortcutClipboardMenu := 0
strContentsInClipboard := ""

; gather info for menu (can be long if large Clipboard) before refreshing the menu with Critical On
; parse Clipboard for folder, document or application filenames (filenames alone on one line)
Loop, parse, Clipboard, `n, `r%A_Space%%A_Tab%/?:*`"><|
{
	strClipboardLineExpanded := A_LoopField ; only for FileExistInPath - will not be displayed in menu

	if FileExistInPath(strClipboardLineExpanded) ; rerturn strClipboardLineExpanded with expanded relative path and envvars, and search in PATH
	{
		strContentsInClipboard .= "`n" . A_LoopField
		
		if (g_blnDisplayIcons)
			if LocationIsDocument(strClipboardLineExpanded)
				strContentsInClipboard .= "`t" . GetIcon4Location(strClipboardLineExpanded)
			else
				strContentsInClipboard .= "`t" . "iconFolder"
	}

	; Parse Clipboard line for URLs (anywhere on the line)
	strURLSearchString := A_LoopField
	Gosub, GetURLsInClipboardLine
}

if StrLen(strContentsInClipboard)
{
	Sort, strContentsInClipboard

	; Critical, On
	Menu, g_menuClipboard, Add
	Menu, g_menuClipboard, DeleteAll

	Loop, parse, strContentsInClipboard, `n
	{
		if !StrLen(A_LoopField)
			continue
		
		; arrContentsInClipboard1 = path or URL, arrContentsInClipboard2 = icon (file,index or icon code)
		StringSplit, arrContentsInClipboard, A_LoopField, `t
		
		strMenuName := (g_blnDisplayNumericShortcuts and (intShortcutClipboardMenu <= 35) ? "&" . NextMenuShortcut(intShortcutClipboardMenu) . " " : "") . arrContentsInClipboard1
		if StrLen(strMenuName) < 260 ; skip too long URLs
			AddMenuIcon("g_menuClipboard", strMenuName, "OpenClipboard", arrContentsInClipboard2)
	}
	AddCloseMenu("g_menuClipboard")
	; Critical, Off
}

intShortcutClipboardMenu := ""
strContentsInClipboard := ""
strClipboardLineExpanded := ""
strURLSearchString := ""

g_intClipboardMenuTickCount := A_TickCount - intClipboardMenuStartTickCount
; TrayTip, Clipboard menu refresh, % g_intClipboardMenuTickCount . " ms"
return
;------------------------------------------------------------


;------------------------------------------------------------
GetURLsInClipboardLine:
;------------------------------------------------------------
; Adapted from AHK help file: http://ahkscript.org/docs/commands/LoopReadFile.htm
; It's done this particular way because some URLs have other URLs embedded inside them:
StringGetPos, intURLStart1, strURLSearchString, http://
StringGetPos, intURLStart2, strURLSearchString, https://
StringGetPos, intURLStart3, strURLSearchString, www.

; Find the left-most starting position:
intURLStart := intURLStart1 ; Set starting default.
Loop
{
	; It helps performance (at least in a script with many variables) to resolve
	; "intURLStart%A_Index%" only once:
	intArrayElement := intURLStart%A_Index%
	if (intArrayElement = "") ; End of the array has been reached.
		break
	if (intArrayElement = -1) ; This element is disqualified.
		continue
	if (intURLStart = -1)
		intURLStart := intArrayElement
	else ; intURLStart has a valid position in it, so compare it with intArrayElement.
	{
		if (intArrayElement <> -1)
			if (intArrayElement < intURLStart)
				intURLStart := intArrayElement
	}
}

if (intURLStart = -1) ; No URLs exist in strURLSearchString.
	return ; (exit loop without cleaning local variables that could be re-used)

; Otherwise, extract this strURL:
StringTrimLeft, strURL, strURLSearchString, %intURLStart% ; Omit the beginning/irrelevant part.
Loop, parse, strURL, %A_Tab%%A_Space%<> ; Find the first space, tab, or angle (if any).
{
	strURL := A_LoopField
	break ; i.e. perform only one loop iteration to fetch the first "field".
}
; If the above loop had zero iterations because there were no ending characters found,
; leave the contents of the strURL var untouched.

; If the strURL ends in a double quote, remove it.  For now, StringReplace is used, but
; note that it seems that double quotes can legitimately exist inside URLs, so this
; might damage them:
StringReplace, strURLCleansed, strURL, ",, All

; See if there are any other URLs in this line:
StringLen, intCharactersToOmit, strURL
intCharactersToOmit += intURLStart
StringTrimLeft, strURLSearchString, strURLSearchString, %intCharactersToOmit%

Gosub, GetURLsInClipboardLine ; Recursive call to self (end of loop)

strContentsInClipboard .= "`n" . strURLCleansed . "`t" . g_strURLIconFileIndex

return
;------------------------------------------------------------


;------------------------------------------------------------
BuildDrivesMenuInit:
;------------------------------------------------------------

Menu, g_menuDrives, Add 
Menu, g_menuDrives, DeleteAll
if (g_blnUseColors)
    Menu, g_menuDrives, Color, %g_strMenuBackgroundColor%
AddMenuIcon("g_menuDrives", lDialogNone, "GuiShowNeverCalled", "iconNoContent", false) ; will never be called because disabled
AddCloseMenu("g_menuDrives")

return
;------------------------------------------------------------


;------------------------------------------------------------
DrivesMenuShortcut:
;------------------------------------------------------------

; When background tasks will be OK...
/*
Gosub, RefreshDrivesMenu ; refreshed by SetTimer but also just before when called by the shortcut

Gosub, SetMenuPosition
CoordMode, Menu, % (g_intPopupMenuPosition = 2 ? "Window" : "Screen")
Menu, g_menuDrives, Show, %g_intMenuPosX%, %g_intMenuPosY%
*/

; Until background tasks is back...
Gosub, SetMenuPosition

Gosub, RefreshDrivesMenu

CoordMode, Menu, % (g_intPopupMenuPosition = 2 ? "Window" : "Screen")
Menu, g_menuDrives, Show, %g_intMenuPosX%, %g_intMenuPosY%

return
;------------------------------------------------------------


;------------------------------------------------------------
RefreshDrivesMenu:
;------------------------------------------------------------

if !(g_objQAPfeaturesInMenus.HasKey("{Drives}")) ; we don't have this QAP features in at least one menu
	return

intDrivesMenuStartTickCount := A_TickCount

intShortcutDrivesMenu := 0
strMenuItemsList := "" ; menu name|menu item name|label|icon

SetWaitCursor(true)

DriveGet, strDrivesList, List

; gather info for menu (can be long for CD/DVD drives) before refreshing the menu with Critical On
Loop, parse, strDrivesList
{
	strPath := A_LoopField . ":"
	DriveGet, intCapacity, Capacity, %strPath%
	DriveSpaceFree, intFreeSpace,  %strPath%
	DriveGet, strLabel, Label, %strPath%
	DriveGet, strType, Type, %strPath% ; Unknown, Removable, Fixed, Network, CDROM, RAMDisk
	
	strMenuItemName := strPath . " " . strLabel
	if StrLen(intFreeSpace) and StrLen(intCapacity)
		strMenuItemName .= " " . L(lMenuDrivesSpace, intFreeSpace // 1024, intCapacity // 1024)
	strMenuItemName := (g_blnDisplayNumericShortcuts and (intShortcutDrivesMenu <= 35) ? "&" . NextMenuShortcut(intShortcutDrivesMenu) . " " : "") . strMenuItemName
	if InStr("Fixed|Unknown", strType)
		strIcon := "iconDrives"
	else
		strIcon := "icon" . strType
	strMenuItemsList .= "g_menuDrives|" . strMenuItemName . "|OpenDrives|" . strIcon . "`n"
}

; Until background tasks is back...
; Critical, On
Menu, g_menuDrives, Add
Menu, g_menuDrives, DeleteAll
Loop, Parse, strMenuItemsList, `n
	if StrLen(A_LoopField)
	{
		StringSplit, arrMenuItemsList, A_LoopField, |
		AddMenuIcon(arrMenuItemsList1, arrMenuItemsList2, arrMenuItemsList3, arrMenuItemsList4)
	}
AddCloseMenu("g_menuDrives")
; Until background tasks is back...
; Critical, Off

SetWaitCursor(false)

intShortcutDrivesMenu := ""
strMenuItemsList := ""
strDrivesList := ""
strPath := ""
intCapacity := ""
intFreeSpace := ""
strLabel := ""
strType := ""
strMenuItemName := ""
strIcon := ""
arrMenuItemsList := ""

g_intDrivesMenuTickCount := A_TickCount - intDrivesMenuStartTickCount
; TrayTip, Drives menu refresh, % g_intDrivesMenuTickCount . " ms"
return
;------------------------------------------------------------


;------------------------------------------------------------
BuildRecentFoldersMenuInit:
;------------------------------------------------------------

Menu, g_menuRecentFolders, Add 
Menu, g_menuRecentFolders, DeleteAll
if (g_blnUseColors)
    Menu, g_menuRecentFolders, Color, %g_strMenuBackgroundColor%
AddMenuIcon("g_menuRecentFolders", lDialogNone, "GuiShowNeverCalled", "iconNoContent", false) ; will never be called because disabled
AddCloseMenu("g_menuRecentFolders")

return
;------------------------------------------------------------


;------------------------------------------------------------
RecentFoldersMenuShortcut:
;------------------------------------------------------------

; When background tasks will be OK...
/*
Gosub, RefreshRecentFoldersMenu ; refreshed by SetTimer but also just before when called by the shortcut

Gosub, SetMenuPosition
CoordMode, Menu, % (g_intPopupMenuPosition = 2 ? "Window" : "Screen")
Menu, g_menuRecentFolders, Show, %g_intMenuPosX%, %g_intMenuPosY%
*/

; Until background tasks is back...
Gosub, SetMenuPosition

Gosub, RefreshRecentFoldersMenu

CoordMode, Menu, % (g_intPopupMenuPosition = 2 ? "Window" : "Screen")
Menu, g_menuRecentFolders, Show, %g_intMenuPosX%, %g_intMenuPosY%

return
;------------------------------------------------------------


;------------------------------------------------------------
RefreshRecentFoldersMenu:
;------------------------------------------------------------

if !(g_objQAPfeaturesInMenus.HasKey("{Recent Folders}")) ; we don't have this QAP features in at least one menu
	return

intRecentFoldersMenuStartTickCount := A_TickCount

g_objRecentFolders := Object()

g_intRecentFoldersIndex := 0 ; used in PopupMenu... to check if we disable the menu when empty
strMenuItemsList := "" ; menu name|menu item name|label|icon

SetWaitCursor(true)

RegRead, strRecentsFolder, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders, Recent

/*
; Alternative to collect recent files *** NOT WORKING with XP and SLOWER because all shortcuts are resolved before getting the list
; See: post from Skan http://ahkscript.org/boards/viewtopic.php?f=5&t=4477#p25261
; Implement for Win7+ if FileGetShortcut still produce Windows errors when external drive is not available (despite DllCall in initialization)

strWinPathRecent := RegExReplace(SubStr(strRecentsFolder, 3) . "\", "\\", "\\")
strDirList := ""
for ObjItem in ComObjGet("winmgmts:")
	.ExecQuery("Select * from Win32_ShortcutFile where path = '" . strWinPathRecent . "'")
	strDirList .= ObjItem.LastModified . A_Tab . ObjItem.Extension . A_Tab . ObjItem.Target . "`n"
*/

; gather info for menu (can be long if many recent items) before refreshing the menu with Critical On

Loop, %strRecentsFolder%\*.* ; tried to limit to number of recent but they are not sorted chronologically
	strDirList .= A_LoopFileTimeModified . "`t" . A_LoopFileFullPath . "`n"
Sort, strDirList, R

intShortcut := 0

Loop, parse, strDirList, `n
{
	if !StrLen(A_LoopField) ; last line is empty
		continue

	arrShortcutFullPath := StrSplit(A_LoopField, A_Tab)
	strShortcutFullPath := arrShortcutFullPath[2]
	
	FileGetShortcut, %strShortcutFullPath%, strTargetPath
	
	if (errorlevel) ; hidden or system files (like desktop.ini) returns an error
		continue
	if !FileExist(strTargetPath) ; if folder/document was deleted or on a removable drive
		continue
	if LocationIsDocument(strTargetPath) ; not a folder
		continue

	g_intRecentFoldersIndex++
	g_objRecentFolders.Insert(g_intRecentFoldersIndex, strTargetPath)
	
	strMenuName := (g_blnDisplayNumericShortcuts and (intShortcut <= 35) ? "&" . NextMenuShortcut(intShortcut) . " " : "") . strTargetPath
	strMenuItemsList .= "g_menuRecentFolders|" . strMenuName . "|OpenRecentFolder|iconFolder`n"

	if (g_intRecentFoldersIndex >= g_intRecentFoldersMax)
		break
}

; Until background tasks is back...
; Critical, On
Menu, g_menuRecentFolders, Add
Menu, g_menuRecentFolders, DeleteAll
Loop, Parse, strMenuItemsList, `n
	if StrLen(A_LoopField)
	{
		StringSplit, arrMenuItemsList, A_LoopField, |
		AddMenuIcon(arrMenuItemsList1, arrMenuItemsList2, arrMenuItemsList3, arrMenuItemsList4)
	}
AddCloseMenu("g_menuRecentFolders")
; Until background tasks is back...
; Critical, Off

SetWaitCursor(false)

strRecentsFolder := ""
strDirList := ""
intShortcut := ""
arrShortcutFullPath := ""
strShortcutFullPath := ""
strTargetPath := ""
strMenuName := ""

g_intRecentFoldersMenuTickCount := A_TickCount - intRecentFoldersMenuStartTickCount
; TrayTip, RecentFolders menu refresh, % g_intRecentFoldersMenuTickCount . " ms"
return
;------------------------------------------------------------


;------------------------------------------------------------
BuildSwitchAndReopenFolderMenusInit:
;------------------------------------------------------------

Menu, g_menuReopenFolder, Add ; create the menu
Menu, g_menuReopenFolder, DeleteAll
Menu, g_menuSwitchFolderOrApp, Add ; create the menu
Menu, g_menuSwitchFolderOrApp, DeleteAll

if (g_blnUseColors)
{
    Menu, g_menuReopenFolder, Color, %g_strMenuBackgroundColor%
    Menu, g_menuSwitchFolderOrApp, Color, %g_strMenuBackgroundColor%
}
AddMenuIcon("g_menuReopenFolder", lDialogNone, "GuiShowNeverCalled", "iconNoContent", false) ; will never be called because disabled
AddMenuIcon("g_menuSwitchFolderOrApp", lDialogNone, "GuiShowNeverCalled", "iconNoContent", false) ; will never be called because disabled
AddCloseMenu("g_menuReopenFolder")
AddCloseMenu("g_menuSwitchFolderOrApp")

return
;------------------------------------------------------------


;------------------------------------------------------------
ReopenFolderMenuShortcut:
;------------------------------------------------------------

Gosub, RefreshReopenFolderMenu

Gosub, SetMenuPosition
CoordMode, Menu, % (g_intPopupMenuPosition = 2 ? "Window" : "Screen")
Menu, g_menuReopenFolder, Show, %g_intMenuPosX%, %g_intMenuPosY%

return
;------------------------------------------------------------


;------------------------------------------------------------
SwitchFolderOrAppMenuShortcut:
;------------------------------------------------------------

Gosub, RefreshSwitchFolderOrAppMenu

Gosub, SetMenuPosition
CoordMode, Menu, % (g_intPopupMenuPosition = 2 ? "Window" : "Screen")
Menu, g_menuSwitchFolderOrApp, Show, %g_intMenuPosX%, %g_intMenuPosY%

return
;------------------------------------------------------------


;------------------------------------------------------------
RefreshSwitchFolderOrAppMenu:
RefreshReopenFolderMenu:
; This command build two menus: "Reopen a Folder" and "Switch".
; The first part of "Switch" has the same items as "Reopen a Folder" but with a "switch" command instead of "open".
;------------------------------------------------------------
intSwitchReopenMenuStartTickCount := A_TickCount

if !(g_objQAPfeaturesInMenus.HasKey("{Current Folders}") or g_objQAPfeaturesInMenus.HasKey("{Switch Folder or App}"))
	; we don't have one of these QAP features in at least one menu
	return

; Gather Explorer and DOpus windows/listers

if (g_intActiveFileManager = 2) ; DirectoryOpus
{
	Gosub, RefreshDOpusListText
	objDOpusListers := CollectDOpusListersList(g_strDOpusListText) ; list all listers, excluding special folders like Recycle Bin
}

objExplorersWindows := CollectExplorers(ComObjCreate("Shell.Application").Windows)

; Process Explorer windows, DOpus listers and applications windows and add it to objFoldersAndAppsList

objFoldersAndAppsList := Object()

intWindowsIdIndex := 0
blnWeHaveFolders := false

; Process DOpus listers

if (g_intActiveFileManager = 2) ; DirectoryOpus
	for intIndex, objLister in objDOpusListers
	{
		; if we have no path or a DOpus collection, skip it
		if !StrLen(objLister.LocationURL) or InStr(objLister.LocationURL, "coll://")
			continue
		
		if NameIsInObject(objLister.Name, objFoldersAndAppsList)
			continue
		
		intWindowsIdIndex++
		blnWeHaveFolders := true
		objFolderOrApp := Object()
		objFolderOrApp.LocationURL := objLister.LocationURL
		objFolderOrApp.Name := objLister.Name
		objFolderOrApp.WindowId := objLister.Lister
		objFolderOrApp.WindowType := "DO"
		
		objFoldersAndAppsList.Insert(intWindowsIdIndex, objFolderOrApp)
	}

; Process Explorer windows

for intIndex, objFolder in objExplorersWindows
{
	; if we have no path, skip it
	if !StrLen(objFolder.LocationURL)
		continue
		
	if NameIsInObject(objFolder.LocationName, objFoldersAndAppsList)
		continue
	
	intWindowsIdIndex++
	blnWeHaveFolders := true
	objFolderOrApp := Object()
	objFolderOrApp := Object()
	objFolderOrApp.LocationURL := objFolder.LocationURL
	objFolderOrApp.Name := objFolder.LocationName
	objFolderOrApp.WindowId := objFolder.WindowId
	objFolderOrApp.WindowType := "EX"

	objFoldersAndAppsList.Insert(intWindowsIdIndex, objFolderOrApp)
}

if (A_ThisLabel <> "RefreshReopenFolderMenu")
	and g_objQAPfeaturesInMenus.HasKey("{Switch Folder or App}") ; we have this QAP features in at least one menu
{
	; Insert a menu separator

	if (blnWeHaveFolders)
	{
		intWindowsIdIndex++
		objFolderOrApp := Object()
		objFoldersAndAppsList.Insert(intWindowsIdIndex, objFolderOrApp)
	}

	; Gather and process running applications

	DetectHiddenWindows, Off
	WinGet, strWinIDs, List	; Retrieve IDs of all the existing windows
	DetectHiddenWindows, On ; revert to app default

	/*
	if (g_strCurrentBranch <> "prod")
	{
		strDiagFile := A_WorkingDir . "\" . g_strAppNameFile . "-SWITCH_DIAG.txt"
		FileDelete, %strDiagFile%
	}
	*/
	Loop, %strWinIDs%
	{
		WinGet, strProcessPath, ProcessPath, % "ahk_id " . strWinIDs%A_Index%
		WinGetTitle, strWindowTitle, % "ahk_id " strWinIDs%A_Index%
		WinGetClass, strWindowClass, % "ahk_id " strWinIDs%A_Index%
		WinGetPos, intX, intY, intW, intH, % "ahk_id " strWinIDs%A_Index%
		WinGet, intExStyle, ExStyle, % "ahk_id " . strWinIDs%A_Index%
		
		; if ((intExStyle & 0xFFFF0000) = 0x00200000)
		;	###_V("", Format("{1:#x}", intExStyle), strWindowClass, strWindowTitle, strProcessPath, "=", strWinTitlesWinApps)
		
		if !StrLen(strProcessPath)
			or !(intW * intH)
			or !StrLen(strWindowTitle)
			or (strProcessPath = A_WinDir . "\explorer.exe")
			or (strProcessPath = g_strDirectoryOpusPath) and (g_intActiveFileManager = 2)
			or (strProcessPath = A_ProgramFiles . "\Windows Sidebar\sidebar.exe")
			
			; if (g_strCurrentBranch <> "prod")
			;	FileAppend, NO`t%strProcessPath%`t%strWindowTitle%`t%strWindowClass%`t%strProcessPath%`t%intW%`t%intH%`n, %strDiagFile%
			continue
			
		else if (intExStyle = 0x00200000) ; WS_EX_NOREDIRECTIONBITMAP (see https://greenshot.atlassian.net/browse/BUG-2017)
		{
			; remember titles of window of intExStyle 0x00200100 because another window with same name and intExStyle 0x00200100 is also a ghost window (not real active window)
			strWinTitlesWinApps .= strWindowTitle . "|"
			; always skip windows with intExStyle is 0x00200000 because it is a ghost Windows app (not real active window)
			continue
		}

		intWindowsIdIndex++
		objFolderOrApp := Object()
		objFolderOrApp.Name := strWindowTitle
		objFolderOrApp.LocationURL := strProcessPath
		objFolderOrApp.WindowId := strWinIDs%A_Index%
		objFolderOrApp.ExStyle := intExStyle
		objFolderOrApp.WindowType := "APP"

		objFoldersAndAppsList.Insert(intWindowsIdIndex, objFolderOrApp)
	}
}

; remove apps of ExStyle 0x00200100 if we previously had a ghost Windows app of same title
Loop, % objFoldersAndAppsList.MaxIndex()
	if (objFoldersAndAppsList[A_Index].ExStyle = 0x00200100) and InStr(strWinTitlesWinApps, objFoldersAndAppsList[A_Index].Name . "|")
		objFoldersAndAppsList.Remove(A_Index)

; Build menu

intShortcut := 0
g_objReopenFolderLocationUrlByName := Object()

Critical, On
if (A_ThisLabel <> "RefreshReopenFolderMenu")
	and g_objQAPfeaturesInMenus.HasKey("{Switch Folder or App}") ; we have this QAP features in at least one menu
{
	g_objSwitchWindowIdsByName := Object()
	Menu, g_menuSwitchFolderOrApp, Add
	Menu, g_menuSwitchFolderOrApp, DeleteAll
}

Menu, g_menuReopenFolder, Add
Menu, g_menuReopenFolder, DeleteAll

if (intWindowsIdIndex)
{
	for intIndex, objFolderOrApp in objFoldersAndAppsList
	{
		if !StrLen(objFolderOrApp.Name)
			Menu, g_menuSwitchFolderOrApp, Add
		else
		{
			strMenuName := (g_blnDisplayNumericShortcuts and (intShortcut <= 35) ? "&" . NextMenuShortcut(intShortcut) . " " : "") . objFolderOrApp.Name
			if (objFolderOrApp.WindowType <> "APP") and !InStr(strMenuName, "ftp:") ; do not support reopen for FTP sites (Explorer reports "ftp:\\" DOpus "ftp://")
			{
				g_objReopenFolderLocationUrlByName.Insert(strMenuName, objFolderOrApp.LocationURL) ; strMenuName can include the numeric shortcut
				AddMenuIcon("g_menuReopenFolder", strMenuName, "OpenReopenFolder", "iconFolder")
			}
			g_objSwitchWindowIdsByName.Insert(strMenuName, objFolderOrApp.WindowType . "|" . objFolderOrApp.WindowId)
			AddMenuIcon("g_menuSwitchFolderOrApp", strMenuName, "OpenSwitchFolderOrApp"
				, (objFolderOrApp.WindowType = "EX" ? "iconChangeFolder"
					: (objFolderOrApp.WindowType = "DO" ?  g_strDirectoryOpusRtPath . ",1"
					: objFolderOrApp.LocationURL . ",1")))
		}
	}
}
else
	AddMenuIcon("g_menuSwitchFolderOrApp", lMenuNoCurrentFolder, "GuiShowNeverCalled", "iconNoContent", false) ; will never be called because disabled

if !(blnWeHaveFolders)
	AddMenuIcon("g_menuReopenFolder", lMenuNoCurrentFolder, "GuiShowNeverCalled", "iconNoContent", false) ; will never be called because disabled

AddCloseMenu("g_menuReopenFolder")
AddCloseMenu("g_menuSwitchFolderOrApp")

Critical, Off

objDOpusListers := ""
objExplorersWindows := ""
objFolderOrApp := ""
objFoldersAndAppsList := ""
intIndex := ""
objLister := ""
objFolder := ""
intShortcut := ""
strMenuName := ""
intWindowsIdIndex := ""
strWinIDs := ""
strProcessPath := ""
strWindowTitle := ""
strWindowClass := ""
strDiagFile := ""
intExStyle := ""
strWinTitlesWinApps := ""

g_intSwitchReopenMenuTickCount := A_TickCount - intSwitchReopenMenuStartTickCount
; TrayTip, SwitchReopen menu refresh, % g_intSwitchReopenMenuTickCount . " ms"
return
;------------------------------------------------------------


;------------------------------------------------------------
RefreshDOpusListText:
;------------------------------------------------------------

FileDelete, %g_strDOpusTempFilePath%
RunDOpusRt("/info", g_strDOpusTempFilePath, ",paths") ; list opened listers in a text file
; Run, "%strDirectoryOpusRtPath%" /info "%g_strDOpusTempFilePath%"`,paths
loop, 10
	if FileExist(g_strDOpusTempFilePath)
		Break
	else
		Sleep, 50 ; was 10 and had some gliches with FP - is 50 enough?
FileRead, g_strDOpusListText, %g_strDOpusTempFilePath%

return
;------------------------------------------------------------


;------------------------------------------------------------
CollectDOpusListersList(strList)
; list all DirectoryOpus listers, excluding special folders like Recycle Bin, Network because they are not included in dopus-list.txt
;------------------------------------------------------------
{
	objListers := Object()
	
	strList := SubStr(strList, InStr(strList, "<path"))
	Loop
	{
		objLister := Object()
		
		strList := SubStr(strList, InStr(strList, "<path"))
		strSubStr := SubStr(strList, InStr(strList, "<path"))
		strSubStr := SubStr(strSubStr, 1, InStr(strSubStr, "</path>") - 1)
		
		if (StrLen(strSubStr))
		{
			objLister.Active_lister := ParseDOpusListerProperty(strSubStr, "active_lister")
			objLister.Active_tab := ParseDOpusListerProperty(strSubStr, "active_tab")
			objLister.Lister := ParseDOpusListerProperty(strSubStr, "lister")
			objLister.Side := ParseDOpusListerProperty(strSubStr, "side")
			objLister.Tab := ParseDOpusListerProperty(strSubStr, "tab")
			objLister.Tab_state := ParseDOpusListerProperty(strSubStr, "tab_state")
			objLister.LocationURL := SubStr(strSubStr, InStr(strSubStr, ">") + 1)
			
			objLister.Name := ComUnHTML(objLister.LocationURL) ; convert HTML entities to text (like "&apos;")
			
			WinGetPos, intX, intY, intW, intH, % "ahk_id " . objLister.lister
			objLister.Position := intX . "|" . intY . "|" . intW . "|" . intH
			WinGet, intMinMax, MinMax, % "ahk_id " . objLister.lister
			objLister.MinMax := intMinMax
			objLister.Pane := objLister.Side
			
			; if !InStr(objLister.LocationURL, "ftp://") - removed in v6.0.6 - FTP from DOpus now supported
				; Swith Explorer to DOpus FTP folder not supported (see https://github.com/JnLlnd/FoldersPopup/issues/84)
				
			objListers.Insert(A_Index, objLister)
			
			strList := SubStr(strList, StrLen(strSubStr))
		}
	} until	(!StrLen(strSubStr))

	return objListers
}
;------------------------------------------------------------


;------------------------------------------------------------
ParseDOpusListerProperty(strSource, strProperty)
;------------------------------------------------------------
{
	intStartPos := InStr(strSource, " " . strProperty . "=")
	if !(intStartPos)
		return ""
	strSource := SubStr(strSource, intStartPos + StrLen(strProperty) + 3)
	intEndPos := InStr(strSource, """")
	
	return SubStr(strSource, 1, intEndPos - 1)
}
;------------------------------------------------------------


;------------------------------------------------------------
CollectExplorers(pExplorers)
;------------------------------------------------------------
{
	objExplorers := Object()
	intExplorers := 0
	
	For pExplorer in pExplorers
	; see http://msdn.microsoft.com/en-us/library/windows/desktop/aa752084(v=vs.85).aspx
	{
		/* in v.3.9.8: stop interupting Explorer collection if an error occurs - just check for content and continue
		if (A_LastError)
			; an error occurred during ComObjCreate (A_LastError probably is E_UNEXPECTED = -2147418113 #0x8000FFFFL)
			break
		*/

		strType := ""
		try strType := pExplorer.Type ; Gets the type name of the contained document object. "Document HTML" for IE windows. Should be empty for file Explorer windows.
		strWindowID := ""
		try strWindowID := pExplorer.HWND ; Try to get the handle of the window. Some ghost Explorer in the ComObjCreate may return an empty handle
		
		if !StrLen(strType) ; must be empty
			and StrLen(strWindowID) ; must not be empty
		{
			intExplorers++
			objExplorer := Object()
			objExplorer.Position := pExplorer.Left . "|" . pExplorer.Top . "|" . pExplorer.Width . "|" . pExplorer.Height

			objExplorer.IsSpecialFolder := !StrLen(pExplorer.LocationURL) ; empty for special folders like Recycle bin
			
			if (objExplorer.IsSpecialFolder)
			{
				objExplorer.LocationURL := pExplorer.Document.Folder.Self.Path
				objExplorer.LocationName := pExplorer.LocationName ; see http://msdn.microsoft.com/en-us/library/aa752084#properties
			}
			else
			{
				objExplorer.LocationURL := pExplorer.LocationURL
				objExplorer.LocationName :=  UriDecode(pExplorer.LocationURL)
			}
			
			objExplorer.WindowId := pExplorer.HWND ; not used for Explorer windows, but keep it
			WinGet, intMinMax, MinMax, % "ahk_id " . pExplorer.HWND
			objExplorer.MinMax := intMinMax
			
			objExplorers.Insert(intExplorers, objExplorer) ; I was checking if StrLen(pExplorer.HWND) - any reason?
		}
	}
	
	return objExplorers
}
;------------------------------------------------------------


;------------------------------------------------------------
BuildTotalCommanderHotlist:
;------------------------------------------------------------

Menu, %lTCMenuName%, Add 
Menu, %lTCMenuName%, DeleteAll
if (g_blnUseColors)
    Menu, %lTCMenuName%, Color, %g_strMenuBackgroundColor%
AddMenuIcon(lTCMenuName, lDialogNone, "GuiShowNeverCalled", "iconNoContent", false) ; will never be called because disabled
AddCloseMenu(lTCMenuName)

g_strWinCmdIniFileExpanded := EnvVars(g_strWinCmdIniFile)
if StrLen(g_strWinCmdIniFileExpanded)
{
	IniRead, strAlternativeWinCmdIniFile, %g_strWinCmdIniFileExpanded%, Configuration, AlternateUserIni
	if (strAlternativeWinCmdIniFile <> "ERROR")
		g_strWinCmdIniFileExpanded := EnvVars(strAlternativeWinCmdIniFile)
}
g_blnWinCmdIniFileExist := StrLen(g_strWinCmdIniFileExpanded) and FileExist(g_strWinCmdIniFileExpanded) ; TotalCommander settings file exists

Gosub, RefreshTotalCommanderHotlist

strAlternativeWinCmdIniFile := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
TotalCommanderHotlistMenuShortcut:
;------------------------------------------------------------

Gosub, SetMenuPosition
CoordMode, Menu, % (g_intPopupMenuPosition = 2 ? "Window" : "Screen")
Menu, %lTCMenuName%, Show, %g_intMenuPosX%, %g_intMenuPosY%

return
;------------------------------------------------------------


;------------------------------------------------------------
RefreshTotalCommanderHotlist:
;------------------------------------------------------------

; Init TC Directory hotlist if wincmd.ini file exists

Menu, %lTCMenuName%, Add 
Menu, %lTCMenuName%, DeleteAll

If (g_blnWinCmdIniFileExist) ; TotalCommander settings file exists
{
	g_objTCMenu := Object() ; object of menu structure entry point
	g_objTCMenu.MenuPath := lTCMenuName ; localized name of the TC menu
	g_objTCMenu.MenuType := "Menu"
	
	g_objQAPFeatures["{TC Directory hotlist}"].DefaultIcon := g_objJLiconsByName["TotalCommander"]

	g_intIniLine := 1
	if (RecursiveLoadTotalCommanderHotlistFromIni(g_objTCMenu) <> "EOM") ; build menu tree
		Oops("An error occurred while reading the Total Commander Directory hotlist in the ini file.")
	
	g_blnWorkingToolTip := True
	RecursiveBuildOneMenu(g_objTCMenu) ; recurse for submenus
	Tooltip
}
else
	AddMenuIcon(lTCMenuName, lDialogNone, "GuiShowNeverCalled", "iconNoContent", false) ; will never be called because disabled

AddCloseMenu(lTCMenuName)

return
;------------------------------------------------------------


;------------------------------------------------------------
RecursiveLoadTotalCommanderHotlistFromIni(objCurrentMenu)
; see http://www.quickaccesspopup.com/add-total-commander-hotlist-menu-to-fp-menu/
;------------------------------------------------------------
{
	global g_objMenusIndex
	global g_objSpecialFolders
	global g_strWinCmdIniFileExpanded
	global g_intIniLine
	global g_strMenuPathSeparator
	
	g_objMenusIndex.Insert(objCurrentMenu.MenuPath, objCurrentMenu) ; update the menu index
	; intMenuItemPos := 0

	Loop
	{
		IniRead, strWinCmdItemName, %g_strWinCmdIniFileExpanded%, DirMenu, menu%g_intIniLine%
		if (strWinCmdItemName = "ERROR")
			Return, "EOM" ; end of file, last menu item
	
		IniRead, strWinCmdItemCommand, %g_strWinCmdIniFileExpanded%, DirMenu, cmd%g_intIniLine%, %A_Space% ; empty by default
		; not used IniRead, strWinCmdPathLine, %g_strWinCmdIniFileExpanded%, DirMenu, path%g_intIniLine%, %A_Space% ; empty by default
        g_intIniLine++
	
		if (strWinCmdItemName = "--")
			return, "EOM" ; end of menu
		
		blnItemIsMenu := SubStr(strWinCmdItemName, 1, 1) = "-" and StrLen(strWinCmdItemName) > 1 ; begin a submenu "-MenuName", not "-"

		if (blnItemIsMenu)
		{
			strWinCmdItemName := SubStr(strWinCmdItemName, 2)
			objNewMenu := Object() ; create the submenu object
			objNewMenu.MenuPath := objCurrentMenu.MenuPath . " " . g_strMenuPathSeparator . " " . strWinCmdItemName
			objNewMenu.MenuType := "Menu"
			
			; create a navigation entry to navigate to the parent menu
			; (not used in Settings for this menu - but keep for code reusability)
			objNewMenuBack := Object()
			objNewMenuBack.FavoriteType := "B" ; for Back link to parent menu
			objNewMenuBack.FavoriteName := "(" . GetDeepestMenuPath(objCurrentMenu.MenuPath) . ")"
			objNewMenuBack.ParentMenu := objCurrentMenu ; this is the link to the parent menu
			objNewMenu.Insert(objNewMenuBack)
			
			; build the submenu
			strResult := RecursiveLoadTotalCommanderHotlistFromIni(objNewMenu) ; RECURSIVE
			
			if (strResult = "EOF") ; end of file was encountered while building this submenu, exit recursive function
				Return, %strResult%
		}
		else if (SubStr(strWinCmdItemCommand, 1, 3) <> "cd ")
			
			continue ; not a menu and not a change directory command (folder)
		
		objLoadIniFavorite := Object() ; new favorite item
		
		if (strWinCmdItemName = "-") ; menu separator
			objLoadIniFavorite.FavoriteType := "X" ; see Favorite Types
		else ; regular favorite or menu
		{
			objLoadIniFavorite.FavoriteType := (blnItemIsMenu ? "Menu" : "Folder") ; see Favorite Types
			objLoadIniFavorite.FavoriteName := strWinCmdItemName ; display name of this menu item
			if !(blnItemIsMenu)
				objLoadIniFavorite.FavoriteLocation := ReplaceAllInString(strWinCmdItemCommand, "cd ", "") ; path
			if (SubStr(objLoadIniFavorite.FavoriteLocation, 1, 2) = "::")
			{
				objLoadIniFavorite.FavoriteLocation := SubStr(objLoadIniFavorite.FavoriteLocation, 3)
				objLoadIniFavorite.FavoriteIconResource := g_objSpecialFolders[objLoadIniFavorite.FavoriteLocation].DefaultIcon
				objLoadIniFavorite.FavoriteType := "Special"
			}
		}
		
		; this is a submenu, link to the submenu object
		if (blnItemIsMenu)
			objLoadIniFavorite.SubMenu := objNewMenu
		
		; update the current menu object
		objCurrentMenu.Insert(objLoadIniFavorite)
		
		;	if (objLoadIniFavorite.FavoriteType <> "X") ; menu separators does not use a item position numeric shortcut number
		;	intMenuItemPos++
	}
}
;-----------------------------------------------------------


;------------------------------------------------------------
BuildAlternativeMenu:
;------------------------------------------------------------

Menu, g_menuAlternative, Add
Menu, g_menuAlternative, DeleteAll

intShortcut := 0

Loop
	if g_objQAPFeaturesAlternativeCodeByOrder.Haskey(A_Index)
	{
		strThisHotkey := g_objQAPFeatures[g_objQAPFeaturesAlternativeCodeByOrder[A_Index]].CurrentHotkey
		
		strMenuName := (g_blnDisplayNumericShortcuts and (intShortcut <= 35) ? "&" . NextMenuShortcut(intShortcut) . " " : "")
			. g_objQAPFeatures[g_objQAPFeaturesAlternativeCodeByOrder[A_Index]].LocalizedName
		if (g_intHotkeyReminders > 1) and StrLen(strThisHotkey)
			strMenuName .= " (" . (g_intHotkeyReminders = 2 ? strThisHotkey : Hotkey2Text(strThisHotkey)) . ")"
			; hotkey reminder " (...)" will be removed from A_ThisMenuItem in order to flag what alternative menu feature has been activated
		
		AddMenuIcon("g_menuAlternative", strMenuName, "OpenAlternativeMenu", g_objQAPFeatures[g_objQAPFeaturesAlternativeCodeByOrder[A_Index]].DefaultIcon)
	}
	else
		if g_objQAPFeaturesAlternativeCodeByOrder.Haskey(A_Index + 1) ; there is another menu item, add a menu separator
			Menu, g_menuAlternative, Add
		else
			break ; menu finished

AddCloseMenu("g_menuAlternative")

strMenuName := ""
strThisHotkey := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
BuildMainMenu:
BuildMainMenuWithStatus:
;------------------------------------------------------------

g_blnWorkingToolTip := (A_ThisLabel = "BuildMainMenuWithStatus")

Menu, %lMainMenuName%, Add
Menu, %lMainMenuName%, DeleteAll
if (g_blnUseColors)
	Menu, %lMainMenuName%, Color, %g_strMenuBackgroundColor%

g_objMenuColumnBreaks := Object() ; re-init before rebuilding menu

g_intNbLiveFolderItems := 0 ; number of items added to live folders (vs maximum set in ini file)
RecursiveBuildOneMenu(g_objMainMenu) ; recurse for submenus
if (g_blnWorkingToolTip)
	Tooltip

if !(g_blnDonor)
{
	if (g_objMenusIndex[lMainMenuName][g_objMenusIndex[lMainMenuName].MaxIndex()].FavoriteType <> "K")
	; column break not allowed if first item is a separator
		Menu, %lMainMenuName%, Add
	AddMenuIcon(lMainMenuName, lDonateMenu . "...", "GuiDonate", "iconDonate")
}

AddCloseMenu(lMainMenuName)

return
;------------------------------------------------------------


;------------------------------------------------------------
RecursiveBuildOneMenu(objCurrentMenu)
;------------------------------------------------------------
{
	global g_blnDisplayNumericShortcuts
	global g_blnDisplayIcons
	global g_intIconSize
	global g_strMenuBackgroundColor
	global g_blnUseColors
	global g_strGroupIndicatorPrefix
	global g_strGroupIndicatorSuffix
	global g_objQAPFeatures
	global g_objMenuColumnBreaks
	global g_intHotkeyReminders
	global g_objHotkeysByNameLocation
	global g_strMenuPathSeparator
	global g_objMenusIndex
	global g_strAppNameText
	global g_blnWorkingToolTip
	global g_objJLiconsByName
	global g_intNbLiveFolderItems
	global g_intNbLiveFolderItemsMax

	intShortcut := 0
	
	; ###_O("objCurrentMenu .FavoriteLocation", objCurrentMenu, "FavoriteLocation")
	; try because at first execution the strMenu menu does not exist and produces an error,
	; but DeleteAll is required later for menu updates
	try Menu, % objCurrentMenu.MenuPath, DeleteAll
	
	intMenuItemsCount := 0 ; counter of items in this menu
	
	if (g_blnWorkingToolTip)
		Tooltip, % L(lTrayTipWorkingTitle, g_strAppNameText) . "`n" . objCurrentMenu.MenuPath
		
	Loop, % objCurrentMenu.MaxIndex()
	{
		if (objCurrentMenu[A_Index].FavoriteType = "B") ; skip back link
			or objCurrentMenu[A_Index].FavoriteDisabled
			continue
		
		intMenuItemsCount++ ; for objMenuColumnBreak
		
		if StrLen(objCurrentMenu[A_Index].FavoriteName)
			strMenuName := (g_blnDisplayNumericShortcuts and (intShortcut <= 35) ? "&" . NextMenuShortcut(intShortcut) . " " : "") . objCurrentMenu[A_Index].FavoriteName
		
		if (objCurrentMenu[A_Index].FavoriteType = "Group")
			strMenuName .= " " . g_strGroupIndicatorPrefix . objCurrentMenu[A_Index].Submenu.MaxIndex() - 1 . g_strGroupIndicatorSuffix
		
		if (g_intHotkeyReminders > 1) and g_objHotkeysByNameLocation.HasKey(FavoriteNameLocationFromObject(objCurrentMenu[A_Index]))
			strMenuName .= " (" . (g_intHotkeyReminders = 2
				? g_objHotkeysByNameLocation[FavoriteNameLocationFromObject(objCurrentMenu[A_Index])] 
				: Hotkey2Text(g_objHotkeysByNameLocation[FavoriteNameLocationFromObject(objCurrentMenu[A_Index])])) . ")"
		
		if InStr("Menu|External", objCurrentMenu[A_Index].FavoriteType, true)
			or (objCurrentMenu[A_Index].FavoriteFolderLiveLevels and LiveFolderHasContent(objCurrentMenu[A_Index])) and !(g_intNbLiveFolderItems > g_intNbLiveFolderItemsMax)
		{
			if (objCurrentMenu[A_Index].FavoriteFolderLiveLevels)
			{
				BuildLiveFolderMenu(objCurrentMenu[A_Index], objCurrentMenu.MenuPath, A_Index)
				g_objMenusIndex.Insert(objCurrentMenu[A_Index].SubMenu.MenuPath, objCurrentMenu[A_Index].SubMenu) ; add to the menu index
			}
			
			RecursiveBuildOneMenu(objCurrentMenu[A_Index].SubMenu) ; RECURSIVE - build the submenu first
			
			if (g_blnUseColors)
				Try Menu, % objCurrentMenu[A_Index].SubMenu.MenuPath, Color, %g_strMenuBackgroundColor% ; Try because this can fail if submenu is empty
			
			Try Menu, % objCurrentMenu.MenuPath, Add, %strMenuName%, % ":" . objCurrentMenu[A_Index].SubMenu.MenuPath
			catch e ; when menu objCurrentMenu[A_Index].SubMenu.MenuPath is empty
				Menu, % objCurrentMenu.MenuPath, Add, %strMenuName%, OpenFavorite ; will never be called because disabled
			Menu, % objCurrentMenu.MenuPath, % (objCurrentMenu[A_Index].SubMenu.MaxIndex() > 1 ? "Enable" : "Disable"), %strMenuName% ; disable menu if contains only the back .. item
			if (g_blnDisplayIcons)
			{
				ParseIconResource(objCurrentMenu[A_Index].FavoriteIconResource, strThisIconFile, intThisIconIndex, "iconSubmenu")
				
				Menu, % objCurrentMenu.MenuPath, UseErrorLevel, on
				Menu, % objCurrentMenu.MenuPath, Icon, %strMenuName%
					, %strThisIconFile%, %intThisIconIndex% , %g_intIconSize%
				if (ErrorLevel)
				{
					ParseIconResource("iconUnknown", strIconFile, intIconIndex)
					Menu, % objCurrentMenu.MenuPath, Icon, %strMenuName%
						, %strIconFile%, %intIconIndex%, %g_intIconSize%
				}
				Menu, % objCurrentMenu.MenuPath, UseErrorLevel, off
			}
		}
		
		else if (objCurrentMenu[A_Index].FavoriteType = "X") ; this is a separator
			
			if (objCurrentMenu[A_Index - 1].FavoriteType = "K")
				intMenuItemsCount -= 1 ; separator not allowed as first item is a column, skip it
			else
				Menu, % objCurrentMenu.MenuPath, Add
			
		else if (objCurrentMenu[A_Index].FavoriteType = "K") ; this is a column break
		{
			intMenuItemsCount -= 1 ; column breaks do not take a slot in menus
			objMenuColumnBreak := Object()
			objMenuColumnBreak.MenuPath := objCurrentMenu.MenuPath
			objMenuColumnBreak.MenuPosition := intMenuItemsCount ; not required: - (objCurrentMenu.MenuPath <> lMainMenuName ? 1 : 0)
			g_objMenuColumnBreaks.Insert(objMenuColumnBreak)
		}
		else ; this is a favorite (Folder, Document, Application, Special, URL, FTP, QAP or Group)
		{
			if (objCurrentMenu[A_Index].FavoriteType = "QAP") and Strlen(g_objQAPFeatures[objCurrentMenu[A_Index].FavoriteLocation].QAPFeatureMenuName)
				; menu should never be empty (if no item, it contains a "no item" menu)
				Menu, % objCurrentMenu.MenuPath, Add, %strMenuName%, % ":" . g_objQAPFeatures[objCurrentMenu[A_Index].FavoriteLocation].QAPFeatureMenuName
			else if (objCurrentMenu[A_Index].FavoriteType = "Group")
				Menu, % objCurrentMenu.MenuPath, Add, %strMenuName%, OpenFavoriteGroup
			else
			{
				blnIsTotalCommanderHotlist := (SubStr(objCurrentMenu.MenuPath, 1, StrLen(lTCMenuName)) = lTCMenuName)
				Menu, % objCurrentMenu.MenuPath, Add, %strMenuName%, % (blnIsTotalCommanderHotlist ? "OpenFavoriteHotlist" : "OpenFavorite")
			}

			if (g_blnDisplayIcons)
			{
				if (objCurrentMenu[A_Index].FavoriteType = "Folder") ; this is a folder
					strThisIconFileIndex := objCurrentMenu[A_Index].FavoriteIconResource
				else if (objCurrentMenu[A_Index].FavoriteType = "URL") ; this is an URL
					if StrLen(objCurrentMenu[A_Index].FavoriteIconResource)
						strThisIconFileIndex := objCurrentMenu[A_Index].FavoriteIconResource
					else
						strThisIconFileIndex := GetIcon4Location(g_strTempDir . "\default_browser_icon.html")
						; not sure it is required to have a physical file with .html extension - but keep it as is by safety
				else ; this is a document, application, Special, FTP or QAP
					if StrLen(objCurrentMenu[A_Index].FavoriteIconResource)
						strThisIconFileIndex := objCurrentMenu[A_Index].FavoriteIconResource
					else
						strThisIconFileIndex := GetIcon4Location(objCurrentMenu[A_Index].FavoriteLocation)
				ParseIconResource(strThisIconFileIndex, strThisIconFile, intThisIconIndex, "iconFolder") ; only folder favorite may need the default icon
				
				Menu, % objCurrentMenu.MenuPath, UseErrorLevel, on
				ErrorLevel := 0 ; for safety clear in case Menu is not called in next if
				Menu, % objCurrentMenu.MenuPath, Icon, %strMenuName%, %strThisIconFile%, %intThisIconIndex%, %g_intIconSize%
				if (ErrorLevel)
				{
					ParseIconResource("iconUnknown", strIconFile, intIconIndex)
					Menu, % objCurrentMenu.MenuPath, Icon, %strMenuName%
						, %strIconFile%, %intIconIndex%, %g_intIconSize%
				}
				Menu, % objCurrentMenu.MenuPath, UseErrorLevel, off
			}
			if (objCurrentMenu[A_Index].FavoriteName = lMenuSettings . "...") ; make Settings... menu bold in any menu
				Menu, % objCurrentMenu.MenuPath, Default, %strMenuName%
		}
	}
}
;------------------------------------------------------------


;------------------------------------------------------------
LiveFolderHasContent(objLiveFolder)
;------------------------------------------------------------
{
;	###_O(objLiveFolder.FavoriteLocation, objLiveFolder)
	strExpandedLocation := PathCombine(A_WorkingDir, EnvVars(objLiveFolder.FavoriteLocation))
	if (objLiveFolder.FavoriteFolderLiveDocuments)
	{
		Loop, Files, %strExpandedLocation%\*.*, F ; files
		{
			; ###_V("Conditions"
				; , A_LoopFileFullPath
				; , A_LoopFileExt
				; , objLiveFolder.FavoriteFolderLiveExtensions
				; , !StrLen(objLiveFolder.FavoriteFolderLiveExtensions)
				; , (objLiveFolder.FavoriteFolderLiveIncludeExclude and StrLen(A_LoopFileExt) and InStr(objLiveFolder.FavoriteFolderLiveExtensions, A_LoopFileExt))
				; , (!objLiveFolder.FavoriteFolderLiveIncludeExclude and !InStr(objLiveFolder.FavoriteFolderLiveExtensions, A_LoopFileExt))
				; , "-")
			if !StrLen(objLiveFolder.FavoriteFolderLiveExtensions) ; include all
				or (objLiveFolder.FavoriteFolderLiveIncludeExclude and StrLen(A_LoopFileExt) and InStr(objLiveFolder.FavoriteFolderLiveExtensions, A_LoopFileExt)) ; include 
				or (!objLiveFolder.FavoriteFolderLiveIncludeExclude and !InStr(objLiveFolder.FavoriteFolderLiveExtensions, A_LoopFileExt)) ; exclude 
			{
			;	###_V("YES DOCUMENT", A_LoopFileFullPath)
				return true
			}
		}
	;	###_D("No document")
	}
	Loop, Files, %strExpandedLocation%\*.*, D ; directories
	{
	;	###_V("YES FOLDER", A_LoopFileFullPath)
		return true
	}
;	###_D("No folder")
	
	return false
}
;------------------------------------------------------------


;------------------------------------------------------------
BuildLiveFolderMenu(objLiveFolder, strMenuParentPath, intMenuParentPosition)
;------------------------------------------------------------
{
	global g_strMenuPathSeparator
	global g_strFolderLiveIndicator
	global g_intNbLiveFolderItems
	global g_intNbLiveFolderItemsMax
	
	strExpandedLocation := PathCombine(A_WorkingDir, EnvVars(objLiveFolder.FavoriteLocation))
	
	objNewMenu := Object() ; create the submenu object
	objNewMenu.IsLiveMenu := true
	objNewMenu.LiveMenuParentPath := strMenuParentPath
	objNewMenu.LiveMenuParentPosition := intMenuParentPosition
	objNewMenu.MenuPath := strMenuParentPath . " " . g_strMenuPathSeparator . " "  . objLiveFolder.FavoriteName
	objNewMenu.MenuType := "Menu"
	
	; fake back menu
	objNewMenuItem := Object()
	objNewMenuItem.FavoriteType := "B"
	objNewMenuItem.FavoriteName := ".."
	objNewMenu.Insert(objNewMenuItem)

	; self Live Folder item
	objNewMenuItem := Object()
	objNewMenuItem.FavoriteType := "Folder"
	objNewMenuItem.FavoriteName := g_strFolderLiveIndicator . " " . objLiveFolder.FavoriteName . " " . g_strFolderLiveIndicator
	objNewMenuItem.FavoriteLocation := strExpandedLocation
	ParseIconResource("", strThisIconFile, intThisIconIndex, "iconFolderLive")
	objNewMenuItem.FavoriteIconResource := strThisIconFile . "," . intThisIconIndex
	objNewMenu.Insert(objNewMenuItem)
	
	; scan folders in live folder
	strFolders := ""
	Loop, Files, %strExpandedLocation%\*.*, D ; directories
	{
		g_intNbLiveFolderItems++
		if (g_intNbLiveFolderItems > g_intNbLiveFolderItemsMax)
			Break
		if !InStr(A_LoopFileAttrib, "H")
			strFolders .= "Folder" . "`t" . A_LoopFileName . "`t" . A_LoopFileLongPath . "`t" . GetFolderIcon(A_LoopFileLongPath) . "`n"
	}
	Sort, strFolders
	
	; scan files in live folder
	strFiles := ""
	if (objLiveFolder.FavoriteFolderLiveDocuments)
		Loop, Files, %strExpandedLocation%\*.*, F ; files
			if !StrLen(objLiveFolder.FavoriteFolderLiveExtensions) ; include all
				or (objLiveFolder.FavoriteFolderLiveIncludeExclude and StrLen(A_LoopFileExt) and InStr(objLiveFolder.FavoriteFolderLiveExtensions, A_LoopFileExt)) ; include 
				or (!objLiveFolder.FavoriteFolderLiveIncludeExclude and !InStr(objLiveFolder.FavoriteFolderLiveExtensions, A_LoopFileExt)) ; exclude 
			{
				g_intNbLiveFolderItems++
				if (g_intNbLiveFolderItems > g_intNbLiveFolderItemsMax)
					Break
				strFiles .= "Document" . "`t" . A_LoopFileName . "`t" . A_LoopFileLongPath . "`n"
			}
			; icon resource will be set when building menu
			; favorite type Document is OK for Application items

	if (g_intNbLiveFolderItems > g_intNbLiveFolderItemsMax)
	{
		Oops(lOopsMaxLiveFolder, g_intNbLiveFolderItemsMax)
		return
	}

	Sort, strFiles
	
	strContent := (StrLen(strFolders . strFiles) ? "X`n" : "")  . strFolders . (StrLen(strFolders) and StrLen(strFiles) ? "X`n" : "") . strFiles

	Loop, Parse, strContent, `n
	{
		if !StrLen(A_LoopField)
			break
		
		; 1 favorite type, 2 menu name, 3 location, 4 icon (for folders only)
		StringSplit, arrItem, A_LoopField, `t
		
		if (objLiveFolder.FavoriteFolderLiveColumns and !Mod(A_Index + 1, objLiveFolder.FavoriteFolderLiveColumns)) ; insert column break
		{
			objNewMenuItem := Object()
			objNewMenuItem.FavoriteType := "K"
			objNewMenu.Insert(objNewMenuItem)
		}
		else if (arrItem1 = "X") ; insert separator between folders and files except if we are at a column break
		{
			objNewMenuItem := Object()
			objNewMenuItem.FavoriteType := "X"
		}
		
		if  (arrItem1 <> "X") ; do not use "else" because we must insert this item even if we inserted a column break
		{
			objNewMenuItem := Object()
			objNewMenuItem.FavoriteType := arrItem1
			objNewMenuItem.FavoriteName := arrItem2
			objNewMenuItem.FavoriteLocation := arrItem3
			objNewMenuItem.FavoriteIconResource := arrItem4
			if (arrItem1 = "Folder") ; make it a live folder
			{
				objNewMenuItem.FavoriteFolderLiveLevels := objLiveFolder.FavoriteFolderLiveLevels - 1 ; controls the number of recursive calls
				objNewMenuItem.FavoriteFolderLiveDocuments := objLiveFolder.FavoriteFolderLiveDocuments
				objNewMenuItem.FavoriteFolderLiveColumns := objLiveFolder.FavoriteFolderLiveColumns
				objNewMenuItem.FavoriteFolderLiveIncludeExclude := objLiveFolder.FavoriteFolderLiveIncludeExclude
				objNewMenuItem.FavoriteFolderLiveExtensions := objLiveFolder.FavoriteFolderLiveExtensions
			}
		}
		objNewMenu.Insert(objNewMenuItem)
	}

	; attach live folder menu to live folder favorite object
	objLiveFolder.SubMenu := objNewMenu
}
;------------------------------------------------------------


;------------------------------------------------------------
AddCloseMenu(strMenuName)
;------------------------------------------------------------
{
	global g_blnAddCloseToDynamicMenus
	
	if (g_blnAddCloseToDynamicMenus)
	{
		Menu, %strMenuName%, Add
		AddMenuIcon(strMenuName, lMenuCloseThisMenu, "DoNothing", "iconClose")
	}
}
;------------------------------------------------------------


;------------------------------------------------------------
AddMenuIcon(strMenuName, ByRef strMenuItemName, strLabel, strIconValue, blnEnabled := true)
; strIconValue can be an index from g_objJLiconsByName (eg: "iconFolder") or a "file,index" icongroup (eg: "imageres.dll,33")
; strThisDefaultIcon is returned truncated if longer than 260 chars
;------------------------------------------------------------
{
	global g_intIconSize
	global g_blnDisplayIcons
	global g_blnMainIsFirstColumn
	global g_objJLiconsByName

	if !StrLen(strMenuItemName)
		return
	
	; The names of menus and menu items can be up to 260 characters long.
	if StrLen(strMenuItemName) > 260
		strMenuItemName := SubStr(strMenuItemName, 1, 256) . "..." ; minus one for the luck ;-)
	
	Menu, %strMenuName%, Add, %strMenuItemName%, %strLabel%
	if (g_blnDisplayIcons)
		; under Win_XP, display icons in main menu only when in first column (for other menus, this fuction is not called)
	{
		Menu, %strMenuName%, UseErrorLevel, on
		ParseIconResource(strIconValue, strIconFile, intIconIndex)
		Menu, %strMenuName%, Icon, %strMenuItemName%, %strIconFile%, %intIconIndex%, %g_intIconSize%
		if (ErrorLevel)
		{
			ParseIconResource((strMenuName = "g_menuSwitchFolderOrApp" ? "iconApplication" : "iconUnknown"), strIconFile, intIconIndex)
			Menu, %strMenuName%, Icon, %strMenuItemName%
				, %strIconFile%, %intIconIndex%, %g_intIconSize%
		}
		Menu, %strMenuName%, UseErrorLevel, off
	}
	
	if !(blnEnabled)
		Menu, %strMenuName%, Disable, %strMenuItemName%
}
;------------------------------------------------------------


;------------------------------------------------------------
InsertColumnBreaks:
; Based on Rexx Folder Menu (http://foldermenu.sourceforge.net/) and Lexikos code
; http://www.autohotkey.com/board/topic/69553-menu-with-columns-problem-with-adding-column-separator/#entry440866
;------------------------------------------------------------

VarSetCapacity(mii, cb:=16+8*A_PtrSize, 0) ; A_PtrSize is used for 64-bit compatibility.
NumPut(cb, mii, "uint")
NumPut(0x100, mii, 4, "uint") ; fMask = MIIM_FTYPE
NumPut(0x20, mii, 8, "uint") ; fType = MFT_MENUBARBREAK

for intIndex, objMenuColumnBreak in g_objMenuColumnBreaks
{
	pMenuHandle := GetMenuHandle(objMenuColumnBreak.MenuPath) 
	DllCall("SetMenuItemInfo", "ptr", pMenuHandle, "uint", objMenuColumnBreak.MenuPosition, "int", 1, "ptr", &mii)
}

return
;------------------------------------------------------------


;------------------------------------------------------------
GetMenuHandle(strMenuName)
; from MenuIcons v2 by Lexikos
; http://www.autohotkey.com/board/topic/20253-menu-icons-v2/
;------------------------------------------------------------
{
	static pMenuDummy
	
	; v2.2: Check for !pMenuDummy instead of pMenuDummy="" in case init failed last time.
	If !pMenuDummy
	{
		Menu, menuDummy, Add
		Menu, menuDummy, DeleteAll
		
		Gui, 99:Menu, menuDummy
		; v2.2: Use LastFound method instead of window title. [Thanks animeaime.]
		Gui, 99:+LastFound
		
		pMenuDummy := DllCall("GetMenu", "uint", WinExist())
		
		Gui, 99:Menu
		Gui, 99:Destroy
		
		; v2.2: Return only after cleaning up. [Thanks animeaime.]
		if !pMenuDummy
			return 0
	}

	Menu, menuDummy, Add, :%strMenuName%
	pMenu := DllCall( "GetSubMenu", "uint", pMenuDummy, "int", 0 )
	DllCall( "RemoveMenu", "uint", pMenuDummy, "uint", 0, "uint", 0x400 )
	Menu, menuDummy, Delete, :%strMenuName%

	return pMenu
}
;------------------------------------------------------------


;------------------------------------------------------------
RefreshQAPMenu:
;------------------------------------------------------------

Gosub, RefreshTotalCommanderHotlist ; because ReloadIniFile resets g_objMenusIndex
Gosub, SetTimerRefreshDynamicMenus
Gosub, BuildMainMenuWithStatus ; only here we load hotkeys, when user save favorites

return
;------------------------------------------------------------


;========================================================================================================================
; END OF BUILD
;========================================================================================================================



;========================================================================================================================
!_025_OPTIONS:
;========================================================================================================================

;------------------------------------------------------------
GuiOptions:
GuiOptionsFromQAPFeature:
;------------------------------------------------------------

if (A_ThisLabel = "GuiOptionsFromQAPFeature")
	Gosub, GuiShowFromGuiOptions

g_intGui1WinID := WinExist("A")
loop, 4
	g_arrPopupHotkeysPrevious%A_Index% := g_arrPopupHotkeys%A_Index% ; allow to turn off changed hotkeys and to revert g_arrPopupHotkeys if cancel

g_objQAPFeaturesNewHotkeys := Object() ; re-init
for intOrder, strAlternativeCode in g_objQAPFeaturesAlternativeCodeByOrder
	if HasHotkey(g_objQAPFeatures[strAlternativeCode].CurrentHotkey)
		; g_objQAPFeaturesNewHotkeys will be saved to ini file and g_objQAPFeatures will be used to turn off previous hotkeys
		g_objQAPFeaturesNewHotkeys.Insert(strAlternativeCode, g_objQAPFeatures[strAlternativeCode].CurrentHotkey)

StringSplit, g_arrOptionsTitlesSub, lOptionsPopupHotkeyTitlesSub, |

;---------------------------------------
; Build Gui header
Gui, 1:Submit, NoHide
Gui, 2:New, , % L(lOptionsGuiTitle, g_strAppNameText, g_strAppVersion)
if (g_blnUseColors)
	Gui, 2:Color, %g_strGuiWindowColor%
Gui, 2:+Owner1
Gui, 2:Font, s10 w700, Verdana
Gui, 2:Add, Text, x10 y10 w595 center, % L(lOptionsGuiTitle, g_strAppNameText)

Gui, 2:Font, s8 w600, Verdana
Gui, 2:Add, Tab2, vf_intOptionsTab w620 h420 AltSubmit, %A_Space%%lOptionsOtherOptions% | %lOptionsMenuOptions% | %lOptionsMouseAndKeyboard% | %lOptionsAlternativeMenuFeatures% | %lOptionsExclusionList% | %lOptionsThirdParty%%A_Space%

;---------------------------------------
; Tab 1: General options

Gui, 2:Tab, 1

Gui, 2:Font
Gui, 2:Add, Text, x10 y+10 w595 center, % L(lOptionsTabOtherOptionsIntro, g_strAppNameText)

; column 1

Gui, 2:Add, CheckBox, y+15 x15 Section w300 vf_blnChangeFolderInDialog gChangeFoldersInDialogClicked, %lOptionsChangeFolderInDialog%
GuiControl, , f_blnChangeFolderInDialog, %g_blnChangeFolderInDialog%

Gui, 2:Add, Text, y+10 xs, %lOptionsLanguage%
Gui, 2:Add, DropDownList, y+5 xs w120 vf_drpLanguage Sort, %lOptionsLanguageLabels%
GuiControl, ChooseString, f_drpLanguage, %g_strLanguageLabel%

Gui, 2:Add, Text, y+10 xs, %lOptionsTheme%
Gui, 2:Add, DropDownList, y+5 xs w120 vf_drpTheme, %g_strAvailableThemes%
GuiControl, ChooseString, f_drpTheme, %g_strTheme%

; Gui, 2:Add, CheckBox, y+10 xs w300 vf_blnEnableSharedMenuCatalogueOUT gEnableSharedMenuCatalogueClicked, %lOptionsEnableSharedMenuCatalogue%
; GuiControl, , f_blnEnableSharedMenuCatalogue, % StrLen(g_strExternalMenusCataloguePath) > 0

Gui, 2:Font, s8 w700
Gui, 2:Add, Link, y+25 xs w300, % L(lOptionsCatalogueHelp, "http://www.quickaccesspopup.com/can-a-submenu-be-shared-on-different-pcs-or-by-different-users/", lGuiHelp)
Gui, 2:Font
Gui, 2:Add, CheckBox, y+10 xs w300 vf_blnEnableExternalMenusCatalogue gEnableExternalMenusCatalogueClicked, %lOptionsEnableExternalMenusCatalogue%
GuiControl, , f_blnEnableExternalMenusCatalogue, % StrLen(g_strExternalMenusCataloguePath) > 0

Gui, 2:Add, Text, y+10 xs vf_lblExternalMenusCataloguePathPrompt hidden, %lOptionsCataloguePath%:
Gui, 2:Add, Edit, y+5 xs w200 h20 vf_strExternalMenusCataloguePath hidden
Gui, 2:Add, Button, x+5 yp w75 vf_btnExternalMenusCataloguePath gButtonExternalMenuSelectCataloguePath hidden, %lDialogBrowseButton%
GuiControl, 2:, f_strExternalMenusCataloguePath, %g_strExternalMenusCataloguePath%
Gosub, EnableExternalMenusCatalogueClicked ; init visible fields

; column 2

Gui, 2:Add, CheckBox, ys x320 w300 Section vf_blnOptionsRunAtStartup, %lOptionsRunAtStartup%
GuiControl, , f_blnOptionsRunAtStartup, % FileExist(A_Startup . "\" . g_strAppNameFile . ".lnk") ? 1 : 0

Gui, 2:Add, CheckBox, y+10 xs w300 vf_blnAddAutoAtTop, %lOptionsAddAutoAtTop%
GuiControl, , f_blnAddAutoAtTop, %g_blnAddAutoAtTop%

Gui, 2:Add, CheckBox, y+10 xs w300 vf_blnDisplayTrayTip, %lOptionsTrayTip%
GuiControl, , f_blnDisplayTrayTip, %g_blnDisplayTrayTip%

Gui, 2:Add, CheckBox, y+10 xs w300 vf_blnCheck4Update, %lOptionsCheck4Update%
GuiControl, , f_blnCheck4Update, %g_blnCheck4Update%
Gui, 2:Add, Link, y+3 xs+16 w300 gCheck4UpdateNow, (<a>%lOptionsCheck4UpdateNow%</a>)

Gui, 2:Add, CheckBox, y+10 xs w300 vf_blnRememberSettingsPosition, %lOptionsRememberSettingsPosition%
GuiControl, , f_blnRememberSettingsPosition, %g_blnRememberSettingsPosition%

Gui, 2:Font, s8 w700
Gui, 2:Add, Link, y+25 xs w300, % L(lOptionsSnippetsHelp, "http://www.quickaccesspopup.com/what-are-snippets/", lGuiHelp)
Gui, 2:Font

Gui, 2:Add, CheckBox, y+10 xs w300 vf_blnSnippetDefaultProcessEOLTab, %lDialogFavoriteSnippetProcessEOLTab%
GuiControl, , f_blnSnippetDefaultProcessEOLTab, %g_blnSnippetDefaultProcessEOLTab%

Gui, 2:Add, CheckBox, y+10 xs w300 vf_blnSnippetDefaultFixedFont, %lDialogFavoriteSnippetFixedFont%
GuiControl, , f_blnSnippetDefaultFixedFont, %g_blnSnippetDefaultFixedFont%

Gui, 2:Add, Text, y+10 xs, %lDialogFavoriteSnippetFontSize%
Gui, 2:Add, Edit, x+5 yp h20 w52 vf_intSnippetDefaultFontSize, %lDialogFavoriteSnippetFontSize%
Gui, 2:Add, UpDown, Range6-18 h20, %g_intSnippetDefaultFontSize%

Gui, 2:Add, CheckBox, y+10 xs w300 vf_blnSnippetDefaultMacro, %lDialogFavoriteSnippetSendModeMacro%
GuiControl, , f_blnOptionsSnippetDefaultMacro, %g_blnSnippetDefaultMacro%

;---------------------------------------
; Tab 2: Popup menu options

Gui, 2:Tab, 2

Gui, 2:Font
Gui, 2:Add, Text, x10 y+10 w595 center, % L(lOptionsTabMenuOptionsIntro, g_strAppNameText)

Gui, 2:Add, Text, y+15 x15 w300 Section, %lOptionsMenuPositionPrompt%

Gui, 2:Add, Radio, % "y+5 xs w300 vf_radPopupMenuPosition1 gPopupMenuPositionClicked Group " . (g_intPopupMenuPosition = 1 ? "Checked" : ""), %lOptionsMenuNearMouse%
Gui, 2:Add, Radio, % "y+5 xs w300 vf_radPopupMenuPosition2 gPopupMenuPositionClicked " . (g_intPopupMenuPosition = 2 ? "Checked" : ""), %lOptionsMenuActiveWindow%
Gui, 2:Add, Radio, % "y+5 xs w300 vf_radPopupMenuPosition3 gPopupMenuPositionClicked " . (g_intPopupMenuPosition = 3 ? "Checked" : ""), %lOptionsMenuFixPosition%

Gui, 2:Add, Text, % "y+5 xs+18 vf_lblPopupFixPositionX " . (g_intPopupMenuPosition = 3 ? "" : "Disabled"), %lOptionsPopupFixPositionX%
Gui, 2:Add, Edit, % "yp x+5 w51 h22 vf_intPopupFixPositionXEdit number center " . (g_intPopupMenuPosition = 3 ? "" : "Disabled")
Gui, 2:Add, UpDown, vf_intPopupFixPositionX Range1-9999, %g_arrPopupFixPosition1%
Gui, 2:Add, Text, % "yp x+5 vf_lblPopupFixPositionY " . (g_intPopupMenuPosition = 3 ? "" : "Disabled")
Gui, 2:Add, Edit, % "yp x+5 w51 h22 vf_intPopupFixPositionYEdit number center " . (g_intPopupMenuPosition = 3 ? "" : "Disabled")
Gui, 2:Add, UpDown, vf_intPopupFixPositionY Range1-9999, %g_arrPopupFixPosition2%

Gui, 2:Add, Text, y+10 xs w300, %lOptionsHotkeyRemindersPrompt%

Gui, 2:Add, Radio, % "y+5 xs w300 vf_radHotkeyReminders1 Group " . (g_intHotkeyReminders = 1 ? "Checked" : ""), %lOptionsHotkeyRemindersNo%
Gui, 2:Add, Radio, % "y+5 xs w300 vf_radHotkeyReminders2 " . (g_intHotkeyReminders = 2 ? "Checked" : ""), %lOptionsHotkeyRemindersShort%
Gui, 2:Add, Radio, % "y+5 xs w300 vf_radHotkeyReminders3 " . (g_intHotkeyReminders = 3 ? "Checked" : ""), %lOptionsHotkeyRemindersFull%

if !(g_blnPortableMode)
{
	Gui, 2:Add, CheckBox, y+10 xs w300 vf_blnExplorerContextMenus, %lOptionsExplorerContextMenus%
	GuiControl, , f_blnExplorerContextMenus, %g_blnExplorerContextMenus%
}

Gui, 2:Add, Text, y+15 xs w300, %lOptionsRecentFoldersPrompt%
Gui, 2:Add, Edit, y+5 xs w51 h22 vf_intRecentFoldersMaxEdit number center ; , %g_intRecentFoldersMax%
Gui, 2:Add, UpDown, vf_intRecentFoldersMax Range1-9999, %g_intRecentFoldersMax%
Gui, 2:Add, Text, yp x+10 w235, %lOptionsRecentFolders%

; column 2

Gui, 2:Add, CheckBox, ys x320 w300 Section vf_blnDisplayNumericShortcuts, %lOptionsDisplayMenuShortcuts%
GuiControl, , f_blnDisplayNumericShortcuts, %g_blnDisplayNumericShortcuts%

Gui, 2:Add, CheckBox, y+10 xs w300 vf_blnOpenMenuOnTaskbar, %lOptionsOpenMenuOnTaskbar%
GuiControl, , f_blnOpenMenuOnTaskbar, %g_blnOpenMenuOnTaskbar%

Gui, 2:Add, CheckBox, y+10 xs w300 vf_blnAddCloseToDynamicMenus, %lOptionsAddCloseToDynamicMenus%
GuiControl, , f_blnAddCloseToDynamicMenus, %g_blnAddCloseToDynamicMenus%

Gui, 2:Add, CheckBox, y+10 xs w300 vf_blnDisplayIcons gDisplayIconsClicked, %lOptionsDisplayIcons%
GuiControl, , f_blnDisplayIcons, %g_blnDisplayIcons%

Gui, 2:Add, Text, % "y+10 xs vf_drpIconSizeLabel " . (g_blnDisplayIcons ? "" : "Disabled"), %lOptionsIconSize%
Gui, 2:Add, DropDownList, % "yp x+10 w40 vf_drpIconSize Sort " . (g_blnDisplayIcons ? "" : "Disabled"), 16|24|32|48|64
GuiControl, ChooseString, f_drpIconSize, %g_intIconSize%

Gui, 2:Add, Edit, % "y+10 xs w51 h22 vf_intIconsManageRowsSettingsEdit number center" . (g_blnDisplayIcons ? "" : "Disabled")
Gui, 2:Add, UpDown, vf_intIconsManageRowsSettings Range0-9999, %g_intIconsManageRowsSettings%
Gui, 2:Add, Text, % "yp x+10 w235 vf_lblIconsManageRows" . (g_blnDisplayIcons ? "" : "Disabled"), %lOptionsIconsManageRows%

;---------------------------------------
; Tab 3: Popup menu hotkeys

Gui, 2:Tab, 3

Gui, 2:Font
Gui, 2:Add, Text, x10 y+10 w595 center, % L(lOptionsTabMouseAndKeyboardIntro, g_strAppNameText)

loop, % g_arrPopupHotkeyNames0
{
	Gui, 2:Font, s8 w700
	Gui, 2:Add, Text, x15 y+20 w610, % g_arrOptionsPopupHotkeyTitles%A_Index%
	Gui, 2:Font, s9 w500, Courier New
	Gui, 2:Add, Text, Section x260 y+5 w280 h23 center 0x1000 vf_lblHotkeyText%A_Index% gButtonOptionsChangeHotkey%A_Index%, % HotkeySections2Text(strModifiers%A_Index%, strMouseButton%A_Index%, strOptionsKey%A_Index%)
	Gui, 2:Font
	Gui, 2:Add, Button, yp x555 vf_btnChangeHotkey%A_Index% gButtonOptionsChangeHotkey%A_Index%, %lOptionsChangeHotkey%
	Gui, 2:Font, s8 w500
	Gui, 2:Add, Link, x15 ys w240 gOptionsTitlesSubClicked, % g_arrOptionsTitlesSub%A_Index%
}

;---------------------------------------
; Tab 4: Alternative Menu Features

Gui, 2:Tab, 4

Gui, 2:Font
Gui, 2:Add, Text, x10 y+10 w595 center, % L(lOptionsAlternativeMenuFeaturesIntro, Hotkey2Text(g_arrPopupHotkeys3), Hotkey2Text(g_arrPopupHotkeys4))

for intOrder, strAlternativeCode in g_objQAPFeaturesAlternativeCodeByOrder
{
	Gui, 2:Font, s8 w700
	Gui, 2:Add, Text, x15 y+10 w240, % g_objQAPFeatures[strAlternativeCode].LocalizedName
	Gui, 2:Font, s9 w500, Courier New
	Gui, 2:Add, Text, Section x260 yp w280 h20 center 0x1000 vf_lblAlternativeHotkeyText%intOrder% gButtonOptionsChangeAlternativeHotkey
		, % Hotkey2Text(g_objQAPFeatures[strAlternativeCode].CurrentHotkey)
	Gui, 2:Font
	Gui, 2:Add, Button, yp x555 vf_btnChangeAlternativeHotkey%intOrder% gButtonOptionsChangeAlternativeHotkey, %lOptionsChangeHotkey%
}

Gui, 2:Font, s8 w700
Gui, 2:Add, Text, x10 y+25 w610, %lDialogOtherHotkeys%
Gui, 2:Font
Gui, 2:Add, Text, y+10 x15, %lOptionsControlDoublePressed%
Gui, 2:Add, CheckBox, y+5 x15 vf_blnLeftControlDoublePressed, %lOptionsControlDoublePressedLeft%
Gui, 2:Add, CheckBox, yp x+5 vf_blnRightControlDoublePressed, %lOptionsControlDoublePressedRight%
GuiControl, , f_blnLeftControlDoublePressed, %g_blnLeftControlDoublePressed%
GuiControl, , f_blnRightControlDoublePressed, %g_blnRightControlDoublePressed%

;---------------------------------------
; Tab 5: Exclusion list

Gui, 2:Tab, 5
Gui, 2:Font

Gui, 2:Add, Text, x10 y+10 w595 center, % L(lOptionsExclusionTitle, Hotkey2Text(g_arrPopupHotkeys1))
Gui, 2:Add, Edit, x10 y+5 w600 r10 vf_strExclusionMouseList, % ReplaceAllInString(Trim(g_strExclusionMouseList), "|", "`n")
Gui, 2:Add, Link, x10 y+10 w595, % L(lOptionsExclusionDetail1, Hotkey2Text(g_arrPopupHotkeys1))
Gui, 2:Add, Link, x10 y+10 w595, % L(lOptionsExclusionDetail2, Hotkey2Text(g_arrPopupHotkeys1), "http://www.quickaccesspopup.com/can-i-block-the-qap-menu-hotkeys-if-they-interfere-with-one-of-my-other-apps/")
Gui, 2:Add, Button, x10 y+10 vf_btnGetWinInfo gGetWinInfo, %lMenuGetWinInfo%

GuiCenterButtons(L(lOptionsGuiTitle, g_strAppNameText, g_strAppVersion), 10, 5, 20, "f_btnGetWinInfo")

;---------------------------------------
; Tab 6: File Managers

Gui, 2:Tab, 6

Gui, 2:Add, Text, x10 y+10 w595 center, %lOptionsTabFileManagersIntro%

loop, %g_arrActiveFileManagerSystemNames0%
	Gui, 2:Add, Radio, % "y+10 x15 gActiveFileManagerClicked vf_radActiveFileManager" . A_Index . (g_intActiveFileManager = A_Index ? " checked" : ""), % g_arrActiveFileManagerDisplayNames%A_Index%
	
Gui, 2:Font, s8 w700
Gui, 2:Add, Link, y+25 x32 w500 vf_lnkFileManagerHelp hidden
Gui, 2:Font
Gui, 2:Add, Text, y+10 x32 w500 vf_lblFileManagerDetail hidden
Gui, 2:Add, Text, y+10 x32 vf_lblFileManagerPrompt hidden, %lDialogApplicationLabel%:
Gui, 2:Add, Edit, yp x+10 w300 h20 vf_strFileManagerPath hidden
Gui, 2:Add, DropDownList, xp yp w300 vf_drpQAPconnectFileManager hidden Sort
if StrLen(g_strQAPconnectFileManager)
	GuiControl, ChooseString, f_drpQAPconnectFileManager, %g_strQAPconnectFileManager%
Gui, 2:Add, Button, x+10 yp vf_btnFileManagerPath gButtonSelectFileManagerPath hidden, %lDialogBrowseButton%
Gui, 2:Add, Checkbox, y+10 x32 w590 vf_blnFileManagerUseTabs hidden, %lOptionsThirdPartyUseTabs%
Gui, 2:Add, Button, xp yp vf_btnQAPconnectEdit gShowQAPconnectIniFile hidden, % L(lMenuEditIniFile, "QAPconnect.ini")
Gui, 2:Add, Text, y+10 xp vf_lblTotalCommanderWinCmdPrompt hidden, %lTCWinCmdLocation%
Gui, 2:Add, Edit, yp x+10 w300 h20 vf_strTotalCommanderWinCmd hidden
Gui, 2:Add, Button, x+10 yp vf_btnTotalCommanderWinCmd gButtonSelectTotalCommanderWinCmd hidden, %lDialogBrowseButton%

Gosub, ActiveFileManagerClicked ; init visible fields

;---------------------------------------
; Build Gui footer

Gui, 2:Tab

GuiControlGet, arrTabPos, Pos, f_intOptionsTab

Gui, 2:Add, Button, % "y" . arrTabPosY + arrTabPosH + 10 . " x10 vf_btnOptionsSave gButtonOptionsSave Default", %lGuiSaveAmpersand%
Gui, 2:Add, Button, yp vf_btnOptionsCancel gButtonOptionsCancel, %lGuiCancelAmpersand%
Gui, 2:Add, Button, yp vf_btnOptionsDonate gGuiDonate, %lDonateButtonAmpersand%
GuiCenterButtons(L(lOptionsGuiTitle, g_strAppNameText, g_strAppVersion), 10, 5, 20, "f_btnOptionsSave", "f_btnOptionsCancel", "f_btnOptionsDonate")

Gui, 2:Add, Text
GuiControl, Focus, f_btnOptionsSave

Gosub, ShowGui2AndDisableGui1

return
;------------------------------------------------------------


;------------------------------------------------------------
ActiveFileManagerClicked:
;------------------------------------------------------------
Gui, 2:Submit, NoHide

strShowHideCommand := (f_radActiveFileManager1 ? "Hide" : "Show")
GuiControl, %strShowHideCommand%, f_lblFileManagerDetail
GuiControl, %strShowHideCommand%, f_lblFileManagerPrompt
GuiControl, %strShowHideCommand%, f_lnkFileManagerHelp

strShowHideCommand := (f_radActiveFileManager1 or f_radActiveFileManager4 ? "Hide" : "Show")
GuiControl, %strShowHideCommand%, f_blnFileManagerUseTabs
GuiControl, %strShowHideCommand%, f_btnFileManagerPath
GuiControl, %strShowHideCommand%, f_strFileManagerPath

strShowHideCommand := (!f_radActiveFileManager3 ? "Hide" : "Show")
GuiControl, %strShowHideCommand%, f_btnTotalCommanderWinCmd
GuiControl, %strShowHideCommand%, f_lblTotalCommanderWinCmdPrompt
GuiControl, %strShowHideCommand%, f_strTotalCommanderWinCmd

strShowHideCommand := (!f_radActiveFileManager4 ? "Hide" : "Show")
GuiControl, %strShowHideCommand%, f_btnQAPconnectEdit
GuiControl, %strShowHideCommand%, f_drpQAPconnectFileManager

if (f_radActiveFileManager2) ; DirectoryOpus
{
	g_intClickedFileManager := 2
	strHelpUrl := "http://www.quickaccesspopup.com/how-to-i-enable-directory-opus-support-in-quick-access-popup/"
}
else if (f_radActiveFileManager3) ; TotalCommander
{
	g_intClickedFileManager := 3
	strHelpUrl := "http://www.quickaccesspopup.com/how-do-i-enable-total-commander-support-in-quick-access-popup/"
}
else if (f_radActiveFileManager4) ; QAPconnect
{
	g_intClickedFileManager := 4
	strHelpUrl := "http://www.quickaccesspopup.com/what-file-managers-are-supported-in-addition-to-windows-explorer/"
}
else ; f_radActiveFileManager1
	g_intClickedFileManager := 1

if !(f_radActiveFileManager1) ; DirectoryOpus, TotalCommander or QAPconnect
{
	strClickedFileManagerSystemNames := g_arrActiveFileManagerSystemNames%g_intClickedFileManager%
	
	if !StrLen(g_str%strClickedFileManagerSystemNames%Path)
		IniRead, g_str%strClickedFileManagerSystemNames%Path, %g_strIniFile%, Global, %strClickedFileManagerSystemNames%Path, %A_Space% ; empty if error
	
	GuiControl, , f_lnkFileManagerHelp, % L(lOptionsThirdPartySelectedHelp, g_arrActiveFileManagerDisplayNames%g_intClickedFileManager%, strHelpUrl, lGuiHelp)
	GuiControl, , f_lblFileManagerDetail, % (f_radActiveFileManager4 ? L(lOptionsThirdPartyDetailQAPconnect, "QAPconnect.ini") : L(lOptionsThirdPartyDetail, g_arrActiveFileManagerDisplayNames%g_intClickedFileManager%))
	GuiControl, , f_strFileManagerPath, % g_str%strClickedFileManagerSystemNames%PathBeforeEnvVars
	if (f_radActiveFileManager4) ; QAPconnect
	{
		IniRead, strQAPconnectFileManagersList, %g_strQAPconnectIniPath%, , , %A_Space% ; list of QAPconnect.ini applications, empty by default
		if StrLen(strQAPconnectFileManagersList)
		{
			strQAPconnectFileManagersList .= "|"
			StringReplace, strQAPconnectFileManagersList, strQAPconnectFileManagersList, `n, |, All
			if StrLen(g_strQAPconnectFileManager)
				StringReplace, strQAPconnectFileManagersList, strQAPconnectFileManagersList, %g_strQAPconnectFileManager%|, %g_strQAPconnectFileManager%||
		}
		GuiControl, , f_drpQAPconnectFileManager, |%strQAPconnectFileManagersList%
	}
	else ; DirectoryOpus or TotalCommander
	{
		if !StrLen(g_bln%strClickedFileManagerSystemNames%UseTabs)
			IniRead, g_bln%strClickedFileManagerSystemNames%UseTabs, %g_strIniFile%, Global, %strClickedFileManagerSystemNames%UseTabs, %A_Space% ; empty if error
		GuiControl, , f_blnFileManagerUseTabs, % (g_bln%strClickedFileManagerSystemNames%UseTabs ? 1 : 0)
	}
	if (f_radActiveFileManager3) ; TotalCommander
		GuiControl, , f_strTotalCommanderWinCmd, %g_strWinCmdIniFile%
}

strClickedFileManagerSystemNames := ""
strHelpUrl := ""
strQAPconnectFileManagersList := ""
strShowHideCommand := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
DisplayIconsClicked:
;------------------------------------------------------------
Gui, 2:Submit, NoHide

strEnableDisableCommand := (f_blnDisplayIcons ? "Enable" : "Disable")

GuiControl, %strEnableDisableCommand%, f_drpIconSizeLabel
GuiControl, %strEnableDisableCommand%, f_drpIconSize
GuiControl, %strEnableDisableCommand%, f_intIconsManageRows
GuiControl, %strEnableDisableCommand%, f_lblIconsManageRows

strEnableDisableCommand := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
PopupMenuPositionClicked:
;------------------------------------------------------------
Gui, 2:Submit, NoHide

strEnableDisableCommand := (f_radPopupMenuPosition3 ? "Enable" : "Disable")

GuiControl, %strEnableDisableCommand%, f_lblPopupFixPositionX
GuiControl, %strEnableDisableCommand%, f_intPopupFixPositionXEdit
GuiControl, %strEnableDisableCommand%, f_intPopupFixPositionX
GuiControl, %strEnableDisableCommand%, f_lblPopupFixPositionY
GuiControl, %strEnableDisableCommand%, f_intPopupFixPositionYEdit
GuiControl, %strEnableDisableCommand%, f_intPopupFixPositionY

strEnableDisableCommand := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
OptionsTitlesSubClicked:
;------------------------------------------------------------
Gui, 2:Submit, NoHide

GuiControl, Choose, f_intOptionsTab, 5

return
;------------------------------------------------------------


;------------------------------------------------------------
ButtonOptionsChangeHotkey1:
ButtonOptionsChangeHotkey2:
ButtonOptionsChangeHotkey3:
ButtonOptionsChangeHotkey4:
;------------------------------------------------------------
Gui, 2:Submit, NoHide

StringReplace, intHotkeyIndex, A_ThisLabel, ButtonOptionsChangeHotkey

if InStr(g_arrPopupHotkeyNames%intHotkeyIndex%, "Mouse")
	intHotkeyType := 1 ; Mouse
else
	intHotkeyType := 2 ; Keyboard

strPopupHotkeysBackup := g_arrPopupHotkeys%intHotkeyIndex%
g_arrPopupHotkeys%intHotkeyIndex% := SelectHotkey(g_arrPopupHotkeys%intHotkeyIndex%, g_arrOptionsPopupHotkeyTitles%intHotkeyIndex%, "", "", intHotkeyType, g_arrPopupHotkeyDefaults%intHotkeyIndex%, g_arrOptionsTitlesSub%intHotkeyIndex%)

if StrLen(g_arrPopupHotkeys%intHotkeyIndex%)
	GuiControl, 2:, f_lblHotkeyText%intHotkeyIndex%, % Hotkey2Text(g_arrPopupHotkeys%intHotkeyIndex%)
else
	g_arrPopupHotkeys%intHotkeyIndex% := strPopupHotkeysBackup
	
strPopupHotkeysBackup := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
ButtonOptionsChangeAlternativeHotkey:
;------------------------------------------------------------
Gui, 2:Submit, NoHide

intAlternativeOrder := A_GuiControl
StringReplace, intAlternativeOrder, intAlternativeOrder, f_lblAlternativeHotkeyText
StringReplace, intAlternativeOrder, intAlternativeOrder, f_btnChangeAlternativeHotkey

strThisAlternativeCode := g_objQAPFeaturesAlternativeCodeByOrder[intAlternativeOrder]
objThisAlternative := g_objQAPFeatures[strThisAlternativeCode]
strAlternativeHotkeysBackup := g_objQAPFeaturesNewHotkeys[strThisAlternativeCode]

g_objQAPFeaturesNewHotkeys[strThisAlternativeCode] := SelectHotkey(objThisAlternative.CurrentHotkey, objThisAlternative.LocalizedName, lDialogHotkeysManageAlternative
	, "", 3, objThisAlternative.DefaultHotkey)
objThisAlternative.CurrentHotkey := g_objQAPFeaturesNewHotkeys[strThisAlternativeCode]

if StrLen(g_objQAPFeaturesNewHotkeys[strThisAlternativeCode])
	GuiControl, 2:, f_lblAlternativeHotkeyText%intAlternativeOrder%, % Hotkey2Text(g_objQAPFeaturesNewHotkeys[strThisAlternativeCode])
else
	g_objQAPFeaturesNewHotkeys[strThisAlternativeCode] := strAlternativeHotkeysBackup

; strPopupHotkeysBackup := ""
intAlternativeOrder := ""
strThisAlternativeCode := ""
strAlternativeHotkeysBackup := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
ChangeFoldersInDialogClicked:
;------------------------------------------------------------
Gui, 2:Submit, NoHide

if !(f_blnChangeFolderInDialog)
	return
GuiControl, 2:, f_blnChangeFolderInDialog, 0

g_intGui2WinID := WinExist("A")

Gui, 3:New, , %lOptionsChangeFolderInDialog%
Gui, 3:+Owner2

if (g_blnUseColors)
	Gui, 3:Color, %g_strGuiWindowColor%
Gui, 3:Font, s10 w700, Verdana
Gui, 3:Add, Text, x10 y10 w400, %lOptionsChangeFolderInDialog%
Gui, 3:Font
Gui, 3:Add, Text, x10 w400, % L(lOptionsChangeFolderInDialogText , Hotkey2Text(g_arrPopupHotkeys3), Hotkey2Text(g_arrPopupHotkeys4), Hotkey2Text(g_arrPopupHotkeys1), Hotkey2Text(g_arrPopupHotkeys2))
Gui, 3:Add, Text, x10 w400, %lOptionsChangeFolderInDialogCheckbox%

Gui, 3:Add, Button, y+25 x10 vf_btnChangeFolderInDialogOK gChangeFoldersInDialogOK, %lDialogOKAmpersand%
Gui, 3:Add, Button, yp x+20 vf_btnChangeFolderInDialogCancel gChangeFoldersInDialogCancel, %lGuiCancelAmpersand%
	
GuiCenterButtons(lOptionsChangeFolderInDialog, 10, 5, 20, "f_btnChangeFolderInDialogOK", "f_btnChangeFolderInDialogCancel")

GuiControl, Focus, f_btnChangeFolderInDialogCancel
Gui, 3:Show, AutoSize Center
Gui, 2:+Disabled

return
;------------------------------------------------------------


;------------------------------------------------------------
ChangeFoldersInDialogOK:
ChangeFoldersInDialogCancel:
;------------------------------------------------------------
Gui, 3:Submit, NoHide

if (A_ThisLabel = "ChangeFoldersInDialogOK")
{
	GuiControl, 2:, f_blnChangeFolderInDialog, 1
	IniWrite, 1, %g_strIniFile%, Global, UnderstandChangeFoldersInDialogRisk
}

Gosub, 3GuiClose

return
;------------------------------------------------------------


;------------------------------------------------------------
EnableExternalMenusCatalogueClicked:
;------------------------------------------------------------
Gui, 2:Submit, NoHide

IniRead, blnExternalMenusCataloguePathReadOnly, %g_strIniFile%, Global, ExternalMenusCataloguePathReadOnly, 0 ; false if not found
strEnableCommand := (blnExternalMenusCataloguePathReadOnly ? "Disable" : "Enable")
GuiControl, 2:%strEnableCommand%, f_blnEnableExternalMenusCatalogue
GuiControl, 2:%strEnableCommand%, f_strExternalMenusCataloguePath
GuiControl, 2:%strEnableCommand%, f_btnExternalMenusCataloguePath

if !(f_blnEnableExternalMenusCatalogue)
	GuiControl, 2:, f_strExternalMenusCataloguePath

strShowHideCommand := (f_blnEnableExternalMenusCatalogue ? "Show" : "Hide")
GuiControl, %strShowHideCommand%, f_lblExternalMenusCataloguePathPrompt
GuiControl, %strShowHideCommand%, f_strExternalMenusCataloguePath
GuiControl, %strShowHideCommand%, f_btnExternalMenusCataloguePath

blnExternalMenusCataloguePathReadOnly := ""
strEnableCommand := ""
strShowHideCommand := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
ButtonExternalMenuSelectCataloguePath:
;------------------------------------------------------------
Gui, 2:Submit, NoHide

FileSelectFolder, strNewExternalMenusCataloguePath, ::{20d04fe0-3aea-1069-a2d8-08002b30309d}, 1, %lOptionsSelectCatalogueRoot%
if !StrLen(strNewExternalMenusCataloguePath)
	return
; else continue

GuiControl, 2:, f_strExternalMenusCataloguePath, %strNewExternalMenusCataloguePath%

strNewExternalMenusCataloguePath := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
ButtonSelectFileManagerPath:
;------------------------------------------------------------
Gui, 2:+OwnDialogs

strActiveFileManagerSystemName := g_arrActiveFileManagerSystemNames%g_intClickedFileManager%
if StrLen(g_str%strActiveFileManagerSystemName%Path)
	strCurrentLocation := g_str%strActiveFileManagerSystemName%Path
else
{
	IniRead, strCurrentLocation, %g_strIniFile%, Global, %strActiveFileManagerSystemName%Path, %A_Space% ; empty if error
	if !StrLen(strCurrentLocation)
		if (g_intClickedFileManager = 2) ; DirectoryOpus
			strCurrentLocation := A_ProgramFiles . "\GPSoftware\Directory Opus\dopus.exe"
		else ; TotalCommander
			strCurrentLocation := GetTotalCommanderPath()
}
FileSelectFile, strNewLocation, 3, %strCurrentLocation%, %lDialogAddFolderSelect%

if !(StrLen(strNewLocation))
	return

GuiControl, 2:, f_strFileManagerPath, %strNewLocation%

strActiveFileManagerSystemName := ""
strCurrentLocation := ""
strNewLocation := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
ButtonSelectTotalCommanderWinCmd:
;------------------------------------------------------------

strCurrentLocation := g_strWinCmdIniFile
if !StrLen(strCurrentLocation)
{
	RegRead, strCurrentLocation, HKEY_CURRENT_USER, Software\Ghisler\Total Commander\, IniFileName
	If !StrLen(strCurrentLocation)
		RegRead, strCurrentLocation, HKEY_LOCAL_MACHINE, Software\Ghisler\Total Commander\, IniFileName
}
FileSelectFile, strNewLocation, 3, %strCurrentLocation%, %lDialogAddFolderSelect%

if !(StrLen(strNewLocation))
	return

GuiControl, 2:, f_strTotalCommanderWinCmd, %strNewLocation%

strCurrentLocation := ""
strNewLocation := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
ButtonOptionsSave:
;------------------------------------------------------------
Gui, 2:Submit, NoHide

g_blnMenuReady := false

;---------------------------------------
; Validation Tab 5: File Managers

strActiveFileManagerDisplayName := g_arrActiveFileManagerDisplayNames%g_intClickedFileManager%

if (g_intClickedFileManager = 4) ; QAPconnect
{
	blnActiveFileManangerOK := StrLen(f_drpQAPconnectFileManager)
	if (blnActiveFileManangerOK)
	{
		g_strQAPconnectFileManager := f_drpQAPconnectFileManager
		Gosub, LoadIniQAPconnectValues ; values are already expanded
		strTempLocation := g_strQAPconnectAppPath ; avoid change in g_strQAPconnectAppPath by FileExistInPath
		blnActiveFileManangerOK := FileExistInPath(strTempLocation) ; return strTempLocation expanded
		if (blnActiveFileManangerOK)
			g_strQAPconnectFileManager := f_drpQAPconnectFileManager
	}
}
else if (g_intClickedFileManager > 1) ; 2 DirectoryOpus or 3 TotalCommander
{
	blnActiveFileManangerOK := StrLen(f_strFileManagerPath)
	if (blnActiveFileManangerOK)
	{
		strTempLocation := f_strFileManagerPath ; avoid change in f_strFileManagerPath by FileExistInPath
		blnActiveFileManangerOK := FileExistInPath(strTempLocation) ; return strTempLocation with expanded relative path and envvars, and absolute location if in PATH
	}
}
if (g_intClickedFileManager > 1 and !blnActiveFileManangerOK)
{
	if (g_intClickedFileManager = 4)
		Oops(lOptionsThirdPartyFileNotFound, f_drpQAPconnectFileManager, g_strQAPconnectAppPath)
	else ; 2 DirectoryOpus or 3 TotalCommander
		if StrLen(f_strFileManagerPath)
			Oops(lOptionsThirdPartyFileNotFound, strActiveFileManagerDisplayName, f_strFileManagerPath)
		else
			Oops(lOptionsThirdPartySelectFile, strActiveFileManagerDisplayName)

	return
}
; from here, we know that we have valid file manager path values

;---------------------------------------
; Save Tab 1: General options

IfExist, %A_Startup%\%g_strAppNameFile%.lnk
	FileDelete, %A_Startup%\%g_strAppNameFile%.lnk
if (f_blnOptionsRunAtStartup)
	FileCreateShortcut, %A_ScriptFullPath%, %A_Startup%\%g_strAppNameFile%.lnk, %A_WorkingDir%
Menu, Tray, % f_blnOptionsRunAtStartup ? "Check" : "Uncheck", %lMenuRunAtStartupAmpersand%

g_blnAddAutoAtTop := f_blnAddAutoAtTop
IniWrite, %g_blnAddAutoAtTop%, %g_strIniFile%, Global, AddAutoAtTop
g_blnDisplayTrayTip := f_blnDisplayTrayTip
IniWrite, %g_blnDisplayTrayTip%, %g_strIniFile%, Global, DisplayTrayTip
g_blnChangeFolderInDialog := f_blnChangeFolderInDialog
IniWrite, %g_blnChangeFolderInDialog%, %g_strIniFile%, Global, ChangeFolderInDialog
g_blnCheck4Update := f_blnCheck4Update
IniWrite, %g_blnCheck4Update%, %g_strIniFile%, Global, Check4Update
g_blnRememberSettingsPosition := f_blnRememberSettingsPosition
IniWrite, %g_blnRememberSettingsPosition%, %g_strIniFile%, Global, RememberSettingsPosition

strLanguageCodePrev := g_strLanguageCode
g_strLanguageLabel := f_drpLanguage
loop, %g_arrOptionsLanguageLabels0%
	if (g_arrOptionsLanguageLabels%A_Index% = g_strLanguageLabel)
		{
			g_strLanguageCode := g_arrOptionsLanguageCodes%A_Index%
			break
		}
IniWrite, %g_strLanguageCode%, %g_strIniFile%, Global, LanguageCode

strThemePrev := g_strTheme
g_strTheme := f_drpTheme
IniWrite, %g_strTheme%, %g_strIniFile%, Global, Theme

g_strExternalMenusCataloguePath := f_strExternalMenusCataloguePath
IniWrite, %g_strExternalMenusCataloguePath%, %g_strIniFile%, Global, ExternalMenusCataloguePath

g_blnSnippetDefaultProcessEOLTab := f_blnSnippetDefaultProcessEOLTab
IniWrite, %g_blnSnippetDefaultProcessEOLTab%, %g_strIniFile%, Global, SnippetDefaultProcessEOLTab
g_blnSnippetDefaultFixedFont := f_blnSnippetDefaultFixedFont
IniWrite, %g_blnSnippetDefaultFixedFont%, %g_strIniFile%, Global, SnippetDefaultFixedFont
g_intSnippetDefaultFontSize := f_intSnippetDefaultFontSize
IniWrite, %g_intSnippetDefaultFontSize%, %g_strIniFile%, Global, SnippetDefaultFontSize
g_blnSnippetDefaultMacro := f_blnSnippetDefaultMacro
IniWrite, %g_blnSnippetDefaultMacro%, %g_strIniFile%, Global, SnippetDefaultMacro

; UseClassicButtons deprecated in v8.1.1 (still supported if present in ini file)
; strUseClassicButtonsPrev := g_blnUseClassicButtons
; g_blnUseClassicButtons := f_blnUseClassicButtons
; IniWrite, %g_blnUseClassicButtons%, %g_strIniFile%, Global, UseClassicButtons

;---------------------------------------
; Save Tab 2: Menu options

if !(g_blnPortableMode)
{
	if (f_blnExplorerContextMenus) and (!g_blnExplorerContextMenus)
		gosub, EnableExplorerContextMenus
		; else already enabled
	if (!f_blnExplorerContextMenus) and (g_blnExplorerContextMenus)
		gosub, DisableExplorerContextMenus
		; else already disabled
	g_blnExplorerContextMenus := f_blnExplorerContextMenus
	IniWrite, %g_blnExplorerContextMenus%, %g_strIniFile%, Global, ExplorerContextMenus
}

g_intRecentFoldersMax := f_intRecentFoldersMax
IniWrite, %g_intRecentFoldersMax%, %g_strIniFile%, Global, RecentFoldersMax
g_blnDisplayIcons := f_blnDisplayIcons
IniWrite, %g_blnDisplayIcons%, %g_strIniFile%, Global, DisplayIcons
g_blnDisplayNumericShortcuts := f_blnDisplayNumericShortcuts
IniWrite, %g_blnDisplayNumericShortcuts%, %g_strIniFile%, Global, DisplayMenuShortcuts
g_blnOpenMenuOnTaskbar := f_blnOpenMenuOnTaskbar
IniWrite, %g_blnOpenMenuOnTaskbar%, %g_strIniFile%, Global, OpenMenuOnTaskbar
g_blnAddCloseToDynamicMenus := f_blnAddCloseToDynamicMenus
IniWrite, %g_blnAddCloseToDynamicMenus%, %g_strIniFile%, Global, AddCloseToDynamicMenus

if (f_radPopupMenuPosition1)
	g_intPopupMenuPosition := 1
else if (f_radPopupMenuPosition2)
	g_intPopupMenuPosition := 2
else
	g_intPopupMenuPosition := 3
IniWrite, %g_intPopupMenuPosition%, %g_strIniFile%, Global, PopupMenuPosition

g_arrPopupFixPosition1 := f_intPopupFixPositionX
g_arrPopupFixPosition2 := f_intPopupFixPositionY
IniWrite, %g_arrPopupFixPosition1%`,%g_arrPopupFixPosition2%, %g_strIniFile%, Global, PopupFixPosition

if (f_radHotkeyReminders1)
	g_intHotkeyReminders := 1
else if (f_radHotkeyReminders2)
	g_intHotkeyReminders := 2
else
	g_intHotkeyReminders := 3
IniWrite, %g_intHotkeyReminders%, %g_strIniFile%, Global, HotkeyReminders

g_intIconSize := f_drpIconSize
IniWrite, %g_intIconSize%, %g_strIniFile%, Global, IconSize

g_intIconsManageRowsSettings := f_intIconsManageRowsSettings
IniWrite, %g_intIconsManageRowsSettings%, %g_strIniFile%, Global, IconsManageRows

;---------------------------------------
; Save Tab 3: Popup menu hotkeys

loop, % g_arrPopupHotkeyNames0
	if (g_arrPopupHotkeys%A_Index% = "None") ; do not compare with lOptionsMouseNone because it is translated
		IniWrite, None, %g_strIniFile%, Global, % g_arrPopupHotkeyNames%A_Index% ; do not write lOptionsMouseNone because it is translated
	else
		IniWrite, % g_arrPopupHotkeys%A_Index%, %g_strIniFile%, Global, % g_arrPopupHotkeyNames%A_Index%

;---------------------------------------
; Save Tab 4: Alternative menu hotkeys

IniDelete, %g_strIniFile%, AlternativeMenuHotkeys
for strThisAlternativeCode, strNewHotkey in g_objQAPFeaturesNewHotkeys
	if HasHotkey(strNewHotkey)
		IniWrite, %strNewHotkey%, %g_strIniFile%, AlternativeMenuHotkeys, %strThisAlternativeCode%
	else
		IniDelete, %g_strIniFile%, AlternativeMenuHotkeys, %strThisAlternativeCode%

g_blnLeftControlDoublePressed := f_blnLeftControlDoublePressed
IniWrite, %g_blnLeftControlDoublePressed%, %g_strIniFile%, Global, LeftControlDoublePressed
g_blnRightControlDoublePressed := f_blnRightControlDoublePressed
IniWrite, %g_blnRightControlDoublePressed%, %g_strIniFile%, Global, RightControlDoublePressed

; After Save Tab 3: Popup menu hotkeys and Save Tab 4: Alternative menu hotkeys
Gosub, LoadIniPopupHotkeys ; reload from ini file and re-enable popup hotkeys

;---------------------------------------
; Save Tab 5: Exclusion list

strExclusionCleanup := ReplaceAllInString(f_strExclusionMouseList, "`n", "|")
g_strExclusionMouseList := ""
Loop, Parse, strExclusionCleanup, |
	if StrLen(A_LoopField)
		g_strExclusionMouseList .= Trim(A_LoopField) . "|"
StringTrimRight, g_strExclusionMouseList, g_strExclusionMouseList, 1 ; remove last |
IniWrite, %g_strExclusionMouseList%, %g_strIniFile%, Global, ExclusionMouseList
SplitExclusionList(g_strExclusionMouseList, g_strExclusionMouseListApp, g_strExclusionMouseListDialog)

;---------------------------------------
; Save Tab 6: File Managers

g_intActiveFileManager := g_intClickedFileManager
IniWrite, %g_intActiveFileManager%, %g_strIniFile%, Global, ActiveFileManager
	
strActiveFileManagerSystemName := g_arrActiveFileManagerSystemNames%g_intActiveFileManager%
; strActiveFileManagerDisplayName define during validation earlier

if (g_intActiveFileManager = 4) ; QAPconnect
	IniWrite, %g_strQAPconnectFileManager%, %g_strIniFile%, Global, QAPconnectFileManager
else if (g_intActiveFileManager > 1) ; 2 DirectoryOpus or 3 TotalCommander
{
	g_str%strActiveFileManagerSystemName%PathBeforeEnvVars := f_strFileManagerPath
	g_str%strActiveFileManagerSystemName%Path := EnvVars(f_strFileManagerPath)
	IniWrite, % g_str%strActiveFileManagerSystemName%PathBeforeEnvVars, %g_strIniFile%, Global, %strActiveFileManagerSystemName%Path
	
	g_bln%strActiveFileManagerSystemName%UseTabs := f_blnFileManagerUseTabs
	IniWrite, % g_bln%strActiveFileManagerSystemName%UseTabs, %g_strIniFile%, Global, %strActiveFileManagerSystemName%UseTabs
	if (g_intActiveFileManager = 2) ; DirectoryOpus
		if (g_blnDirectoryOpusUseTabs)
			g_strDirectoryOpusNewTabOrWindow := "NEWTAB" ; open new folder in a new lister tab
		else
			g_strDirectoryOpusNewTabOrWindow := "NEW" ; open new folder in a new DOpus lister (instance)
	else ; TotalCommander
	{
		if (g_blnTotalCommanderUseTabs)
			g_strTotalCommanderNewTabOrWindow := "/O /T" ; open new folder in a new tab
		else
			g_strTotalCommanderNewTabOrWindow := "/N" ; open new folder in a new window (TC instance)
		
		IniWrite, %f_strTotalCommanderWinCmd%, %g_strIniFile%, Global, TotalCommanderWinCmd
		g_strWinCmdIniFile := f_strTotalCommanderWinCmd
		g_strWinCmdIniFileExpanded := EnvVars(g_strWinCmdIniFile)
		g_blnWinCmdIniFileExist := StrLen(g_strWinCmdIniFileExpanded) and FileExist(g_strWinCmdIniFileExpanded) ; TotalCommander settings file exists
	}
	IniWrite, % g_str%strActiveFileManagerSystemName%NewTabOrWindow, %g_strIniFile%, Global, %strActiveFileManagerSystemName%NewTabOrWindow
}
if (g_intActiveFileManager > 1) ; 2 DirectoryOpus, 3 TotalCommander or 4 QAPconnect
	Gosub, SetActiveFileManager

;---------------------------------------
; End of tabs

; if language or theme changed, offer to restart the app
if (strLanguageCodePrev <> g_strLanguageCode) or (strThemePrev <> g_strTheme)
{
	if (strLanguageCodePrev <> g_strLanguageCode)
	{
		StringReplace, strOptionNoAmpersand, lOptionsLanguage, &
		strValue := g_strLanguageLabel
	}
	else ; (strThemePrev <> g_strTheme)
	{
		StringReplace, strOptionNoAmpersand, lOptionsTheme, &
		strValue := g_strTheme
	}
	MsgBox, 52, %g_strAppNameText%, % L(lReloadPrompt, strOptionNoAmpersand, """" . strValue . """", g_strAppNameText)
	IfMsgBox, Yes
		Gosub, ReloadQAP
}	

; rebuild Folders menus w/ or w/o optional folders and shortcuts
for strMenuName, arrMenu in g_objMenusIndex
{
	Menu, %strMenuName%, Add
	Menu, %strMenuName%, DeleteAll
	arrMenu := "" ; free object's memory
}
Gosub, BuildMainMenuWithStatus
Gosub, BuildAlternativeMenu

; and rebuild dynamic menus
Gosub, RefreshClipboardMenu
Gosub, RefreshDrivesMenu
Gosub, RefreshRecentFoldersMenu
Gosub, RefreshSwitchFolderOrAppMenu
Gosub, RefreshTotalCommanderHotlist

/*
if (g_blnDiagMode)
{
	Diag("Save Options: Recent/Drives/Clipboard/Switch", g_intRecentFoldersMenuTickCount . "`t" . g_intDrivesMenuTickCount . "`t" . g_intClipboardMenuTickCount . "`t" . g_intSwitchReopenMenuTickCount)
	; TrayTip, Recent/Drives/Clipboard/Switch menus refresh, % g_intRecentFoldersMenuTickCount . " ms + " . g_intDrivesMenuTickCount . " ms + " . g_intClipboardMenuTickCount . " ms + " . g_intSwitchReopenMenuTickCount
	;	. " = " . g_intRecentFoldersMenuTickCount + g_intDrivesMenuTickCount + g_intClipboardMenuTickCount + g_intSwitchReopenMenuTickCount . " ms"
}
*/

Gosub, 2GuiClose

g_blnMenuReady := true

strLanguageCodePrev := ""
strThemePrev := ""
strActiveFileManagerSystemName := ""
strActiveFileManagerDisplayName := ""
blnActiveFileManangerOK := ""
strExclusionCleanup := ""
strTempLocation := ""
strOptionNoAmpersand := ""
strValue := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
ButtonOptionsCancel:
;------------------------------------------------------------

loop, 4
	g_arrPopupHotkeys%A_Index% := g_arrPopupHotkeysPrevious%A_Index% ; revert to previous content of g_arrPopupHotkeys

Gosub, 2GuiClose

return
;------------------------------------------------------------


;------------------------------------------------------------
EnableExplorerContextMenus:
DisableExplorerContextMenus:
;------------------------------------------------------------

StringReplace, strQAPPathDoubleBackslash, A_ScriptDir, \, \\, All

if (A_ThisLabel = "EnableExplorerContextMenus")
{
	FileDelete, %g_strTempDir%\enable-qap-context-menus.reg
	FileAppend,
		(LTrim Join`r`n
			Windows Registry Editor Version 5.00

			; Add context menus for Quick Access Popup
			; For more information:
			; http://www.quickaccesspopup.com/explorer-context-menus-help/

			;--------------------------------------
			; ADD FILE
			;--------------------------------------
			[HKEY_CLASSES_ROOT\*\shell\Add File to Quick Access Popup menu]
			@="%lContextAddFile%"
			"Icon"="\"%strQAPPathDoubleBackslash%\\QuickAccessPopup.ico\""

			[HKEY_CLASSES_ROOT\*\shell\Add File to Quick Access Popup menu\command]
			@="\"%strQAPPathDoubleBackslash%\\QAPmessenger.exe\" AddFile \"`%1\""
			;--------------------------------------


			;--------------------------------------
			; ADD FILE EXPRESS
			;--------------------------------------
			[HKEY_CLASSES_ROOT\*\shell\Add File to Quick Access Popup menu Express]
			@="%lContextAddFileXpress%"
			"Icon"="\"%strQAPPathDoubleBackslash%\\QuickAccessPopup.ico\""
			"Extended"=""

			[HKEY_CLASSES_ROOT\*\shell\Add File to Quick Access Popup menu Express\command]
			@="\"%strQAPPathDoubleBackslash%\\QAPmessenger.exe\" AddFileXpress \"`%1\""


			;--------------------------------------
			; ADD FOLDER
			;--------------------------------------
			[HKEY_CLASSES_ROOT\Folder\shell\Add Folder to Quick Access Popup menu]
			@="%lContextAddFolder%"
			"Icon"="\"%strQAPPathDoubleBackslash%\\QuickAccessPopup.ico\""

			[HKEY_CLASSES_ROOT\Folder\shell\Add Folder to Quick Access Popup menu\command]
			@="\"%strQAPPathDoubleBackslash%\\QAPmessenger.exe\" AddFolder \"`%1\""
			;--------------------------------------


			;--------------------------------------
			; ADD FOLDER EXPRESS
			;--------------------------------------
			[HKEY_CLASSES_ROOT\Folder\shell\Add Folder to Quick Access Popup menu Express]
			@="%lContextAddFolderXpress%"
			"Icon"="\"%strQAPPathDoubleBackslash%\\QuickAccessPopup.ico\""
			"Extended"=""

			[HKEY_CLASSES_ROOT\Folder\shell\Add Folder to Quick Access Popup menu Express\command]
			@="\"%strQAPPathDoubleBackslash%\\QAPmessenger.exe\" AddFolderXpress \"`%1\""
			;--------------------------------------


			;--------------------------------------
			; DESKTOP SHOW MENU 
			;--------------------------------------
			[HKEY_CLASSES_ROOT\DesktopBackground\Shell\Show Quick Access Popup menu]
			@="%lContextShowMenu%"
			"Icon"="\"%strQAPPathDoubleBackslash%\\QuickAccessPopup.ico\""

			[HKEY_CLASSES_ROOT\DesktopBackground\Shell\Show Quick Access Popup menu\command]
			@="\"%strQAPPathDoubleBackslash%\\QAPmessenger.exe\" ShowMenuLaunch"
			;--------------------------------------


			;--------------------------------------
			; DESKTOP SHOW ALTERNATIVE MENU
			;--------------------------------------
			[HKEY_CLASSES_ROOT\DesktopBackground\Shell\Show Quick Access Popup Alternative menu]
			@="%lContextShowMenuAlternative%"
			"Icon"="\"%strQAPPathDoubleBackslash%\\QuickAccessPopup.ico\""
			"Extended"=""

			[HKEY_CLASSES_ROOT\DesktopBackground\Shell\Show Quick Access Popup Alternative menu\command]
			@="\"%strQAPPathDoubleBackslash%\\QAPmessenger.exe\" ShowMenuAlternative"
			;--------------------------------------


			;--------------------------------------
			; FOLDER BACKGROUND SHOW MENU
			;--------------------------------------
			[HKEY_CLASSES_ROOT\Directory\Background\shell\Show Quick Access Popup menu]
			@="%lContextShowMenu%"
			"Icon"="\"%strQAPPathDoubleBackslash%\\QuickAccessPopup.ico\""

			[HKEY_CLASSES_ROOT\Directory\Background\shell\Show Quick Access Popup menu\command]
			@="\"%strQAPPathDoubleBackslash%\\QAPmessenger.exe\" ShowMenuNavigate"
			;--------------------------------------


			;--------------------------------------
			; FOLDER BACKGROUND SHOW ALTERNATIVE MENU
			;--------------------------------------
			[HKEY_CLASSES_ROOT\Directory\Background\shell\Show Quick Access Popup Alternative menu]
			@="%lContextShowMenuAlternative%"
			"Icon"="\"%strQAPPathDoubleBackslash%\\QuickAccessPopup.ico\""
			"Extended"=""

			[HKEY_CLASSES_ROOT\Directory\Background\shell\Show Quick Access Popup Alternative menu\command]
			@="\"%strQAPPathDoubleBackslash%\\QAPmessenger.exe\" ShowMenuAlternative"
			;--------------------------------------


			;--------------------------------------
			; FOLDER BACKGROUND ADD FOLDER
			;--------------------------------------
			[HKEY_CLASSES_ROOT\Directory\Background\shell\Add Folder to Quick Access Popup menu]
			@="%lContextAddFolder%"
			"Icon"="\"%strQAPPathDoubleBackslash%\\QuickAccessPopup.ico\""

			[HKEY_CLASSES_ROOT\Directory\Background\shell\Add Folder to Quick Access Popup menu\command]
			@="\"%strQAPPathDoubleBackslash%\\QAPmessenger.exe\" AddFolder \"`%V\""
			;--------------------------------------


			;--------------------------------------
			; FOLDER BACKGROUND ADD FOLDER EXPRESS
			;--------------------------------------
			[HKEY_CLASSES_ROOT\Directory\Background\shell\Add Folder to Quick Access Popup menu Express]
			@="%lContextAddFolderXpress%"
			"Icon"="\"%strQAPPathDoubleBackslash%\\QuickAccessPopup.ico\""
			"Extended"=""

			[HKEY_CLASSES_ROOT\Directory\Background\shell\Add Folder to Quick Access Popup menu Express\command]
			@="\"%strQAPPathDoubleBackslash%\\QAPmessenger.exe\" AddFolderXpress \"`%V\""
			;--------------------------------------

)
		, %g_strTempDir%\enable-qap-context-menus.reg
		
		; blnMainGuiWasActive := WinActive(L(lGuiTitle, g_strAppNameText, g_strAppVersion)) ; main Gui title
		blnOptionsGuiWasActive := WinActive(L(lOptionsGuiTitle, g_strAppNameText, g_strAppVersion)) ; main Gui title
		if (blnOptionsGuiWasActive)
			WinMinimize, % L(lOptionsGuiTitle, g_strAppNameText, g_strAppVersion)
		RunWait, %g_strTempDir%\enable-qap-context-menus.reg
		if (blnOptionsGuiWasActive)
			WinActivate, % L(lOptionsGuiTitle, g_strAppNameText, g_strAppVersion)
}
else ; DisableExplorerContextMenus
{
	FileDelete, %g_strTempDir%\disable-qap-context-menus.bat
	FileAppend,
		(LTrim Join`r`n
			:: BATCH START - DELETE QUICK ACCESS POPUP REGISTRY KEYS
			:: http://www.quickaccesspopup.com/explorer-context-menus-help/
			REG DELETE "HKEY_CLASSES_ROOT\*\shell\Add File to Quick Access Popup menu" /f
			REG DELETE "HKEY_CLASSES_ROOT\*\shell\Add File to Quick Access Popup menu Express" /f
			REG DELETE "HKEY_CLASSES_ROOT\DesktopBackground\Shell\Show Quick Access Popup menu" /f
			REG DELETE "HKEY_CLASSES_ROOT\DesktopBackground\Shell\Show Quick Access Popup Alternative menu" /f
			REG DELETE "HKEY_CLASSES_ROOT\Directory\Background\shell\Add Folder to Quick Access Popup menu" /f
			REG DELETE "HKEY_CLASSES_ROOT\Directory\Background\shell\Add Folder to Quick Access Popup menu Express" /f
			REG DELETE "HKEY_CLASSES_ROOT\Directory\Background\shell\Show Quick Access Popup menu" /f
			REG DELETE "HKEY_CLASSES_ROOT\Directory\Background\shell\Show Quick Access Popup Alternative menu" /f
			REG DELETE "HKEY_CLASSES_ROOT\Folder\shell\Add Folder to Quick Access Popup menu" /f
			REG DELETE "HKEY_CLASSES_ROOT\Folder\shell\Add Folder to Quick Access Popup menu Express" /f
			:: BATCH END

)
		, %g_strTempDir%\disable-qap-context-menus.bat

		; blnMainGuiWasActive := WinActive(L(lGuiTitle, g_strAppNameText, g_strAppVersion)) ; main Gui title
		blnOptionsGuiWasActive := WinActive(L(lOptionsGuiTitle, g_strAppNameText, g_strAppVersion)) ; main Gui title
		if (blnOptionsGuiWasActive)
			WinMinimize, % L(lOptionsGuiTitle, g_strAppNameText, g_strAppVersion)
		RunWait, *RunAs %g_strTempDir%\disable-qap-context-menus.bat
		if (blnOptionsGuiWasActive)
			WinActivate, % L(lOptionsGuiTitle, g_strAppNameText, g_strAppVersion)
}

; blnMainGuiWasActive := ""
blnOptionsGuiWasActive := ""
strQAPPathDoubleBackslash := ""

return
;------------------------------------------------------------



;========================================================================================================================
; END OF OPTIONS
;========================================================================================================================


;========================================================================================================================
!_030_FAVORITES_LIST:
;========================================================================================================================

;------------------------------------------------------------
BuildGui:
;------------------------------------------------------------

IniRead, strTextColor, %g_strIniFile%, Gui-%g_strTheme%, TextColor, 000000
IniRead, g_strGuiListviewBackgroundColor, %g_strIniFile%, Gui-%g_strTheme%, ListviewBackground, FFFFFF
IniRead, g_strGuiListviewTextColor, %g_strIniFile%, Gui-%g_strTheme%, ListviewText, 000000

g_strGuiFullTitle := L(lGuiTitle, g_strAppNameText, g_strAppVersion)
Gui, 1:New, +Resize -MinimizeBox +MinSize636x558, %g_strGuiFullTitle%

Gui, +LastFound
g_strAppHwnd := WinExist()

if (g_blnUseColors)
	Gui, 1:Color, %g_strGuiWindowColor%

strSettingsIconsExtension := (g_blnUseClassicButtons ? ".png" : "_c.png")

; Order of controls important to avoid drawgins gliches when resizing

Gui, 1:Font, % "s12 w700 " . (g_blnUseColors ? "c" . strTextColor : ""), Verdana
Gui, 1:Add, Text, vf_lblAppName x0 y0, % g_strAppNameText . " " . g_strAppVersion . (StrLen(g_strUserBanner) ? " " . g_strUserBanner : "") ; Static1
Gui, 1:Font, s9 w400, Verdana
Gui, 1:Add, Link, vf_lblAppTagLine, %lAppTagline% ; SysLink1

Gui, 1:Add, Picture, vf_picGuiAddFavorite gGuiAddFavoriteSelectType, %g_strTempDir%\add_property-48%strSettingsIconsExtension% ; Static2
Gui, 1:Add, Picture, vf_picGuiEditFavorite gGuiEditFavorite x+1 yp, %g_strTempDir%\edit_property-48%strSettingsIconsExtension% ; Static3
Gui, 1:Add, Picture, vf_picGuiRemoveFavorite gGuiRemoveFavorite x+1 yp, %g_strTempDir%\delete_property-48%strSettingsIconsExtension% ; Static4
Gui, 1:Add, Picture, vf_picGuiCopyFavorite gGuiCopyFavorite x+1 yp, %g_strTempDir%\copy-48%strSettingsIconsExtension% ; Static5
Gui, 1:Add, Picture, vf_picGuiHotkeysManage gGuiHotkeysManage x+1 yp, %g_strTempDir%\keyboard-48%strSettingsIconsExtension% ; Static6
Gui, 1:Add, Picture, vf_picGuiOptions gGuiOptions x+1 yp, %g_strTempDir%\settings-32%strSettingsIconsExtension% ; Static7
Gui, 1:Add, Picture, vf_picPreviousMenu gGuiGotoPreviousMenu hidden x+1 yp, %g_strTempDir%\left-12%strSettingsIconsExtension% ; Static8
g_objToolTipsMessages["Static8"] := lControlToolTipPreviousMenu
Gui, 1:Add, Picture, vf_picUpMenu gGuiGotoUpMenu hidden x+1 yp, %g_strTempDir%\up-12%strSettingsIconsExtension% ; Static9
g_objToolTipsMessages["Static9"] := lControlToolTipParentMenu
Gui, 1:Add, Picture, vf_picMoveFavoriteUp gGuiMoveFavoriteUp x+1 yp, %g_strTempDir%\up_circular-26%strSettingsIconsExtension% ; Static10
g_objToolTipsMessages["Static10"] := lControlToolTipMoveUp
Gui, 1:Add, Picture, vf_picMoveFavoriteDown gGuiMoveFavoriteDown x+1 yp, %g_strTempDir%\down_circular-26%strSettingsIconsExtension% ; Static11
g_objToolTipsMessages["Static11"] := lControlToolTipMoveDown
Gui, 1:Add, Picture, vf_picAddSeparator gGuiAddSeparator x+1 yp, %g_strTempDir%\separator-26%strSettingsIconsExtension% ; Static12
g_objToolTipsMessages["Static12"] := lControlToolTipSeparator
Gui, 1:Add, Picture, vf_picAddColumnBreak gGuiAddColumnBreak x+1 yp, %g_strTempDir%\column-26%strSettingsIconsExtension% ; Static13
g_objToolTipsMessages["Static13"] := lControlToolTipColunmnBreak
Gui, 1:Add, Picture, vf_picGuiAlwaysOnTopOn gGuiAlwaysOnTop hidden x+1 yp, %g_strTempDir%\QAP-pin-on-26%strSettingsIconsExtension% ; Static14
g_objToolTipsMessages["Static14"] := lControlToolTipAlwaysOnTopOn
Gui, 1:Add, Picture, vf_picGuiAlwaysOnTopOff gGuiAlwaysOnTop x+1 yp, %g_strTempDir%\QAP-pin-off-26%strSettingsIconsExtension% ; Static15
g_objToolTipsMessages["Static15"] := lControlToolTipAlwaysOnTopOff
Gui, 1:Add, Picture, vf_picGuiAbout gGuiAbout x+1 yp, %g_strTempDir%\about-32%strSettingsIconsExtension% ; Static16
Gui, 1:Add, Picture, vf_picGuiHelp gGuiHelp x+1 yp, %g_strTempDir%\help-32%strSettingsIconsExtension% ; Static17
Gui, 1:Add, Picture, vf_picGuiIconsManage gGuiIconsManage x+1 yp, %g_strTempDir%\details-48%strSettingsIconsExtension% ; Static18

Gui, 1:Font, s8 w400, Arial ; button legend
Gui, 1:Add, Text, vf_lblGuiOptions gGuiOptions x0 y+20, %lGuiOptions% ; Static19
Gui, 1:Add, Text, vf_lblGuiAddFavorite center gGuiAddFavoriteSelectType x+1 yp, %lGuiAddFavorite% ; Static20
Gui, 1:Add, Text, vf_lblGuiEditFavorite center gGuiEditFavorite x+1 yp w88, %lGuiEditFavorite% ; Static21, w88 to make room fot when multiple favorites are selected
Gui, 1:Add, Text, vf_lblGuiRemoveFavorite center gGuiRemoveFavorite x+1 yp w88, %lGuiRemoveFavorite% ; Static22
Gui, 1:Add, Text, vf_lblGuiCopyFavorite center gGuiCopyFavorite x+1 yp, %lDialogCopy% ; Static23
Gui, 1:Add, Text, vf_lblGuiHotkeysManage center gGuiHotkeysManage x+1 yp, %lDialogHotkeys% ; Static24
Gui, 1:Add, Text, vf_lblGuiIconsManage center gGuiIconsManage x+1 yp, %lDialogIconsManage% ; Static25
Gui, 1:Add, Text, vf_lblGuiAbout center gGuiAbout x+1 yp, %lGuiAbout% ; Static26
Gui, 1:Add, Text, vf_lblGuiHelp center gGuiHelp x+1 yp, %lGuiHelp% ; Static27

Gui, 1:Font, s8 w400 italic, Verdana
Gui, 1:Add, Link, vf_lnkGuiHotkeysHelpClicked gGuiHotkeysHelpClicked x0 y+1, <a>%lGuiHotkeysHelp%</a> ; SysLink2 center option not working SysLink1
Gui, 1:Add, Link, vf_lnkGuiDropHelpClicked gGuiDropFilesHelpClicked right x+1 yp, <a>%lGuiDropFilesHelp%</a> ; SysLink3

Gui, 1:Font, s8 w400 normal, Verdana
Gui, 1:Add, Text, vf_lblSubmenuDropdownLabel x+1 yp, %lGuiSubmenuDropdownLabel% ; Static28
Gui, 1:Add, DropDownList, vf_drpMenusList gGuiMenusListChanged x0 y+1 ; ComboBox1

Gui, 1:Add, Edit, vf_strFavoritesListFilter r1 gLoadFavoritesInGuiFiltered, %lDialogSearch% ; Edit1
Gui, 1:Add, Button, vf_btnFavoritesListNoFilter gGuiFavoritesListFilterEmpty x+10 yp w20 h20, X ; Button1
Gui, 1:Add, ListView
	, % "vf_lvFavoritesList Count32 AltSubmit NoSortHdr LV0x10 " . (g_blnUseColors ? "c" . g_strGuiListviewTextColor . " Background" . g_strGuiListviewBackgroundColor : "") . " gGuiFavoritesListEvents x+1 yp"
	, %lGuiLvFavoritesHeader% ; SysHeader321 / SysListView321
Gui, 1:Add, ListView
	, % "vf_lvFavoritesListFiltered Count32 AltSubmit NoSortHdr LV0x10 -Multi hidden " . (g_blnUseColors ? "c" . g_strGuiListviewTextColor . " Background" . g_strGuiListviewBackgroundColor : "") . " gGuiFavoritesListFilteredEvents x+1 yp"
	, %lGuiLvFavoritesHeaderFiltered%|Object Position (hidden) ; SysHeader321 / SysListView321


Gui, 1:Font, s8 w600, Verdana
Gui, 1:Add, Button, vf_btnGuiSaveAndCloseFavorites Disabled Default gGuiSaveAndCloseFavorites x200 y400 w100 h50, %lGuiSaveAndCloseAmpersand% ; Button2
Gui, 1:Add, Button, vf_btnGuiSaveAndStayFavorites Disabled gGuiSaveAndStayFavorites x350 yp w100 h50, %lGuiSaveAndStayAmpersand% ; Button3
Gui, 1:Add, Button, vf_btnGuiCancel gGuiCancel x500 yp w100 h50, %lGuiCloseAmpersand% ; Close until changes occur - Button4

if !(g_blnDonor)
{
	strDonateButtons := "thumbs_up|solutions|handshake|conference|gift"
	StringSplit, arrDonateButtons, strDonateButtons, |
	Random, intDonateButton, 1, 5

	Gui, 1:Add, Picture, vf_picGuiDonate gGuiDonate x0 y+1, % g_strTempDir . "\" . arrDonateButtons%intDonateButton% . "-32" . strSettingsIconsExtension ; Static29
	Gui, 1:Font, s8 w400, Arial ; button legend
	Gui, 1:Add, Text, vf_lblGuiDonate center gGuiDonate x0 y+1, %lGuiDonate% ; Static30
}

IniRead, strSettingsPosition, %g_strIniFile%, Global, SettingsPosition, -1 ; center at minimal size
StringSplit, arrSettingsPosition, strSettingsPosition, |

; Diag(A_ThisLabel, "Hide")
Gui, 1:Show, % "Hide "
	. (arrSettingsPosition1 = -1 or arrSettingsPosition1 = "" or arrSettingsPosition2 = ""
	? "center w636 h538"
	: "x" . arrSettingsPosition1 . " y" . arrSettingsPosition2)
sleep, 100
if (arrSettingsPosition1 <> -1)
	WinMove, ahk_id %g_strAppHwnd%, , , , %arrSettingsPosition3%, %arrSettingsPosition4%

strSettingsPosition := ""
arrSettingsPosition := ""
strTextColor := ""
strSettingsIconsExtension := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
LoadMenuInGui:
LoadMenuInGuiFromAlternative:
LoadMenuInGuiFromGuiSearch:
;------------------------------------------------------------

Gui, 1:ListView, f_lvFavoritesList
LV_Delete()

Loop, % g_objMenuInGui.MaxIndex()
{
	strThisType := GetFavoriteTypeForList(g_objMenuInGui[A_Index])
	strThisHotkey := Hotkey2Text(g_objHotkeysByNameLocation[(g_objMenuInGui[A_Index].FavoriteType = "QAP" ? "" : g_objMenuInGui[A_Index].FavoriteName) 
		. "|" . g_objMenuInGui[A_Index].FavoriteLocation])
	
	if InStr("Menu|Group|External", g_objMenuInGui[A_Index].FavoriteType, true) ; this is a menu, a group or an external menu
	{
		if (g_objMenuInGui[A_Index].FavoriteType = "Menu")
			strGuiMenuLocation := g_strMenuPathSeparator
		else if (g_objMenuInGui[A_Index].FavoriteType = "Group")
			strGuiMenuLocation := " " . g_strGroupIndicatorPrefix . g_strGroupIndicatorSuffix
		else ; g_objMenuInGui[A_Index].FavoriteType = "External"
		{
			if ExternalMenuIsReadOnly(g_objMenuInGui[A_Index].SubMenu.MenuExternalPath)
				strGuiMenuLocation := lDialogReadOnly . " "
			else if !(g_objMenuInGui[A_Index].SubMenu.MenuLoaded)
				strGuiMenuLocation := lOopsErrorIniFileUnavailable . " "
			else
				strGuiMenuLocation := ""
			strGuiMenuLocation .= g_strMenuPathSeparator . g_strMenuPathSeparator . " " . g_objMenuInGui[A_Index].SubMenu.MenuExternalPath
		}
		
		LV_Add(, g_objMenuInGui[A_Index].FavoriteName, strThisType, strThisHotkey, strGuiMenuLocation)
	}
	else if (g_objMenuInGui[A_Index].FavoriteType = "X") ; this is a separator
		LV_Add(, g_strGuiMenuSeparator, g_strGuiMenuSeparatorShort, "", g_strGuiMenuSeparator . g_strGuiMenuSeparator)
	
	else if (g_objMenuInGui[A_Index].FavoriteType = "K") ; this is a column break
		LV_Add(, g_strGuiDoubleLine . " " . lMenuColumnBreak . " " . g_strGuiDoubleLine
		, g_strGuiDoubleLine, "", g_strGuiDoubleLine . " " . lMenuColumnBreak . " " . g_strGuiDoubleLine)
		
	else if (g_objMenuInGui[A_Index].FavoriteType = "B") ; this is a back link
		LV_Add(, g_objMenuInGui[A_Index].FavoriteName, "   ..   ", "", "")
		
	else ; this is a folder, document, URL or application
		LV_Add(, g_objMenuInGui[A_Index].FavoriteName, strThisType, strThisHotkey
			, (g_objMenuInGui[A_Index].FavoriteType = "Snippet" ? StringLeftDotDotDot(g_objMenuInGui[A_Index].FavoriteLocation, 250) : g_objMenuInGui[A_Index].FavoriteLocation))
}

; keep original position from LoadMenuInGuiFromAlternative or LoadMenuInGuiFromGuiSearch
; do NOT use InStr because "LoadMenuInGui" is included in "LoadMenuInGuiFromAlternative" and "LoadMenuInGuiFromGuiSearch"
LV_Modify((A_ThisLabel = "LoadMenuInGuiFromAlternative" or A_ThisLabel = "LoadMenuInGuiFromGuiSearch" ? g_intOriginalMenuPosition : 1 + (g_objMenuInGui[1].FavoriteType = "B" ? 1 : 0)), "Select Focus") 

Gosub, AdjustColumnsWidth

GuiControl, , f_drpMenusList, % "|" . RecursiveBuildMenuTreeDropDown(g_objMainMenu, g_objMenuInGui.MenuPath) . "|"

GuiControl, Focus, f_lvFavoritesList

strGuiMenuLocation := ""
strThisType := ""
strThisHotkey := ""
strExternalMenuName := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
LoadFavoritesInGuiFiltered:
;------------------------------------------------------------
Gui, 1:Submit, NoHide

; often fail
; intListFilteredWinID := WinExist("A")
; if not DllCall("LockWindowUpdate", Uint, intListFilteredWinID)
;	Oops("An error occured while locking window display", g_strAppNameText, g_strAppVersion)

Critical, On ; prevents the current thread from being interrupted by other threads

strFavoritesListFilter := f_strFavoritesListFilter
if (strFavoritesListFilter = lDialogSearch and g_blnFavoritesListFilterNeverFocused)
	return

if !StrLen(strFavoritesListFilter)
{
	GuiControl, Show, f_picMoveFavoriteUp
	GuiControl, Show, f_picMoveFavoriteDown
	GuiControl, Show, f_picAddSeparator
	GuiControl, Show, f_picAddColumnBreak

	GuiControl, Hide, f_lvFavoritesListFiltered
	GuiControl, Show, f_lvFavoritesList
	Gui, 1:ListView, f_lvFavoritesList
	return
}

GuiControl, Hide, f_picMoveFavoriteUp
GuiControl, Hide, f_picMoveFavoriteDown
GuiControl, Hide, f_picAddSeparator
GuiControl, Hide, f_picAddColumnBreak

GuiControl, Hide, f_lvFavoritesList
GuiControl, Show, f_lvFavoritesListFiltered

Gui, 1:ListView, f_lvFavoritesList
if (LV_GetCount("Selected") > 1) ; if multiple select in list
	LV_Modify(0, "-Select") ; reset "Move n" and "Remove n" labels to "Edit" and "Remove"

Gui, 1:ListView, f_lvFavoritesListFiltered
LV_Delete()
LV_ModifyCol(6, 0) ; do early to avoid flash

RecursiveLoadFavoritesListFiltered(g_objMainMenu, strFavoritesListFilter)

LV_Modify(1, "Select Focus") 
Loop, % LV_GetCount("Column") - 1
	LV_ModifyCol(A_Index, "AutoHdr")

Critical, Off ; enables the current thread to be interrupted

; DllCall("LockWindowUpdate", Uint, 0)  ; Pass 0 to unlock the currently locked window.

strGuiMenuLocation := ""
strThisType := ""
strThisHotkey := ""
strExternalMenuName := ""
strFavoritesListFilter := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
RecursiveLoadFavoritesListFiltered(objCurrentMenu, strFilter)
;------------------------------------------------------------
{
	global g_objHotkeysByNameLocation
	global g_strMenuPathSeparator
	global g_strGroupIndicatorPrefix
	
	Loop, % objCurrentMenu.MaxIndex()
	{
		if !InStr("B|X|K", objCurrentMenu[A_Index].FavoriteType)
			and InStr(objCurrentMenu[A_Index].FavoriteName, strFilter)
		{
			strThisType := GetFavoriteTypeForList(objCurrentMenu[A_Index])
			strThisHotkey := Hotkey2Text(g_objHotkeysByNameLocation[(objCurrentMenu[A_Index].FavoriteType = "QAP" ? "" : objCurrentMenu[A_Index].FavoriteName) 
				. "|" . objCurrentMenu[A_Index].FavoriteLocation])
				
			if InStr("Menu|Group|External", objCurrentMenu[A_Index].FavoriteType, true) ; this is a menu, a group or an external menu
			{
				if (objCurrentMenu[A_Index].FavoriteType = "Menu")
					strGuiMenuLocation := g_strMenuPathSeparator
				else if (objCurrentMenu[A_Index].FavoriteType = "Group")
					strGuiMenuLocation := " " . g_strGroupIndicatorPrefix . g_strGroupIndicatorSuffix
				else ; objCurrentMenu[A_Index].FavoriteType = "External"
				{
					if ExternalMenuIsReadOnly(objCurrentMenu[A_Index].SubMenu.MenuExternalPath)
						strGuiMenuLocation := lDialogReadOnly . " "
					else if !(objCurrentMenu[A_Index].SubMenu.MenuLoaded)
						strGuiMenuLocation := lOopsErrorIniFileUnavailable . " "
					else
						strGuiMenuLocation := ""
					strGuiMenuLocation .= g_strMenuPathSeparator . g_strMenuPathSeparator . " " . objCurrentMenu[A_Index].SubMenu.MenuExternalPath
				}
				
				LV_Add(, objCurrentMenu[A_Index].FavoriteName, objCurrentMenu.MenuPath, strThisType, strThisHotkey, strGuiMenuLocation, A_Index)
			}
			else ; this is a folder, document, etc.
				LV_Add(, objCurrentMenu[A_Index].FavoriteName, objCurrentMenu.MenuPath, strThisType, strThisHotkey
					, (objCurrentMenu[A_Index].FavoriteType = "Snippet" ? StringLeftDotDotDot(objCurrentMenu[A_Index].FavoriteLocation, 250) : objCurrentMenu[A_Index].FavoriteLocation)
					, A_Index)
		}
		
		if InStr("Menu|External|Group", objCurrentMenu[A_Index].FavoriteType, true)
			RecursiveLoadFavoritesListFiltered(objCurrentMenu[A_Index].SubMenu, strFilter) ; RECURSIVE
	}
}
;------------------------------------------------------------


;------------------------------------------------------------
GuiSize:
;------------------------------------------------------------

if (A_EventInfo = 1)  ; The window has been minimized.  No action needed.
    return

g_intListW := A_GuiWidth - 40 - 88
intListH := A_GuiHeight - 115 - 132 - 25 ; - 25 to reduce list height to give space for search box (in v8.2.9.2)

; space before, between and after save/reload/close buttons
; = (A_GuiWidth - left margin - right margin - (3 * buttons width)) // 4 (left, between x 2, right)
intButtonSpacing := (A_GuiWidth - 100 - 150 - (3 * 100)) // 4

for intIndex, objGuiControl in g_objGuiControls
{
	intX := objGuiControl.X
	intY := objGuiControl.Y

	if (intX < 0)
		intX:= A_GuiWidth + intX
	if (intY < 0)
		intY := A_GuiHeight + intY

	if (objGuiControl.Center)
	{
		GuiControlGet, arrPos, Pos, % objGuiControl.Name
		intX := intX - (arrPosW // 2) ; Floor divide
	}

	if (objGuiControl.Name = "f_lnkGuiDropHelpClicked")
	{
		GuiControlGet, arrPos, Pos, f_lnkGuiDropHelpClicked
		intX := intX - arrPosW
	}
	else if (objGuiControl.Name = "f_btnGuiSaveAndCloseFavorites")
		intX := 100 + intButtonSpacing
	else if (objGuiControl.Name = "f_btnGuiSaveAndStayFavorites")
		intX := 100 + (2 * intButtonSpacing) + 100
	else if (objGuiControl.Name = "f_btnGuiCancel")
		intX := 100 + (3 * intButtonSpacing) + 200
		
	GuiControl, % "1:Move" . (objGuiControl.Draw ? "Draw" : ""), % objGuiControl.Name, % "x" . intX	.  " y" . intY
		
}

GuiControl, 1:Move, f_drpMenusList, w%g_intListW%
GuiControl, 1:Move, f_strFavoritesListFilter, % "h21 w" . g_intListW - 25 ; -25 to make room for close button on the right (in v8.2.9.2)
GuiControl, 1:Move, f_lvFavoritesList, w%g_intListW% h%intListH%
GuiControl, 1:Move, f_lvFavoritesListFiltered, w%g_intListW% h%intListH%

Gosub, AdjustColumnsWidth

intListH := ""
intButtonSpacing := ""
intIndex := ""
objGuiControl := ""
intX := ""
intY := ""
arrPos := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
GuiHotkeysHelpClicked:
;------------------------------------------------------------
Gui, 1:+OwnDialogs

MsgBox, 0, %g_strAppNameText% - %lGuiHotkeysHelp%
	, %lGuiHotkeysHelpText%`n`n%lGuiHotkeysHelpText2%

return
;------------------------------------------------------------


;------------------------------------------------------------
GuiAlwaysOnTop:
;------------------------------------------------------------

g_Gui1AlwaysOnTop := !g_Gui1AlwaysOnTop
WinSet, AlwaysOnTop, % (g_Gui1AlwaysOnTop ? "On" : "Off"), % L(lGuiTitle, g_strAppNameText, g_strAppVersion) ; do not use default Toogle for safety
GuiControl, % (g_Gui1AlwaysOnTop ? "Show" : "Hide"), f_picGuiAlwaysOnTopOn
GuiControl, % (g_Gui1AlwaysOnTop ? "Hide" : "Show"), f_picGuiAlwaysOnTopOff

return
;------------------------------------------------------------


;------------------------------------------------------------
GuiDropFilesHelpClicked:
;------------------------------------------------------------
Gui, 1:+OwnDialogs

MsgBox, 0, % g_strAppNameText . " - " . ReplaceAllInString(lGuiDropFilesHelp, "&&", "&")
	, % L(lGuiDropFilesIncentive, g_strAppNameText, lDialogFolderLabel, lDialogFileLabel, lDialogApplicationLabel) . "`n`n" . lGuiDropFilesIncentive2

return
;------------------------------------------------------------


;------------------------------------------------------------
GuiFavoritesListEvents:
;------------------------------------------------------------

Gui, 1:ListView, f_lvFavoritesList

if (A_GuiEvent = "DoubleClick")
{
	g_intOriginalMenuPosition := LV_GetNext()
	if StrLen(g_objMenuInGui[g_intOriginalMenuPosition].FavoriteType) and InStr("Menu|Group|External", g_objMenuInGui[g_intOriginalMenuPosition].FavoriteType, true)
		Gosub, OpenMenuFromGuiHotkey
	else if (g_objMenuInGui[g_intOriginalMenuPosition].FavoriteType = "B")
		Gosub, GuiGotoUpMenu
	else
		gosub, GuiEditFavorite
}
else if (A_GuiEvent = "I") ; Item changed, change Edit button label
{
	g_intFavoriteSelected := LV_GetCount("Selected")
	if (g_intFavoriteSelected > 1)
	{
		GuiControl, , f_lblGuiEditFavorite, % lGuiMove . " (" . g_intFavoriteSelected . ")"
		GuiControl, +gGuiMoveMultipleFavoritesToMenu, f_lblGuiEditFavorite
		GuiControl, +gGuiMoveMultipleFavoritesToMenu, f_picGuiEditFavorite
		GuiControl, , f_lblGuiRemoveFavorite, % lGuiRemoveFavorite . " (" . g_intFavoriteSelected . ")"
		GuiControl, +gGuiRemoveMultipleFavorites, f_lblGuiRemoveFavorite
		GuiControl, +gGuiRemoveMultipleFavorites, f_picGuiRemoveFavorite
		GuiControl, +gGuiMoveMultipleFavoritesUp, f_picMoveFavoriteUp
		GuiControl, +gGuiMoveMultipleFavoritesDown, f_picMoveFavoriteDown
	}
	else
	{
		GuiControl, , f_lblGuiEditFavorite, %lGuiEditFavorite%
		GuiControl, +gGuiEditFavorite, f_lblGuiEditFavorite
		GuiControl, +gGuiEditFavorite, f_picGuiEditFavorite
		GuiControl, , f_lblGuiRemoveFavorite, %lGuiRemoveFavorite%
		GuiControl, +gGuiRemoveFavorite, f_lblGuiRemoveFavorite
		GuiControl, +gGuiRemoveFavorite, f_picGuiRemoveFavorite
		GuiControl, +gGuiMoveFavoriteUp, f_picMoveFavoriteUp
		GuiControl, +gGuiMoveFavoriteDown, f_picMoveFavoriteDown
	}
}

return
;------------------------------------------------------------


;------------------------------------------------------------
GuiFavoritesListFilteredEvents:
;------------------------------------------------------------

if (A_GuiEvent = "DoubleClick")
{
	g_blnOpenFromDoubleClick := true
	gosub, GuiEditFavorite
}

return
;------------------------------------------------------------


;------------------------------------------------------------
GuiAddFavoriteSelectType:
GuiAddFavoriteFromQAP:
;------------------------------------------------------------

if (A_ThisLabel = "GuiAddFavoriteFromQAP")
	gosub, GuiShowFromGuiAddFavoriteSelectType

gosub, GuiFavoritesListFilterEmpty ; restore regular favorites list

if FavoriteIsUnderExternalMenu(g_objMenuInGui, objExternalMenu) and !ExternalMenuAvailableForLock(objExternalMenu)
; this favorite could not be added because it is in an external menu locked by another user,
; or because external settings file is in a read-only folder, or because external files was modified 
; by another user since it was loaded in QAP by this user
	return
	
g_intGui1WinID := WinExist("A")
Gui, 1:Submit, NoHide
Gui, 1:ListView, f_lvFavoritesList ; should be set by LoadFavoritesInGuiFiltered already but seems not to be?
g_intOriginalMenuPosition := (LV_GetCount() ? (LV_GetNext() ? LV_GetNext() : 0xFFFF) : 1)

Gui, 2:New, , % L(lDialogAddFavoriteSelectTitle, g_strAppNameText, g_strAppVersion)
Gui, 2:+Owner1
Gui, 2:+OwnDialogs
if (g_blnUseColors)
	Gui, 2:Color, %g_strGuiWindowColor%

Gui, 2:Add, Text, x10 y+20, %lDialogAdd%:
Gui, 2:Add, Text, x+10 yp section

; Folder|Document|Application|Special|URL|FTP|QAP|Menu|Group|X|K|B|Snippet
loop, 6
	Gui, 2:Add, Radio, % (A_Index = 1 ? " yp " : "") . "vf_intRadioFavoriteType" . g_arrFavoriteTypes%A_Index% . " xs gFavoriteSelectTypeRadioButtonsChanged", % g_objFavoriteTypesLabels[g_arrFavoriteTypes%A_Index%]
Gui, 2:Add, Radio, xs vf_intRadioFavoriteTypeSnippet gFavoriteSelectTypeRadioButtonsChanged, % g_objFavoriteTypesLabels["Snippet"]
Gui, 2:Add, Radio, y+15 xs vf_intRadioFavoriteTypeQAP gFavoriteSelectTypeRadioButtonsChanged, % g_objFavoriteTypesLabels["QAP"]
Gui, 2:Add, Radio, y+15 xs vf_intRadioFavoriteTypeMenu gFavoriteSelectTypeRadioButtonsChanged, % g_objFavoriteTypesLabels["Menu"]
Gui, 2:Add, Radio, xs vf_intRadioFavoriteTypeGroup gFavoriteSelectTypeRadioButtonsChanged, % g_objFavoriteTypesLabels["Group"]
Gui, 2:Add, Radio, xs vf_intRadioFavoriteTypeExternal gFavoriteSelectTypeRadioButtonsChanged, % g_objFavoriteTypesLabels["External"]

Gui, 2:Add, Button, x+20 y+20 vf_btnAddFavoriteSelectTypeContinue gGuiAddFavoriteSelectTypeContinue default, %lDialogContinueAmpersand%
Gui, 2:Add, Button, yp vf_btnAddFavoriteSelectTypeCancel gGuiEditFavoriteCancel, %lGuiCancelAmpersand%
Gui, Add, Text
Gui, 2:Add, Text, xs+120 ys vf_lblAddFavoriteTypeHelp w250 h230, % L(lDialogFavoriteSelectType, lDialogContinue)

GuiCenterButtons(L(lDialogAddFavoriteSelectTitle, g_strAppNameText, g_strAppVersion), 10, 5, 20, "f_btnAddFavoriteSelectTypeContinue", "f_btnAddFavoriteSelectTypeCancel")
Gosub, ShowGui2AndDisableGui1

objExternalMenu := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
FavoriteSelectTypeRadioButtonsChanged:
;------------------------------------------------------------
Gui, 2:Submit, NoHide

g_strAddFavoriteType := "" ; start fresh

; Folder|Document|Application|Special|URL|FTP|QAP|Menu|Group|X|K|B|Snippet|External
loop, %g_arrFavoriteTypes0%
{
	GuiControlGet, blnThisType, , % "f_intRadioFavoriteType" . g_arrFavoriteTypes%A_Index%
	if (blnThisType)
	{
		if (g_arrFavoriteTypes%A_Index% = "QAP")
			strThisTypeHelp := L(g_objFavoriteTypesHelp["QAP"], lMenuSwitchFolderOrApp, lMenuRecentFolders, lMenuCurrentFolders, lMenuClipboard, lMenuAddThisFolder)
		else
			strThisTypeHelp := g_objFavoriteTypesHelp[g_arrFavoriteTypes%A_Index%]
		GuiControl, , f_lblAddFavoriteTypeHelp, %strThisTypeHelp%
		g_strAddFavoriteType := g_arrFavoriteTypes%A_Index%
		break
	}
}

if (A_GuiEvent = "DoubleClick")
	Gosub, GuiAddFavoriteSelectTypeContinue

blnThisType := ""
strThisTypeHelp := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
GuiAddFavoriteSelectTypeContinue:
;------------------------------------------------------------
Gui, 2:Submit, NoHide

if !StrLen(g_strAddFavoriteType)
{
	Oops(lDialogFavoriteSelectType, lDialogContinue)
	return
}

Gosub, GuiAddFavorite

return
;------------------------------------------------------------


;------------------------------------------------------------
GuiDropFiles:
;------------------------------------------------------------

GetTargetWinIdAndClass(g_strTargetWinId, g_strTargetClass) ; returns current or latest file manager window ID and Window class
	
Loop, parse, A_GuiEvent, `n
{
    g_strNewLocation = %A_LoopField%
    Break
}

g_intOriginalMenuPosition := (LV_GetCount() ? (LV_GetNext() ? LV_GetNext() : 0xFFFF) : 1)
Gosub, GuiAddFromDropFiles

return
;------------------------------------------------------------


;------------------------------------------------------------
AddThisFolder:
AddThisFolderXpress:
AddThisFolderFromMsg:
AddThisFolderFromMsgXpress:
AddThisFileFromMsg:
AddThisFileFromMsgXpress:
AddThisShortcutFromMsg:
;------------------------------------------------------------

if (A_ThisLabel = "AddThisFolder" and g_blnLaunchFromTrayIcon)
	; returns current or latest file manager window ID and Window class, and re-activate the last active file manager window
	GetTargetWinIdAndClass(g_strTargetWinId, g_strTargetClass, true)
	
; if A_ThisLabel contains "Msg", we already have g_strNewLocation set by RECEIVE_QAPMESSENGER

if !InStr(A_ThisLabel, "Msg") ; exclude AddThisFolderFromMsg and AddThisFileFromMsg
	g_strNewLocation := GetCurrentLocation(g_strTargetClass, g_strTargetWinId)

g_strNewLocationSpecialName := ""
if g_objClassIdOrPathByDefaultName.HasKey(g_strNewLocation)
{
	; we have a known special folder (there are not yet known like "Bibliothèques\Images" or "Libraries\Pictures")
	g_strNewLocationSpecialName := g_strNewLocation
	g_strNewLocation := g_objClassIdOrPathByDefaultName[g_strNewLocation]
}

If !StrLen(g_strNewLocation)
	or !(InStr(g_strNewLocation, ":") or InStr(g_strNewLocation, "\\") or  InStr(g_strNewLocation, "{"))
{
	if (A_ThisLabel = "AddThisFolder" and g_blnLaunchFromTrayIcon)
	{
		GetHotkeysText(strMouseHotkey, strKeyboardHotkey)
		Gui, 1:+OwnDialogs 
		Oops(lOopsAddThisFolderTip, g_arrActiveFileManagerDisplayNames%g_intActiveFileManager%, strMouseHotkey . " " . lDialogOr . " " . strKeyboardHotkey)
	}
	else
	{
		Gui, 1:+OwnDialogs 
		MsgBox, 52, % L(lDialogAddFolderManuallyTitle, g_strAppNameText, g_strAppVersion), %lDialogAddFolderManuallyPrompt%
		IfMsgBox, Yes
		{
			Gosub, GuiShowFromAddThisFolder
			g_strAddFavoriteType := "Folder"
			Gosub, GuiAddFavorite
		}
	}
	return
}
else
{
	if !InStr(A_ThisLabel, "Xpress") ; NOT Xpress
	{
		; initialy position new entry at top or bottom of menu
		g_intOriginalMenuPosition := (g_blnAddAutoAtTop ? 1 : 0xFFFF)
		
		Gosub, GuiShowFromAddThisFolder ; except for Express add, show Settings window
		
		if (A_ThisLabel = "AddThisFolder")
			
			Gosub, GuiAddThisFolder
			
		else if (A_ThisLabel = "AddThisFolderFromMsg")
			
			Gosub, GuiAddThisFolderFromMsg
			
		else if (A_ThisLabel = "AddThisFileFromMsg")
			
			Gosub, GuiAddThisFileFromMsg
			
		else if (A_ThisLabel = "AddThisShortcutFromMsg")
			
			Gosub, GuiAddShortcutFromMsg
			
	}
	else ; AddThisFolderXpress, AddThisFolderFromMsgXpress or AddThisFileFromMsgXpress
	{
		; in Express mode, g_intOriginalMenuPosition will be set in GuiAddFavoriteSaveXpress
		if (A_ThisLabel = "AddThisFolderXpress")
			
			Gosub, GuiAddThisFolderXpress
			
		else if (A_ThisLabel = "AddThisFolderFromMsgXpress")
			
			Gosub, GuiAddThisFolderFromMsgXpress
			
		else ; AddThisFileFromMsgXpress
			
			Gosub, GuiAddThisFileFromMsgXpress
		
		Gosub, GuiSaveAndCloseFavorites ; for Express save all favorites to ini file
	}
}

objDOpusListers := ""
objPrevClipboard := ""
strIDs := ""
strMouseHotkey := ""
strKeyboardHotkey := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
GetTargetWinIdAndClass(ByRef strThisId, ByRef strThisClass, blnActivate := false, blnExcludeDialogBox := false)
; return ByRef parameters for g_strTargetWinId and g_strTargetClass (or current file manager ID and class if called to reopen current location)
; called when g_strTargetWinId and g_strTargetClass are not updated when invoking the popup menu
; with blnActivate true when add folder from QAP tray icon
; with blnExcludeDialogBox true when reopen file manager current location in dialog box
;------------------------------------------------------------
{
	DetectHiddenWindows, Off
	Winget, strIDs, list
	DetectHiddenWindows, On ; revert to app default

	Loop, %strIDs%
	{
		WinGetClass, strThisClass, % "ahk_id " . strIDs%A_Index%
		if WindowIsExplorer(strThisClass) or WindowIsTotalCommander(strThisClass) or WindowIsDirectoryOpus(strThisClass)
			or (WindowIsDialog(strThisClass, strIDs%A_Index%) and !blnExcludeDialogBox)
		{
			if (blnActivate)
			{
				WinActivate, % "ahk_id " . strIDs%A_Index% ; scan items of the array from the most recently active before invoking the popup menu from the tray icon
				WinWaitActive, % "ahk_id " . strIDs%A_Index%, , 1 ; wait up to 1 seconds
			}
			strThisId := strIDs%A_Index%
			break
		}
	}
}
;------------------------------------------------------------


;========================================================================================================================
; END OF FAVORITES_LIST
;========================================================================================================================


;========================================================================================================================
!_032_FAVORITE_GUI:
;========================================================================================================================

;------------------------------------------------------------
GuiAddFavorite:
GuiAddThisFolder:
GuiAddThisFolderXpress:
GuiAddThisFolderFromMsg:
GuiAddThisFolderFromMsgXpress:
GuiAddThisFileFromMsg:
GuiAddThisFileFromMsgXpress:
GuiAddShortcutFromMsg:
GuiAddFromDropFiles:
GuiEditFavorite:
GuiEditFavoriteFromAlternative:
GuiCopyFavorite:
GuiAddExternalFromCatalogue:
GuiAddExternalOtherExternal:
;------------------------------------------------------------
strGuiFavoriteLabel := A_ThisLabel
g_blnAbordEdit := false

Gosub, GuiFavoriteInit
; ###_V(A_ThisLabel, "g_objMenuInGui.MenuPath", g_objMenuInGui.MenuPath, "objExternalMenu.MenuPath", objExternalMenu.MenuPath, g_blnAbordEdit)

if (g_blnAbordEdit)
{
	gosub, GuiAddFavoriteCleanup
	return
}

; must be before GuiAddFavoriteSaveXpress
g_strTypesForTabWindowOptions := "Folder|Special|FTP"
g_strTypesForTabAdvancedOptions := "Folder|Document|Application|Special|URL|FTP|Snippet|Group"

if InStr(strGuiFavoriteLabel, "Xpress") or (strGuiFavoriteLabel = "GuiAddExternalFromCatalogue")
{
	if InStr(strGuiFavoriteLabel, "Xpress")
		gosub, GuiAddFavoriteSaveXpress ; save this new favorite and return
	gosub, GuiAddFavoriteCleanup
	return
}

g_intGui1WinID := WinExist("A")
Gui, 1:Submit, NoHide
if (strGuiFavoriteLabel = "GuiAddFavorite")
	Gosub, 2GuiClose ; to avoid flashing Gui 1:

g_strFavoriteDialogTitle := L(lDialogAddEditFavoriteTitle
	, (InStr(strGuiFavoriteLabel, "GuiEditFavorite") ? lDialogEdit : (strGuiFavoriteLabel = "GuiCopyFavorite" ? lDialogCopy : lDialogAdd))
	, g_strAppNameText, g_strAppVersion, g_objEditedFavorite.FavoriteType)
Gui, 2:New, , %g_strFavoriteDialogTitle%
Gui, 2:+Owner1
Gui, 2:+OwnDialogs
if (g_blnUseColors)
	Gui, 2:Color, %g_strGuiWindowColor%

Gui, 2:Add, Tab2, vf_intAddFavoriteTab w520 h420 gGuiAddFavoriteTabChanged AltSubmit, % " " . BuildTabsList(g_objEditedFavorite.FavoriteType) . " "
intTabNumber := 0

; ------ BUILD TABS ------

Gosub, GuiFavoriteTabBasic

Gosub, GuiFavoriteIconDefault ; init default icon now that f_strFavoriteLocation has been set in the Basic tab

Gosub, GuiFavoriteTabMenuOptions

Gosub, GuiFavoriteTabLiveFolderOptions

Gosub, GuiFavoriteTabWindowOptions

Gosub, GuiFavoriteTabAdvancedSettings

Gosub, GuiFavoriteTabExternal

Gosub, CheckboxFolderLiveClicked

; ------ TABS End ------

Gui, 2:Tab

if InStr(strGuiFavoriteLabel, "GuiEditFavorite")
{
	Gui, 2:Add, Button, y440 vf_btnEditFavoriteSave gGuiEditFavoriteSave default, %lDialogOKAmpersand%
	Gui, 2:Add, Button, yp vf_btnEditFavoriteCancel gGuiEditFavoriteCancel, %lGuiCancelAmpersand%
	
	GuiCenterButtons(L(lDialogAddEditFavoriteTitle, lDialogEdit, g_strAppNameText, g_strAppVersion, g_objEditedFavorite.FavoriteType), 10, 5, 20, "f_btnEditFavoriteSave", "f_btnEditFavoriteCancel")
}
else if InStr(strGuiFavoriteLabel, "GuiCopyFavorite")
{
	Gui, 2:Add, Button, y440 vf_btnCopyFavoriteCopy gGuiCopyFavoriteSave default, %lDialogCopyAmpersand%
	Gui, 2:Add, Button, yp vf_btnAddFavoriteCancel gGuiAddFavoriteCancel, %lGuiCancelAmpersand%
	
	GuiCenterButtons(L(lDialogAddEditFavoriteTitle, lDialogCopy, g_strAppNameText, g_strAppVersion, g_objEditedFavorite.FavoriteType), 10, 5, 20, "f_btnCopyFavoriteCopy", "f_btnAddFavoriteCancel")
}
else
{
	Gui, 2:Add, Button, y440 vf_btnAddFavoriteAdd gGuiAddFavoriteSave default, %lDialogAddAmpersand%
	Gui, 2:Add, Button, yp vf_btnAddFavoriteCancel gGuiAddFavoriteCancel, %lGuiCancelAmpersand%
	
	GuiCenterButtons(L(lDialogAddEditFavoriteTitle, lDialogAdd, g_strAppNameText, g_strAppVersion, g_objEditedFavorite.FavoriteType), 10, 5, 20, "f_btnAddFavoriteAdd", "f_btnAddFavoriteCancel")
}

if InStr("Folder|Document|Application", g_objEditedFavorite.FavoriteType)
	GuiControl, 2:+Default, f_btnSelectFolderLocation
else
	GuiControl, 2:+Default, f_btnAddFavoriteAdd

if InStr("Special|QAP", g_objEditedFavorite.FavoriteType)
	GuiControl, 2:Focus, % "f_drp" . g_objEditedFavorite.FavoriteType
else
{
	GuiControl, 2:Focus, f_strFavoriteShortName
	if InStr(strGuiFavoriteLabel, "GuiEditFavorite") 
		SendInput, ^a
}

Gosub, DropdownParentMenuChanged ; to init the content of menu items

Gui, 2:Add, Text
Gosub, ShowGui2AndDisableGui1

GuiAddFavoriteCleanup:
blnIsGroupMember := ""
strGuiFavoriteLabel := ""
arrTop := ""
g_strNewLocation := ""
g_blnAbordEdit := ""
objExternalMenu := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
BuildTabsList(strFavoriteType)
;------------------------------------------------------------
{
	global

	; 1 Basic Settings, 2 Menu Options, 3 Window Options, 4 Advanced Settings
	strTabsList := g_arrFavoriteGuiTabs1 . " | " . g_arrFavoriteGuiTabs2
	
	if (strFavoriteType = "Folder") and !(blnIsGroupMember)
		strTabsList .= " | " . lDialogAddFavoriteTabsLive
	if InStr(g_strTypesForTabWindowOptions, strFavoriteType)
		strTabsList .= " | " . g_arrFavoriteGuiTabs3
	if InStr(g_strTypesForTabAdvancedOptions, strFavoriteType)
		strTabsList .= " | " . g_arrFavoriteGuiTabs4
	if (strFavoriteType = "External")
		strTabsList .= " | " . lDialogAddFavoriteTabsExternal
	
	strTabsList .= " "
	
	return strTabsList
}
;------------------------------------------------------------


;------------------------------------------------------------
GuiFavoriteInit:
;------------------------------------------------------------
; Icon resource in the format "iconfile,index", examnple "shell32.dll,2"
; g_strDefaultIconResource -> default icon for the current type of favorite
; g_strNewFavoriteIconResource -> icon currently displayed in the Add/Edit dialog box

; g_strNewFavoriteHotkey -> actual hotkey in internal format displayed as text in the Add/Edit dialog box

; when edit favorite, keep original values in g_objEditedFavorite
; when add favorite, put initial or default values in g_objEditedFavorite and update them when gui save

blnFavoriteFromSearch := StrLen(GetFavoritesListFilter())
; ###_V(A_ThisLabel, blnFavoriteFromSearch, GetFavoritesListFilter())

if (blnFavoriteFromSearch)
	g_objMenuInGui := GetMenuForGuiFiltered(g_intOriginalMenuPosition)

if FavoriteIsUnderExternalMenu(g_objMenuInGui, objExternalMenu) and !ExternalMenuAvailableForLock(objExternalMenu)
; this favorite could not be added or edited because it is in an external menu locked by another user,
; or because external settings file is in a read-only folder, or because external files was modified 
; by another user since it was loaded in QAP by this user
{
	g_blnAbordEdit := true
	return
}

if (blnFavoriteFromSearch)
{
	gosub, OpenMenuFromGuiSearch ; open the parent menu of found selected favorite
	gosub, GuiFavoritesListFilterEmpty ; must be after we opened the menu

	if (InStr("Menu|Group|External", g_objMenuInGui[g_intOriginalMenuPosition].FavoriteType, true) and g_blnOpenFromDoubleClick)
	{
		gosub, OpenMenuFromGuiHotkey ; load the selected found menu in gui
		g_blnOpenFromDoubleClick := false ; reset value
		g_blnAbordEdit := true
		return
	}
}

g_objEditedFavorite := Object()
g_strDefaultIconResource := ""
g_strNewFavoriteIconResource := ""
strGroupSettings := ",,,,,,," ; ,,, to make sure all fields are re-init
StringSplit, g_arrGroupSettingsGui, strGroupSettings, `,

blnIsGroupMember := InStr(g_objMenuInGui.MenuPath, g_strGroupIndicatorPrefix)

if InStr(strGuiFavoriteLabel, "GuiEditFavorite") or (strGuiFavoriteLabel = "GuiCopyFavorite") ; includes GuiEditFavoriteFromAlternative
{
	Gui, 1:ListView, f_lvFavoritesList
	if !(strGuiFavoriteLabel = "GuiEditFavoriteFromAlternative" or blnFavoriteFromSearch) ; if from Alternative menu or from Search we already have g_intOriginalMenuPosition
		g_intOriginalMenuPosition := LV_GetNext()

	if !(g_intOriginalMenuPosition)
	{
		Oops(lDialogSelectItemToEdit)
		g_blnAbordEdit := true
		return
	}
	
	if (strGuiFavoriteLabel = "GuiCopyFavorite")
	{
		g_objEditedFavorite := Object()
		for strKey, strValue in g_objMenuInGui[g_intOriginalMenuPosition]
			g_objEditedFavorite[strKey] := strValue
	}
	else
		g_objEditedFavorite := g_objMenuInGui[g_intOriginalMenuPosition]
	
	if (g_objEditedFavorite.FavoriteType = "B")
		g_blnAbordEdit := true
	else if InStr("X|K", g_objEditedFavorite.FavoriteType) ; favorite is menu separator or column break
		g_blnAbordEdit := true
	else if (strGuiFavoriteLabel = "GuiCopyFavorite" and InStr("Menu|Group|External", g_objEditedFavorite.FavoriteType, true)) ; menu or group cannot be copied
	{
		Oops(lOopsCannotCopyFavorite, g_objFavoriteTypesShortNames[g_objEditedFavorite.FavoriteType])
		g_blnAbordEdit := true
	}
	
	if (g_blnAbordEdit = true)
		return

	g_strNewFavoriteIconResource := g_objEditedFavorite.FavoriteIconResource
	g_strNewFavoriteWindowPosition := g_objEditedFavorite.FavoriteWindowPosition
	g_blnNewFavoriteFtpEncoding := g_objEditedFavorite.FavoriteFtpEncoding

	if (strGuiFavoriteLabel = "GuiCopyFavorite")
		g_strNewFavoriteHotkey := "None" ; copied favorite has no hotkey
	else
		g_strNewFavoriteHotkey := g_objHotkeysByNameLocation[FavoriteNameLocationFromObject(g_objEditedFavorite)]

	if (g_objEditedFavorite.FavoriteType = "Group")
	{
	   ; 1 boolean value (replace existing Explorer windows if true, add to existing Explorer Windows if false)
	   ; 2 restore folders with "Explorer" or "Other" (Directory Opus, Total Commander or QAPconnect)
	   ; 3 delay in milliseconds to insert between each favorite to restore
		strGroupSettings := g_objEditedFavorite.FavoriteGroupSettings . ",,,," ; ,,, to make sure all fields are re-init
		StringSplit, g_arrGroupSettingsGui, strGroupSettings, `,
	}
}
else ; add favorite
{
	if !WindowIsDialog(g_strTargetClass, g_strTargetWinId)
		and (InStr(strGuiFavoriteLabel, "ThisFolder") ; includes all ...FromMsg
			or (strGuiFavoriteLabel = "GuiAddFromDropFiles"))
	{
		WinGetPos, intX, intY, intWidth, intHeight, ahk_id %g_strTargetWinId%
		WinGet, intMinMax, MinMax, ahk_id %g_strTargetWinId% ; -1: minimized, 1: maximized, 0: neither minimized nor maximized
		; Boolean,MinMax,Left,Top,Width,Height,Delay (comma delimited)
		; 0 for use default / 1 for remember, -1 Minimized / 0 Normal / 1 Maximized, Left (X), Top (Y), Width, Height; for example: "1,0,100,50,640,480,200"
		; record position but keep "use default position"
		g_strNewFavoriteWindowPosition := "0," . intMinMax . "," . intX . "," . intY . "," . intWidth . "," . intHeight . ",200"
	}
	else
		g_strNewFavoriteWindowPosition := ",,,,,,," ; to avoid having phantom values

	if (strGuiFavoriteLabel = "GuiAddExternalOtherExternal")
	{
		strGuiFavoriteLabel := "GuiAddFavorite"
		blnNoExternalMenusCatalogue := true
	}
	else
		blnNoExternalMenusCatalogue := false
	
	if (strGuiFavoriteLabel <> "GuiAddFavorite")
	; includes GuiAddThisFolder, GuiAddThisFolderXpress, GuiAddThisFolderFromMsg, GuiAddThisFolderFromMsgXpress,
	; GuiAddThisFileFromMsg, GuiAddThisFileFromMsgXpress, GuiAddFromDropFiles, GuiAddExternalFromCatalogue
	{
		; g_strNewLocation is received from AddThisFolder (etc.), GuiDropFiles or ButtonAddExternalMenusFromCatalogue
		if (strGuiFavoriteLabel = "GuiAddExternalFromCatalogue")
		{
			g_objEditedFavorite.FavoriteAppWorkingDir := g_strNewLocation
			IniRead, strExternalMenuName, %g_strNewLocation%, Global, MenuName, %A_Space%
			g_objEditedFavorite.FavoriteName := (StrLen(strExternalMenuName) ? strExternalMenuName : GetDeepestFolderName(g_strNewLocation))
		}
		else ; all other labels
		{
			g_objEditedFavorite.FavoriteLocation := g_strNewLocation
			g_objEditedFavorite.FavoriteName := (StrLen(g_strNewLocationSpecialName) ? g_strNewLocationSpecialName : GetDeepestFolderName(g_strNewLocation))
		}
	}
	g_strNewFavoriteHotkey := "None" ; internal name

	if (strGuiFavoriteLabel = "GuiAddFavorite")
	{
		g_objEditedFavorite.FavoriteType := g_strAddFavoriteType
		
		if (g_strAddFavoriteType = "External") and !(blnNoExternalMenusCatalogue) and FileExist(g_strExternalMenusCataloguePath)
		{
			Gosub, AddExternalMenusFromCatalogue
			g_blnAbordEdit := true
			return
		}
	}
	else if InStr(strGuiFavoriteLabel, "GuiAddThisFolder") ; includes GuiAddThisFolderXpress, GuiAddThisFolderFromMsg and GuiAddThisFolderFromMsgXpress
	{
		if StrLen(g_strNewLocationSpecialName)
			g_objEditedFavorite.FavoriteType := "Special"
		else if SubStr(g_strNewLocation, 1, 6) = "ftp://"
			g_objEditedFavorite.FavoriteType := "FTP"
		else
			g_objEditedFavorite.FavoriteType := "Folder"
	}
	else if InStr("GuiAddFromDropFiles|GuiAddThisFileFromMsg|GuiAddThisFileFromMsgXpress|GuiAddShortcutFromMsg", strGuiFavoriteLabel)
	{
		if (strGuiFavoriteLabel = "GuiAddShortcutFromMsg")
			; FileGetShortcut, %file%, OutTarget, OutDir, OutArgs, OutDesc, OutIcon, OutIconNum, OutRunState
			FileGetShortcut, %g_strNewLocation%, g_strNewLocation, strShortcutWorkingDir, strShortcutArgs, , strShortcutIconFile, strShortcutIconIndex, intShortcutRunState
		
		strExtension := GetFileExtension(g_strNewLocation)
		if StrLen(strExtension) and InStr("exe|com|bat|ahk|vbs|cmd", strExtension)
			g_objEditedFavorite.FavoriteType := "Application"
		else if LocationIsDocument(g_strNewLocation)
			g_objEditedFavorite.FavoriteType := "Document"
		else
			g_objEditedFavorite.FavoriteType := "Folder"
		
		if (strGuiFavoriteLabel = "GuiAddShortcutFromMsg")
		{
			g_objEditedFavorite.FavoriteLocation := g_strNewLocation
			g_objEditedFavorite.FavoriteAppWorkingDir := (g_objEditedFavorite.FavoriteType = "Application" ? strShortcutWorkingDir : "")
			g_objEditedFavorite.FavoriteArguments := (g_objEditedFavorite.FavoriteType = "Application" ? strShortcutArgs : "")
			g_strNewFavoriteIconResource := (StrLen(strShortcutIconFile) ? strShortcutIconFile . "," . strShortcutIconIndex : "")
			g_objEditedFavorite.FavoriteIconResource := g_strNewFavoriteIconResource
			if InStr(g_strTypesForTabWindowOptions, g_objEditedFavorite.FavoriteType)
			{
				; before: intShortcutRunState = Shortcut RunState -> 1 Normal / 3 Maximized / 7 Minimized
				intShortcutRunState := (intShortcutRunState = 3 ? 1 : (intShortcutRunState = 7 ? -1 : 0))
				; after: intShortcutRunState = QAP RunState -> -1 Minimized / 0 Normal / 1 Maximized
				g_strNewFavoriteWindowPosition :=  (intShortcutRunState <> 0 ? "1" : "0") . "," . intShortcutRunState ; if state is not normal enable Windows options for Min or Max
			}
			; else g_strNewFavoriteWindowPosition keeps ",,,,,,,"
			g_objEditedFavorite.FavoriteWindowPosition := g_strNewFavoriteWindowPosition
		}
	}
	else if (strGuiFavoriteLabel = "GuiAddExternalFromCatalogue")
		g_objEditedFavorite.FavoriteType := "External"
	
	if (g_strAddFavoriteType = "FTP")
		g_blnNewFavoriteFtpEncoding := (g_intActiveFileManager = 3 ? false : true) ; if TotalCommander URL should not be encoded (as hardcoded in OpenFavorite)

	if (g_objEditedFavorite.FavoriteType = "Folder") and StrLen(g_objEditedFavorite.FavoriteLocation) and !StrLen(g_strNewFavoriteIconResource)
	{
		g_strNewFavoriteIconResource := GetFolderIcon(g_objEditedFavorite.FavoriteLocation)
		g_objEditedFavorite.FavoriteIconResource := g_strNewFavoriteIconResource
	}
}

; Gosub, GuiFavoriteIconDefault DO NOT INIT DEFAULT ICON HERE BECAUSE WE NEED f_strFavoriteLocation TO BE SET BEFORE WHEN CREATING THE 1ST TAB

intX := ""
intY := ""
intWidth := ""
intHeight := ""
intMinMax := ""
strGroupSettings := ""
strExternalMenuName := ""
blnNoExternalMenusCatalogue := ""
strShortcutWorkingDir := ""
strShortcutArgs := ""
strShortcutIconFile := ""
strShortcutIconIndex := ""
intShortcutRunState := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
GuiFavoriteTabBasic:
;------------------------------------------------------------

Gui, 2:Tab, % ++intTabNumber

Gui, 2:Font, w700
Gui, 2:Add, Text, x20 y50 w500, % lDialogFavoriteType . ": " . g_objFavoriteTypesLabels[g_objEditedFavorite.FavoriteType]
Gui, 2:Font

if (g_objEditedFavorite.FavoriteType = "QAP")
	Gui, 2:Add, Text, x20 y+10 w500, % ReplaceAllInString(L(g_objFavoriteTypesHelp["QAP"], lMenuRecentFolders, lMenuCurrentFolders, lMenuAddThisFolder, lMenuSettings, lGuiOptions), "`n`n", "`n")
else
	Gui, 2:Add, Text, x20 y+10 w500 vf_TypeHelp, % "> " . ReplaceAllInString(g_objFavoriteTypesHelp[g_objEditedFavorite.FavoriteType], "`n`n", "`n> ")

if (g_objEditedFavorite.FavoriteType = "Snippet")
{
	GuiControlGet, arrPosTypeHelp, Pos, f_TypeHelp
	g_intTypeHelpY := arrPosTypeHelpY
}

if (g_objEditedFavorite.FavoriteType = "QAP")
	Gui, 2:Add, Edit, x20 y+0 vf_strFavoriteShortName hidden, % g_objEditedFavorite.FavoriteName ; not allow to change favorite short name for QAP feature favorites
else
{
	Gui, 2:Add, Text, x20 y+20 vf_ShortNameLabel, %lDialogFavoriteShortNameLabel% *

	Gui, 2:Add, Edit
		, % "x20 y+10 Limit250 vf_strFavoriteShortName w" . 400 - (g_objEditedFavorite.FavoriteType = "Menu" ? 50 : 0)
		, % g_objEditedFavorite.FavoriteName
}

if (InStr("Menu|Group|External", g_objEditedFavorite.FavoriteType, true) and InStr(strGuiFavoriteLabel, "GuiEditFavorite"))
	Gui, 2:Add, Button, x+10 yp gGuiOpenThisMenu, % (g_objEditedFavorite.FavoriteType = "Group" ? lDialogOpenThisGroup : lDialogOpenThisMenu)

if !InStr("Special|QAP", g_objEditedFavorite.FavoriteType)
{
	if !InStr("Menu|Group|External", g_objEditedFavorite.FavoriteType, true)
	{
		if (g_objEditedFavorite.FavoriteType = "Snippet")
			Gui, Font, w700
			
		Gui, 2:Add, Text, x20 y+10 vf_lblLocation, % g_objFavoriteTypesLocationLabels[g_objEditedFavorite.FavoriteType] . " *"
		
		if (g_objEditedFavorite.FavoriteType = "Snippet")
		{
			if !StrLen(g_objEditedFavorite.FavoriteLaunchWith)
				g_objEditedFavorite.FavoriteLaunchWith := g_blnSnippetDefaultMacro . ";;" . g_blnSnippetDefaultProcessEOLTab . ";" . g_blnSnippetDefaultFixedFont . ";" g_intSnippetDefaultFontSize ; default values
			
			strFavoriteSnippetOptions := g_objEditedFavorite.FavoriteLaunchWith . ";;;;;;" ; safety
			; 1 macro (boolean) true: send snippet to current application using macro mode / else paste as raw text
			; 2 prompt (text) pause prompt before pasting/launching the snippet
			; 3 encode (boolean) true: automatically encode / false: do not encode
			; 4 fixed width (boolean) true: fixed width / false: proportional width
			; 5 font size (integer)
			StringSplit, arrFavoriteSnippetOptions, strFavoriteSnippetOptions, `;
			
			Gui, Font
			Gui, 2:Add, Checkbox, % "x+20 yp vf_blnFixedFont gContentEditFontChanged " . (arrFavoriteSnippetOptions4 = 1 ? "checked" : ""), %lDialogFavoriteSnippetFixedFont%
			GuiControlGet, arrPosFixedFont, Pos, f_blnFixedFont
			g_intContentLabelY := arrPosFixedFontY
			Gui, 2:Add, Text, x+20 yp vf_lblFontSize, %lDialogFavoriteSnippetFontSize%
			GuiControlGet, arrPosFontSizeLabel, Pos, f_lblFontSize
			Gui, 2:Add, Edit, x+5 yp w40 vf_intFontSize gContentEditFontChanged
			GuiControlGet, arrPosFontSize, Pos, f_intFontSize
            Gui, 2:Add, UpDown, Range6-18 vf_intFontUpDown, % (StrLen(arrFavoriteSnippetOptions5) ? arrFavoriteSnippetOptions5 : g_intSnippetDefaultFontSize)
			GuiControlGet, arrPosUpDown, Pos, f_intFontUpDown
			Gui, Font, w700
			Gui, 2:Add, Button, x+20 yp vf_btnEnlarge gEnlargeSnippetContent, +
			Gui, Font
			GuiControlGet, arrPosEnlarge, Pos, f_btnEnlarge
			
			intMoveRight := 500 - (arrPosFixedFontX + arrPosFixedFontW + arrPosFontSizeW + arrPosUpDownW + arrPosFontSizeLabelW + 10 + arrPosEnlargeW)
			GuiControl, Move, f_blnFixedFont, % "x" . arrPosFixedFontX + intMoveRight
			GuiControl, Move, f_intFontSize, % "x" . arrPosFontSizeX + intMoveRight
			GuiControl, Move, f_intFontUpDown, % "x" . arrPosUpDownX + intMoveRight
			GuiControl, Move, f_lblFontSize, % "x" . arrPosFontSizeLabelX + intMoveRight
			GuiControl, Move, f_btnEnlarge, % "x" . arrPosEnlargeX + intMoveRight
		}
		
		Gui, 2:Add, Edit, % "x20 y+10 vf_strFavoriteLocation "
			. (g_objEditedFavorite.FavoriteType = "Snippet" ? "w500 r5 t8" : "gEditFavoriteLocationChanged w400 h20")
			, % g_objEditedFavorite.FavoriteLocation ; do not process snippet according to f_blnProcessEOLTab here
		if (g_objEditedFavorite.FavoriteType = "Snippet")
		{
			GuiControlGet, arrPosSnippetContent, Pos, f_strFavoriteLocation
			g_intSnippetContentH := arrPosSnippetContentH
		}
			
		if (g_objEditedFavorite.FavoriteType = "Snippet")
			gosub, ContentEditFontChanged
			
		if InStr("Folder|Document|Application", g_objEditedFavorite.FavoriteType)
			Gui, 2:Add, Button, x+10 yp gButtonSelectFavoriteLocation vf_btnSelectFolderLocation, %lDialogBrowseButton%

		if (g_objEditedFavorite.FavoriteType = "Application")
		{
			Gui, 2:Add, Text, x20 y+20 vf_lblSelectRunningApplication, %lDialogBrowseOrSelectApplication%
			Gui, 2:Add, DropDownList, x20 y+5 w500 vf_drpRunningApplication gDropdownRunningApplicationChanged
				, % CollectRunningApplications(g_objEditedFavorite.FavoriteLocation)
			Gui, 2:Add, Checkbox, x20 y+20 w400 vf_strFavoriteLaunchWith, %lDialogActivateAlreadyRunning%
			GuiControl, , f_strFavoriteLaunchWith, % (g_objEditedFavorite.FavoriteLaunchWith = 1)
		}
		else if (g_objEditedFavorite.FavoriteType <> "Snippet")
			Gui, 2:Add, Text, x20 y+5 w500, %lDialogFoldersPlaceholders%.
			; {CUR_ placeholders are also supported for applications but we don't have enough room show this tip
		
		if (strGuiFavoriteLabel = "GuiCopyFavorite")
			g_objEditedFavorite.FavoriteLocation := "" ; to avoid side effect on original favorite hotkey
	}
	
	if (g_objEditedFavorite.FavoriteType = "Snippet")
	{
		g_strSnippetFormat := "raw" ; control initialy loaded with unprocessed content as in ini file
		Gui, 2:Add, Checkbox, % "x20 y+10 w500 vf_blnProcessEOLTab gProcessEOLTabChanged " . (arrFavoriteSnippetOptions3 <> 0 ? "checked" : ""), %lDialogFavoriteSnippetProcessEOLTab%
		Gui, 2:Add, Link, x20 y+5 vf_lblSnippetHelp w500, `n ; keep `n to make sure a second line is available for the control
		Gosub, ProcessEOLTabChanged ; encode/decode snippet and update f_lblSnippetHelp text
	}
}
else ; "Special" or "QAP"
{
	Gui, 2:Add, Edit, x20 y+20 hidden section vf_strFavoriteLocation, % g_objEditedFavorite.FavoriteLocation ; hidden because set by DropdownSpecialChanged or DropdownQAPChanged
	Gui, 2:Add, Text, xs ys, % g_objFavoriteTypesLabels[g_objEditedFavorite.FavoriteType] . " *"

	Gui, 2:Add, DropDownList
		, % "x20 y+10 w400 vf_drp" . g_objEditedFavorite.FavoriteType . " gDropdown" . g_objEditedFavorite.FavoriteType . "Changed"
		, % lDialogSelectItemToAdd . "...||" . (g_objEditedFavorite.FavoriteType = "Special" ? g_strSpecialFoldersList : g_strQAPFeaturesList)
	if InStr("GuiEditFavorite|GuiEditFavoriteFromAlternative|GuiCopyFavorite", strGuiFavoriteLabel) or StrLen(g_strNewLocationSpecialName)
		if (g_objEditedFavorite.FavoriteType = "Special")
			GuiControl, ChooseString, f_drpSpecial, % g_objSpecialFolders[g_objEditedFavorite.FavoriteLocation].DefaultName
		else ; QAP
			GuiControl, ChooseString, f_drpQAP, % g_objQAPFeatures[g_objEditedFavorite.FavoriteLocation].LocalizedName
}

if (g_objEditedFavorite.FavoriteType = "FTP")
{
	Gui, 2:Add, Text, x20 y+5, %lGuiLoginName%
	Gui, 2:Add, Text, x230 yp, %lGuiPassword%
	
	Gui, 2:Add, Edit, x20 y+5 w190 h20 vf_strFavoriteLoginName, % g_objEditedFavorite.FavoriteLoginName
	Gui, 2:Add, Edit, x230 yp w190 h20 Password vf_strFavoritePassword, % g_objEditedFavorite.FavoritePassword
	Gui, 2:Add, Text, x20 y+5, %lGuiPasswordNotEncripted%
}

if (g_objEditedFavorite.FavoriteType = "Group")
{
	Gui, 2:Add, Text, x20 y+20, %lGuiGroupSaveRestoreOption%
	Gui, 2:Add, Radio, % "x20 y+10 vf_blnRadioGroupAdd " . (g_arrGroupSettingsGui1 ? "" : "checked"), %lGuiGroupSaveAddWindowsLabel%
	Gui, 2:Add, Radio, % "x20 y+5 vf_blnRadioGroupReplace " . (g_arrGroupSettingsGui1 ? "checked" : ""), %lGuiGroupSaveReplaceWindowsLabel%

	if (g_intActiveFileManager = 2 or g_intActiveFileManager = 3) ; DirectoryOpus or TotalCommander
	{
		Gui, 2:Add, Text, x20 y+20, %lGuiGroupSaveRestoreWith%
		Gui, 2:Add, Radio, % "x20 y+10 vf_blnRadioGroupRestoreWithExplorer " . (g_arrGroupSettingsGui2 = "Windows Explorer" ? "checked" : ""), Windows Explorer
		Gui, 2:Add, Radio, % "x20 y+5 vf_blnRadioGroupRestoreWithOther " . (g_arrGroupSettingsGui2 <> "Windows Explorer" ? "checked" : "")
			, % g_arrActiveFileManagerDisplayNames%g_intActiveFileManager% ; will be selected by default if empty (when Add)
	}
}

if InStr("Folder|Special|FTP", g_objEditedFavorite.FavoriteType) ; when adding folders or FTP sites
	and (g_intActiveFileManager = 2 or g_intActiveFileManager = 3) ; in Directory Opus or TotalCommander
	and (blnIsGroupMember) ; in a group
{
	;  0 for use default / 1 for remember, -1 Minimized / 0 Normal / 1 Maximized, Left (X), Top (Y), Width, Height, Delay, RestoreSide; for example: "0,,,,,,,L"
	StringSplit, arrNewFavoriteWindowPosition, g_strNewFavoriteWindowPosition, `,
	
	Gui, 2:Add, Text, x20 y+20, % L(lGuiGroupRestoreSide, (g_intActiveFileManager = 2 ? "Directory Opus" : "Total Commander"))
	Gui, 2:Add, Radio, % "x+10 yp vf_intRadioGroupRestoreSide " . (arrNewFavoriteWindowPosition8 <> "R" ? "checked" : ""), %lDialogWindowPositionLeft% ; if "L" or ""
	Gui, 2:Add, Radio, % "x+10 yp " . (arrNewFavoriteWindowPosition8 = "R" ? "checked" : ""), %lDialogWindowPositionRight%
}

if (g_objEditedFavorite.FavoriteType = "External")
{
	Gui, 2:Add, Text, x20 y+10, %lDialogExternalLocation% *
	Gui, 2:Add, Edit, x20 y+5 w400 Limit250 gEditFavoriteExternalLocationChanged vf_strFavoriteAppWorkingDir, % g_objEditedFavorite.FavoriteAppWorkingDir
	Gui, 2:Add, Button, x+10 yp gButtonSelectExternalSettingsFile, %lDialogBrowseButton%
	Gui, 2:Add, Link, x20 y+15 w500, % L(lDialogFavoriteExternalHelpWeb, "http://www.quickaccesspopup.com/can-a-submenu-be-shared-on-different-pcs-or-by-different-users/")
}

Gui, 2:Add, Checkbox, % "x20 y+20 w500 vf_blnFavoriteDisabled " . (g_objEditedFavorite.FavoriteDisabled ? "checked" : "")
	, % (blnIsGroupMember ? lDialogFavoriteDisabledGroupMember : lDialogFavoriteDisabled)

arrNewFavoriteWindowPosition := ""
arrPosTypeHelp := ""
arrPosFixedFont := ""
arrPosFixedFont := ""
arrPosFontSizeLabel := ""
arrPosEnlarge := ""
arrPosSnippetContent := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
EnlargeSnippetContent:
;------------------------------------------------------------
GuiControlGet, strEnlargeLabel, , f_btnEnlarge

GuiControl, % (strEnlargeLabel = "+" ? "Hide" : "Show"), f_ShortNameLabel
GuiControl, % (strEnlargeLabel = "+" ? "Hide" : "Show"), f_strFavoriteShortName
GuiControl, % (strEnlargeLabel = "+" ? "Hide" : "Show"), f_TypeHelp

GuiControl, Move, f_strFavoriteLocation, % "y" . (strEnlargeLabel = "+" ? g_intTypeHelpY : g_intContentLabelY) + 30
	. " h" . (strEnlargeLabel = "+" ? g_intSnippetContentH + (g_intContentLabelY - g_intTypeHelpY) : g_intSnippetContentH)

GuiControl, Move, f_lblLocation, % "y" . (strEnlargeLabel = "+" ? g_intTypeHelpY : g_intContentLabelY)
GuiControl, Move, f_blnFixedFont, % "y" . (strEnlargeLabel = "+" ? g_intTypeHelpY : g_intContentLabelY)
GuiControl, Move, f_intFontSize, % "y" . (strEnlargeLabel = "+" ? g_intTypeHelpY : g_intContentLabelY)
GuiControl, Move, f_intFontUpDown, % "y" . (strEnlargeLabel = "+" ? g_intTypeHelpY : g_intContentLabelY)
GuiControl, Move, f_lblFontSize, % "y" . (strEnlargeLabel = "+" ? g_intTypeHelpY : g_intContentLabelY)
GuiControl, Move, f_btnEnlarge, % "y" . (strEnlargeLabel = "+" ? g_intTypeHelpY : g_intContentLabelY)

GuiControl, , f_btnEnlarge, % (strEnlargeLabel = "+" ? "-" : "+")

return
;------------------------------------------------------------


;------------------------------------------------------------
GuiFavoriteTabMenuOptions:
;------------------------------------------------------------

Gui, 2:Tab, % ++intTabNumber

Gui, 2:Add, Text, x20 y50 vf_lblFavoriteParentMenu
	, % (InStr("Menu|External", g_objEditedFavorite.FavoriteType, true) ? lDialogSubmenuParentMenu : lDialogFavoriteParentMenu)
Gui, 2:Add, DropDownList, x20 y+5 w500 vf_drpParentMenu gDropdownParentMenuChanged
	, % RecursiveBuildMenuTreeDropDown(g_objMainMenu, g_objMenuInGui.MenuPath
		, (InStr("Menu|External", g_objEditedFavorite.FavoriteType, true) ? lMainMenuName . " " . g_objEditedFavorite.FavoriteLocation : "") ; exclude self
		, true) . "|" ; exclude read-only external menus

Gui, 2:Add, Text, x20 y+10 vf_lblFavoriteParentMenuPosition, %lDialogFavoriteMenuPosition%
Gui, 2:Add, DropDownList, x20 y+5 w500 vf_drpParentMenuItems AltSubmit

if !(blnIsGroupMember)
{
	Gui, 2:Add, Text, x20 y+20 gGuiPickIconDialog section, %lDialogIcon%
	Gui, 2:Add, Picture, x20 y+5 w32 h32 vf_picIcon gGuiPickIconDialog
	Gui, 2:Add, Text, x+5 yp vf_lblRemoveIcon gGuiRemoveIcon, X
	Gui, 2:Add, Link, x20 ys+57 w240 gGuiPickIconDialog, <a>%lDialogSelectIcon%</a>
	Gui, 2:Add, Link, x270 yp w240 vf_lblSetWindowsFolderIcon gSetWindowsFolderIcon, <a>%lDialogWindowsFolderIconSet%</a>
	Gui, 2:Add, Link, x20 ys+74 w240 gGuiEditIconDialog, <a>%lDialogEditIcon%</a>

	Gui, 2:Add, Text, x20 y+20, %lDialogShortcut%
	Gui, 2:Add, Text, x20 y+5 w300 h23 0x1000 vf_strHotkeyText gButtonChangeFavoriteHotkey, % Hotkey2Text(g_strNewFavoriteHotkey)
	Gui, 2:Add, Button, yp x+10 gButtonChangeFavoriteHotkey, %lOptionsChangeHotkey%
}

return
;------------------------------------------------------------


;------------------------------------------------------------
GuiFavoriteTabLiveFolderOptions:
;------------------------------------------------------------

if (g_objEditedFavorite.FavoriteType = "Folder") and !(blnIsGroupMember) ; when adding folders not in a group
{
	Gui, 2:Tab, % ++intTabNumber

	Gui, 2:Add, Checkbox, % "x20 y50 w500 vf_blnFavoriteFolderLive gCheckboxFolderLiveClicked " . (g_objEditedFavorite.FavoriteFolderLiveLevels ? "checked" : ""), %lDialogFavoriteFolderLive%
	
	Gui, 2:Add, Edit, x20 y+20 w51 h22 vf_intFavoriteFolderLiveLevelsEdit number limit1 center hidden
	Gui, 2:Add, UpDown, vf_intFavoriteFolderLiveLevels Range1-9, % g_objEditedFavorite.FavoriteFolderLiveLevels
	Gui, 2:Add, Text, x+5 yp w385 vf_lblFavoriteFolderLiveLevels hidden, %lDialogFavoriteFolderLiveLevels%
	Gui, 2:Add, Edit, x20 y+10 w51 h22 vf_intFavoriteFolderLiveColumnsEdit number limit3 center hidden
	Gui, 2:Add, UpDown, vf_intFavoriteFolderLiveColumns Range0-999, % g_objEditedFavorite.FavoriteFolderLiveColumns
	Gui, 2:Add, Text, x+5 yp w385 vf_lblFavoriteFolderLiveColumns hidden, %lDialogFavoriteFolderLiveColumns%
	
	Gui, 2:Add, Checkbox, % "x20 y+20 w400 vf_blnFavoriteFolderLiveDocuments gCheckboxFolderLiveDocumentsClicked hidden " . (g_objEditedFavorite.FavoriteFolderLiveDocuments ? "checked" : ""), %lDialogFavoriteFolderLiveDocuments%

	Gui, 2:Add, Radio, % "x20 y+20 vf_radFavoriteFolderLiveInclude hidden " . (g_objEditedFavorite.FavoriteFolderLiveIncludeExclude ? "checked" : ""), %lDialogFavoriteFolderLiveInclude%
	Gui, 2:Add, Radio, % "x+5 yp vf_radFavoriteFolderLiveExclude hidden " . (g_objEditedFavorite.FavoriteFolderLiveIncludeExclude ? "" : "checked"), %lDialogFavoriteFolderLiveExclude%
	Gui, 2:Add, Text, x20 y+10 w400 vf_lblFavoriteFolderLiveExtensions hidden, ... %lDialogFavoriteFolderLiveExtensions%
	Gui, 2:Add, Edit, x20 y+10 w400 vf_strFavoriteFolderLiveExtensions hidden, % g_objEditedFavorite.FavoriteFolderLiveExtensions
}

return
;------------------------------------------------------------


;------------------------------------------------------------
GuiFavoriteTabWindowOptions:
;------------------------------------------------------------

if InStr(g_strTypesForTabWindowOptions, g_objEditedFavorite.FavoriteType)
{
	Gui, 2:Tab, % ++intTabNumber

	;  0 for use default / 1 for remember, -1 Minimized / 0 Normal / 1 Maximized, Left (X), Top (Y), Width, Height, Delay, RestoreSide; for example: "1,0,100,50,640,480,200"
	StringSplit, arrNewFavoriteWindowPosition, g_strNewFavoriteWindowPosition, `,

	Gui, 2:Add, Checkbox, % "x20 y50 section vf_blnUseDefaultWindowPosition gCheckboxWindowPositionClicked " . (arrNewFavoriteWindowPosition1 ? "" : "checked"), %lDialogUseDefaultWindowPosition%
	
	Gui, 2:Add, Text, % "y+20 x20 section vf_lblWindowPositionState " . (arrNewFavoriteWindowPosition1 ? "" : "hidden"), %lDialogState%
	
	Gui, 2:Add, Radio, % "y+10 x20 vf_lblWindowPositionMinMax1 gRadioButtonWindowPositionMinMaxClicked" 
		. (arrNewFavoriteWindowPosition1 ? "" : " hidden") . (!arrNewFavoriteWindowPosition2 ? " checked" : ""), %lDialogNormal%
	Gui, 2:Add, Radio, % "y+10 x20 vf_lblWindowPositionMinMax2 gRadioButtonWindowPositionMinMaxClicked"
		. (arrNewFavoriteWindowPosition1 ? "" : " hidden") . (arrNewFavoriteWindowPosition2 = 1 ? " checked" : ""), %lDialogMaximized%
	Gui, 2:Add, Radio, % "y+10 x20 vf_lblWindowPositionMinMax3 gRadioButtonWindowPositionMinMaxClicked"
		. (arrNewFavoriteWindowPosition1 ? "" : " hidden") . (arrNewFavoriteWindowPosition2 = -1 ? " checked" : ""), %lDialogMinimized%

	Gui, 2:Add, Text, % "y+20 x20 vf_lblWindowPositionDelayLabel " . (arrNewFavoriteWindowPosition1 ? "" : "hidden"), %lDialogWindowPositionDelay%
	Gui, 2:Add, Edit, % "yp x+20 w36 center number limit5 vf_lblWindowPositionDelay " . (arrNewFavoriteWindowPosition1 ? "" : "hidden"), % (arrNewFavoriteWindowPosition7 = "" ? 200 : arrNewFavoriteWindowPosition7)
	Gui, 2:Add, Text, % "x+10 yp vf_lblWindowPositionMillisecondsLabel " . (arrNewFavoriteWindowPosition1 ? "" : "hidden"), %lGuiGroupRestoreDelayMilliseconds%
	Gui, 2:Add, Text, % "y+20 x20 vf_lblWindowPositionMayFail " . (arrNewFavoriteWindowPosition1 ? "" : "hidden"), %lDialogWindowPositionMayFail%
	
	Gui, 2:Add, Text, % "ys x200 section vf_lblWindowPosition " . (arrNewFavoriteWindowPosition1 and arrNewFavoriteWindowPosition2 = 0 ? "" : "hidden"), %lDialogWindowPosition%

	Gui, 2:Add, Text, % "ys+20 xs vf_lblWindowPositionX " . (arrNewFavoriteWindowPosition1 and arrNewFavoriteWindowPosition2 = 0 ? "" : "hidden"), %lDialogWindowPositionX%
	Gui, 2:Add, Text, % "ys+40 xs vf_lblWindowPositionY " . (arrNewFavoriteWindowPosition1 and arrNewFavoriteWindowPosition2 = 0 ? "" : "hidden"), %lDialogWindowPositionY%
	Gui, 2:Add, Text, % "ys+60 xs vf_lblWindowPositionW " . (arrNewFavoriteWindowPosition1 and arrNewFavoriteWindowPosition2 = 0 ? "" : "hidden"), %lDialogWindowPositionW%
	Gui, 2:Add, Text, % "ys+80 xs vf_lblWindowPositionH " . (arrNewFavoriteWindowPosition1 and arrNewFavoriteWindowPosition2 = 0 ? "" : "hidden"), %lDialogWindowPositionH%
	
	Gui, 2:Add, Edit, % "ys+20 xs+72 w36 h17 vf_intWindowPositionX center limit5 " . (arrNewFavoriteWindowPosition1 and arrNewFavoriteWindowPosition2 = 0 ? "" : "hidden"), %arrNewFavoriteWindowPosition3%
	Gui, 2:Add, Edit, % "ys+40 xs+72 w36 h17 vf_intWindowPositionY center limit5 " . (arrNewFavoriteWindowPosition1 and arrNewFavoriteWindowPosition2 = 0 ? "" : "hidden"), %arrNewFavoriteWindowPosition4%
	Gui, 2:Add, Edit, % "ys+60 xs+72 w36 h17 vf_intWindowPositionW center number limit5 " . (arrNewFavoriteWindowPosition1 and arrNewFavoriteWindowPosition2 = 0 ? "" : "hidden"), %arrNewFavoriteWindowPosition5%
	Gui, 2:Add, Edit, % "ys+80 xs+72 w36 h17 vf_intWindowPositionH center number limit5 " . (arrNewFavoriteWindowPosition1 and arrNewFavoriteWindowPosition2 = 0 ? "" : "hidden"), %arrNewFavoriteWindowPosition6%
}

return
;------------------------------------------------------------


;------------------------------------------------------------
GuiFavoriteTabAdvancedSettings:
;------------------------------------------------------------

if InStr(g_strTypesForTabAdvancedOptions, g_objEditedFavorite.FavoriteType)
{
	Gui, 2:Tab, % ++intTabNumber

	if (g_objEditedFavorite.FavoriteType = "Application")
	{
		Gui, 2:Add, Checkbox, x20 y50 w400 vf_blnFavoriteElevate, %lDialogElevate%
		GuiControl, , f_blnFavoriteElevate, % (g_objEditedFavorite.FavoriteElevate = 1)	
		Gui, 2:Add, Text, x20 y+20 w400, %lDialogWorkingDirLabel%
		Gui, 2:Add, Edit, x20 y+5 w400 Limit250 vf_strFavoriteAppWorkingDir, % g_objEditedFavorite.FavoriteAppWorkingDir
		Gui, 2:Add, Button, x+10 yp vf_btnBrowseAppWorkingDir gButtonSelectWorkingDir, %lDialogBrowseButton%
		Gui, 2:Add, Checkbox, x20 y+5 w500 vf_blnAppWorkingDirCurrent gButtonAppWorkingDirCurrentChanged, %lDialogAppWorkingDirCurrent%.
		GuiControl, , f_blnAppWorkingDirCurrent, % (g_objEditedFavorite.FavoriteAppWorkingDir = "{CUR_LOC}")
		Gosub, ButtonAppWorkingDirCurrentChanged
	}
	else if (g_objEditedFavorite.FavoriteType = "Group")
	{
		Gui, 2:Add, Text, x20 y50, %lGuiGroupRestoreDelay%
		Gui, 2:Add, Edit, x20 y+5 w50 center number Limit4 vf_intGroupRestoreDelay, %g_arrGroupSettingsGui3%
		Gui, 2:Add, Text, x+10 yp, %lGuiGroupRestoreDelayMilliseconds%
	}
	else if (g_objEditedFavorite.FavoriteType = "Snippet")
	{
		Gui, 2:Add, Text, x20 y50, %lDialogFavoriteSnippetSendMode%
		Gui, 2:Add, Radio, % "x20 y+10 vf_blnRadioSendModeText gSnippetModeChanged " . (arrFavoriteSnippetOptions1 <> 1 ? "checked" : ""), %lDialogFavoriteSnippetSendModeText%
		Gui, 2:Add, Radio, % "x20 y+5 vf_blnRadioSendModeMacro gSnippetModeChanged " . (arrFavoriteSnippetOptions1 = 1 ? "checked" : ""), %lDialogFavoriteSnippetSendModeMacro%
		
		Gui, 2:Add, Text, x20 y+15 vf_lblSnippetPrompt w400, % L(lDialogFavoriteSnippetPromptLabel, (arrFavoriteSnippetOptions1 = 1 ? lDialogFavoriteSnippetPromptLabelLaunching : lDialogFavoriteSnippetPromptLabelPasting))
		Gui, 2:Add, Edit, x20 y+5 w400 Limit250 vf_strFavoriteSnippetPrompt, %arrFavoriteSnippetOptions2%
		
		Gui, 2:Add, Link, x20 y+15 w500, % L(lDialogFavoriteSnippetHelpWeb, "http://www.quickaccesspopup.com/what-are-snippets/")
	}
	else ; Folder, Document, Special, URL and FTP 
	{
		Gui, 2:Add, Text, x20 y50 w400, %lDialogLaunchWith%
		Gui, 2:Add, Edit, x20 y+5 w400 Limit250 vf_strFavoriteLaunchWith, % g_objEditedFavorite.FavoriteLaunchWith
		Gui, 2:Add, Button, x+10 yp vf_btnFavoriteLaunchWith gButtonSelectLaunchWith, %lDialogBrowseButton%
	}

	if !InStr("Group|Snippet", g_objEditedFavorite.FavoriteType, true)
	{
		Gui, 2:Add, Text, y+20 x20 w400, %lDialogArgumentsLabel%
		Gui, 2:Add, Edit, x20 y+5 w400 Limit250 vf_strFavoriteArguments gFavoriteArgumentChanged, % g_objEditedFavorite.FavoriteArguments
		Gui, 2:Add, Text, x20 y+5 w500, %lDialogArgumentsLabelHelp%
		Gui, 2:Add, Text, x20 y+5 w500, %lDialogArgumentsPlaceholders%.
		Gui, 2:Add, Text, x20 y+5 w500, %lDialogArgumentsPlaceholdersCurrent%.
		
		Gui, 2:Add, Text, x20 y+10 w500 vf_PlaceholdersCheckLabel, %lDialogArgumentsPlaceholdersCheckLabel%
		Gui, 2:Add, Edit, x20 y+5 w500 vf_strPlaceholdersCheck ReadOnly
		
		gosub, FavoriteArgumentChanged
	}

	if (g_objEditedFavorite.FavoriteType = "FTP")
	{
		Gui, 2:Add, Checkbox, x20 y+5 vf_blnFavoriteFtpEncoding, % (g_intActiveFileManager = 3 ? lOptionsFtpEncodingTC : lOptionsFtpEncoding)
		GuiControl, , f_blnFavoriteFtpEncoding, % (g_blnNewFavoriteFtpEncoding ? true : false) ; condition in case empty value would be considered as no label
	}
}

strFavoriteSnippetOptions := ""
arrFavoriteSnippetOptions := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
GuiFavoriteTabExternal:
;------------------------------------------------------------

if (g_objEditedFavorite.FavoriteType = "External")
{
	StringSplit, arrExternalTypes, lDialogExternalTypes, |
	
	Gui, 2:Tab, % ++intTabNumber

	Loop, 3 ; no default type
		Gui, 2:Add, Radio, % (A_Index = 1 ? "x20 y50" : "x20 y+5") . " gRadioButtonExternalMenuClicked vf_radExternalMenuType" . A_Index, % arrExternalTypes%A_Index%

	if !ExternalMenuIsReadOnly(f_strFavoriteAppWorkingDir)
		Gui, 2:Add, Text, x20 y+15 w500, % L(lDialogFavoriteExternalSaveNote, (InStr(strGuiFavoriteLabel, "Add") ? lDialogAdd : lDialogOK))
	Gui, 2:Add, Link, x20 y+15 w500, % L(lDialogFavoriteExternalHelpWeb, "http://www.quickaccesspopup.com/can-a-submenu-be-shared-on-different-pcs-or-by-different-users/")
	
	; Gui, 2:Add, Checkbox, x20 y50 vf_blnExternalMenuReadOnly gExternalMenuReadOnlyClicked, %lDialogReadOnly%
	Gui, 2:Add, Text, x20 y+15 vf_lblExternalMenuName, %lDialogExternalMenuName%
	Gui, 2:Add, Edit, x20 y+5 w400 vf_strExternalMenuName
	
	Gui, 2:Add, Text, x20 y+15 vf_lblExternalWriteAccessUsers, %lDialogExternalWriteAccessUsers%
	Gui, 2:Add, Edit, x20 y+5 w400 vf_strExternalWriteAccessUsers
	
	Gui, 2:Add, Text, x20 y+15 vf_lblExternalWriteAccessMessage, %lDialogExternalWriteAccessMessage%
	Gui, 2:Add, Edit, x20 y+5 w400 r7 vf_strExternalWriteAccessMessage
	
	; Gui, 2:Add, Text, x20 y+15, %lDialogExternalStartingNumber% ; DEPRECATED since v8.1.9.1
	; Gui, 2:Add, Edit, % "x20 y+5 w50 center number Limit4 vf_intExternalStartingNumber " . (strGuiFavoriteLabel <> "GuiAddFavorite" ? "Disabled" : "")
	; 	, % (g_objEditedFavorite.FavoriteGroupSettings > 0 ? g_objEditedFavorite.FavoriteGroupSettings : 1) ; DEPRECATED since v8.1.9.1
	gosub, LoadExternalFileGlobalValues
	gosub, LoadExternalFileGlobalReadOnly
	gosub, RadioButtonExternalMenuInit
}

arrExternalTypes := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
RadioButtonExternalMenuInit:
RadioButtonExternalMenuClicked:
;------------------------------------------------------------

blnType3Before := f_radExternalMenuType3
Gui, 2:Submit, NoHide

if (A_ThisLabel = "RadioButtonExternalMenuClicked" and !blnType3Before and f_radExternalMenuType3)
{
	Oops(lOopsExternalReadOnlyAlert . "`n`n" . lOopsExternalReadOnlyAlertUsernameAdded, lDialogExternalWriteAccessUsers, A_UserName, A_ComputerName)
	if !InStr(f_strExternalWriteAccessUsers, A_UserName)
		GuiControl, , f_strExternalWriteAccessUsers, % f_strExternalWriteAccessUsers . (StrLen(f_strExternalWriteAccessUsers) ? ";" : "") . A_UserName
}

if (A_ThisLabel = "RadioButtonExternalMenuClicked" and ExternalMenuIsReadOnly(f_strFavoriteAppWorkingDir))
{
	GuiControl, , f_radExternalMenuType3, % 1
	Oops(lOopsErrorIniFileReadOnly . (StrLen(f_strExternalMenuName) ? "`n`n" . f_strExternalMenuName : "") . (StrLen(f_strExternalWriteAccessMessage) ? "`n`n" . f_strExternalWriteAccessMessage : ""))
	return
}

GuiControl, % (f_radExternalMenuType2 or f_radExternalMenuType3 ? "Show" : "Hide"), f_lblExternalMenuName
GuiControl, % (f_radExternalMenuType2 or f_radExternalMenuType3 ? "Show" : "Hide"), f_strExternalMenuName

GuiControl, % (f_radExternalMenuType3 ? "Show" : "Hide"), f_lblExternalWriteAccessUsers
GuiControl, % (f_radExternalMenuType3 ? "Show" : "Hide"), f_strExternalWriteAccessUsers

GuiControl, % (f_radExternalMenuType3 ? "Show" : "Hide"), f_lblExternalWriteAccessMessage
GuiControl, % (f_radExternalMenuType3 ? "Show" : "Hide"), f_strExternalWriteAccessMessage

blnType3Before := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
ButtonAppWorkingDirCurrentChanged:
;------------------------------------------------------------
Gui, 2:Submit, NoHide

GuiControl, 2:, f_strFavoriteAppWorkingDir, % (f_blnAppWorkingDirCurrent ? "{CUR_LOC}" : f_strFavoriteAppWorkingDir)

strEnableDisableCommand := (f_blnAppWorkingDirCurrent ? "Disable" : "Enable")
GuiControl, 2:%strEnableDisableCommand%, f_strFavoriteAppWorkingDir
GuiControl, 2:%strEnableDisableCommand%, f_btnBrowseAppWorkingDir
strEnableDisableCommand := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
SnippetModeChanged:
;------------------------------------------------------------
Gui, 2:Submit, NoHide

; change snippet prompt label according to snippet type
GuiControl, 2:, f_lblSnippetPrompt, % L(lDialogFavoriteSnippetPromptLabel, (f_blnRadioSendModeMacro = 1 ? lDialogFavoriteSnippetPromptLabelLaunching : lDialogFavoriteSnippetPromptLabelPasting))

return
;------------------------------------------------------------


;------------------------------------------------------------
ContentEditFontChanged:
;------------------------------------------------------------
Gui, 2:Submit, NoHide

g_blnContentEditFixedFont := f_blnFixedFont
g_blnContentEditFontSize := f_intFontSize

if (g_blnContentEditFixedFont)
	Gui, 2:Font, % "s" . g_blnContentEditFontSize, Courier New
else
	Gui, 2:Font, % "s" . g_blnContentEditFontSize
GuiControl, Font, f_strFavoriteLocation
Gui, 2:Font

return
;------------------------------------------------------------


;------------------------------------------------------------
GuiMoveMultipleFavoritesToMenu:
;------------------------------------------------------------
g_intGui1WinID := WinExist("A")

Gui, 2:New, , % L(lDialogMoveFavoritesTitle, g_strAppNameText, g_strAppVersion)
Gui, 2:+Owner1
Gui, 2:+OwnDialogs
if (g_blnUseColors)
	Gui, 2:Color, %g_strGuiWindowColor%

Gui, 2:Add, Text, % x10 y10 vf_lblFavoriteParentMenu, % L(lDialogFavoritesParentMenuMove, g_intFavoriteSelected)
Gui, 2:Add, DropDownList, x10 w300 vf_drpParentMenu gDropdownParentMenuChanged, % RecursiveBuildMenuTreeDropDown(g_objMainMenu, g_objMenuInGui.MenuPath, , true) ; include self but exclude read-only external

Gui, 2:Add, Text, x20 y+10 vf_lblFavoriteParentMenuPosition, %lDialogFavoriteMenuPosition%
Gui, 2:Add, DropDownList, x20 y+5 w290 vf_drpParentMenuItems AltSubmit

Gui, 2:Add, Button, y+20 vf_btnMoveFavoritesSave gGuiMoveMultipleFavoritesSave, %lGuiMoveAmpersand%
Gui, 2:Add, Button, yp vf_btnMoveFavoritesCancel gGuiEditFavoriteCancel, %lGuiCancelAmpersand%
GuiCenterButtons(L(lDialogMoveFavoritesTitle, g_strAppNameText, g_strAppVersion), 10, 5, 20, "f_btnMoveFavoritesSave", "f_btnMoveFavoritesCancel")

Gosub, DropdownParentMenuChanged ; to init the content of menu items

GuiControl, 2:Focus, f_drpParentMenu
Gosub, ShowGui2AndDisableGui1

return
;------------------------------------------------------------


;------------------------------------------------------------
ButtonChangeFavoriteHotkey:
;------------------------------------------------------------
Gui, 2:Submit, NoHide

if (g_objEditedFavorite.FavoriteType = "QAP")
	strQAPDefaultHotkey := g_objQAPFeatures[g_objQAPFeaturesCodeByDefaultName[f_drpQAP]].DefaultHotkey

strBackupFavoriteHotkey := g_strNewFavoriteHotkey
g_strNewFavoriteHotkey := SelectHotkey(g_strNewFavoriteHotkey, f_strFavoriteShortName, g_objEditedFavorite.FavoriteType, f_strFavoriteLocation, 3, strQAPDefaultHotkey)
if StrLen(g_strNewFavoriteHotkey)
	GuiControl, 2:, f_strHotkeyText, % Hotkey2Text(g_strNewFavoriteHotkey)
else
	g_strNewFavoriteHotkey := strBackupFavoriteHotkey

strQAPDefaultHotkey := ""
strBackupFavoriteHotkey := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
GuiAddFavoriteTabChanged:
;------------------------------------------------------------

if (f_intAddFavoriteTab = 1) ; if last tab was 1 we need to update the icon and external menu values
{
	Gui, 2:Submit, NoHide

	if !StrLen(g_strNewFavoriteIconResource) and StrLen(f_strFavoriteLocation)
		g_strNewFavoriteIconResource := GetFolderIcon(f_strFavoriteLocation)
	
	Gosub, GuiFavoriteIconDefault
	Gosub, GuiFavoriteIconDisplay

	if (g_blnExternalLocationChanged)
	{
		gosub, LoadExternalFileGlobalValues
		g_blnExternalLocationChanged := false
	}
}
; normally this should be called only if g_blnExternalLocationChanged but it need to run at each tab change to keep control's r-o option, do not know why
gosub, LoadExternalFileGlobalReadOnly

return
;------------------------------------------------------------


;------------------------------------------------------------
DropdownParentMenuChanged:
;------------------------------------------------------------
strPrevParentMenu := f_drpParentMenu ; backup previous menu in case we have to cancel
Gui, 2:Submit, NoHide

Loop, % g_objMenusIndex[f_drpParentMenu].MaxIndex()
{
	if (g_objMenusIndex[f_drpParentMenu][A_Index].FavoriteType = "B") ; skip ".." back link to parent menu
		or (g_objEditedFavorite.FavoriteName = g_objMenusIndex[f_drpParentMenu][A_Index].FavoriteName)
			and (g_objMenuInGui.MenuPath = g_objMenusIndex[f_drpParentMenu].MenuPath ; skip edited item itself if not a separator
			and !InStr("X|K", g_objMenusIndex[f_drpParentMenu][A_Index].FavoriteType)) ; but make sure to keep separators
		Continue
	else if (g_objMenusIndex[f_drpParentMenu][A_Index].FavoriteType = "X")
		strDropdownParentMenuItems .= g_strGuiMenuSeparator . g_strGuiMenuSeparator . "|"
	else if (g_objMenusIndex[f_drpParentMenu][A_Index].FavoriteType = "K")
		strDropdownParentMenuItems .= g_strGuiDoubleLine . " " . lMenuColumnBreak . " " . g_strGuiDoubleLine . "|"
	else
		strDropdownParentMenuItems .= g_objMenusIndex[f_drpParentMenu][A_Index].FavoriteName . "|"
}

GuiControl, , f_drpParentMenuItems, % "|" . strDropdownParentMenuItems . g_strGuiDoubleLine . " " . lDialogEndOfMenu . " " . g_strGuiDoubleLine
if (f_drpParentMenu = g_objMenuInGui.MenuPath) and (g_intOriginalMenuPosition <> 0xFFFF)
	GuiControl, Choose, f_drpParentMenuItems, % g_intOriginalMenuPosition - (g_objMenusIndex[f_drpParentMenu][1].FavoriteType = "B" ? 1 : 0)
else
	GuiControl, ChooseString, f_drpParentMenuItems, % g_strGuiDoubleLine . " " . lDialogEndOfMenu . " " . g_strGuiDoubleLine

strDropdownParentMenuItems := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
DropdownRunningApplicationChanged:
;------------------------------------------------------------
Gui, 2:Submit, NoHide

GuiControl, , f_strFavoriteLocation, %f_drpRunningApplication%

return
;------------------------------------------------------------


;------------------------------------------------------------
GuiOpenThisMenu:
;------------------------------------------------------------
Gosub, 2GuiClose

Gui, 1:Default
GuiControl, 1:Focus, f_lvFavoritesList
Gui, 1:ListView, f_lvFavoritesList

Gosub, OpenMenuFromEditForm

return
;------------------------------------------------------------


;------------------------------------------------------------
DropdownSpecialChanged:
;------------------------------------------------------------
Gui, 2:Submit, NoHide

GuiControl, , f_strFavoriteShortName, %f_drpSpecial%
GuiControl, , f_strFavoriteLocation, % g_objClassIdOrPathByDefaultName[f_drpSpecial]

g_strNewFavoriteIconResource := g_objSpecialFolders[g_objClassIdOrPathByDefaultName[f_drpSpecial]].DefaultIcon
g_strDefaultIconResource := g_strNewFavoriteIconResource 

return
;------------------------------------------------------------


;------------------------------------------------------------
DropdownQAPChanged:
;------------------------------------------------------------
Gui, 2:Submit, NoHide

GuiControl, , f_strFavoriteShortName, %f_drpQAP%
GuiControl, , f_strFavoriteLocation, % g_objQAPFeaturesCodeByDefaultName[f_drpQAP]

g_strNewFavoriteIconResource := g_objQAPFeatures[g_objQAPFeaturesCodeByDefaultName[f_drpQAP]].DefaultIcon
g_strDefaultIconResource := g_strNewFavoriteIconResource 

g_strNewFavoriteHotkey := g_objQAPFeatures[g_objQAPFeaturesCodeByDefaultName[f_drpQAP]].DefaultHotkey
; check if hotkey is already used, if yes empty default new hotkey
g_strNewFavoriteHotkey := (StrLen(GetHotkeyLocation(g_strNewFavoriteHotkey)) ? "" : g_strNewFavoriteHotkey)

GuiControl, , f_strHotkeyText, % Hotkey2Text(g_strNewFavoriteHotkey)

strExistingNameLocation := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
EditFavoriteLocationChanged:
EditFavoriteExternalLocationChanged:
;------------------------------------------------------------
Gui, 2:Submit, NoHide

if !StrLen(f_strFavoriteShortName)
	GuiControl, 2:, f_strFavoriteShortName, % GetDeepestFolderName((A_ThisLabel = "EditFavoriteLocationChanged" ? f_strFavoriteLocation : f_strFavoriteAppWorkingDir))

if InStr("Folder|Document|Application", g_objEditedFavorite.FavoriteType)
	g_strNewFavoriteIconResource := ""

if (A_ThisLabel = "EditFavoriteExternalLocationChanged")
{
	g_blnExternalLocationChanged := true ; will update external menu values in advanced tab when GuiAddFavoriteTabChanged

	if !StrLen(f_strFavoriteShortName) and FileExist(f_strFavoriteAppWorkingDir)
	{
		IniRead, strExternalMenuName, %f_strFavoriteAppWorkingDir%, Global, MenuName, %A_Space% ; empty if not found
		if StrLen(strExternalMenuName)
			GuiControl, 2:, f_strFavoriteShortName, %strExternalMenuName%
	}
}

return
;------------------------------------------------------------


;------------------------------------------------------------
ProcessEOLTabChanged:
;------------------------------------------------------------
Gui, 2:Submit, NoHide

strSnippetFormatBefore := g_strSnippetFormat
if (strSnippetFormatBefore = "raw" and f_blnProcessEOLTab)
{
	; DecodeSnippet: convert from "raw" content (as from ini file) to "display" format (when f_blnProcessEOLTab is true)
	GuiControl, , f_strFavoriteLocation, % DecodeSnippet(f_strFavoriteLocation)
	g_strSnippetFormat := "display"
}
if (strSnippetFormatBefore = "display" and !f_blnProcessEOLTab)
{
	; EncodeSnippet: convert from "display" format (when in gui f_blnProcessEOLTab was true) to "raw" content (when f_blnProcessEOLTab is false), ready for saving to in file
	GuiControl, , f_strFavoriteLocation, % EncodeSnippet(f_strFavoriteLocation)
	g_strSnippetFormat := "raw"
}

; change help text according to encoding state
GuiControl, 2:, f_lblSnippetHelp, % (f_blnProcessEOLTab ? lDialogFavoriteSnippetHelpProcess : lDialogFavoriteSnippetHelpNoProcess) . "`n" . L(lDialogFavoriteSnippetHelpWeb, "http://www.quickaccesspopup.com/what-are-snippets/")

strSnippetFormatBefore := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
FavoriteArgumentChanged:
;------------------------------------------------------------
Gui, 2:Submit, NoHide

GuiControl, % (InStr(f_strFavoriteArguments, "{") ? "Show" : "Hide"), f_PlaceholdersCheckLabel
GuiControl, % (InStr(f_strFavoriteArguments, "{") ? "Show" : "Hide"), f_strPlaceholdersCheck

GuiControl, 2:, f_strPlaceholdersCheck, % ExpandPlaceholders(f_strFavoriteArguments, f_strFavoriteLocation, lDialogArgumentsPlaceholdersCurrentExample)

return
;------------------------------------------------------------


;------------------------------------------------------------
ButtonSelectFavoriteLocation:
ButtonSelectWorkingDir:
ButtonSelectLaunchWith:
ButtonSelectExternalSettingsFile:
;------------------------------------------------------------
Gui, 2:Submit, NoHide
Gui, 2:+OwnDialogs

if (A_ThisLabel = "ButtonSelectFavoriteLocation")
{
	strDefault := f_strFavoriteLocation
	strType := (g_objEditedFavorite.FavoriteType = "Folder" ? "Folder" : "File")
}
else if InStr("ButtonSelectWorkingDir|ButtonSelectExternalSettingsFile", A_ThisLabel)
{
	strDefault := f_strFavoriteAppWorkingDir ; working directory or external menu settings file
	strType := (A_ThisLabel = "ButtonSelectWorkingDir" ? "Folder" : "IniFile") ; file if External settings file
}
else ; ButtonSelectLaunchWith
{
	strDefault := f_strFavoriteLaunchWith
	strType := "File"
}

if (strType = "Folder")
	FileSelectFolder, strNewLocation, *%strDefault%, 3, %lDialogAddFolderSelect%
else if (strType = "File")
	; do not use option "S" because it gives an error message on read-only supports
	FileSelectFile, strNewLocation, 3, %strDefault%, %lDialogAddFileSelect%
else ; IniFile
{
	; do not use option "S" because it gives an error message on read-only supports
	FileSelectFile, strNewLocation, , %strDefault%, %lDialogAddFileSelect%, *.ini ; removed option 8 to prompt to create a new file because not user friendly
	if StrLen(strNewLocation) and !StrLen(GetFileExtension(strNewLocation))
		strNewLocation .= ".ini"
}

if !(StrLen(strNewLocation))
{
	gosub, ButtonSelectFavoriteLocationCleanup
	return
}

if InStr("ButtonSelectWorkingDir|ButtonSelectExternalSettingsFile", A_ThisLabel)
	GuiControl, 2:, f_strFavoriteAppWorkingDir, %strNewLocation%
else if (A_ThisLabel = "ButtonSelectLaunchWith")
	GuiControl, 2:, f_strFavoriteLaunchWith, %strNewLocation%
else
{
	GuiControl, 2:, f_strFavoriteLocation, %strNewLocation%
	if !StrLen(f_strFavoriteShortName)
		GuiControl, 2:, f_strFavoriteShortName, % GetDeepestFolderName(strNewLocation)
}

ButtonSelectFavoriteLocationCleanup:
strNewLocation := ""
strDefault := ""
strType := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
GuiPickIconDialog:
GuiEditIconDialog:
;------------------------------------------------------------
Gui, 2:Submit, NoHide
Gui, 2:+OwnDialogs

if InStr("Document|Application", g_objEditedFavorite.FavoriteType) and !StrLen(f_strFavoriteLocation)
{
	Oops(lPickIconNoLocation)
	return
}

if (A_ThisLabel = "GuiEditIconDialog")
	; InputBox, g_strNewFavoriteIconResource, title, prompt, hide, width, height, x, y, font, timeout, %g_strNewFavoriteIconResource%
	InputBox, g_strNewFavoriteIconResource, %g_strAppNameFile% - %lDialogEditIcon%, %lDialogEditIconPrompt%, , 400, 160, , , , , %g_strNewFavoriteIconResource%
else
	g_strNewFavoriteIconResource := PickIconDialog(g_strNewFavoriteIconResource)

Gosub, GuiFavoriteIconDisplay

return
;------------------------------------------------------------


;------------------------------------------------------------
GuiRemoveIcon:
;------------------------------------------------------------
Gui, 2:Submit, NoHide

g_strNewFavoriteIconResource := ""
Gosub, GuiFavoriteIconDefault

Gosub, GuiFavoriteIconDisplay

return
;------------------------------------------------------------


;------------------------------------------------------------
GuiFavoriteIconDefault:
;------------------------------------------------------------
Gui, 2:Submit, NoHide

g_strDefaultIconResource := GetDefaultIcon4Type(g_objEditedFavorite, f_strFavoriteLocation)

if !StrLen(g_strNewFavoriteIconResource) or (g_strNewFavoriteIconResource = g_objJLiconsByName["iconUnknown"])
	g_strNewFavoriteIconResource := g_strDefaultIconResource

return
;------------------------------------------------------------


;------------------------------------------------------------
GuiFavoriteIconDisplay:
;------------------------------------------------------------

strExpandedIconRessource := EnvVars(g_strNewFavoriteIconResource)
ParseIconResource(strExpandedIconRessource, strThisIconFile, intThisIconIndex)
GuiControl, , f_picIcon, *icon%intThisIconIndex% %strThisIconFile%
GuiControl, % (strExpandedRessourceIcon <> EnvVars(g_strDefaultIconResource) ? "Show" : "Hide"), f_lblRemoveIcon

strThisFolder := (g_objEditedFavorite.FavoriteType = "Folder" and StrLen(f_strFavoriteLocation) ? PathCombine(A_WorkingDir, EnvVars(f_strFavoriteLocation)) : "")
blnThisDesktopIniExist := (StrLen(strThisFolder) ? FileExist(strThisFolder . "\desktop.ini") : false)
strCurrentDesktopIcon := (StrLen(strThisFolder) ? GetFolderIcon(strThisFolder) : "")

GuiControl, % (g_objEditedFavorite.FavoriteType = "Folder" and strExpandedIconRessource <> EnvVars(g_strDefaultIconResource)
	or (blnThisDesktopIniExist) ? "Show" : "Hide"), f_lblSetWindowsFolderIcon

; compare g_strNewFavoriteIconResource expanded and not expanded because if could be expanded or not in desktop.ini
GuiControl, , f_lblSetWindowsFolderIcon
	, % "<a>"
	. (strCurrentDesktopIcon = g_strNewFavoriteIconResource or strCurrentDesktopIcon = EnvVars(g_strNewFavoriteIconResource)
		or (blnThisDesktopIniExist and g_strNewFavoriteIconResource = g_strDefaultIconResource)
	? lDialogWindowsFolderIconRemove : lDialogWindowsFolderIconSet)
	. "</a>"

/* BK
GuiControl, % (g_objEditedFavorite.FavoriteType = "Folder" and strExpandedIconRessource <> EnvVars(g_strDefaultIconResource) ? "Show" : "Hide"), f_lblSetWindowsFolderIcon
strCurrentDesktopIcon := GetFolderIcon(f_strFavoriteLocation)
; compare g_strNewFavoriteIconResource expanded and not expanded because if could be expanded or not in desktop.ini
GuiControl, , f_lblSetWindowsFolderIcon
	, % "<a>" . (strCurrentDesktopIcon = g_strNewFavoriteIconResource or strCurrentDesktopIcon = EnvVars(g_strNewFavoriteIconResource) 
	? lDialogWindowsFolderIconRemove : lDialogWindowsFolderIconSet) . "</a>"
*/

strExpandedRessourceIcon := ""
strThisIconFile := ""
intThisIconIndex := ""
strThisFolder := ""
blnThisDesktopIniExist := ""
strCurrentDesktopIcon := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
CheckboxFolderLiveClicked:
;------------------------------------------------------------
Gui, 2:Submit, NoHide

strShowHideCommand := (f_blnFavoriteFolderLive ? "Show" : "Hide")

GuiControl, %strShowHideCommand%, f_lblFavoriteFolderLiveOptions
GuiControl, %strShowHideCommand%, f_lblFavoriteFolderLiveLevels
GuiControl, %strShowHideCommand%, f_intFavoriteFolderLiveLevelsEdit
GuiControl, %strShowHideCommand%, f_intFavoriteFolderLiveLevels
if (f_blnFavoriteFolderLive and !StrLen(f_intFavoriteFolderLiveLevels))
	GuiControl, , f_intFavoriteFolderLiveLevels, 1
GuiControl, %strShowHideCommand%, f_lblFavoriteFolderLiveColumns
GuiControl, %strShowHideCommand%, f_intFavoriteFolderLiveColumnsEdit
GuiControl, %strShowHideCommand%, f_intFavoriteFolderLiveColumns
GuiControl, %strShowHideCommand%, f_blnFavoriteFolderLiveDocuments

; GuiControl, % (f_blnFavoriteFolderLive ? "Disable" : "Enable"), f_blnUseDefaultWindowPosition

GuiControl, , f_strFavoriteLaunchWith, % (f_blnFavoriteFolderLive ? "" : f_strFavoriteLaunchWith)
GuiControl, % (f_blnFavoriteFolderLive ? "Disable" : "Enable"), f_strFavoriteLaunchWith
GuiControl, % (f_blnFavoriteFolderLive ? "Disable" : "Enable"), f_btnFavoriteLaunchWith

GuiControl, , f_strFavoriteArguments, % (f_blnFavoriteFolderLive ? "" : f_strFavoriteArguments)
GuiControl, % (f_blnFavoriteFolderLive ? "Disable" : "Enable"), f_strFavoriteArguments

GuiControl, , f_blnFavoriteFolderLiveDocuments, % (f_blnFavoriteFolderLive ? f_blnFavoriteFolderLiveDocuments : false)
gosub, CheckboxFolderLiveDocumentsClicked

gosub, CheckboxFolderLiveChangeWindowPositionTab

strShowHideCommand := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
CheckboxFolderLiveDocumentsClicked:
;------------------------------------------------------------
Gui, 2:Submit, NoHide

strShowHideCommand := (f_blnFavoriteFolderLiveDocuments ? "Show" : "Hide")

GuiControl, %strShowHideCommand%, f_radFavoriteFolderLiveInclude
GuiControl, %strShowHideCommand%, f_radFavoriteFolderLiveExclude
GuiControl, %strShowHideCommand%, f_lblFavoriteFolderLiveExtensions
GuiControl, %strShowHideCommand%, f_strFavoriteFolderLiveExtensions
GuiControl, , % (f_blnFavoriteFolderLiveDocuments ? "" : f_strFavoriteFolderLiveExtensions)

strShowHideCommand := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
CheckboxWindowPositionClicked:
RadioButtonWindowPositionMinMaxClicked:
CheckboxFolderLiveChangeWindowPositionTab:
;------------------------------------------------------------
Gui, 2:Submit, NoHide

GuiControl, % (f_blnFavoriteFolderLive ? "Disable" : "Enable"), f_blnUseDefaultWindowPosition

strShowHideCommand := (!f_blnUseDefaultWindowPosition and (!f_blnFavoriteFolderLive) ? "Show" : "Hide")

GuiControl, %strShowHideCommand%, f_lblWindowPositionState
GuiControl, %strShowHideCommand%, f_lblWindowPositionMinMax1
GuiControl, %strShowHideCommand%, f_lblWindowPositionMinMax2
GuiControl, %strShowHideCommand%, f_lblWindowPositionMinMax3

GuiControl, %strShowHideCommand%, f_lblWindowPositionDelayLabel
GuiControl, %strShowHideCommand%, f_lblWindowPositionDelay
GuiControl, %strShowHideCommand%, f_lblWindowPositionMillisecondsLabel
GuiControl, %strShowHideCommand%, f_lblWindowPositionMayFail

strShowHideCommand := (!f_blnUseDefaultWindowPosition and f_lblWindowPositionMinMax1 and !f_blnFavoriteFolderLive ? "Show" : "Hide")

GuiControl, %strShowHideCommand%, f_lblWindowPosition
GuiControl, %strShowHideCommand%, f_lblWindowPositionX
GuiControl, %strShowHideCommand%, f_intWindowPositionX
GuiControl, %strShowHideCommand%, f_lblWindowPositionY
GuiControl, %strShowHideCommand%, f_intWindowPositionY
GuiControl, %strShowHideCommand%, f_lblWindowPositionW
GuiControl, %strShowHideCommand%, f_intWindowPositionW
GuiControl, %strShowHideCommand%, f_lblWindowPositionH
GuiControl, %strShowHideCommand%, f_intWindowPositionH

strShowHideCommand := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
HotkeyChangeMenu:
;------------------------------------------------------------

Gui, 1:ListView, f_lvFavoritesList

g_intOriginalMenuPosition := LV_GetNext()

if InStr("Menu|Group|External", g_objMenuInGui[g_intOriginalMenuPosition].FavoriteType, true)
	Gosub, OpenMenuFromGuiHotkey

return
;------------------------------------------------------------


;------------------------------------------------------------
GuiMenusListChanged:
GuiGotoUpMenu:
GuiGotoPreviousMenu:
OpenMenuFromEditForm:
OpenMenuFromGuiHotkey:
OpenMenuFromGuiSearch:
;------------------------------------------------------------

intCurrentLastPosition := 0

if (A_ThisLabel = "GuiMenusListChanged")
{
	GuiControlGet, strNewDropdownMenu, , f_drpMenusList

	if (strNewDropdownMenu = g_objMenuInGui.MenuPath) ; user selected the current menu in the dropdown
	{
		gosub, GuiMenusListChangedCleanup
		return
	}
}

if (A_ThisLabel = "GuiGotoPreviousMenu")
{
	g_objMenuInGui := g_objMenusIndex[g_arrSubmenuStack[1]] ; pull the top menu from the left arrow stack
	g_arrSubmenuStack.Remove(1) ; remove the top menu from the left arrow stack

	intCurrentLastPosition := g_arrSubmenuStackPosition[1] ; pull the focus position in top menu from the left arrow stack
	g_arrSubmenuStackPosition.Remove(1) ; remove the top position from the left arrow stack
}
else
{
	g_arrSubmenuStack.Insert(1, g_objMenuInGui.MenuPath) ; push the current menu to the left arrow stack
	
	; ###_V(A_ThisLabel, g_objMenuInGui.MenuPath)
	; ###_O("g_objMenuInGui", g_objMenuInGui, "FavoriteName")
	; ###_O("g_objMenuInGui[1]", g_objMenuInGui[1])
	if (A_ThisLabel = "GuiMenusListChanged")
		objNewMenuInGui := g_objMenusIndex[strNewDropdownMenu]
	else if (A_ThisLabel = "GuiGotoUpMenu")
		objNewMenuInGui := g_objMenuInGui[1].ParentMenu
	else if (A_ThisLabel = "OpenMenuFromEditForm") or (A_ThisLabel = "OpenMenuFromGuiHotkey")
		objNewMenuInGui := g_objMenuInGui[g_intOriginalMenuPosition].SubMenu
	else if (A_ThisLabel = "OpenMenuFromGuiSearch")
		objNewMenuInGui := g_objMenuInGui ;  we already have the menu object in g_objMenuInGui from the search event
	
	g_objMenuInGui := objNewMenuInGui
	
	g_arrSubmenuStackPosition.Insert(1, LV_GetNext("Focused"))
}

GuiControl, % (g_arrSubmenuStack.MaxIndex() ? "Show" : "Hide"), f_picPreviousMenu
GuiControl, % (g_objMenuInGui.MenuPath <> lMainMenuName ? "Show" : "Hide"), f_picUpMenu

gosub, GuiFavoritesListFilterEmpty ; restore regular favorites list with g_objMenuInGui

if (A_ThisLabel = "OpenMenuFromGuiSearch")
	Gosub, LoadMenuInGuiFromGuiSearch
else
	Gosub, LoadMenuInGui

if (intCurrentLastPosition) ; we went to a previous menu
{
	LV_Modify(0, "-Select")
	LV_Modify(intCurrentLastPosition, "Select Focus Vis")
}

if (A_ThisLabel = "GuiMenusListChanged") ; keep focus on dropdown list
	GuiControl, Focus, f_drpMenusList

GuiMenusListChangedCleanup:
intCurrentLastPosition := ""
strNewDropdownMenu := ""
objNewMenuInGui := ""
strWriteAccessMessage := ""
strExternalMenuName := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
GuiAddFavoriteCancel:
GuiEditFavoriteCancel:
;------------------------------------------------------------

Gosub, GuiAddFavoriteFlush
Gosub, 2GuiClose

return
;------------------------------------------------------------


;------------------------------------------------------------
GuiFocusFilter:
;------------------------------------------------------------

GuiControl, 1:Focus, f_strFavoritesListFilter
if (g_blnFavoritesListFilterNeverFocused)
{
	GuiControl, 1:, f_strFavoritesListFilter, % ""
	g_blnFavoritesListFilterNeverFocused := false
}

return
;------------------------------------------------------------


;------------------------------------------------------------
GuiShow:
GuiShowFromAlternative:
SettingsHotkey:
GuiShowFromTray:
; next labels are not required, they could be GuiShow (but keep them in case of future debugging needs)
GuiShowFromGuiOptions:
GuiShowFromGuiAddFavoriteSelectType:
GuiShowFromAddThisFolder:
GuiShowFromHotkeysManage:
GuiShowFromIconsManage:
GuiShowFromGuiSettings:
GuiShowFromExternalCatalogue:
GuiShowNeverCalled:
;------------------------------------------------------------

if (A_ThisLabel <> "GuiShowFromAlternative" and A_ThisLabel <> "GuiShowFromGuiSettings") ; menu object already set if from Alternative hotkey
	g_objMenuInGui := g_objMainMenu

Gosub, BackupMenusObjects

if (A_ThisLabel = "GuiShowFromAlternative")
	Gosub, LoadMenuInGuiFromAlternative
else
	Gosub, LoadMenuInGui

g_blnFavoritesListFilterNeverFocused := true
GuiControl, 1:, f_strFavoritesListFilter, %lDialogSearch%

; Diag(A_ThisLabel, "")
Gui, 1:Show

GuiShowCleanup:
blnSaveEnabled := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
GetFolderIcon(strFolderLocation)
;------------------------------------------------------------
{
	; if strFolderLocation has a relative path, make it absolute based on the working directry before reading desktop.ini
	strFolderDesktopIni := PathCombine(A_WorkingDir, EnvVars(strFolderLocation)) . "\desktop.ini"
	
	IniRead, strDesktopIconFileIndex, %strFolderDesktopIni%, .ShellClassInfo, IconResource, %A_Space%
	
	if StrLen(strDesktopIconFileIndex)
	{
		strDesktopIconFile := SubStr(strDesktopIconFileIndex, 1, InStr(strDesktopIconFileIndex, ",") - 1)
		intDesktopIconIndex := SubStr(strDesktopIconFileIndex, InStr(strDesktopIconFileIndex, ",") + 1)
	}
	else
	{
		; IconFile and IconIndex are deprecated since Vista but still supported
		IniRead, strDesktopIconFile, %strFolderDesktopIni%, .ShellClassInfo, IconFile, %A_Space%
		IniRead, intDesktopIconIndex, %strFolderDesktopIni%, .ShellClassInfo, IconIndex, 0
	}

	; when retrieving an icon from a desktop.ini file, if the icon resource has relative path make it absolute based on the favorite folder (not the working directory)
	if StrLen(strDesktopIconFile)
		strDesktopIconFileIndex := PathCombine(strFolderLocation, EnvVars(strDesktopIconFile)) . ","
			. intDesktopIconIndex + (intDesktopIconIndex >= 0 ? 1 : 0) ; adjust index for positive index only (not for negative index)
	
	return strDesktopIconFileIndex
}
;------------------------------------------------------------


;------------------------------------------------------------
SetWindowsFolderIcon:
;------------------------------------------------------------
Gui, 2:Submit, NoHide

GuiControlGet, strSetWindowsFolderIconLabel, , f_lblSetWindowsFolderIcon
blnSet := (strSetWindowsFolderIconLabel = "<a>" . lDialogWindowsFolderIconSet . "</a>") ; else lDialogWindowsFolderIconRemove

strFolder := PathCombine(A_WorkingDir, EnvVars(f_strFavoriteLocation))
strFolderDesktopIni := strFolder . "\desktop.ini" 
strDesktopIniAttrib := FileExist(strFolderDesktopIni)
blnDesktopIniExist := StrLen(strDesktopIniAttrib)
SplitPath, strFolderDesktopIni, , strDir, , , strDrive
blnFolderIsRoot := (strDir = strDrive . "\")

if (blnSet)
{
	if (blnFolderIsRoot)
	{
		Oops(lDialogWindowsFolderIconNoRoot)
		Gosub, SetWindowsFolderIconCleanup
		return
	}
	
	strVerb := (blnDesktopIniExist ? lDialogWindowsFolderIconUpdate : lDialogWindowsFolderIconCreate)
	strMessage := L(lDialogWindowsFolderIconPrompt, strVerb, strFolderDesktopIni) . "`n`n" . lDialogWindowsFolderIconPrompt2
	MsgBox, 4, %g_strAppNameText%, %strMessage%
}
else ; remove
{
	strMessage := L(lDialogWindowsFolderIconReset)
	strMessageRemove := L(lDialogWindowsFolderIconRemoveFile, strFolderDesktopIni)
	MsgBox, 4, %g_strAppNameText%, %strMessage%
}

IfMsgBox, No
{
	Gosub, SetWindowsFolderIconCleanup
	return
}

if (g_strCurrentBranch <> "prod" and blnDesktopIniExist)
{
	FileCopy, %strFolderDesktopIni%, %strFolderDesktopIni%-BK.txt, 1 ; overwrite
	FileSetAttrib, -S-H, %strFolderDesktopIni%-BK.txt ; make it normal file
}

if (blnDesktopIniExist)
{
	; In any case, if they exist, remove deprecated values IconFile and IconIndex (deprecated after XP)
	IniDelete, %strFolderDesktopIni%, .ShellClassInfo, IconFile
	IniDelete, %strFolderDesktopIni%, .ShellClassInfo, IconIndex
}

if (blnSet)
{
	FileSetAttrib, +R, %strFolder%, 2 ; make sure folder is read-only to display icon (was system in previous doc)
 
	; From: https://msdn.microsoft.com/en-us/library/cc144102.aspx
	ParseIconResource(g_strNewFavoriteIconResource, strIconFile, intIconIndex)
	StringReplace, strIconFile, strIconFile, %strFolder%\ ; remove current folder from resource path to make it movable with the folder
	intIconIndex := (intIconIndex >= 0 ? intIconIndex - 1 : intIconIndex) ; adjust index for positive index only (not for negative index)
	IniWrite %strIconFile%`,%intIconIndex%, %strFolderDesktopIni%, .ShellClassInfo, IconResource
	; ConfirmFileOp -> Set this entry to 0 to avoid a "You Are Deleting a System Folder" warning when deleting or moving the folder.
	IniWrite 0, %strFolderDesktopIni%, .ShellClassInfo, ConfirmFileOp

	if !(blnDesktopIniExist) ; the file is new
		FileSetAttrib, +H+S, %strFolderDesktopIni% ; make it system and hidden
}
else ; remove
{
	IniDelete, %strFolderDesktopIni%, .ShellClassInfo, IconResource

	MsgBox, 4, %g_strAppNameText%, % L(strMessageRemove, strFolderDesktopIni)
	IfMsgBox, Yes
	{
		FileSetAttrib, -R, %strFolder%, 2 ; remove read-only (was system) attribute from folder
		FileDelete, %strFolderDesktopIni%
	}
}

gosub, GuiFavoriteIconDisplay

SetWindowsFolderIconCleanup:
blnSet := ""
strSetWindowsFolderIconLabel := ""
strFolder := ""
strFolderDesktopIni := ""
strDesktopIniAttrib := ""
blnDesktopIniExist := ""
strDir := ""
strDrive := ""
blnFolderIsRoot := ""
strMessage := ""
strVerb := ""
strMessageRemove := ""
strIconFile := ""
intIconIndex := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
LoadExternalFileGlobalValues:
;------------------------------------------------------------

strExternalExpandedFileName := PathCombine(A_WorkingDir, EnvVars(f_strFavoriteAppWorkingDir))
if StrLen(GetFileExtension(strExternalExpandedFileName)) = 0
	strExternalExpandedFileName .= ".ini"

IniRead, intMenuExternalType, %strExternalExpandedFileName%, Global, MenuType ; 1 Personal, 2 Collaborative or 3 Centralized (no default)

if (intMenuExternalType <> "ERROR")
{
	GuiControl, , % "f_radExternalMenuType" . intMenuExternalType, % 1
	gosub, RadioButtonExternalMenuInit
}
else
{
	intMenuExternalType := ""
	return
}

IniRead, blnExternalMenuReadOnly, %strExternalExpandedFileName%, Global, MenuReadOnly, 0 ; false if not found
; deprecated since v8.1.1 but still supported ix exists in ini file
; GuiControl, , f_blnExternalMenuReadOnly, %blnExternalMenuReadOnly%

IniRead, strExternalMenuName, %strExternalExpandedFileName%, Global, MenuName, %A_Space% ; empty if not found
GuiControl, , f_strExternalMenuName, %strExternalMenuName%

IniRead, strExternalWriteAccessUsers, %strExternalExpandedFileName%, Global, WriteAccessUsers, %A_Space% ; empty if not found
GuiControl, , f_strExternalWriteAccessUsers, %strExternalWriteAccessUsers%

IniRead, strExternalWriteAccessMessage, %strExternalExpandedFileName%, Global, WriteAccessMessage, %A_Space% ; empty if not found
GuiControl, , f_strExternalWriteAccessMessage, %strExternalWriteAccessMessage%

blnExternalMenuReadOnly := ""
strExternalMenuName := ""
strExternalWriteAccessUsers := ""
strExternalWriteAccessMessage := ""
intMenuExternalType := ""
strExternalExpandedName := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
LoadExternalFileGlobalReadOnly:
;------------------------------------------------------------

; read-only menu can be editable if user is in ExternalWriteAccessUsers
strReadOnlyPrefix := (ExternalMenuIsReadOnly(f_strFavoriteAppWorkingDir) ? "+" : "-")

GuiControl, 2:%strReadOnlyPrefix%ReadOnly, f_strExternalMenuName
GuiControl, 2:%strReadOnlyPrefix%ReadOnly, f_strExternalWriteAccessUsers
GuiControl, 2:%strReadOnlyPrefix%ReadOnly, f_strExternalWriteAccessMessage

strReadOnlyPrefix := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
AddExternalMenusFromCatalogue:
AddExternalCatalogueFromQAPFeature:
;------------------------------------------------------------

if (A_ThisLabel = "AddExternalCatalogueFromQAPFeature")
	gosub, GuiShowFromExternalCatalogue
else
	gosub, 2GuiClose

g_intGui1WinID := WinExist("A")

Gui, 2:New, , % L(lDialogExternalMenuAddFromCatalogue, g_strAppNameText, g_strAppVersion)
Gui, 2:+Owner1
Gui, 2:+OwnDialogs
if (g_blnUseColors)
	Gui, 2:Color, %g_strGuiWindowColor%

Gui, 2:Add, Text, , % L(lDialogExternalMenuSelectFromCatalogue, lDialogExternalMenuAdd)
Gui, 2:Add, ListView, % "vf_lvExternalMenusCatalogue Count32 Checked " . (g_blnUseColors ? "c" . g_strGuiListviewTextColor . " Background" . g_strGuiListviewBackgroundColor : "") 
	. " gExternalMenusCatalogueListEvents x10 y+10 w640 h340 AltSubmit", %lDialogExternalMenuAddHeader%

Gui, 2:Add, Text, x10 w640 center, %lDialogExternalTip%
Gui, 2:Add, Text
Gui, 2:Add, Button, x10 gButtonAddExternalMenusFromCatalogue vf_btnAddExternalMenusFromCatalogue default, %lDialogExternalMenuAdd%
Gui, 2:Add, Button, x+20 yp gButtonAddExternalMenusNotFromCatalogue vf_btnAddExternalMenusNotFromCatalogue, %lDialogExternalMenuAddNotFromCatalogue%
Gui, 2:Add, Button, x+20 yp gButtonAddExternalMenusFromCatalogueClose vf_btrAddExternalMenusFromCatalogueClose, %lGuiClose%
Gui, 2:Add, Text
	
strExpandedPath := PathCombine(A_WorkingDir, EnvVars(g_strExternalMenusCataloguePath))

Loop, Files, %strExpandedPath%\*.ini, R
{
	if InStr(A_LoopFileFullPath, "-backup-20") ; if include "-backup-YYYYMMDD"
		Continue
	IniRead, strName, %A_LoopFileFullPath%, Global, MenuName, %A_Space%
	StringReplace, strName, strName, &&, &, All
	LV_Add("", strName, A_LoopFileFullPath)
}
LV_ModifyCol(, "")

GuiCenterButtons(L(lDialogExternalMenuAddFromCatalogue, g_strAppNameText, g_strAppVersion), 20, 10, , "f_btnAddExternalMenusFromCatalogue", "f_btnAddExternalMenusNotFromCatalogue", "f_btrAddExternalMenusFromCatalogueClose")

Gosub, ShowGui2AndDisableGui1

strExpandedPath := ""
strName := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
ExternalMenusCatalogueListEvents:
;------------------------------------------------------------

if (A_GuiEvent = "DoubleClick")
{
	Gui, 2:+OwnDialogs
	LV_GetText(strFile, A_EventInfo, 2)
	IniRead, strValue, %strFile%, Global, MenuName, %A_Space%
	strTitle := lDialogAddFavoriteTabsExternal . " - " . strValue
	strMessage := lDialogExternalMenuName . ":`n" . (StrLen(strValue) ? strValue : lDialogNone) . "`n`n"
	IniRead, strValue, %strFile%, Global, MenuType, %A_Space%
	StringSplit, arrExternalTypes, lDialogExternalTypes, |
	strMessage .= lDialogExternalTypesLabel . ":`n" . (StrLen(strValue) ? arrExternalTypes%strValue% . " (" . strValue . ")": lDialogNone) . "`n`n"
	IniRead, strValue, %strFile%, Global, WriteAccessUsers, %A_Space%
	strMessage .= lDialogExternalWriteAccessUsers . ":`n" . (StrLen(strValue) ? strValue : lDialogNone) . "`n`n"
	IniRead, strValue, %strFile%, Global, WriteAccessMessage, %A_Space%
	strMessage .= lDialogExternalWriteAccessMessage . ":`n" . (StrLen(strValue) ? strValue : lDialogNone) . "`n`n"
	blnReadOnly := ExternalMenuIsReadOnly(strFile)
	MsgBox, % (blnReadOnly ? "0" : "4"), %strTitle%, % strMessage . (blnReadOnly ? "" : "`n`n" . lDialogExternalMenuOpen)
	IfMsgBox, Yes
		Run, %strFile%
}

strFile := ""
strValue := ""
strTitle := ""
arrExternalTypes := ""
strMessage := ""
blnReadOnly := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
ButtonAddExternalMenusFromCatalogue:
;------------------------------------------------------------

intCatalogueRow := 0  ; This causes the first loop iteration to start the search at the top of the list.
intNbMenusAdded := 0
Loop
{
	Gui, 2:Default
	GuiControl, 2:Focus, f_lvExternalMenusCatalogue
	Gui, 2:ListView, f_lvExternalMenusCatalogue
    intCatalogueRow := LV_GetNext(intCatalogueRow, "Checked")  ; Resume the search at the row after that found by the previous iteration.
    if !(intCatalogueRow)  ; The above returned zero, so there are no more selected rows.
        break
    LV_GetText(strFile, intCatalogueRow, 2)
	g_strNewLocation := strFile
	
	g_blnExternalMenusAdded := false ; will be set true by GuiAddExternalSave
	Gosub, GuiAddExternalFromCatalogue
	Gosub, GuiAddExternalSave
	if (g_blnExternalMenusAdded)
	{
		intNbMenusAdded++
		Gui, 1:Default
		Gui, 1:ListView, f_lvFavoritesList
		intListviewRow := LV_GetNext() + 1
		LV_Modify(0, "-Select")
		LV_Modify(intListviewRow, "Select")
	}
}
MsgBox, 0, %g_strAppNameText%, % L(lDialogExternalMenusAdded, intNbMenusAdded)

Gosub, 2GuiClose

intNbMenusAdded := ""
intListviewRow := ""
g_blnExternalMenusAdded := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
ButtonAddExternalMenusNotFromCatalogue:
;------------------------------------------------------------

Gosub, GuiAddExternalOtherExternal

return
;------------------------------------------------------------


;------------------------------------------------------------
ButtonAddExternalMenusFromCatalogueClose:
;------------------------------------------------------------

Gosub, 2GuiClose

return
;------------------------------------------------------------


;========================================================================================================================
; END OF FAVORITE_GUI
;========================================================================================================================


;========================================================================================================================
!_034_FAVORITE_GUI_SAVE:
;========================================================================================================================

;------------------------------------------------------------
GuiMoveMultipleFavoritesSave:
;------------------------------------------------------------
Gui, 2:Submit, NoHide
Gui, 2:+OwnDialogs

if (f_drpParentMenu = g_objMenuInGui.MenuPath)
	return

Gui, 1:Default
Gui, ListView, f_lvFavoritesList
g_intOriginalMenuPosition := 0

Loop
{
	g_intOriginalMenuPosition := LV_GetNext(g_intOriginalMenuPosition)
	if (!g_intOriginalMenuPosition)
        break
	if (g_objMenuInGui[g_intOriginalMenuPosition].FavoriteType = "B") ; skip back menu
		continue
	g_objEditedFavorite := g_objMenuInGui[g_intOriginalMenuPosition]
	
	Gosub, GuiMoveOneFavoriteSave
	g_intOriginalMenuPosition -=  1 ; because GuiMoveOneFavoriteSave deleted the previous item
}

gosub, GuiAddFavoriteSaveCleanup ; clean these variables for next use (multiple move or not)

Gosub, GuiEditFavoriteCancel

return
;------------------------------------------------------------


;------------------------------------------------------------
GuiAddFavoriteSave:
GuiAddFavoriteSaveXpress:
GuiEditFavoriteSave:
GuiMoveOneFavoriteSave:
GuiCopyFavoriteSave:
GuiAddExternalSave:
;------------------------------------------------------------
Gui, 2:Submit, NoHide
Gui, 2:+OwnDialogs

strThisLabel := A_ThisLabel

; original and destination menus values
if InStr("GuiAddFavoriteSave|GuiAddFavoriteSaveXpress|GuiCopyFavoriteSave|GuiAddExternalSave|", strThisLabel . "|")
{
	strOriginalMenu := ""
	g_intOriginalMenuPosition := 0
}
else ; GuiEditFavoriteSave or GuiMoveOneFavoriteSave
	strOriginalMenu := g_objMenuInGui.MenuPath

if (strThisLabel = "GuiAddExternalSave")
	IniRead, strExternalMenuName, % g_objEditedFavorite.FavoriteAppWorkingDir, Global, MenuName, %A_Space% ; empty if not found

if InStr("GuiAddFavoriteSaveXpress|GuiAddExternalSave|", strThisLabel . "|")
{
	strNewFavoriteShortName := (StrLen(g_objEditedFavorite.FavoriteName) ? g_objEditedFavorite.FavoriteName : strExternalMenuName)
	strNewFavoriteLocation := g_objEditedFavorite.FavoriteLocation
	strFavoriteAppWorkingDir := g_objEditedFavorite.FavoriteAppWorkingDir ; for external menu from catalogue
	strNewFavoriteWindowPosition := g_strNewFavoriteWindowPosition
	
	if (strThisLabel = "GuiAddFavoriteSaveXpress")
	{
		; add new favorite in first position of Main menu
		strDestinationMenu := lMainMenuName
		g_intNewItemPos := (g_blnAddAutoAtTop ? 1 : g_objMenusIndex[strDestinationMenu].MaxIndex() + 1)
	}
	else ; GuiAddExternalSave
	{
		; add new shared menu in current Main menu
		Gui, 1:Default
		Gui, 1:ListView, f_lvFavoritesList
		g_intNewItemPos := LV_GetNext()
		strDestinationMenu := g_objMenuInGui.MenuPath
	}
}
else
{
	strNewFavoriteShortName := f_strFavoriteShortName
	strNewFavoriteLocation := f_strFavoriteLocation
	strFavoriteAppWorkingDir := f_strFavoriteAppWorkingDir

	; f_drpParentMenu and f_drpParentMenuItems have same field name in 2 gui: GuiAddFavorite and GuiMoveMultipleFavoritesToMenu
	strDestinationMenu := f_drpParentMenu
}

; now that we know original and destination menus, check if we need to lock them
if FavoriteIsUnderExternalMenu(g_objMenusIndex[strDestinationMenu], objExternalMenu) and !ExternalMenuAvailableForLock(objExternalMenu, true) ; blnLockItForMe
; if the destination menu is an external menu that cannot be locked, user received an error message, then abort save
	return
if StrLen(strOriginalMenu) and (strOriginalMenu <> strDestinationMenu)
	if FavoriteIsUnderExternalMenu(g_objMenusIndex[strOriginalMenu], objExternalMenu) and !ExternalMenuAvailableForLock(objExternalMenu, true) ; blnLockItForMe
	; if the original menu changed by the save is an external menu that cannot be locked, user received an error message, then abort save
		return

if (!g_intNewItemPos) ; if in GuiMoveOneFavoriteSave, GuiAddFavoriteSaveXpress or GuiAddExternalSave g_intNewItemPos may be already set
	g_intNewItemPos := f_drpParentMenuItems + (g_objMenusIndex[strDestinationMenu][1].FavoriteType = "B" ? 1 : 0)

; validation to avoid unauthorized favorite types in groups
; validation to avoid external settings file under another external settings file
if (g_objMenusIndex[strDestinationMenu].MenuType = "Group" and InStr("Menu|Group|External", g_objEditedFavorite.FavoriteType, true))
	or (g_objMenusIndex[strDestinationMenu].MenuType = "External" and g_objEditedFavorite.FavoriteType = "External")
{
	if (g_objMenusIndex[strDestinationMenu].MenuType = "Group")
		Oops(lDialogFavoriteNameNotAllowed, ReplaceAllInString(g_objFavoriteTypesLabels[g_objEditedFavorite.FavoriteType], "&", ""))
	else
		Oops(lOopsExternalNotAllowedUnderExternal)
	if (strThisLabel = "GuiMoveOneFavoriteSave")
		g_intOriginalMenuPosition++
	gosub, GuiAddFavoriteSaveCleanup
	return
}

; validation to make sure the user selected the type of the new external menu
if (g_objEditedFavorite.FavoriteType = "External")
{
	if (f_radExternalMenuType1 + f_radExternalMenuType2 + f_radExternalMenuType3 = 0)
	{
		gosub, LoadExternalFileGlobalValues ; load values if file exists
		Gui, 2:Submit, NoHide
	}
	
	if (f_radExternalMenuType1 + f_radExternalMenuType2 + f_radExternalMenuType3 = 0)
	{
		Oops(lOopsExternalSelectType)
		GuiControl, ChooseString, f_intAddFavoriteTab, % " " . lDialogAddFavoriteTabsExternal ; space (only) before tab name
		g_blnExternalLocationChanged := 0 ; reset to 0, important to make sure the external file is created by GuiAddExternalSave
		gosub, GuiAddFavoriteSaveCleanup
		return
	}
}

; validation (not required for GuiMoveOneFavoriteSave because info in g_objEditedFavorite is not changed)

if (strThisLabel <> "GuiMoveOneFavoriteSave")
{
	if !StrLen(strNewFavoriteShortName)
	{
		Oops(InStr("Menu|External", g_objEditedFavorite.FavoriteType, true) ? lDialogSubmenuNameEmpty : lDialogFavoriteNameEmpty)
		gosub, GuiAddFavoriteSaveCleanup
		return
	}

	if  InStr("Folder|Document|Application|URL|FTP", g_objEditedFavorite.FavoriteType) and !StrLen(strNewFavoriteLocation)
	{
		Oops(lDialogFavoriteLocationEmpty)
		gosub, GuiAddFavoriteSaveCleanup
		return
	}

	if  (g_objEditedFavorite.FavoriteType = "Snippet")
	{
		if InStr(f_strFavoriteSnippetPrompt, "|")
		{
			Oops(lDialogFavoriteSnippetPromptNoPipe)
			gosub, GuiAddFavoriteSaveCleanup
			return
		}
		if !StrLen(strNewFavoriteLocation)
		{
			Oops(lDialogFavoriteSnippetEmpty)
			gosub, GuiAddFavoriteSaveCleanup
			return
		}
		else
			; if content of gui is "display", encode it to make it ready for saving to ini file
			strNewFavoriteLocation := (g_strSnippetFormat = "display" ? EncodeSnippet(strNewFavoriteLocation) : strNewFavoriteLocation)
	}

	if (g_objEditedFavorite.FavoriteType = "FTP" and SubStr(strNewFavoriteLocation, 1, 6) <> "ftp://")
	{
		Oops(lOopsFtpLocationProtocol)
		gosub, GuiAddFavoriteSaveCleanup
		return
	}

	if  InStr("Special|QAP", g_objEditedFavorite.FavoriteType) and !StrLen(strNewFavoriteLocation)
	{
		Oops(lDialogFavoriteDropdownEmpty, ReplaceAllInString(g_objFavoriteTypesLabels[g_objEditedFavorite.FavoriteType], "&", ""))
		gosub, GuiAddFavoriteSaveCleanup
		return
	}

	if InStr("Menu|Group|External", g_objEditedFavorite.FavoriteType, true) and InStr(strNewFavoriteShortName, g_strMenuPathSeparator)
	{
		Oops(L(lDialogFavoriteNameNoSeparator, g_strMenuPathSeparator))
		gosub, GuiAddFavoriteSaveCleanup
		return
	}

	if InStr(strNewFavoriteShortName, g_strGroupIndicatorPrefix)
	{
		Oops(L(lDialogFavoriteNameNoSeparator, g_strGroupIndicatorPrefix))
		gosub, GuiAddFavoriteSaveCleanup
		return
	}

	if InStr(strNewFavoriteShortName, "& ") and !InStr(strNewFavoriteShortName, "&&")
		Oops(lOopsAmpersandInName)
	
	if InStr(g_strTypesForTabWindowOptions, g_objEditedFavorite.FavoriteType) and (strThisLabel <> "GuiAddFavoriteSaveXpress")
	{
		strNewFavoriteWindowPosition := (f_blnUseDefaultWindowPosition ? 0 : 1)
		strNewFavoriteWindowPosition .= "," . (f_lblWindowPositionMinMax1 ? 0 : (f_lblWindowPositionMinMax2 ? 1 : -1))
			. "," . f_intWindowPositionX . "," . f_intWindowPositionY . "," . f_intWindowPositionW . "," . f_intWindowPositionH . "," . f_lblWindowPositionDelay
			
		GuiControlGet, intRadioGroupRestoreSide, , f_intRadioGroupRestoreSide
		if !(ErrorLevel) ; if errorlevel, control does not exist
			strNewFavoriteWindowPosition .= "," . (f_intRadioGroupRestoreSide = 1 ? "L" : "R")
		
		if !ValidateWindowPosition(strNewFavoriteWindowPosition)
		{
			Oops(lOopsInvalidWindowPosition)
			gosub, GuiAddFavoriteSaveCleanup
			return
		}
	}

	if (g_objEditedFavorite.FavoriteType = "External")
	{
		strExternalSettingsExtension := GetFileExtension(strFavoriteAppWorkingDir)

		if !StrLen(strExternalSettingsExtension)
			strFavoriteAppWorkingDir .= ".ini"
		else if (strExternalSettingsExtension <> "ini")
		{
			Oops(lDialogExternalLocationIni)
			gosub, GuiAddFavoriteSaveCleanup
			return
		}
	}
	
	if LocationTransformedFromHTTP2UNC(g_objEditedFavorite.FavoriteType, (g_objEditedFavorite.FavoriteType = "External" ? strFavoriteAppWorkingDir : strNewFavoriteLocation))
		Oops(lOopsHttpLocationTransformed, (g_objEditedFavorite.FavoriteType = "External" ? strFavoriteAppWorkingDir : strNewFavoriteLocation))

	if (strNewFavoriteLocation = "{TC Directory hotlist}" and !g_blnWinCmdIniFileExist)
	{
		Oops(lOopsInvalidWinCmdIni)
		gosub, GuiAddFavoriteSaveCleanup
		return
	}
	
}

loop ; loop for duplicate names; if in Add this Folder Express or GuiAddExternalSave (from Catalogue), add " [!]" if name is not new.
	if !FavoriteNameIsNew((strThisLabel = "GuiMoveOneFavoriteSave" ? g_objEditedFavorite.FavoriteName : strNewFavoriteShortName), g_objMenusIndex[strDestinationMenu])
		and !InStr("X|K", g_objEditedFavorite.FavoriteType) ; same name OK for separators
		; we have the same name in the destination menu
		; if this is the same menu and the same name, this is OK
		if (strDestinationMenu <> strOriginalMenu) or (strNewFavoriteShortName <> g_objEditedFavorite.FavoriteName) or (A_ThisLabel = "GuiAddFavoriteSaveXpress")
		{
			if InStr("GuiAddFavoriteSaveXpress|GuiAddExternalSave|", strThisLabel . "|")
				strNewFavoriteShortName .= " [!]" ; and loop
			else
			{
				if (g_objEditedFavorite.FavoriteType = "QAP")
					Oops(lDialogFavoriteNameNotNewQAPfeature, (strThisLabel = "GuiMoveOneFavoriteSave" ? g_objEditedFavorite.FavoriteName : strNewFavoriteShortName))
				else
					Oops(lDialogFavoriteNameNotNew, (strThisLabel = "GuiMoveOneFavoriteSave" ? g_objEditedFavorite.FavoriteName : strNewFavoriteShortName))
				if (strThisLabel = "GuiMoveOneFavoriteSave")
					g_intOriginalMenuPosition++
				gosub, GuiAddFavoriteSaveCleanup
				return
			}
		}
		else
			break ; name is not new but is OK - exit loop
	else
		break ; name is new - exit loop

if (InStr(strDestinationMenu, strOriginalMenu . " " . g_strMenuPathSeparator " " . g_objEditedFavorite.FavoriteName) = 1) ; = 1 to check if equal from start only
	and !InStr("K|X", g_objEditedFavorite.FavoriteType) ; no risk with separators
{
	Oops(lDialogMenuNotMoveUnderItself, g_objEditedFavorite.FavoriteName)
	g_intOriginalMenuPosition++ ; will be reduced by GuiMoveMultipleFavoritesSave
	gosub, GuiAddFavoriteSaveCleanup
	return
}

; if adding menu or group, create submenu object

if (InStr("Menu|Group|External", g_objEditedFavorite.FavoriteType, true) and InStr("GuiAddFavoriteSave|GuiAddExternalSave|", strThisLabel . "|"))
{
	objNewMenu := Object() ; object for the new menu or group
	objNewMenu.MenuPath := strDestinationMenu . " " . g_strMenuPathSeparator . " " . strNewFavoriteShortName
		. (g_objEditedFavorite.FavoriteType = "Group" ? " " . g_strGroupIndicatorPrefix . g_strGroupIndicatorSuffix : "")
	objNewMenu.MenuType := g_objEditedFavorite.FavoriteType
	if (objNewMenu.MenuType = "External")
	{
		objNewMenu.MenuExternalPath := strFavoriteAppWorkingDir
		objNewMenu.MenuLoaded := true ; consider as loaded since it is new and empty
	}

	; create a navigation entry to navigate to the parent menu
	objNewMenuBack := Object()
	objNewMenuBack.FavoriteType := "B" ; for Back link to parent menu
	objNewMenuBack.FavoriteName := "(" . GetDeepestMenuPath(strDestinationMenu) . ")"
	objNewMenuBack.ParentMenu := g_objMenusIndex[strDestinationMenu] ; this is the link to the parent menu
	objNewMenu.Insert(objNewMenuBack)
	
	g_objMenusIndex.Insert(objNewMenu.MenuPath, objNewMenu)
	g_objEditedFavorite.Submenu := objNewMenu
}

; update menu object and hotkeys object except if we move favorites

if (strThisLabel <> "GuiMoveOneFavoriteSave")
{
	; if external menu file exists, load the submenu from the external settings ini file

	if (g_objEditedFavorite.FavoriteType = "External")
	{
		strExternalMenuPath := PathCombine(A_WorkingDir, EnvVars(strFavoriteAppWorkingDir)) ; FavoriteAppWorkingDir, settings file path
		if FileExist(strExternalMenuPath) ; file path exists
		{
			; load the external menu to menu object objNewMenu created earlier
			; remove existing menu entries but keep entry #1 (back menu)
			loop, % objNewMenu.MaxIndex() -  1
				objNewMenu.Delete(objNewMenu.MaxIndex()) ; do not use .RemoveAt() because all keys in object are not numeric - risk of side effects
			
			strPreviousIniFile := g_strIniFile
			intPreviousIniLine := g_intIniLine
			g_strIniFile := strExternalMenuPath ; FavoriteAppWorkingDir, settings file path
			g_intIniLine := 1 ; starting number always 1 for new menus since v8.1.9.1
			; g_intIniLine := f_intExternalStartingNumber ; starting number - DEPRECATED sinced v8.1.9.1
			
			strResult := RecursiveLoadMenuFromIni(objNewMenu)
			
			g_strIniFile := strPreviousIniFile
			g_intIniLine := intPreviousIniLine
		}
		else ; if external settings file does not exist, create empty [Favorites] section
		{
			IniWrite, Z, %strExternalMenuPath%, Favorites, Favorite1
			Sleep, 20 ; for safety
		}
		
		; if external settings file is not read-only, write [Global] values to external settings file
		if !ExternalMenuIsReadOnly(strExternalMenuPath)
		{
			strLastModified := GetModifiedDateTime(strExternalMenuPath)
			
			if !(g_blnExternalLocationChanged) and !(strThisLabel = "GuiAddExternalSave") ; only if external menu created with dialog box
			{
				intMenuExternalType := (f_radExternalMenuType1 ? 1 : (f_radExternalMenuType2 ? 2 : 3))
				IniWrite, %intMenuExternalType%, %strExternalMenuPath%, Global, MenuType
				; IniWrite, %f_blnExternalMenuReadOnly%, %strExternalMenuPath%, Global, MenuReadOnly ; deprecated since v8.1.1 but still supported ix exists in ini file
				IniWrite, %f_strExternalMenuName%, %strExternalMenuPath%, Global, MenuName
				IniWrite, %f_strExternalWriteAccessUsers%, %strExternalMenuPath%, Global, WriteAccessUsers
				IniWrite, %f_strExternalWriteAccessMessage%, %strExternalMenuPath%, Global, WriteAccessMessage
				; update last modified value in ini file because values requiring update by other users were changed
				IniWrite, %strLastModified%, %strExternalMenuPath%, Global, LastModified
			}
			; else, no need to save values from advanced tab because they were not updated yet by GuiAddFavoriteTabChanged

			; update object's last modified dates anyway
			g_objEditedFavorite.SubMenu.MenuExternalLastModifiedWhenLoaded := strLastModified
			g_objEditedFavorite.SubMenu.MenuExternalLastModifiedNow := strLastModified
		}
	}

	g_objEditedFavorite.FavoriteName := strNewFavoriteShortName
	
	; before updating g_objEditedFavorite.FavoriteLocation, check if location was changed and update hotkeys objects
	if StrLen(g_objEditedFavorite.FavoriteLocation) and (g_objEditedFavorite.FavoriteLocation <> strNewFavoriteLocation)
	{
		g_objHotkeysByNameLocation.Remove(FavoriteNameLocationFromObject(g_objEditedFavorite))
		if StrLen(strNewFavoriteLocation) and HasHotkey(g_strNewFavoriteHotkey)
			g_objHotkeysByNameLocation.Insert((g_objEditedFavorite.FavoriteType = "QAP" ? "" : strNewFavoriteShortName) ; QAP features name must be empty
				. "|" . strNewFavoriteLocation, g_strNewFavoriteHotkey) ; if the key already exists, its value is overwritten
	}
	
	if InStr("Menu|Group|External", g_objEditedFavorite.FavoriteType, true)
	{
		strMenuLocation := strDestinationMenu . " " . g_strMenuPathSeparator . " " . strNewFavoriteShortName
			. (g_objEditedFavorite.FavoriteType = "Group" ? " " . g_strGroupIndicatorPrefix . g_strGroupIndicatorSuffix : "")
		RecursiveUpdateMenuPathAndLocation(g_objEditedFavorite, strMenuLocation)
		
		if (strThisLabel = "GuiEditFavoriteSave")
		{
			; update g_objMenusIndex
			strIndexToRemove := ""
			for strThisMenuIndexPath, objThisMenu in g_objMenusIndex
				if (strThisMenuIndexPath <> objThisMenu.MenuPath)
				; because the menu (or group) name changed, update the menu path of this menu and submenus entries in g_objMenusIndex
				{
					; add index item objThisMenu.MenuPath containing the new path
					g_objMenusIndex.Insert(objThisMenu.MenuPath, objThisMenu)
					; remember to delete index entry with old path (remove only after loop because remove would break it)
					strIndexToRemove .= strThisMenuIndexPath . "|"
				}
			if StrLen(strIndexToRemove)
				Loop, Parse, strIndexToRemove, |
					; remove index entry containing path before rename
					if StrLen(A_LoopField) ; skip last field
						g_objMenusIndex.Remove(A_LoopField)
					
		}
	}
	else
		g_objEditedFavorite.FavoriteLocation := strNewFavoriteLocation
	
	Gosub, UpdateHotkeyObjectsFavoriteSave

	g_objEditedFavorite.FavoriteIconResource := g_strNewFavoriteIconResource
	g_objEditedFavorite.FavoriteWindowPosition := strNewFavoriteWindowPosition
	
	if (g_objEditedFavorite.FavoriteType = "Group")
	{
		g_objEditedFavorite.FavoriteGroupSettings := f_blnRadioGroupReplace
		g_objEditedFavorite.FavoriteGroupSettings .= "," . (f_blnRadioGroupRestoreWithOther ? "Other" : "Windows Explorer")
		g_objEditedFavorite.FavoriteGroupSettings .= "," . f_intGroupRestoreDelay
	}
	else if (g_objEditedFavorite.FavoriteType = "External")
		g_objEditedFavorite.FavoriteGroupSettings := f_intExternalStartingNumber

	g_objEditedFavorite.FavoriteLoginName := f_strFavoriteLoginName
	g_objEditedFavorite.FavoritePassword := f_strFavoritePassword
	g_objEditedFavorite.FavoriteFtpEncoding := f_blnFavoriteFtpEncoding
	
	g_objEditedFavorite.FavoriteArguments := f_strFavoriteArguments
	g_objEditedFavorite.FavoriteAppWorkingDir := strFavoriteAppWorkingDir
	g_objEditedFavorite.FavoriteDisabled := f_blnFavoriteDisabled
	
	g_objEditedFavorite.FavoriteFolderLiveLevels := (f_blnFavoriteFolderLive ? f_intFavoriteFolderLiveLevels : "")
	g_objEditedFavorite.FavoriteFolderLiveDocuments := (f_blnFavoriteFolderLive ? f_blnFavoriteFolderLiveDocuments : "")
	g_objEditedFavorite.FavoriteFolderLiveColumns := (f_blnFavoriteFolderLive ? (f_intFavoriteFolderLiveColumns = 0 ? "" : f_intFavoriteFolderLiveColumns) : "")
	g_objEditedFavorite.FavoriteFolderLiveIncludeExclude := (f_blnFavoriteFolderLive ? f_radFavoriteFolderLiveInclude : "")
	g_objEditedFavorite.FavoriteFolderLiveExtensions := (f_blnFavoriteFolderLive ? f_strFavoriteFolderLiveExtensions : "")

	if (g_objEditedFavorite.FavoriteType = "Snippet")
		; 1 macro (boolean) true: send snippet to current application using macro mode / else paste as raw text
		; 2 prompt (text) pause prompt before pasting/launching the snippet
		; 3 encode (boolean) true: automatically encode / false: do not encode
		; 4 fixed width (boolean) true: fixed width / false: proportional width
		; 5 font size (integer)
		g_objEditedFavorite.FavoriteLaunchWith := f_blnRadioSendModeMacro . ";" . f_strFavoriteSnippetPrompt . ";" . f_blnProcessEOLTab . ";" . f_blnFixedFont . ";" . f_intFontSize
	else
	{
		g_objEditedFavorite.FavoriteLaunchWith := f_strFavoriteLaunchWith
		g_objEditedFavorite.FavoriteElevate := f_blnFavoriteElevate
	}
}
else ; GuiMoveOneFavoriteSave
	if InStr("Menu|Group|External", g_objEditedFavorite.FavoriteType, true)
	; for Menu and Group in multiple moved, update the .FavoriteLocation in favorite object and update menus and hotkeys index objects
	{
		strPreviousName := (g_objEditedFavorite.FavoriteType = "QAP" ? "" : g_objEditedFavorite.FavoriteName) ; save it to be able to remove hotkey if there is one for this location
		strPreviousLocation := g_objEditedFavorite.FavoriteLocation ; save it to be able to remove hotkey if there is one for this location
		
		strMenuLocation := strDestinationMenu . " " . g_strMenuPathSeparator . " " . g_objEditedFavorite.FavoriteName
			. (g_objEditedFavorite.FavoriteType = "Group" ? " " . g_strGroupIndicatorPrefix . g_strGroupIndicatorSuffix : "")
		RecursiveUpdateMenuPathAndLocation(g_objEditedFavorite, strMenuLocation)

		if g_objHotkeysByNameLocation.HasKey(strPreviousName . "|" . strPreviousLocation)
		{
			StringReplace, strMenuLocation, strMenuLocation, %lMainMenuName%%A_Space% ; menu path without main menu localized name
			g_objHotkeysByNameLocation.Insert((g_objEditedFavorite.FavoriteType = "QAP" ? "" : g_objEditedFavorite.FavoriteName)
				. "|" . strMenuLocation, g_objHotkeysByNameLocation[strPreviousName . "|" . strPreviousLocation])
			g_objHotkeysByNameLocation.Remove(strPreviousName . "|" . strPreviousLocation) ; must be after the g_objHotkeysByNameLocation.Insert
		}
		
		; update g_objMenusIndex
		strIndexToRemove := ""
		for strThisMenuIndexPath, objThisMenu in g_objMenusIndex
		{
			if (strThisMenuIndexPath <> objThisMenu.MenuPath)
			; because the menu (or group) name changed, update the menu path of this menu and submenus entries in g_objMenusIndex
			{
				; add index item objThisMenu.MenuPath containing the new path
				g_objMenusIndex.Insert(objThisMenu.MenuPath, objThisMenu)
				; remember to delete index entry with old path (remove only after loop because remove would break it)
				strIndexToRemove .= strThisMenuIndexPath . "|"
			}
		}
		if StrLen(strIndexToRemove)
			Loop, Parse, strIndexToRemove, |
				; remove index entry containing path before rename
				if StrLen(A_LoopField) ; skip last field
					g_objMenusIndex.Remove(A_LoopField)
	}

; updating original and destination menu objects (these can be the same)

if (strOriginalMenu <> "")
	g_objMenusIndex[strOriginalMenu].Remove(g_intOriginalMenuPosition)
if (g_intNewItemPos)
	g_objMenusIndex[strDestinationMenu].Insert(g_intNewItemPos, g_objEditedFavorite)
else
	g_objMenusIndex[strDestinationMenu].Insert(g_objEditedFavorite) ; if no item is selected, add to the end of menu

; updating listview

if (strThisLabel <> "GuiAddExternalSave")
	Gosub, 2GuiClose
else ; GuiAddExternalSave
	g_blnExternalMenusAdded := true

Gui, 1:Default
GuiControl, 1:Focus, lvFavoritesList
Gui, 1:ListView, lvFavoritesList

if (strOriginalMenu = g_objMenuInGui.MenuPath) ; remove original from Listview if original in Gui (can be replaced with modified)
	LV_Delete(g_intOriginalMenuPosition)

if (strDestinationMenu = g_objMenuInGui.MenuPath) ; add modified to Listview if destination in Gui (can replace original deleted)
{
	LV_Modify(0, "-Select")
	if (g_objEditedFavorite.FavoriteType = "Menu")
		strThisLocation := g_strMenuPathSeparator
	else if (g_objEditedFavorite.FavoriteType = "External")
		strThisLocation := (ExternalMenuIsReadOnly(strFavoriteAppWorkingDir) ? lDialogReadOnly . " " : "")
			. g_strMenuPathSeparator . g_strMenuPathSeparator . " " . strFavoriteAppWorkingDir
	else if (g_objEditedFavorite.FavoriteType = "Group")
		strThisLocation := g_strGroupIndicatorPrefix . g_strGroupIndicatorSuffix
	else
		strThisLocation := g_objEditedFavorite.FavoriteLocation

	strThisType := GetFavoriteTypeForList(g_objEditedFavorite)
	
	if (g_intNewItemPos)
		LV_Insert(g_intNewItemPos, "Select Focus", g_objEditedFavorite.FavoriteName, strThisType, Hotkey2Text(g_strNewFavoriteHotkey), strThisLocation)
	else
		LV_Add("Select Focus", g_objEditedFavorite.FavoriteName, strThisType, Hotkey2Text(g_strNewFavoriteHotkey), strThisLocation)

	LV_Modify(LV_GetNext(), "Vis")
}

GuiControl, 1:, f_drpMenusList, % "|" . RecursiveBuildMenuTreeDropDown(g_objMainMenu, g_objMenuInGui.MenuPath) . "|" ; required if submenu was added
Gosub, AdjustColumnsWidth

Gosub, EnableSaveAndCancel

; if favorite's original or destination menu are in an external settings file, flag that they need to be saved
if FavoriteIsUnderExternalMenu(g_objMenusIndex[strDestinationMenu], objExternalMenu)
	objExternalMenu.NeedSave := true
if StrLen(strOriginalMenu) and (strOriginalMenu <> strDestinationMenu)
	if FavoriteIsUnderExternalMenu(g_objMenusIndex[strOriginalMenu], objExternalMenu)
		objExternalMenu.NeedSave := true

g_blnMenuReady := true

if (strThisLabel = "GuiMoveOneFavoriteSave")
	g_intNewItemPos++ ; move next favorite after this one in the destination menu (or will be deleted in GuiMoveOneFavoriteSave after the loop)
else
	g_intNewItemPos := "" ; delete it for next use

GuiAddFavoriteSaveCleanup:
if (strThisLabel <> "GuiMoveOneFavoriteSave") ; do not execute at each favorite when moving multiple favorites
	or (A_ThisLabel = "GuiAddFavoriteSaveCleanup") ; but executed it when called at the end of GuiMoveMultipleFavoritesSave
{
	strOriginalMenu := ""
	strDestinationMenu := ""
	strMenuLocation := ""
	strThisLocation := ""
	strThisType := ""
	strNewFavoriteWindowPosition := ""
	strMenuPath := ""
	objMenu := ""
	g_intNewItemPos := "" ; in case we abort save and retry
	strIndexToRemove := ""
	strThisMenuIndexPath := ""
	objThisMenu := ""
	strHttpLocationTransformed := ""
	strPreviousName := ""
	strPreviousLocation := ""
	strNewFavoriteShortName := ""
	strNewFavoriteLocation := ""
	strExternalMenuPath := ""
	intMenuExternalType := ""
	strLastModified := ""

	; make sure all gui variables are flushed before next fav add or edit
	Gosub, GuiAddFavoriteFlush
}

return
;------------------------------------------------------------


;------------------------------------------------------------
GuiAddFavoriteFlush:
;------------------------------------------------------------

; make sure all gui variables are flushed before next fav add or edit
f_blnRadioGroupAdd := ""
f_blnRadioGroupReplace := ""
f_blnRadioGroupRestoreWithExplorer := ""
f_blnRadioGroupRestoreWithOther := ""
f_blnUseDefaultWindowPosition := ""
f_drpParentMenu := ""
f_drpParentMenuItems := ""
f_drpQAP := ""
f_drpRunningApplication := ""
f_drpSpecial := ""
f_intGroupExplorerDelay := ""
f_intGroupRestoreDelay := ""
f_intWindowPositionH := ""
f_intWindowPositionW := ""
f_intWindowPositionX := ""
f_intWindowPositionY := ""
f_picIcon := ""
f_strFavoriteAppWorkingDir := ""
f_strFavoriteArguments := ""
f_strFavoriteLaunchWith := ""
f_strFavoriteLocation := ""
f_strFavoriteLoginName := ""
f_strFavoritePassword := ""
f_strFavoriteShortName := ""
f_blnFavoriteElevate := ""
f_strHotkeyText := ""
f_blnRadioSendModeMacro := ""
f_strFavoriteSnippetPrompt := ""
f_blnFavoriteFolderLive := ""
f_intFavoriteFolderLiveLevels := ""
f_blnFavoriteFolderLiveDocuments := ""
f_intFavoriteFolderLiveColumns := ""
f_radFavoriteFolderLiveInclude := ""
f_radFavoriteFolderLiveExclude := ""
f_strFavoriteFolderLiveExtensions := ""
objExternalMenu := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
RecursiveUpdateMenuPathAndLocation(objEditedFavorite, strMenuPath)
; update submenus and their childrens and groups to the new path of the parent menu
;------------------------------------------------------------
{
	global g_strMenuPathSeparator
	global g_strGroupIndicatorPrefix
	global g_strGroupIndicatorSuffix
	
	objEditedFavorite.SubMenu.MenuPath := strMenuPath
	StringReplace, strMenuLocation, strMenuPath, %lMainMenuName%%A_Space% ; menu path without main menu localized name
	objEditedFavorite.FavoriteLocation := strMenuLocation
	
	Loop, % objEditedFavorite.SubMenu.MaxIndex()
	{
		; skip ".." back link to parent menu
		if (objEditedFavorite.SubMenu[A_Index].FavoriteType = "B")
		{
			; known limit: back links of submenus and groups will only be updated when the favorites will be reloaded from ini file
			objEditedFavorite.SubMenu[A_Index].FavoriteName := lGuiSaveToUpdateBacklinks
			continue
		}
		
		if InStr("Menu|Group|External", objEditedFavorite.SubMenu[A_Index].FavoriteType, true)
			RecursiveUpdateMenuPathAndLocation(objEditedFavorite.SubMenu[A_Index]
				, objEditedFavorite.SubMenu.MenuPath . " " . g_strMenuPathSeparator . " " . objEditedFavorite.SubMenu[A_Index].FavoriteName
				. (objEditedFavorite.SubMenu[A_Index].FavoriteType = "Group" ? " " . g_strGroupIndicatorPrefix . g_strGroupIndicatorSuffix : "") ) ; RECURSIVE
	}
}
;------------------------------------------------------------


;------------------------------------------------------------
ValidateWindowPosition(strPosition)
;------------------------------------------------------------
{
	; Boolean,MinMax,Left,Top,Width,Height,Delay,RestoreSide
	; 0 for use default / 1 for remember, -1 Minimized / 0 Normal / 1 Maximized, Left (X), Top (Y), Width, Height, Delay (default 200 ms), L Left / R Right; for example: "1,0,100,50,640,480,200" or "0,,,,,,,L"
	StringSplit, arrPosition, strPosition, `,
	if !(arrPosition1) or (arrPosition2 <> 0) ; no position to validate
		return true
	
	if arrPosition3 is not integer
		blnOK := false
	else if arrPosition4 is not integer
		blnOK := false
	else if arrPosition5 is not integer
		blnOK := false
	else if arrPosition6 is not integer
		blnOK := false
	else if arrPosition7 is not integer
		blnOK := false
	else
		blnOK := true

	if (blnOK)
	 	blnOK := (arrPosition5 > 0) and (arrPosition6 > 0) and (arrPosition7 >= 0) ; Width, Height and Delay must be positive
	
	return blnOK
}
;------------------------------------------------------------


;------------------------------------------------------------
FavoriteNameIsNew(strCandidateName, objMenu)
;------------------------------------------------------------
{
	Loop, % objMenu.MaxIndex()
		if (strCandidateName = objMenu[A_Index].FavoriteName)
			return False

	return True
}
;------------------------------------------------------------


;========================================================================================================================
; END OF FAVORITE_GUI_SAVE
;========================================================================================================================


;========================================================================================================================
!_036_FAVORITE_GUI_OTHER:
;========================================================================================================================

;------------------------------------------------------------
GuiRemoveMultipleFavorites:
;------------------------------------------------------------

GuiControl, Focus, f_lvFavoritesList
Gui, 1:ListView, f_lvFavoritesList

if (LV_GetNext() = 1 and g_objMenuInGui[1].FavoriteType = "B")
	LV_Modify(1, "-Select") ; deselect back link entry

if LV_GetCount("Selected") > 1
{
	MsgBox, 52, %g_strAppNameText%, % L(lDialogRemoveMultipleFavorites, LV_GetCount("Selected"))
	IfMsgBox, No
		return
}

Loop
	Gosub, GuiRemoveOneFavorite
until !LV_GetNext()

return
;------------------------------------------------------------


;------------------------------------------------------------
GuiRemoveFavorite:
GuiRemoveOneFavorite:
;------------------------------------------------------------

g_blnFavoriteFromSearch := StrLen(GetFavoritesListFilter())
if (g_blnFavoriteFromSearch)
	g_objMenuInGui := GetMenuForGuiFiltered(intItemToRemove)
else
{
	GuiControl, Focus, f_lvFavoritesList
	Gui, 1:ListView, f_lvFavoritesList
	intItemToRemove := LV_GetNext()
}

if !(intItemToRemove)
{
	Oops(lDialogSelectItemToRemove)
	gosub, GuiRemoveFavoriteCleanup
	return
}

if FavoriteIsUnderExternalMenu(g_objMenuInGui, objExternalMenu) and !ExternalMenuAvailableForLock(objExternalMenu, true) ; blnLockItForMe
; if the menu is an external menu that cannot be locked, user received an error message, then abort
{
	if (A_ThisLabel = "GuiRemoveOneFavorite")
		LV_Modify(LV_GetNext(), "-Select")
	gosub, GuiRemoveFavoriteCleanup
	return
}

if (g_objMenuInGui[intItemToRemove].FavoriteType = "B") ; cannot occur from filtered list
{
	if (A_ThisLabel = "GuiRemoveOneFavorite")
		LV_Modify(LV_GetNext(), "-Select")
	return
}

; remove favorite in object model (if menu, leaving submenu objects unlinked without releasing them)

blnItemIsMenu := InStr("Menu|Group|External", g_objMenuInGui[intItemToRemove].FavoriteType, true)

if (blnItemIsMenu)
{
	MsgBox, 52, % L(lDialogFavoriteRemoveTitle, g_strAppNameText)
		, % L((g_objMenuInGui[intItemToRemove].FavoriteType = "Menu" ? lDialogFavoriteRemovePrompt
			: (g_objMenuInGui[intItemToRemove].FavoriteType = "External" ? lDialogFavoriteRemoveExternalPrompt
			: lDialogFavoriteRemoveGroupPrompt)), g_objMenuInGui[intItemToRemove].Submenu.MenuPath)
	IfMsgBox, No
	{
		if (A_ThisLabel = "GuiRemoveOneFavorite")
			LV_Modify(LV_GetNext(), "-Select")
		gosub, GuiRemoveFavoriteCleanup
		return
	}
	g_objMenusIndex.Remove(g_objMenuInGui[intItemToRemove].Submenu.MenuPath) ; if user cancels settings changes, menu object will not be re-created (we live with it)
}
g_objMenuInGui.Remove(intItemToRemove)

; refresh menu dropdpown in gui

if (blnItemIsMenu)
	GuiControl, 1:, f_drpMenusList, % "|" . RecursiveBuildMenuTreeDropDown(g_objMainMenu, g_objMenuInGui.MenuPath) . "|"

LV_Delete(intItemToRemove)
if (A_ThisLabel = "GuiRemoveFavorite")
{
	LV_Modify(intItemToRemove, "Select Focus") ; select item next to deleted one
	if !LV_GetNext() ; if last item was deleted, select the new last item
		LV_Modify(LV_GetCount(), "Select Focus")
}
Gosub, AdjustColumnsWidth

Gosub, EnableSaveAndCancel

; if favorite's menu is in an external settings file, flag that it needs to be saved
if FavoriteIsUnderExternalMenu(g_objMenuInGui, objExternalMenu)
	objExternalMenu.NeedSave := true

if (g_blnFavoriteFromSearch)
	gosub, LoadFavoritesInGuiFiltered ; stay in filtered list after item removed


GuiRemoveFavoriteCleanup:
intItemToRemove := ""
blnItemIsMenu := ""
objExternalMenu := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
GuiMoveMultipleFavoritesUp:
GuiMoveMultipleFavoritesDown:
;------------------------------------------------------------

GuiControl, Focus, f_lvFavoritesList
Gui, 1:ListView, f_lvFavoritesList

g_blnAbortMultipleMove := false
strSelectedRows := ""
g_intRowToProcess := 0
loop
{
	g_intRowToProcess := LV_GetNext(g_intRowToProcess)
	strSelectedRows .= g_intRowToProcess . "|"
}
until !LV_GetNext(g_intRowToProcess)
StringTrimRight, strSelectedRows, strSelectedRows, 1

Loop
{
	Gosub, % (A_ThisLabel = "GuiMoveMultipleFavoritesUp" ? "GetFirstSelected" : "GetLastSelected") ; will re-init g_intRowToProcess
	if (!g_intRowToProcess) or (g_blnAbortMultipleMove)
		break
	
	g_intSelectedRow := g_intRowToProcess
	Gosub, % (A_ThisLabel = "GuiMoveMultipleFavoritesUp" ? "GuiMoveOneFavoriteUp" : "GuiMoveOneFavoriteDown")
}

if (!g_blnAbortMultipleMove)
	Loop, Parse, strSelectedRows, |
		LV_Modify(A_LoopField  + (A_ThisLabel = "GuiMoveMultipleFavoritesUp" ? -1 : 1), "Select")

LV_Modify(LV_GetNext(0), "Focus") ; give focus to the first selected row

g_blnAbortMultipleMove := ""
strSelectedRows := ""
g_intRowToProcess := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
GetFirstSelected:
GetLastSelected:
;------------------------------------------------------------

g_intRowToProcess := 0

if (A_ThisLabel = "GetFirstSelected")
	g_intRowToProcess := LV_GetNext(g_intRowToProcess) ; start from first selected
else
	loop
		g_intRowToProcess := LV_GetNext(g_intRowToProcess) ; start with last selected
	until !LV_GetNext(g_intRowToProcess)

return
;------------------------------------------------------------


;------------------------------------------------------------
GuiMoveFavoriteUp:
GuiMoveFavoriteDown:
GuiMoveOneFavoriteUp:
GuiMoveOneFavoriteDown:
;------------------------------------------------------------

if FavoriteIsUnderExternalMenu(g_objMenuInGui, objExternalMenu) and !ExternalMenuAvailableForLock(objExternalMenu, true) ; blnLockItForMe
{
	objExternalMenu := ""
	return
}

if !InStr(A_ThisLabel, "One")
{
	GuiControl, Focus, f_lvFavoritesList
	Gui, 1:ListView, f_lvFavoritesList
	g_intSelectedRow := LV_GetNext()
}
if (g_intSelectedRow = 0)
{
	Oops(lDialogSelectItemToMove)
	return
}
if (g_intSelectedRow = (InStr(A_ThisLabel, "Up") ? (g_objMenuInGui[1].FavoriteType = "B" ? 2 : 1) ; if Up not higher that first non-back link favorite
	: LV_GetCount())) ; if Down not lower that last
	or (g_objMenuInGui[g_intSelectedRow].FavoriteType = "B") ; cannot move back link
{
	if InStr(A_ThisLabel, "One")
		g_blnAbortMultipleMove := true
	return
}

; --- move in menu object ---

MoveFavoriteInMenuObject(g_objMenuInGui, g_intSelectedRow, (InStr(A_ThisLabel, "Up") ? -1 : 1))

; --- move in Gui ---

Loop, 4
	LV_GetText(arrThis%A_Index%, g_intSelectedRow, A_Index)

Loop, 4
	LV_GetText(arrOther%A_Index%, g_intSelectedRow + (InStr(A_ThisLabel, "Up") ? -1 : 1), A_Index)

LV_Modify(g_intSelectedRow, "-Select")
LV_Modify(g_intSelectedRow, "", arrOther1, arrOther2, arrOther3, arrOther4)
LV_Modify(g_intSelectedRow + (InStr(A_ThisLabel, "Up") ? -1 : 1), , arrThis1, arrThis2, arrThis3, arrThis4)

if !InStr(A_ThisLabel, "One")
	LV_Modify(g_intSelectedRow + (InStr(A_ThisLabel, "Up") ? -1 : 1), "Select Focus Vis")

Gosub, EnableSaveAndCancel

; if favorite's menu is in an external settings file, flag that it needs to be saved
if FavoriteIsUnderExternalMenu(g_objMenuInGui, objExternalMenu)
	objExternalMenu.NeedSave := true

objExternalMenu := ""

return

;------------------------------------------------------------


;------------------------------------------------------------
MoveFavoriteInMenuObject(objMenu, intItem, intDirection)
; intDirection = +1 to to down or -1 to go up
;------------------------------------------------------------
{
	if (intItem + intDirection > objMenu.MaxIndex())
		or (intItem + intDirection < o.MinIndex())
		return

	objMenu.Insert(intItem + intDirection + (intDirection > 0 ? 1 : 0), objMenu[intItem])
	objMenu.Remove(intItem + (intDirection > 0 ? 0 : 1))
}	
;------------------------------------------------------------


;============================================================
GuiHotkeysManage:
GuiHotkeysManageFromQAPFeature:
;------------------------------------------------------------

if (A_ThisLabel = "GuiHotkeysManageFromQAPFeature")
	Gosub, GuiShowFromHotkeysManage
	
intWidth := 840

g_intGui1WinID := WinExist("A")
Gui, 1:Submit, NoHide

Gui, 2:New, , % L(lDialogHotkeysManageTitle, g_strAppNameText, g_strAppVersion)
Gui, 2:+Owner1
Gui, 2:+OwnDialogs
if (g_blnUseColors)
	Gui, 2:Color, %g_strGuiWindowColor%

Gui, 2:Font, w600
Gui, 2:Add, Text, x10 y10, % L(lDialogHotkeysManageAbout, g_strAppNameText)
Gui, 2:Font

Gui, 2:Add, Text, x10 y+10 w%intWidth%, % L(lDialogHotkeysManageIntro, lDialogHotkeysManageListSeeAllFavorites, lDialogHotkeysManageListSeeFullHotkeyNames)

Gui, 2:Add, Listview
	, % "vf_lvHotkeysManageList Count32 " . (g_blnUseColors ? "c" . g_strGuiListviewTextColor . " Background" . g_strGuiListviewBackgroundColor : "") 
	. " gHotkeysManageListEvents x10 y+10 w" . intWidth - 40. " h340"
	, #|%lDialogHotkeysManageListHeader%|Object Position (hidden)

Gui, 2:Add, Checkbox, vf_blnSeeAllFavorites gCheckboxSeeAllFavoritesClicked, %lDialogHotkeysManageListSeeAllFavorites%
Gui, 2:Add, Checkbox, x+50 yp vf_blnSeeShortHotkeyNames gCheckboxSeeShortHotkeyNames, %lDialogHotkeysManageListSeeShortHotkeyNames%
GuiControl, , f_blnSeeShortHotkeyNames, % (g_intHotkeyReminders = 2) ; 1 = no name, 2 = short names, 3 = full name

Gosub, LoadHotkeysManageList

Gui, 2:Add, Button, x+10 y+30 vf_btnHotkeysManageClose g2GuiClose h33, %lGuiCloseAmpersand%
GuiCenterButtons(L(lDialogHotkeysManageTitle, g_strAppNameText, g_strAppVersion), , , , "f_btnHotkeysManageClose")
Gui, 2:Add, Text, x10, %A_Space%

Gosub, ShowGui2AndDisableGui1

intWidth := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
HotkeysManageListEvents:
;------------------------------------------------------------

Gui, 2:ListView, f_lvHotkeysList

if (A_GuiEvent = "DoubleClick")
{
	intItemPosition := LV_GetNext()
	LV_GetText(strHotkeyType, intItemPosition, 4)
	if !StrLen(strHotkeyType)
	{
		gosub, HotkeysManageListEventsCleanup
		return
	}
	LV_GetText(strFavoritePosition, intItemPosition, 7)
	LV_GetText(strMenuPath, intItemPosition, 2)
	
	if (strHotkeyType = lDialogHotkeysManagePopup) ; this is a popup menu hotkey, go to Options, Menu hotkeys
	{
		MsgBox, 35, %g_strAppNameText%!, % L(lDialogChangeHotkeyPopup, lOptionsMouseAndKeyboard, lGuiOptions)
		IfMsgBox, Yes
		{
			Gosub, GuiOptions
			GuiControl, Choose, f_intOptionsTab, 3
		}
	}
	else if (strHotkeyType = lDialogHotkeysManageAlternative) ; this is Alternative menu feature, go to Options, Menu hotkeys
	{
		MsgBox, 35, %g_strAppNameText%!, % L(lDialogChangeHotkeyAlternative, lOptionsAlternativeMenuFeatures, lGuiOptions)
		IfMsgBox, Yes
		{
			Gosub, GuiOptions
			GuiControl, Choose, f_intOptionsTab, 4
		}
	}
	else
	{
		g_objEditedFavorite := g_objMenusIndex[strMenuPath][strFavoritePosition]
		
		strBackupFavoriteHotkey := g_objHotkeysByNameLocation[FavoriteNameLocationFromObject(g_objEditedFavorite)]
		g_strNewFavoriteHotkey := SelectHotkey(g_objHotkeysByNameLocation[FavoriteNameLocationFromObject(g_objEditedFavorite)]
			, g_objEditedFavorite.FavoriteName
			, g_objEditedFavorite.FavoriteType
			, g_objEditedFavorite.FavoriteLocation, 3
			, g_objQAPFeatures[g_objEditedFavorite.FavoriteLocation].DefaultHotkey)
		; SelectHotkey(strActualHotkey, strFavoriteName, strFavoriteType, strFavoriteLocation, intHotkeyType, strDefaultHotkey := "", strDescription := "")
		; intHotkeyType: 1 Mouse, 2 Keyboard, 3 Mouse or Keyboard
		; returns the new hotkey, "None" if no hotkey or empty string if cancel
		if !StrLen(g_strNewFavoriteHotkey)
			g_strNewFavoriteHotkey := strBackupFavoriteHotkey
		else
			if (g_strNewFavoriteHotkey <> strBackupFavoriteHotkey)
				Gosub, UpdateHotkeyObjectsHotkeysListSave
	}
}

HotkeysManageListEventsCleanup:
intItemPosition := ""
strHotkeyType := ""
strMenuPath := ""
strFavoritePosition := ""
strNewHotkey := ""
strBackupFavoriteHotkey := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
LoadHotkeysManageList:
;------------------------------------------------------------
Gui, 2:Submit, NoHide

Gui, 2:Default
Gui, 2:ListView, f_lvHotkeysManageList
LV_Delete()

intHotkeysManageListWinID := WinExist("A")
if not DllCall("LockWindowUpdate", Uint, intHotkeysManageListWinID)
	Oops("An error occured while locking window display in`n" . L(lDialogHotkeysManageTitle, g_strAppNameText, g_strAppVersion))

; Position (hidden)|Menu|Favorite Name|Type|Hotkey|Favorite Location
loop, 4
	LV_Add(, , , g_arrOptionsPopupHotkeyTitles%A_Index%, lDialogHotkeysManagePopup
		, (f_blnSeeShortHotkeyNames ? g_arrPopupHotkeys%A_Index% : Hotkey2Text(g_arrPopupHotkeys%A_Index%)))

for strQAPFeatureCode in g_objQAPFeaturesDefaultNameByCode
{
	if (g_objQAPFeatures[strQAPFeatureCode].QAPFeatureAlternativeOrder)
		if HasHotkey(g_objQAPFeatures[strQAPFeatureCode].CurrentHotkey) or f_blnSeeAllFavorites
			LV_Add(, , lDialogHotkeysManageAlternativeMenu, g_objQAPFeatures[strQAPFeatureCode].LocalizedName, lDialogHotkeysManageAlternative
				, Hotkey2Text(g_objQAPFeatures[strQAPFeatureCode].CurrentHotkey), strQAPFeatureCode)
}

g_intHotkeyListOrder := 0
RecursiveLoadMenuHotkeys(g_objMainMenu)
g_intHotkeyListOrder := ""

LV_ModifyCol(1, "Integer Sort")
Loop, % LV_GetCount("Column") - 1
	LV_ModifyCol(A_Index + 1, "AutoHdr")
LV_ModifyCol(7, 0)

DllCall("LockWindowUpdate", Uint, 0)  ; Pass 0 to unlock the currently locked window.

intHotkeysManageListWinID := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
RecursiveLoadMenuHotkeys(objCurrentMenu)
;------------------------------------------------------------
{
	global g_objHotkeysByNameLocation
	global f_blnSeeAllFavorites
	global f_blnSeeShortHotkeyNames
	global g_intHotkeyListOrder
	
	Loop, % objCurrentMenu.MaxIndex()
	{
		if !InStr("B|X", objCurrentMenu[A_Index].FavoriteType)
			and (g_objHotkeysByNameLocation.HasKey(FavoriteNameLocationFromObject(objCurrentMenu[A_Index])) or f_blnSeeAllFavorites)
		{
			strThisHotkey := (StrLen(g_objHotkeysByNameLocation[FavoriteNameLocationFromObject(objCurrentMenu[A_Index])])
				? g_objHotkeysByNameLocation[FavoriteNameLocationFromObject(objCurrentMenu[A_Index])] : lDialogNone)
			strThisType := GetFavoriteTypeForList(objCurrentMenu[A_Index])
			g_intHotkeyListOrder++
			; Position (hidden)|Menu|Favorite Name|Type|Hotkey|Favorite Location
			LV_Add(, g_intHotkeyListOrder
				, objCurrentMenu.MenuPath, objCurrentMenu[A_Index].FavoriteName, strThisType
				, (f_blnSeeShortHotkeyNames ? strThisHotkey : Hotkey2Text(strThisHotkey))
				, (objCurrentMenu[A_Index].FavoriteType = "Snippet" ? StringLeftDotDotDot(objCurrentMenu[A_Index].FavoriteLocation, 50) : objCurrentMenu[A_Index].FavoriteLocation)
				, A_Index)
		}
		
		if InStr("Menu|External", objCurrentMenu[A_Index].FavoriteType, true)
			RecursiveLoadMenuHotkeys(objCurrentMenu[A_Index].SubMenu) ; RECURSIVE
	}
}
;------------------------------------------------------------


;------------------------------------------------------------
CheckboxSeeAllFavoritesClicked:
CheckboxSeeShortHotkeyNames:
;------------------------------------------------------------

Gosub, LoadHotkeysManageList

return
;------------------------------------------------------------


;============================================================
GuiIconsManage:
GuiIconsManageFromQAPFeature:
;------------------------------------------------------------

if (A_ThisLabel = "GuiIconsManageFromQAPFeature")
	Gosub, GuiShowFromIconsManage

g_objManageIcons := Object()
RecursiveLoadMenuIconsManage(g_objMainMenu)

g_intGui1WinID := WinExist("A")
Gui, 1:Submit, NoHide

intIconsManageRowsHeight := 44
if !(g_intIconsManageRowsSettings)
{
	ActiveMonitorInfo(intTop, intLeft, intWidth, intMonitorHeight)
	g_intIconsManageRows := ((intMonitorHeight - 250) // intIconsManageRowsHeight)
	; Diag("ManageIcons - g_intIconsManageRows", (intMonitorHeight - 250) // intIconsManageRowsHeight)
}
else
	g_intIconsManageRows:= g_intIconsManageRowsSettings

intMarginWidth := 10
intIconSize := 32
intMenuPathWidth := 400
intFavoriteNameWidth := 300
intButtonsHeight := 20
intButtonsWidth := 150

Gui, 2:New, , % L(lDialogIconsManageTitle, g_strAppNameText, g_strAppVersion)
Gui, 2:+Owner1
Gui, 2:+OwnDialogs
if (g_blnUseColors)
	Gui, 2:Color, %g_strGuiWindowColor%

Gui, 2:Add, Text, x10 y10 w1000, % L(lDialogIconsManageAbout, g_strAppNameText)

Gui, 2:Font, w600
Gui, 2:Add, Edit, % "readonly center x" . intMarginWidth . " w" . intMenuPathWidth, %lDialogIconsManageParentMenu%
Gui, 2:Add, Edit, % "readonly center yp x+" . intMarginWidth . " w" . intFavoriteNameWidth, %lDialogIconsManageFavoriteName%
Gui, 2:Add, Edit, % "readonly center yp x+" . intMarginWidth . " w" . intButtonsWidth + intIconSize + (intMarginWidth // 2), %lDialogIconsManageCurrent%
Gui, 2:Add, Edit, % "readonly center yp x+" . intMarginWidth . " w" . intButtonsWidth + intIconSize + (intMarginWidth // 2), %lDialogIconsManageDefault%
Gui, 2:Font

Loop, %g_intIconsManageRows%
{
	Gui, 2:Font, w600
	Gui, 2:Add, Edit, % "readonly -vscroll x" . intMarginWidth . " y" . 15 + (A_Index * intIconsManageRowsHeight) . " w" . intMenuPathWidth . " h" . intIconsManageRowsHeight - 5 . " vf_lblMenuPath" . A_Index
	Gui, 2:Font
	Gui, 2:Add, Edit, % "readonly -vscroll yp x+" . intMarginWidth . " w" . intFavoriteNameWidth . " h" . intIconsManageRowsHeight - 5 . " vf_lblFavoriteName" . A_Index
	Gui, 2:Add, Picture, % "yp x+" . intMarginWidth . " w" . intIconSize . " h" . intIconSize . " gIconsManagePickIconDialog vf_picIconCurrent" . A_Index
	Gui, 2:Add, Button, % "yp+7 x+" . intMarginWidth // 2 . " h" . intButtonsHeight . " w" . intButtonsWidth . " gIconsManagePickIconDialog vf_btnPickDialog" . A_Index, %lDialogSelectIcon%
	Gui, 2:Add, Picture, % "yp-7 x+" . intMarginWidth . " w" . intIconSize . " h" . intIconSize . " gIconsManageSetDefault vf_picIconDefault" . A_Index
	Gui, 2:Add, Button, % "yp+7 x+" . intMarginWidth // 2 . " h" . intButtonsHeight . " w" . intButtonsWidth . " gIconsManageSetDefault vf_btnSetDefault" . A_Index, %lDialogIconsManageSetDefaultIcon%
	Gui, 2:Add, Text, % "hidden yp x+" . intMarginWidth . " w20 vf_lblFavoriteIndex" . A_Index
}

Gui, 2:Add, Button, % "x10 y+" . intIconsManageRowsHeight . " vf_btnIconsManagePrev gLoadIconsManageListPrev h33", %lDialogIconsManagePrevious%
Gui, 2:Add, Button, x10 yp vf_btnIconsManageNext gLoadIconsManageListNext h33, %lDialogIconsManageNext%
Gui, 2:Add, Button, x10 yp vf_btnIconsManageClose g2GuiClose h33, %lGuiCloseAmpersand%
Gui, 2:Add, Text, x10, %A_Space%

Gosub, LoadIconsManageList

; GuiCenterButtons(strWindow, intInsideHorizontalMargin := 10, intInsideVerticalMargin := 0, intDistanceBetweenButtons := 20, arrControls*)
GuiCenterButtons(L(lDialogIconsManageTitle, g_strAppNameText, g_strAppVersion), 20, 10, 40, "f_btnIconsManagePrev", "f_btnIconsManageNext", "f_btnIconsManageClose")
Gosub, ShowGui2AndDisableGui1

intTop := ""
intLeft := ""
intWidth := ""
intMonitorHeight := ""
intIconsManageRowsHeight := ""
intMarginWidth := ""
intIconSize := ""
intCurrentWidth := ""
intDefaultWidth := ""
intMenuPathWidth := ""
intFavoriteNameWidth := ""
intButtonsWidth := ""
intButtonsHeight := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
LoadIconsManageList:
LoadIconsManageListPrev:
LoadIconsManageListNext:
;------------------------------------------------------------

intIconsManageListWinID := WinExist("A")
if not DllCall("LockWindowUpdate", Uint, intIconsManageListWinID)
	Oops("An error occured while locking window display in`n" . L(lDialogIconsManageTitle, g_strAppNameText, g_strAppVersion))

if (A_ThisLabel = "LoadIconsManageListNext")
	g_intIconsManageStartingRow += g_intIconsManageRows
else if (A_ThisLabel = "LoadIconsManageListPrev")
	g_intIconsManageStartingRow -= g_intIconsManageRows
else ; LoadIconsManageList
	g_intIconsManageStartingRow := 1

Loop, %g_intIconsManageRows%
{
	intThisItemInMenu := A_Index + g_intIconsManageStartingRow - 1
	
	strShowHide := (intThisItemInMenu <= g_objManageIcons.MaxIndex() ? "Show" : "Hide")
	GuiControl, %strShowHide%, f_picIconCurrent%A_Index%
	GuiControl, %strShowHide%, f_btnPickDialog%A_Index%
	GuiControl, %strShowHide%, f_picIconDefault%A_Index%
	GuiControl, %strShowHide%, f_btnSetDefault%A_Index%
	GuiControl, %strShowHide%, f_lblFavoriteName%A_Index%
	GuiControl, %strShowHide%, f_lblMenuPath%A_Index%
	; GuiControl, %strShowHide%, f_lblFavoriteIndex%A_Index%
	
	if !StrLen(g_objManageIcons[intThisItemInMenu].FavoriteIconResource)
		g_objManageIcons[intThisItemInMenu].FavoriteIconResource := g_objManageIcons[intThisItemInMenu].FavoriteDefaultIconResource
	ParseIconResource(g_objManageIcons[intThisItemInMenu].FavoriteIconResource, strInconFile, intIconIndex, "iconFolder") ; only folder favorite may need the default icon
	GuiControl, , f_picIconCurrent%A_Index%, % "*icon" . intIconIndex . " " . strInconFile
	ParseIconResource(g_objManageIcons[intThisItemInMenu].FavoriteDefaultIconResource, strInconFile, intIconIndex)
	GuiControl, , f_picIconDefault%A_Index%, % "*icon" . intIconIndex . " " . strInconFile
	strShowHide := (A_Index = 1 or (g_objManageIcons[intThisItemInMenu].MenuPath <> strPreviousMenuPath and intThisItemInMenu <= g_objManageIcons.MaxIndex()) ? "Show" : "Hide")
	GuiControl, %strShowHide%, f_lblMenuPath%A_Index%

	GuiControl, , f_lblFavoriteName%A_Index%, % g_objManageIcons[intThisItemInMenu].FavoriteName
	GuiControl, , f_lblMenuPath%A_Index%, % g_objManageIcons[intThisItemInMenu].MenuPath
	GuiControl, , f_lblFavoriteIndex%A_Index%, % g_objManageIcons[intThisItemInMenu].FavoriteIndex
	strPreviousMenuPath := g_objManageIcons[intThisItemInMenu].MenuPath
}

; ###_V("", g_intIconsManageStartingRow, g_intIconsManageRows, g_objManageIcons.MaxIndex(), "", (g_intIconsManageStartingRow + g_intIconsManageRows) < g_objManageIcons.MaxIndex(), g_intIconsManageStartingRow > 1)
GuiControl, % ((g_intIconsManageStartingRow + g_intIconsManageRows) < g_objManageIcons.MaxIndex() ? "Enable" : "Disable"), f_btnIconsManageNext
GuiControl, % (g_intIconsManageStartingRow > 1 ? "Enable" : "Disable"), f_btnIconsManagePrev
GuiControl, Focus, f_btnIconsManageClose

DllCall("LockWindowUpdate", Uint, 0)  ; Pass 0 to unlock the currently locked window.

intIconsManageListWinID := ""
strShowHide := ""
intThisItemInMenu := ""
strInconFile := ""
intIconIndex := ""
strPreviousMenuPath := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
RecursiveLoadMenuIconsManage(objCurrentMenu)
;------------------------------------------------------------
{
	global g_objManageIcons

	Loop, % objCurrentMenu.MaxIndex()
	{
		if !InStr("B|X|K", objCurrentMenu[A_Index].FavoriteType) ; skip back links and separators
		{
			objThisFavorite := Object()
			objThisFavorite.MenuPath := objCurrentMenu.MenuPath
			objThisFavorite.FavoriteIndex := A_Index
			objThisFavorite.FavoriteType := objCurrentMenu[A_Index].FavoriteType
			objThisFavorite.FavoriteName := objCurrentMenu[A_Index].FavoriteName
			objThisFavorite.FavoriteLocation := objCurrentMenu[A_Index].FavoriteLocation
			objThisFavorite.FavoriteIconResource := objCurrentMenu[A_Index].FavoriteIconResource
			objThisFavorite.FavoriteDefaultIconResource := GetDefaultIcon4Type(objCurrentMenu[A_Index], objCurrentMenu[A_Index].FavoriteLocation)
			g_objManageIcons.Insert(objThisFavorite)
		}
		
		if InStr("Menu|External", objCurrentMenu[A_Index].FavoriteType, true)
			RecursiveLoadMenuIconsManage(objCurrentMenu[A_Index].SubMenu) ; RECURSIVE
	}
}
;------------------------------------------------------------


;------------------------------------------------------------
IconsManagePickIconDialog:
IconsManageSetDefault:
;------------------------------------------------------------

intIconRow := A_GuiControl
StringReplace, intIconRow, intIconRow, f_picIconCurrent
StringReplace, intIconRow, intIconRow, f_picIconDefault
StringReplace, intIconRow, intIconRow, f_btnPickDialog
StringReplace, intIconRow, intIconRow, f_btnSetDefault
intManageIconsIndex := g_intIconsManageStartingRow + intIconRow - 1

strIconResource := (A_ThisLabel = "IconsManagePickIconDialog"
	? PickIconDialog(g_objManageIcons[intManageIconsIndex].FavoriteIconResource) 
	: g_objManageIcons[intManageIconsIndex].FavoriteDefaultIconResource)
ParseIconResource(strIconResource, strInconFile, intIconIndex)
GuiControl, , f_picIconCurrent%intIconRow%, % "*icon" . intIconIndex . " " . strInconFile

if (g_objManageIcons[intManageIconsIndex].FavoriteIconResource <> strIconResource)
{
	if FavoriteIsUnderExternalMenu(g_objMenusIndex[g_objManageIcons[intManageIconsIndex].MenuPath], objExternalMenu) and !ExternalMenuAvailableForLock(objExternalMenu)
	; this favorite could not be edited because it is in an external menu locked by another user,
	; or because external settings file is in a read-only folder, or because external files was modified 
	; by another user since it was loaded in QAP by this user
		goto, IconsManagePickIconDialogCleanup
	; else continue

	g_objManageIcons[intManageIconsIndex].FavoriteIconResource := strIconResource
	g_objMenusIndex[g_objManageIcons[intManageIconsIndex].MenuPath][g_objManageIcons[intManageIconsIndex].FavoriteIndex].FavoriteIconResource := strIconResource
	Gosub, EnableSaveAndCancel
}

IconsManagePickIconDialogCleanup:
intIconRow := ""
strIconResource := ""
objExternalMenu := ""

return
;------------------------------------------------------------


;============================================================
GuiAddSeparator:
GuiAddColumnBreak:
;------------------------------------------------------------

if FavoriteIsUnderExternalMenu(g_objMenuInGui, objExternalMenu) and !ExternalMenuAvailableForLock(objExternalMenu, true) ; blnLockItForMe
; if the menu is an external menu that cannot be locked, user received an error message, then abort
	return

GuiControl, Focus, f_lvFavoritesList
Gui, 1:ListView, f_lvFavoritesList

if (LV_GetCount("Selected") > 1)
	or (LV_GetNext() = 1 and g_objMenuInGui[1].FavoriteType = "B")
	return

intInsertPosition := LV_GetCount() ? (LV_GetNext() ? LV_GetNext() : LV_GetCount() + 1) : 1

; --- add in menu object ---

objNewFavorite := Object()
if (A_ThisLabel = "GuiAddSeparator")
{
	objNewFavorite.FavoriteType := "X"
	objNewFavorite.FavoriteName := ""
	objNewFavorite.FavoriteLocation := ""
}
else ; GuiAddColumnBreak
{
	objNewFavorite.FavoriteType := "K"
	objNewFavorite.FavoriteName := ""
	objNewFavorite.FavoriteLocation := ""
}
g_objMenuInGui.Insert(intInsertPosition, objNewFavorite)

; --- add in Gui ---

LV_Modify(0, "-Select")

if (A_ThisLabel = "GuiAddSeparator")
	LV_Insert(intInsertPosition, "Select Focus", g_strGuiMenuSeparator, g_strGuiMenuSeparatorShort, g_strGuiMenuSeparator . g_strGuiMenuSeparator)
else ; GuiAddColumnBreak
	LV_Insert(intInsertPosition, "Select Focus", g_strGuiDoubleLine . " " . lMenuColumnBreak . " " . g_strGuiDoubleLine
		, g_strGuiDoubleLine, g_strGuiDoubleLine . " " . lMenuColumnBreak . " " . g_strGuiDoubleLine)

LV_Modify(LV_GetNext(), "Vis")
Gosub, AdjustColumnsWidth

Gosub, EnableSaveAndCancel

; if favorite's menu is in an external settings file, flag that it needs to be saved
if FavoriteIsUnderExternalMenu(g_objMenuInGui, objExternalMenu)
	objExternalMenu.NeedSave := true

intInsertPosition := ""
objNewFavorite := ""
objExternalMenu := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
GetMenuForGuiFiltered(ByRef intPositionInMenuForGui)
;------------------------------------------------------------
{
	global g_objMenusIndex
	
	Gui, 1:ListView, f_lvFavoritesListFiltered

	intPositionInListView := LV_GetNext()
	; ###_V(A_ThisFunc, intPositionInListView)
	if !(intPositionInListView)
	{
		intPositionInMenuForGui := 0
		return % "" ; empty
	}
	
	LV_GetText(strMenuPath, intPositionInListView, 2)
	LV_GetText(intPositionInMenuForGui, intPositionInListView, 6)
	
	return g_objMenusIndex[strMenuPath]
}
;------------------------------------------------------------


;------------------------------------------------------------
GetFavoritesListFilter()
;------------------------------------------------------------
{
	global g_blnFavoritesListFilterNeverFocused
	
	GuiControlGet, strFilter, 1:, f_strFavoritesListFilter

	return (strFilter = lDialogSearch and g_blnFavoritesListFilterNeverFocused ? "" : strFilter)
}
;------------------------------------------------------------


;------------------------------------------------------------
GuiFavoritesListFilterEmpty:
;------------------------------------------------------------

if !StrLen(GetFavoritesListFilter())
	return

if !(g_blnFavoritesListFilterNeverFocused)
{
	GuiControl, 1:, f_strFavoritesListFilter, % ""
	g_blnFavoritesListFilterNeverFocused := false
}
gosub, LoadMenuInGui

return
;------------------------------------------------------------


;========================================================================================================================
; END OF FAVORITE_GUI_OTHER
;========================================================================================================================


;========================================================================================================================
!_038_FAVORITES_GUI_SAVE:
;========================================================================================================================

;------------------------------------------------------------
GuiSaveAndCloseFavorites:
GuiSaveAndStayFavorites:
GuiSaveAndDoNothing:
;------------------------------------------------------------

g_blnMenuReady := false
strSavedMenuInGui := g_objMenuInGui.MenuPath

ToolTip, %lGuiSaving% ; animated tooltip
GuiControl, Disable, f_btnGuiSaveAndCloseFavorites
GuiControl, Disable, f_btnGuiSaveAndStayFavorites
Gui, Font, s6 ; set a new default
GuiControl, Disable, f_btnGuiCancel

IniRead, strTempIniFavoritesSection, %g_strIniFile%, Favorites
IniWrite, %strTempIniFavoritesSection%, %g_strIniFile%, Favorites-backup
IniDelete, %g_strIniFile%, Favorites

g_intIniLine := 1 ; reset counter before saving to another ini file
RecursiveSaveFavoritesToIniFile(g_objMainMenu)
ToolTip, %lGuiSaving%. ; animated tooltip

; clean-up unused hotkeys if favorites were deleted
for strThisNameLocation, strThisHotkey in g_objHotkeysByNameLocation
	if RecursiveHotkeyNotNeeded(strThisNameLocation, g_objMainMenu)
	{
		g_objHotkeysByNameLocation.Remove(strThisNameLocation)
		Hotkey, %strThisHotkey%, , Off
	}

Gosub, DisablePreviousLocationHotkeys ; disable hotkeys found in ini file before updating the ini file
Gosub, SaveLocationHotkeysToIni ; save location hotkeys to ini file from g_objHotkeysByNameLocation
Gosub, EnableLocationHotkeys ; enable location hotkeys from g_objHotkeysByNameLocation
ToolTip, %lGuiSaving%.. ; animated tooltip

Gosub, LoadMenuFromIni ; load favorites to menu object
ToolTip, %lGuiSaving%... ; animated tooltip

Gosub, RefreshTotalCommanderHotlist ; because ReloadIniFile resets g_objMenusIndex
Gosub, SetTimerRefreshDynamicMenus
Gosub, BuildMainMenuWithStatus ; only here we load hotkeys, when user save favorites
Gosub, ExternalMenusRelease ; release reserved external menus

GuiControl, Enable, f_btnGuiCancel
GuiControl, , f_btnGuiCancel, %lGuiCloseAmpersand%
g_blnMenuReady := true

if (A_ThisLabel = "GuiSaveAndStayFavorites")
{
	if (g_objMenusIndex[strSavedMenuInGui].MenuType = "External")
		g_objMenuInGui := g_objMenusIndex[lMainMenuName]
	else
		g_objMenuInGui := g_objMenusIndex[strSavedMenuInGui]
	Gosub, GuiShowFromGuiSettings
}
else if (A_ThisLabel <> "GuiSaveAndDoNothing")
	Gosub, GuiCancel
	
g_intIniLine := ""
strSavedMenuInGui := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
RecursiveSaveFavoritesToIniFile(objCurrentMenu)
;------------------------------------------------------------
{
	global g_strIniFile
	global g_intIniLine
	global g_strEscapePipe
	global g_objJLiconsByName
	global g_objJLiconsNames
	
	; ###_V("RecursiveSaveFavoritesToIniFile Begin", g_strIniFile, g_intIniLine)
	; ###_O("objCurrentMenu", objCurrentMenu, "FavoriteLocation")
	
	Loop, % objCurrentMenu.MaxIndex()
	{
		; skip ".." back link to parent menu
		blnIsBackMenu := (objCurrentMenu[A_Index].FavoriteType = "B")
		if !(blnIsBackMenu)
		{
			; make sure we do not save a menu separator after a column break - this would confuse the references to menu object index
			if (A_Index > 1)
				if (objCurrentMenu[A_Index].FavoriteType = "X") and (objCurrentMenu[A_Index - 1].FavoriteType = "K")
					continue

			strIniLine := objCurrentMenu[A_Index].FavoriteType . "|" ; 1
			if (objCurrentMenu[A_Index].FavoriteType = "QAP")
				strIniLine .= "|" ; do not save name to ini file, use current language feature name when loading ini file
			else
				strIniLine .= ReplaceAllInString(objCurrentMenu[A_Index].FavoriteName, "|", g_strEscapePipe) . "|" ; 2
			strIniLine .= ReplaceAllInString(objCurrentMenu[A_Index].FavoriteLocation, "|", g_strEscapePipe) . "|" ; 3
			if StrLen(g_objJLiconsByName[objCurrentMenu[A_Index].FavoriteIconResource]) ; save index of g_objJLiconsByName
				strIniLine .= g_objJLiconsByName[objCurrentMenu[A_Index].FavoriteIconResource] . "|" ; 4
			else if InStr(objCurrentMenu[A_Index].FavoriteIconResource, "JLicons.dll") ; get index of g_objJLiconsByName by index number
			{
				ParseIconResource(objCurrentMenu[A_Index].FavoriteIconResource, strIconFile, intIconIndex)
				strIniLine .= g_objJLiconsNames[intIconIndex] . "|" ; 4
			}
			else ; use icongroup as is
				strIniLine .= objCurrentMenu[A_Index].FavoriteIconResource . "|" ; 4
			strIniLine .= ReplaceAllInString(objCurrentMenu[A_Index].FavoriteArguments, "|", g_strEscapePipe) . "|" ; 5
			strIniLine .= objCurrentMenu[A_Index].FavoriteAppWorkingDir . "|" ; 6
			strIniLine .= objCurrentMenu[A_Index].FavoriteWindowPosition . "|" ; 7
			; REMOVED strIniLine .= objCurrentMenu[A_Index].FavoriteHotkey . "|" ; 8
			strIniLine .= objCurrentMenu[A_Index].FavoriteLaunchWith . "|" ; 8
			strIniLine .= ReplaceAllInString(objCurrentMenu[A_Index].FavoriteLoginName, "|", g_strEscapePipe) . "|" ; 9
			strIniLine .= ReplaceAllInString(objCurrentMenu[A_Index].FavoritePassword, "|", g_strEscapePipe) . "|" ; 10
			strIniLine .= objCurrentMenu[A_Index].FavoriteGroupSettings . "|" ; 11
			strIniLine .= objCurrentMenu[A_Index].FavoriteFtpEncoding . "|" ; 12
			strIniLine .= objCurrentMenu[A_Index].FavoriteElevate . "|" ; 13
			strIniLine .= objCurrentMenu[A_Index].FavoriteDisabled . "|" ; 14
			strIniLine .= objCurrentMenu[A_Index].FavoriteFolderLiveLevels . "|" ; 15
			strIniLine .= objCurrentMenu[A_Index].FavoriteFolderLiveDocuments . "|" ; 16
			strIniLine .= objCurrentMenu[A_Index].FavoriteFolderLiveColumns . "|" ; 17
			strIniLine .= objCurrentMenu[A_Index].FavoriteFolderLiveIncludeExclude . "|" ; 18
			strIniLine .= objCurrentMenu[A_Index].FavoriteFolderLiveExtensions . "|" ; 19

			IniWrite, %strIniLine%, %g_strIniFile%, Favorites, Favorite%g_intIniLine%
			; ###_V("Loop After Write", g_strIniFile, g_intIniLine, strIniLine)
			g_intIniLine++
		}

		if (InStr("Menu|Group", objCurrentMenu[A_Index].FavoriteType, true) and !(blnIsBackMenu))
			or (objCurrentMenu[A_Index].FavoriteType = "External"
				and !ExternalMenuIsReadOnly(objCurrentMenu[A_Index].FavoriteAppWorkingDir)
				and objCurrentMenu[A_Index].SubMenu.MenuLoaded
				and objCurrentMenu[A_Index].SubMenu.NeedSave)
		{
			if (objCurrentMenu[A_Index].FavoriteType = "External")
			{
				strPreviousIniFile := g_strIniFile
				intPreviousIniLine := g_intIniLine
				g_strIniFile := PathCombine(A_WorkingDir, EnvVars(objCurrentMenu[A_Index].FavoriteAppWorkingDir)) ; settings file path
				g_intIniLine := objCurrentMenu[A_Index].FavoriteGroupSettings ; starting number - DEPRECATED since v8.1.9.1
				if !StrLen(g_intIniLine)
					g_intIniLine := 1 ; always 1 for menu added from v8.1.9.1
				
				if FileExist(g_strIniFile)
				{
					gosub, BackupIniFile ; backup external settings ini file, if required
					
					IniRead, strTempIniFavoritesSection, %g_strIniFile%, Favorites
					IniWrite, %strTempIniFavoritesSection%, %g_strIniFile%, Favorites-backup
					IniDelete, %g_strIniFile%, Favorites
					; ###_V("DateTime", g_strIniFile, strIniDateTimeBefore)
				}
				else ; new external menu file, init external menu values
				{
					; not required - strIniDateTimeBefore := ""
                    ; IniWrite, 0, %g_strIniFile%, Global, MenuReadOnly - DEPRECATED since v8.1.9.1
					/*
					IniWrite, % objCurrentMenu[A_Index].FavoriteName, %g_strIniFile%, Global, SharedMenuName
					IniWrite, 0, %g_strIniFile%, Global, MenuReadOnly ; default false
					IniWrite, % "", %g_strIniFile%, Global, WriteAccessUsers ; default empty
					IniWrite, % "", %g_strIniFile%, Global, WriteAccessMessage ; default empty
					###_V(A_ThisLabel, g_strIniFile, f_strExternalMenuName)
					IniWrite, %f_blnExternalMenuReadOnly%, %g_strIniFile%, Global, MenuReadOnly
					IniWrite, %f_strExternalMenuName%, %g_strIniFile%, Global, MenuName
					IniWrite, %f_strExternalWriteAccessUsers%, %g_strIniFile%, Global, WriteAccessUsers
					IniWrite, %f_strExternalWriteAccessMessage%, %g_strIniFile%, Global, WriteAccessMessage
					*/
				}
			}
			
			RecursiveSaveFavoritesToIniFile(objCurrentMenu[A_Index].SubMenu) ; RECURSIVE
			
			if (objCurrentMenu[A_Index].FavoriteType = "External")
			{
				Sleep, 20 ; for safety
				strIniDateTimeAfter := GetModifiedDateTime(g_strIniFile)
				objCurrentMenu[A_Index].SubMenu.MenuExternalLastModifiedWhenLoaded := strIniDateTimeAfter
				objCurrentMenu[A_Index].SubMenu.MenuExternalLastModifiedNow := strIniDateTimeAfter
				objCurrentMenu[A_Index].SubMenu.NeedSave := false
				IniWrite, %strIniDateTimeAfter%, %g_strIniFile%, Global, LastModified
				; ###_V("DateTime AFTER", g_strIniFile, strIniDateTimeAfter)
					
				g_strIniFile := strPreviousIniFile
				g_intIniLine := intPreviousIniLine
			}
		}
	}
		
	IniWrite, Z, %g_strIniFile%, Favorites, Favorite%g_intIniLine% ; end of menu marker
	g_intIniLine++
	
	return
}
;------------------------------------------------------------


;========================================================================================================================
; END OF FAVORITES LIST
;========================================================================================================================


;========================================================================================================================
!_040_GUI_CHANGE_HOTKEY:
return
;========================================================================================================================

; Gui in function, see from daniel2 http://www.autohotkey.com/board/topic/19880-help-making-gui-work-inside-a-function/#entry130557

;------------------------------------------------------------
SelectHotkey(P_strActualHotkey, P_strFavoriteName, P_strFavoriteType, P_strFavoriteLocation, P_intHotkeyType, P_strDefaultHotkey := "", P_strDescription := "")
; P_intHotkeyType: 1 Mouse, 2 Keyboard, 3 Mouse or Keyboard
; returns the new hotkey, "None" if no hotkey or empty string if cancel
;------------------------------------------------------------
{
	; To create a global variable inside a function without knowing in advance what the variable's name is, the function must be assume-global. (Lexikos)
	; (https://autohotkey.com/board/topic/84822-error-when-creating-gui-with-global-var-as-a-name/#entry540615)
	; Use SH_ prefix in local variable names to avoid conflicts outside the function and empty these variable because the function will not do it.
	global

	g_blnChangeHotkeyInProgress := true
	SH_strModifiersLabels := "Shift|Ctrl|Alt|Win"
	StringSplit, SH_arrModifiersLabels, SH_strModifiersLabels, |
	SH_strModifiersSymbols := "+|^|!|#"
	StringSplit, SH_arrModifiersSymbols, SH_strModifiersSymbols, |
	
	SplitHotkey(P_strActualHotkey, SH_strActualModifiers, SH_strActualKey, SH_strActualMouseButton, SH_strActualMouseButtonsWithDefault)

	g_intGui2WinID := WinExist("A")

	Gui, 3:New, , % L(lDialogChangeHotkeyTitle, g_strAppNameText, g_strAppVersion)
	Gui, 3:Default
	Gui, +Owner2
	Gui, +OwnDialogs
	
	if (g_blnUseColors)
		Gui, Color, %g_strGuiWindowColor%
	Gui, Font, s10 w700, Verdana
	Gui, Add, Text, x10 y10 w400 center, % L(lDialogChangeHotkeyTitle, g_strAppNameText)
	Gui, Font

	Gui, Add, Text, y+15 x10, %lDialogTriggerFor%
	Gui, Font, s8 w700
	Gui, Add, Text, x+5 yp w300 section, % P_strFavoriteName . (StrLen(P_strFavoriteType) ? " (" . P_strFavoriteType . ")" : "")
	Gui, Font
	if StrLen(P_strFavoriteLocation)
		Gui, Add, Text, xs y+5 w300, % (P_strFavoriteType = "Snippet" ? StringLeftDotDotDot(P_strFavoriteLocation, 150) : P_strFavoriteLocation)
	if StrLen(P_strDescription)
	{
		StringReplace, P_strDescription, P_strDescription, <A> ; remove links from description (already displayed in previous dialog box)
		StringReplace, P_strDescription, P_strDescription, </A>
		Gui, Add, Text, xs y+5 w300, %P_strDescription%
	}

	Loop, 4 ; for each modifier add a checkbox
	{
		Gui, Add, CheckBox, % "y+" (SH_arrModifiersLabels%A_Index% = "Shift" ? 20 : 10) . " x50 gModifierClicked vf_bln" . SH_arrModifiersLabels%A_Index%, % lDialog . SH_arrModifiersLabels%A_Index%
		if (SH_arrModifiersLabels%A_Index% = "Shift")
			GuiControlGet, SH_arrTop, Pos, f_blnShift
	}

	if (P_intHotkeyType = 1)
		Gui, Add, DropDownList, % "y" . SH_arrTopY . " x150 w200 vf_drpHotkeyMouse gMouseChanged", %SH_strActualMouseButtonsWithDefault%
	if (P_intHotkeyType = 3)
	{
		Gui, Add, Text, % "y" . SH_arrTopY . " x150 w60", %lDialogMouse%
		Gui, Add, DropDownList, yp x+10 w200 vf_drpHotkeyMouse gMouseChanged, %SH_strActualMouseButtonsWithDefault%
		Gui, Add, Text, % "y" . SH_arrTopY + 20 . " x150", %lDialogOr%
	}
	if (P_intHotkeyType <> 1)
	{
		Gui, Add, Text, % "y" . SH_arrTopY + (P_intHotkeyType = 2 ? 0 : 40) . " x150 w60", %lDialogKeyboard%
		Gui, Add, Hotkey, yp x+10 w200 vf_strHotkeyKey gHotkeyChanged section
		GuiControl, , f_strHotkeyKey, %SH_strActualKey%
	}
	if (P_intHotkeyType <> 1)
		Gui, Add, Link, y+5 xs w200 gHotkeyInvisibleKeysClicked, % L(lDialogHotkeyInvisibleKeys, "Space", "Tab", "Enter", "Esc", "Menu")

	Gui, Add, Button, % "x10 y" . SH_arrTopY + 100 . " vf_btnNoneHotkey gSelectNoneHotkeyClicked", %lDialogNone%
	if StrLen(P_strDefaultHotkey)
	{
		Gui, Add, Button, % "x10 y" . SH_arrTopY + 100 . " vf_btnResetHotkey gButtonResetHotkey", %lGuiResetDefault%
		GuiCenterButtons(L(lDialogChangeHotkeyTitle, g_strAppNameText, g_strAppVersion), 10, 5, 20, "f_btnNoneHotkey", "f_btnResetHotkey")
	}
	else
	{
		Gui, Add, Text, % "x10 y" . SH_arrTopY + 100
		GuiCenterButtons(L(lDialogChangeHotkeyTitle, g_strAppNameText, g_strAppVersion), 10, 5, 20, "f_btnNoneHotkey")
	}
	
	Gui, Add, Text, x10 y+25 w400, %lDialogChangeHotkeyLeftAnyRight%
	Loop, 4 ; create 4 groups of radio buttons for Right, Any or Left keys
	{
		Gui, Add, Text, y+10 x10 w60 right, % lDialog . SH_arrModifiersLabels%A_Index%
		Gui, Font, w700
		Gui, Add, Text, yp x+10 w40 center, % chr(0x2192) ; right arrow
		Gui, Font
		Gui, Add, Radio, % "yp x+10 disabled vf_radLeft" . SH_arrModifiersLabels%A_Index%, %lDialogWindowPositionLeft%
		Gui, Add, Radio, % "yp x+10 disabled vf_radAny" . SH_arrModifiersLabels%A_Index%, %lDialogChangeHotkeyAny%
		Gui, Add, Radio, % "yp x+10 disabled vf_radRight" . SH_arrModifiersLabels%A_Index%, %lDialogWindowPositionRight%
	}
	Gosub, SetModifiersCheckBoxAndRadio ; set checkboxes and radio buttons according to SH_strActualModifiers

	if StrLen(P_strFavoriteLocation)
		Gui, Add, Text, x10 y+25 w400 left vf_ChangeHotkeyNote, % (P_strFavoriteType = "Snippet" ? L(lDialogChangeHotkeyNoteSnippet, P_strFavoriteName) : L(lDialogChangeHotkeyNote, P_strFavoriteLocation, P_strFavoriteName))
		
	Gui, Add, Button, y+25 x10 vf_btnChangeHotkeyOK gButtonChangeHotkeyOK, %lDialogOKAmpersand%
	Gui, Add, Button, yp x+20 vf_btnChangeHotkeyCancel gButtonChangeHotkeyCancel, %lGuiCancelAmpersand%
	
	GuiCenterButtons(L(lDialogChangeHotkeyTitle, g_strAppNameText, g_strAppVersion), 10, 5, 20, "f_btnChangeHotkeyOK", "f_btnChangeHotkeyCancel")

	Gui, Add, Text
	GuiControl, Focus, f_btnChangeHotkeyOK
	Gui, Show, AutoSize Center

	Gui, 2:+Disabled
	WinWaitClose,  % L(lDialogChangeHotkeyTitle, g_strAppNameText, g_strAppVersion) ; waiting for Gui to close
	
	if (SH_strNewHotkey <> P_strActualHotkey)
		SH_strNewHotkey := HotkeyIfAvailable(SH_strNewHotkey, (StrLen(P_strFavoriteLocation) ? P_strFavoriteLocation : P_strFavoriteName))

	; Clean-up function global variables
	SH_arrModifiersLabels := ""
	SH_arrModifiersSymbols := ""
	SH_arrTop := ""
	SH_blnAlt := ""
	SH_blnCtrl := ""
	SH_blnShift := ""
	SH_blnThisLeft := ""
	SH_blnThisModifierOn := ""
	SH_blnThisRight := ""
	SH_blnWin := ""
	SH_intReverseIndex := ""
	SH_strActualKey := ""
	SH_strActualModifiers := ""
	SH_strActualMouseButton := ""
	SH_strActualMouseButtonsWithDefault := ""
	SH_strHotkeyControl := ""
	SH_strHotkeyControlKey := ""
	SH_strHotkeyControlModifiers := ""
	SH_strKey := ""
	SH_strModifiersLabels := ""
	SH_strModifiersSymbols := ""
	SH_strMouse := ""
	SH_strMouseControl := ""
	SH_strMouseValue := ""
	SH_strThisLabel := ""
	SH_strThisSymbol := ""

	return SH_strNewHotkey ; returning value
	
	;------------------------------------------------------------

	;------------------------------------------------------------
	MouseChanged:
	;------------------------------------------------------------

	SH_strMouseControl := A_GuiControl ; hotkey var name
	GuiControlGet, SH_strMouseValue, , %SH_strMouseControl%

	if (SH_strMouseValue = lDialogNone) ; this is the translated "None"
	{
		loop, 4 ; uncheck modifiers checkbox
			GuiControl, , % "f_bln" . SH_arrModifiersLabels%A_Index%, 0
		gosub, ModifierClicked
	}

	if (P_intHotkeyType = 3) ; both keyboard and mouse options are available
		; we have a mouse button, empty the hotkey control
		GuiControl, , f_strHotkeyKey, None

	return
	;------------------------------------------------------------
	
	;------------------------------------------------------------
	HotkeyChanged:
	;------------------------------------------------------------
	SH_strHotkeyControl := A_GuiControl ; hotkey var name
	SH_strHotkeyControl := %SH_strHotkeyControl% ; hotkey content

	if !StrLen(SH_strHotkeyControl)
		return

	SplitModifiersFromKey(SH_strHotkeyControl, SH_strHotkeyControlModifiers, SH_strHotkeyControlKey)

	if StrLen(SH_strHotkeyControlModifiers) ; we have a modifier and we don't want it, reset keyboard to none and return
		GuiControl, , %A_GuiControl%, None
	else ; we have a valid key, empty the mouse dropdown and return
		GuiControl, Choose, f_drpHotkeyMouse, 0

	return
	;------------------------------------------------------------

	;------------------------------------------------------------
	SelectNoneHotkeyClicked:
	;------------------------------------------------------------

	GuiControl, , f_strHotkeyKey, %lDialogNone%
	GuiControl, Choose, f_drpHotkeyMouse, %lDialogNone%
	SplitHotkey("None", SH_strActualModifiers, SH_strActualKey, SH_strActualMouseButton, SH_strActualMouseButtonsWithDefault)
	Gosub, SetModifiersCheckBoxAndRadio ; set checkboxes and radio buttons according to SH_strActualModifiers

	return
	;------------------------------------------------------------

	;------------------------------------------------------------
	HotkeyInvisibleKeysClicked:
	;------------------------------------------------------------
	
	if (ErrorLevel = "Space")
		GuiControl, , f_strHotkeyKey, %A_Space%
	else if (ErrorLevel = "Tab")
		GuiControl, , f_strHotkeyKey, %A_Tab%
	else if (ErrorLevel = "Enter")
		GuiControl, , f_strHotkeyKey, Enter
	else if (ErrorLevel = "Esc")
		GuiControl, , f_strHotkeyKey, Escape
	else ; Menu
		GuiControl, , f_strHotkeyKey, AppsKey
	GuiControl, Choose, f_drpHotkeyMouse, 0

	return
	;------------------------------------------------------------

	;------------------------------------------------------------
	ButtonResetHotkey:
	;------------------------------------------------------------

	SplitHotkey(P_strDefaultHotkey, SH_strActualModifiers, SH_strActualKey, SH_strActualMouseButton, SH_strActualMouseButtonsWithDefault)
	GuiControl, , f_strHotkeyKey, %SH_strActualKey%
	GuiControl, Choose, f_drpHotkeyMouse, % GetText4MouseButton(SH_strActualMouseButton)
	Gosub, SetModifiersCheckBoxAndRadio ; set checkboxes and radio buttons according to SH_strActualModifiers
	
	return
	;------------------------------------------------------------

	;------------------------------------------------------------
	SetModifiersCheckBoxAndRadio:
	;------------------------------------------------------------
	loop, 4 ; set modifiers checkboxes according to SH_strActualModifiers
	{
		SH_strThisLabel := SH_arrModifiersLabels%A_Index%
		SH_strThisSymbol := SH_arrModifiersSymbols%A_Index%
		
		GuiControl, , % "f_bln" . SH_strThisLabel, % InStr(SH_strActualModifiers, SH_strThisSymbol) > 0 ; > 0 required to make sure we have 0 or 1 value
		
		GuiControl, , f_radLeft%SH_strThisLabel%, % InStr(SH_strActualModifiers, "<" . SH_strThisSymbol) > 0
		GuiControl, , f_radAny%SH_strThisLabel%, % !InStr(SH_strActualModifiers, "<" . SH_strThisSymbol) and !InStr(P_strActualHotkey, ">" . SH_strThisSymbol)
		GuiControl, , f_radRight%SH_strThisLabel%, % InStr(SH_strActualModifiers, ">" . SH_strThisSymbol) > 0
	}
	gosub, ModifierClicked
	
	return
	;------------------------------------------------------------

	;------------------------------------------------------------
	ModifierClicked:
	;------------------------------------------------------------
	Loop, 4 ; enable/disable modifiers radio buttons groups for each modifier
	{
		SH_strThisLabel := SH_arrModifiersLabels%A_Index%
		SH_strThisSymbol := SH_arrModifiersSymbols%A_Index%
		
		GuiControlGet, SH_blnThisModifierOn, , % "f_bln" . SH_arrModifiersLabels%A_Index%
		GuiControl, Enable%SH_blnThisModifierOn%, f_radLeft%SH_strThisLabel%
		GuiControl, Enable%SH_blnThisModifierOn%, f_radAny%SH_strThisLabel%
		GuiControl, Enable%SH_blnThisModifierOn%, f_radRight%SH_strThisLabel%
	}
	return
	;------------------------------------------------------------
	
	;------------------------------------------------------------
	ButtonChangeHotkeyOK:
	;------------------------------------------------------------
	
	GuiControlGet, SH_strMouse, , f_drpHotkeyMouse
	GuiControlGet, SH_strKey, , f_strHotkeyKey
	GuiControlGet, SH_blnWin , ,f_blnWin
	GuiControlGet, SH_blnAlt, , f_blnAlt
	GuiControlGet, SH_blnCtrl, , f_blnCtrl
	GuiControlGet, SH_blnShift, , f_blnShift

	if StrLen(SH_strMouse)
		SH_strMouse := GetMouseButton4Text(SH_strMouse) ; get mouse button system name from dropdown localized text
	
	SH_strNewHotkey := Trim(SH_strKey . (SH_strMouse = "None" ? "" : SH_strMouse))
	if !StrLen(SH_strNewHotkey)
		SH_strNewHotkey := "None"
	
	if HasHotkey(SH_strNewHotkey)
		Loop, 4
		{
			SH_intReverseIndex := -(A_Index-5) ; reverse order of modifiers important to keep modifiers labels in correct order
			SH_strThisLabel := SH_arrModifiersLabels%SH_intReverseIndex%
			SH_strThisSymbol := SH_arrModifiersSymbols%SH_intReverseIndex%
			if (SH_bln%SH_strThisLabel%)
			{
				GuiControlGet, SH_blnThisLeft, , f_radLeft%SH_strThisLabel%
				GuiControlGet, SH_blnThisRight, , f_radRight%SH_strThisLabel%
				SH_strNewHotkey := (SH_blnThisLeft ? "<" : "") . (SH_blnThisRight ? ">" : "") . SH_strThisSymbol . SH_strNewHotkey
			}
		}

	; ###_V(A_ThisLabel, SH_strNewHotkey)
	
	if (SH_strNewHotkey = "LButton")
	{
		Oops(lDialogChangeHotkeyMouseCheckLButton, lDialogShift, lDialogCtrl, lDialogAlt, lDialogWin)
		SH_strNewHotkey := ""
		return
	}
	else if (SH_blnWin or SH_blnAlt or SH_blnCtrl or SH_blnShift) and (SH_strNewHotkey = "None")
	{
		Oops(lDialogChangeHotkeyModifierAndNone)
		SH_strNewHotkey := ""
		return
	}	
	g_blnChangeHotkeyInProgress := false
	Gosub, 3GuiClose
	
	return
	;------------------------------------------------------------

	;------------------------------------------------------------
	ButtonChangeHotkeyCancel:
	;------------------------------------------------------------
	
	SH_strNewHotkey := ""

	g_blnChangeHotkeyInProgress := false
	Gosub, 3GuiClose
  
	return
	;------------------------------------------------------------
}
;------------------------------------------------------------


;-----------------------------------------------------------
UpdateHotkeyObjectsFavoriteSave:
UpdateHotkeyObjectsHotkeysListSave:
;-----------------------------------------------------------

; if the hotkey changed, add new or remove hotkey from object
if (g_objHotkeysByNameLocation[FavoriteNameLocationFromObject(g_objEditedFavorite)] <> g_strNewFavoriteHotkey)
{
	if HasHotkey(g_strNewFavoriteHotkey)
		g_objHotkeysByNameLocation.Insert(FavoriteNameLocationFromObject(g_objEditedFavorite), g_strNewFavoriteHotkey)
	else
		g_objHotkeysByNameLocation.Remove(FavoriteNameLocationFromObject(g_objEditedFavorite))
}

if (A_ThisLabel = "UpdateHotkeyObjectsHotkeysListSave")
{
	GuiControl, 1:Enable, f_btnGuiSaveAndCloseFavorites
	GuiControl, 1:Enable, f_btnGuiSaveAndStayFavorites
	GuiControl, 1:, f_btnGuiCancel, %lGuiCancelAmpersand%

	Gosub, LoadHotkeysManageList
}

return
;-----------------------------------------------------------


;-----------------------------------------------------------
HotkeyIfAvailable(strHotkey, strLocation)
;-----------------------------------------------------------
{
	global g_arrPopupHotkeys
	global g_objQAPFeatures
	global g_arrOptionsPopupHotkeyTitles
	
	if !StrLen(strHotkey) or (strHotkey = "None")
		return strHotkey
	
	; check popup menu hotkeys
	loop, 4
		if (g_arrPopupHotkeys%A_Index% = strHotkey)
		{
			strExistingLocation := g_arrOptionsPopupHotkeyTitles%A_Index%
			break
		}
	
	; check QAP Features Alternative menu hotkeys
	for strCode, objThisQAPFeature in g_objQAPFeatures
		if (objThisQAPFeature.CurrentHotkey = strHotkey)
		{
			strExistingLocation := strCode
			break
		}
	
	; check favorites hotkeys
	if !StrLen(strExistingLocation)
		strExistingLocation := GetHotkeyLocation(strHotkey)
	
	if StrLen(strExistingLocation)
	{
		Oops(lOopsHotkeyAlreadyUsed, Hotkey2Text(strHotkey), FormatExistingLocation(strExistingLocation), FormatExistingLocation(strLocation))
		return ""
	}
	else
		return strHotkey
}
;-----------------------------------------------------------


;-----------------------------------------------------------
FormatExistingLocation(strExistingLocation)
;-----------------------------------------------------------
{
	global g_strGroupIndicatorPrefix
	global g_strGroupIndicatorSuffix
	global g_strMenuPathSeparator
	
	if InStr(strExistingLocation, g_strGroupIndicatorPrefix . g_strGroupIndicatorSuffix)
		strExisting := lOopsGroup
	else if SubStr(strExistingLocation, 1, 1) = g_strMenuPathSeparator
		strExisting := lMenuMenu
	else if SubStr(strExistingLocation, 1, 1) = "{"
		strExisting := lOopsQAPfeature
	else
		strExisting := lOopsLocation
	
	return strExisting . " """ . strExistingLocation . """"
}
;-----------------------------------------------------------


;------------------------------------------------------------
EnableLocationHotkeys:
; enable location hotkeys from g_objHotkeysByNameLocation
;------------------------------------------------------------

for strNameLocation, strHotkey in g_objHotkeysByNameLocation
{
	Hotkey, %strHotkey%, OpenFavoriteFromHotkey, On UseErrorLevel
	if (ErrorLevel)
	{
		StringSplit, arrNameLocation, strNameLocation, | ; name|location
		if StrLen(arrNameLocation1)
			Oops(lDialogInvalidHotkeyFavorite, strHotkey, arrNameLocation1, arrNameLocation2)
		else ; for QAP feature arrNameLocation1 is empty
			Oops(lDialogInvalidHotkeyQAPFeature, strHotkey, arrNameLocation2)
	}
}

strNameLocation := ""
arrNameLocation := ""
strHotkey := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
DisablePreviousLocationHotkeys:
; disable hotkeys found in ini file before updating the ini file
;------------------------------------------------------------

Loop
{
	IniRead, strLocationHotkey, %g_strIniFile%, LocationHotkeys, Hotkey%A_Index%
	if (strLocationHotkey = "ERROR")
		break
	StringSplit, arrLocationHotkey, strLocationHotkey, | ; name|location|hotkey
	Hotkey, %arrLocationHotkey3%, , Off
}

strLocationHotkey := ""
arrLocationHotkey := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
SaveLocationHotkeysToIni:
; save location hotkeys to ini file from g_objHotkeysByNameLocation
;------------------------------------------------------------

IniDelete, %g_strIniFile%, LocationHotkeys

g_intIniLine := 1
for strNamePipeLocation, strHotkey in g_objHotkeysByNameLocation ; strNamePipeLocation include: "name|location"
{
	IniWrite, %strNamePipeLocation%|%strHotkey%, %g_strIniFile%, LocationHotkeys, Hotkey%g_intIniLine%
	g_intIniLine++
}

strHotkey := ""
strNamePipeLocation := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
RecursiveHotkeyNotNeeded(strHotkeyNameLocation, objCurrentMenu)
;------------------------------------------------------------
{
	Loop, % objCurrentMenu.MaxIndex()
	{
		if InStr("B|X|K", objCurrentMenu[A_Index].FavoriteType) ; skip back link and separators
			continue
		
		if InStr("Menu|External", objCurrentMenu[A_Index].FavoriteType, true)
		{
			blnHotkeyNotNeeded := RecursiveHotkeyNotNeeded(strHotkeyNameLocation, objCurrentMenu[A_Index].SubMenu) ; RECURSIVE
			if !(blnHotkeyNotNeeded)
				return false ; we need this hotkey, stop recursion
		}
		
		strTempName := (objCurrentMenu[A_Index].FavoriteType = "QAP" ? "" : objCurrentMenu[A_Index].FavoriteName)
		if (strTempName . "|" . objCurrentMenu[A_Index].FavoriteLocation = strHotkeyNameLocation)
			return false
	}
	
	return true
}
;------------------------------------------------------------


;========================================================================================================================
; END OF GUI_CHANGE_HOTKEY:
;========================================================================================================================


;========================================================================================================================
!_050_GUI_CLOSE-CANCEL-BK_OBJECTS:
;========================================================================================================================


;------------------------------------------------------------
ShowGui2AndDisableGui1:
;------------------------------------------------------------

Gui, 2:Show, AutoSize Center
Gui, 1:+Disabled
if (g_Gui1AlwaysOnTop)
	WinSet, AlwaysOnTop, Off, % L(lGuiTitle, g_strAppNameText, g_strAppVersion)

return
;------------------------------------------------------------


;------------------------------------------------------------
GuiClose:
GuiEscape:
;------------------------------------------------------------

GoSub, GuiCancel

return
;------------------------------------------------------------


;------------------------------------------------------------
GuiCancel:
;------------------------------------------------------------

if !(g_blnFavoritesListFilterNeverFocused)
{
	GuiControl, 1:, f_strFavoritesListFilter, % "" ; empty filter will hide filtered list and show regular list
	g_blnFavoritesListFilterNeverFocused := false
}
GuiControlGet, strCancelLabel, , f_btnGuiCancel

blnCancelEnabled := (strCancelLabel = lGuiCancelAmpersand)
if (blnCancelEnabled)
{
	Gui, 1:+OwnDialogs
	MsgBox, 36, % L(lDialogCancelTitle, g_strAppNameText, g_strAppVersion), %lDialogCancelPrompt%
	IfMsgBox, Yes
	{
		g_blnMenuReady := false
		
		Gosub, RestoreBackupMenusObjects
		
		GuiControl, Disable, f_btnGuiSaveAndCloseFavorites
		GuiControl, Disable, f_btnGuiSaveAndStayFavorites
		GuiControl, , f_btnGuiCancel, %lGuiCloseAmpersand%
		g_blnMenuReady := true
	}
	IfMsgBox, No
	{
		gosub, GuiCancelCleanup
		return
	}
}
Gosub, ExternalMenusRelease ; release cancel enabled or not

Gui, 1:Cancel

GuiCancelCleanup:
blnCancelEnabled := ""
blnCancelEnabled := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
2GuiClose:
2GuiEscape:
;------------------------------------------------------------

g_strFavoriteDialogTitle := ""

Gui, 1:-Disabled
Gui, 2:Destroy
if (g_intGui1WinID <> A_ScriptHwnd)
	WinActivate, ahk_id %g_intGui1WinID%

if (g_Gui1AlwaysOnTop)
	WinSet, AlwaysOnTop, On, % L(lGuiTitle, g_strAppNameText, g_strAppVersion)

return
;------------------------------------------------------------


;------------------------------------------------------------
3GuiClose:
3GuiEscape:
;------------------------------------------------------------

Gui, 2:-Disabled
Gui, 3:Destroy
if (g_intGui2WinID <> A_ScriptHwnd)
	WinActivate, ahk_id %g_intGui2WinID%

return
;------------------------------------------------------------


;------------------------------------------------------------
BackupMenusObjects:
RestoreBackupMenusObjects:
; in case of Gui Cancel to restore objects to original state
;------------------------------------------------------------

if (A_ThisLabel = "BackupMenusObjects")
{
	objMenusSource := g_objMenusIndex
	g_objMenusBK := Object() ; re-init
}
else ; RestoreBackupMenusObjects
{
	objMenusSource := g_objMenusBK
	g_objMenusIndex := Object() ; re-init
}

for strMenuPath, objMenuSource in objMenusSource
{
	objMenuDest := Object()
	objMenuDest.MenuPath := objMenuSource.MenuPath
	objMenuDest.MenuType := objMenuSource.MenuType
	objMenuDest.MenuExternalPath := objMenuSource.MenuExternalPath
	objMenuDest.MenuLoaded := objMenuSource.MenuLoaded
	objMenuDest.MenuExternalLastModifiedNow := objMenuSource.MenuExternalLastModifiedNow
	objMenuDest.MenuExternalLastModifiedWhenLoaded := objMenuSource.MenuExternalLastModifiedWhenLoaded

	loop, % objMenuSource.MaxIndex()
	{
		objFavorite := Object()
		objFavorite.FavoriteType := objMenuSource[A_Index].FavoriteType ; 1
		objFavorite.FavoriteName := objMenuSource[A_Index].FavoriteName ; 2
		objFavorite.FavoriteLocation := objMenuSource[A_Index].FavoriteLocation ; 3
		objFavorite.FavoriteIconResource := objMenuSource[A_Index].FavoriteIconResource ; 4
		objFavorite.FavoriteArguments := objMenuSource[A_Index].FavoriteArguments ; 5
		objFavorite.FavoriteAppWorkingDir := objMenuSource[A_Index].FavoriteAppWorkingDir ; 6
		objFavorite.FavoriteWindowPosition := objMenuSource[A_Index].FavoriteWindowPosition ; 7
		; REMOVED objFavorite.FavoriteHotkey := objMenuSource[A_Index].FavoriteHotkey
		objFavorite.FavoriteLaunchWith := objMenuSource[A_Index].FavoriteLaunchWith ; 8
		objFavorite.FavoriteLoginName := objMenuSource[A_Index].FavoriteLoginName ; 9
		objFavorite.FavoritePassword := objMenuSource[A_Index].FavoritePassword ; 10
		objFavorite.FavoriteGroupSettings := objMenuSource[A_Index].FavoriteGroupSettings ; 11
		objFavorite.FavoriteFtpEncoding := objMenuSource[A_Index].FavoriteFtpEncoding ; 12
		objFavorite.FavoriteElevate := objMenuSource[A_Index].FavoriteElevate ; 13
		objFavorite.FavoriteDisabled := objMenuSource[A_Index].FavoriteDisabled ; 14
		objFavorite.FavoriteFolderLiveLevels := objMenuSource[A_Index].FavoriteFolderLiveLevels ; 15
		objFavorite.FavoriteFolderLiveDocuments := objMenuSource[A_Index].FavoriteFolderLiveDocuments ; 16
		objFavorite.FavoriteFolderLiveColumns := objMenuSource[A_Index].FavoriteFolderLiveColumns ; 17
		objFavorite.FavoriteFolderLiveIncludeExclude := objMenuSource[A_Index].FavoriteFolderLiveIncludeExclude ; 18
		objFavorite.FavoriteFolderLiveExtensions := objMenuSource[A_Index].FavoriteFolderLiveExtensions ; 19
		; do not backup objMenuSource[A_Index].SubMenu because we have to recreate them
		; after menu/groups objects are recreated during restore
		objMenuDest.Insert(objFavorite)
	}
	
	if (A_ThisLabel = "BackupMenusObjects")
		g_objMenusBK.Insert(strMenuPath, objMenuDest)
	else ; RestoreBackupMenusObjects
		g_objMenusIndex.Insert(strMenuPath, objMenuDest)
}

if (A_ThisLabel = "RestoreBackupMenusObjects")
{
	g_objMainMenu := g_objMenusIndex[lMainMenuName] ; re-connect main menu
	for strMenuPath, objMenuDest in g_objMenusIndex
	{
		; reconnect parent menu
		if (objMenuDest.MenuPath <> lMainMenuName)
		{
			intInStr := InStr(objMenuDest.MenuPath, " > ", , 0)	; search from end
			strParentPath := SubStr(objMenuDest.MenuPath, 1, intInStr - 1) ; strip the last submenu
			objParentMenu := g_objMenusIndex[strParentPath]
			objMenuDest[1].ParentMenu := objParentMenu
		}
		loop, % objMenuDest.MaxIndex()
			if InStr("Menu|Group|External", objMenuDest[A_Index].FavoriteType, true)
			{
				objSubMenu := Object()
				objSubMenu.MenuPath := lMainMenuName . " " . objMenuDest[A_Index].FavoriteLocation
				objSubMenu.MenuType := objMenuDest[A_Index].FavoriteType
				objMenuDest[A_Index].SubMenu := g_objMenusIndex[objSubMenu.MenuPath] ; re-connect sub menu
			}
	}

	g_objMenusBK := ""
}

; also backup hotkey objects

if (A_ThisLabel = "BackupMenusObjects")
{
	g_objHotkeysByNameLocationBK := Object()
	for strThisNameLocation, strThisHotkey in g_objHotkeysByNameLocation
		g_objHotkeysByNameLocationBK.Insert(strThisNameLocation, strThisHotkey)
}
else
{
	for strThisNameLocation, strThisHotkey in g_objHotkeysByNameLocationBK
		g_objHotkeysByNameLocation.Insert(strThisNameLocation, strThisHotkey)
	g_objHotkeysByNameLocationBK := ""
}

objMenusSource := ""
strMenuPath := ""
objMenuSource := ""
objMenuDest := ""
objFavorite := ""
objSubMenu := ""
strThisLocation := ""
strThisHotkey := ""
intInStr := ""
strParentPath := ""
objParentMenu := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
ExternalMenusRelease:
;------------------------------------------------------------

; dialog box could hang exit ###_V(A_ThisLabel, g_objExternaleMenuToRelease.MaxIndex())
loop, % g_objExternaleMenuToRelease.MaxIndex()
{
	; dialog box could hang ExitApp ###_V(g_objExternaleMenuToRelease[1])
	IniWrite, % "", % g_objExternaleMenuToRelease[1], Global, MenuReservedBy ; no need to update LastModified for this change
	g_objExternaleMenuToRelease.Remove(1)
}

return
;------------------------------------------------------------


;========================================================================================================================
; END OF GUI CLOSE-CANCEL-BK_OBJECTS
;========================================================================================================================


;========================================================================================================================
!_060_POPUP_MENU:
;========================================================================================================================

;------------------------------------------------------------
~LCtrl:: ; use ~ to allow detecting double keypress
~RCtrl:: ; use ~ to allow detecting double keypress
;------------------------------------------------------------

strKeyPressed := A_ThisLabel

if ((strKeyPressed = "~LCtrl") and !(g_blnLeftControlDoublePressed))
	or ((strKeyPressed = "~RCtrl") and !(g_blnRightControlDoublePressed))
	return

if (A_PriorHotKey = strKeyPressed and A_TimeSincePriorHotkey < 400) ; ms maximum delay between Ctrl presses
{
	if CanNavigate(g_arrPopupHotkeys2) ; fake pressing main QAP keyboard trigger (Windows + W or custom)
		Gosub, NavigateHotkeyKeyboard
	else if CanLaunch(g_arrPopupHotkeys2) ; fake pressing main QAP kwyboard trigger (Windows + W or custom)
		Gosub, LaunchHotkeyKeyboard
	; else do nothing
}
StringTrimLeft, strKeyPressed, strKeyPressed, 1
KeyWait, %strKeyPressed%

strKeyPressed := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
NavigateHotkeyMouse:		; g_strTargetWinId set by CanNavigate
NavigateHotkeyKeyboard:		; g_strTargetWinId set by CanNavigate
NavigateFromMsg:			; g_strTargetWinId set by RECEIVE_QAPMESSENGER
LaunchFromMsg:				; g_strTargetWinId set by RECEIVE_QAPMESSENGER
LaunchHotkeyMouse:			; g_strTargetWinId set by CanNavigate
LaunchHotkeyKeyboard:		; g_strTargetWinId set by CanNavigate
LaunchFromTrayIcon:			; g_strTargetWinId set empty (not required)
LaunchFromAlternativeMenu:	; g_strTargetWinId set by AlternativeHotkeyMouse/AlternativeHotkeyKeyboard
;------------------------------------------------------------

; DiagWindowInfo(A_ThisLabel . " Begin")

if SettingsUnsaved()
	if SettingsNotSavedReturn()
		return

if !(g_blnMenuReady) or (g_blnChangeHotkeyInProgress)
	return

if (g_blnGetWinInfo)
{
	gosub, GetWinInfo2Clippoard
	return
}

g_blnAlternativeMenu := (A_ThisLabel = "LaunchFromAlternativeMenu")
g_blnLaunchFromTrayIcon := (A_ThisLabel = "LaunchFromTrayIcon") ; make sure it is initialized true or false

Gosub, SetMenuPosition

if !(g_blnAlternativeMenu)
	g_strAlternativeMenu := "" ; delete from previous call to Alternative key, else keep what was set in OpenAlternativeMenu

if (A_ThisLabel = "LaunchFromTrayIcon")
{
	g_strTargetWinId := "" ; never use target window when launched from the tray icon
	g_strHokeyTypeDetected := "Launch" ; never navigate when launched from the tray icon
}
else if (A_ThisLabel = "LaunchFromAlternativeMenu")
	g_strHokeyTypeDetected := "Alternative"
else if InStr(A_ThisLabel, "FromMsg")
	g_strHokeyTypeDetected := (InStr(A_ThisLabel, "Navigate") ? "Navigate" : "Launch")
else
	g_strHokeyTypeDetected := SubStr(A_ThisLabel, 1, InStr(A_ThisLabel, "Hotkey") - 1) ; "Navigate" or "Launch"

if (WindowIsDirectoryOpus(g_strTargetClass) or WindowIsTotalCommander(g_strTargetClass) or WindowIsQAPconnect(g_strTargetWinId))
	and InStr(A_ThisLabel, "Mouse") and (g_strHokeyTypeDetected = "Navigate")
{
	Click ; to make sure the DOpus lister or TC pane under the mouse become active
	Sleep, 20
}

; ####

; refresh the five dynamic menus before showing the main menu
; in order of estimated avverage time required to refresh
Gosub, RefreshSwitchFolderOrAppMenu ; also refreshes g_menuReopenFolder
Gosub, RefreshClipboardMenu
; Gosub, RefreshRecentFoldersMenu ; displays the wait cursor
; Gosub, RefreshDrivesMenu ; displays the wait cursor

/*
if (g_blnDiagMode)
{
	Diag("Popup menu: Clipboard/Switch",  "`t`t" . g_intClipboardMenuTickCount . "`t" . g_intSwitchReopenMenuTickCount)
	; TrayTip, Clipboard/Switch menus refresh, % g_intClipboardMenuTickCount . " ms + " . g_intSwitchReopenMenuTickCount
	;	. " = " . g_intClipboardMenuTickCount + g_intSwitchReopenMenuTickCount . " ms"
}
*/

Gosub, InsertColumnBreaks

/*
; Tentative solution against "close menu issue" (see http://www.quickaccesspopup.com/what-is-the-close-menu-issue/)
; This cause side effects espcially when QAP runs in compiled mode (scripts hidden window or main GUI being randomly shown inavertandly)

DllCall("SwitchToThisWindow", "UInt", A_ScriptHwnd, "UInt", 1)

DetectHiddenWindows, Off
WinGet, intNbWindows, Count, ahk_id %A_ScriptHwnd%
Diag(A_ThisLabel . " Before WinHide - Nb A_ScriptHwnd", intNbWindows)
WinHide, ahk_id %A_ScriptHwnd%
WinGet, intNbWindows, Count, ahk_id %A_ScriptHwnd%
DetectHiddenWindows, On
Diag(A_ThisLabel . " After WinHide - Nb A_ScriptHwnd", intNbWindows)
DiagWindowInfo(A_ThisLabel . " After SwitchToThisWindow")
*/

Menu, %lMainMenuName%, Show, %g_intMenuPosX%, %g_intMenuPosY% ; at mouse pointer if option 1, 20x20 offset of active window if option 2 and fix location if option 3

; Gosub, SetTimerRefreshDynamicMenus ; after showing the menu THIS COMMAND BREAKS THE SUBMENU QAP ESSENTIALS !!!

return
;------------------------------------------------------------


;------------------------------------------------------------
AlternativeHotkeyMouse:
AlternativeHotkeyKeyboard:
;------------------------------------------------------------

g_blnAlternativeMenu := true
g_strHokeyTypeDetected := "Alternative"

SetTargetWinInfo(A_ThisLabel = "AlternativeHotkeyMouse")
Gosub, SetMenuPosition
Menu, g_menuAlternative, Show, %g_intMenuPosX%, %g_intMenuPosY%

return
;------------------------------------------------------------


;------------------------------------------------------------
SetMenuPosition:
;------------------------------------------------------------

; relative to active window if option g_intPopupMenuPosition = 2
CoordMode, Mouse, % (g_intPopupMenuPosition = 2 ? "Window" : "Screen")
CoordMode, Menu, % (g_intPopupMenuPosition = 2 ? "Window" : "Screen")

if (g_intPopupMenuPosition = 1) ; display menu near mouse pointer location
{
	MouseGetPos, g_intMenuPosX, g_intMenuPosY
	if (g_blnLaunchFromTrayIcon)
	{
		SysGet, intMonitorWorkArea, MonitorWorkArea
		if (g_intMenuPosY > intMonitorWorkAreaBottom - 5)
			g_intMenuPosY := intMonitorWorkAreaBottom - 5
	}
}
else if (g_intPopupMenuPosition = 2) ; display menu at an offset of 20x20 pixel from top-left of active window area
{
	g_intMenuPosX := 20
	g_intMenuPosY := 20
}
else ; (g_intPopupMenuPosition =  3) - fix position - use the g_intMenuPosX and g_intMenuPosY values from the ini file
{
	g_intMenuPosX := g_arrPopupFixPosition1
	g_intMenuPosY := g_arrPopupFixPosition2
}

intMonitorWorkArea := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
CanNavigate(strMouseOrKeyboard) ; SEE HotkeyIfWin.ahk to use Hotkey, If, Expression
; "CabinetWClass" and "ExploreWClass" -> Explorer
; "ProgMan" -> Desktop
; "WorkerW" -> Desktop
; "ConsoleWindowClass" -> Console (CMD)
; "#32770" -> Dialog
; "bosa_sdm_" (...) -> Dialog MS Office under WinXP
;------------------------------------------------------------
{
	global ; sets g_strTargetWinId, g_strTargetControl, g_strTargetClass

	; DiagWindowInfo("CanNavigate Begin")
	; Mouse hotkey (g_arrPopupHotkeys1 is NavigateOrLaunchHotkeyMouse value in ini file)
	SetTargetWinInfo(strMouseOrKeyboard = g_arrPopupHotkeys1)

	; Diag("CanNavigate Begin - strMouseOrKeyboard", strMouseOrKeyboard)
	; Diag("CanNavigate Begin - g_strTargetClass", g_strTargetClass)
	
	blnCanNavigate := WindowIsExplorer(g_strTargetClass) or WindowIsConsole(g_strTargetClass)
		or (g_blnChangeFolderInDialog and WindowIsDialog(g_strTargetClass, g_strTargetWinId) and !DialogBoxParentExcluded(g_strTargetWinId))
		or (g_intActiveFileManager = 2 and WindowIsDirectoryOpus(g_strTargetClass))
		or (g_intActiveFileManager = 3 and WindowIsTotalCommander(g_strTargetClass))
		or (g_intActiveFileManager = 4 and WindowIsQAPconnect(g_strTargetWinId))
		or WindowIsQuickAccessPopup(g_strTargetClass)

	; check if we will show the "change folder alert" before opening the selected favorite, if the favorite is a folder
	if (!g_blnChangeFolderInDialog and WindowIsDialog(g_strTargetClass, g_strTargetWinId))
	{
		IniRead, blnChangeFolderInDialogAlertRead, %g_strIniFile%, Global, ChangeFolderInDialogAlertRead, 0
		g_blnShowChangeFolderInDialogAlert := !(blnChangeFolderInDialogAlertRead)
	}
	else
		g_blnShowChangeFolderInDialogAlert := false
	
	; DiagWindowInfo("CanNavigate End")
	; Diag("CanNavigate End - blnCanNavigate", blnCanNavigate)
	
	return blnCanNavigate
}
;------------------------------------------------------------


;------------------------------------------------------------
CanLaunch(strMouseOrKeyboard) ; SEE HotkeyIfWin.ahk to use Hotkey, If, Expression
;------------------------------------------------------------
{
	global

	; DiagWindowInfo("CanLaunch")
	; Diag("CanLaunch Begin - g_strTargetClass", g_strTargetClass)

	if (strMouseOrKeyboard = g_arrPopupHotkeys1) ; if hotkey is mouse
		Loop, Parse, g_strExclusionMouseListApp, |
			if StrLen(A_Loopfield) and (InStr(g_strTargetClass, A_LoopField) or InStr(g_strTargetWinTitle, A_LoopField))
				return false

	; Diag("CanLaunch End1 - g_blnClickOnTrayIcon / g_blnOpenMenuOnTaskbar", g_blnClickOnTrayIcon . " / " . g_blnOpenMenuOnTaskbar)
	; Diag("CanLaunch End2 - WindowIsTray(g_strTargetClass)", WindowIsTray(g_strTargetClass))
	
	if WindowIsTray(g_strTargetClass)
		return g_blnOpenMenuOnTaskbar

	; Diag("CanLaunch End3 - WindowIsTreeview(g_strTargetWinId)", WindowIsTreeview(g_strTargetWinId))
	if WindowIsTreeview(g_strTargetWinId)
		return false
	
	if WindowIsDialog(g_strTargetClass, g_strTargetWinId) and DialogBoxParentExcluded(g_strTargetWinId)
		return false
	
	; else we can launch

	return true
}
;------------------------------------------------------------


;------------------------------------------------------------
DialogBoxParentExcluded(strTargetWinId)
;------------------------------------------------------------
{
	global g_strExclusionMouseListDialog
	
	; get specified window's parent ID
	; from SKAN https://autohotkey.com/board/topic/27295-getting-id-or-class-for-parent-window/#entry175515
	strParentTargetWinId := DllCall("GetParent", UInt,strTargetWinId)
	strParentTargetWinId := (!strParentTargetWinId ? strTargetWinId : strParentTargetWinId)
	
	; get parent window's class and title
	WinGetClass, strParentClass, ahk_id %strParentTargetWinId%
	WinGetTitle, strParentTitle, ahk_id %strParentTargetWinId%

	; check for class or title in dialog's parent exclusion list
	Loop, Parse, g_strExclusionMouseListDialog, |
		if StrLen(A_Loopfield) and (InStr(strParentClass, A_LoopField) or InStr(strParentTitle, A_LoopField))
			return true

	return false
}
;------------------------------------------------------------



;========================================================================================================================
; END OF POPUP MENU
;========================================================================================================================



;========================================================================================================================
!_065_CLASS:
return
;========================================================================================================================

;------------------------------------------------------------
WindowIsExplorer(strClass)
;------------------------------------------------------------
{
	return (strClass = "CabinetWClass") or (strClass = "ExploreWClass")
}
;------------------------------------------------------------


;------------------------------------------------------------
WindowIsDesktop(strClass)
;------------------------------------------------------------
{
	; global g_blnOpenMenuOnTaskbar
	; global g_blnClickOnTrayIcon
	
	; blnWindowIsDesktop := (strClass = "ProgMan")
	;	or (strClass = "WorkerW")
	;	or (strClass = "Shell_TrayWnd" and (g_blnOpenMenuOnTaskbar or g_blnClickOnTrayIcon))
	;	or (strClass = "NotifyIconOverflowWindow")
	; ###_V("WindowIsDesktop", strClass, g_blnOpenMenuOnTaskbar, g_blnClickOnTrayIcon, blnWindowIsDesktop)

	; g_blnClickOnTrayIcon := false
	; g_blnClickOnTrayIcon was turned on by AHK_NOTIFYICON
	; turn it off to avoid further clicks on taskbar to be accepted if g_blnOpenMenuOnTaskbar is off

	return (strClass = "ProgMan") or (strClass = "WorkerW")
}
;------------------------------------------------------------


;------------------------------------------------------------
WindowIsTray(strClass)
;------------------------------------------------------------
{
	return (strClass = "Shell_TrayWnd") or (strClass = "NotifyIconOverflowWindow")
}
;------------------------------------------------------------


;------------------------------------------------------------
WindowIsConsole(strClass)
;------------------------------------------------------------
{
	return (strClass = "ConsoleWindowClass")
}
;------------------------------------------------------------


;------------------------------------------------------------
WindowIsDialog(strClass, strWinId)
;------------------------------------------------------------
{
	return (strClass = "#32770") and !WindowIsTreeview(strWinId)
	
	; or InStr(strClass, "bosa_sdm_")
	; Removed 2014-09-27  (see http://code.jeanlalonde.ca/folderspopupv3archives/#comment-7912)
}
;------------------------------------------------------------


;------------------------------------------------------------
WindowIsTreeview(strWinId)
; Disable popup menu in folder select dialog boxes (like those displayed by FileSelectFolder)
; because their Edit1 control does not react as expected in NavigateDialog.
; Signature: contains both SysTreeView321 and SHBrowseForFolder controls (tested on Win7 only)
; but NOT 100% sure this is a unique signature...
;------------------------------------------------------------
{
	global g_strAppNameText
	
	WinGet, strControlsList, ControlList, ahk_id %strWinId%
	blnIsTreeView := InStr(strControlsList, "SysTreeView321") and InStr(strControlsList, "SHBrowseForFolder")
	if (blnIsTreeView)
	{
		TrayTip, %lWindowIsTreeviewTitle%, %lWindowIsTreeviewText%, , 18 ; 2 warning icon + 16 no sound
		Sleep, 20 ; tip from Lexikos for Windows 10 "Just sleep for any amount of time after each call to TrayTip" (http://ahkscript.org/boards/viewtopic.php?p=50389&sid=29b33964c05f6a937794f88b6ac924c0#p50389)
	}
	
	return blnIsTreeView
}
;------------------------------------------------------------


;------------------------------------------------------------
WindowIsDirectoryOpus(strClass)
;------------------------------------------------------------
{
	return InStr(strClass, "dopus")
}
;------------------------------------------------------------


;------------------------------------------------------------
WindowIsTotalCommander(strClass)
;------------------------------------------------------------
{
	return InStr(strClass, "TTOTAL_CMD")
}
;------------------------------------------------------------


;------------------------------------------------------------
WindowIsQAPconnect(strWinId)
;------------------------------------------------------------
{
	global g_strQAPconnectAppFilename
	global g_strQAPconnectCompanionFilename

	if (strWinId = 0)
		return false

	; get path and filename of the app controling window strWinId
	; first get process ID
    intPID := 0
    DllCall("GetWindowThreadProcessId", "UInt", strWinId, "UInt *", intPID)
	; get filename of process
    hProcess := DllCall("OpenProcess", "UInt", 0x400 | 0x10, "Int", False, "UInt", intPID)
    intPathLength = 260*2
    VarSetCapacity(strFCAppFile, intPathLength, 0)
    DllCall("Psapi.dll\GetModuleFileNameExW", "UInt", hProcess, "Int", 0, "Str", strFCAppFile, "UInt", intPathLength)
    DllCall("CloseHandle", "UInt", hProcess)
	
	; get filename only and compare with QAPconnect filename or QAPconnect target filename (see QAPconnect doc)
	SplitPath, strFCAppFile, strFCAppFile
	return (strFCAppFile = g_strQAPconnectAppFilename) or (strFCAppFile = g_strQAPconnectCompanionFilename)
}
;------------------------------------------------------------


;------------------------------------------------------------
WindowIsQuickAccessPopup(strClass)
; enabled only when compiled
;------------------------------------------------------------
{
	return (strClass = "JeanLalonde.ca")
}
;------------------------------------------------------------


;========================================================================================================================
; END OF CLASS
;========================================================================================================================



;========================================================================================================================
!_070_MENU_ACTIONS:
;========================================================================================================================

;------------------------------------------------------------
OpenAlternativeMenu:
; remember the Alternative menu item to execute and open the popup menu to choose on what favorite execute this action
;------------------------------------------------------------

g_strAlternativeMenu := A_ThisMenuItem
if (g_blnDisplayNumericShortcuts)
	StringTrimLeft, g_strAlternativeMenu, g_strAlternativeMenu, 3 ; remove "&1 " from menu item
if (g_intHotkeyReminders > 1) and InStr(g_strAlternativeMenu, " (")
	g_strAlternativeMenu := SubStr(g_strAlternativeMenu, 1, InStr(g_strAlternativeMenu, " (", -1) - 1) ; and remove hotkey reminder

gosub, OpenAlternativeMenuTrayTip
gosub, LaunchFromAlternativeMenu

return
;------------------------------------------------------------


;------------------------------------------------------------
OpenAlternativeMenuHotkey:
;------------------------------------------------------------

if (g_blnChangeHotkeyInProgress)
	return

; search Alternative menu code in g_objQAPFeatures to set g_strAlternativeMenu with localized name and gosub LaunchFromAlternativeMenu
g_strAlternativeMenu := ""
for intOrder, strCode in g_objQAPFeaturesAlternativeCodeByOrder
	if (g_objQAPFeatures[strCode].CurrentHotkey = A_ThisHotkey)
	{
		g_strAlternativeMenu := g_objQAPFeatures[strCode].LocalizedName
		break
	}

if StrLen(g_strAlternativeMenu)
{
	gosub, OpenAlternativeMenuTrayTip
	gosub, LaunchFromAlternativeMenu
}
else
	Oops("QAP feature could not be found...")

OpenAlternativeMenuHotkeyCleanup:
intOrder := ""
strCode := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
OpenAlternativeMenuTrayTip:
;------------------------------------------------------------

if (g_strAlternativeMenu = lMenuCopyLocation)
	strMessage := lAlternativeMenuTrayTipCopyLocation
else if (g_strAlternativeMenu = lMenuAlternativeNewWindow)
	strMessage := lAlternativeMenuTrayTipNewWindow
else if (g_strAlternativeMenu = lMenuAlternativeEditFavorite)
	strMessage := lAlternativeMenuTrayTipEditFavorite
else if (g_strAlternativeMenu = lMenuAlternativeRunAs)
	strMessage := lAlternativeMenuTrayTipRunAs
else if (g_strAlternativeMenu = lMenuAlternativeOpenContainingCurrent) or (g_strAlternativeMenu = lMenuAlternativeOpenContainingNew)
	strMessage := lAlternativeMenuTrayTipOpenContaining
else
	strMessage := ""

TrayTip, %g_strAppNameText%, %strMessage%, , 17 ; 1 info icon + 16 no sound
Sleep, 20 ; tip from Lexikos for Windows 10 "Just sleep for any amount of time after each call to TrayTip" (http://ahkscript.org/boards/viewtopic.php?p=50389&sid=29b33964c05f6a937794f88b6ac924c0#p50389)

strMessage := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
OpenGroupOfFavorites:
;------------------------------------------------------------

objThisGroupFavorite := g_objThisFavorite

; g_arrGroupSettingsOpen1: boolean value (replace existing Explorer windows if true, add to existing Explorer Windows if false)
; g_arrGroupSettingsOpen2: restore folders with "Explorer" or "Other" (Directory Opus, Total Commander or QAPconnect)
; g_arrGroupSettingsOpen3: delay in milliseconds to insert between each favorite to restore (in addition to default 200 ms)
strGroupSettings := objThisGroupFavorite.FavoriteGroupSettings
StringSplit, g_arrGroupSettingsOpen, strGroupSettings, `,
g_blnGroupReplaceWindows := g_arrGroupSettingsOpen1

if (g_blnGroupReplaceWindows)
	gosub, OpenGroupOfFavoritesCloseExplorers
	
objThisGroupFavoritesList := g_objMenusIndex[lMainMenuName . " " . objThisGroupFavorite.FavoriteLocation]

loop, % objThisGroupFavoritesList.MaxIndex() - 1 ; skip first item backlink
{
	g_objThisFavorite := objThisGroupFavoritesList[A_Index + 1] ; skip first item backlink
	
	Sleep, % g_arrGroupSettingsOpen3 + 200 ; add 200 ms as minimal default delay
	
	g_blnFirstItemOfGroup := (A_Index = 1)

	if !(g_objThisFavorite.FavoriteDisabled)
		gosub, OpenFavoriteFromGroup
}

OpenGroupOfFavoritesCleanup:
objThisGroupFavorite := ""
objThisGroupFavoritesList := ""
strGroupSettings := ""
g_arrGroupSettingsOpen := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
OpenGroupOfFavoritesCloseExplorers:
;------------------------------------------------------------

intSleepTime := 67 ; for visual effect only...
Tooltip, %lGuiGroupClosing%

if (g_arrGroupSettingsOpen2 = "Other")
{
	if (g_intActiveFileManager = 2)
	{
		WinGet, arrIDs, List, ahk_class dopus.lister
		Loop, %arrIDs%
		{
			WinClose, % "ahk_id " . arrIDs%A_Index%
			Sleep, %intSleepTime%
		}
	}
	else if (g_intActiveFileManager = 3)
	{
		WinGet, arrIDs, List, ahk_class TTOTAL_CMD
		Loop, %arrIDs%
		{
			WinClose, % "ahk_id " . arrIDs%A_Index%
			Sleep, %intSleepTime%
		}
	}
}
else ; g_arrGroupSettingsOpen2 = "Windows Explorer" or ""
{
	strWindowsId := ""
	for objExplorer in ComObjCreate("Shell.Application").Windows
	{
		; do not close in this loop as it mess up the handlers
		strType := ""
		try strType := objExplorer.Type ; Gets the type name of the contained document object. "Document HTML" for IE windows. Should be empty for file Explorer windows.
		strWindowID := ""
		try strWindowID := objExplorer.HWND ; Try to get the handle of the window. Some ghost Explorer in the ComObjCreate may return an empty handle
		if !StrLen(strType) and StrLen(strWindowID) ; strType must be empty and strWindowID must not be empty
			strWindowsId .= objExplorer.HWND . "|"
	}
	StringTrimRight, strWindowsId, strWindowsId, 1 ; remove last | separator
	Loop, Parse, strWindowsId, |
	{
		WinClose, ahk_id %A_LoopField%
		Sleep, %intSleepTime%
	}
}

Tooltip ; clear tooltip

intSleepTime := ""
strWindowsId := ""
objExplorer := ""
arrIDs := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
OpenSwitchFolderOrApp:
;------------------------------------------------------------

strThisMenuItem :=  A_ThisMenuItem
strWindowId := g_objSwitchWindowIdsByName[strThisMenuItem]
StringSplit, arrFolderWindowId, strWindowId, |

if (g_blnDisplayNumericShortcuts)
	StringTrimLeft, strThisMenuItem, strThisMenuItem, 3 ; remove "&1 " from menu item

if (arrFolderWindowId1 = "EX") ; Explorer
	WinActivate, % "ahk_id " . arrFolderWindowId2
else if (arrFolderWindowId1 = "DO") ; Directory Opus
	; double % for DOpusRT (http://resource.dopus.com/viewtopic.php?f=3&t=23013#p124395)
	; StringReplace, strThisMenuItem, strThisMenuItem, % "%", % "%%", A
	; remove because does not seem to be required anymore?
	RunDOpusRt("/acmd Go ", strThisMenuItem, " EXISTINGLISTER") ; activate an existing lister listing this path
else ; APP
	WinActivate, % "ahk_id " . arrFolderWindowId2

return
;------------------------------------------------------------


;------------------------------------------------------------
OpenFavorite:
OpenFavoriteGroup:
OpenFavoriteFromGroup:
OpenFavoriteFromHotkey:
OpenRecentFolder:
OpenReopenFolder:
OpenClipboard:
OpenDrives:
OpenFavoriteHotlist:
OpenReopenCurrentFolder:
;------------------------------------------------------------

if (g_blnChangeHotkeyInProgress)
 	return

g_strOpenFavoriteLabel := A_ThisLabel
g_strNewWindowId := "" ; start fresh for any new favorite to open

; avoid conflict with hotkeys and avoid editing menu items not in favorites list
if InStr("OpenFavorite|OpenFavoriteGroup", g_strOpenFavoriteLabel)
{
	blnShiftPressed := GetKeyState("Shift")
	blnControlPressed := GetKeyState("Control")
}
else
{
	blnShiftPressed := false
	blnControlPressed := false
}

if (g_strOpenFavoriteLabel = "OpenFavoriteFromHotkey")
{
	if SettingsUnsaved()
		if SettingsNotSavedReturn()
			return

	g_strTargetWinId := "" ; forget value from previous open favorite
	Gosub, InsertColumnBreaks
}

/*
Counterpart of the SwitchToThisWindow command trying to fight against the "close menu issue" (see commented code with "SwitchToThisWindow" above)

DiagWindowInfo(A_ThisLabel . " Before WinActivate")
if StrLen(g_strTargetWinId)
	and (g_strTargetWinId <> A_ScriptHwnd)
	and (g_strTargetWinId <> g_strAppHwnd)
	WinActivate, ahk_id %g_strTargetWinId%
DiagWindowInfo(A_ThisLabel . " After WinActivate")
*/

; if (g_blnDiagMode)
;	Diag("OpenFavoriteHotlist", "---------")

if (A_ThisLabel = "OpenFavoriteFromGroup") ; object already set by OpenGroupOfFavorites
{
	g_strTargetWinId := "" ; never use target window when launched in a group
	g_strHokeyTypeDetected := "Launch" ; all favorites in group are for Launch, never navigate
}
else
	gosub, OpenFavoriteGetFavoriteObject ; define g_objThisFavorite

/*
if (g_blnDiagMode)
{
	Diag("g_objThisFavorite.FavoriteName", g_objThisFavorite.FavoriteName)
	Diag("g_objThisFavorite.FavoriteLocation", g_objThisFavorite.FavoriteLocation)
}
*/

if !IsObject(g_objThisFavorite) ; OpenFavoriteGetFavoriteObject was aborted
	or (g_objThisFavorite.FavoriteType = "Folder") and !StrLen(g_objThisFavorite.FavoriteLocation) ; no current location found
{
	gosub, OpenFavoriteCleanup
	return
}
; Diag(A_ThisLabel . ":g_objThisFavorite.FavoriteName", g_objThisFavorite.FavoriteName)

; before opening the favorite, check if we show the "change folder alert" before opening the selected favorite, if the favorite is a folder or special
if (g_blnShowChangeFolderInDialogAlert and InStr("Folder|Special", g_objThisFavorite.FavoriteType))
{
	MsgBox, 52, %g_strAppNameText%, %lOopsChangeFolderInDialogAlert%
	IfMsgBox, Yes
	{
		gosub, GuiOptions
		return
	}
	IfMsgBox, No
		IniWrite, 1, %g_strIniFile%, Global, ChangeFolderInDialogAlertRead
}

; process Alternative features keyboard modifiers
if (blnShiftPressed or blnControlPressed)
{
	g_blnAlternativeMenu := true
	g_strHokeyTypeDetected := "Alternative"
	
	if (blnShiftPressed and blnControlPressed) ; as if user selected lMenuAlternativeEditFavorite in Alternative menu
		g_strAlternativeMenu := lMenuAlternativeEditFavorite
	else if (blnShiftPressed) ; as if user selected lMenuAlternativeNewWindow in Alternative menu
		g_strAlternativeMenu := lMenuAlternativeNewWindow
	else ; blnControlPressed as if user selected lMenuCopyLocation in Alternative menu
		g_strAlternativeMenu := lMenuCopyLocation
}
; ###_V(A_ThisLabel, g_strHokeyTypeDetected, g_strAlternativeMenu, g_blnAlternativeMenu)

if (g_objThisFavorite.FavoriteType = "Group") and !(g_blnAlternativeMenu)
{
	gosub, OpenGroupOfFavorites
	
	gosub, OpenFavoriteCleanup
	return
}

if (g_objThisFavorite.FavoriteType = "Snippet")
	and (!g_blnAlternativeMenu or (g_strAlternativeMenu = lMenuAlternativeNewWindow))
{
	gosub, PasteSnippet
	gosub, OpenFavoriteCleanup
	return
}

strTempLocation := g_objThisFavorite.FavoriteLocation ; to avoid modification by ByRef in FileExistInPath

if InStr("Folder|Document|Application", g_objThisFavorite.FavoriteType) ; for these favorites, file/folder must exist
	and (g_strAlternativeMenu <> lMenuAlternativeEditFavorite) ; except if we edit the favorite
	and !LocationIsHTTP(g_objThisFavorite.FavoriteLocation) ; except if the folder location is on a server (WebDAV)
	and !(SubStr(g_objThisFavorite.FavoriteLocation, 1, 3) = "\\\" and A_ThisLabel = "OpenFavoriteHotlist")
		; except if the location is a TC Hotlist folder managed by a file system plugin (like VirtualPanel)
{	
	if InStr(strTempLocation, "{CUR_")
		strTempLocation := ExpandPlaceholders(strTempLocation, strTempLocation
			, GetCurrentLocation(g_strTargetClass, g_strTargetWinId)) ; let user enter double-quotes as required by his arguments
	
	if !FileExistInPath(strTempLocation) ; return strTempLocation with expanded relative path and envvars, also search in PATH
		and (g_strAlternativeMenu <> lMenuAlternativeEditFavorite)
	{
		Gui, 1:+OwnDialogs
		MsgBox, 4, % L(lDialogFavoriteDoesNotExistTitle, g_strAppNameText)
			, % L(lDialogFavoriteDoesNotExistPrompt, g_objThisFavorite.FavoriteLocation
				, (StrLen(strTempLocation) and strTempLocation <> g_objThisFavorite.FavoriteLocation ? " (" . strTempLocation . ")" : "")) . "`n`n" . lDialogFavoriteDoesNotExistEdit
		IfMsgBox, Yes
		{
			g_blnAlternativeMenu := true
			g_strAlternativeMenu := lMenuAlternativeEditFavorite
		}
		else
		{
			gosub, OpenFavoriteCleanup
			return
		}
	}
}

; preparation for Alternative menu features before setting the full location
if (g_blnAlternativeMenu) and (g_strAlternativeMenu = lMenuAlternativeNewWindow)
{
	g_strTargetWinId := "" ; never use target window when launched from alternative menu with new window
	g_strHokeyTypeDetected := "Launch"
}

if (g_objThisFavorite.FavoriteType = "Application") and StrLen(g_objThisFavorite.FavoriteAppWorkingDir)
{
	if (g_objThisFavorite.FavoriteAppWorkingDir = "{CUR_LOC}")
		strTempLocation := GetCurrentLocation(g_strTargetClass, g_strTargetWinId)
	else
		strTempLocation := g_objThisFavorite.FavoriteAppWorkingDir
	if !FileExistInPath(strTempLocation) ; return strTempLocation with expanded relative path and envvars, also search in PATH
		and (g_strAlternativeMenu <> lMenuAlternativeEditFavorite)
	{
		Gui, 1:+OwnDialogs
		MsgBox, 4, % L(lDialogFavoriteWorkingDirNotFoundTitle, g_strAppNameText)
			, % L(lDialogFavoriteWorkingDirNotFoundPrompt, g_objThisFavorite.FavoriteName, strTempLocation) . "`n`n" . lDialogFavoriteDoesNotExistEdit
		IfMsgBox, Yes
		{
			g_blnAlternativeMenu := true
			g_strAlternativeMenu := lMenuAlternativeEditFavorite
		}
		else
		{
			gosub, OpenFavoriteCleanup
			return
		}
	}

}

if (g_blnAlternativeMenu) and (g_strAlternativeMenu = lMenuAlternativeOpenContainingCurrent or g_strAlternativeMenu = lMenuAlternativeOpenContainingNew)
{
	if InStr("Folder|Document|Application", g_objThisFavorite.FavoriteType)
	{
		objContainingFavorite := Object() ; build a replacement favorite object
		objContainingFavorite.FavoriteType := "Folder"
		objContainingFavorite.FavoriteName := "Containing Folder" ; not shown
		strContainingFolder := g_objThisFavorite.FavoriteLocation
		SplitPath, strContainingFolder, , strContainingFolder
		objContainingFavorite.FavoriteLocation := strContainingFolder . "\"
		g_objThisFavorite := objContainingFavorite ; replace the current favorite object

		if (g_strAlternativeMenu = lMenuAlternativeOpenContainingCurrent) and CanNavigate(A_ThisHotkey)
			g_strHokeyTypeDetected := "Navigate"
		else
			g_strHokeyTypeDetected := "Launch"
	}
	else
	{
		gosub, OpenFavoriteCleanup
		return
	}
}

gosub, SetTargetName ; sets g_strTargetAppName, can change g_strHokeyTypeDetected to "Launch"
; Diag(A_ThisLabel . ":g_strTargetAppName", g_strTargetAppName)
; if (g_blnDiagMode)
;	Diag("g_strTargetAppName", g_strTargetAppName)

gosub, OpenFavoriteGetFullLocation ; sets g_strFullLocation
; Diag(A_ThisLabel . ":g_strFullLocation", g_strFullLocation)
; if (g_strOpenFavoriteLabel = "OpenFavoriteHotlist")
;	Diag("g_strFullLocation", g_strFullLocation)

if !StrLen(g_strFullLocation) ; OpenFavoriteGetFullLocation was aborted
{
	gosub, OpenFavoriteCleanup
	return
}

if (g_objThisFavorite.FavoriteType = "Application") and (g_objThisFavorite.FavoriteLaunchWith = 1) ; 1 activate existing if running
	and AppIsRunning(g_strFullLocation, strAppID) ; g_strFullLocation includes optional parameter
{
	; If an app is installed in more one location, it will be activated only if the one running is from the same location as the favorite.
	; If the favorite has "Parameters" in "Advanced Settings", it will be launched anyway, regardless of an existing running instance.
	; If the favorite has "Start in" option or "Window Options", they will be ignored if we activate the existing instance of the app.
	
	; WinShow, ahk_id %strAppID% ; not required because WinGet in AppIsRunning lists only non-hidden windows
	WinActivate, ahk_id %strAppID%
	
	gosub, OpenFavoriteCleanup
	return
}

; Boolean,MinMax,Left,Top,Width,Height,Delay,RestoreSide (comma delimited) (7)
; 0 for use default / 1 for remember, -1 Minimized / 0 Normal / 1 Maximized, Left (X), Top (Y), Width, Height, Delay (default 200 ms), L Left / R Right; for example: "1,0,100,50,640,480,200" or "0,,,,,,,L"
strFavoriteWindowPosition := g_objThisFavorite.FavoriteWindowPosition . ",,,,,,,,,," ; additional "," to avoid ghost values if FavoriteWindowPosition is empty
; Diag("strFavoriteWindowPosition", strFavoriteWindowPosition)
StringSplit, g_arrFavoriteWindowPosition, strFavoriteWindowPosition, `,

; Diag(A_ThisLabel . " After WinActivate - Location", g_strHokeyTypeDetected . "`t" . g_strFullLocation)

; === ACTIONS ===

; --- Alternative Menu actions ---

if (g_blnAlternativeMenu)
{
	; ###_V(A_ThisLabel, "*g_strFullLocation", g_strFullLocation
		; , "*g_objMenusIndex[A_ThisMenu].MenuPath", g_objMenusIndex[A_ThisMenu].MenuPath
		; , "*g_intOriginalMenuPosition", g_intOriginalMenuPosition
		; , "*GetFavoriteObjectFromMenuPosition(g_intOriginalMenuPosition)", GetFavoriteObjectFromMenuPosition(g_intOriginalMenuPosition).FavoriteName
		; , "")
	if (g_strAlternativeMenu = lMenuAlternativeEditFavorite)
	{
		; we get here via Alternative menu, Edit a favorite or with Ctrl+Shift+click on a favorite
		
		if (g_objMenusIndex[A_ThisMenu].IsLiveMenu)
		{
			; trying to edit items inside live folder leads to edit the parent live folder favorite
			; no need to consider column breaks, disabled items and back link because already taken into account in .LiveMenuParentPosition
			g_intOriginalMenuPosition := g_objMenusIndex[A_ThisMenu].LiveMenuParentPosition
			g_objEditedFavorite := g_objMenusIndex[g_objMenusIndex[A_ThisMenu].LiveMenuParentPath][g_intOriginalMenuPosition]
			g_objMenuInGui := g_objMenusIndex[g_objMenusIndex[A_ThisMenu].LiveMenuParentPath]
		}
		else
		{
			g_objMenuInGui := g_objMenusIndex[A_ThisMenu]
			g_objEditedFavorite := GetFavoriteObjectFromMenuPosition(g_intOriginalMenuPosition) ; returns the object and ByRef g_intOriginalMenuPosition
		}
		gosub, GuiShowFromAlternative
		gosub, GuiEditFavoriteFromAlternative
		gosub, OpenFavoriteCleanup
		
		return
	}
	
	if (g_strAlternativeMenu = lMenuCopyLocation) ; EnvVars expanded
	{
		if !InStr("Group|QAP", g_objThisFavorite.FavoriteType) ; for these types, there is no path to copy
		{
			Clipboard := g_strFullLocation
			TrayTip, %g_strAppNameText%, %lCopyLocationCopiedToClipboard%, , 17 ; 1 info icon + 16 no sound
			Sleep, 20 ; tip from Lexikos for Windows 10 "Just sleep for any amount of time after each call to TrayTip" (http://ahkscript.org/boards/viewtopic.php?p=50389&sid=29b33964c05f6a937794f88b6ac924c0#p50389)
		}		
		gosub, OpenFavoriteCleanup
		return
	}
	
	if (g_strAlternativeMenu = lMenuAlternativeNewWindow) and (g_objThisFavorite.FavoriteType = "Group")
	; cannot open group in new window
	{
		gosub, OpenFavoriteCleanup
		return
	}
}

; --- Document or Link ---
; --- Launch with ---

if InStr("Document|URL", g_objThisFavorite.FavoriteType)
	or (StrLen(g_objThisFavorite.FavoriteLaunchWith) and !InStr("Application|Snippet", g_objThisFavorite.FavoriteType))
{
	Run, %g_strFullLocation%, , UseErrorLevel, intPid
	if (ErrorLevel = "ERROR")
		Oops(lOopsUnknownTargetAppName)
	else
		; intPid may not be set for some doc types; could help if document is launch with a FavoriteLaunchWith
		if (intPid)
		{
			g_strNewWindowId := "ahk_pid " . intPid
			gosub, OpenFavoriteWindowResize
		}

	gosub, OpenFavoriteCleanup
	return
}

; --- Menu type ---

if InStr("Menu|External", g_objThisFavorite.FavoriteType, true)
{
	Gosub, SetMenuPosition
	Menu, %lMainMenuName% %g_strFullLocation%, Show, %g_intMenuPosX%, %g_intMenuPosY%

	gosub, OpenFavoriteCleanup
	return
}

; --- Application ---

if (g_objThisFavorite.FavoriteType = "Application")
{
	if (g_objThisFavorite.FavoriteAppWorkingDir = "{CUR_LOC}")
		strCurrentAppWorkingDir := GetCurrentLocation(g_strTargetClass, g_strTargetWinId)
	else
		strCurrentAppWorkingDir := g_objThisFavorite.FavoriteAppWorkingDir
	; since 1.0.95.00, Run supports verbs with parameters, such as Run *RunAs %A_ScriptFullPath% /Param.
	; see RunAs doc remarks
	Run, % (g_objThisFavorite.FavoriteElevate or g_strAlternativeMenu = lMenuAlternativeRunAs ? "*RunAs " : "") . g_strFullLocation, %strCurrentAppWorkingDir%, UseErrorLevel, intPid
	if (ErrorLevel = "ERROR")
	{
		if (A_LastError <> 1223)
			Oops(lOopsUnknownTargetAppName)
		; else no error message - error 1223 because user canceled on the Run as admnistrator prompt
	}
	else
		; intPid may not be set for some doc types; could help if document is launch with a FavoriteLaunchWith
		if (intPid)
		{
			g_strNewWindowId := "ahk_pid " . intPid
			gosub, OpenFavoriteWindowResize
		}

	gosub, OpenFavoriteCleanup
	return
}

; --- QAP Command ---

if InStr("OpenFavorite|OpenFavoriteFromHotkey|OpenFavoriteFromGroup", g_strOpenFavoriteLabel) and (g_objThisFavorite.FavoriteType = "QAP") and StrLen(g_objQAPFeatures[g_objThisFavorite.FavoriteLocation].QAPFeatureCommand)
{
	Gosub, % g_objQAPFeatures[g_objThisFavorite.FavoriteLocation].QAPFeatureCommand
	gosub, OpenFavoriteCleanup
	return
}

; --- Navigate Folder ---

if (InStr("Folder|FTP", g_objThisFavorite.FavoriteType) and g_strHokeyTypeDetected = "Navigate")
{
	gosub, OpenFavoriteNavigate%g_strTargetAppName%
	gosub, OpenFavoriteCleanup
	return
}

; --- Navigate Special Folder ---

if (g_objThisFavorite.FavoriteType = "Special") and (g_strHokeyTypeDetected = "Navigate")
{
	gosub, OpenFavoriteNavigate%g_strTargetAppName%
	gosub, OpenFavoriteCleanup
	return
}

; --- New window ---

if (g_strHokeyTypeDetected = "Launch")
	or !StrLen(g_strTargetClass) or (g_strTargetWinId = 0) ; for situations where the target window could not be detected
{
	gosub, OpenFavoriteInNewWindow%g_strTargetAppName%
	; if (g_arrFavoriteWindowPosition1)
	;	Diag(A_ThisLabel . " after OpenFavoriteInNewWindow - g_strNewWindowId", g_strNewWindowId)
	gosub, OpenFavoriteWindowResize
}

OpenFavoriteCleanup:
g_objThisFavorite := ""
strFavoriteWindowPosition := ""
g_arrFavoriteWindowPosition := ""
g_blnAlternativeMenu := ""
g_strAlternativeMenu := ""
strTempLocation := ""
blnShiftPressed := ""
blnControlPressed := ""
strCurrentAppWorkingDir := ""
objContainingFavorite := ""
strContainingFolder := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
SetTargetName:
;------------------------------------------------------------

if WindowIsExplorer(g_strTargetClass)
	g_strTargetAppName := "Explorer"
else if WindowIsDesktop(g_strTargetClass)
	g_strTargetAppName := "Desktop"
; else if WindowIsTray(g_strTargetClass)
;	g_strTargetAppName := "Tray"
else if WindowIsConsole(g_strTargetClass)
	g_strTargetAppName := "Console"
else if WindowIsDialog(g_strTargetClass, g_strTargetWinId)
	g_strTargetAppName := "Dialog"
; else if WindowIsTreeview(g_strTargetWinId)
;	g_strTargetAppName := "Treeview"
else if WindowIsDirectoryOpus(g_strTargetClass) and (g_intActiveFileManager = 2)
	g_strTargetAppName := "DirectoryOpus"
else if WindowIsTotalCommander(g_strTargetClass) and (g_intActiveFileManager = 3)
	g_strTargetAppName := "TotalCommander"
else if WindowIsQAPconnect(g_strTargetWinId) and (g_intActiveFileManager = 4)
	g_strTargetAppName := "QAPconnect"
else if WindowIsQuickAccessPopup(g_strTargetClass)
{
	if (g_intActiveFileManager = 2)
		g_strTargetAppName := "DirectoryOpus"
	else if (g_intActiveFileManager = 3)
		g_strTargetAppName := "TotalCommander"
	else if (g_intActiveFileManager = 4)
		g_strTargetAppName := "QAPconnect"
	else
		g_strTargetAppName := "Explorer"
	g_strHokeyTypeDetected := "Launch"
}
else
	g_strTargetAppName := "Unknown"

if (g_strTargetAppName = "Desktop")
{
	g_strTargetWinId := "" ; never use target window when clicked on the desktop
	g_strHokeyTypeDetected := "Launch" ; never navigate when clicked on the desktop
}

if (g_strHokeyTypeDetected = "Launch")
	if (g_strOpenFavoriteLabel = "OpenFavoriteFromGroup" and g_arrGroupSettingsOpen2 = "Windows Explorer")
		g_strTargetAppName := "Explorer"
	else if InStr("Desktop|Dialog|Console|Unknown", g_strTargetAppName) ; these targets cannot launch in a new window
		or (g_intActiveFileManager > 1) ; use file managers DirectoryOpus, TotalCommander or QAPconnect
		if (g_intActiveFileManager = 2)
			g_strTargetAppName := "DirectoryOpus"
		else if (g_intActiveFileManager = 3)
			g_strTargetAppName := "TotalCommander"
		else if (g_intActiveFileManager = 4)
			g_strTargetAppName := "QAPconnect"
		else
			g_strTargetAppName := "Explorer"

return
;------------------------------------------------------------


;------------------------------------------------------------
OpenFavoriteGetFavoriteObject:
;------------------------------------------------------------

if (g_blnDisplayNumericShortcuts)
	StringTrimLeft, strThisMenuItem, A_ThisMenuItem, 3 ; remove "&1 " from menu item
else
	strThisMenuItem :=  A_ThisMenuItem

if (g_strOpenFavoriteLabel = "OpenFavoriteGroup")
{
	strThisMenuItem :=  SubStr(A_ThisMenuItem, 1, InStr(A_ThisMenuItem, g_strGroupIndicatorPrefix) - 2) ; remove indicator with nb of group members
	strThisMenuItem .=  " " . g_strGroupIndicatorPrefix . g_strGroupIndicatorSuffix ; add empty indicators to retrieve fav name in objects
}

if InStr("OpenFavorite|OpenFavoriteHotlist|OpenFavoriteGroup", g_strOpenFavoriteLabel)
	
	g_objThisFavorite := GetFavoriteObjectFromMenuPosition(intMenuItemPos) ; returns the object and ByRef intMenuItemPos (unused here)
	
else if (g_strOpenFavoriteLabel = "OpenFavoriteFromHotkey")
{
	blnLocationFound := false
	strThisNameLocation := GetHotkeyNameLocation(A_ThisHotkey)
	StringSplit, arrThisNameLocation, strThisNameLocation, |

	for strMenuPath, objMenu in g_objMenusIndex
	{
		loop, % objMenu.MaxIndex()
		{
			strTempName := (objMenu[A_Index].FavoriteType = "QAP" ? "" : objMenu[A_Index].FavoriteName)
			if (strTempName = arrThisNameLocation1 and objMenu[A_Index].FavoriteLocation = arrThisNameLocation2)
			{
				g_objThisFavorite := objMenu[A_Index]
				blnLocationFound := true
				break, 2
			}
		}
	}
	
	if !(blnLocationFound)
	; could happen if hotkey was linked to a favorite in external menu that was changed or removed
	; orphan hotkeys will be removed next time favorites are saved
	{
		Oops(lOopsHotkeyNotInMenus, arrThisNameLocation2, A_ThisHotkey)
		
		gosub, OpenFavoriteGetFavoriteObjectCleanup
		return
	}
	
	if InStr("Menu|External", g_objThisFavorite.FavoriteType, true)
	; if favorite is a submenu, check if it is empty or if some of its items are QAP features needing to be refreshed
	{
		objMenu := g_objMenusIndex[lMainMenuName . " " . arrThisNameLocation2]
		if objMenu.MaxIndex() > 1 ; has more than the backlink entry
		{
			loop, % objMenu.MaxIndex()
			; this scans only this menu, not its submenu - QAP features needing to be refreshed may be in submenu...
				if (objMenu[A_Index].FavoriteType = "QAP")
					if (objMenu[A_Index].FavoriteLocation = "{Clipboard}")
						Gosub, RefreshClipboardMenu
					else if InStr("{Switch Folder or App}|{Current Folders}", objMenu[A_Index].FavoriteLocation)
						Gosub, RefreshSwitchFolderOrAppMenu
		}
		else
		{
			Oops(lMenuMenu . """" . g_objThisFavorite.FavoriteName . """" . lOopsEmpty)
			g_objThisFavorite := ""
		}
	}

	; DiagWindowInfo(A_ThisLabel . " - AVANT CanNavigate")
	if CanNavigate(A_ThisHotkey) ; update g_strTargetWinId
		g_strHokeyTypeDetected := "Navigate"
	else if CanLaunch(A_ThisHotkey)
	{
		g_strTargetWinId := "" ; never use target window when launched from hotkey
		g_strHokeyTypeDetected := "Launch"
	}
	else
	{
		gosub, OpenFavoriteGetFavoriteObjectCleanup
		return ; active window is on exclusion list
	}
	; DiagWindowInfo(A_ThisLabel . " - APRÈS CanNavigate")
}
else if (g_strOpenFavoriteLabel = "OpenReopenCurrentFolder")
{
	; GetTargetWinIdAndClass(g_strTargetWinId, g_strTargetClass) ; returns current or latest file manager window ID and Window class
	GetTargetWinIdAndClass(strReopenWindowsID, strReopenWindowClass, false, true) ; returns current or latest file manager window ID and Window class, so not activate, exclude dialog box
	
	g_objThisFavorite := Object() ; temporary favorite object
	; g_objThisFavorite.FavoriteName not needed because menu object never used for menu building
	g_objThisFavorite.FavoriteLocation := GetCurrentLocation(strReopenWindowClass, strReopenWindowsID)
	g_objThisFavorite.FavoriteType := "Folder"
}
else if (g_strOpenFavoriteLabel = "OpenReopenFolder") 
{
	If (InStr(g_objReopenFolderLocationUrlByName[strThisMenuItem], "::") = 1) ; A_ThisMenuItem can include the numeric shortcut
	{
		strThisMenuItem := SubStr(g_objReopenFolderLocationUrlByName[strThisMenuItem], 3) ; remove "::" from beginning
		strFavoriteType := "Special"
	}
	else if InStr(g_objReopenFolderLocationUrlByName[strThisMenuItem], "ftp://") ; possible with DOpus listers
		strFavoriteType := "FTP"
	else
		strFavoriteType := "Folder"
	
	g_objThisFavorite := Object() ; temporary favorite object
	g_objThisFavorite.FavoriteName := strThisMenuItem
	g_objThisFavorite.FavoriteLocation := strThisMenuItem
	g_objThisFavorite.FavoriteType := strFavoriteType
}
else ; OpenRecentFolder or OpenClipboard
{
	if InStr(strThisMenuItem, "http://") = 1 or InStr(strThisMenuItem, "https://") = 1 or InStr(strThisMenuItem, "www.") = 1
		strFavoriteType := "URL"
	else
	{
		strExtension := GetFileExtension(strThisMenuItem)
		if StrLen(strExtension) and InStr("exe.com.bat.vbs.ahk", strExtension)
			strFavoriteType := "Application" ; application
		else
			strFavoriteType := (LocationIsDocument(EnvVars(strThisMenuItem)) ? "Document" : "Folder")
	}
	
	g_objThisFavorite := Object() ; temporary favorite object
	g_objThisFavorite.FavoriteName := strThisMenuItem
	g_objThisFavorite.FavoriteLocation := (g_strOpenFavoriteLabel = "OpenDrives" ? SubStr(strThisMenuItem, 1, 1) . ":\" : strThisMenuItem)
	g_objThisFavorite.FavoriteType :=  (g_strOpenFavoriteLabel = "OpenDrives" ? "Folder" : strFavoriteType)
}

OpenFavoriteGetFavoriteObjectCleanup:
strThisMenuItem := ""
strFavoriteType := ""
intMenuItemPos := ""
blnLocationFound := ""
strThisNameLocation := ""
arrThisNameLocation := ""
strTempName := ""
strMenuPath := ""
objMenu := ""
strReopenWindowsID := ""
strReopenWindowClass := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
OpenFavoriteGetFullLocation:
;------------------------------------------------------------

g_strFullLocation := g_objThisFavorite.FavoriteLocation

if (g_objThisFavorite.FavoriteType = "FTP")
{
	; ftp://username:password@ftp.domain.ext/public_ftp/incoming/
	if (g_strTargetAppName = "TotalCommander")
		or !(g_objThisFavorite.FavoriteFtpEncoding) ; do not encode
	{
		; must NOT encode username and password with UriEncode
		strLoginName := g_objThisFavorite.FavoriteLoginName
		strPassword := g_objThisFavorite.FavoritePassword
	}
	else
	{
		; must encode username and password with UriEncode
		strLoginName := UriEncode(g_objThisFavorite.FavoriteLoginName)
		strPassword := UriEncode(g_objThisFavorite.FavoritePassword)
	}
	
	StringReplace, g_strFullLocation, g_strFullLocation, % "ftp://"
		, % "ftp://" . strLoginName . (StrLen(strPassword) ? ":" . strPassword : "") . (StrLen(strLoginName) ? "@" : "")
}
else
	if InStr("Folder|Document|Application", g_objThisFavorite.FavoriteType) ; not for URL, Special Folder and others
		and !LocationIsHTTP(g_objThisFavorite.FavoriteLocation) ; except if the folder location is on a server (like WebDAV)
	{
		if InStr(g_strFullLocation, "{CUR_")
			g_strFullLocation := ExpandPlaceholders(g_strFullLocation, g_strFullLocation
				, GetCurrentLocation(g_strTargetClass, g_strTargetWinId))
		
		; expand system variables
		; make the location absolute based on the current working directory
		blnFileExist := FileExistInPath(g_strFullLocation) ; return g_strFullLocation with expanded relative path and envvars, and absolute location if in PATH
		; was g_strFullLocation := PathCombine(A_WorkingDir, EnvVars(g_strFullLocation))
	}
	else if (g_objThisFavorite.FavoriteType = "Special")
		g_strFullLocation := GetSpecialFolderLocation(g_strHokeyTypeDetected, g_strTargetAppName, g_objThisFavorite) ; can change values of g_strHokeyTypeDetected and g_strTargetAppName
	; else URL or QAP (no need to expand or make absolute), keep g_strFullLocation as in g_objThisFavorite.FavoriteLocation

if StrLen(g_objThisFavorite.FavoriteLaunchWith) and !InStr("Application|Snippet", g_objThisFavorite.FavoriteType) ; ignore for Application favorites
{
	strFullLaunchWith := g_objThisFavorite.FavoriteLaunchWith
	blnFileExist := FileExistInPath(strFullLaunchWith) ; return strFullLaunchWith expanded and searched in PATH
	if !(blnFileExist) and (g_strAlternativeMenu <> lMenuAlternativeEditFavorite)
	{
		Gui, 1:+OwnDialogs
		MsgBox, 4, %g_strAppNameText%, % L(lOopsLaunchWithNotFound, strFullLaunchWith) . " " . lDialogFavoriteDoesNotExistEdit
		IfMsgBox, Yes
		{
			g_blnAlternativeMenu := true
			g_strAlternativeMenu := lMenuAlternativeEditFavorite
		}
		else 
			g_strFullLocation := ""
	}
	else
		g_strFullLocation := strFullLaunchWith . " """ . g_strFullLocation . """" ; enclose document path in double-quotes
}

if StrLen(g_objThisFavorite.FavoriteArguments)
	; let user enter double-quotes as required by his arguments
	g_strFullLocation .= " " . ExpandPlaceholders(g_objThisFavorite.FavoriteArguments, g_strFullLocation
		, (InStr(g_objThisFavorite.FavoriteArguments, "{CUR_") ? GetCurrentLocation(g_strTargetClass, g_strTargetWinId) : ""))

OpenFavoriteGetFullLocationCleanup:
strArguments := ""
strOutFileName := ""
strOutDir := ""
strOutExtension := ""
strOutNameNoExt := ""
strOutDrive := ""
strLoginName := ""
strPassword := ""
strFullLaunchWith := ""
blnFileExist := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
GetSpecialFolderLocation(ByRef strHokeyTypeDetected, ByRef strTargetName, objFavorite)
;------------------------------------------------------------
{
	global g_objSpecialFolders

	strLocation := objFavorite.FavoriteLocation ; make sure FavoriteLocation was not expanded by EnvVars
	objSpecialFolder := g_objSpecialFolders[strLocation]
	
	if (strTargetName = "Explorer")
		strUse := objSpecialFolder.Use4NavigateExplorer
	else if (strTargetName = "Dialog")
		strUse := objSpecialFolder.Use4Dialog
	else if (strTargetName = "Console")
		strUse := objSpecialFolder.Use4Console
	else if (strTargetName = "DirectoryOpus")
		strUse := objSpecialFolder.Use4DOpus
	else if (strTargetName = "TotalCommander")
		strUse := objSpecialFolder.Use4TC
	else if (strTargetName = "QAPconnect")
		strUse := objSpecialFolder.Use4FPc
	else
		strUse := objSpecialFolder.Use4NewExplorer

	if (strUse = "NEW") ; re-assign values as if it was a new window request to be open in *Explorer*
	{
		strUse := objSpecialFolder.Use4NewExplorer
		strHokeyTypeDetected := "Launch"
		strTargetName := "Explorer"
	}
	
	if (strUse = "CLS")
	{
		if (SubStr(strLocation, 1, 1) = "{")
			if (strTargetName = "TotalCommander")
				strLocation := "::" . strLocation
			else
				strLocation := "shell:::" . strLocation
		else ; expand strLocation
			strLocation := EnvVars(strLocation)			
	}
	else if (strUse = "AHK")
	{
		strAHKConstant := objSpecialFolder.AHKConstant ; for example "A_Desktop"
		strLocation := %strAHKConstant% ; the contant value, for example "C:\Users\jlalonde\Desktop"
	}
	else if (strUse = "DOA")
		strLocation := "/" . objSpecialFolder.DOpusAlias
	else if (strUse = "SCT")
		strLocation := "shell:" . objSpecialFolder.ShellConstantText
	else if (strUse = "TCC")
		strLocation := objSpecialFolder.TCCommand
	else
	{
		Oops(lOopsCouldNotOpenSpecialFolder, strTargetName, strLocation)
		strLocation := ""
	}
	
	return strLocation
}
;------------------------------------------------------------



;------------------------------------------------------------
GetFavoriteObjectFromMenuPosition(ByRef intMenuItemPos)
;------------------------------------------------------------
{
	global g_objMenusIndex

	GetNumberOfHiddenItemsBeforeThisItem(intColumnBreaksBeforeThisItem, intDisabledItemsBeforeThisItem)

	intMenuItemPos := A_ThisMenuItemPos + (A_ThisMenu = lMainMenuName or A_ThisMenu = lTCMenuName ? 0 : 1)
		+ intColumnBreaksBeforeThisItem + intDisabledItemsBeforeThisItem
	
	return g_objMenusIndex[A_ThisMenu][intMenuItemPos]
}
;------------------------------------------------------------


;------------------------------------------------------------
GetNumberOfHiddenItemsBeforeThisItem(ByRef intColumnBreaksBeforeThisItem, ByRef intDisabledItemsBeforeThisItem)
;------------------------------------------------------------
{
	global g_objMenusIndex
	
	intColumnBreaksBeforeThisItem := 0
	intDisabledItemsBeforeThisItem := 0
	intMenuObjectItemOffset := (A_ThisMenu = lMainMenuName or A_ThisMenu = lTCMenuName ? 0 : 1)
	
	Loop
	{
		if ((A_Index - intColumnBreaksBeforeThisItem - intDisabledItemsBeforeThisItem) > A_ThisMenuItemPos)
			break
		else if (g_objMenusIndex[A_ThisMenu][A_Index + intMenuObjectItemOffset].FavoriteType = "K")
			intColumnBreaksBeforeThisItem++
		else if (g_objMenusIndex[A_ThisMenu][A_Index + intMenuObjectItemOffset].FavoriteDisabled)
			intDisabledItemsBeforeThisItem++
	}
}
;------------------------------------------------------------


;------------------------------------------------------------
GetWinInfo:
;------------------------------------------------------------

g_blnGetWinInfo := true

MsgBox, % 64 + 4096, %g_strAppNameText% - %lMenuGetWinInfo%, % L(lDialogGetWinInfo, Hotkey2Text(g_arrPopupHotkeys1))

return
;------------------------------------------------------------


;------------------------------------------------------------
GetWinInfo2Clippoard:
;------------------------------------------------------------

g_blnGetWinInfo := ""
WinClose, %g_strAppNameFile% - %lMenuGetWinInfo%

MsgBox, 4, %g_strAppNameText% - %lMenuGetWinInfo%, % L(lDialogGetWinInfo2Clippoard, g_strTargetWinTitle, g_strTargetClass)

IfMsgBox, Yes
	Clipboard := g_strTargetWinTitle . "`r`n" . g_strTargetClass

return
;------------------------------------------------------------


;------------------------------------------------------------
ShutdownComputer:
RestartComputer:
;------------------------------------------------------------

MsgBox, 4, %g_strAppNameText%, % (A_ThisLabel = "ShutdownComputer" ? lMenuComputerShutdown : lMenuComputerRestart) . "?"
IfMsgBox, Yes
	Shutdown, % (A_ThisLabel = "ShutdownComputer" ? 1+8 : 2) ; Logoff 0, Shutdown 1, Reboot 2, Force 4, Power down 8 

return
;------------------------------------------------------------


;------------------------------------------------------------
PasteSnippet:
;------------------------------------------------------------

strWaitTime := 10

strFavoriteSnippetOptions := g_objThisFavorite.FavoriteLaunchWith . ";;;" ; safety
; 1 boolean (true: send snippet to current application using macro mode / else paste as raw text)
; 2 prompt (pause prompt before pasting/launching the snippet)
StringSplit, arrFavoriteSnippetOptions, strFavoriteSnippetOptions, `;

WinGetClass, strClassSnippet, ahk_id %g_strTargetWinId%

; Diag(A_ThisLabel . " Start - g_blnLaunchFromTrayIcon / strClassSnippet", g_blnLaunchFromTrayIcon . " / " . strClassSnippet)
; DiagWindowInfo(A_ThisLabel . " Start")

if (g_blnLaunchFromTrayIcon or WindowIsTray(strClassSnippet) or WindowIsDesktop(strClassSnippet) or StrLen(arrFavoriteSnippetOptions2))
{
	ToolTip, % L((StrLen(arrFavoriteSnippetOptions2) ? arrFavoriteSnippetOptions2 . "`n" : "")
		. (arrFavoriteSnippetOptions1 = 1 ? lTooltipSnippetWaitMacro : lTooltipSnippetWaitText), lTooltipSnippetWaitEnter, lTooltipSnippetWaitSpace, strWaitTime)
	Input, strTemp, T%strWaitTime%, {Enter}{Space}
	strErrorLevel := ErrorLevel
	ToolTip
	if !InStr(strErrorLevel, "EndKey:")
	{
		Gosub, PasteSnippetCleanup
		return
	}
}
else
	WinActivate, ahk_id %g_strTargetWinId%

; arrFavoriteSnippetOptions1 is 1 for Macro snippet, anything else is Text snippet
blnTextSnippet := (arrFavoriteSnippetOptions1 <> 1)

if (blnTextSnippet)
{
	objPrevClipboard := ClipboardAll ; save the clipboard (text or data)
	Sleep, 100 ; safety delay
	ClipBoard := ""
	Sleep, 100 ; safety delay
	; DecodeSnippet: convert from raw content (as from ini file) to display format (when f_blnProcessEOLTab is true) or to paste format
	ClipBoard := DecodeSnippet(g_objThisFavorite.FavoriteLocation)
	ClipWait, 0 ; SecondsToWait, specifying 0 is the same as specifying 0.5
	intErrorLevel := ErrorLevel
	; Diag("ClipWait After - intErrorLevel / StrLen(Clipboard)", intErrorLevel . " / " . StrLen(Clipboard))
	if (intErrorLevel)
	{
		Gosub, PasteSnippetCleanup
		return
	}
	
	; avoid using SendInput to send ^v
	; (see: https://autohotkey.com/board/topic/77928-ctrl-v-sendinput-v-is-not-working-in-many-applications/#entry495555)
	; tried "ControlSend, %g_strTargetControl%, ^v" with disappointing results (not working on Explorer address zone, send "v" to Word, etc.)
	Sleep, 200 ; delay required by some application, including Notepad
	SendEvent, ^v
	Sleep, 100 ; safety
	
	Clipboard := objPrevClipboard ; Restore the original clipboard
	; Diag("Send (text) After - g_objThisFavorite.FavoriteLocation", StringLeftDotDotDot(g_objThisFavorite.FavoriteLocation, 80))
}
else ; snippet of type Macro
{
	; DecodeSnippet: convert from raw content (as from ini file) to display format (when f_blnProcessEOLTab is true) or to paste format
	strTemp := DecodeSnippet(g_objThisFavorite.FavoriteLocation)
	; Diag("Send (macro) After - g_objThisFavorite.FavoriteLocation", StringLeftDotDotDot(g_objThisFavorite.FavoriteLocation, 80))

	Loop
	{
		if InStr(strTemp, g_strSnippetCommandStart)
		{
			intCommandStart := InStr(strTemp, g_strSnippetCommandStart)
			intCommandEnd := InStr(strTemp, g_strSnippetCommandEnd, , intCommandStart)
			strSend := SubStr(strTemp, 1, intCommandStart - 1)
			strCommand := Trim(SubStr(strTemp, intCommandStart + 2, intCommandEnd - intCommandStart - 2))
			
			if StrLen(strSend)
				Send, %strSend% ; SendMode is Input mode by default until user sends a SetKeyDelay where it would be changed to Event mode
			
			if StrLen(strCommand)
			; {&Sleep:n} or {&n}: pause sending the snippet for n milliseconds (see https://autohotkey.com/docs/commands/Sleep.htm)
			; {&SetKeyDelay:n, option}: speed down the sending of the snippet (see https://autohotkey.com/docs/commands/SetKeyDelay.htm)
			; {&KeyWait:keyname, options}: pause sending the snippet until user press the specified key, option D by default, added option B to "Beep" (see https://autohotkey.com/docs/commands/KeyWait.htm)
			{
				if strCommand is integer ; shortcut {&n} for {&Sleep:n} command
				{
					strOptions := strCommand ; copy the n of milliseconds to sleep
					strCommand := "Sleep" ; set the shortcut command
				}
				else if InStr(strCommand, g_strSnippetOptionsSeparator)
				{
					strOptions := SubStr(strCommand, InStr(strCommand, g_strSnippetOptionsSeparator) + 1)
					strCommand := Trim(SubStr(strCommand, 1, InStr(strCommand, g_strSnippetOptionsSeparator) - 1))
				}
				else
					strOptions := ""

				strOptions .= ",,,,," ; append comas to make sure we init an empty array
				StringSplit, arrOptions, strOptions, `,
				loop, %arrOptions0%
					arrOptions%A_Index% := Trim(arrOptions%A_Index%)
				
				if (strCommand = "Sleep")
					Sleep, %arrOptions1%
				else if (strCommand = "SetKeyDelay")
				{
					SendMode, Event ; to support key delay
					SetKeyDelay, %arrOptions1%, %arrOptions2%
				}
				else if (strCommand = "KeyWait")
				{
					strOptions := Trim(arrOptions2 . " " . arrOptions3 . " " . arrOptions4)
					if !InStr(strOptions, "D")
						strOptions .= " D"
					ToolTip, % L(lTooltipSnippetKeyWait, arrOptions1)
					if InStr(strOptions, "B")
						SoundBeep
					KeyWait, %arrOptions1%, %strOptions%
					ToolTip
				}
			}
			
			strTemp := SubStr(strTemp, intCommandEnd + 1) ; loop with the remaining of the snippet
		}
		else ; this is the last section of the snippet
		{
			if StrLen(strTemp)
				Send, %strTemp%
			break
		}
	}

	SendMode, Input ; restore default SendMode to Input mode
}

PasteSnippetCleanup:
strWaitTime := ""
intErrorLevel := ""
blnTextSnippet := ""
objPrevClipboard := ""
strClassSnippet := ""
g_blnLaunchFromTrayIcon := false
strTemp := ""
strSend := ""
strCommand := ""
arrFavoriteSnippetOptions := ""
strFavoriteSnippetOptions := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
DoNothing:
;------------------------------------------------------------

return
;------------------------------------------------------------



;========================================================================================================================
; END OF MENU ACTIONS
;========================================================================================================================



;========================================================================================================================
!_074_NAVIGATE:
;========================================================================================================================

;------------------------------------------------------------
OpenFavoriteNavigateExplorer:
; Excerpt and adapted from RMApp_Explorer_Navigate(FullPath, hwnd="") by Learning One
; http://ahkscript.org/boards/viewtopic.php?f=5&t=526&start=20#p4673
; http://msdn.microsoft.com/en-us/library/windows/desktop/bb774096%28v=vs.85%29.aspx
; http://msdn.microsoft.com/en-us/library/aa752094
;------------------------------------------------------------

if !Regexmatch(g_strFullLocation, "#.*\\") ; prevent the hash bug in Shell.Application - when a hash in path is followed by a backslash like in "c:\abc#xyz\abc")
{
	intCountMatch := 0
	For pExplorer in ComObjCreate("Shell.Application").Windows
	{
		if (pExplorer.hwnd = g_strTargetWinId)
		{
			intCountMatch++
			if IsInteger(g_strFullLocation) ; ShellSpecialFolderConstant
			{
				try pExplorer.Navigate2(g_strFullLocation)
				catch, objErr
					Oops(lNavigateSpecialError, g_strFullLocation)
			}
			else
			{
				try pExplorer.Navigate(g_strFullLocation)
				catch, objErr
					; Note: If an error occurs in Navigate, the error message is given by Navigate itself and this script does not
					; receive an error notification. From my experience, the following line would never be executed.
					Oops(lNavigateFileError, g_strFullLocation)
			}
		}
	}
	if !(intCountMatch) ; open a new window
	; for Explorer add-ons like Clover (verified - it now opens the folder in a new tab), others?
	; also when g_strTargetWinId is DOpus window and DOpus is not used
		if IsInteger(g_strFullLocation) ; ShellSpecialFolderConstant
			ComObjCreate("Shell.Application").Explore(g_strFullLocation)
		else
			SendInput, {F4}{Esc}{Raw}%g_strFullLocation%`n
			; if I receive bug reports from Clover users, insert delays or fall back to; Run, Explorer "%g_strFullLocation%"
}
else
	; Workaround for the hash (aka Sharp / "#") bug in Shell.Application - occurs only when navigating in the current Explorer window
	; see http://stackoverflow.com/questions/22868546/navigate-shell-command-not-working-when-the-path-includes-an-hash
	; and http://ahkscript.org/boards/viewtopic.php?f=5&t=526&p=25287#p25274
	SendInput, {F4}{Esc}{Raw}%g_strFullLocation%`n

intCountMatch := ""
pExplorer := ""
objErr := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
OpenFavoriteNavigateDirectoryOpus:
;------------------------------------------------------------

if (WinExist("A") <> g_strTargetWinId) ; in case that some window just popped out, and initialy active window lost focus
	WinActivate, ahk_id %g_strTargetWinId% ; we'll activate initialy active window

RunDOpusRt("/aCmd Go", g_strFullLocation) ; navigate the current lister

return
;------------------------------------------------------------


;------------------------------------------------------------
OpenFavoriteNavigateTotalCommander:
;------------------------------------------------------------

if g_strFullLocation is integer
{
	SendMessage, 0x433, %g_strFullLocation%, , , ahk_class TTOTAL_CMD
	Sleep, 100 ; wait to improve SendMessage reliability
	WinActivate, ahk_class TTOTAL_CMD
}
else
{
	if (WinExist("A") <> g_strTargetWinId) ; in case that some window just popped out, and initialy active window lost focus
	{
		WinActivate, ahk_id %g_strTargetWinId% ; we'll activate initialy active window
		Sleep, 200
	}
	Run, %g_strTotalCommanderPath% /O /S /L="%g_strFullLocation%" ; /O existing file list, /S source-dest /L=source (active pane) - change folder in the active pane/tab
}

return
;------------------------------------------------------------


;------------------------------------------------------------
OpenFavoriteNavigateQAPconnect:
;------------------------------------------------------------

if InStr(g_strFullLocation, " ")
	g_strFullLocation := """" . g_strFullLocation . """"
StringReplace, strQAPconnectParamString, g_strQAPconnectCommandLine, % "%Path%", %g_strFullLocation%
StringReplace, strQAPconnectParamString, strQAPconnectParamString, % "%NewTabSwitch%"

if (WinExist("A") <> g_strTargetWinId) ; in case that some window just popped out, and initialy active window lost focus
{
	WinActivate, ahk_id %g_strTargetWinId% ; we'll activate initialy active window
	Sleep, 200
}
Run, %g_strQAPconnectAppPath% %strQAPconnectParamString%

strQAPconnectParamString :=""

return
;------------------------------------------------------------


;------------------------------------------------------------
OpenFavoriteNavigateConsole:
;------------------------------------------------------------

if (WinExist("A") <> g_strTargetWinId) ; in case that some window just popped out, and initialy active window lost focus
	WinActivate, ahk_id %g_strTargetWinId% ; we'll activate initialy active window
SendInput, {Raw}CD /D %g_strFullLocation%
Sleep, 200
SendInput, {Enter}

return
;------------------------------------------------------------


;------------------------------------------------------------
OpenFavoriteNavigateDialog:
;------------------------------------------------------------

if ControlIsVisible("ahk_id " . g_strTargetWinId, "Edit1")
	strEditControl := "Edit1"
	; in standard dialog windows, "Edit1" control is the right choice
Else if ControlIsVisible("ahk_id " . g_strTargetWinId, "Edit2")
	strEditControl := "Edit2"
	; but sometimes in MS office, if condition above fails, "Edit2" control is the right choice 
Else ; if above fails - just return and do nothing.
{
	gosub, OpenFavoriteNavigateDialogCleanUp
	return
}

;===In this part (if we reached it), we'll send strLocation to control and restore control's initial text after navigating to specified folder===

ControlGetText, strPrevControlText, %strEditControl%, ahk_id %g_strTargetWinId% ; we'll get and store control's initial text first

if !ControlSetTextR(strEditControl, g_strFullLocation, "ahk_id " . g_strTargetWinId) ; set control's text to strLocation
{
	gosub, OpenFavoriteNavigateDialogCleanUp
	return ; abort if control is not set
}
if !ControlSetFocusR(strEditControl, "ahk_id " . g_strTargetWinId) ; focus control
{
	gosub, OpenFavoriteNavigateDialogCleanUp
	return
}
if (WinExist("A") <> g_strTargetWinId) ; in case that some window just popped out, and initialy active window lost focus
	WinActivate, ahk_id %g_strTargetWinId% ; we'll activate initialy active window

;=== Avoid accidental hotkey & hotstring triggereing while doing SendInput - can be done simply by #UseHook, but do it if user doesn't have #UseHook in the script ===

Sleep, %g_intWaitDelayInDialogBox% ; give some time to control before sending {Enter} to it
If (A_IsSuspended)
	blnWasSuspended := True
if (!blnWasSuspended)
	Suspend, On
; Changed from SendInput to SendEvent in v8.0.9.2 to introduce a key delay to solve issue with Firefox dialog box
; SendInput, {End}{Space}{Backspace}{Enter} ; silly but necessary part - go to end of control, send dummy space, delete it, and then send enter
SetKeyDelay, %g_intWaitDelayInDialogBox%
SendEvent, {End}{Space}{Backspace}{Enter} ; silly but necessary part - go to end of control, send dummy space, delete it, and then send enter
if (!blnWasSuspended)
	Suspend, Off

Sleep, %g_intWaitDelayInDialogBox% ; give some time to control after sending {Enter} to it
ControlGetText, strControlTextAfterNavigation, %strEditControl%, ahk_id %g_strTargetWinId% ; sometimes controls automatically restore their initial text
if (strControlTextAfterNavigation <> strPrevControlText)
	ControlSetTextR(strEditControl, strPrevControlText, "ahk_id " . g_strTargetWinId) ; we'll set control's text to its initial text

if (WinExist("A") <> g_strTargetWinId) ; sometimes initialy active window loses focus, so we'll activate it again
	WinActivate, ahk_id %g_strTargetWinId%

OpenFavoriteNavigateDialogCleanUp:
strEditControl := ""
strPrevControlText := ""
blnWasSuspended := ""
strControlTextAfterNavigation := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
OpenFavoriteNavigateUnknown:
;------------------------------------------------------------
; avoid an error message if target app name is unknown

Oops(lOopsUnknownTargetAppName)

return
;------------------------------------------------------------


;------------------------------------------------------------
ControlIsVisible(strWinTitle, strControlClass)
/*
Adapted from ControlIsVisible(WinTitle,ControlClass) by Learning One
http://ahkscript.org/boards/viewtopic.php?f=5&t=526&start=20#p4673
*/
;------------------------------------------------------------
{
	; used in Navigator
	ControlGet, blnIsControlVisible, Visible, , %strControlClass%, %strWinTitle%

	return blnIsControlVisible
}
;------------------------------------------------------------


;------------------------------------------------------------
ControlSetTextR(strControl, strNewText := "", strWinTitle := "", intTries := 3)
/*
Adapted from from RMApp_ControlSetTextR(Control, NewText="", WinTitle="", Tries=3) by Learning One
http://ahkscript.org/boards/viewtopic.php?f=5&t=526&start=20#p4673
*/
;------------------------------------------------------------
{
	; used in Navigator. More reliable ControlSetText
	Loop, %intTries%
	{
		ControlSetText, %strControl%, %strNewText%, %strWinTitle% ; set
		Sleep, % (100 * A_Index) ; JL added "* A_Index"
		ControlGetText, strCurControlText, %strControl%, %strWinTitle% ; check
		if (strCurControlText = strNewText) ; if OK
			return True
	}

	return false
}
;------------------------------------------------------------


;------------------------------------------------------------
ControlSetFocusR(strControl, strWinTitle := "", intTries := 3)
/*
Adapted from RMApp_ControlSetFocusR(Control, WinTitle="", Tries=3) by Learning One
http://ahkscript.org/boards/viewtopic.php?f=5&t=526&start=20#p4673
*/
;------------------------------------------------------------
{
	; used in Navigator. More reliable ControlSetFocus
	Loop, %intTries%
	{
		ControlFocus, %strControl%, %strWinTitle% ; focus control
		Sleep, % (100 * A_Index) ; JL added "* A_Index"
		ControlGetFocus, strFocusedControl, %strWinTitle% ; check
		if (strFocusedControl = strControl) ; if OK
			return True
	}

	return false
}
;------------------------------------------------------------



;========================================================================================================================
; END OF NAVIGATE
;========================================================================================================================



;========================================================================================================================
!_075_NEW_WINDOW:
;========================================================================================================================

;------------------------------------------------------------
OpenFavoriteInNewWindowExplorer:
;------------------------------------------------------------

if (g_arrFavoriteWindowPosition1)
{
	; get new window ID
	; when run -> pid? if not scan Explorer ids
	gosub, SetExplorersIDs ;  refresh the list of existing Explorer windows g_strExplorerIDs
	strExplorerIDsBefore := g_strExplorerIDs ;  save the list before launching this new Explorer
	; Diag(A_ThisLabel . " strExplorerIDsBefore", strExplorerIDsBefore)
}

Run, % "Explorer """ . g_strFullLocation . """" ; there was a bug prior to v3.3.1 because the lack of double-quotes

if (g_arrFavoriteWindowPosition1)
{
	; Diag(A_ThisLabel . " g_arrFavoriteWindowPosition7", g_arrFavoriteWindowPosition7)
	Loop
	{
		if (A_Index > 25)
		{
			TrayTip, % L(lTrayTipInstalledTitle, g_strAppNameText), % L(lDialogErrorMoving, g_strFullLocation), , 2 ; warning icon with sound
			Sleep, 20 ; tip from Lexikos for Windows 10 "Just sleep for any amount of time after each call to TrayTip" (http://ahkscript.org/boards/viewtopic.php?p=50389&sid=29b33964c05f6a937794f88b6ac924c0#p50389)
			Break
		}
		Sleep, %g_arrFavoriteWindowPosition7%
		gosub, SetExplorersIDs ;  refresh the list of existing Explorer windows g_strExplorerIDs
		; Diag(A_ThisLabel . " g_strExplorerIDs take " . A_Index, g_strExplorerIDs)
		Loop, Parse, g_strExplorerIDs, |
			; Diag(A_ThisLabel . " A_LoopField", A_LoopField)
			if !InStr(strExplorerIDsBefore, A_LoopField . "|")
			{
				g_strNewWindowId  := "ahk_id " . A_LoopField
				break
			}
		If StrLen(g_strNewWindowId)
			Break ; we have a new window
	}
}

strExplorerIDsBefore := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
SetExplorersIDs:
;------------------------------------------------------------
g_strExplorerIDs := ""
for objExplorer in ComObjCreate("Shell.Application").Windows
{
	strType := ""
	try strType := objExplorer.Type ; Gets the type name of the contained document object. "Document HTML" for IE windows. Should be empty for file Explorer windows.
	strWindowID := ""
	try strWindowID := objExplorer.HWND ; Try to get the handle of the window. Some ghost Explorer in the ComObjCreate may return an empty handle
	if !StrLen(strType) and StrLen(strWindowID) ; strType must be empty and strWindowID must not be empty
		g_strExplorerIDs .= objExplorer.HWND . "|"
}

objExplorer := ""
strType := ""
strWindowID := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
OpenFavoriteInNewWindowDirectoryOpus:
;------------------------------------------------------------

; RunDOpusRt("/acmd Go ", objIniExplorersInGroup[intDOIndexPane].Name, " NEWTAB") ; open in a new tab of pane 1
; RunDOpusRt("/acmd Go ", objIniExplorersInGroup[intDOIndexPane].Name, " OPENINRIGHT") ; open in a first tab of pane 2
; RunDOpusRt("/acmd Go ", objIniExplorersInGroup[intDOIndexPane].Name, " OPENINRIGHT NEWTAB") ; open in a new tab of pane 2

if (g_strOpenFavoriteLabel = "OpenFavoriteFromGroup")
{
	if (g_blnFirstItemOfGroup and g_blnGroupReplaceWindows) ; force left in new lister
		strTabParameter := "NEW=nodual"
	else
	{
		; 0 for use default / 1 for remember, -1 Minimized / 0 Normal / 1 Maximized, Left (X), Top (Y), Width, Height, Delay, RestoreSide; for example: "0,,,,,,,L"
		strFavoriteWindowPosition := g_objThisFavorite.FavoriteWindowPosition
		StringSplit, arrFavoriteWindowPosition, strFavoriteWindowPosition, `,
		if StrLen(arrFavoriteWindowPosition8)
			strTabParameter := "NEWTAB " . (arrFavoriteWindowPosition8 = "L" ? "OPENINLEFT" : "OPENINRIGHT")
		else
			strTabParameter := g_strDirectoryOpusNewTabOrWindow
	}
}
else
{
	strTabParameter := g_strDirectoryOpusNewTabOrWindow
	arrFavoriteWindowPosition8 := ""
}

RunDOpusRt("/acmd Go ", g_strFullLocation, " " . strTabParameter) ; open in a new lister or tab, left or right
WinWait, ahk_class dopus.lister, , 10
WinActivate, ahk_class dopus.lister
g_strNewWindowId := "ahk_class dopus.lister"

strTabParameter := ""
strFavoriteWindowPosition := ""
arrFavoriteWindowPosition := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
OpenFavoriteInNewWindowTotalCommander:
;------------------------------------------------------------

if (g_strOpenFavoriteLabel = "OpenFavoriteFromGroup")
{
	; 0 for use default / 1 for remember, -1 Minimized / 0 Normal / 1 Maximized, Left (X), Top (Y), Width, Height, Delay, RestoreSide; for example: "0,,,,,,,L"
	strFavoriteWindowPosition := g_objThisFavorite.FavoriteWindowPosition
	StringSplit, arrFavoriteWindowPosition, strFavoriteWindowPosition, `,
	if StrLen(arrFavoriteWindowPosition8)
		strSideParameter := arrFavoriteWindowPosition8
	else
		strSideParameter := "L"
}
	
if g_strFullLocation is integer
{
	if !WinExist("ahk_class TTOTAL_CMD") ; open a first instance
		or InStr(g_strTotalCommanderNewTabOrWindow, "/N") ; or open a new instance
		or (g_strOpenFavoriteLabel = "OpenFavoriteFromGroup" and (g_blnFirstItemOfGroup and g_blnGroupReplaceWindows))
	{
		Run, %g_strTotalCommanderPath%
		WinWaitActive, ahk_class TTOTAL_CMD, , 10
		Sleep, 200 ; wait additional time to improve SendMessage reliability in OpenFavoriteNavigateTotalCommander
	}
	
	if (g_strOpenFavoriteLabel = "OpenFavoriteFromGroup")
	{
		if (strSideParameter = "L")
			intTCCommandFocus := 4001 ; cm_FocusLeft
		else
			intTCCommandFocus := 4002 ; cm_FocusRight
		Sleep, 100 ; wait to improve SendMessage reliability
		SendMessage, 0x433, %intTCCommandFocus%, , , ahk_class TTOTAL_CMD
	}
	
	if !InStr(g_strTotalCommanderNewTabOrWindow, "/N") ; open the folder in a new tab
	{
		intTCCommandOpenNewTab := 3001 ; cm_OpenNewTab
		Sleep, 100 ; wait to improve SendMessage reliability
		SendMessage, 0x433, %intTCCommandOpenNewTab%, , , ahk_class TTOTAL_CMD
	}
	Sleep, 100 ; wait to improve SendMessage reliability in OpenFavoriteNavigateTotalCommander
	gosub, OpenFavoriteNavigateTotalCommander
	; Since g_strFullLocation is integer, OpenFavoriteNavigateTotalCommander is doing:
	; SendMessage, 0x433, %intTCCommand%, , , ahk_class TTOTAL_CMD
	; Sleep, 100 ; wait to improve SendMessage reliability
	; WinActivate, ahk_class TTOTAL_CMD
}
else ; normal folder
{
	if (g_strOpenFavoriteLabel = "OpenFavoriteFromGroup")
		if (g_blnFirstItemOfGroup and g_blnGroupReplaceWindows)
			strTabParameter := "/N" ; /N new window
		else
			strTabParameter := "/O /T" ; /O same instance, /T new tab
	else
	{
		; g_strTotalCommanderNewTabOrWindow in ini file should contain "/O /T" to open in an new tab of the existing file list (default), or "/N" to open in a new file list
		strTabParameter := g_strTotalCommanderNewTabOrWindow
		strSideParameter := ""
	}
	
	if StrLen(strSideParameter)
		Run, %g_strTotalCommanderPath% %strTabParameter% /%strSideParameter%="%g_strFullLocation%"
	else
		; use active parameter with /S instead of L/R side parameter
		Run, %g_strTotalCommanderPath% %strTabParameter% /S "%g_strFullLocation%"

	WinWaitActive, ahk_class TTOTAL_CMD, , 10
}
g_strNewWindowId := "ahk_class TTOTAL_CMD"

intTCCommandOpenNewTab := ""
intTCCommandFocus := ""
strTabParameter := ""
strSideParameter := ""
strFavoriteWindowPosition := ""
arrFavoriteWindowPosition := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
OpenFavoriteInNewWindowQAPconnect:
;------------------------------------------------------------

; old Run, %g_strQAPconnectPath% %g_strFullLocation% /new
if InStr(g_strFullLocation, " ")
	g_strFullLocation := """" . g_strFullLocation . """"
StringReplace, strQAPconnectParamString, g_strQAPconnectCommandLine, % "%Path%", %g_strFullLocation%
StringReplace, strQAPconnectParamString, strQAPconnectParamString, % "%NewTabSwitch%", %g_strQAPconnectNewTabSwitch%

Run, %g_strQAPconnectAppPath% %strQAPconnectParamString%

if StrLen(g_strQAPconnectWindowID)
; g_strQAPconnectWindowID is read in the QAPconnect.ini file for the connected file manager.
; It must contain at least some characters of the connected app title, and enough to be specific to this window.
; It is used here to wait for the FM window as identified in QAPconnect.ini. And it is copied to g_strNewWindowId
{
	intPreviousTitleMatchMode := A_TitleMatchMode ; save current match mode
	SetTitleMatchMode, RegEx ; change match mode to RegEx
	; with RegEx, for example, ahk_class IEFrame searches for any window whose class name contains IEFrame anywhere
	; (because by default, regular expressions find a match anywhere in the target string).
	WinWaitActive, ahk_exe %g_strQAPconnectAppFilename%, , 10 ; wait for the window as identified in QAPconnect.ini
	SetTitleMatchMode, %intPreviousTitleMatchMode% ; restore previous match mode
	g_strNewWindowId := g_strQAPconnectWindowID
}
else
	g_strNewWindowId := ""

intPreviousTitleMatchMode := ""
strQAPconnectParamString := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
OpenFavoriteInNewWindowUnknown:
;------------------------------------------------------------
; avoid an error message if target app name is unknown

Oops(lOopsUnknownTargetAppName)

return
;------------------------------------------------------------


;------------------------------------------------------------
OpenFavoriteWindowResize:
;------------------------------------------------------------

; WinGetActiveStats, Title, Width, Height, X, Y
; ###_V("",  Title, Width, Height, X, Y)

if (g_arrFavoriteWindowPosition1 and StrLen(g_strNewWindowId))
{
	intPreviousTitleMatchMode := A_TitleMatchMode
	; with RegEx: for example, ahk_class IEFrame searches for any window whose class name contains IEFrame anywhere
	; (because by default, regular expressions find a match anywhere in the target string).
	SetTitleMatchMode, RegEx
	Sleep, % g_arrFavoriteWindowPosition7 * (g_blnFirstItemOfGroup ? 2 : 1)
	if (g_arrFavoriteWindowPosition2 = -1) ; Minimized
		WinMinimize, %g_strNewWindowId%
	else if (g_arrFavoriteWindowPosition2 = 1) ; Maximized
		WinMaximize, %g_strNewWindowId%
	else ; Normal
	{
		; see WinRestore doc PostMessage, 0x112, 0xF120,,, %g_strNewWindowId% ; 0x112 = WM_SYSCOMMAND, 0xF120 = SC_RESTORE
		WinRestore, %g_strNewWindowId%
		Sleep, %g_arrFavoriteWindowPosition7%
		WinMove, %g_strNewWindowId%,
			, %g_arrFavoriteWindowPosition3% ; left
			, %g_arrFavoriteWindowPosition4% ; top
			, %g_arrFavoriteWindowPosition5% ; width
			, %g_arrFavoriteWindowPosition6% ; height
	}
	SetTitleMatchMode, %intPreviousTitleMatchMode%
}

intPreviousTitleMatchMode := ""

return
;------------------------------------------------------------


;========================================================================================================================
; END OF NEW WINDOW
;========================================================================================================================


;========================================================================================================================
!_076_TRAY_MENU_ACTIONS:
;========================================================================================================================

;------------------------------------------------------------
ShowSettingsIniFile:
;------------------------------------------------------------

Run, %g_strIniFile%

return
;------------------------------------------------------------


;------------------------------------------------------------
ReloadQAP:
ReloadQAPSwitch:
;------------------------------------------------------------

; Do not use the Reload command: Any command-line parameters passed to the original script are not passed to the new instance.
; To pass such parameters, do not use Reload. Instead, use Run in conjunction with A_AhkPath and A_ScriptFullPath
; (and A_IsCompiled if the script is ever used in compiled form). Also, include the string /restart as the first parameter
; (i.e. after the name of the executable), which tells the program to use the same behavior as Reload.

; make sure the default system mouse pointer are reset before reloading QAP
SetWaitCursor(false)

if (A_ThisLabel = "ReloadQAPSwitch")
	g_strCurrentCommandLineParameters := "/Settings:" . g_strSwitchSettingsFile
	; review this when parameters other than "/Settings:" is used in the future

if (A_IsCompiled)
	Run, %A_ScriptFullPath% /restart "%g_strCurrentCommandLineParameters%"
else
	Run, %A_AhkPath% /restart %A_ScriptFullPath% "%g_strCurrentCommandLineParameters%"

return
;------------------------------------------------------------


;------------------------------------------------------------
ShowQAPconnectIniFile:
;------------------------------------------------------------

if FileExist(g_strQAPconnectIniPath)
	Run, %g_strQAPconnectIniPath%
else
	Oops(lOptionsThirdPartyFileNotFound, "QAPconnect", g_strQAPconnectIniPath)

return
;------------------------------------------------------------


;------------------------------------------------------------
RunAtStartup:
;------------------------------------------------------------
; Startup code adapted from Avi Aryan Ryan in Clipjump

Menu, Tray, Togglecheck, %lMenuRunAtStartupAmpersand%
IfExist, %A_Startup%\%g_strAppNameFile%.lnk
	FileDelete, %A_Startup%\%g_strAppNameFile%.lnk
else
	FileCreateShortcut, %A_ScriptFullPath%, %A_Startup%\%g_strAppNameFile%.lnk, %A_WorkingDir%

return
;------------------------------------------------------------


;------------------------------------------------------------
SuspendHotkeys:
;------------------------------------------------------------

if (A_IsSuspended)
	Suspend, Off
else
	Suspend, On

Menu, Tray, % (A_IsSuspended ? "check" : "uncheck"), %lMenuSuspendHotkeys%

return
;------------------------------------------------------------


;------------------------------------------------------------
Check4Update:
Check4UpdateNow:
;------------------------------------------------------------

strUrlCheck4Update := "http://quickaccesspopup.com/latest/latest-version-4.php"

g_strUrlAppLandingPage := "http://quickaccesspopup.com" ; must be here if user select Check for update from tray menu
strBetaLandingPage := "http://quickaccesspopup.com/latest/check4update-beta-redirect.html"
strAlphaLandingPage := "http://quickaccesspopup.com/latest/check4update-alpha-redirect.html"

IniRead, strLatestSkippedProd, %g_strIniFile%, Global, LatestVersionSkipped, 0.0
IniRead, strLatestSkippedBeta, %g_strIniFile%, Global, LatestVersionSkippedBeta, 0.0
IniRead, strLatestUsedProd, %g_strIniFile%, Global, LastVersionUsedProd, 0.0
IniRead, strLatestUsedBeta, %g_strIniFile%, Global, LastVersionUsedBeta, 0.0
IniRead, strLatestUsedAlpha, %g_strIniFile%, Global, LastVersionUsedAlpha, 0.0

IniRead, intStartups, %g_strIniFile%, Global, Startups, 1

if (A_ThisMenuItem <> lMenuUpdateAmpersand)
{
	if Time2Donate(intStartups, g_blnDonor)
	{
		MsgBox, 36, % l(lDonateCheckTitle, intStartups, g_strAppNameText)
			, % l(lDonateCheckPrompt . "`n`n" . L(lDonateCheckPrompt2, lDonateCheckPrompt3), g_strAppNameText, intStartups)
		IfMsgBox, Yes
			Gosub, GuiDonate
	}
	IniWrite, % (intStartups + 1), %g_strIniFile%, Global, Startups
}

blnSetup := (FileExist(A_ScriptDir . "\_do_not_remove_or_rename.txt") = "" ? 0 : 1)

FileGetTime, strShell32Date, %A_WinDir%\System32\shell32.dll
FileGetTime, strImageresDate, %A_WinDir%\System32\imageres.dll

strLatestVersions := Url2Var(strUrlCheck4Update
	. "?v=" . g_strCurrentVersion
	. "&os=" . GetOSVersion()
	. "&is64=" . A_Is64bitOS
	. "&setup=" . (blnSetup)
				+ (2 * (g_blnDonor ? 1 : 0))
				+ (4 * (g_intActiveFileManager = 2 ? 1 : 0)) ; DirectoryOpus
				+ (8 * (g_intActiveFileManager = 3 ? 1 : 0)) ; TotalCommander
				+ (16 * (g_intActiveFileManager = 4 ? 1 : 0)) ; QAPconnect
	. "&lsys=" . A_Language
	. "&lfp=" . g_strLanguageCode
	. "&shd=" . strShell32Date
	. "&ird=" . strImageresDate)
if !StrLen(strLatestVersions)
	if (A_ThisMenuItem = lMenuUpdateAmpersand)
	{
		Oops(lUpdateError)
		gosub, Check4UpdateCleanup
		return ; an error occured during ComObjCreate
	}

strLatestVersions := SubStr(strLatestVersions, InStr(strLatestVersions, "[[") + 2) 
strLatestVersions := SubStr(strLatestVersions, 1, InStr(strLatestVersions, "]]") - 1) 
strLatestVersions := Trim(strLatestVersions, "`n`l") ; remove en-of-line if present
Loop, Parse, strLatestVersions, , 0123456789.| ; strLatestVersions should only contain digits, dots and one pipe (|) between prod and beta versions
	; if we get here, the content returned by the URL above is wrong
	if (A_ThisMenuItem <> lMenuUpdateAmpersand)
	{
		gosub, Check4UpdateCleanup
		return ; return silently
	}
	else
	{
		Oops(lUpdateError) ; return with an error message
		gosub, Check4UpdateCleanup
		return
	}

StringSplit, arrLatestVersions, strLatestVersions, |
strLatestVersionProd := arrLatestVersions1
strLatestVersionBeta := arrLatestVersions2
strLatestVersionAlpha := arrLatestVersions3

/*
if (strLatestUsedAlpha <> "0.0")
{
	if FirstVsSecondIs(strLatestVersionAlpha, g_strCurrentVersion) = 1
	{
		SetTimer, Check4UpdateChangeButtonNames, 50

		MsgBox, 3, % l(lUpdateTitle, g_strAppNameText) ; do not add Alpha to keep buttons rename working
			, % l(lUpdatePromptAlpha, g_strAppNameText, g_strCurrentVersion, strLatestVersionAlpha)
		IfMsgBox, Yes
			Run, %strAlphaLandingPage%
		IfMsgBox, Cancel ; Remind me
			IniWrite, 0.0, %g_strIniFile%, Global, LatestVersionSkippedAlpha
		IfMsgBox, No
		{
			IniWrite, %strLatestVersionAlpha%, %g_strIniFile%, Global, LatestVersionSkippedAlpha
			MsgBox, 4, % l(lUpdateTitle, g_strAppNameText . " Alpha"), %lUpdatePromptAlphaContinue%
			IfMsgBox, No
				IniWrite, 0.0, %g_strIniFile%, Global, LastVersionUsedAlpha
		}
	}
}
*/

; ###_V(strLatestVersions, g_strCurrentVersion, strLatestUsedBeta, strLatestSkippedBeta, strLatestVersionProd, strLatestVersionBeta, strLatestVersionAlpha)
if (strLatestUsedBeta <> "0.0")
{
	if (FirstVsSecondIs(strLatestSkippedBeta, strLatestVersionBeta) >= 0 and (A_ThisMenuItem <> lMenuUpdateAmpersand))
	{
		gosub, Check4UpdateCleanup
		return
	}

	if FirstVsSecondIs(strLatestVersionBeta, g_strCurrentVersion) = 1
	{
		SetTimer, Check4UpdateChangeButtonNames, 50

		MsgBox, 3, % l(lUpdateTitle, g_strAppNameText) ; do not add BETA to keep buttons rename working
			, % l(lUpdatePromptBeta, g_strAppNameText, g_strCurrentVersion, strLatestVersionBeta)
		IfMsgBox, Yes
			Run, %strBetaLandingPage%
		IfMsgBox, Cancel ; Remind me
			IniWrite, 0.0, %g_strIniFile%, Global, LatestVersionSkippedBeta
		IfMsgBox, No
		{
			IniWrite, %strLatestVersionBeta%, %g_strIniFile%, Global, LatestVersionSkippedBeta
			MsgBox, 4, % l(lUpdateTitle, g_strAppNameText . " BETA"), %lUpdatePromptBetaContinue%
			IfMsgBox, No
				IniWrite, 0.0, %g_strIniFile%, Global, LastVersionUsedBeta
		}
	}
}

; ###_V(strLatestVersions, g_strCurrentVersion, strLatestSkippedProd, strLatestVersionProd, strLatestVersionBeta, strLatestVersionAlpha)
if (FirstVsSecondIs(strLatestSkippedProd, strLatestVersionProd) >= 0 and (A_ThisMenuItem <> lMenuUpdateAmpersand))
{
	gosub, Check4UpdateCleanup
	return
}

if FirstVsSecondIs(strLatestVersionProd, g_strCurrentVersion) = 1
/*
{
	SetTimer, Check4UpdateChangeButtonNames, 50

	MsgBox, 3, % l(lUpdateTitle, g_strAppNameText)
		, % l(lUpdatePrompt, g_strAppNameText, g_strCurrentVersion, strLatestVersionProd)
	IfMsgBox, Yes
		Run, %strAppLandingPage%
	IfMsgBox, No
		IniWrite, %strLatestVersionProd%, %g_strIniFile%, Global, LatestVersionSkipped ; do not add "Prod" to ini variable for backward compatibility
	IfMsgBox, Cancel ; Remind me
		IniWrite, 0.0, %g_strIniFile%, Global, LatestVersionSkipped ; do not add "Prod" to ini variable for backward compatibility
}
*/
	gosub, Check4UpdateDialogProd
	
else if (A_ThisMenuItem = lMenuUpdateAmpersand) or (A_ThisLabel = "Check4UpdateNow")
{
	MsgBox, 4, % l(lUpdateTitle, g_strAppNameText), % l(lUpdateYouHaveLatest, g_strAppVersion, g_strAppNameText)
	IfMsgBox, Yes
		Run, %g_strUrlAppLandingPage%
}

Check4UpdateCleanup:
strLatestSkippedProd := ""
strLatestSkippedBeta := ""
strLatestUsedProd := ""
strLatestUsedBeta := ""
strLatestUsedAlpha := ""
intStartups := ""
strShell32Date := ""
strImageresDate := ""

return 
;------------------------------------------------------------


;------------------------------------------------------------
FirstVsSecondIs(strFirstVersion, strSecondVersion)
;------------------------------------------------------------
{
	; ###_V(A_ThisFunc, strFirstVersion, strSecondVersion)
	; To make the two strings comparable by < and > operators 
	; RegExReplace(..., "[^.]") removes all but dots
	; StrLen() counts number of dots in version number
	; the loop add ".0" until we have 4 dots (eg "0.0.0.0.0")
	loop, % 4 - StrLen(RegExReplace(strFirstVersion, "[^.]"))
		strFirstVersion .= ".0"
	loop, % 4 - StrLen(RegExReplace(strSecondVersion, "[^.]"))
		strSecondVersion .= ".0"

	if (strFirstVersion > strSecondVersion)
		return 1 ; greater
	else if (strFirstVersion < strSecondVersion)
		return -1 ; smaller
	else
		return 0 ; equal
}
;------------------------------------------------------------;------------------------------------------------------------
Check4UpdateChangeButtonNames:
;------------------------------------------------------------

IfWinNotExist, % l(lUpdateTitle, g_strAppNameText)
    return  ; Keep waiting.
SetTimer, Check4UpdateChangeButtonNames, Off
WinActivate
ControlSetText, Button3, %lUpdateButtonRemind%

return
;------------------------------------------------------------


;------------------------------------------------------------
Time2Donate(intStartups, g_blnDonor)
;------------------------------------------------------------
{
	return !Mod(intStartups, 20) and (intStartups > 40) and !(g_blnDonor)
}
;------------------------------------------------------------


;------------------------------------------------------------
Check4UpdateDialogProd:
;------------------------------------------------------------

strChangeLog := Url2Var("http://www.quickaccesspopup.com/changelog/changelog.txt")

intPos := InStr(strChangeLog, "Version: " . strLatestVersionProd . " ")
strChangeLog := SubStr(strChangeLog, intPos)
intPos := InStr(strChangeLog, "`n`n")
strChangeLog := SubStr(strChangeLog, 1, intPos - 1)

Gui, Update:New, , % L(lUpdateTitle, g_strAppNameText)
; Do not use g_strMenuBackgroundColor here because it is not set yet

Gui, Update:Font, s10 w700, Verdana
Gui, Update:Add, Text, x10 y10 w640, % L(lUpdateTitle, g_strAppNameText)
Gui, Update:Font
Gui, Update:Add, Text, x10 w640, % l(lUpdatePrompt, g_strAppNameText, g_strCurrentVersion, strLatestVersionProd)
Gui, Update:Add, Edit, x8 y+10 w640 h300 ReadOnly, %strChangeLog%
Gui, Update:Font

Gui, Update:Add, Button, y+20 x10 vf_btnCheck4UpdateDialogChangeLog gButtonCheck4UpdateDialogChangeLog, %lUpdateButtonChangeLog%
Gui, Update:Add, Button, yp x+20 vf_btnCheck4UpdateDialogVisit gButtonCheck4UpdateDialogVisit, %lUpdateButtonVisit%

GuiCenterButtons(L(lUpdateTitle, g_strAppNameText), 10, 5, 20, "f_btnCheck4UpdateDialogChangeLog", "f_btnCheck4UpdateDialogVisit")

Gui, Update:Add, Button, y+20 x10 vf_btnCheck4UpdateDialogDownloadSetup gButtonCheck4UpdateDialogDownloadSetup, %lUpdateButtonDownloadSetup%
Gui, Update:Add, Button, yp x+20 vf_btnCheck4UpdateDialogDownloadPortable gButtonCheck4UpdateDialogDownloadPortable, %lUpdateButtonDownloadPortable%

GuiCenterButtons(L(lUpdateTitle, g_strAppNameText), 10, 5, 20, "f_btnCheck4UpdateDialogDownloadSetup", "f_btnCheck4UpdateDialogDownloadPortable")

Gui, Update:Add, Button, y+20 x10 vf_btnCheck4UpdateDialogSkipVersion gButtonCheck4UpdateDialogSkipVersion, %lUpdateButtonSkipVersion%
Gui, Update:Add, Button, yp x+20 vf_btnCheck4UpdateDialogRemind gButtonCheck4UpdateDialogRemind, %lUpdateButtonRemind%
Gui, Update:Add, Text

GuiCenterButtons(L(lUpdateTitle, g_strAppNameText), 10, 5, 20, "f_btnCheck4UpdateDialogSkipVersion", "f_btnCheck4UpdateDialogRemind")

GuiControl, Focus, f_btnCheck4UpdateDialogDownloadSetup
Gui, Update:Show, AutoSize Center

return
;------------------------------------------------------------


;------------------------------------------------------------
ButtonCheck4UpdateDialogChangeLog:
ButtonCheck4UpdateDialogVisit:
ButtonCheck4UpdateDialogDownloadSetup:
ButtonCheck4UpdateDialogDownloadPortable:
ButtonCheck4UpdateDialogSkipVersion:
ButtonCheck4UpdateDialogRemind:
UpdateGuiClose:
UpdateGuiEscape:
;------------------------------------------------------------

strUrlChangeLog := "http://www.quickaccesspopup.com/change-log/"
strUrlDownloadSetup := "http://www.quickaccesspopup.com/latest/check4update-download-setup-redirect.html"
strUrlDownloadPortable:= "http://www.quickaccesspopup.com/latest/check4update-download-portable-redirect.html"

if InStr("ButtonCheck4UpdateDialogChangeLog|ButtonCheck4UpdateDialogVisit|ButtonCheck4UpdateDialogDownloadSetup|ButtonCheck4UpdateDialogDownloadPortable", A_ThisLabel)
{
	if (A_ThisLabel = "ButtonCheck4UpdateDialogChangeLog")
		Run, %strUrlChangeLog%
	else if (A_ThisLabel = "ButtonCheck4UpdateDialogVisit")
		Run, %g_strUrlAppLandingPage%
	else if (A_ThisLabel = "ButtonCheck4UpdateDialogDownloadSetup")
		Run, %strUrlDownloadSetup%
	else if (A_ThisLabel = "ButtonCheck4UpdateDialogDownloadPortable")
		Run, %strUrlDownloadPortable%
}
else ; UpdateGuiClose, UpdateGuiEscape, ButtonCheck4UpdateDialogRemind or ButtonCheck4UpdateDialogSkipVersion
{
	if (A_ThisLabel = "ButtonCheck4UpdateDialogSkipVersion")
		IniWrite, %strLatestVersionProd%, %g_strIniFile%, Global, LatestVersionSkipped ; do not add "Prod" to ini variable for backward compatibility
	else ; ButtonCheck4UpdateDialogRemind, UpdateGuiClose or UpdateGuiEscape
		IniWrite, 0.0, %g_strIniFile%, Global, LatestVersionSkipped ; do not add "Prod" to ini variable for backward compatibility

	Gui, Destroy
}

Check4UpdateDialogCleanup:
strChangelog := ""
strUrlChangeLog := ""
strUrlDownloadSetup := ""
strUrlDownloadPortable:= ""

return
;------------------------------------------------------------


;------------------------------------------------------------
SwitchSettings:
;------------------------------------------------------------

if SettingsUnsaved()
{
	Oops(lImpExpUnsavedSettings)
	return
}

IniRead, strSwitchSettingsFolder, %g_strIniFile%, Global, SwitchSettingsFolder, %A_WorkingDir%

FileSelectFile, g_strSwitchSettingsFile, 3, %strSwitchSettingsFolder%, %lDialogSwitchSettings%, *.ini
if !(StrLen(g_strSwitchSettingsFile))
	return

SplitPath, g_strSwitchSettingsFile, , strSwitchSettingsFolder, strSwitchSettingsExt
if !StrLen(strSwitchSettingsExt)
	g_strSwitchSettingsFile .= ".ini"
IniWrite, %strSwitchSettingsFolder%, %g_strIniFile%, Global, SwitchSettingsFolder

IniRead, strIniSettingsGlobal, %g_strSwitchSettingsFile%, Global, , %A_Space%
IniRead, strIniSettingsFavorite1, %g_strSwitchSettingsFile%, Favorites, Favorite1, %A_Space%
if !StrLen(strIniSettingsGlobal) or !StrLen(strIniSettingsFavorite1)
{
	Oops(lDialogSettingsInvalid, "[Global]", "[Favorites]", g_strSwitchSettingsFile)
	return
}

MsgBox, 52, %g_strAppNameText%, % L(lDialogSwitchSettingsReady, g_strSwitchSettingsFile, g_strAppNameText)
IfMsgBox, Yes
	Gosub, ReloadQAPSwitch
IfMsgBox, No
	Oops(lDialogSwitchSettingsCancel, g_strIniFile)

strSwitchSettingsFolder := ""
strSwitchSettingsExt := ""
strIniSettingsGlobal := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
ImportExport:
;------------------------------------------------------------

if SettingsUnsaved()
{
	Oops(lImpExpUnsavedSettings)
	return
}

Gui, ImpExp:New, , % L(lImpExpTitle, g_strAppNameText)
if (g_blnUseColors)
	Gui, ImpExp:Color, %g_strGuiWindowColor%

Gui, ImpExp:Font, w700
Gui, ImpExp:Add, Radio, y+20 x10 w130 vf_radImpExpExport gImpExpClicked Checked Group, %lImpExpExport%
Gui, ImpExp:Add, Radio, x150 yp w130 vf_radImpExpImport gImpExpClicked, %lImpExpImport%

Gui, ImpExp:Font, w700
Gui, ImpExp:Add, Text, y+20 x10 w400 vf_lblImpExpFile, % L(lImpExpFile, lImpExpDestination)
Gui, ImpExp:Font
Gui, ImpExp:Add, Edit, x10 w320 h20 vf_strImpExpFile
Gui, ImpExp:Add, Button, x+10 yp vf_btnImpExpFile gButtonImpExpFile, %lDialogBrowseButton%

Gui, ImpExp:Font, w700
Gui, ImpExp:Add, Text, y+20 x10 w400 vf_lblImpExpOptions, %lImpExpExport%
Gui, ImpExp:Font

Gui, ImpExp:Add, CheckBox, y+10 x10 w400 vf_blnImpExpFavorites Checked, %lImpExpOptionFavorites%
Gui, ImpExp:Add, CheckBox, y+10 x10 w400 vf_blnImpExpHotkeys Checked, %lImpExpOptionHotkeys%
Gui, ImpExp:Add, CheckBox, y+10 x10 w400 vf_blnImpExpAlternative Checked, %lImpExpOptionAlternative%
Gui, ImpExp:Add, Checkbox, y+10 x10 w400 vf_blnImpExpGlobal Checked, %lImpExpFileGlobal%
Gui, ImpExp:Add, Checkbox, y+10 x10 w400 vf_blnImpExpThemes Checked, %lImpExpFileThemes%

Gui, ImpExp:Add, Button, y+20 x10 vf_btnImpExpGo gButtonImpExpGo default, %lImpExpExportAmpersand%
Gui, ImpExp:Add, Button, yp x+20 vf_btnImpExpClose gButtonImpExpClose, %lGuiCloseAmpersand%
GuiCenterButtons(L(lImpExpTitle, g_strAppNameText), 10, 5, 20, "f_btnImpExpGo", "f_btnImpExpClose")
Gui, ImpExp:Add, Text

; GuiControl, Focus, f_btnCheck4UpdateDialogDownloadSetup
gosub, ImpExpClicked
Gui, ImpExp:Show, AutoSize Center

return
;------------------------------------------------------------


;------------------------------------------------------------
ImpExpClicked:
;------------------------------------------------------------
Gui, ImpExp:Submit, NoHide

GuiControl, , f_lblImpExpFile, % L(lImpExpFile, (f_radImpExpExport ? lImpExpDestination : lImpExpSource))
GuiControl, , f_lblImpExpOptions, % L(f_radImpExpExport ? lImpExpExport : lImpExpImport)
GuiControl, , f_btnImpExpGo, % L(f_radImpExpExport ? lImpExpExportAmpersand : lImpExpImportAmpersand)

if (f_radImpExpExport)
	IniRead, strImpExpFile, %g_strIniFile%, Global, LastExportFile, %A_Space% ; empty if not found
else
	strImpExpFile := ""
GuiControl, , f_strImpExpFile, %strImpExpFile%

return
;------------------------------------------------------------


;------------------------------------------------------------
ButtonImpExpFile:
;------------------------------------------------------------
Gui, ImpExp:Submit, NoHide
Gui, ImpExp:+OwnDialogs

IniRead, strImpExpFolder, %g_strIniFile%, Global, % "Last" . (f_radImpExpExport ? "Ex" : "Im") . "portFolder", %A_WorkingDir%

FileSelectFile, strImpExpSelectedFile, % (f_radImpExpExport ? 2 : 3), %strImpExpFolder%, %lDialogAddFolderSelect%, *.ini
if !(StrLen(strImpExpSelectedFile))
	return

if !StrLen(GetFileExtension(strImpExpSelectedFile))
	strImpExpSelectedFile .= ".ini"

GuiControl, ImpExp:, f_strImpExpFile, %strImpExpSelectedFile%

strImpExpFolder := ""
strImpExpSelectedFile := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
ButtonImpExpGo:
;------------------------------------------------------------
Gui, ImpExp:Submit, NoHide

blnAbort := false
blnContentTransfered := false
blnContentIdentical := false

if (f_radImpExpExport)
{
	StringReplace, strImpExpFile, f_strImpExpFile, % "%A_Now%", %A_Now%
	StringReplace, strImpExpFile, strImpExpFile, % "%A_NowUTC%", %A_NowUTC%
}
else
	strImpExpFile := f_strImpExpFile

g_strImpExpSourceFile := (f_radImpExpExport ? g_strIniFile : strImpExpFile)
g_strImpExpDestinationFile := (f_radImpExpExport ? strImpExpFile : g_strIniFile)

SplitPath, g_strImpExpDestinationFile, , strImpExpFolder, strImpExpExt
if !StrLen(strImpExpExt) ; add ini to destination file
	g_strImpExpDestinationFile .= ".ini"
strImEx := (f_radImpExpExport ? "Ex" : "Im")
IniWrite, %strImpExpFolder%, %g_strIniFile%, Global, Last%strImEx%portFolder
if (f_radImpExpExport)
	IniWrite, % f_strImpExpFile, %g_strIniFile%, Global, LastExportFile ; store f_strImpExpFile, not strImpExpFile that may contain current time

if !(blnAbort) and (f_blnImpExpFavorites)
{
	blnReplace := false
	IniRead, strFavorite, %g_strImpExpDestinationFile%, Favorites, Favorite1 ; ERROR if not found
	if (strFavorite <> "ERROR")
	{
		SetTimer, ImpExpChangeButtonNames, 50
		MsgBox, 3, %lImpExpMenu% %lImpExpFavorites% - %g_strAppNameText%, % L(lImpExpReplaceFavorites, g_strImpExpDestinationFile)
		IfMsgBox, Yes
			blnReplace := true
		IfMsgBox, Cancel
			return

		if !(blnReplace) ; append
		{
			; get last index number
			Loop
			{
				IniRead, strAppendFavorite, %g_strImpExpDestinationFile%, Favorites, Favorite%A_Index%
				if (strAppendFavorite = "ERROR")
				{
					intLastFavorite := A_Index
					Break
				}
			}
			intLastFavorite -= 2 ; minus one for "ERROR" and mminus one to overwrite "Z" (end of menu) that will be re-inserted in the import
			intIniLine := 0
			Loop
			{
				intIniLine++
				IniRead, strAppendFavorite, %g_strImpExpSourceFile%, Favorites, Favorite%intIniLine% ; ERROR if not found
				if (strAppendFavorite = "ERROR")
					Break
				intDestintIniLine := intIniLine + intLastFavorite
				IniWrite, %strAppendFavorite%, %g_strImpExpDestinationFile%, Favorites, Favorite%intDestintIniLine%
			}
			blnContentTransfered := (intIniLine > 0)
		}
	}
	
	if (strFavorite = "ERROR" or blnReplace)
		WriteIniSection("Favorites", "", blnAbort, blnContentTransfered, blnContentIdentical) ; update blnAbort, blnContentTransfered and blnContentIdentical
}

if (f_blnImpExpGlobal)
	WriteIniSection("Global", lImpExpFileGlobal, blnAbort, blnContentTransfered, blnContentIdentical) ; update blnAbort, blnContentTransfered and blnContentIdentical

if (f_blnImpExpHotkeys)
	WriteIniSection("LocationHotkeys", lImpExpOptionHotkeys, blnAbort, blnContentTransfered, blnContentIdentical) ; update blnAbort, blnContentTransfered and blnContentIdentical

if (f_blnImpExpAlternative)
	WriteIniSection("AlternativeMenuHotkeys", "", blnAbort, blnContentTransfered, blnContentIdentical) ; update blnAbort, blnContentTransfered and blnContentIdentical

if (f_blnImpExpThemes)
{
	IniRead, strThemesList, %g_strImpExpSourceFile%, Global, AvailableThemes ; ERROR if not found
	if (strThemesList = "ERROR")
		Oops(lImpExpNoThemes, "AvailableThemes=", "[Global]", g_strImpExpSourceFile)
	else
		Loop, Parse, strThemesList, |
			WriteIniSection("Gui-" . A_LoopField, "", blnAbort, blnContentTransfered, blnContentIdentical) ; update blnAbort, blnContentTransfered and blnContentIdentical
}

if (f_radImpExpExport)
	MsgBox, 0, %g_strAppNameText%
		, % L(lImpExpFinalReport, (blnAbort or !blnContentTransfered ? lImpExpAborted : lImpExpCompleted) . (blnContentIdentical ? " " . lImpExpOrIdentical : ""), g_strImpExpSourceFile, g_strImpExpDestinationFile)
else
{
	if (blnAbort or !blnContentTransfered)
		MsgBox, 0, %g_strAppNameText%, % L(lImpExpFinalReport, lImpExpAborted . (blnContentIdentical ? " " . lImpExpOrIdentical : ""), g_strImpExpSourceFile, g_strImpExpDestinationFile)
	else
	{
		MsgBox, 52, %g_strAppNameText%, % L(lImpExpFinalReport, lImpExpCompleted . (blnContentIdentical ? " " . lImpExpOrIdentical : ""), g_strImpExpSourceFile, g_strImpExpDestinationFile)
			. "`n`n" . L(lImpExpRestartApp, g_strAppNameText)
		IfMsgBox, Yes
			Gosub, ReloadQAP
	}
}

g_strImpExpSourceFile := ""
g_strImpExpDestinationFile := ""
intIniLine := ""
strFavorite := ""
blnAbort := ""
blnReplace := ""
intLastFavorite := ""
strAppendFavorite := ""
strImpExpFolder := ""
strImpExpFile := ""
strImpExpExt := ""
strImEx := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
WriteIniSection(strSectionName, strDescription, ByRef blnAbort, ByRef blnContentTransfered, ByRef blnContentIdentical)
;------------------------------------------------------------
{
	global g_strAppNameText
	global g_strImpExpSourceFile
	global g_strImpExpDestinationFile
	
	if blnAbort
		return

	blnReplaceOK := false
	
	IniRead, strSourceIniSection, %g_strImpExpSourceFile%, %strSectionName%, , %A_Space% ; empty if not found
	if !StrLen(strSourceIniSection)
	{
		if StrLen(strDescription)
			Oops(lImpExpSectionNotFound, g_strImpExpSourceFile, strSectionName, strDescription)
		return
	}

	IniRead, strDestIniSection, %g_strImpExpDestinationFile%, %strSectionName%, , %A_Space% ; empty if not found

	if StrLen(strDestIniSection) and (strSourceIniSection <> strDestIniSection)
	{
		MsgBox, 3, %lImpExpMenu% - %g_strAppNameText%, % L(lImpExpReplaceSection, g_strImpExpDestinationFile, strSectionName, SubStr(strDestIniSection, 1, 200) . (StrLen(strDestIniSection) > 200 ? "`n..." : ""))
		IfMsgBox, Yes
			blnReplaceOK := true
		IfMsgBox, Cancel
			blnAbort := true
	}
	
	if (strSourceIniSection = strDestIniSection)
		blnContentIdentical := true
	
	if (strSourceIniSection <> strDestIniSection) and (!StrLen(strDestIniSection) or blnReplaceOK)
	{
		IniWrite, %strSourceIniSection%, %g_strImpExpDestinationFile%, %strSectionName%
		blnContentTransfered := true
	}
}
;------------------------------------------------------------


;------------------------------------------------------------
ButtonImpExpClose:
;------------------------------------------------------------

Gui, ImpExp:Destroy

return
;------------------------------------------------------------


;------------------------------------------------------------
ImpExpChangeButtonNames:
;------------------------------------------------------------

IfWinNotExist, %lImpExpMenu% %lImpExpFavorites% - %g_strAppNameText%
    return  ; Keep waiting.

SetTimer, ImpExpChangeButtonNames, Off
WinActivate

ControlSetText, Button1, %lImpExpReplaceAll%
ControlSetText, Button2, %lImpExpAppend%

return
;------------------------------------------------------------



;========================================================================================================================
; END OF TRAY MENU ACTIONS
;========================================================================================================================



;========================================================================================================================
!_078_ABOUT-DONATE-HELP:
;========================================================================================================================

;------------------------------------------------------------
GuiAbout:
;------------------------------------------------------------

g_intGui1WinID := WinExist("A")
Gui, 1:Submit, NoHide

Gui, 2:New, , % L(lAboutTitle, g_strAppNameText, g_strAppVersion)
if (g_blnUseColors)
	Gui, 2:Color, %g_strGuiWindowColor%
Gui, 2:+Owner1
Gui, 2:Font, s12 w700, Verdana
Gui, 2:Add, Link, y10 w380, % L(lAboutText1, g_strAppNameText, g_strAppVersion, A_PtrSize * 8) ;  ; A_PtrSize * 8 = 32 or 64
Gui, 2:Font, s8 w400, Verdana
Gui, 2:Add, Link, w380, % L(lAboutText2, g_strAppNameText)
FormatTime, strYear, , yyyy ; current time
Gui, 2:Add, Link, w380, % L(lAboutText3, chr(169), strYear)
Gui, 2:Add, Text, w380, % L(lAboutUserComputerName, A_UserName, A_ComputerName)
Gui, 2:Font, s10 w400, Verdana
Gui, 2:Add, Link, w380, % L(lAboutText4)
Gui, 2:Font, s8 w400, Verdana

Gui, 2:Add, Button, y+20 vf_btnAboutDonate gGuiDonate, %lDonateButtonAmpersand%
Gui, 2:Add, Button, yp vf_btnAboutClose g2GuiClose, %lGuiCloseAmpersand%
GuiCenterButtons(L(lAboutTitle, g_strAppNameText, g_strAppVersion), 10, 5, 20, "f_btnAboutDonate", "f_btnAboutClose")

GuiControl, Focus, f_btnAboutClose
Gosub, ShowGui2AndDisableGui1

strYear := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
GuiDonate:
;------------------------------------------------------------

g_intGui1WinID := WinExist("A")
Gui, 1:Submit, NoHide

Gui, 2:New, , % L(lDonateTitle, g_strAppNameText, g_strAppVersion)
if (g_blnUseColors)
	Gui, 2:Color, %g_strGuiWindowColor%
Gui, 2:+Owner1
Gui, 2:Font, s12 w700, Verdana
Gui, 2:Add, Link, y10 w420, % L(lDonateText1, g_strAppNameText)
Gui, 2:Font, s8 w400, Verdana
Gui, 2:Add, Link, x175 w185 y+10, % L(lDonateText2, "http://www.quickaccesspopup.com/why-support-freeware/")
loop, 3
{
	Gui, 2:Add, Button, % (A_Index = 1 ? "y+10 Default vbtnDonateDefault " : "") . " xm w150 gButtonDonate" . A_Index, % lDonatePlatformName%A_Index%
	Gui, 2:Add, Link, x+10 w235 yp, % lDonatePlatformComment%A_Index%
}
; Gui, 2:Add, Button, y+10 Default vbtnDonateDefault xm w150 gButtonDonate2, %lDonatePlatformName2% ; Patreon out
; Gui, 2:Add, Link, x+10 w235 yp, %lDonatePlatformComment2% ; Patreon out
; Gui, 2:Add, Button, y+10 Default xm w150 gButtonDonate1, %lDonatePlatformName1%
; Gui, 2:Add, Link, x+10 w235 yp, %lDonatePlatformComment1%

Gui, 2:Add, Link, xm y+15 w420, % L(lDonateCheckPrompt2, lDonateCheckPrompt4)

Gui, 2:Font, s10 w700, Verdana
Gui, 2:Add, Link, xm y+20 w420, %lDonateText3%
Gui, 2:Font, s8 w400, Verdana
Gui, 2:Add, Link, xm y+10 w420 Section, % L(lDonateText4, g_strAppNameText)

strDonateReviewUrlLeft1 := "http://download.cnet.com/Quick-Access-Popup/3000-2344_4-76475848.html"
strDonateReviewUrlLeft2 := "http://www.portablefreeware.com/index.php?id=2765"
strDonateReviewUrlLeft3 := "http://www.softpedia.com/get/System/OS-Enhancements/FoldersPopup.shtml"
strDonateReviewUrlRight1 := "http://fileforum.betanews.com/detail/Quick-Access-Popup/1455462511/1"
strDonateReviewUrlRight2 := "http://www.filecluster.com/System-Utilities/Launchers-Task-Manager-Utilities/Download-Quick-Access-Popup.html"
strDonateReviewUrlRight3 := "http://freewares-tutos.blogspot.ca/2016/05/quick-access-popup-accedez-rapidement.html"

loop, 3
	Gui, 2:Add, Link, % (A_Index = 1 ? "ys+20" : "y+5") . " x25 w150", % "<a href=""" . strDonateReviewUrlLeft%A_Index% . """>" . lDonateReviewNameLeft%A_Index% . "</a>"

loop, 3
	Gui, 2:Add, Link, % (A_Index = 1 ? "ys+20" : "y+5") . " x175 w150", % "<a href=""" . strDonateReviewUrlRight%A_Index% . """>" . lDonateReviewNameRight%A_Index% . "</a>"

Gui, 2:Add, Link, y+10 x130, <a href="http://www.quickaccesspopup.com/why-support-freeware/">%lDonateText5%</a>

Gui, 2:Font, s8 w400, Verdana
Gui, 2:Add, Button, x175 y+20 g2GuiClose vf_btnDonateClose, %lGuiCloseAmpersand%
GuiCenterButtons(L(lDonateTitle, g_strAppNameText, g_strAppVersion), 10, 5, 20, "f_btnDonateClose")

GuiControl, Focus, btnDonateDefault
Gosub, ShowGui2AndDisableGui1

strDonateReviewUrlLeft1 := ""
strDonateReviewUrlLeft2 := ""
strDonateReviewUrlLeft3 := ""
strDonateReviewUrlRight1 := ""
strDonateReviewUrlRight2 := ""
strDonateReviewUrlRight3 := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
ButtonDonate1:
ButtonDonate2:
ButtonDonate3:
;------------------------------------------------------------

strDonatePlatformUrl1 := "https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=TE8TR28QKM3Z8"
strDonatePlatformUrl2 := "https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=Y9VVGCBNJK5DQ"
strDonatePlatformUrl3 := "https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=DV4E4DYVWC5GC"

StringReplace, intButton, A_ThisLabel, ButtonDonate
Run, % strDonatePlatformUrl%intButton%

return
;------------------------------------------------------------


;------------------------------------------------------------
GuiHelp:
;------------------------------------------------------------

g_intGui1WinID := WinExist("A")
Gui, 1:Submit, NoHide

Gui, 2:New, , % L(lHelpTitle, g_strAppNameText, g_strAppVersion)
if (g_blnUseColors)
	Gui, 2:Color, %g_strGuiWindowColor%
Gui, 2:+Owner1
intWidth := 600
Gui, 2:Font, s12 w700, Verdana
Gui, 2:Add, Text, x10 y10, %g_strAppNameText%
Gui, 2:Font, s10 w400, Verdana
Gui, 2:Add, Link, x10 w%intWidth%, %lHelpTextLead%

Gui, 2:Font, s8 w600, Verdana
Gui, 2:Add, Tab2, vf_intHelpTab w640 h350 AltSubmit, %A_Space%%lHelpTabGettingStarted% | %lHelpTabAddingFavorite% | %lHelpTabQAPFeatures% | %lHelpTabSharedMenus% | %lHelpTabTipsAndTricks%%A_Space%

Gui, 2:Font, s8 w400, Verdana
Gui, 2:Tab, 1
Gui, 2:Add, Link, w%intWidth%, % L(lHelpText11, Hotkey2Text(g_arrPopupHotkeys1), Hotkey2Text(g_arrPopupHotkeys2))
Gui, 2:Add, Link, w%intWidth%, % lHelpText12
Gui, 2:Add, Link, w%intWidth%, % L(lHelpText13, Hotkey2Text(g_arrPopupHotkeys3), Hotkey2Text(g_arrPopupHotkeys4))
Gui, 2:Add, Link, w%intWidth%, % lHelpText14
Gui, 2:Add, Button, y+25 vf_btnNext1 gNextHelpButtonClicked, %lDialogTabNext%
GuiCenterButtons(L(lHelpTitle, g_strAppNameText, g_strAppVersion), 10, 5, 20, "f_btnNext1")

Gui, 2:Tab, 2
Gui, 2:Add, Link, w%intWidth%, % lHelpText21
Gui, 2:Add, Link, w%intWidth%, % lHelpText22
Gui, 2:Add, Link, w%intWidth%, % L(lHelpText23, Hotkey2Text(g_arrPopupHotkeys1), Hotkey2Text(g_arrPopupHotkeys2))
Gui, 2:Add, Button, y+25 vf_btnNext2 gNextHelpButtonClicked, %lDialogTabNext%
GuiCenterButtons(L(lHelpTitle, g_strAppNameText, g_strAppVersion), 10, 5, 20, "f_btnNext2")

Gui, 2:Tab, 3
Gui, 2:Add, Link, w%intWidth%, % lHelpText31
Gui, 2:Add, Link, w%intWidth% y+3, % lHelpText32
Gui, 2:Add, Link, w%intWidth%, % lHelpText33
Gui, 2:Add, Link, w%intWidth% y+3, % L(lHelpText34, Hotkey2Text(g_objHotkeysByNameLocation["|{Settings}"])) ; in name|location name is empty for QAP feature {Settings}
Gui, 2:Add, Button, y+25 vf_btnNext3 gNextHelpButtonClicked, %lDialogTabNext%
GuiCenterButtons(L(lHelpTitle, g_strAppNameText, g_strAppVersion), 10, 5, 20, "f_btnNext3")

Gui, 2:Tab, 4 ; has text numbered 51, 52, etc.
Gui, 2:Add, Link, w%intWidth%, % lHelpText51
StringSplit, arrSharedMenuTypes, lDialogExternalTypes, |
Gui, 2:Add, Link, y+2 w%intWidth%, - %arrSharedMenuTypes1%
Gui, 2:Add, Link, y+2 w%intWidth%, - %arrSharedMenuTypes2%
Gui, 2:Add, Link, y+2 w%intWidth%, - %arrSharedMenuTypes3%
Gui, 2:Add, Link, y+5 w%intWidth%, % lHelpText52
Gui, 2:Add, Link, y+5 w%intWidth%, % lHelpText53
Gui, 2:Add, Link, y+5 w%intWidth%, % lHelpText54
Gui, 2:Add, Button, y+25 vf_btnNext4 gNextHelpButtonClicked, %lDialogTabNext%
GuiCenterButtons(L(lHelpTitle, g_strAppNameText, g_strAppVersion), 10, 5, 20, "f_btnNext4")

Gui, 2:Tab, 5 ; has text numbered 41, 42, etc.
Gui, 2:Add, Link, w%intWidth%, % lHelpText41
Gui, 2:Add, Link, y+5 w%intWidth%, % lHelpText42
Gui, 2:Add, Link, y+5 w%intWidth%, % lHelpText43
Gui, 2:Add, Link, y+5 w%intWidth%, % lHelpText44
Gui, 2:Add, Link, y+5 w%intWidth%, % lHelpText45

Gui, 2:Tab
GuiControlGet, arrTabPos, Pos, f_intHelpTab
Gui, 2:Add, Button, % "x180 y" . arrTabPosY + arrTabPosH + 10. " vf_btnHelpDonate gGuiDonate", %lDonateButtonAmpersand%
Gui, 2:Add, Button, x+80 yp g2GuiClose vf_btnHelpClose, %lGuiCloseAmpersand%
GuiCenterButtons(L(lHelpTitle, g_strAppNameText, g_strAppVersion), 10, 5, 20, "f_btnHelpDonate", "f_btnHelpClose")

GuiControl, Focus, btnHelpClose
Gosub, ShowGui2AndDisableGui1

arrSharedMenuTypes := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
NextHelpButtonClicked:
;------------------------------------------------------------

Gui, 2:Submit, NoHide

GuiControl, Choose, f_intHelpTab, % f_intHelpTab + 1 ; f_intHelpTab is number of current tab

return
;------------------------------------------------------------



;========================================================================================================================
; END OF ABOUT-DONATE-HELP
;========================================================================================================================



;========================================================================================================================
!_080_THIRD-PARTY:
;========================================================================================================================


;------------------------------------------------------------
CheckActiveFileManager:
;------------------------------------------------------------

loop, 2
{
	intFileManager := A_Index + 1 ; 2 DirectoryOpus or 3 TotalCommander
	Gosub, CheckOneFileManager
	if (g_intActiveFileManager = intFileManager)
	{
		Gosub, CheckActiveFileManagerCleanUp
		return
	}
}

; if no other file manager was selected
g_intActiveFileManager := 1
IniWrite, 1, %g_strIniFile%, Global, ActiveFileManager

CheckActiveFileManagerCleanUp:
intFileManager := ""
strCheckOneFileManager := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
CheckOneFileManager:
;------------------------------------------------------------

strFileManagerSystemName := g_arrActiveFileManagerSystemNames%intFileManager%

strFileManagerDisplayName := g_arrActiveFileManagerDisplayNames%intFileManager%
if (intFileManager = 2) ; DirectoryOpus
{
	strCheckPath := A_ProgramFiles . "\GPSoftware\Directory Opus\dopus.exe"
	strCheckPathShort := "dopus.exe"
}
else ; 3 TotalCommander
{
	strCheckPath := GetTotalCommanderPath()
	strCheckPathShort := ""
}

blnFileExist := FileExist(strCheckPath)
if !(blnFileExist) and StrLen(strCheckPathShort)
	if FileExistInPath(strCheckPathShort) ; return strCheckPathShort expanded and searched in PATH
	{
		blnFileExist := true
		strCheckPath := strCheckPathShort ; expanded
	}
	
if (blnFileExist)
{
	MsgBox, 52, %g_strAppNameText%, % L(lDialogThirdPartyDetected, g_strAppNameText, strFileManagerDisplayName)
	IfMsgBox, Yes
	{
		g_intActiveFileManager := intFileManager
		IniWrite, %g_intActiveFileManager%, %g_strIniFile%, Global, ActiveFileManager
		g_str%strFileManagerSystemName%Path := strCheckPath
		
		Gosub, SetActiveFileManager
		
		IniWrite, % g_str%strFileManagerSystemName%Path, %g_strIniFile%, Global, %strFileManagerSystemName%Path
		g_bln%strFileManagerSystemName%UseTabs := true
		IniWrite, % g_bln%strFileManagerSystemName%UseTabs, %g_strIniFile%, Global, %strFileManagerSystemName%UseTabs
		
		if (g_intActiveFileManager = 2) ; DirectoryOpus
			g_strDirectoryOpusNewTabOrWindow := "NEWTAB" ; open new folder in a new lister tab
		else ; 3 TotalCommander
			g_strTotalCommanderNewTabOrWindow := "/O /T" ; to open in a new tab
		IniWrite, % g_str%strFileManagerSystemName%NewTabOrWindow, %g_strIniFile%, Global, %strFileManagerSystemName%NewTabOrWindow
	}
}

strFileManagerSystemName := ""
strFileManagerDisplayName := ""
strCheckPath := ""
strCheckPathShort := ""
blnFileExist := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
GetTotalCommanderPath()
;------------------------------------------------------------
{
	RegRead, strPath, HKEY_CURRENT_USER, Software\Ghisler\Total Commander\, InstallDir
	If !StrLen(strPath)
		RegRead, strPath, HKEY_LOCAL_MACHINE, Software\Ghisler\Total Commander\, InstallDir

	if FileExist(strPath . "\TOTALCMD64.EXE")
		strPath := strPath . "\TOTALCMD64.EXE"
	else
		strPath := strPath . "\TOTALCMD.EXE"
	return strPath
}
;------------------------------------------------------------


;------------------------------------------------------------
LoadIniQAPconnectValues:
;------------------------------------------------------------

/* QAPconnect.ini sample:
[EF Commander Free (v9.50)]
; http://www.softpedia.com/get/File-managers/EF-Commander-Free.shtml
AppPath=..\EF Commander Free\EFCommanderFreePortable.exe
CommandLine=/O /A=%Path%
NewTabSwitch=
CompanionPath=EFCWT.EXE
*/

IniRead, g_strQAPconnectAppPath, %g_strQAPconnectIniPath%, %g_strQAPconnectFileManager%, AppPath, %A_Space% ; empty by default
blnFileExist := FileExistInPath(g_strQAPconnectAppPath) ; return g_strQAPconnectAppPath expanded and searched in PATH
IniRead, g_strQAPconnectCommandLine, %g_strQAPconnectIniPath%, %g_strQAPconnectFileManager%, CommandLine, %A_Space% ; empty by default
IniRead, g_strQAPconnectNewTabSwitch, %g_strQAPconnectIniPath%, %g_strQAPconnectFileManager%, NewTabSwitch, %A_Space% ; empty by default
IniRead, g_strQAPconnectCompanionPath, %g_strQAPconnectIniPath%, %g_strQAPconnectFileManager%, CompanionPath, %A_Space% ; empty by default
if StrLen(g_strQAPconnectCompanionPath)
	blnFileExist := FileExistInPath(g_strQAPconnectCompanionPath) ; return g_strQAPconnectCompanionPath expanded and searched in PATH
SplitPath, g_strQAPconnectCompanionPath, g_strQAPconnectCompanionFilename

blnFileExist := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
SetActiveFileManager:
;------------------------------------------------------------

if (g_intActiveFileManager = 4) ; QAPconnect
{
	SplitPath, g_strQAPconnectAppPath, g_strQAPconnectAppFilename
	g_strQAPconnectWindowID := "ahk_exe " . g_strQAPconnectAppFilename ; ahk_exe worked with filename only, not with full exe path
}
else ; DirectoryOpus or TotalCommander
{
	strActiveFileManagerSystemName := g_arrActiveFileManagerSystemNames%g_intActiveFileManager%
	IniRead, g_str%strActiveFileManagerSystemName%NewTabOrWindow, %g_strIniFile%, Global, %strActiveFileManagerSystemName%NewTabOrWindow, %A_Space% ; should be already intialized here, empty if error

	if (g_intActiveFileManager = 2) ; DirectoryOpus
	{
		g_strDOpusTempFilePath := g_strTempDir . "\dopus-list.txt"
		StringReplace, g_strDirectoryOpusRtPath, g_strDirectoryOpusPath, \dopus.exe, \dopusrt.exe
	}

	; additional icon for DirectoryOpus and TotalCommander
	g_objJLiconsByName[strActiveFileManagerSystemName] := g_str%strActiveFileManagerSystemName%Path . ",1"
}

strActiveFileManagerSystemName := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
RunDOpusRt(strCommand, strLocation := "", strParam := "")
; put A_Space at the beginning of strParam if required - some param (like ",paths") must have no space 
;------------------------------------------------------------
{
	global g_strDirectoryOpusRtPath
	
	if (strCommand = "/info")
	{
		Process, Exist, dopus.exe
		; abord if DOpus.exe is not running
		if !(ErrorLevel)
			return
	}
	
	if FileExist(g_strDirectoryOpusRtPath) ; for safety only
		Run, % """" . g_strDirectoryOpusRtPath . """ " . strCommand . " """ . strLocation . """" . strParam
}
;------------------------------------------------------------


;========================================================================================================================
; END OF THIRD-PARTY
;========================================================================================================================



;========================================================================================================================
!_090_VARIOUS_COMMANDS:
return
;========================================================================================================================


;------------------------------------------------------------
GetCurrentLocation(strClass, strWinID)
; return current location in in Explorer, Directory Opus, Total Commander or file dialog box window identified by class and windows ID
;------------------------------------------------------------
{
	global g_strDOpusListText

	strLocation := ""
	
	if WindowIsExplorer(strClass) or WindowIsTotalCommander(strClass) or WindowIsDirectoryOpus(strClass)
		or WindowIsDialog(strClass, strWinID)
	{
		if WindowIsDirectoryOpus(strClass)
		{
			Gosub, RefreshDOpusListText
			objDOpusListers := CollectDOpusListersList(g_strDOpusListText) ; list all listers, excluding special folders like Recycle Bin
			
			; From leo @ GPSoftware (http://resource.dopus.com/viewtopic.php?f=3&t=23013):
			; Lines will have active_lister="1" if they represent tabs from the active lister.
			; To get the active tab you want the line with active_lister="1" and tab_state="1".
			; tab_state="1" means it's the selected tab, on the active side of the lister.
			; tab_state="2" means it's the selected tab, on the inactive side of a dual-display lister.
			; Tabs which are not visible (because another tab is selected on top of them) don't get a tab_state attribute at all.

			for intIndex, objLister in objDOpusListers
				if (objLister.active_lister = "1" and objLister.tab_state = "1") ; this is the active tab
				{
					strLocation := ComUnHTML(objLister.LocationURL) ; ComUnHTML convert HTML entities to text (like "&apos;")
					break
				}
		}
		else ; Explorer, TotalCommander or dialog boxes
		{
			; use the clipblard to get the current location from dialog box or Total Commander
			objPrevClipboard := ClipboardAll ; Save the entire clipboard
			ClipBoard := ""

			; Obsolete notes (since Shell.Application is used to get Explore current location) - but keep here anyway
			; With Explorer, the key sequence {F4}{Esc} selects the current location of the window.
			; With dialog boxes, the key sequence {F4}{Esc} generally selects the current location of the window. But, in some
			; dialog boxes, the {Esc} key closes the dialog box. We will check window title to detect this behavior.


			intTries := 3
			intWaitTimeIncrement := 150 ; time allowed to get title
			strAddThisFolderWindowTitle := ""
			Loop, %intTries%
			{
				Sleep, intWaitTimeIncrement * A_Index
				WinGetTitle, strAddThisFolderWindowTitle, A ; to check later if this window is closed unexpectedly
			} Until (StrLen(strAddThisFolderWindowTitle))
			strWindowActiveTitle := strAddThisFolderWindowTitle ; now these are the same... check later if the window was closed unexpectedly
			
			if WindowIsTotalCommander(strClass)
			{
				cm_CopySrcPathToClip := 2029
				SendMessage, 0x433, %cm_CopySrcPathToClip%, , , ahk_class TTOTAL_CMD ; put current locatin in Clipboard
				ClipWait, 1
				strLocation := Clipboard
			}
			else if WindowIsExplorer(strClass)
			{
				; Gets the active IE or Explorer window
				for objExplorer in ComObjCreate("Shell.Application").Windows
					if (objExplorer.HWND = strWinID)
					{
						strLocation :=  UriDecode(objExplorer.LocationURL)
						Break
					}
			}
			else ; dialog boxes
			{
				intTries := 3
				intWaitTimeIncrement := 300 ; time allowed for dialog boxes
				Loop, %intTries%
				{
					Sleep, intWaitTimeIncrement * A_Index
					SendInput, {F4}{Esc} ; F4 move the caret the "Go To A Different Folder box" and {Esc} select it content ({Esc} could be replaced by ^a to Select All)
					Sleep, intWaitTimeIncrement * A_Index
					SendInput, ^c ; Copy
					Sleep, intWaitTimeIncrement * A_Index
					WinGetTitle, strWindowActiveTitle, A ; to check if the window was closed unexpectedly
				} Until (StrLen(ClipBoard) or (strAddThisFolderWindowTitle <> strWindowActiveTitle))
				if (A_ThisLabel = "AddThisFolderXpress") ; escape from address bar
					SendInput, {Esc}
				strLocation := Clipboard
			}

			Clipboard := objPrevClipboard ; Restore the original clipboard
		}
	}

	return strLocation
}
;------------------------------------------------------------


;------------------------------------------------------------
AdjustColumnsWidth:
;------------------------------------------------------------

Loop, % LV_GetCount("Column")
	LV_ModifyCol(A_Index, "AutoHdr") ; adjust column width

/*
FOLLOWING NOT REQUIRED ANYMORE
when using option AutoHdr ("If applied to the last column, it will be made at least as wide as all the remaining space in the ListView.")

; See http://www.autohotkey.com/board/topic/6073-get-listview-column-width-with-sendmessage/
Loop, %intNbColAuto%
{
	intColZeroBased := A_Index - 1 ; column index, zero-based
	SendMessage, 0x1000+29, %intColZeroBased%, 0, SysListView321, ahk_id %g_strAppHwnd%
	intColSum += ErrorLevel ; column width
}

LV_ModifyCol(intNbColAuto + 1, g_intListW - intColSum - 21) ; adjust column width (-21 is for vertical scroll bar width)

intColSum := ""
*/

return
;------------------------------------------------------------


;------------------------------------------------------------
BackupIniFile:
;------------------------------------------------------------

; g_strIniFile contains the basic QAP ini file or an external menu settings ini file

; delete old backup files (keep only 5/10 most recent files)
StringReplace, strIniBackupFile, g_strIniFile, .ini, -backup-????????.ini
Loop, %strIniBackupFile%
	strFileList .= A_LoopFileFullPath . "`n"
Sort, strFileList, R
intNumberOfBackups := (g_strCurrentBranch = "beta" ? 10 : 5)
Loop, Parse, strFileList, `n
	if (A_Index > intNumberOfBackups)
		if StrLen(A_LoopField)
			FileDelete, %A_LoopField%

; create a daily backup of the ini file
StringReplace, strIniBackupFile, strIniBackupFile, ????????, % SubStr(A_Now, 1, 8)
if !FileExist(strIniBackupFile)
	FileCopy, %g_strIniFile%, %strIniBackupFile%, 1

strIniBackupFile := ""
strFileList := ""

return
;------------------------------------------------------------


;------------------------------------------------------------
EnableSaveAndCancel:
;------------------------------------------------------------

GuiControl, 1:Enable, f_btnGuiSaveAndCloseFavorites
GuiControl, 1:Enable, f_btnGuiSaveAndStayFavorites
GuiControl, 1:, f_btnGuiCancel, %lGuiCancelAmpersand%

return
;------------------------------------------------------------


;------------------------------------------------------------
SettingsNotSavedReturn()
;------------------------------------------------------------
{
	global g_strAppNameText
	global g_strGuiFullTitle
	
	GuiControlGet, blnCancelButtonEnabled, 1:Enabled, f_btnGuiCancel ; get Settings Cancel button enabled
	if !(blnCancelButtonEnabled) ; if not enabled, QAP is currently saving, return true to cancel menu display
		return true
		
	SetTimer, SettingsNotSavedChangeButtonNames, 50
	MsgBox, 3, % L(lDialogSettingsNotSavedTitle, g_strAppNameText), %lDialogSettingsNotSavedPrompt%
	IfMsgBox, No ; Settings
	{
		WinActivate, %g_strGuiFullTitle%
		return true
	}
	IfMsgBox, Cancel ; Cancel
		return true
	
	; else IfMsgBox, Yes - Save (and continue)
	gosub, GuiSaveAndDoNothing
	return false
}
;------------------------------------------------------------


;------------------------------------------------------------
SettingsNotSavedChangeButtonNames:
;------------------------------------------------------------

IfWinNotExist, % L(lDialogSettingsNotSavedTitle, g_strAppNameText)
    return  ; Keep waiting.
SetTimer, SettingsNotSavedChangeButtonNames, Off
WinActivate, % L(lDialogSettingsNotSavedTitle, g_strAppNameText)
ControlSetText, Button1, %lGuiSaveAmpersand%
ControlSetText, Button2, %lMenuSettings%

return
;------------------------------------------------------------


;========================================================================================================================
; END OF VARIOUS COMMANDS
;========================================================================================================================


;========================================================================================================================
!_095_VARIOUS_FUNCTIONS:
return
;========================================================================================================================

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


;------------------------------------------------
Oops(strMessage, objVariables*)
;------------------------------------------------
{
	global g_strAppNameText
	global g_strAppVersion
	
	Gui, 1:+OwnDialogs
	MsgBox, 48, % L(lOopsTitle, g_strAppNameText, g_strAppVersion), % L(strMessage, objVariables*)
}
; ------------------------------------------------


;------------------------------------------------------------
GetOSVersion()
;------------------------------------------------------------
{
	if (GetOSVersionInfo().MajorVersion = 10)
		return "WIN_10"
	else
		return A_OSVersion
}
;------------------------------------------------------------


;------------------------------------------------------------
GetOSVersionInfo()
; by shajul (http://www.autohotkey.com/board/topic/54639-getosversion/?p=414249)
; reference: http://msdn.microsoft.com/en-ca/library/windows/desktop/ms724833(v=vs.85).aspx
;------------------------------------------------------------
{
	static Ver

	If !Ver
	{
		VarSetCapacity(OSVer, 284, 0)
		NumPut(284, OSVer, 0, "UInt")
		If !DllCall("GetVersionExW", "Ptr", &OSVer)
		   return 0 ; GetSysErrorText(A_LastError)
		Ver := Object()
		Ver.MajorVersion      := NumGet(OSVer, 4, "UInt")
		Ver.MinorVersion      := NumGet(OSVer, 8, "UInt")
		Ver.BuildNumber       := NumGet(OSVer, 12, "UInt")
		Ver.PlatformId        := NumGet(OSVer, 16, "UInt")
		Ver.ServicePackString := StrGet(&OSVer+20, 128, "UTF-16")
		Ver.ServicePackMajor  := NumGet(OSVer, 276, "UShort")
		Ver.ServicePackMinor  := NumGet(OSVer, 278, "UShort")
		Ver.SuiteMask         := NumGet(OSVer, 280, "UShort")
		Ver.ProductType       := NumGet(OSVer, 282, "UChar") ; 1 = VER_NT_WORKSTATION, 2 = VER_NT_DOMAIN_CONTROLLER, 3 = VER_NT_SERVER
		Ver.EasyVersion       := Ver.MajorVersion . "." . Ver.MinorVersion . "." . Ver.BuildNumber
	}
	return Ver
}
;------------------------------------------------------------


;------------------------------------------------------------
GetFirstName4Location(strLocation)
;------------------------------------------------------------
{
	global g_strIniFile

	Loop
	{
		IniRead, strLoadIniLine, %g_strIniFile%, Favorites, Favorite%A_Index%
		if (strLoadIniLine = "ERROR")
			break
		; 1 FavoriteType, 2 FavoriteName, 3 FavoriteLocation, ...
		StringSplit, arrThisFavorite, strLoadIniLine, |
		if (arrThisFavorite3 = strLocation)
			return arrThisFavorite2
	}
	; else function returns ""
}
;------------------------------------------------------------


;------------------------------------------------------------
GetHotkeyLocation(strHotkey)
;------------------------------------------------------------
{
	strNameLocation := GetHotkeyNameLocation(strHotkey)
	StringSplit, arrNameLocation, strNameLocation, |
	
	return arrNameLocation2
}
;------------------------------------------------------------


;------------------------------------------------------------
GetHotkeyNameLocation(strHotkey)
;------------------------------------------------------------
{
	global g_objHotkeysByNameLocation
	
	for strNameLocation, strThisHotkey in g_objHotkeysByNameLocation
		if (strHotkey = strThisHotkey)
			return strNameLocation
	
	return ""
}
;------------------------------------------------------------


;------------------------------------------------------------
SplitHotkey(strHotkey, ByRef strModifiers, ByRef strKey, ByRef strMouseButton, ByRef strMouseButtonsWithDefault)
;------------------------------------------------------------
{
	; safer that declaring individual variables (see "Common source of confusion" in https://www.autohotkey.com/docs/Functions.htm#Locals)
	global

	if (strHotkey = "None") ; do not compare with lDialogNone because it is translated
	{
		strModifiers := ""
		strKey := ""
		strMouseButton := "None" ; do not use lDialogNone because it is translated
		StringReplace, strMouseButtonsWithDefault, lDialogMouseButtonsText, % lDialogNone . "|", % lDialogNone . "||" ; use lDialogNone because this is displayed
	}
	else 
	{
		SplitModifiersFromKey(strHotkey, strModifiers, strKey)

		if InStr(g_strMouseButtons, "|" . strKey . "|") ;  we have a mouse button
		{
			strMouseButton := strKey
			strKey := ""
			StringReplace, strMouseButtonsWithDefault, lDialogMouseButtonsText, % GetText4MouseButton(strMouseButton) . "|", % GetText4MouseButton(strMouseButton) . "||" ; with default value
		}
		else ; we have a key
		{
			strMouseButton := ""
			strMouseButtonsWithDefault := lDialogMouseButtonsText ; no default value
		}
	}
}
;------------------------------------------------------------


;------------------------------------------------------------
GetHotkeysText(ByRef strMouseHotkey, ByRef strKeyboardHotkey)
;------------------------------------------------------------
{
	global strModifiers1
	global strMouseButton1
	global strOptionsKey1
	global strModifiers2
	global strMouseButton2
	global strOptionsKey2
	
	; 1 NavigateOrLaunchHotkeyMouse, 2 NavigateOrLaunchHotkeyKeyboard
	strMouseHotkey := HotkeySections2Text(strModifiers1, strMouseButton1, strOptionsKey1)
	if (strMouseHotkey = lDialogNone)
		strMouseHotkey := ""
	strKeyboardHotkey := HotkeySections2Text(strModifiers2, strMouseButton2, strOptionsKey2)
	if (strKeyboardHotkey = lDialogNone)
		strKeyboardHotkey := ""
}
;------------------------------------------------------------


;------------------------------------------------------------
Hotkey2Text(strHotkey, blnShort := false)
;------------------------------------------------------------
{
	SplitHotkey(strHotkey, strModifiers, strOptionsKey, strMouseButton, strMouseButtonsWithDefault)

	return HotkeySections2Text(strModifiers, strMouseButton, strOptionsKey, blnShort)
}
;------------------------------------------------------------


;------------------------------------------------------------
HotkeySections2Text(strModifiers, strMouseButton, strKey, blnShort := false)
;------------------------------------------------------------
{
	if (strKey = "sc15D")
		strKey := lDialogMenuKey
	
	if (strMouseButton = "None") ; do not compare with lDialogNone because it is translated
		or !StrLen(strModifiers . strMouseButton . strKey) ; if all parameters are empty
		str := lDialogNone ; use lDialogNone because this is displayed
	else
	{
		str := ""
		loop, parse, strModifiers
		{
			if (A_LoopField = "!")
				str := str . (InStr(strModifiers, "<!") ? "<" : InStr(strModifiers, ">!") ? ">" : "") . lDialogAlt . "+"
			if (A_LoopField = "^")
				str := str . (InStr(strModifiers, "<^") ? "<" : InStr(strModifiers, ">^") ? ">" : "") . (blnShort ? lDialogCtrlShort : lDialogCtrl) . "+"
			if (A_LoopField = "+")
				str := str . (InStr(strModifiers, "<+") ? "<" : InStr(strModifiers, ">+") ? ">" : "") . lDialogShift . "+"
			if (A_LoopField = "#")
				str := str . (InStr(strModifiers, "<#") ? "<" : InStr(strModifiers, ">#") ? ">" : "") . (blnShort ? lDialogWinShort : lDialogWin) . "+"
		}
		if StrLen(strMouseButton)
			str := str . GetText4MouseButton(strMouseButton)
		if StrLen(strKey)
		{
			StringUpper, strKey, strKey
			str := str . strKey
		}
	}

	return str
}
;------------------------------------------------------------


;------------------------------------------------------------
GetText4MouseButton(strSource)
; Returns the string in g_arrMouseButtonsText at the same position of strSource in g_arrMouseButtons
;------------------------------------------------------------
{
	; safer that declaring individual variables (see "Common source of confusion" in https://www.autohotkey.com/docs/Functions.htm#Locals)
	global

	loop, %g_arrMouseButtons0%
	{
		if (strSource = g_arrMouseButtons%A_Index%)
			return g_arrMouseButtonsText%A_Index%
	}
}
;------------------------------------------------------------


;------------------------------------------------------------
GetMouseButton4Text(strSource)
; Returns the string in g_arrMouseButtons at the same position of strSource in g_arrMouseButtonsText
;------------------------------------------------------------
{
	global

	loop, %g_arrMouseButtonsText0%
		if (strSource = g_arrMouseButtonsText%A_Index%)
			return g_arrMouseButtons%A_Index%
}
;------------------------------------------------------------


;------------------------------------------------------------
SplitModifiersFromKey(strHotkey, ByRef strModifiers, ByRef strKey)
;------------------------------------------------------------
{
	intModifiersEnd := GetFirstNotModifier(strHotkey)
	StringLeft, strModifiers, strHotkey, %intModifiersEnd%
	StringMid, strKey, strHotkey, % (intModifiersEnd + 1)
}
;------------------------------------------------------------


;------------------------------------------------------------
GetFirstNotModifier(strHotkey)
;------------------------------------------------------------
{
	intPos := 0
	loop, Parse, strHotkey
		if InStr("^!+#<>", A_LoopField)
			intPos++
		else
			return intPos
	return intPos
}
;------------------------------------------------------------


;------------------------------------------------
DiagWindowInfo(strName)
;------------------------------------------------
{
	global g_strTargetWinId
	
	WinGetClass, strClass, ahk_id %g_strTargetWinId%
	WinGetTitle, strTitle, ahk_id %g_strTargetWinId%
	Diag(strName . " - Window Info", g_strTargetWinId . "`t" . strClass . "`t" . strTitle)
	
	strActiveWindowId := WinActive("A")
	WinGetClass, strClass, ahk_id %strActiveWindowId%
	WinGetTitle, strTitle, ahk_id %strActiveWindowId%
	Diag(strName . " - Active Window", strActiveWindowId . "`t" . strClass . "`t" . strTitle)
}
;------------------------------------------------


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


;------------------------------------------------------------
ParseIconResource(strIconResource, ByRef strIconFile, ByRef intIconIndex, strDefaultType := "")
; strIconResource can be a icongroup (file,index) or an index in g_objJLiconsByName
;------------------------------------------------------------
{
	global g_objJLiconsByName
	
	if !StrLen(strDefaultType)
		strDefaultType := "iconUnknown"
	if !StrLen(strIconResource)
		strIconResource := g_objJLiconsByName[strDefaultType]
	If !InStr(strIconResource, ",") ; this is an index from g_objJLiconsByName or the name of a file including icons
		if StrLen(g_objJLiconsByName[strIconResource]) ; this is an index from g_objJLiconsByName
			strIconResource := g_objJLiconsByName[strIconResource] ; replace it with file,index format
		else ; this is the name of a file including icons
			strIconResource := strIconResource . ",1" ; use its first icon
	
	; from here, strIconResource is always of icongroup files format ("file,index")
	intComaPos := InStr(strIconResource, ",", , 0) - 1 ; search from the end because filename could also include a coma (ex.: "file,name.ico,1")
	StringLeft, strIconFile, strIconResource, intComaPos
	StringReplace, intIconIndex, strIconResource, %strIconFile%`,
	; if strExpandedIconRessource has a relative path, make it absolute based on the QAP working directory
	strIconFile := PathCombine(A_WorkingDir, EnvVars(strIconFile))
	; ###_V(A_ThisFuync, "*strIconResource", strIconResource, "*intComaPos", intComaPos, "*strIconFile", strIconFile, "*intIconIndex", intIconIndex)
}
;------------------------------------------------------------


;------------------------------------------------------------
GetIcon4Location(strLocation)
; returns an icon resource in icongroup format (file,index) or an index of g_objJLiconsNames
; icongroup will be splitted by ParseIconResource before being used by Menu command
; index of g_objJLiconsNames will converted to icongroup by ParseIconResource before being splitted
; get icon, extract from kiu http://www.autohotkey.com/board/topic/8616-kiu-icons-manager-quickly-change-icon-files/
;------------------------------------------------------------
{
	blnFileExist := FileExistInPath(strLocation) ; expand strLocation and search in PATH

	if !StrLen(strLocation)
		return "iconUnknown"
	
	strExtension := GetFileExtension(strLocation)
	RegRead, strHKeyClassRoot, HKEY_CLASSES_ROOT, .%strExtension%
	if !StrLen(strHKeyClassRoot)
		return "iconUnknown"
	
	RegRead, strRegistryIconResource, HKEY_CLASSES_ROOT, %strHKeyClassRoot%\DefaultIcon
	if (strRegistryIconResource = "%1") ; use the file itself (for executable)
		return strLocation . ",1"
	else if InStr(strRegistryIconResource, """") ; for badly set icon in registry including double-quote (only one situation seen)
		or !StrLen(strRegistryIconResource) ; empty result
		return "iconUnknown"
	else
		return strRegistryIconResource
}
;------------------------------------------------------------


;------------------------------------------------------------
GuiCenterButtons(strWindow, intInsideHorizontalMargin := 10, intInsideVerticalMargin := 0, intDistanceBetweenButtons := 20, arrControls*)
; This is a variadic function. See: http://ahkscript.org/docs/Functions.htm#Variadic
;------------------------------------------------------------
{
	Gui, Show, Hide ; why?
	WinGetPos, , , intWidth, , %strWindow%

	intMaxControlWidth := 0
	intMaxControlHeight := 0
	for intIndex, strControl in arrControls
	{
		GuiControlGet, arrControlPos, Pos, %strControl%
		if (arrControlPosW > intMaxControlWidth)
			intMaxControlWidth := arrControlPosW
		if (arrControlPosH > intMaxControlHeight)
			intMaxControlHeight := arrControlPosH
	}
	
	intMaxControlWidth := intMaxControlWidth + intInsideHorizontalMargin
	intButtonsWidth := (arrControls.MaxIndex() * intMaxControlWidth) + ((arrControls.MaxIndex()  - 1) * intDistanceBetweenButtons)
	intLeftMargin := (intWidth - intButtonsWidth) // 2

	for intIndex, strControl in arrControls
		GuiControl, Move, %strControl%
			, % "x" . intLeftMargin + ((intIndex - 1) * intMaxControlWidth) + ((intIndex - 1) * intDistanceBetweenButtons)
			. " w" . intMaxControlWidth
			. " h" . intMaxControlHeight + intInsideVerticalMargin
}
;------------------------------------------------------------


;------------------------------------------------------------
RecursiveBuildMenuTreeDropDown(objMenu, strDefaultMenuName, strSkipMenuName := "", blnExcludeReadonly := false)
; recursive function
;------------------------------------------------------------
{
	strList := objMenu.MenuPath
	if (objMenu.MenuPath = strDefaultMenuName)
		strList .= "|" ; default value

	Loop, % objMenu.MaxIndex()
	{
		if !InStr("Menu|Group|External", objMenu[A_Index].FavoriteType, true) ; this is not a menu or a group, case sensitive because type X is included in External ...
			continue
		
		; this object has a .Submenu property
		
		; skip to avoid moving a submenu under itself (in GuiEditFavorite)
		if StrLen(strSkipMenuName) and (objMenu[A_Index].Submenu.MenuPath = strSkipMenuName)
			continue
		
		if (objMenu[A_Index].Submenu.MenuType = "External")
		{
			; skip read-only external menus
			if (blnExcludeReadonly) and ExternalMenuIsReadOnly(objMenu[A_Index].Submenu.MenuExternalPath)
				continue
			
			; skip external menus if not loaded
			if !(objMenu[A_Index].Submenu.MenuLoaded)
				continue
		}

		; if we get here, we keep this menu and recurse in it
		strList .= "|" . RecursiveBuildMenuTreeDropDown(objMenu[A_Index].Submenu, strDefaultMenuName, strSkipMenuName, blnExcludeReadonly) ; recursive call
	}
	return strList
}
;------------------------------------------------------------


;------------------------------------------------------------
LocationIsDocument(strLocation)
;------------------------------------------------------------
{
    FileGetAttrib, strAttributes, %strLocation%
    return !InStr(strAttributes, "D") ; not a folder
}
;------------------------------------------------------------


;------------------------------------------------------------
GetDeepestFolderName(strLocation)
;------------------------------------------------------------
{
	SplitPath, strLocation, , , , strDeepestName, strDrive
	if !StrLen(strDeepestName) ; we are probably at the root of a drive
		return strDrive
	else
		return strDeepestName
}
;------------------------------------------------------------


;------------------------------------------------------------
GetDeepestMenuPath(strPath)
;------------------------------------------------------------
{
	global g_strMenuPathSeparator ; only used for menu, not for group
	
	return Trim(SubStr(strPath, InStr(strPath, g_strMenuPathSeparator, , 0) + 1, 9999))
}
;------------------------------------------------------------


;------------------------------------------------------------
NextMenuShortcut(ByRef intShortcut)
;------------------------------------------------------------
{
	if (intShortcut < 10)
		strShortcut := intShortcut ; 0 .. 9
	else
		strShortcut := Chr(intShortcut + 55) ; Chr(10 + 55) = "A" .. Chr(35 + 55) = "Z"
	
	intShortcut := intShortcut + 1
	return strShortcut
}
;------------------------------------------------------------


;------------------------------------------------------------
IsInteger(str)
;------------------------------------------------------------
{
	if str is integer
		return true
	else
		return false
}
;------------------------------------------------------------


;------------------------------------------------------------
CollectRunningApplications(strDefaultPath)
;------------------------------------------------------------
{
	objApps := Object()

	DetectHiddenWindows, Off
	Winget, strIDs, list
	DetectHiddenWindows, On ; revert to app default
	
	Loop, %strIDs%
	{
		WinGet, strPath, ProcessPath, % "ahk_id " . strIDs%A_index%
		if !objApps.HasKey(strPath)
			objApps.Insert(strPath, "")
	}
	for strThisPath in objApps
	{
		strPaths .= strThisPath . "|"
		if (strThisPath = strDefaultPath)
			strPaths .= "|"
	}

	return strPaths
}
;------------------------------------------------------------


;------------------------------------------------------------
EncodeSnippet(strSnippet)
; convert from display format (when f_blnProcessEOLTab is true) to raw content, ready for saving to in file
;------------------------------------------------------------
/*
https://rosettacode.org/wiki/Special_characters#AutoHotkey
The escape character defaults to accent/backtick (`).

`, = , (literal comma). Note: Commas that appear within the last parameter of a command do not need to be escaped because the program knows to treat them literally. The same is true for all parameters of MsgBox because it has smart comma handling.
`% = % (literal percent)
`` = ` (literal accent; i.e. two consecutive escape characters result in a single literal character)
`; = ; (literal semicolon). Note: This is necessary only if a semicolon has a space or tab to its left. If it does not, it will be recognized correctly without being escaped.
`n = newline (linefeed/LF)
`r = carriage return (CR)
`b = backspace
`t = tab (the more typical horizontal variety)
`v = vertical tab -- corresponds to Ascii value 11. It can also be manifest in some applications by typing Control+K.
`a = alert (bell) -- corresponds to Ascii value 7. It can also be manifest in some applications by typing Control+G.
`f = formfeed -- corresponds to Ascii value 12. It can also be manifest in some applications by typing Control+L.
Send = When the Send command or Hotstrings are used in their default (non-raw) mode, characters such as {}^!+# have special meaning. Therefore, to use them literally in these cases, enclose them in braces. For example: Send {^}{!}{{}
"" = Within an expression, two consecutive quotes enclosed inside a literal string resolve to a single literal quote. For example: Var := "The color ""red"" was found."

Process only:
`n = newline (linefeed/LF)
`t = tab (the more typical horizontal variety)

No need to process:
- | (pipe) used as separator in favorites lines in ini file are already replaced with the escape sequence "Ð¡þ€"
*/
{
	StringReplace, strSnippet, strSnippet, ``, ````, A ;  replace backticks with double-backticks
	StringReplace, strSnippet, strSnippet, `n, ``n, A  ; encode end-of-lines
	StringReplace, strSnippet, strSnippet, `t, ``t, A  ; encode tabs
	
	return strSnippet
}
;------------------------------------------------------------


;------------------------------------------------------------
DecodeSnippet(strSnippet)
; convert from raw content (as from ini file) to display format (when f_blnProcessEOLTab is true) or to paste format
;------------------------------------------------------------
{
	StringReplace, strSnippet, strSnippet, ````, !r4nd0mt3xt!, A ; preserve double-backticks
	StringReplace, strSnippet, strSnippet, ``n, `r`n, A          ; decode end-of-lines
	StringReplace, strSnippet, strSnippet, ``t, `t, A            ; decode tabs
	StringReplace, strSnippet, strSnippet, !r4nd0mt3xt!, ``, A   ; restore double-backticks
	
	return strSnippet
}
;------------------------------------------------------------


;------------------------------------------------------------
ReplaceAllInString(strThis, strFrom, strTo)
;------------------------------------------------------------
{
	StringReplace, strThis, strThis, %strFrom%, %strTo%, A
	return strThis
}
;------------------------------------------------------------


;------------------------------------------------------------
Url2Var(strUrl)
;------------------------------------------------------------
{
	objWebRequest := ComObjCreate("WinHttp.WinHttpRequest.5.1")
	/*
	if (A_LastError)
		; an error occurred during ComObjCreate (A_LastError probably is E_UNEXPECTED = -2147418113 #0x8000FFFFL)
		BUT DO NOT ABORT because the following commands will be executed even if an error occurred in ComObjCreate (!)
	*/
	objWebRequest.Open("GET", strUrl)
	objWebRequest.Send()

	return objWebRequest.ResponseText()
}
;------------------------------------------------------------


;------------------------------------------------------------
NameIsInObject(strName, obj)
;------------------------------------------------------------
{
	loop, % obj.MaxIndex()
		if (strName = obj[A_Index].Name)
			return true
		
	return false
}
;------------------------------------------------------------


;------------------------------------------------------------
HasHotkey(strCandidateHotkey)
;------------------------------------------------------------
{
	return StrLen(strCandidateHotkey) and (strCandidateHotkey <> "None")
}
;------------------------------------------------------------


;------------------------------------------------
UriDecode(str)
; by polyethene
; http://www.autohotkey.com/board/topic/17367-url-encoding-and-decoding-of-special-characters/?p=112822
;------------------------------------------------
{
	Loop
		If RegExMatch(str, "i)(?<=%)[\da-f]{1,2}", hex)
			StringReplace, str, str, `%%hex%, % Chr("0x" . hex), All
		Else
			Break

	; added by JL
	StringReplace, str, str, file:///
	StringReplace, str, str, file: ; for network drives starting with file:\\, keep only \\
	StringReplace, str, str, /, \, A

	return str
}
;------------------------------------------------


;------------------------------------------------------------
UriEncode(str)
; from GoogleTranslate by Mikhail Kuropyatnikov
; http://www.autohotkey.net/~sumon/GoogleTranslate.ahk
; edited to encode also "@" see http://stackoverflow.com/questions/32341476/valid-url-for-an-ftp-site-with-username-containing/
;------------------------------------------------------------
{ 
   b_Format := A_FormatInteger 
   data := "" 
   SetFormat,Integer,H 
   SizeInBytes := StrPutVar(str,var,"utf-8")
   Loop, %SizeInBytes%
   {
   ch := NumGet(var,A_Index-1,"UChar")
   If (ch=0)
      Break
   if ((ch>0x7f) || (ch<0x30) || (ch=0x3d) || (ch=0x40))
      s .= "%" . ((StrLen(c:=SubStr(ch,3))<2) ? "0" . c : c)
   Else
      s .= Chr(ch)
   }   
   SetFormat,Integer,%b_format% 
   return s 
} 
;------------------------------------------------------------


;------------------------------------------------------------
StrPutVar(string, ByRef var, encoding)
;------------------------------------------------------------
{
    ; Ensure capacity.
    SizeInBytes := VarSetCapacity( var, StrPut(string, encoding)
        ; StrPut returns char count, but VarSetCapacity needs bytes.
        * ((encoding="utf-16"||encoding="cp1200") ? 2 : 1) )
    ; Copy or convert the string.
    StrPut(string, &var, encoding)
   Return SizeInBytes 
}
;------------------------------------------------------------


;------------------------------------------------------------
ComUnHTML(html)
; convert HTML entities to text (like "&apos;") - author unknown
; http://www.autohotkey.com/board/topic/47356-unhtm-remove-html-formatting-from-a-string-updated/page-2#entry467499
;------------------------------------------------------------
{
	oHTML := ComObjCreate("HtmlFile")
	oHTML.write(html)
	return oHTML.documentElement.innerText
}
;------------------------------------------------------------


;------------------------------------------------------------
ExpandPlaceholders(strArguments, strLocation, strCurrentLocation)
; strLocation: {LOC} (full location), {NAME} (file name), {DIR} (directory), {EXT} (extension), {NOEXT} (file name without extension) or {DRIVE} (drive)
; or strCurrentLocation: same with prefix "CUR_" like {CUR_LOC} (full current location), {CUR_NAME} (current file name), etc.
;------------------------------------------------------------
{
	strExpanded := ExpandPlaceholdersForThis(strArguments, strLocation, "")
	strExpanded := ExpandPlaceholdersForThis(strExpanded, strCurrentLocation, "CUR_")
	
	return strExpanded
}
;------------------------------------------------------------


;------------------------------------------------------------
ExpandPlaceholdersForThis(strArguments, strThisLocation, strPrefix := "")
;------------------------------------------------------------
{
	SplitPath, strThisLocation, strOutFileName, strOutDir, strOutExtension, strOutNameNoExt, strOutDrive
	
	strExpanded := strArguments
	StringReplace, strExpanded, strExpanded, {%strPrefix%LOC}, %strThisLocation%, All
	StringReplace, strExpanded, strExpanded, {%strPrefix%NAME}, %strOutFileName%, All
	StringReplace, strExpanded, strExpanded, {%strPrefix%DIR}, %strOutDir%, All
	StringReplace, strExpanded, strExpanded, {%strPrefix%EXT}, %strOutExtension%, All
	StringReplace, strExpanded, strExpanded, {%strPrefix%NOEXT}, %strOutNameNoExt%, All
	StringReplace, strExpanded, strExpanded, {%strPrefix%DRIVE}, %strOutDrive%, All
	
	return strExpanded
}
;------------------------------------------------------------


;------------------------------------------------------------
SetTargetWinInfo(blnMouseElseKeyboard)
; set g_strTargetClass, g_strTargetWinId, g_strTargetControl and g_strTargetWinTitle
;------------------------------------------------------------
{
	global
	
	if (blnMouseElseKeyboard)
	{
		MouseGetPos, , , g_strTargetWinId, g_strTargetControl
		WinGetClass, g_strTargetClass, % "ahk_id " . g_strTargetWinId
		; TrayTip, Navigate Mouse, %strMouseOrKeyboard% = %g_strMouseNavigateHotkey% (%g_intCounter%)`n%g_strTargetWinId%`n%g_strTargetClass%`n%g_strTargetControl%
		; WinGetTitle, strTitle, ahk_id %g_strTargetWinId%
		; DiagWindowInfo("SetTargetWinInfo - Mouse")
	}
	else ; Keyboard
	{
		g_strTargetWinId := WinExist("A")
		g_strTargetControl := ""
		WinGetClass, g_strTargetClass, % "ahk_id " . g_strTargetWinId
		; TrayTip, Navigate Keyboard, %strMouseOrKeyboard% = %g_strKeyboardNavigateHotkey% (%g_intCounter%)`n%g_strTargetWinId%`n%g_strTargetClass%
		; DiagWindowInfo("SetTargetWinInfo - Keyboard")
	}

	WinGetTitle, g_strTargetWinTitle, % "ahk_id " . g_strTargetWinId
}
;------------------------------------------------------------


;------------------------------------------------------------
LocationIsHTTP(strLocation)
;------------------------------------------------------------
{
	return SubStr(strLocation, 1, 7) = "http://" or SubStr(strLocation, 1, 8) = "https://"
}
;------------------------------------------------------------


;------------------------------------------------------------
FileExistInPath(ByRef strFile)
;------------------------------------------------------------
{
	if !StrLen(strFile) or InStr(strFile, "://") ; this is not a file - caution some URLs in WhereIs cause an infinite loop
		return, False
	
	strFile := EnvVars(strFile) ; expand environment variables like %APPDATA% or %USERPROFILE%
	if !InStr(strFile, "\") ; if no path in filename
		strFile := WhereIs(strFile) ; search if file exists in path env variable or registry app paths
	else
		strFile := PathCombine(A_WorkingDir, strFile) ; make relative path absolute
	
	if (SubStr(strFile, 1, 2) = "\\") ; this is an UNC path
	; check if it is the UNC root - if yes, return true without confirming if path exist because FileExist bug(?) with UNC root path
	{
		intPos := InStr(strFile, "\", false, 3)
		if !(intPos) ; there is no "\" after the domain or IP address, this is the UNC root
			return true
		if !StrLen(strTemp) ; there is nothing after the "\" following the domain or IP address, this is the UNC root
			return true
	}
	
	return, FileExist(strFile) ; returns the file's attributes if file exists or empty (false) is not
}
;------------------------------------------------------------


;------------------------------------------------------------
WhereIs(strThisFile)
; based on work from Skan in https://autohotkey.com/board/topic/20807-fileexist-in-path-environment/
;------------------------------------------------------------
{
	if !StrLen(GetFileExtension(strThisFile)) ; if file has no extension
	{
		; prepare executable extensions list from PATHEXT env variable
		EnvGet, strExeExtensions, PathExt

		; re-enter WhereIs with each extension until one returns an existing file
		Loop, Parse, strExeExtensions, `;
		{
			strFoundFile := WhereIs(strThisFile . A_LoopField) ; recurse into WhereIs with a complete filename
		} until StrLen(strFoundFile)
		
		return %strFoundFile% ; exit if we find an existing file, or return empty if not
	}
	; from here, we have a filename with an extension
	
	; prepare locations list
	SplitPath, A_AhkPath, , strAhkDir
	EnvGet, strDosPath, Path
	strPaths := A_WorkingDir . ";" . A_ScriptDir . ";" . strAhkDir . ";" . strAhkDir . "\Lib;" . A_MyDocuments . "\AutoHotkey\Lib" . ";" . strDosPath
	
	; search in each location
	Loop, Parse, strPaths, `;
		If StrLen(A_LoopField)
			If FileExist(A_LoopField . "\" . strThisFile)
				Return, RegExReplace(A_LoopField . "\" . strThisFile,  "\\\\", "") ; RegExReplace to prevent results like C:\\Directory
	
	; if not found, check in registry paths for this filename
	RegRead, strAppPath, HKLM, SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\%strThisFile%
	If FileExist(strAppPath)
		Return, strAppPath
	
	; else return empty
}
;------------------------------------------------------------


;------------------------------------------------------------
PathCombine(strAbsolutePath, strRelativePath)
; see http://www.autohotkey.com/board/topic/17922-func-relativepath-absolutepath/page-3#entry117355
; and http://stackoverflow.com/questions/29783202/combine-absolute-path-with-a-relative-path-with-ahk/
;------------------------------------------------------------
{
    VarSetCapacity(strCombined, (A_IsUnicode ? 2 : 1) * 260, 1) ; MAX_PATH
    DllCall("Shlwapi.dll\PathCombine", "UInt", &strCombined, "UInt", &strAbsolutePath, "UInt", &strRelativePath)
    Return, strCombined
}
;------------------------------------------------------------


;------------------------------------------------------------
EnvVars(str)
; from Lexikos http://www.autohotkey.com/board/topic/40115-func-envvars-replace-environment-variables-in-text/#entry310601
;------------------------------------------------------------
{
    if sz:=DllCall("ExpandEnvironmentStrings", "uint", &str
                    , "uint", 0, "uint", 0)
    {
        VarSetCapacity(dst, A_IsUnicode ? sz*2:sz)
        if DllCall("ExpandEnvironmentStrings", "uint", &str
                    , "str", dst, "uint", sz)
            return dst
    }
    return str
}
;------------------------------------------------------------


;------------------------------------------------------------
AppIsRunning(strAppPath, ByRef strAppID)
; Based on Drugoy (https://github.com/Drugoy/Autohotkey-scripts-.ahk/blob/master/DevTools/showPerWindowInfoOfAllWindows.ahk)
;------------------------------------------------------------
{
	WinGet, strWinIDs, List	; Retrieve IDs of all the existing windows
	Loop, %strWinIDs%
	{
		WinGet, strProcessPath, ProcessPath, % "ahk_id " . strWinIDs%A_Index%
		if (strProcessPath = strAppPath)
		{
			strAppID := strWinIDs%A_Index%
			return true
		}
	}
	return false
}
;------------------------------------------------------------


;------------------------------------------------------------
SetWaitCursor(blnOnOff)
; from Gio in https://autohotkey.com/boards/viewtopic.php?f=5&t=13284
;------------------------------------------------------------
{
	static blnCursorWaitAlreadyOn
	static objWaitCursor
	
	if (blnOnOff)
		if (blnCursorWaitAlreadyOn)
			return
		else
		{
			; The line of code below loads a cursor from the system set (specifically, the wait cursor - 32514).
			objWaitCursor :=  DllCall("LoadImage", "Uint", 0, "Uint", 32514, "Uint", 2, "Uint", 0, "Uint", 0, "Uint", 0x8000)

			; And then we set all the default system cursors to be our choosen cursor. CopyImage is necessary as SetSystemCursor destroys the cursor we pass to it after using it.
			strCursors := "32650,32512,32515,32649,32651,32513,32648,32646,32643,32645,32642,32644,32516,32514"
			Loop, Parse, strCursors, `,
				DllCall("SetSystemCursor", "Uint", DllCall("CopyImage", "Uint", objWaitCursor, "Uint", 2, "Int", 0, "Int", 0, "Uint", 0), "Uint", A_LoopField)
			
			blnCursorWaitAlreadyOn := true
		}
	else
	{
		; And finally, when the action is over, we call the code below to revert the default set of cursors back to its original state.
		; SystemParametersInfo() (with option 0x0057) changes the set of system cursors to the system defaults. 
		; We are loading a system cursor, so there is no need to destroy it. Also the copies we are creating with CopyImage() are destroyed by SetSystemCursor() itself.
		DllCall("SystemParametersInfo", "Uint", 0x0057, "Uint", 0, "Uint", 0, "Uint", 0)
		
		objWaitCursor := ""
		blnCursorWaitAlreadyOn := false
	}
}
;------------------------------------------------------------


;------------------------------------------------------------
StringLeftDotDotDot(strText, intMax)
;------------------------------------------------------------
{
	return SubStr(strText, 1, intMax) . (StrLen(strText) > intMax ? "..." : "")
}
;------------------------------------------------------------


;------------------------------------------------------------
FavoriteIsUnderExternalMenu(objMenu, ByRef objExternalMenu)
; return true if objMenu is an external menu or is under an external menu
; objExternalMenu returns the parent external menu object (equal to objMenu if objMenu is an external menu itself)
;------------------------------------------------------------
{
	if !IsObject(objMenu)
		return false
	
	Loop
	{
		; ###_V(A_ThisLabel, objMenu.MenuExternalPath, objMenu.IsLiveMenu, objMenu.MenuPath, objMenu.MenuType, "-"
		;	, objMenu[1].HasKey("ParentMenu"), objMenu[1].ParentMenu.MenuPath, objMenu[1].ParentMenu.MenuType)
		if (objMenu.MenuType = "External")
		{
			objExternalMenu := objMenu ; return the top level external menu object
			return true
		}
		else if (objMenu.MenuPath = lMainMenuName)
			return false ; up to Main menu, no External menu
		else
			if !(objMenu[1].HasKey("ParentMenu"))
				return false ; should not occur, no parent menu
			else
				objMenu := objMenu[1].ParentMenu ; up one level and loop
	}
}
;------------------------------------------------------------


;------------------------------------------------------------
LocationTransformedFromHTTP2UNC(strType, ByRef strLocation)
;------------------------------------------------------------
{
	if InStr("Folder|Document|External", strType)
		and (SubStr(strLocation, 1, 5) = "http:" or SubStr(strLocation, 1, 6) = "https:")
	{
		; Transform from "http:" to "\\" (WevDAV to UNC), example:
		; From: http://abc.server.com/folder/subfolder/My Name.doc
		; to:   \\abc.server.com\folder\subfolder\My%20Name.doc
		; See: http://stackoverflow.com/questions/1344910/get-the-content-of-a-sharepoint-folder-with-excel-vba
		
		StringReplace, strLocation, strLocation, /, \, All
		StringReplace, strLocation, strLocation, http:
		StringReplace, strLocation, strLocation, https:
		; not required? StringReplace, strLocation, strLocation, %A_Space%, `%20, All
		return true
	}
	else
		return false
}
;------------------------------------------------------------


;------------------------------------------------------------
SettingsUnsaved()
;------------------------------------------------------------
{
	global

	GuiControlGet, strCancelButtonLabel, 1:, f_btnGuiCancel ; get Settings Cancel button label ("Cancel" or "Close")
	blnDialogOpen := (strCancelButtonLabel = lGuiCancelAmpersand) ; Settings open with changes to save if Cancel button label is "Cancel"
	; GuiControlGet, blnDialogOpen, 1:Enabled, f_btnGuiSaveAndCloseFavorites ; check if Settings is open with Save button enabled

	return blnDialogOpen
}
;------------------------------------------------------------


;------------------------------------------------------------
GetFavoriteTypeForList(objFavorite)
;------------------------------------------------------------
{
	global g_objFavoriteTypesShortNames
	global g_strFolderLiveIndicator
	
	strType := g_objFavoriteTypesShortNames[objFavorite.FavoriteType]
	if (objFavorite.FavoriteFolderLiveLevels)
		strType := g_strFolderLiveIndicator . strType . g_strFolderLiveIndicator
	if (objFavorite.FavoriteDisabled)
		strType := "(" . strType . ")"
	
	return strType
}
;------------------------------------------------------------


;------------------------------------------------------------
GetModifiedDateTime(strFile)
; returns the last modified file system date-time of file
;------------------------------------------------------------
{
	FileGetTime, strDateTime, %strFile% ; modification date-time by default
	return strDateTime
}
;------------------------------------------------------------


;------------------------------------------------------------
GetFileExtension(strFile)
;------------------------------------------------------------
{
	SplitPath, strFile, , , strExtension
	return strExtension
}
;------------------------------------------------------------


;------------------------------------------------------------
GetDefaultIcon4Type(objFavorite, strGuiFavoriteLocation)
;------------------------------------------------------------
{
	global g_strTempDir
	global g_objJLiconsByName
	global g_objSpecialFolders
	global g_objQAPFeatures

	if InStr("Menu|External", objFavorite.FavoriteType, true)
		; default submenu icon
		return g_objJLiconsByName["iconSubmenu"]
	else if (objFavorite.FavoriteType = "Group")
		; default group icon
		return g_objJLiconsByName["iconGroup"]
	else if (objFavorite.FavoriteType = "Folder")
		if (objFavorite.FavoriteFolderLiveLevels)
			; default live folder icon
			return g_objJLiconsByName["iconFolderLive"]
		else
			; default folder icon
			return g_objJLiconsByName["iconFolder"]
	else if (objFavorite.FavoriteType = "URL")
		; default browser icon
		return GetIcon4Location(g_strTempDir . "\default_browser_icon.html")
	else if (objFavorite.FavoriteType = "FTP")
		; default FTP icon
		return g_objJLiconsByName["iconFTP"]
	else if (objFavorite.FavoriteType = "Snippet")
	{
		strSnippetProperties := objFavorite.FavoriteLaunchWith
		StringSplit, arrSnippetProperties, strSnippetProperties, `;
		if (arrSnippetProperties1)
			; default macro Snippet icon
			return g_objJLiconsByName["iconPasteSpecial"]
		else
			; default text Snippet icon
			return g_objJLiconsByName["iconPaste"]
	}
	else if InStr("Document|Application", objFavorite.FavoriteType) and StrLen(strGuiFavoriteLocation)
		; default icon for the selected file in add/edit favorite
		return GetIcon4Location(strGuiFavoriteLocation)
	else if (objFavorite.FavoriteType = "Special")
		return g_objSpecialFolders[objFavorite.FavoriteLocation].DefaultIcon
	else if (objFavorite.FavoriteType = "QAP")
		return g_objQAPFeatures[objFavorite.FavoriteLocation].DefaultIcon
	else ; should not
		return g_objJLiconsByName["iconUnknown"]
}
;------------------------------------------------------------


;------------------------------------------------------------
PickIconDialog(strFavoriteIconResource)
;------------------------------------------------------------
{
	; Source: http://ahkscript.org/boards/viewtopic.php?f=5&t=5108#p29970
	VarSetCapacity(strIconFile, 1024) ; must be placed before strIconFile is initialized because VarSetCapacity erase its content
	ParseIconResource(strFavoriteIconResource, strIconFile, intIconIndex)
	blnFileExist := FileExistInPath(strIconFile)

	WinGet, hWnd, ID, A
	if (intIconIndex >= 0) ; adjust index for positive index only (not for negative index)
		intIconIndex := intIconIndex - 1
	DllCall("shell32\PickIconDlg", "Uint", hWnd, "str", strIconFile, "Uint", 260, "intP", intIconIndex)
	if (intIconIndex >= 0) ; adjust index for positive index only (not for negative index)
		intIconIndex := intIconIndex + 1

	if StrLen(strIconFile)
		return strIconFile . "," . intIconIndex
}
;------------------------------------------------------------


;------------------------------------------------------------
ActiveMonitorInfo(ByRef intTop, ByRef intLeft, ByRef intWidth, ByRef intHeight)
; From Bluesmaster - retrieves the size of the monitor under the mouse
; from https://autohotkey.com/board/topic/111638-activemonitorinfo-get-monitor-resolution-and-origin-from-of-monitor-with-mouse-on/
;------------------------------------------------------------
{ 
	CoordMode, Mouse, Screen
	MouseGetPos, intMouseX, intMouseY
	SysGet, intMonitorsCount, MonitorCount
	; Diag("ActiveMonitorInfo - intMonitorsCount", intMonitorsCount)
	Loop %intMonitorsCount%
    {
		SysGet, arrCurrentMonitor, Monitor, %A_Index%
		if (intMouseX >= arrCurrentMonitorLeft and intMouseX <= arrCurrentMonitorRight and intMouseY >= arrCurrentMonitorTop and intMouseY <= arrCurrentMonitorBottom )
		{
			intTop := arrCurrentMonitorTop
			intLeft := arrCurrentMonitorLeft
			intHeight := arrCurrentMonitorBottom - arrCurrentMonitorTop
			intWidth := arrCurrentMonitorRight  - arrCurrentMonitorLeft
			; Diag("ActiveMonitorInfo - Monitor Index", A_Index)
			; Diag("ActiveMonitorInfo - MouseX,MouseY", intMouseX . "," . intMouseY)
			; Diag("ActiveMonitorInfo - Top,Left,Bottom,Right", arrCurrentMonitorTop . "," . arrCurrentMonitorLeft . "," . arrCurrentMonitorBottom . "," . arrCurrentMonitorRight)
			
			return
		}
	}
}
;------------------------------------------------------------


;------------------------------------------------------------
FavoriteNameLocationFromObject(objFavorite)
;------------------------------------------------------------
{
	return (objFavorite.FavoriteType = "QAP" ? "" : objFavorite.FavoriteName) . "|" . objFavorite.FavoriteLocation
}
;------------------------------------------------------------


;------------------------------------------------------------
SplitExclusionList(strExclusionMouseList, ByRef g_strExclusionMouseListApp, ByRef g_strExclusionMouseListDialog)
;------------------------------------------------------------
{
	g_strExclusionMouseListApp := ""
	g_strExclusionMouseListDialog := ""
	
	Loop, Parse, strExclusionMouseList, |
		if (SubStr(A_LoopField, 1, 1) = "*") and (StrLen(A_LoopField) > 2)
		; "*" tells to check this exclusion also in app's dialog boxes, and we have something after the "*"
		{
			g_strExclusionMouseListApp .= Trim(SubStr(A_LoopField, 2)) . "|"
			g_strExclusionMouseListDialog .= Trim(SubStr(A_LoopField, 2)) . "|"
		}
		else if StrLen(A_LoopField)
			g_strExclusionMouseListApp .= Trim(A_LoopField) . "|"

}
;------------------------------------------------------------


;------------------------------------------------------------
ExternalMenuAvailableForLock(objMenu, blnLockItForMe := false)
;------------------------------------------------------------
{
	global g_objExternaleMenuToRelease
	global g_strAppNameText
	global g_strAppVersion

	; ###_O(A_ThisFunc . " - objMenu", objMenu)
	if (objMenu.MenuType <> "External")
	; not an external menu, checking lock is not required, return true
		return true
	
	IniRead, intMenuExternalType, % objMenu.MenuExternalPath, Global, MenuType, 1 ; 1 Personal (default), 2 Collaborative or 3 Centralized (should be 1 or 2, never 3)
	IniRead, strMenuExternalReservedBy, % objMenu.MenuExternalPath, Global, MenuReservedBy, %A_Space% ; empty if not found
	
	; ###_V(A_ThisFunc, objMenu.MenuExternalPath, intMenuExternalType, strMenuExternalReservedBy, A_UserName, A_ComputerName)
	if (intMenuExternalType = 3 and ExternalMenuIsReadOnly(objMenu.MenuExternalPath))
	{
		IniRead, strWriteAccessMessage, % objMenu.MenuExternalPath, Global, WriteAccessMessage, %A_Space% ; empty if not found
		IniRead, strExternalMenuName, % objMenu.MenuExternalPath, Global, MenuName, %A_Space% ; empty if not found
		Oops(lOopsErrorIniFileReadOnly . (StrLen(strExternalMenuName) ? "`n`n" . lDialogExternalMenuName . ":`n" . strExternalMenuName : "")
			. (StrLen(strWriteAccessMessage) ? "`n`n" . lDialogExternalWriteAccessMessage . ":`n" . strWriteAccessMessage : ""))
		return
	}
	else if (intMenuExternalType > 1 and StrLen(strMenuExternalReservedBy))
		; the collaborative or centralized menu is reserved...
		if (strMenuExternalReservedBy = A_UserName . " (" . A_ComputerName . ")")
			; ... already reserved for this user, return true
			return true
		else
			; ... reserved by another user, return false
		{
			Oops(lOopsMenuExternalReservedBy, (intMenuExternalType = 2 ? lOopsMenuExternalCollaborative : lOopsMenuExternalCentralized), strMenuExternalReservedBy)
			return false
		}
	else if (intMenuExternalType = 2 and ExternalMenuFolderIsReadOnly(objMenu.MenuExternalPath))
	; user cannot write to collaborative external ini file, could not lock it, return false
	{
		Oops(lOopsExternalFileWriteErrorCollaborative)
		return false
	}
	else if ExternalMenuModifiedSinceLoaded(objMenu)
	; external settings file was modified since it was loaded - could not be locked, return false
	{
		; here, user can reload QAP or continue and the lock is refused
		MsgBox, 52, %g_strAppNameText% - %g_strAppVersion%, %lOopsErrorIniFileModified%
		IfMsgBox, Yes
			Gosub, ReloadQAP
		
		return false
	}
	else
	; lock is allowed, return true
	{
		if (intMenuExternalType = 1 and StrLen(strMenuExternalReservedBy) and strMenuExternalReservedBy <> A_ComputerName . " (" . A_UserName . ")")
			; personal menu is changed on another system - only inform user, lock overwriting is allowed
			Oops(lOopsMenuExternalPersonalChangedBy, strMenuExternalReservedBy)
		
		if (blnLockItForMe)
		; lock external menu for this user (do it only when saving changes to the menu, not when checking before opening the add/edit favorite dialog box)
		{
			; in personal menu save "computer (user)", in collaborative or centralized menu save "user (computer)"
			IniWrite, % (intMenuExternalType = 1 ? A_ComputerName . " (" . A_UserName . ")" : A_UserName . " (" . A_ComputerName . ")")
				, % objMenu.MenuExternalPath, Global, MenuReservedBy ; no need to update LastModified for this change
			; remember to free when saving or canceling
			g_objExternaleMenuToRelease.Insert(objMenu.MenuExternalPath)
			; ###_V(A_ThisFunc . " LOCKED", objMenu.MenuExternalPath, 999)
		}

		return true
	}
}
;------------------------------------------------------------


;------------------------------------------------------------
ExternalMenuIsReadOnly(strFile)
; Check if external settings file is Read-only (deprecated) or if it is a Centralized and current user cannot edit it
;------------------------------------------------------------
{
	if ExternalMenuFolderIsReadOnly(strFile)
		return true
	; else check if user is allowed to edit Centralized file

	strFile := PathCombine(A_WorkingDir, EnvVars(strFile))
	IniRead, blnExternalMenuReadOnly, %strFile%, Global, MenuReadOnly, 0 ; deprecated since v8.1.1 but still supported ix exists in ini file
	IniRead, intMenuExternalType, %strFile%, Global, MenuType
	blnExternalMenuReadOnly := (blnExternalMenuReadOnly or intMenuExternalType = 3) ; 3 = Centralized
	
	if (blnExternalMenuReadOnly)
	{
		IniRead, strWriteAccessUsers, %strFile%, Global, WriteAccessUsers, %A_Space% ; empty by default
		loop, Parse, strWriteAccessUsers, `,`; ; official delimiter is comma, semicolon also supported
			if (A_LoopField = A_UserName)
			{
				blnExternalMenuReadOnly := false
				break
			}
	}

	return blnExternalMenuReadOnly
}
;------------------------------------------------------------


;------------------------------------------------------------
ExternalMenuModifiedSinceLoaded(objMenu)
;------------------------------------------------------------
{
	IniRead, strLastModified, % objMenu.MenuExternalPath, Global, LastModified, %A_Space%
	objMenu.MenuExternalLastModifiedNow := strLastModified
	; if (!StrLen(objMenu.MenuExternalLastModifiedWhenLoaded) or !StrLen(objMenu.MenuExternalLastModifiedNow))
	;	###_V(A_ThisFunc . " !!!!!", strLastModified, objMenu.MenuExternalLastModifiedWhenLoaded, objMenu.MenuExternalLastModifiedNow)
	; ###_V(A_ThisFunc . " MODIFIED?", (objMenu.MenuExternalLastModifiedNow > objMenu.MenuExternalLastModifiedWhenLoaded), strLastModified, objMenu.MenuExternalLastModifiedWhenLoaded, objMenu.MenuExternalLastModifiedNow)
	return (objMenu.MenuExternalLastModifiedNow > objMenu.MenuExternalLastModifiedWhenLoaded)
}
;------------------------------------------------------------


;------------------------------------------------------------
ExternalMenuFolderIsReadOnly(strFile)
; Test if user can write to folder containing an external ini file, returns true if file is in a read-only folder, false if it is not read-only
; add folder to object g_objExternalMenuFolderReadOnly to avoid checking same folder again (refreshed only when QAP is restarted)
;------------------------------------------------------------
{
	global g_objExternalMenuFolderReadOnly
	
	strFile := PathCombine(A_WorkingDir, EnvVars(strFile))
	SplitPath, strFile, , strFolder
	
	if !g_objExternalMenuFolderReadOnly.HasKey(strFolder) ; if folder of file was not already checked
	{
		Random, intRandom ; by default an integer between 0 and 2147483647 to generate a random file number and variable number
		strRandomFile := strFolder . "\~$_QAP_Test_file_" . intRandom . ".ini" ; Dropbox does not syn files starting with ~$
		
		IniWrite, %A_UserName% on %A_ComputerName% at %A_Now%, %strRandomFile%, Global, WriteAccessTest
		Sleep, 20 ; for safety
		IniRead, strRead, %strRandomFile%, Global, WriteAccessTest ; ERROR if not found
		
		if (strRead <> "ERROR") ; the ini file was created, now delete it
		{
			intSleepDelay := 20
			Loop
			{
				sleep, %intSleepDelay%
				FileDelete, %strRandomFile% ; remove test file
				if (ErrorLevel) ; error 32 (file used by another process) frequent on synced platforms like Dropbox
				{
					intSleepDelay *= 2 ; double the delay
					if (intSleepDelay > 320) ; after 5 tries
						; ###_V(A_ThisFunc . " ERROR DELETING TEST FILE", ErrorLevel, A_LastError, strFile, strFolder, intRandom, strRandomFile, strRead)
						break
				}
				else
					; ###_V(A_ThisFunc . " CAN WRITE, FILE DELETED", ErrorLevel, A_LastError, strFile, strFolder, intRandom, strRandomFile, strRead)
					break
			}
			g_objExternalMenuFolderReadOnly[strFolder] := false ; folder is not read-only
		}
		else
			; ###_V(A_ThisFunc . " CANNOT WRITE", strFile, strFolder, intRandom, strRandomFile, strRead)
			g_objExternalMenuFolderReadOnly[strFolder] := true ; folder is read-only
	}

	return g_objExternalMenuFolderReadOnly[strFolder]
}
;------------------------------------------------------------


;------------------------------------------------------------
ScriptInfo(Command)
; From Lexikos (https://autohotkey.com/boards/viewtopic.php?t=9656)
; Returns the text that would have been shown in AutoHotkey's main window if you had called Command
; Used to retreive last Lines excuted when exiting if diag mode Enabled
; Test script (retain About 400 last Lines fo code):
	; #InstallKeybdHook
	; Loop, 1000
		; A := A_Index
	; Clipboard := ScriptInfo("ListLines")
	; ExitApp
;------------------------------------------------------------
{
    static hEdit := 0, pfn, bkp
    if !hEdit {
        hEdit := DllCall("GetWindow", "ptr", A_ScriptHwnd, "uint", 5, "ptr")
        user32 := DllCall("GetModuleHandle", "str", "user32.dll", "ptr")
        pfn := [], bkp := []
        for i, fn in ["SetForegroundWindow", "ShowWindow"] {
            pfn[i] := DllCall("GetProcAddress", "ptr", user32, "astr", fn, "ptr")
            DllCall("VirtualProtect", "ptr", pfn[i], "ptr", 8, "uint", 0x40, "uint*", 0)
            bkp[i] := NumGet(pfn[i], 0, "int64")
        }
    }
 
    if (A_PtrSize=8) {  ; Disable SetForegroundWindow and ShowWindow.
        NumPut(0x0000C300000001B8, pfn[1], 0, "int64")  ; return TRUE
        NumPut(0x0000C300000001B8, pfn[2], 0, "int64")  ; return TRUE
    } else {
        NumPut(0x0004C200000001B8, pfn[1], 0, "int64")  ; return TRUE
        NumPut(0x0008C200000001B8, pfn[2], 0, "int64")  ; return TRUE
    }
 
    static cmds := {ListLines:65406, ListVars:65407, ListHotkeys:65408, KeyHistory:65409}
    cmds[Command] ? DllCall("SendMessage", "ptr", A_ScriptHwnd, "uint", 0x111, "ptr", cmds[Command], "ptr", 0) : 0
 
    NumPut(bkp[1], pfn[1], 0, "int64")  ; Enable SetForegroundWindow.
    NumPut(bkp[2], pfn[2], 0, "int64")  ; Enable ShowWindow.
 
    ControlGetText, text,, ahk_id %hEdit%
    return text
}
;------------------------------------------------------------


;========================================================================================================================
; END OF VARIOUS_FUNCTIONS
;========================================================================================================================


;========================================================================================================================
!_098_ONMESSAGE_FUNCTIONS:
return
;========================================================================================================================


;------------------------------------------------
WM_MOUSEMOVE(wParam, lParam)
; "hook" for image buttons cursor and buttons tooltips
; see http://www.autohotkey.com/board/topic/70261-gui-buttons-hover-cant-change-cursor-to-hand/
; and https://autohotkey.com/board/topic/83045-solved-onmessage-gui-tooltips-issues/#entry528803
;------------------------------------------------
{
	static strControl, strControlPrev
	
	global g_objHandCursor
	global g_strGuiFullTitle
	global g_blnFavoritesListFilterNeverFocused
	global g_objToolTipsMessages

	; get window's titte and exit if it is not the Settings window
	WinGetTitle, strCurrentWindow, A
	if (strCurrentWindow <> g_strGuiFullTitle)
		return

	; empty Search box when it receives focus and contains the "Search" prompt
	GuiControlGet, strFocusedControl, FocusV
	GuiControlGet, strFocusedControlText, , f_strFavoritesListFilter
	if (strFocusedControl = "f_strFavoritesListFilter")
		if (g_blnFavoritesListFilterNeverFocused)
		{
			GuiControl, , f_strFavoritesListFilter, % ""
			g_blnFavoritesListFilterNeverFocused := false
		}

	; get hover control name and Static control number
	strControlPrev := strControl
	MouseGetPos, , , , strControl ; Static1, StaticN, Button1, ButtonN
	StringReplace, intControl, strControl, Static
	
	; display hand cursor over selected buttons
	if InStr(strControl, "Static")
	{
		; 2-28 sauf 26
		if (intControl < 2) or (intControl = 28) or (intControl > 30)
			return
	}
	else if !InStr(strControl, "Button")
	{
		ToolTip ; turn ToolTip off
		return
	}
	DllCall("SetCursor", "UInt", g_objHandCursor)
	
	; display tooltip for selected buttons
	if (strControl <> strControlPrev) ;  prevent flicker caused by repeating tooltip when mouse moving over the same control
		and StrLen(g_objToolTipsMessages[strControl])
	{
		ToolTip, % g_objToolTipsMessages[strControl] ; display tooltip or remove tooltip if no message for this control
		if StrLen(g_objToolTipsMessages[strControl])
			SetTimer, RemoveToolTip, 2500 ; will remove tooltip if not removed by mouse going hovering elsewhere (required if window become inactive)
	}

	return
}
;------------------------------------------------


;------------------------------------------------
RemoveToolTip:
;------------------------------------------------

SetTimer, RemoveToolTip, Off
ToolTip

return
;------------------------------------------------


;------------------------------------------------------------
WM_LBUTTONDBLCLK(wParam, lParam, msg, hwnd)
; To prevent double-click on image static controls to copy their path to the clipboard
; see http://www.autohotkey.com/board/topic/94962-doubleclick-on-gui-pictures-puts-their-path-in-your-clipboard/#entry682595
;------------------------------------------------------------
{
    WinGetClass class, ahk_id %hwnd%
    if (class = "Static") {
        if !A_Gui
            return 0  ; Just prevent Clipboard change.
        ; Send a WM_COMMAND message to the Gui to trigger the control's g-label.
        Gui +LastFound
        id := DllCall("GetDlgCtrlID", "ptr", hwnd) ; Requires AutoHotkey v1.1.
        static STN_DBLCLK := 1
        PostMessage 0x111, id | (STN_DBLCLK << 16), hwnd
        ; Return a value to prevent the default handling of this message.
        return 0
    }
}
;------------------------------------------------------------


;------------------------------------------------------------
AHK_NOTIFYICON(wParam, lParam) 
; Adapted from Lexikos http://www.autohotkey.com/board/topic/11250-mouseover-trayicon-triggering-an-event/#entry153388
; To popup menu when left click on the tray icon - See the OnMessage command in the init section
;------------------------------------------------------------
{
	; global g_blnClickOnTrayIcon
	
	if (lParam = 0x202) ; WM_LBUTTONUP
	{
		; g_blnClickOnTrayIcon := true
		Gosub, LaunchFromTrayIcon
		return 0
	}
} 
;------------------------------------------------------------


;------------------------------------------------------------
REPLY_QAPISRUNNING(wParam, lParam) 
;------------------------------------------------------------
{
	Diag("REPLY_QAPISRUNNING:wParam/lParam", wParam . "/" . lParam)
	return true
} 
;------------------------------------------------------------


;------------------------------------------------------------
RECEIVE_QAPMESSENGER(wParam, lParam) 
; Adapted from AHK documentation (https://autohotkey.com/docs/commands/OnMessage.htm)
;------------------------------------------------------------
{
	global g_strAppNameText
	global g_strAppVersion
	global g_strNewLocation
	global g_strTargetClass
	global g_strTargetWinId
	
	SetTargetWinInfo(false) ; as if keyboard because mouse position can go out of Explorer window where menu was called
	Diag(A_ThisFunc . " - g_strTargetClass", g_strTargetClass)
	Diag(A_ThisFunc . " - g_strTargetWinId", g_strTargetWinId)

	Diag("RECEIVE_QAPMESSENGER:wParam/lParam", wParam . "/" . lParam)
	intStringAddress := NumGet(lParam + 2*A_PtrSize) ; Retrieves the CopyDataStruct's lpData member.
	strCopyOfData := StrGet(intStringAddress) ; Copy the string out of the structure.
	Diag("RECEIVE_QAPMESSENGER:strCopyOfData", strCopyOfData)
	
	StringSplit, arrData, strCopyOfData, |
	
	if SubStr(arrData1, 1, 4) <> "Show" and SettingsUnsaved()
		return 0xFFFF
	
	if InStr(arrData1, "AddFolder") and (SubStr(arrData2, -1, 2) = ":""") ; -1 extracts the 2 last characters
		; exception for drive paths
		arrData2 := SubStr(arrData2, 1, StrLen(arrData2) - 1) . "\"

	if (arrData2 = "C:""")
		arrData2 := "C:\"
	
	if (arrData1 = "AddFolder")
	{
		g_strNewLocation := arrData2
		Gosub, AddThisFolderFromMsg
	}
	else if (arrData1 = "AddFile")
	{
		g_strNewLocation := arrData2
		Gosub, AddThisFileFromMsg
	}
	else if (arrData1 = "AddFolderXpress")
	{
		g_strNewLocation := arrData2
		Gosub, AddThisFolderFromMsgXpress
	}
	else if (arrData1 = "AddFileXpress")
	{
		g_strNewLocation := arrData2
		Gosub, AddThisFileFromMsgXpress
	}
	else if (arrData1 = "AddShortcut")
	{
		g_strNewLocation := arrData2
		Gosub, AddThisShortcutFromMsg
	}
	else if (arrData1 = "ShowMenuNavigate")

		Gosub, NavigateFromMsg

	else if (arrData1 = "ShowMenuLaunch")

		Gosub, LaunchFromMsg

	else if (arrData1 = "ShowMenuAlternative")

		Gosub, AlternativeHotkeyKeyboard

	else
		return 0

	return 1
}
;------------------------------------------------------------


