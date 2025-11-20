#!/bin/bash

# File Management Training Set - Reset Script
# This script resets the training environment to its initial state

set -e

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TRAINING_ENV="$BASE_DIR/training-env"

echo "========================================="
echo "File Management Training Set - Reset"
echo "========================================="
echo ""

# Check if training environment exists
if [ ! -d "$TRAINING_ENV" ]; then
    echo "Training environment not found. Creating fresh environment..."
    mkdir -p "$TRAINING_ENV"
else
    echo "Current training environment found."
    echo ""
    echo "WARNING: This will delete all changes you've made and reset"
    echo "the training environment to its original state."
    echo ""
    read -p "Are you sure you want to continue? (yes/no): " confirm
    
    if [ "$confirm" != "yes" ]; then
        echo "Reset cancelled."
        exit 0
    fi
    
    echo ""
    echo "Removing existing training environment..."
    rm -rf "$TRAINING_ENV"
fi

echo "Creating fresh directory structure..."
cd "$BASE_DIR"

# Create directory structure
mkdir -p training-env/workspace/projects/website-redesign/{src,assets,docs,backups}
mkdir -p training-env/workspace/projects/{data-analysis-2024,mobile-app,archived-projects}
mkdir -p training-env/workspace/documents/reports/{2023,2024,drafts}
mkdir -p training-env/workspace/documents/{invoices,contracts,personal}
mkdir -p training-env/workspace/media/images/{photos,screenshots,downloads}
mkdir -p training-env/workspace/media/{videos,audio}
mkdir -p training-env/workspace/downloads/{tmp,archives}
mkdir -p training-env/workspace/backup/{old-backup-2023,old-backup-2024}
mkdir -p training-env/workspace/data-lab/{logs,datasets,reports}
mkdir -p training-env/messy-folder

echo "✓ Directory structure created"

echo "Generating training files..."
"$BASE_DIR/scripts/generate.sh" > /dev/null

echo "Creating messy folder contents..."
cd "$TRAINING_ENV/messy-folder"

# Recreate messy folder files
cat > "untitled document.txt" <<'EOF'
This is an untitled document with some random text.
Lorem ipsum dolor sit amet, consectetur adipiscing elit.
EOF

# Create messy files with poor naming conventions
echo "Random text 1" > "File 1.txt"
echo "Random text 2" > "File 2.txt"
echo "Random text 3" > "file 3.txt"
echo "Random text 4" > "FILE 4.TXT"
echo "Data content" > "new document.doc"
echo "More data" > "new document copy.doc"
echo "Even more" > "new document copy 2.doc"
echo "Final version" > "new document FINAL.doc"
echo "Really final" > "new document FINAL FINAL.doc"

# Mix of extensions
echo "Image placeholder" > "photo.jpg"
echo "Image placeholder" > "photo copy.jpg"
echo "Image placeholder" > "Photo.JPG"
echo "Image placeholder" > "PHOTO (1).jpg"

# Temporary and backup files
touch "~temp.txt"
touch ".hidden_file"
echo "Backup content" > "backup.bak"
echo "Backup content" > "backup2.bak"
echo "Backup content" > "old_backup.bak"
touch "tmp1.tmp"
touch "tmp2.tmp"
touch "cache.cache"

# Duplicates with same content
echo "This is duplicate content that appears multiple times" > "duplicate_1.txt"
echo "This is duplicate content that appears multiple times" > "duplicate_2.txt"
echo "This is duplicate content that appears multiple times" > "DUPLICATE_3.txt"

# Files with numbers
echo "Content 1" > "document1.txt"
echo "Content 2" > "document2.txt"
echo "Content 3" > "document10.txt"
echo "Content 4" > "document20.txt"

# Mixed separators
echo "Test" > "my-file-name.txt"
echo "Test" > "my_file_name.txt"
echo "Test" > "my file name.txt"
echo "Test" > "MyFileName.txt"

# Old versions
echo "Version 1" > "report_v1.txt"
echo "Version 2" > "report_v2.txt"
echo "Version 3" > "report_v3.txt"
echo "Version final" > "report_final.txt"
echo "Version really final" > "report_REALLY_FINAL.txt"

# Random extensions
echo "Random" > "file.xyz"
echo "Random" > "file.abc"
touch "unknown.unknown"

# Files with dates
echo "Data" > "export_2023_01_15.csv"
echo "Data" > "export_2023-01-15.csv"
echo "Data" > "export_20230115.csv"
echo "Data" > "export-jan-2023.csv"

# Screenshots with bad names
echo "Screenshot" > "Screenshot 2024-01-15 at 10.00.00.png"
echo "Screenshot" > "Screenshot 2024-01-15 at 10.00.01.png"
echo "Screenshot" > "Screen Shot 2024-01-15.png"
echo "Screenshot" > "screenshot.png"

# Empty files
touch "empty1.txt"
touch "empty2.txt"
touch "empty.log"

# Log files
echo "[ERROR] Something failed" > "error.log"
echo "[INFO] System started" > "system.log"
echo "[DEBUG] Debug info" > "debug.log"

# Archive files
echo "Archive" > "archive.zip"
echo "Archive" > "archive.tar.gz"
echo "Archive" > "backup.7z"

# Config files
echo "config=value" > "config.txt"
echo "config=value" > "config.cfg"
echo "config=value" > "config.conf"

# More varied content
echo "TODO: finish this" > "TODO.txt"
echo "Notes about project" > "notes.txt"
echo "Notes about project" > "Notes.txt"
echo "Meeting notes" > "meeting_notes.txt"
echo "Meeting notes old" > "meeting_notes_old.txt"

# Special characters
echo "Content" > "file(1).txt"
echo "Content" > "file(2).txt"
echo "Content" > "file[draft].txt"
echo "Content" > "file{backup}.txt"

cd "$BASE_DIR"

# Count files
TOTAL_FILES=$(find "$TRAINING_ENV" -type f | wc -l)

echo "✓ Messy folder created"
echo ""
echo "========================================="
echo "Reset complete!"
echo "========================================="
echo ""
echo "Training environment statistics:"
echo "  - Total files: $TOTAL_FILES"
echo "  - Total directories: $(find "$TRAINING_ENV" -type d | wc -l)"
echo ""
echo "Ready to start training! Navigate to:"
echo "  cd training-env/workspace"
echo ""
echo "View exercises:"
echo "  cat EXERCISES.md"
echo ""

