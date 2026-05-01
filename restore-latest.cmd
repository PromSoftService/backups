@echo off
chcp 65001 >nul
cd /d "%~dp0"

call "%~dp0restic.env.cmd"

echo Restoring latest snapshot to:
echo %RESTORE_TARGET%
echo.

"%~dp0restic.exe" restore latest --target "%RESTORE_TARGET%"

echo.
pause
