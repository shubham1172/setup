#!/bin/sh

# This script helps me update my dot file regularly
# It exists in my crontab as:
#
# */30 * * * * ~/setup/scripts/backup.sh >/dev/null 2>&1

BACKUP=${HOME}/setup/scripts/backup

grep -v '^$\|^\s*\#' $BACKUP| while read -r line; do
	echo "$line" | awk '{ system("rsync " $1 " " $2) }'
done
