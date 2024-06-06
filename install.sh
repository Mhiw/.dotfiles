#!/bin/bash

# Add or remove directories/files (full path) in file "include.txt" to add to the repo
items=($(cat include.txt | awk '!/#/ {print $0}'))

for item in "${items[@]}"
do
	item_name=$(basename "$directory")
	mkdir $item
	cp -r $item_name $($item | sed 's/$item_name//g')
done
