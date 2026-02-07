#!/bin/bash

srcDir=$1
destDir=$2

if [ -z "$srcDir" ]; then
    read -p "Enter Source Directory: " srcDir
fi

if [ -z "$destDir" ]; then
    read -p "Enter Destination Directory: " destDir
fi

if [ ! -d "$srcDir" ]; then
    echo "Error: Source Directory '$srcDir' does not exist or is not a directory."
    exit 1
fi

if [ -e "$destDir" ] && [ ! -d "$destDir" ]; then
    echo "Error: Destination '$destDir' exists and is a file."
    exit 1
fi

if [ ! -d "$destDir" ]; then
    read -p "Destination Directory does not exist, create it? (y/yes): " choice
    if [[ "$choice" == "y" || "$choice" == "yes" ]]; then
        mkdir -p "$destDir"
    else
        echo "Exiting."
        exit 1
    fi
fi

for item in "$srcDir"/*; do
    if [ -d "$item" ]; then
        continue
    fi

    fileName=$(basename "$item")
    echo "File: $fileName"

    if [ -f "$destDir/$fileName" ]; then
        read -p "Overwrite this file ? (y/yes): " action
    else
        read -p "Copy this file ? (y/yes): " action
    fi

    if [[ "$action" == "y" || "$action" == "yes" ]]; then
        cp "$item" "$destDir/$fileName"
        echo "Successfully copied $fileName."
    fi
done

