#!/bin/bash

#source dir = /home/ec2-user/Shell-practice/app-logs
Source_dir=$1
Dest_dir=$2
Days="${3:-14}"

if [ ! -d $Source_dir ] || [ ! -d $Dest_dir ]
then
    echo "Please check the args you passed "SOURCE or DESTINATION" directory you specified is not existing"
    exit 1
fi

ZIP_FILE=$Dest_dir/backup.zip

files=$(find $Source_dir -name "*.log" -mtime +14)
if [ -z "$files" ]; then
    echo "there are no files which are older than $Days days"
else
    echo "zipping logs files older than 14 days: $files"

    while IFS= read -r line
    do
        zip -j "$ZIP_FILE" "$files"

    done <<< "$files"
fi


