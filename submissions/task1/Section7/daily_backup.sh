#!/bin/bash
SOURCE_DIR="$HOME/SysOpsLab"
BACKUP_DIR="$HOME/Backups"
LOG_FILE="$BACKUP_DIR/backup_log.txt"
TIMESTAMP=$(date +"%Y%m%d_%H%M")
BACKUP_FILE="$BACKUP_DIR/backup_${TIMESTAMP}.tar.gz"
echo "[$(date)] Starting backup..." >> "$LOG_FILE"
tar -czf "$BACKUP_FILE" "$SOURCE_DIR" 2>>"$LOG_FILE"
if [[ -f "$BACKUP_FILE" ]]; then
    echo "[$(date)] Backup created: $BACKUP_FILE" >> "$LOG_FILE"
else
    echo "[$(date)] ERROR: Backup failed!" >> "$LOG_FILE"
fi
find "$BACKUP_DIR" -name "backup_*.tar.gz" -mtime +10 -exec rm {} \; -exec echo "[$(date)] Deleted old backup: {}" >> "$LOG_FILE" \;
echo "[$(date)] Backup job completed." >> "$LOG_FILE"
echo "" >> "$LOG_FILE"
