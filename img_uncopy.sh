#!/usr/bin/env bash

function lsCopy () {
    #printf "\nDBG:$1\n"
	osz="$(wc -c $1 | egrep -o "^[0-9]*")"
	oname="${1/'.1'}"

    if [ -e "$oname" ]; then
		echo "$1 is a copy of $oname"
        csz="$(wc -c $oname | egrep -o "^[0-9]*")"
		if [ "$osz" = "$csz" ]; then
			echo "$oname Broken"
            rm -v "$oname"
            printf '\n\n'
		else
            echo "Removing copy $1"
            rm -v "$1"
        fi
	fi
}

find $1 -maxdepth 5 -regextype egrep -iregex ".*\.[0-9]\..*" -execdir bash -c 'lsCopy "$0"' {} \;