#!/bin/sh
###########################################################
#  Author https://github.com/trevor256
#  script compresses media with ffmpeg
#  Linux OS (any)
###########################################################

#compress any video into a .mp4 with h265 compretion
for f in videos/*; do ffmpeg -i "$f" -vcodec libx265 "compressed/$(basename "${f%.*}").mp4"; done
for f in 'test'/*; do ~/nvidia/ffmpeg/ffmpeg -hwaccel cuda -i "$f" -c:v hevc_nvenc "test/$(basename "${f%.*}").mp4"; done
ffmpeg -hwaccel_device 0 -hwaccel cuda -i "input.mkv" -c:v h264_nvenc -preset slow "output.mp4"
