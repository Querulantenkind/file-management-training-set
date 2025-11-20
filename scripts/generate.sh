#!/bin/bash

# File Management Training Set - File Generator
# This script generates all the training files with diverse patterns

set -e

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TRAINING_ENV="$BASE_DIR/training-env"

# Lorem ipsum text templates
LOREM_SHORT="Lorem ipsum dolor sit amet, consectetur adipiscing elit."
LOREM_MEDIUM="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
LOREM_LONG="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

echo "Generating training files..."

# === PROJECTS - website-redesign/src ===
cd "$TRAINING_ENV/workspace/projects/website-redesign/src"
cat > index.html <<EOF
<!DOCTYPE html>
<html>
<head><title>Website Redesign</title></head>
<body>$LOREM_MEDIUM</body>
</html>
EOF

cat > app.js <<EOF
// Main application file
console.log('$LOREM_SHORT');
function init() {
  // Initialization code
}
EOF

cat > styles.css <<EOF
/* Main stylesheet */
body { margin: 0; padding: 20px; }
/* $LOREM_SHORT */
EOF

cat > config.json <<EOF
{
  "name": "website-redesign",
  "version": "1.0.0",
  "description": "$LOREM_SHORT"
}
EOF

# === PROJECTS - website-redesign/assets ===
cd "$TRAINING_ENV/workspace/projects/website-redesign/assets"
echo "$LOREM_SHORT" > logo.svg
echo "$LOREM_SHORT" > banner.png
echo "$LOREM_MEDIUM" > "image with spaces.jpg"

# === PROJECTS - website-redesign/docs ===
cd "$TRAINING_ENV/workspace/projects/website-redesign/docs"
cat > README.md <<EOF
# Website Redesign Documentation

$LOREM_LONG

## Getting Started
$LOREM_MEDIUM
EOF

cat > "project notes.txt" <<EOF
Project Notes
=============
$LOREM_LONG
EOF

cat > requirements.txt <<EOF
Requirements:
- $LOREM_SHORT
- $LOREM_SHORT
EOF

# === PROJECTS - website-redesign/backups ===
cd "$TRAINING_ENV/workspace/projects/website-redesign/backups"
echo "$LOREM_MEDIUM" > backup_20240115.tar.gz
echo "$LOREM_MEDIUM" > backup_20240220.tar.gz
echo "$LOREM_MEDIUM" > backup_20240315.tar.gz
echo "$LOREM_SHORT" > old_backup.bak

# === PROJECTS - data-analysis-2024 ===
cd "$TRAINING_ENV/workspace/projects/data-analysis-2024"
cat > analysis.py <<EOF
# Data Analysis Script
import pandas as pd

# $LOREM_SHORT
def analyze_data():
    pass
EOF

cat > data.csv <<EOF
id,name,value,date
1,Item A,100,2024-01-15
2,Item B,200,2024-02-20
3,Item C,150,2024-03-10
EOF

cat > results.json <<EOF
{
  "summary": "$LOREM_SHORT",
  "total": 450,
  "items": 3
}
EOF

cat > notebook.ipynb <<EOF
{
  "cells": [
    {
      "cell_type": "markdown",
      "metadata": {},
      "source": ["# Data Analysis\\n", "$LOREM_SHORT"]
    }
  ]
}
EOF

echo "$LOREM_MEDIUM" > "Data Export 2024.csv"
echo "$LOREM_SHORT" > data_export_2024.csv

# === PROJECTS - mobile-app ===
cd "$TRAINING_ENV/workspace/projects/mobile-app"
cat > App.tsx <<EOF
import React from 'react';

// $LOREM_SHORT
const App = () => {
  return <div>Mobile App</div>;
};

export default App;
EOF

cat > package.json <<EOF
{
  "name": "mobile-app",
  "version": "0.1.0",
  "description": "$LOREM_SHORT"
}
EOF

