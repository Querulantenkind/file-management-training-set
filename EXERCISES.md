# File Management Training Exercises

<!-- markdownlint-disable MD031 MD032 MD033 -->

Welcome to the file management training exercises! These exercises are designed to help you master command-line file operations through hands-on practice.

## Getting Started

Before beginning, make sure you've set up the training environment:

```bash
cd training-env/workspace
```

Each exercise includes:
- **Objective**: What you'll learn
- **Tasks**: What you need to do
- **Hints**: Useful commands or approaches
- **Expected Outcome**: How to verify your work
- **Solution**: (Click to expand) Detailed solution

---

## Level 1: Beginner (Navigation & Viewing)

### Exercise 01: Navigate to Specific Directories

**Objective**: Master basic directory navigation using `cd`, `pwd`, and `ls`.

**Tasks**:
1. Navigate to the `projects/website-redesign/src` directory
2. Display your current working directory
3. List all files in this directory
4. Go back to the parent directory (website-redesign)
5. Return to the workspace root

**Hints**:
- `cd` - change directory
- `pwd` - print working directory
- `ls` - list directory contents
- `cd ..` - go up one directory
- `cd ~` - go to home directory

**Expected Outcome**: You should be able to quickly navigate between directories and know where you are at all times.

<details>
<summary><strong>Solution</strong></summary>

```bash
# 1. Navigate to the src directory
cd projects/website-redesign/src

# 2. Display current directory
pwd
# Output: /path/to/training-env/workspace/projects/website-redesign/src

# 3. List files
ls
# Output: app.js  config.json  index.html  styles.css

# 4. Go to parent directory
cd ..
pwd
# Output: /path/to/training-env/workspace/projects/website-redesign

# 5. Return to workspace root
cd ~/Projects/file-management-training-set/training-env/workspace
# Or if already in workspace subdirectory:
cd ../..
```
</details>

---

### Exercise 02: List Files with Different Options

**Objective**: Learn various `ls` options to view file information.

**Tasks**:
1. List all files in `documents/reports/2024` including hidden files
2. Show detailed information (permissions, size, date) for these files
3. Sort files by modification time, newest first
4. List files in a single column format
5. Show file sizes in human-readable format

**Hints**:
- `ls -a` - show all files including hidden
- `ls -l` - long format with details
- `ls -t` - sort by time
- `ls -1` - one file per line
- `ls -h` - human-readable sizes

**Expected Outcome**: You can view files in multiple formats and extract useful information.

<details>
<summary><strong>Solution</strong></summary>

```bash
cd documents/reports/2024

# 1. List all files including hidden
ls -a

# 2. Detailed information
ls -l

# 3. Sort by modification time
ls -lt

# 4. Single column
ls -1

# 5. Human-readable sizes
ls -lh

# Bonus: Combine multiple options
ls -lhta
# -l (long format), -h (human-readable), -t (sort by time), -a (all files)
```
</details>

---

### Exercise 03: View File Contents

**Objective**: Use different commands to view file contents appropriately.

**Tasks**:
1. Display the entire contents of `workspace/notes.txt`
2. View the first 5 lines of `documents/reports/2024/report-2024-01-15.md`
3. View the last 3 lines of `backup/old-backup-2024/backup_log_2024.log`
4. Browse through `projects/data-analysis-2024/analysis.py` interactively
5. Display line numbers while viewing `workspace/config.yaml`

**Hints**:
- `cat` - concatenate and display files
- `head -n N` - show first N lines
- `tail -n N` - show last N lines
- `less` - interactive file viewer (press q to quit)
- `cat -n` - show line numbers

**Expected Outcome**: You can efficiently view file contents without opening an editor.

<details>
<summary><strong>Solution</strong></summary>

```bash
# 1. Display entire file
cat notes.txt

# 2. First 5 lines
head -n 5 documents/reports/2024/report-2024-01-15.md

# 3. Last 3 lines
tail -n 3 backup/old-backup-2024/backup_log_2024.log

# 4. Interactive browsing
less projects/data-analysis-2024/analysis.py
# Use arrow keys to navigate, q to quit, / to search

# 5. Display with line numbers
cat -n config.yaml

# Bonus: View multiple files
cat documents/personal/*.txt
```
</details>

---

### Exercise 04: Count Files and Directories

**Objective**: Learn to count and analyze directory contents.

**Tasks**:
1. Count how many files are in the `documents/reports/drafts` directory
2. Count how many subdirectories exist in `projects`
3. Find the total number of `.txt` files in the entire workspace
4. Count lines, words, and characters in `documents/reports/2023/annual-summary-2023.txt`
5. Calculate the total size of all files in `media/images/photos`

**Hints**:
- `ls | wc -l` - count items
- `find` - search for files
- `wc` - word count
- `du` - disk usage
- `find . -name "*.txt" | wc -l` - count specific files

