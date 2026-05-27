Write-Host "=== DEPLOY LÊN GITHUB PAGES ===" -ForegroundColor Cyan

# Kiểm tra Git
$gitPath = Get-Command git -ErrorAction SilentlyContinue
if (-not $gitPath) {
    Write-Host "❌ Git chưa cài đặt." -ForegroundColor Red
    Write-Host "   Tải tại: https://git-scm.com/download/win" -ForegroundColor Yellow
    pause
    exit
}

# Khởi tạo repo nếu chưa có
if (-not (Test-Path ".git")) {
    Write-Host "Khởi tạo Git repository..." -ForegroundColor Green
    git init
    git add pc11c.html preview.png README_DEPLOY.md
    git commit -m "Lich truc Firebase version"
} else {
    Write-Host "Cập nhật file..." -ForegroundColor Green
    git add pc11c.html preview.png README_DEPLOY.md
    git commit -m "Update lich truc"
}

# Kiểm tra remote origin
$remote = git remote -v 2>$null | Select-String "origin"
if (-not $remote) {
    Write-Host "`n❌ Chưa có remote origin." -ForegroundColor Red
    Write-Host "`nBạn cần:" -ForegroundColor Yellow
    Write-Host "1. Repository đã tạo: https://github.com/tungconhb/lich-truc-pc11c" -ForegroundColor White
    Write-Host "2. Chạy lệnh sau:" -ForegroundColor White
    Write-Host "   git remote add origin https://github.com/tungconhb/lich-truc-pc11c.git" -ForegroundColor Cyan
    Write-Host "3. Rồi chạy lại script này." -ForegroundColor White
    pause
    exit
}

# Push
Write-Host "Push lên GitHub..." -ForegroundColor Green
git push -u origin main

Write-Host "`n✅ Đã push xong." -ForegroundColor Green
Write-Host "`nBước tiếp theo:" -ForegroundColor Yellow
Write-Host "1. Vào: https://github.com/tungconhb/lich-truc-pc11c/settings/pages" -ForegroundColor White
Write-Host "2. Source: chọn 'Deploy from a branch'" -ForegroundColor White
Write-Host "3. Branch: 'main' → Save" -ForegroundColor White
Write-Host "4. Đợi 1-2 phút, link sẽ là:" -ForegroundColor White
Write-Host "   https://tungconhb.github.io/lich-truc-pc11c/pc11c.html" -ForegroundColor Cyan
Write-Host "`nNhấn Enter để mở link..." -ForegroundColor Gray
pause

# Mở GitHub Pages
Start-Process "https://github.com/tungconhb/lich-truc-pc11c/settings/pages"