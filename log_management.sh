#!/bin/bash

# Configuration
LOG_DIR="/var/log"
ARCHIVE_DIR="/backup/logs"
MAX_SIZE_MB=100
BACKUP_FILE="log_backup_$(date +%Y%m%d%H%M%S).tar.gz"

# Ensure backup directory exists
mkdir -p $ARCHIVE_DIR

# Find log files larger than specified size and compress them
find $LOG_DIR -type f -size +$((MAX_SIZE_MB * 1024))c -exec tar -czvf $ARCHIVE_DIR/$BACKUP_FILE {} +

# Remove original log files
find $LOG_DIR -type f -size +$((MAX_SIZE_MB * 1024))c -exec rm {} +

echo "Backup created: $ARCHIVE_DIR/$BACKUP_FILE"
echo "Original log files deleted."
