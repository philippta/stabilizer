#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Please provide a video file to stabilize as argument."
    exit 1
fi

input="$1"
if [ ! -f "$input" ]; then
    echo "$input not found. Did you mount the volume to the container correctly (/video)?"
    exit 1
fi

fullname=$(basename -- "$input")
ext="${fullname##*.}"
filename="${fullname%.*}"

ffmpeg -y -i "$input" -vf vidstabdetect=shakiness=5:show=1 /tmp/dummy.mp4
rm /tmp/dummy.mp4

ffmpeg -y -i "$input" -vf vidstabtransform,unsharp=5:5:0.8:3:3:0.4 "${filename}-stabilized.${ext}"
rm transforms.trf
