#!/bin/bash

# Define color codes using ANSI escape sequences
RED='\e[38;2;255;0;0m'      # Hex: #FF0000
GREEN='\e[38;2;0;255;0m'    # Hex: #00FF00
YELLOW='\e[38;2;255;255;0m' # Hex: #FFFF00
MAGENTA='\e[38;5;206m'     # Hex: #0000FF
CYAN='\e[38;2;0;255;255m'   # Hex: #00FFFF
NC='\e[0m'                  # No Color

echo -e ${GREEN}"what file to be extracted (hint: zip or rar): ${NC}";
read type_src

echo -e ${YELLOW}"From where : ${NC}";
read from_source

echo -e ${CYAN}"To where : ${NC}";
read to_source

echo -e ${RED}"Source directory: $from_source ${NC}"
echo -e ${RED}"Destination directory: $to_source ${NC}"

# Create the destination directory if it doesn't exist
mkdir -p "$to_source"

# Change to the source directory
cd "$from_source" || { echo "Source directory not found"; exit 1; }

# List the files in the source directory for debugging
echo "Files in the source directory:"
ls

# Extract all ZIP files to the destination directory
for file in *.$type_src; do
    if [ -f "$file" ]; then
        echo "Extracting $file to $to_source"
        7z x "$file" -o"$to_source"
    else
        echo "No ZIP files found in the source directory."
        break
    fi
done
