@echo off
cd /d "C:\Users\Riddler\Desktop\Lịch trực"
echo Checking for changes...
git status --porcelain | findstr "pc11c.html" >nul
if %errorlevel% equ 0 (
    echo Changes detected. Adding and committing...
    git add pc11c.html
    git commit -m "Fix mobile scaling + update OG description for Zalo"
    echo.
    echo Please push manually via:
    echo 1. Open GitHub Desktop
    echo 2. Or use command: git push origin master
    echo.
    echo Changes committed locally. Ready to push.
) else (
    echo No changes in pc11c.html
)
pause