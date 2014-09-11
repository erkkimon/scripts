#!/bin/bash

mkdir .frames &&
ffmpeg -i $1 -vf scale=480:-1 -r 20 .frames/ffout%03d.png &&
cp .frames/ffout020.png $2.png &&
convert -delay 5 -loop 0 .frames/ffout*.png $2 &&
rm -rf .frames
