#!/bin/bash

# File Management Training Set - Difficulty Adjuster
# Adjusts the complexity of the training environment

set -e

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TRAINING_ENV="$BASE_DIR/training-env"
WORKSPACE="$TRAINING_ENV/workspace"

if [ $# -eq 0 ]; then
    echo "Usage: $0 <level>"
    echo ""
    echo "Difficulty Levels:"
    echo "  easy     - Simplified environment (fewer files, clearer names)"
    echo "  medium   - Standard environment (default)"
    echo "  hard     - Complex environment (more files, tricky names)"
    echo "  expert   - Maximum complexity (many files, hidden files, duplicates)"
    echo ""
    echo "Examples:"
    echo "  $0 easy"
    echo "  $0 hard"
    exit 1
fi

DIFFICULTY="${1,,}"  # Convert to lowercase

if [ ! -d "$WORKSPACE" ]; then
    echo "Error: Training environment not found!"
    echo "Run: ./scripts/setup.sh"
    exit 1
fi

echo "========================================="
echo "Adjusting Difficulty: $DIFFICULTY"
echo "========================================="
echo ""

cd "$WORKSPACE"

case "$DIFFICULTY" in
    easy)
        echo "🎯 Setting EASY mode..."
        echo ""
        echo "This will:"
        echo "  - Simplify file names"
        echo "  - Remove some complex nested structures"
        echo "  - Make patterns more obvious"
        echo ""
        read -p "Continue? (yes/no): " confirm
        if [ "$confirm" != "yes" ]; then
            echo "Cancelled."
            exit 0
        fi
        
        # Simplify names in messy folder
        echo "Simplifying messy folder..."
        cd ../messy-folder
        for file in *\ * 2>/dev/null; do
            [ -f "$file" ] || continue
            newname=$(echo "$file" | tr ' ' '_' | tr '[:upper:]' '[:lower:]')
            [ "$file" != "$newname" ] && mv "$file" "$newname" 2>/dev/null || true
        done
        
        # Remove some complex files
        rm -f *\(*\)* *\[*\]* *\{*\}* 2>/dev/null || true
        
        cd "$WORKSPACE"
        echo "✓ Easy mode activated"
        ;;
        
    medium|standard|normal)
        echo "🎯 Setting MEDIUM mode (default)..."
        echo ""
        echo "Resetting to standard environment..."
        cd "$BASE_DIR"
        ./scripts/reset.sh > /dev/null 2>&1
        echo "✓ Medium mode activated"
        ;;
        
    hard)
        echo "🎯 Setting HARD mode..."
        echo ""
        echo "This will:"
        echo "  - Add more files with complex names"
        echo "  - Create more nested structures"
        echo "  - Add files with special characters"
        echo ""
        read -p "Continue? (yes/no): " confirm
        if [ "$confirm" != "yes" ]; then
            echo "Cancelled."
            exit 0
        fi
        
        # Add complex files
        echo "Adding complex files..."
        
        # Files with special characters
        echo "content" > "file(with)parens.txt"
        echo "content" > "file[with]brackets.txt"
        echo "content" > "file{with}braces.txt"
        echo "content" > "file@with#special$chars.txt"
        
        # Deep nesting
        mkdir -p "complex/nested/structure/level1/level2/level3"
        echo "deep file" > "complex/nested/structure/level1/level2/level3/deep_file.txt"
        
        # More duplicates
        for i in {1..5}; do
            echo "duplicate content $i" > "duplicate_file_$i.txt"
            cp "duplicate_file_$i.txt" "documents/duplicate_file_$i.txt" 2>/dev/null || true
        done
        
        # Files with dates in various formats
        for format in "2024-01-15" "20240115" "Jan-15-2024" "15.01.2024"; do
            echo "data" > "report_${format}.txt"
        done
        
        # Mixed case duplicates
        echo "content" > "ImportantFile.txt"
        echo "content" > "importantfile.txt"
        echo "content" > "IMPORTANTFILE.txt"
        
        echo "✓ Hard mode activated"
        ;;
        
    expert)
        echo "🎯 Setting EXPERT mode..."
        echo ""
        echo "This will:"
        echo "  - Add many hidden files"
        echo "  - Create complex nested structures"
        echo "  - Add files with confusing names"
        echo "  - Create many duplicates"
        echo ""
        read -p "Continue? (yes/no): " confirm
        if [ "$confirm" != "yes" ]; then
            echo "Cancelled."
            exit 0
        fi
        
        # Do everything from hard mode
        echo "Adding expert-level complexity..."
        
        # Hidden files everywhere
        for dir in documents projects downloads; do
            echo "hidden" > "$dir/.hidden_file_$RANDOM"
            echo "config" > "$dir/.config_$RANDOM"
        done
        
        # Very deep nesting
        deep_path="very/deeply/nested/structure/with/many/levels/and/subdirectories"
        mkdir -p "$deep_path"
        echo "very deep" > "$deep_path/file.txt"
        
        # Files that look similar
        echo "content1" > "file1.txt"
        echo "content1" > "filel.txt"  # lowercase L looks like 1
        echo "content1" > "fileI.txt"  # uppercase I
        
        # Unicode and special characters
        echo "unicode" > "file_ñ_测试_🚀.txt" 2>/dev/null || echo "unicode" > "file_special.txt"
        
        # Many duplicates with variations
        base_content="This is important content that appears multiple times"
        for i in {1..10}; do
            echo "$base_content" > "important_$i.txt"
            echo "$base_content" > "IMPORTANT_$i.txt"
            echo "$base_content" > "Important_$i.txt"
        done
        
        # Files with spaces and special chars in messy folder
        cd ../messy-folder
        echo "messy" > "file with spaces and (parens) and [brackets].txt"
        echo "messy" > "file.with.many.dots.in.name.txt"
        echo "messy" > "file---with---many---dashes---.txt"
        
        cd "$WORKSPACE"
        echo "✓ Expert mode activated"
        ;;
        
    *)
        echo "Error: Unknown difficulty level '$DIFFICULTY'"
        echo ""
        echo "Valid levels: easy, medium, hard, expert"
        exit 1
        ;;
esac

echo ""
echo "========================================="
echo "Difficulty Adjustment Complete!"
echo "========================================="
echo ""
echo "📊 Current Statistics:"
echo "   Total files: $(find . -type f 2>/dev/null | wc -l)"
echo "   Total directories: $(find . -type d 2>/dev/null | wc -l)"
echo "   Hidden files: $(find . -name '.*' -type f 2>/dev/null | wc -l)"
echo ""
echo "💡 To reset to default:"
echo "   ./scripts/difficulty.sh medium"
echo "   or"
echo "   ./scripts/reset.sh"
echo ""

