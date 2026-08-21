#!/bin/sh
# By Jacky Chen
# finder.sh:
# Inputs: 
#   filesdir - path to a directory on file system
#   searchstr - text string that will be searched within files
# Output:
#   Error code 1 and print if any parameters not specified
#   Error code 1 and print if filesdir is not a directory in the filesystem
#   Print "The number of files are X and the number of matching lines are Y"
#       where X is number of files in the directory and all sub directories
#       where Y is the number of matching lines found in respective files

filesdir=$1
searchstr=$2

usage="Usage: <filesdir> <searchstr>"
if [ $# -ne 2 ]; then 
    echo "finder.sh: 2 arguments required: $usage"
    exit 1
fi

if [ ! -d $filesdir ]; then
    echo "filesdir is not a directory in the filesystem."
    exit 1
fi


line_count=$(grep -r "$searchstr" $filesdir  | wc -l)
dir_and_files_count=$(find $filesdir -type f | wc -l)

echo "The number of files are $dir_and_files_count and the number of matching lines are $line_count"