**Expected Outcome**: You can quickly gather statistics about your file system.

<details>
<summary><strong>Solution</strong></summary>

```bash
# 1. Count files in drafts directory
ls documents/reports/drafts | wc -l

# 2. Count subdirectories in projects
ls -d projects/*/ | wc -l
# Or using find:
find projects -maxdepth 1 -type d | wc -l

# 3. Total .txt files in workspace
find . -name "*.txt" -type f | wc -l

# 4. Lines, words, and characters
wc documents/reports/2023/annual-summary-2023.txt

# 5. Total size of photos directory
du -sh media/images/photos
# Or for each file:
du -h media/images/photos/*
```
</details>

---

## Level 2: Intermediate (Searching & Filtering)

### Exercise 05: Find Files by Name Patterns

**Objective**: Master the `find` command to locate files by name.

**Tasks**:
1. Find all files with "backup" in their name
2. Find all `.json` files in the workspace
3. Find all files starting with "report"
4. Find all files ending with `.log` or `.bak`
5. Find files with spaces in their names

**Hints**:
- `find . -name "pattern"` - find by name
- `find . -iname "pattern"` - case-insensitive
- `find . -name "*.ext"` - find by extension
- Use quotes around patterns with special characters
- Use `-o` for OR conditions

**Expected Outcome**: You can quickly locate files based on naming patterns.

<details>
<summary><strong>Solution</strong></summary>

```bash
# 1. Files with "backup" in name
find . -name "*backup*"
# Case-insensitive:
find . -iname "*backup*"

# 2. All .json files
find . -name "*.json"

# 3. Files starting with "report"
find . -name "report*"

# 4. Files ending with .log or .bak
find . -name "*.log" -o -name "*.bak"
# Or using extended regex:
find . -regex ".*\.\(log\|bak\)$"

# 5. Files with spaces in names
find . -name "* *"

# Bonus: Find only in specific directory depth
find . -maxdepth 2 -name "*.txt"
```
</details>

---

### Exercise 06: Search File Contents with Grep

**Objective**: Use `grep` to search for text within files.

**Tasks**:
1. Search for the word "Lorem" in all `.txt` files in `documents/personal`
2. Find which log files contain "ERROR"
3. Search recursively for "backup" in all files under `workspace`
4. Count how many lines contain "2024" in `documents/invoices/invoices_2024.csv`
5. Find files containing "TODO" and show line numbers

**Hints**:
- `grep "pattern" file` - search in file
- `grep -r "pattern" dir` - recursive search
- `grep -i` - case-insensitive
- `grep -n` - show line numbers
- `grep -c` - count matches

**Expected Outcome**: You can efficiently search through file contents.

<details>
<summary><strong>Solution</strong></summary>

```bash
# 1. Search for "Lorem" in personal txt files
grep "Lorem" documents/personal/*.txt

# 2. Find ERROR in log files
grep "ERROR" **/*.log
# Or using find:
find . -name "*.log" -exec grep -l "ERROR" {} \;

# 3. Recursive search for "backup"
grep -r "backup" .
# Only show filenames:
grep -rl "backup" .

# 4. Count lines with "2024"
grep -c "2024" documents/invoices/invoices_2024.csv

# 5. Find TODO with line numbers
grep -rn "TODO" .

# Bonus: Search with context
grep -A 2 -B 2 "ERROR" projects/error.log
# -A 2: show 2 lines after
# -B 2: show 2 lines before
```
</details>

---

### Exercise 07: Find Files by Date and Size

**Objective**: Locate files based on modification time and file size.

**Tasks**:
1. Find all files modified in the last 7 days
2. Find files larger than 1KB
3. Find empty files in the workspace
4. Find the 5 largest files in `media`
5. Find files modified between 1-3 days ago

**Hints**:
- `find . -mtime -N` - modified within N days
- `find . -size +Nk` - larger than N kilobytes
- `find . -empty` - empty files
- `du -ah | sort -rh | head -n N` - largest files
- Combine multiple conditions with `-and`

**Expected Outcome**: You can filter files by metadata like size and date.

<details>
<summary><strong>Solution</strong></summary>

```bash
# 1. Files modified in last 7 days
find . -type f -mtime -7

# 2. Files larger than 1KB
find . -type f -size +1k

# 3. Empty files
find . -type f -empty

# 4. 5 largest files in media
du -ah media | sort -rh | head -n 6
# (head -n 6 because first line is the total)

# 5. Files modified 1-3 days ago
find . -type f -mtime -3 -mtime +1

# Bonus: Files larger than 1KB modified recently
find . -type f -size +1k -mtime -7
```
</details>

---

### Exercise 08: Use Wildcards and Regex

