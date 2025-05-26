#!/bin/bash

Location=/home/ec2-user/Shell-practice/app-logs

files=$(find $Location -name "*.log" -mtime +14)

while IFS= read -r line
do
    echo $line
    
done <<< $files

