#!/bin/bash
for i in videos/original/*.webm;
  do name=`echo $(basename $i) | cut -d'.' -f1`
  echo "Processing $name"
  ffmpeg -i videos/original/$name.webm \
    -vcodec libx264 \
    -profile:v main \
    -level 3.1 \
    -preset medium \
    -crf 23 \
    -x264-params ref=4 \
    -acodec copy \
    -movflags +faststart \
    videos/converted/$name.mp4
done