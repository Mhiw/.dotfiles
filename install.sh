#!/bin/bash

# Add or remove directories (full path) in file "directories.txt" to add to the repo
directories=($(cat directories.txt | awk '!/#/ {print $0}'))
