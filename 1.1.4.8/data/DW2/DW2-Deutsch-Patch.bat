@echo off
chcp 1252>NUL          &:: für richtige Umlautdarstellung (mit ANSI-Codierung)
echo Diese Batch-Datei installiert den DW2-Deutsch-Patch.
echo Die zu überschreibenden Dateien und Verzeichnisse werden dabei in ein "Backup"-Verzeichnis gesichert.
echo (Abbruch mit Strg-C)
echo.
pause
echo.
::----------- TEST OB RICHTIGES VERZEICHNIS -------------
echo Teste, ob Deutsch-Patch im richtigen Verzeichnis ausgeführt wird...
if not exist "..\Galactopedia\" goto falsch
echo Der Patch scheint im richtigen Verzeichnis zu sein.
echo.
::----------- SICHERUNG ------------
echo Sichere vorige Dateien...
if not exist ..\Backup\ mkdir ..\Backup\
xcopy /S ..\Galactopedia\ ..\Backup\Galactopedia\
xcopy /S ..\dialog\ ..\Backup\dialog\
xcopy /Y ..\Hints.txt ..\Backup\
xcopy /Y ..\TourItems.xml ..\Backup\
echo.
::-------------- LÖSCHEN VERZEICHNISSE ---------------
echo Alte Galactopedia und dialog Verzeichnisse werden gelöscht...
if exist ..\Galactopedia\ rmdir /S /Q ..\Galactopedia\
if exist ..\dialog\ rmdir /S /Q ..\dialog\
echo.
::-------------- KOPIEREN DER PATCH-DATEIEN -----------
echo Patch-Dateien werden kopiert...
xcopy /S .\Galactopedia\ ..\Galactopedia\
xcopy /S .\dialog\ ..\dialog\
xcopy /Y .\*.xml ..\
xcopy /Y .\*.txt ..\
echo.
::-------------- ENDE --------------
echo Deutsch-Patch-Dateien kopiert
echo Alte Dateien befinden sich im Backup-Ordner
echo.
pause
exit
::------------- PATCH IM FALSCHEN VERZEICHNIS --------------
:falsch
echo Der Deutsch Patch scheint im falschen Verzeichnis zu sein.
echo.
echo Bitte stelle sicher, dass das Patch-Verzeichnis DW2 im "data"-Ordner des Spieleverzeichnisses ist
echo und starte diese Batch-Datei neu.
echo.
pause
exit