**Objective**: Master pattern matching with wildcards and regular expressions.

**Tasks**:
1. List all files starting with "report" in `documents/reports/2024`
2. List all files with exactly 3 characters before the extension
3. Find all `.jpg` and `.png` files in `media/images`
4. Match files containing numbers in their names
5. Use regex to find files with dates in format YYYY-MM-DD

**Hints**:
- `*` matches any characters
- `?` matches single character
- `[abc]` matches a, b, or c
- `[0-9]` matches any digit
- Use `find` with `-regex` for complex patterns

**Expected Outcome**: You can use sophisticated patterns to match files.

<details>
<summary><strong>Solution</strong></summary>

```bash
# 1. Files starting with "report"
ls documents/reports/2024/report*

# 2. Files with exactly 3 characters before extension
ls ???.*

# 3. JPG and PNG files
find media/images -name "*.jpg" -o -name "*.png"
# Using extended glob:
ls media/images/**/*.{jpg,png}

# 4. Files with numbers
find . -name "*[0-9]*"

# 5. Files with dates YYYY-MM-DD
find . -regex ".*[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9].*"

# Bonus: More complex patterns
ls documents/reports/2024/report-2024-[0-1][0-9]-*.md
```
</details>

---

## Level 3: Advanced (Manipulation)

### Exercise 09: Bulk Rename Files

**Objective**: Rename multiple files efficiently.

**Tasks**:
1. In `documents/reports/drafts`, rename all files to lowercase
2. Remove spaces from filenames in a test directory (copy some files first)
3. Add a prefix "old_" to all `.bak` files
4. Change file extension from `.txt` to `.md` for specific files
5. Rename files by replacing underscores with hyphens

**Hints**:
- `mv old_name new_name` - rename single file
- Use a loop: `for file in *.txt; do mv "$file" "${file%.txt}.md"; done`
- `${var//search/replace}` - string replacement in bash
- Always test on copies first!
- Use `echo` to preview commands before executing

**Expected Outcome**: You can safely rename multiple files in bulk.

<details>
<summary><strong>Solution</strong></summary>

```bash
# 1. Rename to lowercase
cd documents/reports/drafts
for file in *; do
  lowercase=$(echo "$file" | tr '[:upper:]' '[:lower:]')
  mv "$file" "$lowercase"
done

# 2. Remove spaces (create test first)
mkdir /tmp/test_rename
cp documents/personal/* /tmp/test_rename/
cd /tmp/test_rename
for file in *\ *; do
  mv "$file" "${file// /_}"
done

# 3. Add "old_" prefix to .bak files
for file in *.bak; do
  mv "$file" "old_$file"
done

# 4. Change extension txt to md
for file in *.txt; do
  mv "$file" "${file%.txt}.md"
done

# 5. Replace underscores with hyphens
for file in *_*; do
  mv "$file" "${file//_/-}"
done

# Bonus: Preview before executing
for file in *.txt; do
  echo "mv $file ${file%.txt}.md"
done
```
</details>

---

### Exercise 10: Move Files to Organized Structure

**Objective**: Reorganize files into a logical directory structure.

**Tasks**:
1. Move all `.log` files from `projects` into a new `logs` directory
2. Organize `downloads` directory by creating subdirectories for different file types
3. Move all files from 2023 into an `archive` directory
4. Move duplicate files to a `duplicates` folder for review
5. Organize media files by year based on filename dates

**Hints**:
- `mkdir -p` creates parent directories
- `mv source destination`
- Use `find` with `-exec mv {} destination \;`
- Test with `echo` first
- Be careful with overwriting

**Expected Outcome**: Files are logically organized into appropriate directories.

<details>
<summary><strong>Solution</strong></summary>

```bash
# 1. Move all .log files to logs directory
mkdir -p projects/logs
find projects -name "*.log" -maxdepth 1 -exec mv {} projects/logs/ \;

# 2. Organize downloads by type
cd downloads
mkdir -p organized/{documents,executables,data,archives}
mv *.pdf organized/documents/ 2>/dev/null
mv *.exe *.dmg organized/executables/ 2>/dev/null
mv *.json *.xml organized/data/ 2>/dev/null
mv *.zip *.tar.gz organized/archives/ 2>/dev/null

# 3. Move 2023 files to archive
mkdir -p archive/2023
find . -name "*2023*" -type f -exec mv {} archive/2023/ \;

# 4. Move duplicates
mkdir -p review/duplicates
# Find duplicates by name (simplified)
find . -name "duplicate*" -exec mv {} review/duplicates/ \;

# 5. Organize by year (simplified example)
mkdir -p media/by-year/{2023,2024}
find media -name "*2024*" -type f -exec mv {} media/by-year/2024/ \;
find media -name "*2023*" -type f -exec mv {} media/by-year/2023/ \;
```
</details>

