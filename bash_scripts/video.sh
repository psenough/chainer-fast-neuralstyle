#!/bin/sh

# what video to use as input
video="/home/psenough/Documents/_videos/SampleVideo_360x240_2mb.mp4"

# what model to use for the style transfer
model="/home/psenough/Documents/chainer-fast-neuralstyle/models/seurat.model"

# where to store the output result
output="/home/psenough/Documents/output.mp4"

# where to dump the frames from ffmpeg
tmpframes="/home/psenough/Documents/tmpframes"

# where to dump the transformed frames
tmpframest="/home/psenough/Documents/tmpframest"

# location of generate.py
generatepy="/home/psenough/Documents/chainer-fast-neuralstyle/generate.py"

rm -rf $tmpframes
mkdir $tmpframes

rm -rf $tmpframest
mkdir $tmpframest

ffmpeg -i $video $tmpframes/thumb%06d.png

count=$(ls $tmpframes/* | wc -l)

fps=$(ffmpeg -i $video 2>&1 | sed -n "s/.*, \(.*\) fp.*/\1/p")

for i in $tmpframes/* 
do
    if test -f $i
    then
    	b=$(basename $i)
    	echo "processing $b (total: $count)"
       	python -W ignore $generatepy $i -m $model -o $tmpframest$b -g 0
    fi
done

ffmpeg -y -i $tmpframest/thumb%06d.png -c:v libx264 -vf "fps=$fps,format=yuv420p" $output