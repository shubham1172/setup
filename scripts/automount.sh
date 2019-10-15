#!/bin/sh
# auto mount my partitions on start
# read the mounting info from automount

USER_HOME=$(eval echo ~${SUDO_USER})
MOUNT_INFO=${USER_HOME}/setup/scripts/automount

# ask for root permissions
if [ $EUID != 0 ]; then
	echo 'Root permissions required, run with sudo.'
    exit $?
fi

grep -v '^$\|^\s*\#' $MOUNT_INFO | while read -r type uuid dest; do
	if [ -d "$dest" ]; then
			# try to umount if mounted
			umount "$dest" || /bin/true
	else
			# create the dir
			mkdir -p "$dest"
	fi
	# mount it finally
	eval "mount -t $type --uuid $uuid \"$dest\""
done 