---

### Exercise 11: Find and Remove Duplicates

**Objective**: Identify and manage duplicate files.

**Tasks**:
1. Find files with identical names in different directories
2. Find the duplicate.txt files that exist in multiple locations
3. Compare file contents to find true duplicates (same content)
4. Keep one copy and remove the others
5. Create a report of all duplicates found

**Hints**:
- `find . -name "filename"` finds all instances
- `diff file1 file2` compares files
- `md5sum` or `sha256sum` creates file checksums
- `sort | uniq -d` finds duplicates in lists
- Be very careful with `rm`

**Expected Outcome**: You can identify and manage duplicate files safely.

<details>
<summary><strong>Solution</strong></summary>

```bash
# 1. Find files with identical names
find . -type f -printf "%f\n" | sort | uniq -d

# 2. Find all duplicate.txt instances
find . -name "duplicate.txt"

# 3. Compare file contents using checksums
find . -type f -name "duplicate*" -exec md5sum {} \; | sort

# 4. Remove duplicates (keep first found)
# First, list them:
find . -name "duplicate.txt"
# Then remove all but one:
find . -name "duplicate.txt" | tail -n +2 | xargs rm

# 5. Create duplicate report
find . -type f -exec md5sum {} \; | sort | awk 'BEGIN{prev=""} {
  if($1==prev){print $2" is duplicate of "prevfile}
  prev=$1; prevfile=$2
}' > duplicate_report.txt

# Safer approach: move duplicates instead of deleting
mkdir -p /tmp/duplicates_review
find . -name "duplicate.txt" | tail -n +2 | xargs -I {} mv {} /tmp/duplicates_review/
```
</details>

---

### Exercise 12: Archive Old Files

**Objective**: Create archives of old files for backup or cleanup.

**Tasks**:
1. Create a tar.gz archive of all 2023 reports
2. Archive all `.bak` files into a single archive
3. Create separate archives for each project directory
4. Extract and verify an archive's contents
5. Archive files older than 30 days

**Hints**:
- `tar -czf archive.tar.gz files/` - create compressed archive
- `tar -xzf archive.tar.gz` - extract archive
- `tar -tzf archive.tar.gz` - list contents
- `zip -r archive.zip files/` - create zip archive
- Combine with `find` for selective archiving

**Expected Outcome**: You can create and manage file archives effectively.

<details>
<summary><strong>Solution</strong></summary>

```bash
# 1. Archive 2023 reports
cd documents/reports
tar -czf reports-2023-archive.tar.gz 2023/

# 2. Archive all .bak files
find . -name "*.bak" | tar -czf backups-archive.tar.gz -T -

# 3. Archive each project separately
cd projects
for dir in */; do
  tar -czf "${dir%/}-archive.tar.gz" "$dir"
done

# 4. Extract and verify
tar -tzf reports-2023-archive.tar.gz  # List contents
tar -xzf reports-2023-archive.tar.gz -C /tmp/test/  # Extract to test dir

# 5. Archive old files
find . -type f -mtime +30 | tar -czf old-files-archive.tar.gz -T -

# Bonus: Create dated archive
tar -czf "backup-$(date +%Y%m%d).tar.gz" important-directory/
```
</details>

---

### Exercise 13: Change Permissions

**Objective**: Understand and modify file permissions.

**Tasks**:
1. Make all `.sh` scripts in `scripts` directory executable
2. Remove write permission from important files
3. Change permissions of log files to read-only
4. Set proper permissions for config files (644)
5. Recursively change directory permissions

**Hints**:
- `chmod +x file` - add execute permission
- `chmod -w file` - remove write permission
- `chmod 644 file` - set specific permissions (rw-r--r--)
- `chmod -R` - recursive
- `ls -l` shows permissions

**Expected Outcome**: You can properly manage file and directory permissions.

<details>
<summary><strong>Solution</strong></summary>

```bash
# 1. Make scripts executable
chmod +x scripts/*.sh
# Or with find:
find scripts -name "*.sh" -exec chmod +x {} \;

# 2. Remove write from ImportantFile.txt
chmod -w ImportantFile.txt

# 3. Log files read-only
find . -name "*.log" -exec chmod 444 {} \;

# 4. Config files standard permissions
find . -name "config.*" -exec chmod 644 {} \;

# 5. Recursive directory permissions
chmod -R 755 projects/website-redesign/
# 755 = rwxr-xr-x (directories need execute to enter)

# Check permissions:
ls -l ImportantFile.txt
ls -la scripts/

# Bonus: Set different permissions for files vs directories
find . -type d -exec chmod 755 {} \;  # directories
find . -type f -exec chmod 644 {} \;  # files
```
</details>

---

