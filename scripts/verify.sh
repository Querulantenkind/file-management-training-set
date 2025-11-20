#!/bin/bash

# File Management Training Set - Verification Script
# Verify the integrity and completeness of the training environment

set -e

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TRAINING_ENV="$BASE_DIR/training-env"

echo "========================================="
echo "Training Environment Verification"
echo "========================================="
echo ""

if [ ! -d "$TRAINING_ENV" ]; then
    echo "✗ Training environment not found!"
    echo "Run ./scripts/reset.sh to create it."
    exit 1
fi

echo "Checking directory structure..."
echo ""

ERRORS=0
WARNINGS=0

check_dir() {
    if [ -d "$TRAINING_ENV/$1" ]; then
        echo "✓ $1"
    else
        echo "✗ $1 (missing)"
        ((ERRORS++))
    fi
}

# Check main directories
check_dir "workspace"
check_dir "workspace/projects"
check_dir "workspace/documents"
check_dir "workspace/media"
check_dir "workspace/downloads"
check_dir "workspace/backup"
check_dir "messy-folder"

# Check subdirectories
check_dir "workspace/projects/website-redesign"
check_dir "workspace/projects/data-analysis-2024"
check_dir "workspace/projects/mobile-app"
check_dir "workspace/documents/reports/2023"
check_dir "workspace/documents/reports/2024"
check_dir "workspace/documents/reports/drafts"
check_dir "workspace/media/images/photos"
check_dir "workspace/media/images/screenshots"

echo ""
echo "Checking file counts..."
echo ""

TOTAL_FILES=$(find "$TRAINING_ENV" -type f | wc -l)
TOTAL_DIRS=$(find "$TRAINING_ENV" -type d | wc -l)

echo "Total files: $TOTAL_FILES"
echo "Total directories: $TOTAL_DIRS"

if [ "$TOTAL_FILES" -lt 150 ]; then
    echo "⚠ Warning: Expected at least 150 files, found $TOTAL_FILES"
    ((WARNINGS++))
fi

echo ""
echo "Checking file types..."
echo ""

check_files() {
    local ext=$1
    local min_count=$2
    local count=$(find "$TRAINING_ENV" -name "*.$ext" -type f | wc -l)
    
    if [ "$count" -ge "$min_count" ]; then
        echo "✓ .$ext files: $count (expected at least $min_count)"
    else
        echo "✗ .$ext files: $count (expected at least $min_count)"
        ((WARNINGS++))
    fi
}

check_files "txt" 40
check_files "md" 15
check_files "json" 5
check_files "csv" 5
check_files "log" 10

echo ""
echo "Checking messy folder..."
echo ""

MESSY_FILES=$(find "$TRAINING_ENV/messy-folder" -type f | wc -l)
echo "Messy folder files: $MESSY_FILES"

if [ "$MESSY_FILES" -lt 50 ]; then
    echo "⚠ Warning: Expected at least 50 files in messy-folder, found $MESSY_FILES"
    ((WARNINGS++))
fi

# Check for specific patterns
FILES_WITH_SPACES=$(find "$TRAINING_ENV/messy-folder" -name "* *" -type f | wc -l)
TEMP_FILES=$(find "$TRAINING_ENV/messy-folder" -name "*.tmp" -o -name "*.bak" | wc -l)
DUPLICATE_FILES=$(find "$TRAINING_ENV/messy-folder" -name "duplicate*" -type f | wc -l)

echo "  Files with spaces: $FILES_WITH_SPACES"
echo "  Temporary files: $TEMP_FILES"
echo "  Duplicate files: $DUPLICATE_FILES"

echo ""
echo "Checking key files..."
echo ""

check_file() {
    if [ -f "$TRAINING_ENV/$1" ]; then
        echo "✓ $1"
    else
        echo "✗ $1 (missing)"
        ((WARNINGS++))
    fi
}

check_file "workspace/notes.txt"
check_file "workspace/ImportantFile.txt"
check_file "workspace/projects/website-redesign/src/index.html"
check_file "workspace/projects/data-analysis-2024/data.csv"
check_file "workspace/documents/reports/2024/report-2024-01-15.md"

echo ""
echo "========================================="
echo "Verification Summary"
echo "========================================="
echo ""

if [ $ERRORS -eq 0 ] && [ $WARNINGS -eq 0 ]; then
    echo "✓ All checks passed!"
    echo ""
    echo "The training environment is ready to use."
    exit 0
elif [ $ERRORS -eq 0 ]; then
    echo "⚠ $WARNINGS warning(s) found"
    echo ""
    echo "The environment is usable but may be incomplete."
    echo "Consider running ./scripts/reset.sh to rebuild."
    exit 0
else
    echo "✗ $ERRORS error(s) and $WARNINGS warning(s) found"
    echo ""
    echo "The environment is incomplete or corrupted."
    echo "Run ./scripts/reset.sh to rebuild."
    exit 1
fi

