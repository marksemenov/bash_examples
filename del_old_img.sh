#!/bin/bash

oname="${1/_d/}"
lname="${oname/.webp/}"
oname="${lname#'./'}"
d="$PWD/$oname"

if [ -e "$d" ];  then
	rm -fv "$1"
else
	echo "no original image for $1"
fi