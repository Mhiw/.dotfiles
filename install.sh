#!/bin/bash

# Add or remove directories (full path) in file "directories.txt" to add to the repo
directories=($(cat directories.txt | awk '!/#/ {print $0}'))

if [ -d "/home/$USER/.config" ]; then
	install_config
else
	mkdir /home/$USER/.config
	install_config
fi

install_config() {
	for directory in "${directories[@]}"
	do
		directory_name=$(basename "$directory")
		mkdir $directory
		cp $directory_name $directory
	done
}
