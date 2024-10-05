#!/bin/bash

echo "interactive script to list five big file from specified directory"

#first argument to script will be stored as $1, same used as path here
path="$1"

du -h $path |sort -hr |head -n 5 > /tmp/bigfslog.txt

echo "list of big files from $path is below"

cat /tmp/bigfslog.txt 
