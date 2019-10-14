#!/bin/sh
# auto mount my partitions on start
# read the mounting info from automount

PART_INFO=${HOME}/setup/scripts/automount

grep -v '^$\|^\s*\#' $PART_INFO	| while read -r line; do
		echo $line | awk '{ system("mount -t $1 --uuid $2 $3") }'
done 
