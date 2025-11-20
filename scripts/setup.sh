#!/bin/bash

# File Management Training Set - Setup Script
# Initial setup and dependency check

set -e

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "========================================="
echo "File Management Training Set - Setup"
echo "========================================="
echo ""

# Check for required commands
echo "Checking dependencies..."
echo ""

MISSING_DEPS=()

check_command() {
    if command -v "$1" &> /dev/null; then
        echo "✓ $1 found"
    else
        echo "✗ $1 not found"
        MISSING_DEPS+=("$1")
    fi
}

# Check common Unix utilities
check_command "bash"
check_command "find"
check_command "grep"
check_command "sed"
check_command "awk"
check_command "tar"
check_command "gzip"

# Optional but recommended
echo ""
echo "Optional tools:"
check_command "tree"
check_command "md5sum"

echo ""

if [ ${#MISSING_DEPS[@]} -gt 0 ]; then
    echo "WARNING: Missing required dependencies:"
    printf '  - %s\n' "${MISSING_DEPS[@]}"
    echo ""
    echo "Please install the missing tools before continuing."
    exit 1
else
    echo "✓ All required dependencies found!"
fi

echo ""
echo "Checking training environment..."

if [ -d "$BASE_DIR/training-env" ]; then
    echo "✓ Training environment exists"
    TOTAL_FILES=$(find "$BASE_DIR/training-env" -type f 2>/dev/null | wc -l)
    echo "  Files: $TOTAL_FILES"
    
    if [ "$TOTAL_FILES" -lt 50 ]; then
        echo ""
        echo "⚠ Warning: Training environment seems incomplete."
        echo "Run ./scripts/reset.sh to rebuild it."
    fi
else
    echo "✗ Training environment not found"
    echo ""
    echo "Creating training environment..."
    "$BASE_DIR/scripts/reset.sh"
fi

echo ""
echo "========================================="
echo "Setup complete!"
echo "========================================="
echo ""
echo "Quick Start:"
echo "  1. Read the exercises: cat EXERCISES.md | less"
echo "  2. Navigate to workspace: cd training-env/workspace"
echo "  3. Start with Exercise 01"
echo ""
echo "Useful commands:"
echo "  - Reset environment: ./scripts/reset.sh"
echo "  - View reference: cat REFERENCE.md | less"
echo ""
echo "Happy learning! 🎯"
echo ""

