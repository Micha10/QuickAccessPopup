@ECHO OFF
rem
rem Set environment variables for Inno Setup and the batch Compile-QAP-v8.bat
SET QAPBETAPROD=
SET QAPVERSIONTEXT=v8
SET QAPVERSION=8
SET QAPVERSIONPREV=0%QAPBETAPROD%
SET QAPVERSIONFILE=%QAPVERSION%%QAPBETAPROD%
SET QAPZIPFILE=quickaccesspopup%QAPBETAPROD%
SET QAPZIPFILEVERSION=quickaccesspopup-%QAPVERSIONFILE%
rem Call Compile batch
CALL "C:\Dropbox\AutoHotkey\QuickAccessPopup\Setup Script files\Compile-QAP-v8.bat"
