#!/bin/bash
# $1 will be the project name passed from CubeMX
PROJ_NAME=$1
PROJECT_ROOT="/home/thenhan/STM32/$PROJ_NAME"
SAFE_HOUSE="/home/thenhan/STM32/BackupForCubeMX/$PROJ_NAME"


# Create a timestamped folder name (e.g., MyProject_20240420_1530)
TIMESTAMP=$(date +%Y%m%d_%H%M)
# The folder CubeMX keeps deleting
CUSTOM_FOLDER="Utilities"

if [ -d "$PROJECT_ROOT/$CUSTOM_FOLDER" ]; then
    mkdir -p "$SAFE_HOUSE"
    #rsync -av --delete "$PROJECT_ROOT/$CUSTOM_FOLDER/" "$SAFE_HOUSE/"
    rsync -av "$PROJECT_ROOT/$CUSTOM_FOLDER/" "$SAFE_HOUSE/"
    echo "$TIMESTAMP: Backed up $PROJ_NAME to safe house." >> "$PROJECT_ROOT/CubeMX_regenerate_log.txt"
fi


