@echo off
setlocal enabledelayedexpansion

:: Default output directory (can pass as first argument)
set OUTDIR=%~1
if "%OUTDIR%"=="" set OUTDIR=%cd%\VOC2007

echo Creating output directory: %OUTDIR%
if not exist "%OUTDIR%" mkdir "%OUTDIR%"
cd /d "%OUTDIR%"

:: Files and URLs
set FILE1=VOCtrainval_06-Nov-2007.tar
set URL1a=http://host.robots.ox.ac.uk/pascal/VOC/voc2007/%FILE1%
set URL1b=https://pjreddie.com/media/files/%FILE1%

set FILE2=VOCtest_06-Nov-2007.tar
set URL2a=http://host.robots.ox.ac.uk/pascal/VOC/voc2007/%FILE2%
set URL2b=https://pjreddie.com/media/files/%FILE2%

:: Function-like block for download
:download
set FILE=%1
set URLA=%2
set URLB=%3

if exist "%FILE%" (
    echo Found existing %FILE%, skipping download.
    goto :eof
)

echo Downloading %FILE% ...
powershell -Command "try {Invoke-WebRequest -Uri '%URLA%' -OutFile '%FILE%' -UseBasicParsing -Resume} catch {exit 1}"
if errorlevel 1 (
    echo First URL failed, trying mirror...
    powershell -Command "Invoke-WebRequest -Uri '%URLB%' -OutFile '%FILE%' -UseBasicParsing -Resume"
    if errorlevel 1 (
        echo Failed to download %FILE%
        exit /b 1
    )
)

:eof
exit /b 0

:: Download both archives
call :download %FILE1% %URL1a% %URL1b%
call :download %FILE2% %URL2a% %URL2b%

:: Extract archives (Windows 10+ has tar.exe built-in)
echo Extracting %FILE1% ...
tar -xf %FILE1%
echo Extracting %FILE2% ...
tar -xf %FILE2%

echo.
echo Done!
echo Data extracted under: %OUTDIR%\VOCdevkit\VOC2007
echo    Annotations:  %OUTDIR%\VOCdevkit\VOC2007\Annotations
echo    Images:       %OUTDIR%\VOCdevkit\VOC2007\JPEGImages
echo    Splits:       %OUTDIR%\VOCdevkit\VOC2007\ImageSets\Main

endlocal
