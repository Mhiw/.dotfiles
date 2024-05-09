#!/bin/bash

# Add or remove directories/files (full path) in file "include.txt" to add to the repo
directories=($(cat include.txt | awk '!/#/ {print $0}'))

install_config() {
	for directory in "${directories[@]}"
	do
		directory_name=$(basename "$directory")
		mkdir $directory
		cp -r $directory_name /home/$USER/.config/
	done
}

if [ -d "/home/$USER/.config" ]; then
	install_config
else
	mkdir /home/$USER/.config
	install_config
fi
