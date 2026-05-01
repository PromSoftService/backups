@echo off
chcp 65001 >nul
cd /d "%~dp0"

call "%~dp0restic.env.cmd"

echo Starting backup...
echo Repository: %RESTIC_REPOSITORY%
echo Sources file: %~dp0sources.txt
echo Excludes file: %~dp0excludes.txt
echo.

"%~dp0restic.exe" backup ^
  --files-from "%~dp0sources.txt" ^
  --exclude-file "%~dp0excludes.txt" ^
  --tag main ^
  --verbose

echo.
echo Backup finished.
pause
