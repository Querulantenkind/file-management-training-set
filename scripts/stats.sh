#!/bin/bash

# File Management Training Set - Statistics & Analytics
# Shows comprehensive statistics about the training environment

set -e

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TRAINING_ENV="$BASE_DIR/training-env"
WORKSPACE="$TRAINING_ENV/workspace"

if [ ! -d "$WORKSPACE" ]; then
    echo "Error: Training environment not found!"
    echo "Run: ./scripts/setup.sh"
    exit 1
fi

cd "$WORKSPACE"

echo "========================================="
echo "Training Environment Statistics"
echo "========================================="
echo ""

# Basic counts
TOTAL_FILES=$(find . -type f 2>/dev/null | wc -l)
TOTAL_DIRS=$(find . -type d 2>/dev/null | wc -l)
TOTAL_HIDDEN=$(find . -name '.*' -type f 2>/dev/null | wc -l)

echo "📊 Basic Statistics:"
echo "   Total files: $TOTAL_FILES"
echo "   Total directories: $TOTAL_DIRS"
echo "   Hidden files: $TOTAL_HIDDEN"
echo ""

# File types
echo "📁 File Types Distribution:"
for ext in txt md json csv log xml sql html js css py yaml yml; do
    count=$(find . -name "*.$ext" -type f 2>/dev/null | wc -l)
    if [ "$count" -gt 0 ]; then
        printf "   .%-6s : %4d files\n" "$ext" "$count"
    fi
done
echo ""

# Size statistics
echo "📏 Size Statistics:"
TOTAL_SIZE=$(du -sh . 2>/dev/null | cut -f1)
echo "   Total size: $TOTAL_SIZE"
echo ""

# Largest files
echo "🔝 Top 5 Largest Files:"
find . -type f -exec du -h {} + 2>/dev/null | sort -rh | head -5 | while read size file; do
    printf "   %6s  %s\n" "$size" "$file"
done
echo ""

# Smallest non-empty files
echo "🔻 Top 5 Smallest Non-Empty Files:"
find . -type f ! -size 0 -exec du -h {} + 2>/dev/null | sort -h | head -5 | while read size file; do
    printf "   %6s  %s\n" "$size" "$file"
done
echo ""

# Empty files
EMPTY_COUNT=$(find . -type f -empty 2>/dev/null | wc -l)
echo "📭 Empty Files: $EMPTY_COUNT"
if [ "$EMPTY_COUNT" -gt 0 ] && [ "$EMPTY_COUNT" -le 10 ]; then
    find . -type f -empty 2>/dev/null | sed 's|^\./|   |'
fi
echo ""

# Directory depth
echo "📂 Directory Structure:"
MAX_DEPTH=$(find . -type d 2>/dev/null | awk -F'/' '{print NF-1}' | sort -n | tail -1)
echo "   Maximum depth: $MAX_DEPTH levels"
echo "   Average files per directory: $((TOTAL_FILES / TOTAL_DIRS))"
echo ""

# Most files in a directory
echo "📦 Directories with Most Files:"
find . -type d -exec sh -c 'echo "$(find "$1" -maxdepth 1 -type f 2>/dev/null | wc -l) $1"' _ {} \; 2>/dev/null | \
    sort -rn | head -5 | while read count dir; do
    printf "   %3d files  %s\n" "$count" "$dir"
done
echo ""

# File age statistics
echo "⏰ File Age Statistics:"
RECENT=$(find . -type f -mtime -7 2>/dev/null | wc -l)
OLD=$(find . -type f -mtime +30 2>/dev/null | wc -l)
echo "   Modified in last 7 days: $RECENT"
echo "   Modified more than 30 days ago: $OLD"
echo ""

# Files with spaces
FILES_WITH_SPACES=$(find . -name "* *" -type f 2>/dev/null | wc -l)
echo "🔤 Naming Patterns:"
echo "   Files with spaces: $FILES_WITH_SPACES"
echo "   Files with numbers: $(find . -name "*[0-9]*" -type f 2>/dev/null | wc -l)"
echo "   Files with dates: $(find . -name "*202[0-9]*" -type f 2>/dev/null | wc -l)"
echo ""

# Duplicate detection (by name)
echo "🔄 Potential Duplicates (by name):"
find . -type f -printf "%f\n" 2>/dev/null | sort | uniq -d | head -5 | while read name; do
    count=$(find . -name "$name" -type f 2>/dev/null | wc -l)
    printf "   %s (%d copies)\n" "$name" "$count"
done
if [ $(find . -type f -printf "%f\n" 2>/dev/null | sort | uniq -d | wc -l) -eq 0 ]; then
    echo "   None found"
fi
echo ""

# Messy folder stats
if [ -d "../messy-folder" ]; then
    MESSY_FILES=$(find ../messy-folder -type f 2>/dev/null | wc -l)
    MESSY_DIRS=$(find ../messy-folder -type d 2>/dev/null | wc -l)
    echo "🗂️  Messy Folder:"
    echo "   Files: $MESSY_FILES"
    echo "   Directories: $MESSY_DIRS"
    echo "   Files with spaces: $(find ../messy-folder -name "* *" -type f 2>/dev/null | wc -l)"
    echo "   Temporary files (.tmp, .bak): $(find ../messy-folder \( -name "*.tmp" -o -name "*.bak" \) -type f 2>/dev/null | wc -l)"
    echo ""
fi

# Permission statistics
echo "🔐 Permission Statistics:"
EXECUTABLE=$(find . -type f -executable 2>/dev/null | wc -l)
WRITABLE=$(find . -type f -writable 2>/dev/null | wc -l)
echo "   Executable files: $EXECUTABLE"
echo "   Writable files: $WRITABLE"
echo ""

# Extension summary
echo "📋 Extension Summary:"
find . -type f -name "*.*" 2>/dev/null | sed 's|.*\.||' | sort | uniq -c | sort -rn | head -10 | \
    while read count ext; do
    printf "   %4d  .%s\n" "$count" "$ext"
done
echo ""

# Recent activity
echo "🕐 Most Recently Modified Files:"
find . -type f -printf "%T@ %p\n" 2>/dev/null | sort -rn | head -5 | \
    while read timestamp file; do
    date_str=$(date -d "@$timestamp" +"%Y-%m-%d %H:%M" 2>/dev/null || echo "recent")
    printf "   %s  %s\n" "$date_str" "$file"
done
echo ""

# Complexity score
echo "📈 Complexity Score:"
COMPLEXITY=0
COMPLEXITY=$((COMPLEXITY + TOTAL_FILES / 10))
COMPLEXITY=$((COMPLEXITY + FILES_WITH_SPACES))
COMPLEXITY=$((COMPLEXITY + TOTAL_HIDDEN))
COMPLEXITY=$((COMPLEXITY + MAX_DEPTH * 2))

if [ "$COMPLEXITY" -lt 20 ]; then
    LEVEL="Easy"
elif [ "$COMPLEXITY" -lt 50 ]; then
    LEVEL="Medium"
elif [ "$COMPLEXITY" -lt 100 ]; then
    LEVEL="Hard"
else
    LEVEL="Expert"
fi

echo "   Score: $COMPLEXITY"
echo "   Level: $LEVEL"
echo ""

echo "========================================="
echo "Statistics Complete!"
echo "========================================="
echo ""
echo "💡 Tips:"
echo "   - Use: ./scripts/difficulty.sh <level>  # Adjust complexity"
echo "   - Use: ./scripts/randomize.sh          # Shuffle files"
echo "   - Use: ./scripts/reset.sh               # Reset to default"
echo ""

