#!/bin/bash

declare -A distros=( ["arch"]="󰣇" ["debian"]="" ["fedora"]="" ["other"]="" )

case $(lsb_release -d | sed 's/Description:\t//g') in
        "Arch Linux")
                echo "${distros["arch"]}"
                ;;
        *)
                echo "${distros["other"]}"
                ;;
esac
