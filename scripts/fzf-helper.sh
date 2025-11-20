#!/bin/bash

# File Management Training Set - FZF Integration
# Fuzzy file finder helper using fzf (if available)

set -e

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TRAINING_ENV="$BASE_DIR/training-env"
WORKSPACE="$TRAINING_ENV/workspace"

# Check if fzf is installed
if ! command -v fzf &> /dev/null; then
    echo "========================================="
    echo "FZF Not Installed"
    echo "========================================="
    echo ""
    echo "fzf (fuzzy finder) is not installed."
    echo ""
    echo "Installation:"
    echo ""
    echo "  Linux:"
    echo "    sudo apt install fzf          # Debian/Ubuntu"
    echo "    sudo dnf install fzf          # Fedora"
    echo "    sudo pacman -S fzf            # Arch"
    echo ""
    echo "  macOS:"
    echo "    brew install fzf"
    echo ""
    echo "  Or build from source:"
    echo "    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf"
    echo "    ~/.fzf/install"
    echo ""
    echo "After installation, run this script again."
    exit 1
fi

if [ ! -d "$WORKSPACE" ]; then
    echo "Error: Training environment not found!"
    echo "Run: ./scripts/setup.sh"
    exit 1
fi

echo "========================================="
echo "FZF File Finder"
echo "========================================="
echo ""
echo "Use fzf to quickly find files in the training environment."
echo ""

cd "$WORKSPACE"

# Function: Find and open file
find_and_open() {
    local file=$(find . -type f 2>/dev/null | fzf --height=40% --layout=reverse --border --preview 'head -20 {}')
    
    if [ -n "$file" ]; then
        echo ""
        echo "Selected: $file"
        echo ""
        echo "Options:"
        echo "  1. View file (less)"
        echo "  2. View file (cat)"
        echo "  3. Edit file (if editor set)"
        echo "  4. Show file info"
        echo "  5. Go to directory"
        echo ""
        read -p "Choose option (1-5): " choice
        
        case "$choice" in
            1) less "$file" ;;
            2) cat "$file" ;;
            3) ${EDITOR:-nano} "$file" ;;
            4) ls -lh "$file" && file "$file" ;;
            5) cd "$(dirname "$file")" && pwd && exec $SHELL ;;
            *) echo "Invalid option" ;;
        esac
    fi
}

# Function: Find and execute command
find_and_execute() {
    local file=$(find . -type f 2>/dev/null | fzf --height=40% --layout=reverse --border \
        --preview 'head -20 {}' \
        --bind 'ctrl-d:execute(rm -i {})+abort' \
        --bind 'ctrl-c:execute(cp {} {}.bak)+abort' \
        --bind 'ctrl-m:execute(mv {} {}.moved)+abort')
    
    if [ -n "$file" ]; then
        echo "Selected: $file"
        echo "File is ready for operations"
    fi
}

# Function: Search file contents
search_contents() {
    local pattern=$(echo "" | fzf --print-query --height=10% --border --prompt="Search pattern: ")
    
    if [ -n "$pattern" ]; then
        local results=$(grep -r "$pattern" . 2>/dev/null | fzf --height=40% --layout=reverse --border \
            --preview 'echo {} | cut -d: -f1 | xargs head -20' \
            --preview-window=right:50%)
        
        if [ -n "$results" ]; then
            echo "$results"
        fi
    fi
}

# Main menu
echo "FZF Helper Menu:"
echo ""
echo "  1. Find and open file"
echo "  2. Find file (with quick actions)"
echo "  3. Search file contents"
echo "  4. Find by extension"
echo "  5. Find recently modified"
echo ""
read -p "Choose option (1-5): " menu_choice

case "$menu_choice" in
    1)
        find_and_open
        ;;
    2)
        find_and_execute
        ;;
    3)
        search_contents
        ;;
    4)
        echo ""
        echo "Select extension:"
        EXT=$(find . -type f -name "*.*" 2>/dev/null | sed 's|.*\.||' | sort -u | fzf --height=30% --border)
        if [ -n "$EXT" ]; then
            FILE=$(find . -name "*.$EXT" -type f 2>/dev/null | fzf --height=40% --layout=reverse --border \
                --preview "head -20 {}")
            if [ -n "$FILE" ]; then
                echo "Selected: $FILE"
                less "$FILE"
            fi
        fi
        ;;
    5)
        echo ""
        echo "Select recently modified file:"
        FILE=$(find . -type f -printf "%T@ %p\n" 2>/dev/null | sort -rn | \
            awk '{print $2}' | head -20 | fzf --height=40% --layout=reverse --border \
            --preview 'ls -lh {} && echo "" && head -20 {}')
        if [ -n "$FILE" ]; then
            echo "Selected: $FILE"
            less "$FILE"
        fi
        ;;
    *)
        echo "Invalid option"
        ;;
esac

echo ""
echo "========================================="
echo "Done!"
echo "========================================="
echo ""
echo "💡 FZF Tips:"
echo "   - Type to filter"
echo "   - Use arrow keys to navigate"
echo "   - Press Enter to select"
echo "   - Press Esc to cancel"
echo "   - Ctrl+C to exit"
echo ""

