#!/bin/bash

arg1="0:0.0"

cuebreakpoints "$1" 2>/dev/null 1>timestamps.tmp
it=1
for arg2 in $(cat "timestamps.tmp");
do
	flac --skip=$arg1 --until=$arg2 -o "$it.flac" "${1%cue}flac"
	echo "arg1 = $arg1 arg2 = $arg2"
	arg1="$arg2"
	it=$(expr $it + 1)
done
#rm -fv "timestamps.tmp"
