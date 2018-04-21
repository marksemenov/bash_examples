#/bin/bash!

oname="${1/_d/}"
lname="${oname/.webp/}"
oname="${lname#'./'}"
lname="imgur.com/$oname"

if [ -e "$PWD/$oname" ]; then
    rm -v "$1"
else
	wget --random-wait -c "$lname"
    if [ -e "$PWD/$oname" ]; then
        rm -v "$1"
    fi
fi
