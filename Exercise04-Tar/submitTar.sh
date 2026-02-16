#!/bin/bash

DEST_DIR="/home/cli-shared"
USER_NAME="tiantian"
DEST_FILE="Ex04-${USER_NAME}.tar"

if [ -f "${DEST_DIR}/${DEST_FILE}" ]; then
    echo "Error: File ${DEST_FILE} already exists in ${DEST_DIR}."
    exit 1
fi

cd ~
tar -cvf "${DEST_FILE}" shell-scripts

if [ $? -ne 0 ]; then
    echo "Tar command failed."
    exit 1
fi

cp "${DEST_FILE}" "${DEST_DIR}"
echo "Success! File Ex04-tiantian.tar has been submitted."
