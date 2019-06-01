:: Usage: curlDl.bat "NAME" TOPRIGHT "URL"

:: curlDl.bat "The Houses of Parliament, Sunset" 66 "https://media.nga.gov/fastcgi/iipsrv.fcgi?FIF=/public/objects/4/6/5/2/3/46523-primary-0-nativeres.ptif&SDS=0,90&JTL=8,3952"

@echo off

set name=%1
set /A column=%2+1
set url=%3
set url=%url:~0,-1%

for %%a in (%url:,= %) do set /A count=%%a
set url=%url:%count%=%

if exist %name% (
	echo Directory: %name% exists.
	exit /B
)

md %name%
cd %name%
echo.
echo Download images ...
echo.
echo URL: %url%
echo.
SETLOCAL EnableDelayedExpansion
for /L %%i in (0,1,%count%) do (
	set filename=000%%i
	set filename=!filename:~-4!
	echo %%i/%count% !filename!.jpg
	curl -# -o "!filename!.jpg" %url%%%i"
)
echo.
echo Merge into a single file...

magick montage *.* -geometry +0+0 -tile %column%x ../%name%.jpg

echo.
echo File: %name%.jpg
