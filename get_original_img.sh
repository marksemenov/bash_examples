#!/bin/bash

#function img_get () {
	oname="${1/_d/}"
	lname="${oname/.webp/}"
	oname="${lname#'./'}"
	lname="imgur.com/$oname"
	d="$PWD/$oname"
	if [ -e "$d" ];  then
		echo ''
	else
		wget -c "$lname"
	fi
#}
