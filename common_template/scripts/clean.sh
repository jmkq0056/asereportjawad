#!/bin/bash

# ============================================================================
# LaTeX Cleanup Script
# ============================================================================
# This script removes all auxiliary files created during compilation
# Keeps only the source files and the final PDF
#
# Usage: ./scripts/clean.sh
# Or: bash scripts/clean.sh
# ============================================================================

echo "============================================"
echo "  LaTeX Cleanup Script"
echo "============================================"
echo ""

# Get the directory where the script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# Go to the parent directory (common_template)
cd "$SCRIPT_DIR/.."

echo "🧹 Cleaning auxiliary files..."
echo ""

# Remove LaTeX auxiliary files
files_to_remove=(
    "*.aux"
    "*.log"
    "*.out"
    "*.toc"
    "*.bbl"
    "*.blg"
    "*.bcf"
    "*.run.xml"
    "*.fls"
    "*.fdb_latexmk"
    "*.synctex.gz"
    "*.nav"
    "*.snm"
    "*.vrb"
    "*.lof"
    "*.lot"
    "*.idx"
    "*.ind"
    "*.ilg"
    "*.glo"
    "*.gls"
    "*.glg"
    "*.xdy"
)

removed_count=0

for pattern in "${files_to_remove[@]}"; do
    if ls $pattern 1> /dev/null 2>&1; then
        for file in $pattern; do
            rm "$file"
            echo "   ✅ Removed: $file"
            ((removed_count++))
        done
    fi
done

# Also clean in chapters folder
cd chapters
for pattern in "${files_to_remove[@]}"; do
    if ls $pattern 1> /dev/null 2>&1; then
        for file in $pattern; do
            rm "$file"
            echo "   ✅ Removed: chapters/$file"
            ((removed_count++))
        done
    fi
done
cd ..

echo ""
echo "============================================"

if [ $removed_count -gt 0 ]; then
    echo "✅ Cleanup complete!"
    echo "📊 Removed $removed_count auxiliary file(s)"
else
    echo "✨ Already clean! No auxiliary files found."
fi

echo ""
echo "Kept files:"
echo "  ✅ main.tex (main source)"
echo "  ✅ main.pdf (output)"
echo "  ✅ aau.cls (document class)"
echo "  ✅ references.bib (bibliography)"
echo "  ✅ chapters/ (chapter files)"
echo "  ✅ AAUgraphics/ (graphics)"
echo "  ✅ All other source files"
echo ""
echo "============================================"
