#!/bin/bash

declare -A distros=( ["arch"]="󰣇" ["debian"]="" ["fedora"]="" )

if test -n $1; then
	echo "${distros[$1]} "
fi
