#!/bin/bash

# $1 will be the project name passed from CubeMX
#PROJ_NAME=$1
PROJ_NAME=RandonHw
PROJECT_ROOT="/home/thenhan/STM32/$PROJ_NAME"
SAFE_HOUSE="/home/thenhan/STM32/BackupForCubeMX/$PROJ_NAME"


# Create a timestamped folder name (e.g., MyProject_20240420_1530)
TIMESTAMP=$(date +%Y%m%d_%H%M)
# The folder CubeMX keeps deleting


if [ -d "$SAFE_HOUSE" ]; then
    #mkdir -p "$PROJECT_ROOT/$CUSTOM_FOLDER"
    rsync -av "$SAFE_HOUSE/" "$PROJECT_ROOT/"
    echo "$TIMESTAMP: Restored $CUSTOM_FOLDER to $PROJ_NAME." >> "$PROJECT_ROOT/CubeMX_regenerate_log.txt"
fi

#DESTINATION="$BACKUP_ROOT/pre_gen_$TIMESTAMP"
#DESTINATION="$BACKUP_ROOT"
# Create backup directory
#mkdir -p "$DESTINATION"

# Backup the Core and App folders (where your custom code usually lives)
# Add or remove folders as needed
#rsync -av "$PROJECT_DIR/Utilities"  "$DESTINATION/"
#if [ -d "$BACKUP_DIR" ]; then
#    rsync -av "$BACKUP_DIR/" "$PROJECT_DIR/"
#    echo "Restore complete: $(date)" >> "$PROJECT_DIR/CubeMX_regenerate_log.txt"
#else
#    echo "Restore failed: Backup folder not found" >> "$PROJECT_DIR/CubeMX_regenerate_log.txt"
#fi


#echo "$TIMESTAMP - Restore folder completed to $DESTINATION" >> "$PROJECT_DIR/CubeMX_regenerate_log.txt"
