#!/bin/bash

VOLUME="$(amixer get Master | grep 'Front Left' | awk -F'[][]' '{print $2}' | sed 's/%//' | tr -d '\n')"
VOL_LOW_ICON="󰕿"
VOL_LOW=30

VOL_MID_ICON="󰖀"
VOL_MID=80

VOL_HIGH_ICON="󰕾"
VOL_HIGH=100

VOL_MUTE_ICON="󰝟"
MUTED_COMMAND="$(amixer get Master | grep -o '\[on\|\[off' | awk 'NR==1{print $1}' | tr -d '\[')"
MUTED=false
if [[ "$MUTED_COMMAND" == "off" ]]; then
	MUTED=true
fi

get_vol_icon() {
	if [[ $VOLUME -lt $VOL_LOW ]]; then
		echo "$VOL_LOW_ICON $VOLUME%"
	elif [[ $VOLUME -lt $VOL_MID ]]; then
		echo "$VOL_MID_ICON $VOLUME%"
	else
		echo "$VOL_HIGH_ICON $VOLUME%"
	fi
}

if ! test -z $1; then
	if [ "$1" == "toggle" ]; then
		amixer set Master toggle
	elif [ "$1" == "+" ]; then
		amixer set Master 5%+
	elif [ "$1" == "-" ]; then
		amixer set Master 5%-
	fi
fi

if [[ $MUTED == true ]]; then
	echo "$VOL_MUTE_ICON"
else
	get_vol_icon
fi
