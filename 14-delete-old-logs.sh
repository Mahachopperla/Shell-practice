#!/bin/bash

Location=/home/ec2-user/Shell-practice/app-logs

files=$(find $Location -name "*.log" -mtime +14)
echo "deleting logs files older than 14 days: $files"

while IFS= read -r line
do
    rm -rf $line
    if [ $? -eq 0 ]
    then 
        echo "deleted successfully"
    else
        echo "deletion failed for $line"
    fi

done <<< $files

