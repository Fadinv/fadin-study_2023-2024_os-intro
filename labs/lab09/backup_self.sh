#!/bin/bash

echo "Starting backup script..."

SCRIPT_FILE=$(basename "$0")
echo "Script file name: $SCRIPT_FILE"

mkdir -p ~/backup
echo "Backup directory created: ~/backup"

zip ~/backup/"$SCRIPT_FILE".zip "$0"
echo "Script file archived: ~/backup/$SCRIPT_FILE.zip"
