#!/bin/bash

#source dir = /home/ec2-user/Shell-practice/app-logs
Source_dir=$1
Dest_dir=$2
Days="${3:-14}"

if [ $# -lt 2 ]
then
    echo "Please use format: <command> <source directory> <destination directory> <days(optional)>"
    exit 1
fi

if [ ! -d $Source_dir ] || [ ! -d $Dest_dir ]
then
    echo "Please check the args you passed "SOURCE or DESTINATION" directory you specified is not existing"
    exit 1
fi


timestamp=$(date +"%Y-%m-%d-%H-%M-%S")


ZIP_FILE=${Dest_dir}/${timestamp}_backup.zip

files=$(find $Source_dir -name "*.log" -mtime +$Days)
if [ -z "$files" ]; then
    echo "there are no files which are older than $Days days"
else
    echo "zipping logs files older than 14 days: $files"

    while IFS= read -r line
    do
        zip -j "$ZIP_FILE" "$line"
        rm -f $line

    done <<< "$files"
fi


