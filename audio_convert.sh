#!/bin/bash

myconvert() {
	orig="${1%flac}opus"
	arg="f.tmp.opus"
	ffmpeg -hide_banner -loglevel warning -i "$1" -an -c:v copy "coverpic.jpg"
	ffmpeg -hide_banner -i "$1" -c:a libopus -b:a 192k -vbr on -application audio -compression_level 10 "$arg"
	kid3-cli -c "select $arg" -c 'set picture:"coverpic.jpg" ""' -c 'save'
	mv "$arg" "$orig"
	rm -vf "coverpic.jpg"
	ls "$orig"
	rm -vf "$1"
}

export -f myconvert
find "$1" -regextype posix-egrep -iregex ".+\.flac" -execdir bash -c 'myconvert "$0"' {} \;
exit 0
