#!/bin/bash

TARGET_DIR="working-notes"

mkdir -p "$TARGET_DIR" # Ensure the directory exists, create it if it doesn't

TODAY=$(date +"%Y%m%d") # Get today's date in YYYYMMDD format

FILENAME="${TARGET_DIR}/${TODAY}.md"

touch "$FILENAME"

echo "Daily note created: $FILENAME"

open "$FILENAME"