cat > README.MD <<EOF
# Mobile App
$LOREM_MEDIUM
EOF

# === PROJECTS - archived-projects ===
cd "$TRAINING_ENV/workspace/projects/archived-projects"
echo "$LOREM_SHORT" > old-project-2022.zip
echo "$LOREM_SHORT" > legacy-code.tar.gz
echo "$LOREM_MEDIUM" > "archive 2023.zip"

# === DOCUMENTS - reports/2023 ===
cd "$TRAINING_ENV/workspace/documents/reports/2023"
cat > report-2023-01-15.md <<EOF
# Q1 Report 2023
$LOREM_LONG
EOF

cat > report-2023-04-20.md <<EOF
# Q2 Report 2023
$LOREM_LONG
EOF

cat > report-2023-07-10.md <<EOF
# Q3 Report 2023
$LOREM_LONG
EOF

cat > report-2023-10-30.md <<EOF
# Q4 Report 2023
$LOREM_LONG
EOF

echo "$LOREM_MEDIUM" > annual-summary-2023.txt

# === DOCUMENTS - reports/2024 ===
cd "$TRAINING_ENV/workspace/documents/reports/2024"
cat > report-2024-01-15.md <<EOF
# Q1 Report 2024
$LOREM_LONG
EOF

cat > report-2024-04-20.md <<EOF
# Q2 Report 2024
$LOREM_LONG
EOF

cat > "Monthly Report Jan.txt" <<EOF
Monthly Report - January 2024
$LOREM_LONG
EOF

cat > "Monthly Report Feb.txt" <<EOF
Monthly Report - February 2024
$LOREM_LONG
EOF

echo "$LOREM_MEDIUM" > summary.csv

# === DOCUMENTS - reports/drafts ===
cd "$TRAINING_ENV/workspace/documents/reports/drafts"
echo "$LOREM_LONG" > draft_v1.txt
echo "$LOREM_LONG" > draft_v2.txt
echo "$LOREM_LONG" > draft_v3.txt
echo "$LOREM_LONG" > draft_final.txt
echo "$LOREM_LONG" > "draft FINAL.txt"
echo "$LOREM_LONG" > "draft FINAL v2.txt"
echo "$LOREM_LONG" > "draft FINAL v3 REALLY FINAL.txt"

# === DOCUMENTS - invoices ===
cd "$TRAINING_ENV/workspace/documents/invoices"
cat > invoice-001.txt <<EOF
Invoice #001
Date: 2024-01-15
$LOREM_SHORT
Total: \$1000
EOF

cat > invoice-002.txt <<EOF
Invoice #002
Date: 2024-02-20
$LOREM_SHORT
Total: \$1500
EOF

cat > invoice-003.txt <<EOF
Invoice #003
Date: 2024-03-10
$LOREM_SHORT
Total: \$2000
EOF

cat > invoices_2024.csv <<EOF
id,date,amount
001,2024-01-15,1000
002,2024-02-20,1500
003,2024-03-10,2000
EOF

echo "$LOREM_SHORT" > invoice_template.txt

# === DOCUMENTS - contracts ===
cd "$TRAINING_ENV/workspace/documents/contracts"
cat > contract-A.pdf <<EOF
Contract Document A
$LOREM_LONG
Signed: 2024-01-01
EOF

cat > contract-B.pdf <<EOF
Contract Document B
$LOREM_LONG
Signed: 2024-02-01
EOF

cat > "Service Agreement 2024.txt" <<EOF
Service Agreement
$LOREM_LONG
EOF

echo "$LOREM_MEDIUM" > NDA.txt

# === DOCUMENTS - personal ===
cd "$TRAINING_ENV/workspace/documents/personal"
echo "$LOREM_MEDIUM" > "personal notes.txt"
echo "$LOREM_SHORT" > todo-list.txt
echo "$LOREM_MEDIUM" > "vacation plans.md"
cat > ideas.txt <<EOF
Ideas:
- $LOREM_SHORT
- $LOREM_SHORT
- $LOREM_SHORT
EOF

