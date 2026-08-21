#!/bin/bash
# Author: Jacky Chen
# writer.sh
# Input:
#   writefile: Full path to a file including the filename on the filesistem
#   writestr: String which will be written within this file
# Output:
#   Exit value 1 and print statement if any args not specified
#   Exit value 1 and print statemtn if file could not be created
# Does:
#   Create new file with name and path writefile with content writestr. Overwrites any exiting file.
#   Create new path if it doens't exist

writefile=$1
writestr=$2

if [ $# -ne 2 ]; then
    echo "writer.sh: 2 arguments required. Usage: writer.sh <writefile> <writestr>"
    exit 1
fi

writedir=$(dirname "$writefile")

mkdir -p "$writedir"

if [ $? -ne 0 ]; then
    echo "writer.sh: Unable to to create file"
    exit 1
fi 

echo $writestr > $writefile

if [ $? -ne 0 ]; then 
    echo "writer.sh Unable to write content to file"
    exit 1
fi
