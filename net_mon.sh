#!/bin/bash

flag=1
result="$(python ~/ytdl_dl.py)"
while flag == 1; do
    if [ result == "done" ]; then
        exit 0
    else
        result="$(python ~/ytdl_dl.py)"
    fi
done