# === MEDIA - images/photos ===
cd "$TRAINING_ENV/workspace/media/images/photos"
echo "IMG_20240115_001.jpg" > IMG_20240115_001.jpg
echo "IMG_20240115_002.jpg" > IMG_20240115_002.jpg
echo "IMG_20240220_001.jpg" > IMG_20240220_001.jpg
echo "IMG_20240220_002.jpg" > IMG_20240220_002.jpg
echo "IMG_20240315_001.jpg" > IMG_20240315_001.jpg
echo "$LOREM_SHORT" > "vacation photo 1.jpg"
echo "$LOREM_SHORT" > "vacation photo 2.jpg"

# === MEDIA - images/screenshots ===
cd "$TRAINING_ENV/workspace/media/images/screenshots"
echo "$LOREM_SHORT" > screenshot_2024-01-15.png
echo "$LOREM_SHORT" > screenshot_2024-02-20.png
echo "$LOREM_SHORT" > screenshot_2024-03-10.png
echo "$LOREM_SHORT" > "Screen Shot 2024-01-15.png"
echo "$LOREM_SHORT" > "Screen Shot 2024-02-20.png"

# === MEDIA - images/downloads ===
cd "$TRAINING_ENV/workspace/media/images/downloads"
echo "$LOREM_SHORT" > download1.jpg
echo "$LOREM_SHORT" > download2.jpg
echo "$LOREM_SHORT" > "image (1).jpg"
echo "$LOREM_SHORT" > "image (2).jpg"
echo "$LOREM_SHORT" > "image (3).jpg"

# === MEDIA - videos ===
cd "$TRAINING_ENV/workspace/media/videos"
echo "video_20240115.mp4" > video_20240115.mp4
echo "video_20240220.mp4" > video_20240220.mp4
echo "$LOREM_SHORT" > "Tutorial Video.mp4"
echo "$LOREM_SHORT" > "Meeting Recording.mp4"

# === MEDIA - audio ===
cd "$TRAINING_ENV/workspace/media/audio"
echo "$LOREM_SHORT" > audio_001.mp3
echo "$LOREM_SHORT" > audio_002.mp3
echo "$LOREM_SHORT" > "Voice Memo 1.m4a"
echo "$LOREM_SHORT" > "Voice Memo 2.m4a"

# === DOWNLOADS - tmp ===
cd "$TRAINING_ENV/workspace/downloads/tmp"
touch temp1.tmp temp2.tmp temp3.tmp
echo "$LOREM_SHORT" > partial_download.part
echo "$LOREM_SHORT" > installing.tmp
touch .DS_Store
touch Thumbs.db

# === DOWNLOADS - archives ===
cd "$TRAINING_ENV/workspace/downloads/archives"
echo "$LOREM_SHORT" > archive-2023.zip
echo "$LOREM_SHORT" > archive-2024-q1.zip
echo "$LOREM_SHORT" > archive-2024-q2.tar.gz
echo "$LOREM_SHORT" > "Backup Archive.zip"
echo "$LOREM_SHORT" > old-files.7z

# === DOWNLOADS - root ===
cd "$TRAINING_ENV/workspace/downloads"
echo "$LOREM_SHORT" > "document (1).pdf"
echo "$LOREM_SHORT" > "document (2).pdf"
echo "$LOREM_SHORT" > "document (3).pdf"
echo "$LOREM_SHORT" > setup.exe
echo "$LOREM_SHORT" > installer.dmg
echo "$LOREM_MEDIUM" > README.txt
echo "$LOREM_SHORT" > data.json
cat > data.xml <<EOF
<?xml version="1.0"?>
<data>
  <item>$LOREM_SHORT</item>
</data>
EOF

