#!/bin/bash
PROJ_NAME=RandonHw #update in new projects
PROJECT_ROOT="/home/thenhan/STM32/$PROJ_NAME"
SAFE_HOUSE="/home/thenhan/STM32/BackupForCubeMX/$PROJ_NAME"
TIMESTAMP=$(date +%Y%m%d_%H%M)

# Add any new folders here, separated by a space
#FOLDERS=("Utilities" "Drivers/Custom" "Docs")
FOLDERS=("Utilities" )
mkdir -p "$SAFE_HOUSE"

for FOLDER in "${FOLDERS[@]}"; do
    if [ -d "$PROJECT_ROOT/$FOLDER" ]; then
        # -R ensures it keeps the directory structure inside the backup
        rsync -avR "$PROJECT_ROOT/./$FOLDER" "$SAFE_HOUSE/"
    fi
done

echo "$TIMESTAMP: Backed up folders for $PROJ_NAME" >> "$PROJECT_ROOT/CubeMX_regenerate_log.txt"
