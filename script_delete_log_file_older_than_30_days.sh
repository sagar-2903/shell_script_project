#!/bin/bash

echo "script to delete files/log older than 30 days"

read -p  "directory path need to delete-" path

#check if provided path is valid

if [ ! -d "$path" ]; then
	echo "this is not valid directory"
	exit 1
fi

#reconfirm deletetion

read -p "are you sure you want to delete all files older than 30 days from "$path"? (y/n)" confirm

if [ "$confirm"  !=  "y" ]; then
	echo "operation cancelled"
	exit 0
fi

#find and delete files older than 30 days

file_list=$(find "$path" -type f -mtime +30)

if [ -n "$file_list" ]; then
	find "$path" -type f -mtime +30 -exec rm {} \;
	echo "older than 30 days files/log deleted"

	if [ $? -eq  0 ]; then
               echo "delete operation successful"
        else
               echo "script failed"
        fi

else    
	echo "no files older than 30 days"

fi

