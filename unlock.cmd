@echo off
chcp 65001 >nul
cd /d "%~dp0"

call "%~dp0restic.env.cmd"

"%~dp0restic.exe" unlock

echo.
pause
