#!/bin/bash

#if $1 is empty then script will ask to provide arguement else store that argument as path varibale
if [ -z "$1" ]; then
	read -p "provide directory path" path
       
else
	path="$1"
fi

 
#if the argument which stored as path varibale is not directory then print invalid directory and exit script, else print valid directory

if [ ! -d "$path" ]; then
        echo "invalid directory"
	exit 1

else
	echo "valid directory"
fi

#utilization will be checked for that directory stored in varibale and then it will be sorted in reverse order to show big file on top
#then head will show top 5 file/directory and this will o/p woll be stored in /tmp as outpu and it will be printed using cat at the end.

du -h $path |sort -hr |head -n 5 > /tmp/utilization.sh

echo "the fs utilization for $path is as below"

cat /tmp/utilization.sh
