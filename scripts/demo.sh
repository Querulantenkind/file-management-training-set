#!/bin/bash

# File Management Training Set - Solution Demo
# Demonstrates exercise solutions step-by-step

set -e

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TRAINING_ENV="$BASE_DIR/training-env/workspace"

if [ $# -eq 0 ]; then
    echo "Usage: $0 <exercise-number>"
    echo ""
    echo "Examples:"
    echo "  $0 01          # Demo Exercise 01"
    echo "  $0 15          # Demo Exercise 15"
    echo ""
    echo "Available exercises: 01-18"
    exit 1
fi

EXERCISE_NUM=$(printf "%02d" "$1" 2>/dev/null || echo "$1")

if [ ! -d "$TRAINING_ENV" ]; then
    echo "Error: Training environment not found!"
    echo "Run: ./scripts/setup.sh"
    exit 1
fi

echo "========================================="
echo "Exercise $EXERCISE_NUM - Solution Demo"
echo "========================================="
echo ""
echo "This will show you the solution step-by-step."
echo "Press Enter to continue after each step..."
echo ""
read -p "Press Enter to start... " dummy

cd "$TRAINING_ENV"

case "$EXERCISE_NUM" in
    01)
        echo "📋 Exercise 01: Navigate to Specific Directories"
        echo ""
        echo "Step 1: Navigate to projects/website-redesign/src"
        echo "Command: cd projects/website-redesign/src"
        read -p "Press Enter to execute... " dummy
        cd projects/website-redesign/src
        echo "✓ Current directory: $(pwd)"
        echo ""
        
        echo "Step 2: Display current working directory"
        echo "Command: pwd"
        read -p "Press Enter to execute... " dummy
        pwd
        echo ""
        
        echo "Step 3: List all files"
        echo "Command: ls"
        read -p "Press Enter to execute... " dummy
        ls
        echo ""
        
        echo "Step 4: Go to parent directory"
        echo "Command: cd .."
        read -p "Press Enter to execute... " dummy
        cd ..
        pwd
        echo ""
        
        echo "Step 5: Return to workspace root"
        echo "Command: cd ../.."
        read -p "Press Enter to execute... " dummy
        cd ../..
        pwd
        echo ""
        ;;
    02)
        echo "📋 Exercise 02: List Files with Different Options"
        echo ""
        cd documents/reports/2024
        
        echo "Step 1: List all files including hidden"
        echo "Command: ls -a"
        read -p "Press Enter to execute... " dummy
        ls -a
        echo ""
        
        echo "Step 2: Detailed information"
        echo "Command: ls -l"
        read -p "Press Enter to execute... " dummy
        ls -l
        echo ""
        
        echo "Step 3: Sort by modification time"
        echo "Command: ls -lt"
        read -p "Press Enter to execute... " dummy
        ls -lt
        echo ""
        
        echo "Step 4: Single column format"
        echo "Command: ls -1"
        read -p "Press Enter to execute... " dummy
        ls -1
        echo ""
        
        echo "Step 5: Human-readable sizes"
        echo "Command: ls -lh"
        read -p "Press Enter to execute... " dummy
        ls -lh
        echo ""
        ;;
    05)
        echo "📋 Exercise 05: Find Files by Name Patterns"
        echo ""
        
        echo "Step 1: Find files with 'backup' in name"
        echo "Command: find . -name \"*backup*\""
        read -p "Press Enter to execute... " dummy
        find . -name "*backup*" 2>/dev/null | head -5
        echo ""
        
        echo "Step 2: Find all .json files"
        echo "Command: find . -name \"*.json\""
        read -p "Press Enter to execute... " dummy
        find . -name "*.json" 2>/dev/null | head -5
        echo ""
        
        echo "Step 3: Find files starting with 'report'"
        echo "Command: find . -name \"report*\""
        read -p "Press Enter to execute... " dummy
        find . -name "report*" 2>/dev/null | head -5
        echo ""
        ;;
    06)
        echo "📋 Exercise 06: Search File Contents with Grep"
        echo ""
        
        echo "Step 1: Search for 'Lorem' in .txt files"
        echo "Command: grep \"Lorem\" documents/personal/*.txt"
        read -p "Press Enter to execute... " dummy
        grep "Lorem" documents/personal/*.txt 2>/dev/null | head -3
        echo ""
        
        echo "Step 2: Recursive search for 'backup'"
        echo "Command: grep -r \"backup\" ."
        read -p "Press Enter to execute... " dummy
        grep -r "backup" . 2>/dev/null | head -3
        echo ""
        ;;
    09)
        echo "📋 Exercise 09: Bulk Rename Files"
        echo ""
        echo "⚠️  This demo shows the commands but won't actually rename files"
        echo ""
        
        echo "Example: Rename to lowercase"
        echo "Command: for file in *; do lowercase=\$(echo \"\$file\" | tr '[:upper:]' '[:lower:]'); [ \"\$file\" != \"\$lowercase\" ] && echo \"Would rename: \$file to \$lowercase\"; done"
        read -p "Press Enter to see example... " dummy
        cd documents/reports/drafts 2>/dev/null || cd documents/personal
        for file in * 2>/dev/null; do
            [ -f "$file" ] || continue
            lowercase=$(echo "$file" | tr '[:upper:]' '[:lower:]')
            [ "$file" != "$lowercase" ] && echo "Would rename: $file to $lowercase"
        done | head -5
        echo ""
        ;;
    15)
        echo "📋 Exercise 15: Clean Up Messy Folder"
        echo ""
        echo "⚠️  This demo shows the approach but won't modify files"
        echo ""
        
        cd ../messy-folder 2>/dev/null || cd "$BASE_DIR/training-env/messy-folder"
        
        echo "Step 1: Analyze contents"
        echo "Command: ls -la | head -10"
        read -p "Press Enter to execute... " dummy
        ls -la | head -10
        echo ""
        
        echo "Step 2: Count files"
        echo "Command: find . -type f | wc -l"
        read -p "Press Enter to execute... " dummy
        find . -type f | wc -l
        echo ""
        
        echo "Step 3: Find temporary files (would remove)"
        echo "Command: find . -name \"*.tmp\" -o -name \"*.bak\""
        read -p "Press Enter to execute... " dummy
        find . -name "*.tmp" -o -name "*.bak" 2>/dev/null | head -5
        echo ""
        ;;
    *)
        echo "📋 Exercise $EXERCISE_NUM"
        echo ""
        echo "Demo not yet implemented for this exercise."
        echo ""
        echo "💡 To see the solution:"
        echo "   1. Check EXERCISES.md for the full solution"
        echo "   2. Look in the <details> section for Exercise $EXERCISE_NUM"
        echo ""
        echo "Or try:"
        echo "   ./scripts/hint.sh $EXERCISE_NUM 3  # Get detailed hints"
        ;;
esac

cd "$BASE_DIR"

echo ""
echo "========================================="
echo "Demo Complete!"
echo "========================================="
echo ""
echo "💡 Next Steps:"
echo "   - Try the exercise yourself"
echo "   - Use: ./scripts/hint.sh $EXERCISE_NUM  # For hints"
echo "   - Check: EXERCISES.md for full solution"
echo ""

