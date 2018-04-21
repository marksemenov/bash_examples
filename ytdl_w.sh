#!/usr/bin/env bash

function setns() {
    $1="$(cat dev | egrep -i '^enp[0-9]s[0-9]?[0-9]?u' | cut -d ' ' --fields=2)"
}

ydl_pid="$(cat /home/mark/tmp/ydl-pid)"
nst1="$(cat dev | egrep -i '^enp[0-9]s[0-9]?[0-9]?u' | cut -d ' ' --fields=2)"
threshold="15360000"        # ~ 15 megabytes

while true;
do
    urls_rw="$(grep -c '.*' /home/mark/ytdl-rw)"

    if [ "$urls_rw" -lt "0" ]
        break

    if [ "$(cat /home/marl/tmp/ydl-pid)" == '' ]; then
        ~/bin/ytdl_dl.py &
        sleep 2m

        ydl_pid="$(cat /home/mark/tmp/ydl-pid)"
        setns nst1

    else

        setns nst2
        nres="$[nst2 - nst1]"

        if [ "$nres" -lt "$threshold" ]
            kill "$ydl_pid"
            ~/bin/ytdl_dl.py &
            sleep 2m

            ydl_pid="$(cat /home/mark/tmp/ydl-pid)"
            setns nst1

        else setns nst1
        fi
    fi

    sleep 5m
done