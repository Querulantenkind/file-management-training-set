# File Management Training Set

A comprehensive training environment for learning command-line file management operations and CLI workflows. Practice essential Unix/Linux commands in a safe, realistic sandbox with 195+ files organized in a multi-level directory structure.

## Overview

This repository provides a complete training environment designed to help you master file management skills through hands-on practice. Whether you're a beginner learning the basics or an experienced user looking to refine your workflow automation skills, this training set offers progressive exercises that cover real-world scenarios.

### What You'll Learn

- **Navigation & Exploration**: Master directory navigation and file listing
- **Searching & Filtering**: Find files using patterns, content, dates, and sizes
- **File Manipulation**: Copy, move, rename, and organize files efficiently
- **Bulk Operations**: Perform operations on multiple files simultaneously
- **Archiving & Backups**: Create and manage file archives
- **Permissions & Links**: Understand and modify file permissions and links
- **Log Analysis**: Extract and analyze data from log files
- **Automation**: Build skills to automate repetitive file management tasks

## Features

- **195+ Files** across diverse types (.txt, .md, .json, .csv, .log, .xml, .sql, and more)
- **Realistic Directory Structure** mimicking real projects, documents, media, and downloads
- **Progressive Exercises** from beginner to advanced (18 exercises across 4 levels)
- **Intentionally Messy Folder** for practicing cleanup and organization
- **Helper Scripts** for setup, reset, and verification
- **Comprehensive Documentation** with exercises, solutions, and reference materials
- **Safe Environment** - practice without fear of breaking anything important

## Quick Start

### 1. Clone the Repository

```bash
git clone https://github.com/Querulantenkind/file-management-training-set.git
cd file-management-training-set
```

### 2. Run Setup

```bash
./scripts/setup.sh
```

This will:
- Check for required dependencies
- Create the training environment (if not exists)
- Generate all training files
- Verify the setup

### 3. Start Training

```bash
# Navigate to the workspace
cd training-env/workspace

# View the exercises
cat ../EXERCISES.md | less

# Or view in your preferred editor/browser
```

### 4. Begin with Exercise 01

Start with the beginner exercises and work your way up through the four difficulty levels.

## Training Environment Structure

```
training-env/
├── workspace/
│   ├── projects/           # Sample projects (website, mobile app, data analysis)
│   ├── documents/          # Reports, invoices, contracts, personal files
│   ├── media/              # Images, videos, audio files
│   ├── downloads/          # Downloads folder with various file types
│   └── backup/             # Old backups with logs
└── messy-folder/          # Intentionally disorganized for cleanup practice
```

## Exercise Structure

### Level 1: Beginner (Navigation & Viewing)
- Exercise 01: Navigate to specific directories
- Exercise 02: List files with different options
- Exercise 03: View file contents
- Exercise 04: Count files and directories

### Level 2: Intermediate (Searching & Filtering)
- Exercise 05: Find files by name patterns
- Exercise 06: Search file contents with grep
- Exercise 07: Find files by date and size
- Exercise 08: Use wildcards and regex

### Level 3: Advanced (Manipulation)
- Exercise 09: Bulk rename files
- Exercise 10: Move files to organized structure
- Exercise 11: Find and remove duplicates
- Exercise 12: Archive old files
- Exercise 13: Change permissions
- Exercise 14: Create symbolic links

### Level 4: Real-world Scenarios
- Exercise 15: Clean up messy folder
- Exercise 16: Organize downloads by file type
- Exercise 17: Extract data from logs
- Exercise 18: Backup specific file patterns

## Documentation

### Files in This Repository

