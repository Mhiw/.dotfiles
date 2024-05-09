#!/bin/bash

# Add or remove directories/files (full path) in file "include.txt" to add to the repo
directories=($(cat include.txt | awk '!/#/ {print $0}'))

for directory in "${directories[@]}"
do
	cp -r "$directory" .
done