### Exercise 14: Create Symbolic Links

**Objective**: Use symbolic and hard links effectively.

**Tasks**:
1. Create a symbolic link to the `projects` directory in your home folder
2. Create a link to a frequently used config file
3. Create multiple links to the same file
4. Identify and list all symbolic links in the workspace
5. Understand the difference between hard and soft links

**Hints**:
- `ln -s target link_name` - create symbolic link
- `ln target link_name` - create hard link
- `ls -la` shows links (with ->)
- `readlink -f link` shows target
- `find -type l` finds symbolic links

**Expected Outcome**: You can create and manage file links appropriately.

<details>
<summary><strong>Solution</strong></summary>

```bash
# 1. Link projects directory to home
ln -s ~/Projects/file-management-training-set/training-env/workspace/projects ~/my-projects

# 2. Link to config file
ln -s workspace/config.yaml ~/quick-config

# 3. Multiple links to same file
ln -s workspace/notes.txt notes-link1.txt
ln -s workspace/notes.txt notes-link2.txt

# 4. List all symbolic links
find . -type l -ls

# 5. Demonstrate hard vs soft links
# Soft link (symbolic):
ln -s original.txt soft-link.txt
# Hard link:
ln original.txt hard-link.txt

# Check:
ls -li original.txt hard-link.txt soft-link.txt
# Hard links have same inode number

# Bonus: Find broken links
find . -type l ! -exec test -e {} \; -print
```
</details>

---

## Level 4: Real-world Scenarios

### Exercise 15: Clean Up Messy Folder

**Objective**: Organize a chaotic directory into a logical structure.

**Tasks**:
1. Navigate to `../messy-folder` and analyze its contents
2. Remove all temporary files (.tmp, .bak, .cache)
3. Organize files by type into subdirectories
4. Rename files to follow a consistent naming convention
5. Remove duplicate files

**Hints**:
- Start by understanding what's there: `ls -la`
- Create a cleanup plan before executing
- Use `mkdir` to create organization structure
- Test commands with `echo` first
- Keep backups of anything important

**Expected Outcome**: The messy folder is well-organized and clean.

<details>
<summary><strong>Solution</strong></summary>

```bash
cd ../messy-folder

# 1. Analyze contents
ls -la
find . -type f | wc -l  # count files
find . -type f -exec file {} \; | cut -d: -f2 | sort | uniq -c  # file types

# 2. Remove temporary files
rm -f *.tmp *.bak *.cache .DS_Store Thumbs.db
find . -name "*~" -delete

# 3. Organize by type
mkdir -p organized/{documents,images,archives,logs,configs,misc}
mv *.txt *.doc organized/documents/ 2>/dev/null
mv *.jpg *.png *.JPG organized/images/ 2>/dev/null
mv *.zip *.tar.gz *.7z organized/archives/ 2>/dev/null
mv *.log organized/logs/ 2>/dev/null
mv *.cfg *.conf config.txt organized/configs/ 2>/dev/null

# 4. Rename to consistent convention (lowercase, hyphens)
cd organized/documents
for file in *; do
  newname=$(echo "$file" | tr '[:upper:]' '[:lower:]' | tr ' ' '-')
  if [ "$file" != "$newname" ]; then
    mv "$file" "$newname"
  fi
done

# 5. Remove duplicates
cd ../..
# Find and review duplicates
find organized -type f -exec md5sum {} \; | sort | uniq -w32 -D
# Remove specific duplicates after review
# (manually based on the output)

echo "Cleanup complete!"
tree organized
```
</details>

---

### Exercise 16: Organize Downloads by File Type

**Objective**: Automatically sort downloaded files into categories.

**Tasks**:
1. Create a logical folder structure for different file types
2. Move documents (PDF, DOC) to a documents folder
3. Move executables and installers to an apps folder
4. Move data files (JSON, XML, CSV) to a data folder
5. Move archives to an archives folder

**Hints**:
- Plan your directory structure first
- Use wildcards to match file extensions
- Handle files with spaces in names properly
- Use quotes around filenames with spaces
- Test with non-destructive commands first

**Expected Outcome**: Downloads directory is automatically organized by file type.

<details>
<summary><strong>Solution</strong></summary>

