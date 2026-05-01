@echo off
chcp 65001 >nul
cd /d "%~dp0"

call "%~dp0restic.env.cmd"

if "%~1"=="" (
  echo Usage:
  echo restore-snapshot.cmd SNAPSHOT_ID
  echo Example:
  echo restore-snapshot.cmd fe9a9400
  echo.
  pause
  exit /b 1
)

echo Restoring snapshot:
echo %~1
echo.
echo To:
echo %RESTORE_TARGET%
echo.

"%~dp0restic.exe" restore "%~1" --target "%RESTORE_TARGET%"

echo.
pause
