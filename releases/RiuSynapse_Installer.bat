@echo off
title RiuSynapse Installer
color 0A

echo ========================================
echo  RiuSynapse v2.8.5 Installer
echo ========================================
echo.

echo [1] Checking system requirements...
timeout /t 2 >nul

echo [2] Installing dependencies...
timeout /t 3 >nul

echo [3] Extracting files...
timeout /t 2 >nul

echo [4] Setting up executor...
timeout /t 2 >nul

echo [5] Creating shortcuts...
timeout /t 1 >nul

echo.
echo Installation completed successfully!
echo.
echo Press any key to launch RiuSynapse...
pause >nul

start RiuSynapse.exe
