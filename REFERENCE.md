# Command-Line Reference Guide

A quick reference for essential file management commands. Use this as a cheat sheet while working through the exercises.

## Table of Contents

- [Navigation](#navigation)
- [Listing Files](#listing-files)
- [Viewing Files](#viewing-files)
- [Searching Files](#searching-files)
- [File Operations](#file-operations)
- [Directory Operations](#directory-operations)
- [File Permissions](#file-permissions)
- [Archives](#archives)
- [Text Processing](#text-processing)
- [Useful Patterns](#useful-patterns)

---

## Navigation

### Change Directory

```bash
cd directory_name       # Go to directory
cd ..                   # Go to parent directory
cd ../..                # Go up two levels
cd ~                    # Go to home directory
cd -                    # Go to previous directory
cd /path/to/dir         # Absolute path
cd                      # Go to home directory (no argument)
```

### Show Current Directory

```bash
pwd                     # Print working directory
```

### Directory Stack

```bash
pushd directory         # Save current dir and go to directory
popd                    # Return to saved directory
dirs                    # Show directory stack
```

---

## Listing Files

### Basic Listing

```bash
ls                      # List files
ls -l                   # Long format (detailed)
ls -a                   # Include hidden files (starting with .)
ls -la                  # Long format with hidden files
ls -lh                  # Human-readable file sizes
ls -lt                  # Sort by modification time
ls -ltr                 # Sort by time, reverse (oldest first)
ls -lS                  # Sort by size
ls -R                   # Recursive listing
ls -1                   # One file per line
ls -d */                # List directories only
ls *.txt                # List only .txt files
```

### File Details

```bash
stat filename           # Detailed file information
file filename           # Determine file type
ls -li filename         # Show inode number
```

### Tree View

```bash
tree                    # Visual tree structure
tree -L 2               # Limit depth to 2 levels
tree -d                 # Directories only
tree -a                 # Include hidden files
```

---

## Viewing Files

### Display File Contents

```bash
cat filename            # Display entire file
cat -n filename         # With line numbers
cat file1 file2         # Concatenate multiple files
cat -A filename         # Show non-printing characters
```

### Paginated Viewing

```bash
less filename           # View file (interactive)
more filename           # View file (simple pager)
```

**Less Commands:**
- `Space` - Next page
- `b` - Previous page
- `/pattern` - Search forward
- `?pattern` - Search backward
- `n` - Next match
- `N` - Previous match
- `g` - Go to start
- `G` - Go to end
- `q` - Quit

### Partial Viewing

```bash
head filename           # First 10 lines
head -n 20 filename     # First 20 lines
tail filename           # Last 10 lines
tail -n 20 filename     # Last 20 lines
tail -f filename        # Follow file (monitor changes)
```

---

## Searching Files

### Find by Name

```bash
find . -name "filename"           # Find by exact name
find . -name "*.txt"              # Find by pattern
find . -iname "*.txt"             # Case-insensitive search
find . -name "file*"              # Files starting with "file"
find . -type f -name "*.txt"      # Files only (not directories)
find . -type d -name "dir*"       # Directories only
find /path -name "pattern"        # Search in specific path
```

### Find by Properties

```bash
find . -type f                    # All files
find . -type d                    # All directories
find . -type l                    # Symbolic links
find . -size +10M                 # Larger than 10MB
find . -size -1k                  # Smaller than 1KB
find . -empty                     # Empty files/directories
find . -mtime -7                  # Modified in last 7 days
find . -mtime +30                 # Modified more than 30 days ago
find . -mmin -60                  # Modified in last 60 minutes
find . -newer file.txt            # Newer than file.txt
find . -user username             # Owned by user
find . -perm 644                  # Specific permissions
```

### Find and Execute

```bash
find . -name "*.txt" -exec command {} \;        # Execute for each file
find . -name "*.txt" -exec command {} +         # Execute once with all files
find . -name "*.txt" -ok rm {} \;               # Ask before each action
find . -name "*.txt" | xargs command            # Use xargs
find . -name "*.txt" -print0 | xargs -0 command # Handle spaces in names
```

### Find and Delete

```bash
find . -name "*.tmp" -delete      # Delete matching files
find . -type f -empty -delete     # Delete empty files
```

### Search File Contents

```bash
grep "pattern" filename           # Search in file
grep -r "pattern" directory       # Recursive search
grep -i "pattern" filename        # Case-insensitive
grep -n "pattern" filename        # Show line numbers
grep -v "pattern" filename        # Invert match (exclude pattern)
grep -l "pattern" *.txt           # Show only filenames with matches
grep -L "pattern" *.txt           # Show only filenames without matches
grep -c "pattern" filename        # Count matches
grep -w "word" filename           # Match whole words only
grep -A 3 "pattern" filename      # Show 3 lines after match
grep -B 3 "pattern" filename      # Show 3 lines before match
grep -C 3 "pattern" filename      # Show 3 lines before and after
grep -E "pattern|other" filename  # Extended regex (OR)
grep -e "pat1" -e "pat2" filename # Multiple patterns
```

---

## File Operations

### Create Files

```bash
touch filename          # Create empty file or update timestamp
touch file1 file2       # Create multiple files
echo "text" > file      # Create file with content
cat > file              # Create file with input (Ctrl+D to save)
```

### Copy Files

```bash
cp source dest          # Copy file
cp -r source dest       # Copy directory (recursive)
cp -i source dest       # Interactive (prompt before overwrite)
cp -n source dest       # No-clobber (don't overwrite)
cp -u source dest       # Update (only if newer)
cp -v source dest       # Verbose (show what's being copied)
cp -p source dest       # Preserve attributes (timestamps, permissions)
cp file{,.bak}          # Quick backup (file to file.bak)
```

### Move/Rename Files

```bash
mv source dest          # Move or rename
mv -i source dest       # Interactive (prompt before overwrite)
mv -n source dest       # No-clobber (don't overwrite)
mv -v source dest       # Verbose
mv -u source dest       # Update only if source is newer
mv file1 file2 dir/     # Move multiple files to directory
```

### Delete Files

```bash
rm filename             # Delete file
rm -f filename          # Force delete (no prompt)
rm -i filename          # Interactive (prompt before delete)
rm -v filename          # Verbose
rm *.txt                # Delete all .txt files
rm -r directory         # Delete directory and contents (recursive)
rm -rf directory        # Force delete directory (dangerous!)
```

### Links

```bash
ln target link          # Create hard link
ln -s target link       # Create symbolic (soft) link
readlink link           # Show where link points
readlink -f link        # Show absolute path of link target
```

---

## Directory Operations

### Create Directories

```bash
mkdir dirname           # Create directory
mkdir -p path/to/dir    # Create parent directories as needed
mkdir -v dirname        # Verbose
mkdir dir1 dir2 dir3    # Create multiple directories
mkdir -p project/{src,docs,tests}  # Create structure
```

### Remove Directories

```bash
rmdir dirname           # Remove empty directory
rm -r dirname           # Remove directory and contents
rm -rf dirname          # Force remove (dangerous!)
```

### Copy Directories

```bash
cp -r source dest       # Copy directory recursively
rsync -av source dest   # Better for large directories
```

---

## File Permissions

### View Permissions

```bash
ls -l filename          # View permissions
stat filename           # Detailed permission info
```

### Change Permissions (Numeric)

```bash
chmod 644 file          # rw-r--r--
chmod 755 file          # rwxr-xr-x
chmod 600 file          # rw-------
chmod 700 file          # rwx------
chmod 777 file          # rwxrwxrwx (rarely recommended)
```

**Permission Values:**
- Read (r) = 4
- Write (w) = 2
- Execute (x) = 1
- Sum for each group: User, Group, Others

### Change Permissions (Symbolic)

```bash
chmod u+x file          # Add execute for user
chmod g+w file          # Add write for group
chmod o-r file          # Remove read for others
chmod a+r file          # Add read for all
chmod u=rw,g=r,o= file  # Set explicitly
chmod +x file           # Add execute for all
```

### Change Ownership

```bash
chown user file         # Change owner
chown user:group file   # Change owner and group
chown -R user dir       # Recursive
chgrp group file        # Change group only
```

---

## Archives

### Tar Archives

```bash
# Create
tar -cf archive.tar dir/              # Create tar
tar -czf archive.tar.gz dir/          # Create tar.gz (gzip)
tar -cjf archive.tar.bz2 dir/         # Create tar.bz2 (bzip2)
tar -cJf archive.tar.xz dir/          # Create tar.xz (xz)

# Extract
tar -xf archive.tar                   # Extract tar
tar -xzf archive.tar.gz               # Extract tar.gz
tar -xjf archive.tar.bz2              # Extract tar.bz2
tar -xJf archive.tar.xz               # Extract tar.xz
tar -xzf archive.tar.gz -C /path/     # Extract to specific path

# List contents
tar -tf archive.tar                   # List files
tar -tzf archive.tar.gz               # List files in tar.gz
tar -tvf archive.tar                  # Verbose list

# Options
tar -v                                # Verbose
tar -z                                # Gzip compression
tar -j                                # Bzip2 compression
tar -J                                # Xz compression
tar --exclude='*.log'                 # Exclude pattern
```

### Zip Archives

```bash
zip archive.zip file1 file2           # Create zip
zip -r archive.zip directory/         # Recursive
unzip archive.zip                     # Extract
unzip -l archive.zip                  # List contents
unzip archive.zip -d /path/           # Extract to path
```

### Gzip/Gunzip

```bash
gzip file               # Compress (creates file.gz, removes original)
gzip -k file            # Keep original
gunzip file.gz          # Decompress
gzip -l file.gz         # List compression info
```

---

## Text Processing

### Word Count

```bash
wc filename             # Lines, words, characters
wc -l filename          # Count lines
wc -w filename          # Count words
wc -c filename          # Count bytes
wc -m filename          # Count characters
```

### Sort

```bash
sort filename           # Sort lines alphabetically
sort -r filename        # Reverse sort
sort -n filename        # Numeric sort
sort -u filename        # Sort and remove duplicates
sort -k 2 filename      # Sort by column 2
sort -t: -k3 filename   # Sort by column 3 with : delimiter
```

### Unique

```bash
uniq filename           # Remove adjacent duplicates (use with sort)
uniq -c filename        # Count occurrences
uniq -d filename        # Show only duplicates
uniq -u filename        # Show only unique lines
```

### Cut

```bash
cut -d: -f1 filename    # Cut column 1 with : delimiter
cut -c1-10 filename     # Cut characters 1-10
cut -f1,3 filename      # Cut columns 1 and 3 (tab delimited)
```

### Sed

```bash
sed 's/old/new/' file           # Replace first occurrence per line
sed 's/old/new/g' file          # Replace all occurrences
sed 's/old/new/2' file          # Replace second occurrence
sed -i 's/old/new/g' file       # Edit file in-place
sed -n '10,20p' file            # Print lines 10-20
sed '/pattern/d' file           # Delete lines matching pattern
```

### Awk

```bash
awk '{print $1}' file           # Print first column
awk '{print $1, $3}' file       # Print columns 1 and 3
awk -F: '{print $1}' file       # Use : as delimiter
awk '$3 > 100' file             # Print lines where column 3 > 100
awk '{sum+=$1} END {print sum}' # Sum column 1
```

### Data Lab Recipes

```bash
# Top endpoints in the HTTP log
awk '{print $7}' data-lab/logs/access-2024-08.log | sort | uniq -c | sort -rn | head -5

# Capture malformed sensor readings
grep -E '\t(-|--|NaN)\t' data-lab/datasets/sensor_readings.tsv > sensor_readings_bad.tsv

# Revenue by region and status bucket
awk -F',' 'NR>1 {bucket=($4=="SUCCESS"?"ok":"issue"); sum[$3 FS bucket]+=$5} \
    END {for (k in sum) printf "%s,%s,%0.2f\n", k}' data-lab/datasets/ecommerce_transactions.csv
```

---

## Useful Patterns

### Wildcards

```bash
*               # Matches any characters
?               # Matches single character
[abc]           # Matches a, b, or c
[a-z]           # Matches any lowercase letter
[0-9]           # Matches any digit
[!0-9]          # Matches anything except digits
```

### Brace Expansion

```bash
echo file{1,2,3}.txt            # file1.txt file2.txt file3.txt
cp file.txt{,.bak}              # Copy file.txt to file.txt.bak
mkdir -p project/{src,docs,tests}  # Create multiple dirs
echo {A..Z}                     # A B C ... Z
echo {1..10}                    # 1 2 3 ... 10
```

### Redirection

```bash
command > file          # Redirect output to file (overwrite)
command >> file         # Redirect output to file (append)
command 2> file         # Redirect errors to file
command &> file         # Redirect output and errors
command < file          # Input from file
command1 | command2     # Pipe output to next command
command | tee file      # Output to both screen and file
```

### Command Substitution

```bash
$(command)              # Execute command and use output
`command`               # Old style (avoid)
echo "Today is $(date)"
files=$(ls *.txt)
```

### Loops

```bash
# For loop
for file in *.txt; do
    echo "$file"
done

for i in {1..10}; do
    echo "$i"
done

# While loop
while read line; do
    echo "$line"
done < file.txt

# Until loop
counter=0
until [ $counter -gt 10 ]; do
    echo $counter
    ((counter++))
done
```

### Conditionals

```bash
# If statement
if [ -f file.txt ]; then
    echo "File exists"
fi

if [ -d directory ]; then
    echo "Directory exists"
elif [ -L link ]; then
    echo "It's a link"
else
    echo "Doesn't exist"
fi

# Test operators
[ -f file ]     # File exists and is regular file
[ -d dir ]      # Directory exists
[ -e path ]     # Path exists (any type)
[ -r file ]     # File is readable
[ -w file ]     # File is writable
[ -x file ]     # File is executable
[ -s file ]     # File is not empty
[ -L file ]     # File is symbolic link
[ ! -f file ]   # File does not exist
```

### Common Combinations

```bash
# Find and delete old files
find . -name "*.tmp" -mtime +7 -delete

# Find large files
find . -type f -size +100M -exec ls -lh {} \;

# Count files by extension
find . -type f | sed 's/.*\.//' | sort | uniq -c | sort -rn

# Find duplicate files by content
find . -type f -exec md5sum {} + | sort | uniq -w32 -D

# Bulk rename
for file in *.txt; do mv "$file" "${file%.txt}.md"; done

# Search and replace in multiple files
find . -name "*.txt" -exec sed -i 's/old/new/g' {} +

# Archive old files
find . -type f -mtime +30 | tar -czf old-files.tar.gz -T -

# Disk usage by directory
du -sh */ | sort -rh

# Find files modified today
find . -type f -mtime 0

# Count lines in all files
find . -name "*.txt" -exec wc -l {} + | tail -1

# Find empty directories
find . -type d -empty

# Quick backup
cp -r project project.backup.$(date +%Y%m%d)
```

---

## Tips & Tricks

### Safety First

```bash
# Always test with echo first
for file in *; do echo "rm $file"; done

# Use -i for interactive mode
rm -i file
mv -i old new
cp -i source dest

# Create backups
cp file file.bak
```

### Efficiency

```bash
# Use tab completion
cd proj[Tab]    # Completes to project/

# Use history
history         # Show command history
!123            # Run command 123 from history
!!              # Run last command
!$              # Last argument of previous command
^old^new        # Replace old with new in last command

# Use aliases
alias ll='ls -la'
alias rm='rm -i'
```

### Get Help

```bash
man command     # Manual page
command --help  # Quick help
info command    # Info documentation
whatis command  # One-line description
which command   # Show command location
type command    # Show command type
```

---

## Quick Reference Card

### Most Used Commands

| Command | Purpose |
|---------|---------|
| `cd` | Change directory |
| `ls -la` | List all files with details |
| `pwd` | Print working directory |
| `cat` | Display file contents |
| `less` | View file with scrolling |
| `grep` | Search file contents |
| `find` | Search for files |
| `cp` | Copy files |
| `mv` | Move/rename files |
| `rm` | Delete files |
| `mkdir` | Create directory |
| `chmod` | Change permissions |
| `tar` | Create/extract archives |
| `head`/`tail` | View beginning/end of file |
| `wc` | Count lines/words |

### Emergency Commands

```bash
# Cancel current command
Ctrl + C

# Exit shell
exit
Ctrl + D

# Stop output temporarily
Ctrl + S

# Resume output
Ctrl + Q

# Clear screen
clear
Ctrl + L

# Undo last file operation (if using rm -i)
# No undo! Be careful!
```

---

**Pro Tip:** Keep this reference handy while working through the exercises. Don't try to memorize everything—focus on understanding the patterns and options. With practice, the most common commands will become second nature!