- **README.md** (this file) - Project overview and quick start
- **EXERCISES.md** - Complete exercise guide with tasks and solutions
- **SOLUTIONS.md** - Detailed solutions with explanations and alternatives
- **REFERENCE.md** - Quick reference guide for common CLI commands
- **scripts/** - Helper scripts for managing the training environment
  - `setup.sh` - Initial setup and dependency checking
  - `generate.sh` - Generate training files
  - `reset.sh` - Reset environment to initial state
  - `verify.sh` - Verify environment integrity

### Using the Helper Scripts

#### Setup the Environment

```bash
./scripts/setup.sh
```

#### Reset to Start Fresh

If you want to start over or reset after making changes:

```bash
./scripts/reset.sh
```

This will delete all your changes and recreate the original training environment.

#### Verify Environment

Check if your environment is complete and uncorrupted:

```bash
./scripts/verify.sh
```

#### Get Progressive Hints

Stuck on an exercise? Get progressive hints:

```bash
./scripts/hint.sh <exercise-number> [hint-level]
```

Examples:
- `./scripts/hint.sh 01` - First hint for Exercise 01
- `./scripts/hint.sh 01 2` - Second hint (more detailed)
- `./scripts/hint.sh 01 3` - Third hint (most detailed)

#### Explain Commands

Learn what any command does:

```bash
./scripts/explain.sh <command>
```

Examples:
- `./scripts/explain.sh ls`
- `./scripts/explain.sh "find . -name *.txt"`
- `./scripts/explain.sh grep`

#### Watch Solution Demos

See step-by-step solutions:

```bash
./scripts/demo.sh <exercise-number>
```

Examples:
- `./scripts/demo.sh 01` - Interactive demo of Exercise 01
- `./scripts/demo.sh 15` - See how to clean up messy folder

#### Randomize Environment

Shuffle files for variety in repeated practice:

```bash
./scripts/randomize.sh
```

This creates a backup and shuffles files around to create new challenges.

#### Adjust Difficulty

Change the complexity of the training environment:

```bash
./scripts/difficulty.sh <level>
```

Levels:
- `easy` - Simplified environment (fewer files, clearer names)
- `medium` - Standard environment (default)
- `hard` - Complex environment (more files, tricky names)
- `expert` - Maximum complexity (many files, hidden files, duplicates)

#### View Statistics

Get comprehensive analytics about the training environment:

```bash
./scripts/stats.sh
```

Shows file counts, types, sizes, permissions, and more.

#### Fuzzy File Finding (FZF)

Quickly find files using fuzzy search (requires fzf):

```bash
./scripts/fzf-helper.sh
```

Features:
- Find and open files
- Search file contents
- Find by extension
- Find recently modified files

**Note:** Install fzf first:
- Linux: `sudo apt install fzf` (or your package manager)
- macOS: `brew install fzf`

## Requirements

### Required Tools

These standard Unix/Linux tools are required:
- `bash` - Shell interpreter
- `find` - File search utility
- `grep` - Text search utility
- `sed` - Stream editor
- `awk` - Text processing
- `tar` - Archive utility
- `gzip` - Compression utility

### Optional Tools

These tools enhance the experience but aren't required:
- `tree` - Visual directory structure display
- `md5sum` - File checksum utility (for duplicate detection)

Most Linux distributions and macOS include all required tools by default. Windows users can use WSL (Windows Subsystem for Linux), Git Bash, or Cygwin.

## Tips for Success

1. **Read Carefully**: Each exercise explains the objective and provides hints
2. **Experiment Safely**: The training environment is isolated and can be reset anytime
3. **Use Echo for Testing**: Before running destructive commands (rm, mv), test with `echo`
   ```bash
   # Test first
   for file in *.txt; do echo "rm $file"; done
   # Then execute
   for file in *.txt; do rm "$file"; done
   ```
4. **Check Solutions**: If you're stuck, check the SOLUTIONS.md for detailed explanations
5. **Use the Reference**: Keep REFERENCE.md handy for quick command lookups
6. **Practice Regularly**: Repetition is key to building muscle memory
7. **Explore Further**: Try variations and combinations of commands

## Learning Path

### Beginners
1. Start with Level 1 exercises (01-04)
2. Read the REFERENCE.md for command basics
3. Check solutions after attempting each exercise
4. Reset and practice multiple times

### Intermediate Users
1. Review Level 1 quickly
2. Focus on Level 2 (05-08) and Level 3 (09-14)
3. Experiment with command combinations
4. Try to solve without looking at solutions first

### Advanced Users
1. Jump directly to Level 3 and Level 4
2. Focus on Real-world Scenarios (15-18)
3. Challenge yourself to find alternative solutions
4. Practice creating your own automation scripts

## Customization

Feel free to modify the training environment for your specific needs:

### Add More Files

```bash
cd training-env/workspace
mkdir my-custom-section
# Add your files...
```

### Create Custom Exercises

Create new exercise scenarios based on your actual workflow challenges.

### Modify Scripts

The scripts in `scripts/` are well-commented and can be adapted to your needs.

## Contributing

Contributions are welcome! If you have ideas for:
- Additional exercises
- Improvements to existing content
- New file types or scenarios
- Bug fixes

Please feel free to:
1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## Use Cases

### For Individuals
- Learn Linux/Unix command line
- Prepare for DevOps/SysAdmin roles
- Improve productivity with CLI tools
- Practice before working with real data

### For Educators
- Teach file management in courses
- Provide hands-on lab exercises
- Assess student CLI proficiency
- Create custom learning paths

### For Teams
- Onboard new team members
- Standardize file organization practices
- Practice incident response scenarios
- Test automation scripts safely

## Troubleshooting

### Environment Not Created

If the training environment wasn't created:
```bash
./scripts/reset.sh
```

### Missing Files

If files are missing or corrupted:
```bash
./scripts/verify.sh    # Check what's wrong
./scripts/reset.sh     # Rebuild environment
```

### Permission Errors

If scripts aren't executable:
```bash
chmod +x scripts/*.sh
```

### Command Not Found

If you're missing required commands, install them:

**Debian/Ubuntu:**
```bash
sudo apt update
sudo apt install coreutils findutils grep sed gawk tar gzip
```

**macOS:**
```bash
# Most tools are pre-installed
brew install tree  # Optional
```

**Windows (WSL):**
```bash
# Install WSL first, then:
sudo apt update
sudo apt install coreutils findutils grep sed gawk tar gzip
```

## FAQ

### Q: Can I use this on Windows?
**A:** Yes! Use WSL (Windows Subsystem for Linux), Git Bash, or Cygwin. WSL is recommended for the best experience.

### Q: Will this work on macOS?
**A:** Yes! macOS includes all required Unix tools by default.

### Q: Can I modify the files during exercises?
**A:** Absolutely! That's the point. You can always reset to start fresh.

### Q: Is this suitable for complete beginners?
**A:** Yes! Start with Level 1 exercises and use the REFERENCE.md guide.

### Q: How long does it take to complete all exercises?
**A:** For beginners: 4-8 hours. For intermediate users: 2-4 hours. Advanced users can complete in 1-2 hours.

### Q: Can I use this for teaching?
**A:** Yes! This is MIT licensed and perfect for educational use.

## Resources

### Additional Learning Materials

- [The Linux Command Line](http://linuxcommand.org/tlcl.php) - Free book
- [ExplainShell](https://explainshell.com/) - Explains shell commands
- [Bash Guide](https://mywiki.wooledge.org/BashGuide) - Comprehensive bash guide
- [ShellCheck](https://www.shellcheck.net/) - Shell script linter

### Community

- Report issues: [GitHub Issues](https://github.com/Querulantenkind/file-management-training-set/issues)
- Discussions: [GitHub Discussions](https://github.com/Querulantenkind/file-management-training-set/discussions)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Inspired by real-world file management challenges
- Built for learners at all skill levels
- Designed to be practical, safe, and educational

## Project Statistics

- **195+ Files** across 33 directories
- **18 Progressive Exercises** across 4 difficulty levels
- **10+ File Types** (.txt, .md, .json, .csv, .log, .xml, .sql, and more)
- **4 Helper Scripts** for environment management
- **3 Documentation Files** (exercises, solutions, reference)

---

**Ready to start?** Run `./scripts/setup.sh` and begin your journey to command-line mastery! 🚀

**Questions or feedback?** Open an issue or start a discussion on GitHub.

**Happy learning!** ⌨️✨