# === BACKUP - old-backup-2023 ===
cd "$TRAINING_ENV/workspace/backup/old-backup-2023"
echo "$LOREM_MEDIUM" > backup_jan_2023.tar.gz
echo "$LOREM_MEDIUM" > backup_feb_2023.tar.gz
echo "$LOREM_MEDIUM" > backup_mar_2023.tar.gz
echo "$LOREM_SHORT" > backup.log
cat > backup_log_2023.log <<EOF
[2023-01-15 10:00:00] Backup started
[2023-01-15 10:15:00] $LOREM_SHORT
[2023-01-15 10:30:00] Backup completed
EOF

# === BACKUP - old-backup-2024 ===
cd "$TRAINING_ENV/workspace/backup/old-backup-2024"
echo "$LOREM_MEDIUM" > backup_jan_2024.tar.gz
echo "$LOREM_MEDIUM" > backup_feb_2024.tar.gz
echo "$LOREM_MEDIUM" > backup_mar_2024.tar.gz
cat > backup_log_2024.log <<EOF
[2024-01-15 10:00:00] Backup started
[2024-01-15 10:15:00] $LOREM_SHORT
[2024-01-15 10:30:00] Backup completed
[2024-02-20 10:00:00] Backup started
[2024-02-20 10:15:00] $LOREM_SHORT
[2024-02-20 10:30:00] Backup completed
EOF

touch backup_config.bak
echo "$LOREM_SHORT" > settings.backup

# === Additional scattered files for variety ===
cd "$TRAINING_ENV/workspace"
cat > README.md <<EOF
# Workspace

$LOREM_MEDIUM

This is the main workspace directory.
EOF

cat > notes.txt <<EOF
General Notes
$LOREM_LONG
EOF

cat > config.yaml <<EOF
# Configuration file
workspace: true
# $LOREM_SHORT
EOF

# Additional markdown files
cat > projects/data-analysis-2024/README.md <<EOF
# Data Analysis Project 2024

This project contains data analysis scripts and results.

## Overview
$LOREM_SHORT

## Usage
Run the analysis.py script to generate results.
EOF

cat > projects/mobile-app/CHANGELOG.md <<EOF
# Changelog

## Version 0.1.0
- Initial release
- Basic functionality implemented

$LOREM_SHORT
EOF

cat > documents/personal/shopping-list.md <<EOF
# Shopping List

- Item 1
- Item 2
- Item 3

$LOREM_SHORT
EOF

cat > documents/personal/meeting-notes.md <<EOF
# Meeting Notes - March 2024

## Attendees
- Person A
- Person B

## Discussion
$LOREM_SHORT
EOF

cat > projects/website-redesign/docs/CONTRIBUTING.md <<EOF
# Contributing Guide

Thank you for contributing!

## Guidelines
$LOREM_SHORT
EOF

cat > projects/archived-projects/old-project-readme.md <<EOF
# Old Project

This is an archived project from 2022.

$LOREM_SHORT
EOF

cat > documents/contracts/agreement-notes.md <<EOF
# Agreement Notes

## Terms
$LOREM_SHORT

## Conditions
Consectetur adipiscing elit.
EOF

# === DATA LAB - text processing track ===
cd "$TRAINING_ENV/workspace"
mkdir -p data-lab/{logs,datasets,reports}

cat > data-lab/README.md <<'EOF'
# Data Lab Track

The Data Lab contains purpose-built datasets and log files for advanced text-processing, parsing, and reporting exercises. Each file is intentionally noisy so you can practice chaining together tools like `grep`, `awk`, `sed`, and `cut` to extract actionable insights.

## Directory Overview

- `logs/` – Raw application, access, and ETL pipeline logs with mixed formats
- `datasets/` – CSV/TSV files covering e-commerce transactions, IoT sensor readings, and support tickets
- `reports/` – Analyst briefs that describe real-world investigation prompts

Use these files to complete the new Text Processing & Data Science track in `EXERCISES.md`.
EOF

