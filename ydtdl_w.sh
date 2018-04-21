#!/usr/bin/env bash

urls_rw="$(cat /home/mark/ytdl-rw)"
err_st="$(cat /home/mark/tmp/ydl-status)"
ydl_pid="$(cat /home/mark/tmp/ydl-pid)"
urls_rw="$(cat /home/mark/ytdl-rw)"
flag="1"

while [ $flag = "1" ]