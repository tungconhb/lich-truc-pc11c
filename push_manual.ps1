# Manual push script
Set-Location "C:\Users\Riddler\Desktop\Lịch trực"

Write-Host "Current commit to push:" -ForegroundColor Yellow
git log --oneline -2

Write-Host "`nTrying to push to GitHub..." -ForegroundColor Yellow
Write-Host "If this fails, please use one of these methods:" -ForegroundColor Red
Write-Host "1. Open GitHub Desktop and click Push" -ForegroundColor Cyan
Write-Host "2. Use command: git push origin master" -ForegroundColor Cyan
Write-Host "3. Or use token: git push https://<YOUR_TOKEN>@github.com/tungconhb/lich-truc-pc11c.git master" -ForegroundColor Cyan

# Try push
try {
    git push origin master
} catch {
    Write-Host "Push failed. Please push manually." -ForegroundColor Red
}

Write-Host "`nAfter pushing, wait 1-2 minutes for GitHub Pages update." -ForegroundColor Green
Write-Host "Test URL: https://tungconhb.github.io/lich-truc-pc11c/pc11c.html?v=3" -ForegroundColor Green