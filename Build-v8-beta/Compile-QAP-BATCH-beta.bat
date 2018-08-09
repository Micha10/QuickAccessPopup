@ECHO OFF
rem Set environment variables for Inno Setup and this batch
SET QAPVERSIONPREV=9_0_9_11
SET QAPVERSION=9_0_9_12
SET QAPVERSIONNUMBER=9.0.9.12
SET QAPVERSIONTEXT=v%QAPVERSIONNUMBER% BETA
SET QAPBETAPROD=-beta
rem Call Compile batch
CALL "E:\Dropbox\AutoHotkey\QuickAccessPopup\Setup Script files\Compile-QAP-v8.bat"
