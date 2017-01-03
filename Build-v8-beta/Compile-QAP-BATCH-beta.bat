@ECHO OFF
rem
rem Set environment variables for Inno Setup and this batch
SET QAPBETAPROD=-beta
SET QAPVERSIONTEXT=v7.9.2.4 BETA
SET QAPVERSION=7_9_2_4
SET QAPVERSIONPREV=0%QAPBETAPROD%
SET QAPVERSIONFILE=%QAPVERSION%%QAPBETAPROD%
SET QAPZIPFILE=quickaccesspopup%QAPBETAPROD%
SET QAPZIPFILEVERSION=quickaccesspopup-%QAPVERSIONFILE%
rem Call Compile batch
CALL "C:\Dropbox\AutoHotkey\QuickAccessPopup\Setup Script files\Compile-QAP-v8.bat"