```bash
cd workspace/downloads

# 1. Create folder structure
mkdir -p sorted/{documents,apps,data,archives,misc}

# 2. Move documents
find . -maxdepth 1 \( -name "*.pdf" -o -name "*.doc" -o -name "*.docx" \) -exec mv {} sorted/documents/ \;

# 3. Move executables
mv *.exe *.dmg *.deb *.rpm sorted/apps/ 2>/dev/null

# 4. Move data files
find . -maxdepth 1 \( -name "*.json" -o -name "*.xml" -o -name "*.csv" \) -exec mv {} sorted/data/ \;

# 5. Move archives
find . -maxdepth 1 \( -name "*.zip" -o -name "*.tar.gz" -o -name "*.7z" -o -name "*.rar" \) -exec mv {} sorted/archives/ \;

# Move remaining files to misc
find . -maxdepth 1 -type f -exec mv {} sorted/misc/ \;

# Verify
tree sorted

# Bonus: Create a script for automatic organization
cat > ~/organize-downloads.sh <<'SCRIPT'
#!/bin/bash
DOWNLOADS=~/Downloads
cd "$DOWNLOADS"
mkdir -p sorted/{documents,apps,data,archives,media,misc}
find . -maxdepth 1 -name "*.pdf" -exec mv {} sorted/documents/ \;
# ... (rest of organization commands)
SCRIPT
chmod +x ~/organize-downloads.sh
```
</details>

---

### Exercise 17: Extract Data from Logs

**Objective**: Parse and extract useful information from log files.

**Tasks**:
1. Find all ERROR entries in log files
2. Count how many errors occurred in each log file
3. Extract timestamps from log entries
4. Filter logs from a specific date range
5. Create a summary report of log analysis

**Hints**:
- `grep` for pattern matching
- `awk` for column extraction
- `sed` for text transformation
- `wc -l` for counting
- Redirect output to create reports

**Expected Outcome**: You can extract and analyze log file data.

<details>
<summary><strong>Solution</strong></summary>

```bash
# 1. Find all ERROR entries
grep -r "ERROR" workspace --include="*.log"

# 2. Count errors in each file
for log in $(find workspace -name "*.log"); do
  count=$(grep -c "ERROR" "$log" 2>/dev/null)
  if [ $count -gt 0 ]; then
    echo "$log: $count errors"
  fi
done

# 3. Extract timestamps
grep -h "^\[" workspace/**/*.log | cut -d']' -f1 | tr -d '['

# 4. Filter by date range (example: March 2024)
grep "2024-03" workspace/**/*.log

# 5. Create summary report
cat > log-analysis-report.txt <<EOF
Log Analysis Report
Generated: $(date)
================

Total log files: $(find workspace -name "*.log" | wc -l)

Errors by file:
EOF

find workspace -name "*.log" -exec sh -c 'count=$(grep -c "ERROR" "$1" 2>/dev/null); if [ $count -gt 0 ]; then echo "$1: $count"; fi' sh {} \; >> log-analysis-report.txt

echo -e "\nTotal ERROR entries: $(grep -r "ERROR" workspace --include="*.log" | wc -l)" >> log-analysis-report.txt
echo -e "\nTotal WARNING entries: $(grep -r "WARNING" workspace --include="*.log" | wc -l)" >> log-analysis-report.txt

# Bonus: Extract unique error messages
grep -rh "ERROR" workspace --include="*.log" | sed 's/\[.*\] //' | sort | uniq
```
</details>

---

### Exercise 18: Backup Specific File Patterns

**Objective**: Create targeted backups of important files.

**Tasks**:
1. Backup all configuration files (`config.*`, `*.conf`, `*.cfg`)
2. Create incremental backups with timestamps
3. Backup only files modified in the last 7 days
4. Create separate backups for each project
5. Verify backup integrity

**Hints**:
- Use `find` to locate files
- `tar` with `-T` to archive from file list
- `date +%Y%m%d` for timestamps
- Compare source and backup
- Test restore process

**Expected Outcome**: You can create reliable, targeted backups of important files.

<details>
<summary><strong>Solution</strong></summary>

```bash
# 1. Backup all config files
mkdir -p ~/backups
find workspace -name "config.*" -o -name "*.conf" -o -name "*.cfg" | \
  tar -czf ~/backups/config-backup-$(date +%Y%m%d).tar.gz -T -

# 2. Incremental backup with timestamp
BACKUP_DIR=~/backups/$(date +%Y%m%d-%H%M%S)
mkdir -p "$BACKUP_DIR"
cp -r workspace "$BACKUP_DIR/"

# 3. Backup recent files only
find workspace -type f -mtime -7 | \
  tar -czf ~/backups/recent-files-$(date +%Y%m%d).tar.gz -T -

# 4. Separate backups per project
cd workspace/projects
for project in */; do
  tar -czf ~/backups/"${project%/}-backup-$(date +%Y%m%d).tar.gz" "$project"
done

# 5. Verify backup integrity
cd ~/backups
for backup in *.tar.gz; do
  echo "Verifying $backup..."
  tar -tzf "$backup" > /dev/null && echo "✓ OK" || echo "✗ FAILED"
done

# Bonus: Create backup script with rotation
cat > ~/backup-workspace.sh <<'SCRIPT'
#!/bin/bash
BACKUP_DIR=~/backups
DATE=$(date +%Y%m%d)
SOURCE=~/Projects/file-management-training-set/training-env/workspace

# Create backup
tar -czf "$BACKUP_DIR/workspace-$DATE.tar.gz" "$SOURCE"

# Keep only last 7 days of backups
find "$BACKUP_DIR" -name "workspace-*.tar.gz" -mtime +7 -delete

echo "Backup completed: workspace-$DATE.tar.gz"
SCRIPT
chmod +x ~/backup-workspace.sh
```
</details>

