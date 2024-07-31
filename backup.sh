#!/bin/bash

# Directories
BACKUP_DIR="/home/vitalik/Coursera_learn"
SOURCE_DIR="/etc"

# Ensure backup directory exists
mkdir -p $BACKUP_DIR

# Timestamp
TIMESTAMP=$(date +'%Y%m%d%H%M%S')

# Find and copy updated password files, handle permission errors
find $SOURCE_DIR -name '*.passwd' -mtime -1 -exec cp --parents {} $BACKUP_DIR 2>/dev/null \;

# Create archive
tar -czf $BACKUP_DIR/backup-$TIMESTAMP.tar.gz -C $BACKUP_DIR .

# Remove temporary backup files
find $BACKUP_DIR -name '*.passwd' -type f -delete

