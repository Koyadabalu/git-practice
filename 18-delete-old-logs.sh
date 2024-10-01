#!/bin/bash

SOURCE_DIR=/home/ec2-user/log
if [ -d $SOURCE_DIR ]
then
    echo " $SOURCE_DIR Exists"
else
    echo "$SOURCE_DIR does not exist"
    exit 1 
fi 

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +14)
echo "files:$FILES"

while IFS = read -r line
do
  echo "Deleting line: $line"
  rm -rf $line
done
