#!/bin/bash

# Add or remove directories/files (full path) in file "include.txt" to add to the repo
items=($(cat include.txt | awk '!/#/ {print $0}'))

install_config() {
	for item in "${items[@]}"
	do
		item_name=$(basename "$directory")
		mkdir $item
		cp -r $item_name $(echo $item | sed 's/$item_name//g')
	done
}

if [ -d "/home/$USER/.config" ]; then
	install_config
else
	mkdir /home/$USER/.config
	install_config
fi
