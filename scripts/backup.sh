#!/bin/sh

# This script helps me update my dot files regularly
# It exists in my anacrontab as:
#
# @daily  10      setup.backup            su -c /home/shubham1172/setup/scripts/backup.sh - shubham1172 >> /home/shubham1172/.anacronlogs 2>&1

cd ${HOME}/setup/

BACKUP=${HOME}/setup/scripts/backup

timestamp() {
  date +"%m-%d-%Y"
}

grep -v '^$\|^\s*\#' $BACKUP| while read -r line; do
	echo "$line" | awk '{ system("rsync " $1 " " $2) }'
done

if [[ `git status --porcelain` ]]; then
	git add .
	git commit -m '$timestamp'
	git push origin master
fi
