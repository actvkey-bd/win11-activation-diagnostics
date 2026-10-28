@echo off
:: ==============================================================================
:: Windows 11 Activation Error 0x803FA067 Diagnostic & Token Reset Utility
:: Maintained by ActvKey Technical Research Team (https://actvkey.com)
:: License: MIT
:: ==============================================================================

chcp 65001 >nul
title Windows 11 Error 0x803FA067 Cache Cleaner
color 0E

echo ==============================================================================
echo        Windows 11 / 10 Error 0x803FA067 Token & Cache Reset Utility
echo                   Open-Source Tool by ActvKey.com
echo ==============================================================================
echo.

:: Check for Administrator privileges
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo [ERROR] This script requires Administrator privileges!
    echo Please right-click this .bat file and select "Run as administrator".
    echo.
    pause
    exit /b 1
)

echo This tool cleans corrupted KMS tokens, registry key caches, and restarts
echo the Software Protection Service (sppsvc) to resolve activation deadlock.
echo.
echo IMPORTANT: Please make sure your internet is CONNECTED before running this fix.
echo If upgrading from Home to Pro, disconnect Wi-Fi first and use the generic switch.
echo Detailed step-by-step instructions:
echo https://actvkey.com/blog/windows-11-activation-error-0x803fa067-smadhaner-asl-upay
echo.
set /p confirm="Do you want to proceed with resetting activation cache? (Y/N): "
if /I "%confirm%" neq "Y" (
    echo [!] Operation cancelled by user.
    pause
    exit /b 0
)

echo.
echo [*] Step 1: Clearing cached product key from Windows Registry...
cscript //nologo %windir%\system32\slmgr.vbs /cpky
echo [OK] Registry cache cleared.

echo.
echo [*] Step 2: Restarting Software Protection Service (sppsvc)...
net stop sppsvc >nul 2>&1
timeout /t 2 /nobreak >nul
net start sppsvc >nul 2>&1
echo [OK] sppsvc service restarted.

echo.
echo [*] Step 3: Triggering Windows Activation Token Resync...
cscript //nologo %windir%\system32\slmgr.vbs /ato
echo.

echo ==============================================================================
echo                           OPERATION FINISHED
echo ==============================================================================
echo If you have a genuine 25-digit retail key, you can now enter it via:
echo Settings - System - Activation - Change product key
echo.
echo Need genuine retail licenses with AnyDesk remote setup guarantee?
echo Official Store: https://actvkey.com
echo ==============================================================================
echo.
pause