cd "$TRAINING_ENV/workspace/data-lab/logs"
cat > access-2024-08.log <<'EOF'
192.168.10.14 - - [15/Aug/2024:09:15:23 +0000] "GET /api/orders HTTP/1.1" 200 532 "-" "curl/7.81.0" 245ms
192.168.10.14 - - [15/Aug/2024:09:16:01 +0000] "POST /api/orders HTTP/1.1" 201 834 "-" "curl/7.81.0" 388ms
10.15.22.8 - - [15/Aug/2024:09:16:17 +0000] "GET /api/orders?status=pending HTTP/1.1" 200 2210 "https://dashboard.example/com" "Mozilla/5.0" 147ms
172.16.4.20 - - [15/Aug/2024:09:16:43 +0000] "GET /reports/monthly HTTP/1.1" 302 112 "-" "Mozilla/5.0" 91ms
192.168.10.14 - - [15/Aug/2024:09:17:02 +0000] "GET /api/orders/84721 HTTP/1.1" 200 645 "-" "curl/7.81.0" 210ms
203.0.113.9 - - [15/Aug/2024:09:17:18 +0000] "GET /admin HTTP/1.1" 401 188 "-" "sqlmap/1.6" 512ms
198.51.100.66 - - [15/Aug/2024:09:17:40 +0000] "GET /api/health HTTP/1.1" 200 85 "-" "kube-probe" 11ms
10.15.22.8 - - [15/Aug/2024:09:18:14 +0000] "GET /api/orders?status=failed HTTP/1.1" 200 1951 "https://dashboard.example/com" "Mozilla/5.0" 158ms
172.16.4.20 - - [15/Aug/2024:09:18:57 +0000] "GET /reports/monthly HTTP/1.1" 500 0 "-" "Mozilla/5.0" 421ms
203.0.113.9 - - [15/Aug/2024:09:19:05 +0000] "POST /admin/login HTTP/1.1" 401 211 "-" "sqlmap/1.6" 498ms
192.0.2.44 - - [15/Aug/2024:09:19:44 +0000] "GET /static/js/app.js HTTP/1.1" 200 12044 "https://example.com" "Mozilla/5.0" 33ms
192.0.2.44 - - [15/Aug/2024:09:20:01 +0000] "GET /static/css/main.css HTTP/1.1" 200 9512 "https://example.com" "Mozilla/5.0" 29ms
198.51.100.66 - - [15/Aug/2024:09:20:17 +0000] "GET /api/health HTTP/1.1" 500 91 "-" "kube-probe" 15ms
10.15.22.8 - - [15/Aug/2024:09:21:05 +0000] "GET /api/orders/failed HTTP/1.1" 404 312 "https://dashboard.example/com" "Mozilla/5.0" 182ms
192.168.10.14 - - [15/Aug/2024:09:21:37 +0000] "DELETE /api/orders/84721 HTTP/1.1" 204 0 "-" "curl/7.81.0" 264ms
EOF

cat > app-errors.log <<'EOF'
[2024-08-15 09:14:58] INFO  auth-service  User login succeeded for user_id=483
[2024-08-15 09:15:02] WARN  auth-service  Consecutive failures for user_id=912 (3 attempts)
[2024-08-15 09:15:17] ERROR checkout-service  Payment gateway timeout order_id=84721 retry=1
[2024-08-15 09:15:48] ERROR checkout-service  Payment gateway timeout order_id=84721 retry=2
[2024-08-15 09:16:03] INFO  etl-worker      Loaded 3,214 rows from s3://raw/transactions/2024-08-15.csv
[2024-08-15 09:16:11] WARN  etl-worker      Skipped malformed row at line=88 source=transactions
[2024-08-15 09:16:55] ERROR report-engine   Template render failed report=monthly margin=finance
[2024-08-15 09:17:29] INFO  checkout-service  Payment succeeded order_id=84721
[2024-08-15 09:17:42] ERROR api-gateway    Downstream 500 for route=/reports/monthly trace=eeac12
[2024-08-15 09:18:05] WARN  api-gateway    High latency detected route=/api/orders threshold=250ms
[2024-08-15 09:18:40] ERROR auth-service   Locked account user_id=912 reason=too_many_attempts
[2024-08-15 09:19:02] ERROR etl-worker     Output validation failed job=orders_daily missing=5 rows
EOF

