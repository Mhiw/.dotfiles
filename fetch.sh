#!/bin/bash

# Add or remove directories (full path) to add to the repo
directories=(
	"/home/wi/.config/nvim"
)

for directory in $directories 
do
	#echo $(ls "$directory")
	cp -r "$directory" .
done
