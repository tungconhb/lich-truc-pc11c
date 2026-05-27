@echo off
chcp 65001 >nul
echo Đang chuẩn bị deploy lên GitHub Pages...

REM Kiểm tra Git
where git >nul 2>&1
if errorlevel 1 (
    echo ❌ Git chưa cài đặt. Tải tại: https://git-scm.com/download/win
    pause
    exit /b 1
)

REM Khởi tạo Git repo
if not exist ".git" (
    echo Khởi tạo Git repository...
    git init
    git add pc11c.html preview.png
    git commit -m "Lịch trực Firebase version"
) else (
    echo Cập nhật file...
    git add pc11c.html preview.png
    git commit -m "Update lịch trực"
)

REM Kiểm tra remote
git remote -v | findstr origin >nul
if errorlevel 1 (
    echo Chưa có remote origin. Bạn cần:
    echo 1. Vào https://github.com → tạo repository mới tên "lich-truc"
    echo 2. Copy URL của repository (dạng https://github.com/TEN_TAI_KHOAN/lich-truc.git)
    echo 3. Chạy lệnh: git remote add origin URL_VỪA_COPY
    echo 4. Chạy lệnh: git push -u origin main
    pause
    exit /b 1
)

REM Push
echo Push lên GitHub...
git push origin main

echo.
echo ✅ Đã push xong.
echo.
echo Bước tiếp theo:
echo 1. Vào repository trên GitHub → Settings → Pages
echo 2. Source: chọn "Deploy from a branch", Branch: "main" → Save
echo 3. Đợi 1-2 phút, link sẽ là: https://TEN_TAI_KHOAN.github.io/lich-truc/pc11c.html
echo.
pause