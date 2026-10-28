@echo off
:: ==============================================================================
:: Windows 11 Activation & License Forensic Diagnostic Tool
:: Maintained by ActvKey Technical Research Team (https://actvkey.com)
:: License: MIT
:: ==============================================================================

chcp 65001 >nul
title Windows 11 License Diagnostic Tool
color 0B

echo ==============================================================================
echo        Windows 11 / 10 License & Activation Diagnostic Utility
echo                  Open-Source Tool by ActvKey.com
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

echo [*] Initializing Windows Software Licensing Management Tool (slmgr)...
echo.

echo ------------------------------------------------------------------------------
echo [1/3] Checking Permanent vs Expiring (KMS) Status:
echo ------------------------------------------------------------------------------
cscript //nologo %windir%\system32\slmgr.vbs /xpr
echo.

echo ------------------------------------------------------------------------------
echo [2/3] Checking License Channel (Retail, OEM, Volume KMS):
echo ------------------------------------------------------------------------------
cscript //nologo %windir%\system32\slmgr.vbs /dli
echo.

echo ------------------------------------------------------------------------------
echo [3/3] Checking Installed Product Key Partial Hash:
echo ------------------------------------------------------------------------------
cscript //nologo %windir%\system32\slmgr.vbs /dlv | findstr /I "Name Description Partial Product Key Channel Notification"
echo.

echo ==============================================================================
echo                              DIAGNOSIS GUIDE
echo ==============================================================================
echo  - If it says "Retail channel" and "The machine is permanently activated":
echo    Your Windows is 100% genuine and safe.
echo.
echo  - If it says "VOLUME_KMSCLIENT" or has an expiration date:
echo    Your system is using a KMS emulator/crack that may pose security risks.
echo.
echo  - Encountering Error 0x803FA067 or needing genuine retail activation?
echo    Full Documentation: https://actvkey.com/blog/windows-11-activation-error-0x803fa067-smadhaner-asl-upay
echo ==============================================================================
echo.
pause
