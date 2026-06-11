# Lab 5 — Create GitHub repo and push (run once as repo owner)
# Prerequisites: git installed, GitHub CLI installed, logged in via: gh auth login

param(
    [string]$RepoName = "lab5-production-inspection",
    [ValidateSet("public", "private")]
    [string]$Visibility = "private"
)

$ErrorActionPreference = "Stop"
$Lab5Root = $PSScriptRoot

Set-Location $Lab5Root

# Verify gh is logged in
$authStatus = gh auth status 2>&1
if ($LASTEXITCODE -ne 0) {
    Write-Host ""
    Write-Host "GitHub CLI is not logged in." -ForegroundColor Red
    Write-Host "Run this first, then run this script again:" -ForegroundColor Yellow
    Write-Host "  gh auth login" -ForegroundColor Cyan
    Write-Host ""
    exit 1
}

# Init git in Lab5 only (not parent folders)
if (-not (Test-Path ".git")) {
    git init
    git branch -M main
    Write-Host "Initialized git repo in Lab5/" -ForegroundColor Green
}

# Initial commit if needed
$hasCommits = git rev-parse HEAD 2>$null
if (-not $hasCommits) {
    git add .
    git commit -m "Initial commit: Lab 5 team project structure and planning docs"
    Write-Host "Created initial commit." -ForegroundColor Green
}

# Create GitHub repo and push
Write-Host "Creating GitHub repo: $RepoName ($Visibility)..." -ForegroundColor Cyan
gh repo create $RepoName --$Visibility --source=. --remote=origin --push --description "Lab 5 - Production Quality Inspection Processing System (SQL Server Developer)"

if ($LASTEXITCODE -eq 0) {
    $url = gh repo view --json url -q .url
    Write-Host ""
    Write-Host "Success! Repository created:" -ForegroundColor Green
    Write-Host "  $url" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Next steps:" -ForegroundColor Yellow
    Write-Host "  1. Share this link with your team"
    Write-Host "  2. Add collaborators: gh repo edit $RepoName --add-collaborator USERNAME"
    Write-Host "  3. Add your instructor as collaborator before submission"
    Write-Host "  4. Team members clone and follow CONTRIBUTING.md"
} else {
    Write-Host "Failed to create repo. It may already exist — try:" -ForegroundColor Red
    Write-Host "  git remote add origin https://github.com/YOUR_USERNAME/$RepoName.git"
    Write-Host "  git push -u origin main"
}
