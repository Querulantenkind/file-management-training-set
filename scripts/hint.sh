#!/bin/bash

# File Management Training Set - Hint System
# Provides progressive hints for exercises

set -e

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
EXERCISES_FILE="$BASE_DIR/EXERCISES.md"

if [ $# -eq 0 ]; then
    echo "Usage: $0 <exercise-number> [hint-level]"
    echo ""
    echo "Examples:"
    echo "  $0 01          # Show first hint"
    echo "  $0 01 1        # Show first hint"
    echo "  $0 01 2        # Show second hint"
    echo "  $0 01 3        # Show third hint (most detailed)"
    echo ""
    echo "Available exercises: 01-18"
    exit 1
fi

EXERCISE_NUM=$(printf "%02d" "$1" 2>/dev/null || echo "$1")
HINT_LEVEL=${2:-1}

if [ ! -f "$EXERCISES_FILE" ]; then
    echo "Error: EXERCISES.md not found!"
    exit 1
fi

# Extract exercise section
EXERCISE_SECTION=$(awk -v num="$EXERCISE_NUM" '
    /^### Exercise [0-9]+:/ {
        match($0, /Exercise ([0-9]+)/, arr)
        if (arr[1] == num || sprintf("%02d", arr[1]) == num) {
            in_exercise = 1
            print
            next
        }
    }
    in_exercise == 1 {
        if (/^---$/ || /^### Exercise [0-9]+:/) {
            exit
        }
        print
    }
' "$EXERCISES_FILE")

if [ -z "$EXERCISE_SECTION" ]; then
    echo "Error: Exercise $EXERCISE_NUM not found!"
    echo "Available exercises: 01-18"
    exit 1
fi

# Extract hints
HINTS=$(echo "$EXERCISE_SECTION" | awk '
    /^\*\*Hints\*\*:/ {
        in_hints = 1
        next
    }
    in_hints == 1 {
        if (/^\*\*Expected Outcome\*\*:/ || /^<details>/) {
            exit
        }
        if (/^-/) {
            print substr($0, 3)  # Remove "- " prefix
        }
    }
')

# Extract objective
OBJECTIVE=$(echo "$EXERCISE_SECTION" | awk '
    /^\*\*Objective\*\*:/ {
        getline
        print
        exit
    }
')

# Extract tasks
TASKS=$(echo "$EXERCISE_SECTION" | awk '
    /^\*\*Tasks\*\*:/ {
        in_tasks = 1
        next
    }
    in_tasks == 1 {
        if (/^\*\*Hints\*\*:/) {
            exit
        }
        if (/^[0-9]+\./) {
            print
        }
    }
')

# Count hints
HINT_COUNT=$(echo "$HINTS" | grep -c . || echo "0")

if [ "$HINT_COUNT" -eq 0 ]; then
    echo "No hints available for Exercise $EXERCISE_NUM"
    exit 1
fi

# Display hint based on level
echo "========================================="
echo "Exercise $EXERCISE_NUM - Hint Level $HINT_LEVEL"
echo "========================================="
echo ""

if [ "$HINT_LEVEL" -eq 1 ]; then
    echo "📋 Objective:"
    echo "$OBJECTIVE"
    echo ""
    echo "💡 Hint 1 (General Direction):"
    echo "$HINTS" | head -n 2
    echo ""
    echo "💭 Try to think about what commands you know for this task."
    
elif [ "$HINT_LEVEL" -eq 2 ]; then
    echo "📋 Objective:"
    echo "$OBJECTIVE"
    echo ""
    echo "📝 Tasks:"
    echo "$TASKS"
    echo ""
    echo "💡 Hint 2 (More Specific):"
    echo "$HINTS" | head -n 4
    echo ""
    echo "💭 Look at the command names mentioned. Try combining them."
    
elif [ "$HINT_LEVEL" -eq 3 ]; then
    echo "📋 Objective:"
    echo "$OBJECTIVE"
    echo ""
    echo "📝 Tasks:"
    echo "$TASKS"
    echo ""
    echo "💡 Hint 3 (Detailed Guidance):"
    echo "$HINTS"
    echo ""
    echo "💭 You're very close! Try the commands mentioned above."
    echo "   Check REFERENCE.md for command syntax."
    
else
    echo "📋 Objective:"
    echo "$OBJECTIVE"
    echo ""
    echo "📝 Tasks:"
    echo "$TASKS"
    echo ""
    echo "💡 All Hints:"
    echo "$HINTS"
    echo ""
    echo "🔍 Still stuck? Try:"
    echo "   ./scripts/explain.sh <command>  # Explain a command"
    echo "   ./scripts/demo.sh $EXERCISE_NUM  # See solution demo"
    echo "   cat EXERCISES.md | grep -A 50 'Exercise $EXERCISE_NUM'  # Full exercise"
fi

echo ""
echo "========================================="
echo ""
echo "Next steps:"
echo "  - Try the hint above"
echo "  - Run: $0 $EXERCISE_NUM $((HINT_LEVEL + 1))  # For more help"
echo "  - Run: ./scripts/demo.sh $EXERCISE_NUM  # To see solution"
echo ""

