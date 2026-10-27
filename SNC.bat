@echo off
setlocal EnableDelayedExpansion
title Add Tung Nguyen SNC Lighting Hosts

:: ===== Check Admin =====
net session >nul 2>&1
if %errorlevel% neq 0 (
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

set HOSTS_FILE=%SystemRoot%\System32\drivers\etc\hosts

echo Dang cap nhat hosts...
echo --------------------------------

call :ADD_HOST 10.255.5.50 cloud.snc-lighting.com
call :ADD_HOST 10.255.5.50 erp.snc-lighting.com
call :ADD_HOST 10.255.5.58 oa.snc-lighting.com
call :ADD_HOST 10.255.5.13 label.snc-lighting.com
call :ADD_HOST 10.255.5.6  logis.snc-lighting.com
call :ADD_HOST 10.255.5.105  hxhr.snc-lighting.com
call :ADD_HOST 10.255.5.105  service.snc-lighting.com

ipconfig /flushdns >nul

echo --------------------------------
echo Hoan tat.
pause
exit /b

:ADD_HOST
findstr /i "%2" "%HOSTS_FILE%" >nul
if errorlevel 1 (
    echo %1    %2>>"%HOSTS_FILE%"
    echo [+] Da them %2 -> %1
) else (
    echo [!] %2 da ton tai
)
goto :eof
