#!/bin/bash

function imgconv () {
	iconvert -v --quality 100 --compression png "$1" "${1%webp}png"
}

export -f imgconv
find "$1" -regextype posix-egrep -iregex ".+\.webp" -execdir bash -c 'imgconv "$0"' {} \;
exit 0
