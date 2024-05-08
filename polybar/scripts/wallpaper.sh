#!/bin/bash
WALLPAPER_DIR="/usr/share/backgrounds/custom"
WALLAPPERS=()

INDEX_FILE="/tmp/wallpaper_index"
INDEX=0
if [ -f "$INDEX_FILE" ]; then
	INDEX=$(cat "$INDEX_FILE")
else
	echo "$INDEX" > "$INDEX_FILE"
fi

if ! [ -z $1 ]; then
	if [[ "$1" == "+" ]]; then
		INDEX=$(( INDEX + 1 ))
		echo "+"
	elif [[ "$1" == "-" ]]; then
		INDEX=$(( INDEX - 1 ))
		echo "+"
	elif [[ "$1" == "img" ]]; then
		echo  
		exit 0
	fi
fi

echo "$INDEX" > $INDEX_FILE

for image in "$WALLPAPER_DIR"/*; do
	if [ -f "$image" ]; then
		WALLPAPERS+=("$image")
	fi
done

if [ "$INDEX" -lt "${#WALLPAPERS[@]}" ]; then
	if ! [ "$INDEX" -lt "0" ]; then
		nitrogen --head=0 --set-zoom-fill "${WALLPAPERS[$INDEX]}"
		nitrogen --head=1 --set-zoom-fill "${WALLPAPERS[$INDEX]}"
	else
		INDEX=$(( ${#WALLPAPERS[@]} - 1 ))
		echo "$INDEX" > $INDEX_FILE
		nitrogen --head=0 --set-zoom-fill "${WALLPAPERS[$INDEX]}"
		nitrogen --head=1 --set-zoom-fill "${WALLPAPERS[$INDEX]}"
	fi
else
	INDEX=0
	echo "$INDEX" > $INDEX_FILE
	nitrogen --head=0 --set-zoom-fill "${WALLPAPERS[$INDEX]}"
	nitrogen --head=1 --set-zoom-fill "${WALLPAPERS[$INDEX]}"

fi