cat > etl-pipeline.log <<'EOF'
2024-08-15T09:00:00Z STEP=ingest_raw   STATUS=START  SOURCE=orders/2024/08/15.csv
2024-08-15T09:00:46Z STEP=ingest_raw   STATUS=END    ROWS=3200 DURATION=46s
2024-08-15T09:01:02Z STEP=clean_records STATUS=START  FILTERS=duplicate,missing_price
2024-08-15T09:01:58Z STEP=clean_records STATUS=END    ROWS=2984 REMOVED=216
2024-08-15T09:02:11Z STEP=enrich_geo    STATUS=START  LOOKUP=geoip
2024-08-15T09:02:33Z STEP=enrich_geo    STATUS=WARNING MISSING_GEO=42
2024-08-15T09:02:54Z STEP=enrich_geo    STATUS=END    ROWS=2984 DURATION=43s
2024-08-15T09:03:05Z STEP=aggregate     STATUS=START  METRIC=revenue_by_region
2024-08-15T09:03:37Z STEP=aggregate     STATUS=END    GROUPS=8 DURATION=32s
2024-08-15T09:03:42Z STEP=publish       STATUS=START  TARGET=warehouse.orders_daily
2024-08-15T09:04:05Z STEP=publish       STATUS=FAIL   ERROR="constraint violation" RETRIES=1
2024-08-15T09:04:45Z STEP=publish       STATUS=START  TARGET=warehouse.orders_daily
2024-08-15T09:05:08Z STEP=publish       STATUS=END    ROWS=2984 DURATION=23s
EOF

cd "$TRAINING_ENV/workspace/data-lab/datasets"
cat > ecommerce_transactions.csv <<'EOF'
order_id,date,region,status,total,channel
A84721,2024-08-15T09:14:55Z,NA,FAILED,182.45,web
A84722,2024-08-15T09:15:42Z,NA,RETRY,182.45,web
A84723,2024-08-15T09:16:18Z,EMEA,SUCCESS,75.00,mobile
A84724,2024-08-15T09:17:05Z,APAC,SUCCESS,49.99,api
A84725,2024-08-15T09:17:48Z,NA,SUCCESS,182.45,web
A84726,2024-08-15T09:18:10Z,APAC,FAILED,210.00,mobile
A84727,2024-08-15T09:18:51Z,EMEA,SUCCESS,120.10,web
A84728,2024-08-15T09:19:32Z,NA,SUCCESS,330.00,api
A84729,2024-08-15T09:19:59Z,EMEA,SUCCESS,25.00,mobile
A84730,2024-08-15T09:20:41Z,APAC,SUCCESS,99.99,web
EOF

cat > sensor_readings.tsv <<'EOF'
device_id	sensor	temp_c	humidity	battery	timestamp
EDGE-001	temp	21.4	33	98	2024-08-15T09:15:00Z
EDGE-002	humidity	-	78	76	2024-08-15T09:15:05Z
EDGE-003	temp	19.8	44	65	2024-08-15T09:15:08Z
EDGE-001	humidity	21.4	35	97	2024-08-15T09:15:11Z
EDGE-004	temp	NaN	--	58	2024-08-15T09:15:19Z
EDGE-002	temp	23.0	73	74	2024-08-15T09:15:23Z
EDGE-005	humidity	24.1	29	89	2024-08-15T09:15:28Z
EDGE-003	humidity	19.8	45	65	2024-08-15T09:15:33Z
EDGE-004	humidity	18.1	41	58	2024-08-15T09:15:40Z
EDGE-001	temp	21.8	34	96	2024-08-15T09:15:45Z
EOF

