# Exercise Solutions - Detailed Explanations

This document provides comprehensive solutions to all exercises with detailed explanations, alternative approaches, and best practices.

## Table of Contents

- [Level 1: Beginner](#level-1-beginner)
- [Level 2: Intermediate](#level-2-intermediate)
- [Level 3: Advanced](#level-3-advanced)
- [Level 4: Real-world Scenarios](#level-4-real-world-scenarios)
- [Command Explanations](#command-explanations)

---

## Level 1: Beginner

### Exercise 01: Navigate to Specific Directories

**Primary Solution:**

```bash
# Navigate using relative paths
cd projects/website-redesign/src
pwd  # /path/to/training-env/workspace/projects/website-redesign/src

# Use ls to see contents
ls

# Navigate up one level
cd ..

# Return to workspace root (assuming you started there)
cd ../..
```

**Alternative Approaches:**

```bash
# Using absolute paths
cd ~/Projects/file-management-training-set/training-env/workspace

# Using environment variables
WORKSPACE=~/Projects/file-management-training-set/training-env/workspace
cd $WORKSPACE/projects/website-redesign/src

# Using pushd/popd for directory stack
pushd projects/website-redesign/src  # saves previous location
# ... do work ...
popd  # returns to saved location

# Quick navigation with cd -
cd projects/website-redesign/src
cd ~/Downloads
cd -  # returns to previous directory (src)
```

**Key Concepts:**
- `.` refers to current directory
- `..` refers to parent directory
- `~` refers to home directory
- `/` at the start means root directory
- Paths without `/` at start are relative

---

### Exercise 02: List Files with Different Options

**Primary Solution:**

```bash
cd documents/reports/2024

# Basic listing
ls

# Long format with details
ls -l

# Include hidden files
ls -a

# Human-readable sizes
ls -lh

# Sort by modification time (newest first)
ls -lt

# Reverse sort (oldest first)
ls -ltr

# One file per line
ls -1
```

**Combining Options:**

```bash
# Long format, human-readable, all files, sorted by time
ls -laht

# Long format with inode numbers
ls -li

# Show directory entries, not contents
ls -ld */

# Recursive listing
ls -R

# With color (usually default)
ls --color=auto
```

**Understanding `ls -l` Output:**

```
-rw-r--r-- 1 user group 1234 Nov 20 10:30 filename.txt
│││││││││  │ │    │     │    │            └─ filename
│││││││││  │ │    │     │    └─ modification date/time
│││││││││  │ │    │     └─ size in bytes
│││││││││  │ │    └─ group owner
│││││││││  │ └─ user owner
│││││││││  └─ number of hard links
││││││││└─ other execute
│││││││└─ other write
││││││└─ other read
│││││└─ group execute
││││└─ group write
│││└─ group read
││└─ user execute
│└─ user write
└─ user read
First char: - (file), d (directory), l (link)
```

---

### Exercise 03: View File Contents

**Primary Solution:**

```bash
# Display entire file
cat workspace/notes.txt

# First 5 lines
head -n 5 documents/reports/2024/report-2024-01-15.md

# Last 3 lines
tail -n 3 backup/old-backup-2024/backup_log_2024.log

# Interactive browsing with less
less projects/data-analysis-2024/analysis.py

# With line numbers
cat -n workspace/config.yaml
```

**Alternative Approaches:**

```bash
# Using more (older, less features)
more filename.txt

# Display non-printing characters
cat -A filename.txt

# Number only non-empty lines
cat -b filename.txt

# Follow file updates (useful for logs)
tail -f logfile.log

# Show last 20 lines
tail -n 20 filename.txt

# Combination: first 20 lines, with line numbers
head -n 20 file.txt | cat -n

# View multiple files
cat file1.txt file2.txt file3.txt

# View with pagination
cat large_file.txt | less
```

**Less Command Keys:**
- `Space` - next page
- `b` - previous page
- `/pattern` - search forward
- `?pattern` - search backward
- `n` - next search result
- `N` - previous search result
- `g` - go to start
- `G` - go to end
- `q` - quit

---

### Exercise 04: Count Files and Directories

**Primary Solution:**

```bash
# Count files in directory
ls documents/reports/drafts | wc -l

# Count subdirectories
ls -d projects/*/ | wc -l

# Count all .txt files
find . -name "*.txt" -type f | wc -l

# Word count for specific file
wc documents/reports/2023/annual-summary-2023.txt

# Disk usage for directory
du -sh media/images/photos
```

**Understanding `wc` Output:**

```bash
wc filename.txt
# Output: lines words characters filename.txt

# Just lines
wc -l filename.txt

# Just words
wc -w filename.txt

# Just characters
wc -c filename.txt

# Just bytes (different from characters for unicode)
wc -c filename.txt

# Maximum line length
wc -L filename.txt
```

**Advanced Counting:**

```bash
# Count files recursively by type
find . -name "*.txt" -type f | wc -l

# Count directories only
find . -type d | wc -l

# Count files by extension
for ext in txt md json csv log; do
  echo "$ext: $(find . -name "*.$ext" -type f | wc -l)"
done

# Disk usage with details
du -ah media/images/photos | sort -rh | head -10

# Count hidden files
ls -A | grep "^\." | wc -l

# Count lines in all .txt files combined
cat *.txt | wc -l

# Count unique lines
sort file.txt | uniq | wc -l
```

---

## Level 2: Intermediate

### Exercise 05: Find Files by Name Patterns

**Primary Solution:**

```bash
# Find files with "backup" in name
find . -name "*backup*"

# Case-insensitive search
find . -iname "*backup*"

# Find all .json files
find . -name "*.json"

# Find files starting with "report"
find . -name "report*"

# Find multiple extensions
find . -name "*.log" -o -name "*.bak"

# Find files with spaces
find . -name "* *"
```

**Advanced Find Usage:**

```bash
# Limit search depth
find . -maxdepth 2 -name "*.txt"

# Exclude directories
find . -name "*.txt" -not -path "*/backup/*"

# Find and execute command
find . -name "*.log" -exec ls -lh {} \;

# Find and prompt before action
find . -name "*.tmp" -ok rm {} \;

# Find using regex
find . -regex ".*[0-9]{4}-[0-9]{2}-[0-9]{2}.*"

# Find empty files
find . -type f -empty

# Find empty directories
find . -type d -empty

# Case-insensitive search for multiple patterns
find . -iname "*.jpg" -o -iname "*.png" -o -iname "*.gif"

# Find and print with custom format
find . -name "*.txt" -printf "%p - %s bytes\n"
```

**Find by Type:**

```bash
# Files only
find . -type f

# Directories only
find . -type d

# Symbolic links only
find . -type l

# Block devices
find . -type b

# Character devices
find . -type c

# Named pipes
find . -type p

# Sockets
find . -type s
```

---

### Exercise 06: Search File Contents with Grep

**Primary Solution:**

```bash
# Search in specific files
grep "Lorem" documents/personal/*.txt

# Recursive search
grep -r "backup" .

# Find files containing pattern
grep -rl "backup" .

# Show line numbers
grep -n "Lorem" filename.txt

# Count matches
grep -c "2024" documents/invoices/invoices_2024.csv

# Case-insensitive search
grep -i "error" logfile.log
```

**Advanced Grep Techniques:**

```bash
# Show context lines
grep -A 3 "ERROR" logfile.log  # 3 lines after
grep -B 3 "ERROR" logfile.log  # 3 lines before
grep -C 3 "ERROR" logfile.log  # 3 lines before and after

# Multiple patterns (OR)
grep -e "ERROR" -e "WARNING" logfile.log

# Multiple patterns (AND) - requires both
grep "ERROR" logfile.log | grep "database"

# Exclude pattern
grep -v "INFO" logfile.log

# Show only matching part
grep -o "ERROR" logfile.log

# Show files without match
grep -L "TODO" *.txt

# Word boundary matching
grep -w "test" file.txt  # matches "test" but not "testing"

# Extended regex
grep -E "(ERROR|WARNING)" logfile.log

# Perl regex
grep -P "\d{4}-\d{2}-\d{2}" logfile.log

# Fixed strings (faster, no regex)
grep -F "literal.string" file.txt

# Count total matches across files
grep -r "ERROR" . | wc -l

# Highlight matches
grep --color=always "ERROR" logfile.log
```

**Grep with Find:**

```bash
# Find and grep combination
find . -name "*.txt" -exec grep -l "Lorem" {} \;

# More efficient with xargs
find . -name "*.txt" | xargs grep -l "Lorem"

# Handle filenames with spaces
find . -name "*.txt" -print0 | xargs -0 grep -l "Lorem"

# Complex search
find . -name "*.log" -mtime -7 -exec grep -l "ERROR" {} \;
```

---

### Exercise 07: Find Files by Date and Size

**Primary Solution:**

```bash
# Modified within last 7 days
find . -type f -mtime -7

# Larger than 1KB
find . -type f -size +1k

# Empty files
find . -type f -empty

# Largest files in media
du -ah media | sort -rh | head -6

# Modified 1-3 days ago
find . -type f -mtime -3 -mtime +1
```

**Time-based Find Options:**

```bash
# Modified exactly N days ago
find . -mtime N

# Modified less than N days ago
find . -mtime -N

# Modified more than N days ago
find . -mtime +N

# Accessed (read) time
find . -atime -7

# Status changed time
find . -ctime -7

# Modified within last N minutes
find . -mmin -60  # last hour

# Modified more than N minutes ago
find . -mmin +120  # more than 2 hours ago

# Newer than specific file
find . -newer reference_file.txt

# Between two dates (using touch)
touch -t 202401010000 /tmp/start
touch -t 202401310000 /tmp/end
find . -newer /tmp/start ! -newer /tmp/end
```

**Size-based Find Options:**

```bash
# Exactly N blocks
find . -size N

# Larger than N
find . -size +N

# Smaller than N
find . -size -N

# Units:
# c - bytes
# k - kilobytes (1024 bytes)
# M - megabytes
# G - gigabytes

# Examples:
find . -size +10M      # larger than 10MB
find . -size -100k     # smaller than 100KB
find . -size +1G       # larger than 1GB

# Size range
find . -size +1M -size -10M  # between 1MB and 10MB

# Combine with type
find . -type f -size +1M -size -10M
```

**Advanced Sorting and Analysis:**

```bash
# Largest files with details
find . -type f -exec du -h {} + | sort -rh | head -20

# Smallest non-empty files
find . -type f ! -size 0 -exec du -h {} + | sort -h | head -20

# Files by extension with sizes
find . -type f -name "*.txt" -exec du -ch {} + | tail -1

# Recently modified files
find . -type f -mtime -7 -ls

# Old files (modified more than 1 year ago)
find . -type f -mtime +365

# Files taking most space
du -a . | sort -rn | head -20
```

---

### Exercise 08: Use Wildcards and Regex

**Primary Solution:**

```bash
# Files starting with "report"
ls documents/reports/2024/report*

# Files with exactly 3 characters before extension
ls ???.*

# Multiple extensions
find media/images -name "*.jpg" -o -name "*.png"

# Files with numbers
find . -name "*[0-9]*"

# Files with dates (YYYY-MM-DD)
find . -regex ".*[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9].*"
```

**Wildcard Patterns:**

```bash
# * matches zero or more characters
ls file*          # file, file1, file.txt, fileABC
ls *file*         # myfile, file1, filename

# ? matches exactly one character
ls file?.txt      # file1.txt, fileA.txt (not file.txt or file10.txt)
ls ???.txt        # abc.txt, 123.txt (exactly 3 chars)

# [] matches any character in brackets
ls file[123].txt  # file1.txt, file2.txt, file3.txt
ls file[a-z].txt  # filea.txt, fileb.txt, ..., filez.txt
ls file[0-9].txt  # file0.txt, file1.txt, ..., file9.txt

# [!] matches any character NOT in brackets
ls file[!0-9].txt # fileA.txt but not file1.txt

# Brace expansion (not a wildcard, but useful)
ls {file1,file2,file3}.txt
cp file.txt{,.bak}  # copies file.txt to file.txt.bak
mkdir -p project/{src,docs,tests}

# Extended glob (enable with: shopt -s extglob)
?(pattern)   # matches zero or one occurrence
*(pattern)   # matches zero or more occurrences
+(pattern)   # matches one or more occurrences
@(pattern)   # matches exactly one occurrence
!(pattern)   # matches anything except pattern
```

**Regex Patterns with Find:**

```bash
# Basic regex (default)
find . -regex ".*\.txt"

# Extended regex
find . -regextype posix-extended -regex ".*\.(txt|md)"

# Match filenames with dates
find . -regex ".*/[0-9]{4}-[0-9]{2}-[0-9]{2}.*"

# Match files starting with capital letter
find . -regex ".*/[A-Z].*"

# Case-insensitive regex
find . -iregex ".*readme.*"

# Complex patterns
find . -regextype posix-extended -regex ".*/report-[0-9]{4}-(0[1-9]|1[0-2])-[0-9]{2}\.md"
```

**Grep with Regex:**

```bash
# Basic regex
grep "file[0-9]" *.txt

# Extended regex (ERE)
grep -E "file[0-9]+" *.txt

# Match email addresses
grep -E "\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b" file.txt

# Match IP addresses
grep -E "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" logfile.txt

# Match URLs
grep -E "https?://[a-zA-Z0-9./?=_-]+" file.txt

# Match dates (YYYY-MM-DD)
grep -E "[0-9]{4}-[0-9]{2}-[0-9]{2}" file.txt

# Word boundaries
grep -w "test" file.txt  # matches "test" but not "testing"
```

---

## Level 3: Advanced

### Exercise 09: Bulk Rename Files

**Primary Solution:**

```bash
# Rename to lowercase
for file in *; do
  lowercase=$(echo "$file" | tr '[:upper:]' '[:lower:]')
  [ "$file" != "$lowercase" ] && mv "$file" "$lowercase"
done

# Remove spaces (replace with underscores)
for file in *\ *; do
  [ -e "$file" ] && mv "$file" "${file// /_}"
done

# Add prefix
for file in *.bak; do
  mv "$file" "old_$file"
done

# Change extension
for file in *.txt; do
  mv "$file" "${file%.txt}.md"
done

# Replace underscores with hyphens
for file in *_*; do
  mv "$file" "${file//_/-}"
done
```

**Advanced Renaming Techniques:**

```bash
# Using rename command (if available)
rename 's/ /_/g' *              # spaces to underscores
rename 'y/A-Z/a-z/' *           # uppercase to lowercase
rename 's/\.txt$/.md/' *.txt    # change extension

# Batch rename with pattern
for file in report_*.txt; do
  num=$(echo "$file" | grep -o '[0-9]\+')
  mv "$file" "report-${num}.txt"
done

# Add sequential numbers
counter=1
for file in *.jpg; do
  mv "$file" "photo_$(printf "%03d" $counter).jpg"
  ((counter++))
done

# Remove special characters
for file in *; do
  newname=$(echo "$file" | tr -cd '[:alnum:]._-')
  [ "$file" != "$newname" ] && mv "$file" "$newname"
done

# Rename based on file content
for file in *.txt; do
  first_line=$(head -n 1 "$file" | tr ' ' '_')
  mv "$file" "${first_line}.txt"
done

# Safe rename with test
for file in *.txt; do
  newname="${file%.txt}.bak"
  if [ ! -e "$newname" ]; then
    mv "$file" "$newname"
  else
    echo "Warning: $newname already exists"
  fi
done
```

**Best Practices:**

```bash
# Always test first with echo
for file in *; do
  echo "Would rename: $file to $(echo "$file" | tr ' ' '_')"
done

# Create backup before bulk operations
cp -r directory directory.backup

# Use -n (no-clobber) to prevent overwriting
mv -n oldname newname

# Use -i (interactive) for confirmation
mv -i oldname newname

# Use -v (verbose) to see what's happening
mv -v oldname newname
```

---

### Exercise 10: Move Files to Organized Structure

**Primary Solution:**

```bash
# Move log files to new directory
mkdir -p projects/logs
find projects -name "*.log" -maxdepth 1 -exec mv {} projects/logs/ \;

# Organize downloads by type
cd downloads
mkdir -p organized/{documents,executables,data,archives}
mv *.pdf organized/documents/ 2>/dev/null
mv *.exe *.dmg organized/executables/ 2>/dev/null
mv *.json *.xml organized/data/ 2>/dev/null
mv *.zip *.tar.gz organized/archives/ 2>/dev/null

# Archive old files
mkdir -p archive/2023
find . -name "*2023*" -type f -exec mv {} archive/2023/ \;

# Move duplicates
mkdir -p review/duplicates
find . -name "duplicate*" -exec mv {} review/duplicates/ \;
```

**Advanced Organization Techniques:**

```bash
# Organize by file extension
for file in *; do
  [ -f "$file" ] || continue
  ext="${file##*.}"
  mkdir -p "by_type/$ext"
  mv "$file" "by_type/$ext/"
done

# Organize by modification date (year/month structure)
find . -maxdepth 1 -type f -printf "%TY/%Tm %p\n" | while read date file; do
  mkdir -p "by_date/$date"
  mv "$file" "by_date/$date/"
done

# Organize by file size
for file in *; do
  [ -f "$file" ] || continue
  size=$(stat -f%z "$file" 2>/dev/null || stat -c%s "$file")
  if [ $size -lt 1000 ]; then
    category="small"
  elif [ $size -lt 1000000 ]; then
    category="medium"
  else
    category="large"
  fi
  mkdir -p "by_size/$category"
  mv "$file" "by_size/$category/"
done

# Smart organization with conflict resolution
organize_file() {
  local file=$1
  local dest=$2
  local basename=$(basename "$file")
  
  if [ -e "$dest/$basename" ]; then
    # Add number suffix if file exists
    local name="${basename%.*}"
    local ext="${basename##*.}"
    local counter=1
    while [ -e "$dest/${name}_${counter}.${ext}" ]; do
      ((counter++))
    done
    mv "$file" "$dest/${name}_${counter}.${ext}"
  else
    mv "$file" "$dest/"
  fi
}
```

---

### Exercise 11: Find and Remove Duplicates

**Primary Solution:**

```bash
# Find files with same names
find . -type f -printf "%f\n" | sort | uniq -d

# Find specific duplicates
find . -name "duplicate.txt"

# Compare using checksums
find . -type f -name "duplicate*" -exec md5sum {} \; | sort

# Remove duplicates (keep first)
find . -name "duplicate.txt" | tail -n +2 | xargs rm

# Generate duplicate report
find . -type f -exec md5sum {} \; | sort | \
  awk 'BEGIN{prev=""} {
    if($1==prev){print $2" is duplicate of "prevfile}
    prev=$1; prevfile=$2
  }' > duplicate_report.txt
```

**Advanced Duplicate Detection:**

```bash
# Find duplicates by content (MD5)
find . -type f -exec md5sum {} + | sort | uniq -w32 -D

# Find duplicates by size first (faster)
find . -type f -printf "%s %p\n" | sort -n | uniq -d -w10

# Complete duplicate finder script
find_duplicates() {
  find . -type f -exec md5sum {} + | sort | awk '
    {
      hash=$1
      file=$2
      if (hash in files) {
        files[hash] = files[hash] "\n" file
        if (!(hash in dups)) {
          dups[hash] = 1
        }
      } else {
        files[hash] = file
      }
    }
    END {
      for (hash in dups) {
        print "Duplicates with hash " hash ":"
        print files[hash]
        print ""
      }
    }
  '
}

# Remove duplicates intelligently (keep shortest path)
find . -type f -exec md5sum {} + | sort | awk '
  {
    if ($1 == prev_hash) {
      if (length($2) < length(prev_file)) {
        print prev_file
        prev_file = $2
      } else {
        print $2
      }
    } else {
      prev_hash = $1
      prev_file = $2
    }
  }
' | xargs rm

# Find duplicates using fdupes (if installed)
fdupes -r .           # recursive search
fdupes -r -d .        # interactive delete
fdupes -r -N .        # only show names
fdupes -r -S .        # show size
```

---

### Exercise 12: Archive Old Files

**Primary Solution:**

```bash
# Create tar.gz archive
tar -czf reports-2023-archive.tar.gz documents/reports/2023/

# Archive all .bak files
find . -name "*.bak" | tar -czf backups-archive.tar.gz -T -

# Archive each project separately
cd projects
for dir in */; do
  tar -czf "${dir%/}-archive.tar.gz" "$dir"
done

# Extract and verify
tar -tzf archive.tar.gz              # list contents
tar -xzf archive.tar.gz -C /tmp/     # extract to location

# Archive old files
find . -type f -mtime +30 | tar -czf old-files-archive.tar.gz -T -
```

**Advanced Archiving:**

```bash
# Create tar archive (no compression)
tar -cf archive.tar directory/

# Create gzip compressed archive
tar -czf archive.tar.gz directory/

# Create bzip2 compressed archive (better compression, slower)
tar -cjf archive.tar.bz2 directory/

# Create xz compressed archive (best compression, slowest)
tar -cJf archive.tar.xz directory/

# Extract different formats
tar -xzf archive.tar.gz
tar -xjf archive.tar.bz2
tar -xJf archive.tar.xz

# Verbose output
tar -czvf archive.tar.gz directory/

# Exclude patterns
tar -czf archive.tar.gz --exclude='*.tmp' --exclude='*.log' directory/

# Archive with date stamp
tar -czf "backup-$(date +%Y%m%d-%H%M%S).tar.gz" directory/

# Incremental backups
tar -czf full-backup.tar.gz -g snapshot.file directory/
# Later:
tar -czf incremental-backup.tar.gz -g snapshot.file directory/

# Split large archives
tar -czf - large-directory/ | split -b 100M - archive.tar.gz.part-

# Combine and extract split archives
cat archive.tar.gz.part-* | tar -xzf -

# Verify archive integrity
tar -tzf archive.tar.gz > /dev/null && echo "OK" || echo "CORRUPTED"

# Extract specific files
tar -xzf archive.tar.gz path/to/specific/file

# Add files to existing archive
tar -rzf archive.tar.gz newfile.txt

# Compare archive with filesystem
tar -df archive.tar.gz

# Create zip archive
zip -r archive.zip directory/

# Extract zip
unzip archive.zip

# List zip contents
unzip -l archive.zip
```

**Backup Scripts:**

```bash
# Simple backup script
#!/bin/bash
BACKUP_DIR=~/backups
DATE=$(date +%Y%m%d)
SOURCE=~/important-files

mkdir -p "$BACKUP_DIR"
tar -czf "$BACKUP_DIR/backup-$DATE.tar.gz" "$SOURCE"

# Delete backups older than 30 days
find "$BACKUP_DIR" -name "backup-*.tar.gz" -mtime +30 -delete

# Backup with rotation (keep only last N backups)
MAX_BACKUPS=7
ls -t "$BACKUP_DIR"/backup-*.tar.gz | tail -n +$((MAX_BACKUPS + 1)) | xargs -r rm

# Incremental backup
LAST_BACKUP=$(find "$BACKUP_DIR" -name "full-*.tar.gz" -printf "%T@ %p\n" | sort -n | tail -1 | cut -d' ' -f2-)
if [ -z "$LAST_BACKUP" ] || [ $(find "$LAST_BACKUP" -mtime +7 | wc -l) -eq 1 ]; then
  # Full backup weekly
  tar -czf "$BACKUP_DIR/full-$DATE.tar.gz" "$SOURCE"
else
  # Incremental backup daily
  find "$SOURCE" -newer "$LAST_BACKUP" | tar -czf "$BACKUP_DIR/inc-$DATE.tar.gz" -T -
fi
```

---

## Command Explanations

### File Permissions

Permissions are represented in three groups: User, Group, Others
Each group has three permissions: Read (r=4), Write (w=2), Execute (x=1)

```bash
chmod 644 file.txt   # rw-r--r-- (6=4+2, 4=4, 4=4)
chmod 755 script.sh  # rwxr-xr-x (7=4+2+1, 5=4+1, 5=4+1)
chmod 600 secret.txt # rw------- (6=4+2, 0=0, 0=0)
```

Symbolic notation:
```bash
chmod u+x script.sh  # add execute for user
chmod g-w file.txt   # remove write for group
chmod o=r file.txt   # set others to read only
chmod a+r file.txt   # add read for all
```

### Piping and Redirection

```bash
command > file       # redirect stdout to file (overwrite)
command >> file      # redirect stdout to file (append)
command 2> file      # redirect stderr to file
command &> file      # redirect both stdout and stderr
command < file       # read stdin from file
command1 | command2  # pipe stdout of command1 to stdin of command2
command | tee file   # write to both file and stdout
```

### Command Substitution

```bash
result=$(command)    # modern syntax
result=`command`     # old syntax (avoid)

# Examples:
date=$(date +%Y%m%d)
count=$(ls | wc -l)
for file in $(find . -name "*.txt"); do
  echo "$file"
done
```

### Loops and Conditionals

```bash
# For loop
for item in list; do
  command "$item"
done

# While loop
while [ condition ]; do
  command
done

# If statement
if [ condition ]; then
  command1
elif [ condition2 ]; then
  command2
else
  command3
fi

# Test conditions:
[ -f file ]      # file exists and is regular file
[ -d dir ]       # directory exists
[ -e path ]      # path exists
[ -z string ]    # string is empty
[ -n string ]    # string is not empty
[ str1 = str2 ]  # strings are equal
[ num1 -eq num2 ]  # numbers are equal
[ num1 -lt num2 ]  # less than
[ num1 -gt num2 ]  # greater than
```

### Variables and String Manipulation

```bash
var="value"           # assignment (no spaces around =)
echo "$var"           # use variable
echo "${var}"         # explicit variable
echo "${var:-default}"  # use default if var is unset

# String manipulation:
${var#pattern}        # remove shortest match from beginning
${var##pattern}       # remove longest match from beginning
${var%pattern}        # remove shortest match from end
${var%%pattern}       # remove longest match from end
${var/pattern/repl}   # replace first match
${var//pattern/repl}  # replace all matches
${#var}               # length of string

# Examples:
file="path/to/file.txt"
${file##*/}           # "file.txt" (basename)
${file%/*}            # "path/to" (dirname)
${file%.txt}          # "path/to/file"
${file##*.}           # "txt" (extension)
```

---

## Best Practices

1. **Always test destructive operations first:**
   ```bash
   # Test with echo
   for file in *.txt; do echo "rm $file"; done
   # Then actually execute
   for file in *.txt; do rm "$file"; done
   ```

2. **Use quotes around variables:**
   ```bash
   mv "$file" "$destination"  # handles spaces correctly
   ```

3. **Check if file exists before operations:**
   ```bash
   [ -f "$file" ] && rm "$file"
   ```

4. **Make backups before bulk operations:**
   ```bash
   cp -r directory directory.backup
   ```

5. **Use `find` with `-print0` and `xargs -0` for files with spaces:**
   ```bash
   find . -name "*.txt" -print0 | xargs -0 command
   ```

6. **Prefer `[[` over `[` in bash:**
   ```bash
   if [[ -f "$file" && -r "$file" ]]; then
     # safer and more features
   fi
   ```

7. **Use `set -e` in scripts to exit on error:**
   ```bash
   #!/bin/bash
   set -e  # exit if any command fails
   ```

8. **Use `2>/dev/null` to suppress error messages:**
   ```bash
   mv *.pdf documents/ 2>/dev/null  # suppress "no such file" errors
   ```

---

## Additional Resources

- `man command` - manual pages for any command
- `command --help` - quick help for most commands
- [Bash Guide](https://mywiki.wooledge.org/BashGuide)
- [ExplainShell](https://explainshell.com/) - explains shell commands
- [ShellCheck](https://www.shellcheck.net/) - shell script linter

---

*Happy file managing! Remember: with great power comes great responsibility. Always double-check before running destructive commands.*

