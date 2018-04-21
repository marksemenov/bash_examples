#!/usr/bin/env python2

from __future__ import unicode_literals
import youtube_dl
from time import sleep
from string import find
from os import getpid

class MyLogger(object):
    def debug(self, msg):
        pass

    def warning(self, msg):
        pass

    def error(self, msg):
        open('/home/mark/tmp/ydl-status', 'w').write('fail')

def my_hook(d):
    global result
    if d['status'] == 'finished':
        del url_num[0]
        open('/home/mark/ytdl-rw', 'w').writelines(url_num)

'''
    *** Variables and files ***

    ydl_opts - options for yotube-dl.

    url_num - array of urls to process.
    
    ytdl-pid - file with the PID of the script.
    
    ydl-status - status of current operation. Empty if all is ok.

    ytdl-rw - file with urls to process.
'''

ydl_opts = {
    'format': '22/135+251/0/mp4/webm/3gp',
    'outtmpl': '/media/windows/videos/%(title)s - %(id)s.%(ext)s',
    'nooverwrites': 'true',
    'ignoreerrors': 'false',
    'progress_hooks': [my_hook],
    'logger': MyLogger(),
    'continuedl': 'true',
}

open('/home/mark/tmp/ydl-pid', 'w').writelines( str(getpid()) + '\n' )
open('/home/mark/tmp/ydl-status', 'w').write('')

if open('/home/mark/ytdl-rw', 'r').read() == '\n':
    open('/home/mark/ytdl-rw', 'w').writelines( open( '/home/mark/ytdl', 'r' ).read() )
url_num = open('/home/mark/ytdl-rw', 'r').readlines()

'''
    *** Main loop ***
'''

with youtube_dl.YoutubeDL(ydl_opts) as ydl:
    while len(url_num) > 0:
        try:
            ydl.download( url_num )
        finally:
            if find( open('/home/mark/tmp/ydl-status', 'r').read(), 'fail' ) > -1:
                del url_num[result]
                if len(url_num) == 0:
                    open('/home/mark/ytdl-rw', 'w').writelines( open( '/home/mark/ytdl', 'r' ).read() )
                else:
                    open('/home/mark/ytdl-rw', 'w').writelines(url_num)
            sleep(240)