## Text Processing & Data Science Track

### Exercise 19: HTTP Log Forensics

**Objective**: Analyze raw HTTP access logs to uncover spikes, suspicious actors, and error patterns.

**Location**: `training-env/workspace/data-lab/logs/access-2024-08.log`

**Tasks**:

1. Count how many requests hit each endpoint and show the top 5 most popular paths
2. Determine how many *unique* IP addresses triggered HTTP status codes 401 or 500
3. Filter all requests generated by automated tools (`sqlmap`, `kube-probe`) into `access-bot-traffic.log`
4. Calculate the success vs. error ratio specifically for `/reports/monthly`
5. Save a short summary report to `data-lab/logs/access-summary.txt` containing the answers above

**Hints**:

- Use `awk '{print $7}'` to isolate the request path (column 7 in CLF)
- Chain `grep -E " 401 | 500 " | cut -d' ' -f1 | sort -u | wc -l` to count unique IPs with errors
- Match multiple user agents with `grep -Ei "sqlmap|kube-probe"`
- `tee` is helpful when you want to both view output and write to a file
- Ratios can be computed with `awk` counters and a final `printf`

**Expected Outcome**: A concise log summary that highlights hot endpoints, suspicious automation, and the health of the reporting route.

<details>
<summary><strong>Solution</strong></summary>

```bash
cd data-lab/logs

# 1. Top 5 endpoints
awk '{print $7}' access-2024-08.log | sort | uniq -c | sort -rn | head -5

# 2. Unique IPs with 401/500
grep -E " 401 | 500 " access-2024-08.log | cut -d' ' -f1 | sort -u | wc -l

# 3. Bot traffic file
grep -Ei "sqlmap|kube-probe" access-2024-08.log > access-bot-traffic.log

# 4 & 5. Ratio + summary
awk '/\/reports\/monthly/ { total++; if ($9 ~ /^(200|302)$/) ok++; else err++; } \
     END { printf("/reports/monthly ok=%d err=%d\n", ok, err); }' access-2024-08.log \
  | tee access-summary.txt

awk '{print $7}' access-2024-08.log | sort | uniq -c | sort -rn | head -5 >> access-summary.txt
```
</details>

---

### Exercise 20: Sensor Data Cleanup & Aggregation

**Objective**: Clean semi-structured TSV sensor readings and surface actionable statistics.

**Location**: `training-env/workspace/data-lab/datasets/sensor_readings.tsv`

**Tasks**:
1. Identify every row that contains placeholder values (`-`, `--`, or `NaN`) and write them to `sensor_readings_bad.tsv`
2. Produce a cleaned CSV (`sensor_readings_clean.csv`) that only contains numeric temperature & humidity readings
3. For the cleaned data, compute the average temperature per `device_id`
4. Determine which devices report humidity below 35% and list them with their timestamps

**Hints**:
- Use `grep -E` with alternation to catch placeholder values quickly
- Convert tabs to commas with `tr '\t' ','` or let `awk -F'\t'` emit CSV
- `awk` associative arrays make per-device aggregates straightforward
- `column -t -s$'\t'` is handy for visually validating TSV structure

**Expected Outcome**: Separate "bad" records, a normalized CSV, and a short statistical summary per device.

<details>
<summary><strong>Solution</strong></summary>

```bash
cd data-lab/datasets

# 1. Problematic rows
grep -E '\t(-|--|NaN)\t' sensor_readings.tsv > sensor_readings_bad.tsv

# 2. Clean CSV (skip header, keep only numeric rows)
awk -F'\t' 'NR==1 {print "device_id,sensor,temp_c,humidity,battery,timestamp"; next} \
            $3 ~ /^-?[0-9]+(\.[0-9]+)?$/ && $4 ~ /^[0-9]+$/ { \
              printf "%s,%s,%s,%s,%s,%s\n", $1,$2,$3,$4,$5,$6 }' \
    sensor_readings.tsv > sensor_readings_clean.csv

# 3. Average temp per device
awk -F',' 'NR>1 {sum[$1]+=$3; count[$1]++} \
            END {for (d in sum) printf "%s %.2f\n", d, sum[d]/count[d];}' \
    sensor_readings_clean.csv | sort

# 4. Humidity under 35%
awk -F',' 'NR>1 && $4 < 35 {printf "%s,%s,%s\n", $1, $4, $6}' \
    sensor_readings_clean.csv > low-humidity-alerts.csv
```
</details>

