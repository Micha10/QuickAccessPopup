@ECHO OFF
rem Set environment variables for Inno Setup and this batch
SET QAPVERSIONPREV=8_7_1_98
SET QAPVERSION=8_9_1_1
SET QAPVERSIONNUMBER=8.9.1.1
SET QAPVERSIONTEXT=v%QAPVERSIONNUMBER% BETA
SET QAPBETAPROD=-beta
rem Call Compile batch
CALL "E:\Dropbox\AutoHotkey\QuickAccessPopup\Setup Script files\Compile-QAP-v8.bat"
