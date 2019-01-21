Quick Access Popup
==================

Absolutely free to download and use, for personal or commercial use.


Portable installation
---------------------

Follow these instructions if you want to use Quick Access Popup in “portable” mode. This
will, for example, allow you to run it from an external drive or USB key. You’ll just
need to unzip a file.

1) Download quickaccesspopup.zip.

2) There is no software to install. Just extract the zip file content to the folder of your choice.

Note: It is recommended not to install Quick Access Popup in system-protected folders like those
under “C:\Program Files”. This could prevent QAP from saving your configuration.

3) Run the .EXE file from this folder (choose the file QuickAccessPopup-32-bit.exe or
QuickAccessPopup-64-bit.exe depending on your system). Quick Access Popup will create and update
the quickaccesspopup.ini file in this folder. See Quick Access Popup is a Portable App, below.

4) At your convenience, create a shortcut on your Desktop or your Start menu or select
"Run at startup" in the Tray menu to launch Quick Access Popup automatically at startup.

See also the file UPDATE_INSTRUCTIONS.TXT for the best way to install a new version over an existing portable installation.


Quick Access Popup is a Portable App
------------------------------------

A portable application (portable app), sometimes also called standalone, is a program designed
to run on a compatible computer without being installed in a way that modifies the computer’s
configuration information. This type of application can be stored on any storage device, including
internal mass storage and external storage such as USB drives and floppy disks – storing its
program files and any configuration information and data on the storage medium alone
(source: Wikipedia).

Specifically, Quick Access Popup does not write any information in the Windows registry or in any
system or temporary Windows folder. Running the .EXE file launches Quick Access Popup in its
current directory. That’s it! The app creates a temporary subdirectory (named _temp) to store
small images and language files required at run time. This folder is deleted when the app quits.
The only permanent file created by Quick Access Popup is the QuickAccessPopup.ini file containing
your favorites and options.

The file QuickAccessPopup.ico included in this zip file contains the app's icon that you can use to
customize the Quick Access Popup's folder or shortcut.


Quick Access Popup Context menus
--------------------------------

If you want to use QAP context menus, you will have to create registry keys on the host PC. See the
following instructions.

To install context menus, open the file "QuickAccessPopup-InstallContextMenus_reg.txt" and follow
the instructions within.

To remove context menus, open the file "QuickAccessPopup-RemoveContextMenus_bat.txt" and follow the
instructions within.

For more info, see the page http://www.quickaccesspopup.com/explorer-context-menus-help/


Quick Access Popup – Copyright (C) 2013-2017 Jean Lalonde
---------------------------------------------------------

Quick Access Popup can be freely distributed over the internet in an unchanged form.

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file
except in compliance with the License. You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the
License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
either express or implied. See the License for the specific language governing permissions
and limitations under the License.


Jean Lalonde, ahk@jeanlalonde.ca
http://www.QuickAccessPopup.com
