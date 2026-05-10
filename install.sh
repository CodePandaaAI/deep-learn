#!/bin/bash
# Marrow 🦴 Installer
# "AI talk surface. Marrow go deep."

set -e

REPO="CodePandaaAI/marrow"

echo "🦴 Marrow Installer"
echo "-------------------"

# Primary: Use npx skills (the standard way)
if command -v npx &> /dev/null; then
    echo "📦 Installing via npx skills..."
    npx -y skills add "$REPO"
    echo "✅ Marrow installed successfully!"
else
    # Fallback: Manual download for users without Node.js
    echo "⚠️  npx not found. Falling back to manual install..."

    RAW="https://raw.githubusercontent.com/$REPO/main/skills/marrow/SKILL.md"

    # Cursor
    if [ -d "$HOME/.cursor" ]; then
        mkdir -p .cursor/rules
        curl -s "$RAW" -o .cursor/rules/marrow.md
        echo "✅ Added to Cursor rules."
    fi

    # Windsurf
    if [ -d "$HOME/.windsurf" ] || [ -d "$HOME/.codeium/windsurf" ]; then
        mkdir -p .windsurf/rules
        curl -s "$RAW" -o .windsurf/rules/marrow.md
        echo "✅ Added to Windsurf rules."
    fi

    # Cline
    if [ -d ".clinerules" ]; then
        curl -s "$RAW" -o .clinerules/marrow.md
        echo "✅ Added to Cline rules."
    fi

    echo "✅ Done. For best results, install Node.js and run: npx skills add $REPO"
fi
