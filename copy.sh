#!/bin/bash

## Run the "dev" command from package.json
#npm run dev
#
## Check if the "dev" command ran successfully
#if [ $? -ne 0 ]; then
#  echo "Failed to execute the dev command"
#  exit 1
#fi

# Read the "id" field from the manifest.json file
MANIFEST_FILE="manifest.json"
TARGET_ID=$(jq -r '.id' "$MANIFEST_FILE")

# Check if the "id" value was successfully retrieved
if [ -z "$TARGET_ID" ] || [ "$TARGET_ID" == "null" ]; then
  echo "Failed to retrieve the 'id' property from $MANIFEST_FILE"
  exit 1
fi

# Define the target directory using the "id" value
TARGET_DIR="/mnt/c/Users/ifi6278/Documents/Obsidian Vault/Dev-Area/.obsidian/plugins/$TARGET_ID"

# Create the target directory if it doesn't already exist
mkdir -p "$TARGET_DIR"

# Copy main.js and manifest.json to the target directory
cp main.js manifest.json "$TARGET_DIR"

# Check if the files were successfully copied
if [ $? -ne 0 ]; then
  echo "Failed to copy files to $TARGET_DIR"
  exit 1
fi

echo "Files main.js and manifest.json were successfully copied to $TARGET_DIR"
exit 0
