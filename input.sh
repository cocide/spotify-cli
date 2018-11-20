#!/bin/bash

exec 3< /dev/hidraw0	# open the file for reading on file descriptor 3

while true; do

	read -N1 -u3 char	# read 1 character into variable "char"
	code=$(echo $char | hexdump | head -n 1 | cut -d " " -f2)	#convert the hex to a string to make it easier to analyze

	case $code in
		0a01) ./vol_up.sh;;
		0a02) ./vol_dn.sh;;

		000a) ./next.sh;;
		0a10) ./previous.sh;;

		0a04) ./play_pause.sh;;
		*) echo 'unknown: '$code;;
	esac
done
