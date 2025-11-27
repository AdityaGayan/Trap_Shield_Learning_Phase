#!/bin/bash

read -p "Enter filename: " fname

if [ -f "$fname" ]; then
    echo "File found."
    echo "$(date '+%d-%m-%Y %H:%M:%S') - File '$fname' found." >> inspector_log.txt
else
    echo "File created."
    touch "$fname"
    echo "$(date '+%d-%m-%Y %H:%M:%S') - File '$fname' created." >> inspector_log.txt
fi
