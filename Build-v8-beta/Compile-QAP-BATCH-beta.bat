@ECHO OFF
rem Set environment variables for Inno Setup and this batch
SET QAPVERSIONPREV=8_9_1_10
SET QAPVERSION=9_0_2_9
SET QAPVERSIONNUMBER=9.0.2.9
SET QAPVERSIONTEXT=v%QAPVERSIONNUMBER% BETA
SET QAPBETAPROD=-beta
rem Call Compile batch
CALL "E:\Dropbox\AutoHotkey\QuickAccessPopup\Setup Script files\Compile-QAP-v8.bat"