cat > support_tickets.csv <<'EOF'
id,priority,state,category,message
T-501,high,open,payment,"Customer charged twice for order A84721"
T-502,medium,waiting,shipping,"Missing tracking update for order A84719"
T-503,low,closed,general,"Request for invoice copy"
T-504,high,open,security,"Suspicious login alerts for account 912"
T-505,medium,open,payment,"Coupon discount incorrect for cart 733"
T-506,high,escalated,availability,"Reports dashboard returning 500"
EOF

cd "$TRAINING_ENV/workspace/data-lab/reports"
cat > analysis-brief.md <<'EOF'
# Incident Brief

Revenue dipped on August 15th after a run of failed checkouts and timeouts in the reporting backend.
Analysts need fast answers to the following questions:

1. Which customer regions saw the most failed transactions between 09:14 and 09:20 UTC?
2. How many unique IPs received HTTP 401 or 500 responses?
3. Which ETL step should be prioritized for hardening based on the warnings in `etl-pipeline.log`?
4. Which sensor devices are sending malformed readings and need firmware attention?

Use the files inside `data-lab/` to extract the answers.
EOF

# Return to workspace root for remaining operations
cd "$TRAINING_ENV/workspace"

# Additional JSON file
cat > projects/mobile-app/tsconfig.json <<EOF
{
  "compilerOptions": {
    "target": "es2015",
    "module": "commonjs",
    "jsx": "react",
    "strict": true
  }
}
EOF

# SQL files in documents
cd "$TRAINING_ENV/workspace/documents"
cat > schema.sql <<EOF
-- Database schema
CREATE TABLE users (
  id INT PRIMARY KEY,
  name VARCHAR(100)
);
-- $LOREM_SHORT
EOF

cat > queries.sql <<EOF
-- Common queries
SELECT * FROM users;
-- $LOREM_SHORT
EOF

cat > backup_db.sql <<EOF
-- Database backup
-- Generated: 2024-03-15
-- $LOREM_MEDIUM
EOF

# Log files in projects
cd "$TRAINING_ENV/workspace/projects"
cat > build.log <<EOF
[2024-03-15 09:00:00] Build started
[2024-03-15 09:05:00] Compiling sources...
[2024-03-15 09:10:00] $LOREM_SHORT
[2024-03-15 09:15:00] Build completed successfully
EOF

cat > error.log <<EOF
[2024-03-15 10:00:00] ERROR: $LOREM_SHORT
[2024-03-15 10:05:00] WARNING: $LOREM_SHORT
[2024-03-15 10:10:00] INFO: $LOREM_SHORT
EOF

cat > access.log <<EOF
192.168.1.1 - - [15/Mar/2024:10:00:00] "GET /index.html HTTP/1.1" 200
192.168.1.2 - - [15/Mar/2024:10:05:00] "GET /api/data HTTP/1.1" 200
192.168.1.3 - - [15/Mar/2024:10:10:00] "POST /api/submit HTTP/1.1" 201
EOF

# Create some duplicates
cd "$TRAINING_ENV/workspace/documents"
echo "$LOREM_SHORT" > duplicate.txt
cp duplicate.txt "$TRAINING_ENV/workspace/projects/duplicate.txt"
cp duplicate.txt "$TRAINING_ENV/workspace/downloads/duplicate.txt"

# Create important file marker
cd "$TRAINING_ENV/workspace"
cat > ImportantFile.txt <<EOF
IMPORTANT FILE
$LOREM_MEDIUM

This file should not be deleted.
EOF

echo "✓ Generated approximately 150+ files with diverse patterns"
echo "✓ Directory structure populated with realistic content"

# Count files
TOTAL_FILES=$(find "$TRAINING_ENV" -type f | wc -l)
echo "✓ Total files created: $TOTAL_FILES"

