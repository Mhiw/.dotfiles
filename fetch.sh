#!/bin/bash

# Add or remove directories/files (full path) in file "include.txt" to add to the repo
items=($(cat include.txt | awk '!/#/ {print $0}'))

for item in "${items[@]}"
do
	cp -r "$item" config/
done
