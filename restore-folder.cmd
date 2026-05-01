@echo off
chcp 65001 >nul
cd /d "%~dp0"

call "%~dp0restic.env.cmd"

if "%~1"=="" (
  echo Usage:
  echo restore-folder.cmd "D:\current\Документы"
  echo.
  pause
  exit /b 1
)

set RESTORE_SOURCE=%~1
set RESTORE_SOURCE=%RESTORE_SOURCE:\=/%
set RESTORE_SOURCE=/%RESTORE_SOURCE::=%
set RESTORE_INCLUDE=%RESTORE_SOURCE%/**

echo Restoring folder:
echo %~1
echo.
echo Restic include path:
echo %RESTORE_INCLUDE%
echo.
echo To:
echo %RESTORE_TARGET%
echo.

"%~dp0restic.exe" restore latest --target "%RESTORE_TARGET%" --include "%RESTORE_INCLUDE%"

echo.
pause
