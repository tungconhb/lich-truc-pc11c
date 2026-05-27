# Deploy script for GitHub Pages
Set-Location "C:\Users\Riddler\Desktop\Lịch trực"

# Check if we have changes
$status = git status --porcelain
if ($status -match "M.*pc11c.html") {
    Write-Host "Detected changes in pc11c.html"
    
    # Add and commit
    git add pc11c.html
    git commit -m "Fix mobile scaling + update OG description for Zalo"
    
    # Push using SSH (if configured)
    $remote = git remote get-url origin
    if ($remote -match "git@github.com") {
        Write-Host "Pushing via SSH..."
        git push origin master
    } else {
        # Try with token
        Write-Host "Please push manually via:"
        Write-Host "1. Open GitHub Desktop"
        Write-Host "2. Or use: git push origin master"
        Write-Host ""
        Write-Host "Changes committed locally. Ready to push."
    }
} else {
    Write-Host "No changes detected in pc11c.html"
}