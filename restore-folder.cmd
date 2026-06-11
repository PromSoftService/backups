@echo off
chcp 65001 >nul
setlocal
cd /d "%~dp0"

call "%~dp0restic.env.cmd"

if "%~1"=="" (
  echo Usage:
  echo restore-folder.cmd "D:\current\Documents" [SNAPSHOT_ID]
  echo.
  echo Examples:
  echo restore-folder.cmd "D:\current\Library\110 Demo Project 1"
  echo restore-folder.cmd "D:\current\Library\110 Demo Project 1" 69374006
  echo.
  echo If SNAPSHOT_ID is not specified, latest is used.
  echo.
  pause
  exit /b 1
)

if "%RESTORE_TARGET%"=="" (
  echo ERROR: RESTORE_TARGET is not set. Check restic.env.cmd
  echo.
  pause
  exit /b 1
)

set "RESTORE_SOURCE=%~1"

if "%~2"=="" (
  set "SNAPSHOT_ID=latest"
) else (
  set "SNAPSHOT_ID=%~2"
)

set "RESTORE_SOURCE=%RESTORE_SOURCE:\=/%"
set "RESTORE_SOURCE=/%RESTORE_SOURCE::=%"
set "RESTORE_INCLUDE=%RESTORE_SOURCE%/**"

echo Restoring folder:
echo %~1
echo.
echo Snapshot:
echo %SNAPSHOT_ID%
echo.
echo Restic include path:
echo %RESTORE_INCLUDE%
echo.
echo To:
echo %RESTORE_TARGET%
echo.

"%~dp0restic.exe" restore "%SNAPSHOT_ID%" --target "%RESTORE_TARGET%" --include "%RESTORE_INCLUDE%"

echo.
pause
