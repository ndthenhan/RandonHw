#!/bin/bash

# Configuration - Change these to your project paths
PROJECT_DIR="/home/thenhan/STM32/RandonHw"
#PROJECT_DIR="{workspaceFolder}"

BACKUP_ROOT="/home/thenhan/STM32/BackupForCubeMX"

# Create a timestamped folder name (e.g., MyProject_20240420_1530)
TIMESTAMP=$(date +%Y%m%d_%H%M)
#DESTINATION="$BACKUP_ROOT/pre_gen_$TIMESTAMP"
DESTINATION="$BACKUP_ROOT"
# Create backup directory
#mkdir -p "$DESTINATION"

# Backup the Core and App folders (where your custom code usually lives)
# Add or remove folders as needed
rsync -av "$PROJECT_DIR/Utilities"  "$DESTINATION/"

echo "$TIMESTAMP - Re-generation backup completed to $DESTINATION" >> "$PROJECT_DIR/CubeMX_regenerate_log.txt"
