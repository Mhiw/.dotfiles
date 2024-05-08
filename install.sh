#!/bin/bash

# Add or remove directories (full path) in file "directories.txt" to add to the repo
directories=($(cat directories.txt | awk '!/#/ {print $0}'))

install_config() {
	for directory in "${directories[@]}"
	do
		directory_name=$(basename "$directory")
		mkdir $directory
		cp -r $directory_name $directory
	done
}

if [ -d "/home/$USER/.config" ]; then
	install_config
else
	mkdir /home/$USER/.config
	install_config
fi
