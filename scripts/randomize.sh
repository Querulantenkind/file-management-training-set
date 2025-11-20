#!/bin/bash

# File Management Training Set - Randomize Environment
# Shuffles files around to create variety for repeated practice

set -e

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TRAINING_ENV="$BASE_DIR/training-env"
WORKSPACE="$TRAINING_ENV/workspace"

if [ ! -d "$WORKSPACE" ]; then
    echo "Error: Training environment not found!"
    echo "Run: ./scripts/setup.sh"
    exit 1
fi

echo "========================================="
echo "Randomize Training Environment"
echo "========================================="
echo ""
echo "This will shuffle files around to create variety."
echo "Your changes will be preserved in a backup."
echo ""
read -p "Continue? (yes/no): " confirm

if [ "$confirm" != "yes" ]; then
    echo "Cancelled."
    exit 0
fi

cd "$WORKSPACE"

# Create backup of current state
BACKUP_DIR="/tmp/training-backup-$(date +%Y%m%d-%H%M%S)"
echo "Creating backup at: $BACKUP_DIR"
mkdir -p "$BACKUP_DIR"
cp -r . "$BACKUP_DIR/" 2>/dev/null || true
echo "✓ Backup created"
echo ""

# Function to randomly move files
randomize_files() {
    local source_dir="$1"
    local target_base="$2"
    
    if [ ! -d "$source_dir" ]; then
        return
    fi
    
    # Find random files
    local files=($(find "$source_dir" -type f -maxdepth 1 2>/dev/null | shuf | head -5))
    
    for file in "${files[@]}"; do
        if [ -f "$file" ]; then
            # Pick random target directory
            local targets=($(find "$target_base" -type d 2>/dev/null | shuf))
            if [ ${#targets[@]} -gt 0 ]; then
                local target="${targets[0]}"
                local filename=$(basename "$file")
                # Add random prefix sometimes
                if [ $((RANDOM % 2)) -eq 0 ]; then
                    filename="moved_$filename"
                fi
                echo "  Moving: $(basename $file) -> $target/"
                mv "$file" "$target/$filename" 2>/dev/null || true
            fi
        fi
    done
}

# Function to create random files
create_random_files() {
    local target_dir="$1"
    local count=$2
    
    mkdir -p "$target_dir"
    
    for i in $(seq 1 $count); do
        local filename="random_$(date +%s)_$RANDOM.txt"
        echo "Random file created at $(date)" > "$target_dir/$filename"
    done
}

echo "🔄 Randomizing files..."
echo ""

# Randomize downloads
echo "1. Randomizing downloads..."
randomize_files "downloads" "downloads"
create_random_files "downloads/tmp" 3
echo "   ✓ Downloads randomized"
echo ""

# Randomize documents
echo "2. Randomizing documents..."
randomize_files "documents/personal" "documents/reports/drafts"
randomize_files "documents/reports/drafts" "documents/personal"
echo "   ✓ Documents shuffled"
echo ""

# Randomize projects
echo "3. Randomizing projects..."
randomize_files "projects/data-analysis-2024" "projects/mobile-app"
randomize_files "projects/mobile-app" "projects/archived-projects"
echo "   ✓ Projects shuffled"
echo ""

# Add some random files to messy folder
echo "4. Adding random files to messy folder..."
create_random_files "../messy-folder" 5
echo "   ✓ Messy folder updated"
echo ""

# Randomize media (just a few)
echo "5. Randomizing media..."
randomize_files "media/images/photos" "media/images/screenshots"
echo "   ✓ Media shuffled"
echo ""

# Create some random temporary files
echo "6. Creating random temporary files..."
TEMP_DIRS=("downloads/tmp" "projects/website-redesign/backups" "documents/reports/drafts")
for dir in "${TEMP_DIRS[@]}"; do
    create_random_files "$dir" 2
done
echo "   ✓ Temporary files created"
echo ""

# Add some files with random names
echo "7. Creating files with random patterns..."
cd documents/personal 2>/dev/null || cd documents
for i in {1..3}; do
    patterns=("file_$RANDOM.txt" "document_$(date +%s).md" "note_$RANDOM.txt")
    pattern="${patterns[$((RANDOM % ${#patterns[@]}))]}"
    echo "Random content $i" > "$pattern" 2>/dev/null || true
done
cd "$WORKSPACE"
echo "   ✓ Random pattern files created"
echo ""

echo "========================================="
echo "Randomization Complete!"
echo "========================================="
echo ""
echo "📊 Statistics:"
echo "   Total files: $(find . -type f | wc -l)"
echo "   Total directories: $(find . -type d | wc -l)"
echo ""
echo "💾 Backup location: $BACKUP_DIR"
echo ""
echo "🔄 To restore original state:"
echo "   ./scripts/reset.sh"
echo ""
echo "✨ The environment is now randomized and ready for practice!"
echo ""

