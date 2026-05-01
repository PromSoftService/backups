@echo off
chcp 65001 >nul
cd /d "%~dp0"

call "%~dp0restic.env.cmd"

echo Initializing restic repository:
echo %RESTIC_REPOSITORY%
echo.

"%~dp0restic.exe" init

echo.
pause
