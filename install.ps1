# Marrow 🦴 Installer
# "AI talk surface. Marrow go deep."

$REPO = "CodePandaaAI/marrow"

Write-Host "🦴 Marrow Installer" -ForegroundColor Cyan
Write-Host "-------------------"

# Primary: Use npx skills (the standard way)
if (Get-Command npx -ErrorAction SilentlyContinue) {
    Write-Host "📦 Installing via npx skills..."
    npx -y skills add $REPO
    Write-Host "✅ Marrow installed successfully!"
} else {
    # Fallback: Manual download for users without Node.js
    Write-Host "⚠️  npx not found. Falling back to manual install..."

    $RAW = "https://raw.githubusercontent.com/$REPO/main/skills/marrow/SKILL.md"

    # Cursor
    if (Test-Path "$env:USERPROFILE\.cursor") {
        New-Item -ItemType Directory -Force -Path ".cursor/rules" | Out-Null
        Invoke-WebRequest -Uri $RAW -OutFile ".cursor/rules/marrow.md"
        Write-Host "✅ Added to Cursor rules."
    }

    # Windsurf
    if (Test-Path "$env:USERPROFILE\.windsurf") {
        New-Item -ItemType Directory -Force -Path ".windsurf/rules" | Out-Null
        Invoke-WebRequest -Uri $RAW -OutFile ".windsurf/rules/marrow.md"
        Write-Host "✅ Added to Windsurf rules."
    }

    # Cline
    if (Test-Path ".clinerules") {
        Invoke-WebRequest -Uri $RAW -OutFile ".clinerules/marrow.md"
        Write-Host "✅ Added to Cline rules."
    }

    Write-Host "✅ Done. For best results, install Node.js and run: npx skills add $REPO"
}
