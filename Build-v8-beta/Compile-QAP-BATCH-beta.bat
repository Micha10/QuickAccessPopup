@ECHO OFF
rem Set environment variables for Inno Setup and this batch
SET QAPVERSIONPREV=9_0_9_7
SET QAPVERSION=9_0_9_8
SET QAPVERSIONNUMBER=9.0.9.8
SET QAPVERSIONTEXT=v%QAPVERSIONNUMBER% BETA
SET QAPBETAPROD=-beta
rem Call Compile batch
CALL "E:\Dropbox\AutoHotkey\QuickAccessPopup\Setup Script files\Compile-QAP-v8.bat"