---

### Exercise 21: Revenue Pulse Report

**Objective**: Combine transactional, support, and log data to explain a revenue dip.

**Locations**:
- Transactions: `data-lab/datasets/ecommerce_transactions.csv`
- Support tickets: `data-lab/datasets/support_tickets.csv`
- Briefing: `data-lab/reports/analysis-brief.md`

**Tasks**:
1. Summarize total revenue for each region, split into `SUCCESS` vs `FAILED/RETRY` statuses
2. List the order IDs that appear in both the transactions file and the high-priority support tickets
3. Count how many escalated tickets mention availability or reporting issues
4. Save your findings to `data-lab/reports/revenue-pulse.txt`

**Hints**:
- Use `awk -F','` with conditionals to keep running sums per region & status bucket
- Normalize IDs (`tr -d "\r"`) before joining data from multiple files
- `grep -i "availability\|500"` quickly surfaces relevant ticket descriptions
- Redirect (`>>`) to append notes into the final report file as you go

**Expected Outcome**: A brief text report attributing the dip to specific regions/orders and linking it to open incidents.

<details>
<summary><strong>Solution</strong></summary>

```bash
cd data-lab/datasets

# 1. Region totals by status bucket
awk -F',' 'NR>1 {status=$4; bucket=(status=="SUCCESS"?"success":"problem"); \
                 sum[$3 FS bucket]+=$5;} \
    END {for (k in sum) printf "%s,%0.2f\n", k, sum[k]}' \
    ecommerce_transactions.csv | column -t -s',' > ../reports/revenue-pulse.txt

# 2. Correlate order IDs with high priority tickets
cut -d',' -f1,4 support_tickets.csv | grep '^T-5' >/tmp/tickets.tmp
grep 'high' support_tickets.csv | cut -d',' -f5 | grep -o 'A[0-9]\+' | sort -u >/tmp/high_ids.txt
cut -d',' -f1 ecommerce_transactions.csv | grep -F -f /tmp/high_ids.txt >> ../reports/revenue-pulse.txt

# 3. Escalated availability/report issues
grep -i 'escalated' support_tickets.csv | grep -E 'availability|500' | wc -l \
  | xargs -I{} echo "Escalated availability/report tickets: {}" >> ../reports/revenue-pulse.txt
```
</details>

---

## Bonus Challenges

### Challenge A: Pipeline Power

Create a single pipeline that:
1. Finds all `.txt` files
2. Searches for "Lorem"
3. Counts matches
4. Sorts by count
5. Shows top 5

<details>
<summary><strong>Solution</strong></summary>

```bash
find workspace -name "*.txt" -exec grep -l "Lorem" {} \; | \
  xargs -I {} sh -c 'echo "$(grep -c "Lorem" "{}"): {}"' | \
  sort -rn | \
  head -5
```
</details>

---

### Challenge B: Advanced File Analysis

Create a report showing:
- Total number of files and directories
- File type distribution
- Largest and smallest files
- Most recent and oldest files
- Total disk usage

<details>
<summary><strong>Solution</strong></summary>

```bash
cat > workspace-analysis.txt <<EOF
Workspace Analysis Report
Generated: $(date)
=======================

Total directories: $(find workspace -type d | wc -l)
Total files: $(find workspace -type f | wc -l)

File type distribution:
$(find workspace -type f | sed 's/.*\.//' | sort | uniq -c | sort -rn | head -10)

Largest files:
$(find workspace -type f -exec du -h {} \; | sort -rh | head -5)

Smallest files:
$(find workspace -type f -exec du -h {} \; | sort -h | head -5)

Most recent files:
$(find workspace -type f -printf "%T@ %p\n" | sort -rn | head -5 | cut -d' ' -f2-)

Oldest files:
$(find workspace -type f -printf "%T@ %p\n" | sort -n | head -5 | cut -d' ' -f2-)

Total disk usage: $(du -sh workspace | cut -f1)
EOF

cat workspace-analysis.txt
```
</details>

---

## Conclusion

Congratulations on completing the file management exercises! You've learned essential command-line skills for:

- Navigating and exploring file systems
- Searching and filtering files
- Manipulating and organizing files
- Creating backups and archives
- Managing permissions and links
- Solving real-world file management challenges

### Next Steps

1. Practice these commands regularly
2. Create your own automation scripts
3. Explore advanced tools like `rsync`, `tree`, `fd`, `ripgrep`
4. Refer to the `REFERENCE.md` for quick command lookups

### Reset Environment

To reset the training environment and try again:

```bash
./scripts/reset.sh
```

Happy file managing! 🚀

