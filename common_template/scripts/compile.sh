#!/bin/bash

# ============================================================================
# LaTeX Compilation Script for AAU Template
# ============================================================================
# This script compiles main.tex properly with bibliography
#
# Usage: ./scripts/compile.sh
# Or: bash scripts/compile.sh
# ============================================================================

echo "============================================"
echo "  AAU LaTeX Compilation Script"
echo "  For: main.tex"
echo "============================================"
echo ""

# Get the directory where the script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# Go to the parent directory (common_template)
cd "$SCRIPT_DIR/.."

# Check if pdflatex is installed
if ! command -v pdflatex &> /dev/null; then
    echo "❌ ERROR: pdflatex is not installed or not in PATH"
    echo ""
    echo "Please install a LaTeX distribution:"
    echo "  - macOS: Install MacTeX from https://www.tug.org/mactex/"
    echo "  - Windows: Install MiKTeX from https://miktex.org/"
    echo "  - Linux: sudo apt-get install texlive-full"
    echo ""
    exit 1
fi

# Check if main file exists
if [ ! -f "main.tex" ]; then
    echo "❌ ERROR: main.tex not found in current directory"
    echo "Please run this script from the common_template folder"
    exit 1
fi

echo "📄 Compiling: main.tex"
echo ""

# First compilation
echo "🔨 Step 1/4: First compilation..."
pdflatex -interaction=nonstopmode main.tex > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "   ✅ Success"
else
    echo "   ⚠️  Warnings (check main.log for details)"
fi

# Run biber for bibliography
if command -v biber &> /dev/null; then
    echo "🔨 Step 2/4: Processing bibliography..."
    biber main > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "   ✅ Success"
    else
        echo "   ⚠️  Bibliography warnings"
    fi
else
    echo "🔨 Step 2/4: Skipping bibliography (biber not found)"
fi

# Second compilation
echo "🔨 Step 3/4: Second compilation..."
pdflatex -interaction=nonstopmode main.tex > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "   ✅ Success"
else
    echo "   ⚠️  Warnings"
fi

# Third compilation (for cross-references)
echo "🔨 Step 4/4: Final compilation..."
pdflatex -interaction=nonstopmode main.tex > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "   ✅ Success"
else
    echo "   ⚠️  Warnings"
fi

echo ""
echo "============================================"

# Check if PDF was created
if [ -f "main.pdf" ]; then
    echo "✅ COMPILATION SUCCESSFUL!"
    echo ""
    echo "📄 PDF created: main.pdf"

    # Get file size
    if command -v du &> /dev/null; then
        size=$(du -h main.pdf | cut -f1)
        echo "📊 File size: $size"
    fi

    # Count pages
    if command -v pdfinfo &> /dev/null; then
        pages=$(pdfinfo main.pdf 2>/dev/null | grep "Pages:" | awk '{print $2}')
        if [ ! -z "$pages" ]; then
            echo "📖 Pages: $pages"
        fi
    fi

    echo ""
    echo "Opening PDF..."

    # Open PDF based on OS
    if [[ "$OSTYPE" == "darwin"* ]]; then
        open main.pdf
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        xdg-open main.pdf 2>/dev/null
    elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
        start main.pdf
    fi

else
    echo "❌ COMPILATION FAILED!"
    echo ""
    echo "Please check main.log for error details"
    echo ""
    echo "Common issues:"
    echo "  - Missing AAUgraphics folder"
    echo "  - Syntax errors in .tex files"
    echo "  - Missing LaTeX packages"
    echo ""
    exit 1
fi

echo "============================================"
echo ""
echo "💡 Tips:"
echo "  - To see detailed output: pdflatex main.tex"
echo "  - To clean auxiliary files: ./scripts/clean.sh"
echo ""
