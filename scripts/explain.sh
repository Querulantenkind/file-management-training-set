#!/bin/bash

# File Management Training Set - Command Explainer
# Explains what a command does with examples

set -e

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

if [ $# -eq 0 ]; then
    echo "Usage: $0 <command>"
    echo ""
    echo "Examples:"
    echo "  $0 ls"
    echo "  $0 find"
    echo "  $0 grep"
    echo "  $0 'ls -la'"
    echo ""
    echo "This script explains common CLI commands with examples."
    exit 1
fi

COMMAND="$1"

# Remove options for base command lookup
BASE_CMD=$(echo "$COMMAND" | awk '{print $1}')

explain_command() {
    local cmd="$1"
    local full_cmd="$2"
    
    case "$cmd" in
        ls)
            echo "📋 Command: ls (list directory contents)"
            echo ""
            echo "📖 Description:"
            echo "   Lists files and directories in the current or specified directory."
            echo ""
            echo "💡 Common Options:"
            echo "   ls              - List files"
            echo "   ls -l           - Long format (detailed)"
            echo "   ls -a           - Include hidden files"
            echo "   ls -la          - Long format with hidden files"
            echo "   ls -lh          - Human-readable file sizes"
            echo "   ls -lt          - Sort by modification time"
            echo "   ls -R           - Recursive listing"
            echo ""
            echo "📝 Examples:"
            echo "   ls                              # List current directory"
            echo "   ls -la documents/               # Detailed list with hidden files"
            echo "   ls -lh *.txt                    # List .txt files with sizes"
            echo "   ls -lt | head -5                # 5 most recent files"
            ;;
        cd)
            echo "📋 Command: cd (change directory)"
            echo ""
            echo "📖 Description:"
            echo "   Changes the current working directory."
            echo ""
            echo "💡 Common Usage:"
            echo "   cd directory                    - Go to directory"
            echo "   cd ..                           - Go to parent directory"
            echo "   cd ~                            - Go to home directory"
            echo "   cd -                            - Go to previous directory"
            echo "   cd                              - Go to home directory"
            echo ""
            echo "📝 Examples:"
            echo "   cd projects/website-redesign    # Navigate to subdirectory"
            echo "   cd ../..                        # Go up two levels"
            echo "   cd ~/Documents                  # Go to Documents in home"
            ;;
        pwd)
            echo "📋 Command: pwd (print working directory)"
            echo ""
            echo "📖 Description:"
            echo "   Prints the absolute path of the current working directory."
            echo ""
            echo "📝 Examples:"
            echo "   pwd                             # Show current directory"
            ;;
        find)
            echo "📋 Command: find (search for files)"
            echo ""
            echo "📖 Description:"
            echo "   Searches for files and directories matching specified criteria."
            echo ""
            echo "💡 Common Usage:"
            echo "   find . -name \"pattern\"          - Find by name"
            echo "   find . -type f                  - Find files only"
            echo "   find . -size +10M               - Find files larger than 10MB"
            echo "   find . -mtime -7                - Modified in last 7 days"
            echo ""
            echo "📝 Examples:"
            echo "   find . -name \"*.txt\"            # Find all .txt files"
            echo "   find . -name \"report*\"           # Find files starting with 'report'"
            echo "   find . -type f -size +1M         # Large files"
            echo "   find . -mtime -7 -type f        # Recent files"
            echo "   find . -name \"*.log\" -exec rm {} \\;  # Find and delete"
            ;;
        grep)
            echo "📋 Command: grep (search text)"
            echo ""
            echo "📖 Description:"
            echo "   Searches for patterns in files."
            echo ""
            echo "💡 Common Options:"
            echo "   grep \"pattern\" file              - Search in file"
            echo "   grep -r \"pattern\" dir            - Recursive search"
            echo "   grep -i \"pattern\" file           - Case-insensitive"
            echo "   grep -n \"pattern\" file           - Show line numbers"
            echo "   grep -l \"pattern\" *.txt          - Show only filenames"
            echo ""
            echo "📝 Examples:"
            echo "   grep \"ERROR\" logfile.log         # Find ERROR in log"
            echo "   grep -r \"TODO\" .                 # Find TODO in all files"
            echo "   grep -n \"pattern\" file.txt       # Show line numbers"
            echo "   grep -i \"error\" *.log            # Case-insensitive search"
            ;;
        cp)
            echo "📋 Command: cp (copy files/directories)"
            echo ""
            echo "📖 Description:"
            echo "   Copies files or directories."
            echo ""
            echo "💡 Common Options:"
            echo "   cp source dest                  - Copy file"
            echo "   cp -r source dest               - Copy directory (recursive)"
            echo "   cp -i source dest               - Interactive (prompt)"
            echo "   cp -v source dest               - Verbose"
            echo ""
            echo "📝 Examples:"
            echo "   cp file.txt backup.txt           # Copy file"
            echo "   cp -r directory/ backup/        # Copy directory"
            echo "   cp *.txt documents/             # Copy multiple files"
            ;;
        mv)
            echo "📋 Command: mv (move/rename files)"
            echo ""
            echo "📖 Description:"
            echo "   Moves or renames files and directories."
            echo ""
            echo "💡 Common Usage:"
            echo "   mv source dest                   - Move or rename"
            echo "   mv -i source dest                - Interactive"
            echo ""
            echo "📝 Examples:"
            echo "   mv old.txt new.txt              # Rename file"
            echo "   mv file.txt documents/         # Move file"
            echo "   mv *.txt archive/               # Move multiple files"
            ;;
        rm)
            echo "📋 Command: rm (remove files/directories)"
            echo ""
            echo "📖 Description:"
            echo "   Removes files or directories. Use with caution!"
            echo ""
            echo "💡 Common Options:"
            echo "   rm file                          - Delete file"
            echo "   rm -r directory                 - Delete directory"
            echo "   rm -i file                      - Interactive (safer)"
            echo "   rm -f file                      - Force (no prompt)"
            echo ""
            echo "⚠️  WARNING: rm -rf is dangerous!"
            echo ""
            echo "📝 Examples:"
            echo "   rm file.txt                     # Delete file"
            echo "   rm -i *.tmp                     # Delete with confirmation"
            echo "   rm -r old_directory/            # Delete directory"
            ;;
        chmod)
            echo "📋 Command: chmod (change permissions)"
            echo ""
            echo "📖 Description:"
            echo "   Changes file or directory permissions."
            echo ""
            echo "💡 Permission Values:"
            echo "   r (read) = 4"
            echo "   w (write) = 2"
            echo "   x (execute) = 1"
            echo ""
            echo "📝 Examples:"
            echo "   chmod 644 file.txt               # rw-r--r--"
            echo "   chmod 755 script.sh              # rwxr-xr-x"
            echo "   chmod +x script.sh               # Add execute permission"
            echo "   chmod -w file.txt                # Remove write permission"
            ;;
        tar)
            echo "📋 Command: tar (archive files)"
            echo ""
            echo "📖 Description:"
            echo "   Creates or extracts tar archives."
            echo ""
            echo "💡 Common Usage:"
            echo "   tar -czf archive.tar.gz dir/     - Create compressed archive"
            echo "   tar -xzf archive.tar.gz          - Extract archive"
            echo "   tar -tzf archive.tar.gz          - List contents"
            echo ""
            echo "📝 Examples:"
            echo "   tar -czf backup.tar.gz files/    # Create archive"
            echo "   tar -xzf backup.tar.gz            # Extract archive"
            echo "   tar -tzf backup.tar.gz            # List files in archive"
            ;;
        *)
            echo "📋 Command: $cmd"
            echo ""
            echo "💡 Getting help:"
            if command -v "$cmd" &> /dev/null; then
                echo "   man $cmd                      # Full manual"
                if "$cmd" --help &> /dev/null 2>&1; then
                    echo ""
                    echo "   Quick help:"
                    "$cmd" --help 2>&1 | head -15
                fi
            else
                echo "   Command not found. Check spelling or install it."
            fi
            ;;
    esac
    
    echo ""
    echo "========================================="
    echo ""
    echo "📚 More Resources:"
    echo "   - cat REFERENCE.md                    # Complete command reference"
    echo "   - man $cmd                            # Full manual page"
    echo "   - $cmd --help                         # Quick help"
    echo ""
}

echo "========================================="
echo "Command Explanation: $COMMAND"
echo "========================================="
echo ""

case "$BASE_CMD" in
    ls|cd|pwd|cat|head|tail|less|more|touch|mkdir|rmdir|rm|cp|mv|chmod|chown|find|grep|sed|awk|wc|sort|uniq|cut|tar|zip|unzip|gzip|gunzip)
        explain_command "$BASE_CMD" "$COMMAND"
        ;;
    *)
        echo "Command: $BASE_CMD"
        echo ""
        echo "📖 Manual Page:"
        if command -v "$BASE_CMD" &> /dev/null; then
            echo "Run: man $BASE_CMD"
            echo ""
            echo "💡 Quick Help:"
            if "$BASE_CMD" --help &> /dev/null; then
                "$BASE_CMD" --help 2>&1 | head -20
            else
                echo "Try: $BASE_CMD --help"
            fi
        else
            echo "Command not found. Is it installed?"
        fi
        ;;
esac

