#!/bin/sh

# what image to use as input
image="/home/psenough/Documents/_images/animals/owls-snowy-1920x1080-20294.jpg"

# what model to use for the style transfer
#model="/home/psenough/Documents/chainer-fast-neuralstyle/models/megaman.model"
model="/home/psenough/Documents/chainer-fast-neuralstyle/models/landscape_painting.model"

# where to store the output result
output="/home/psenough/Documents/output.jpg"

# location of generate.py
generatepy="/home/psenough/Documents/chainer-fast-neuralstyle/generate.py"

# where to dump the frames from resize
tmpframesresize="/home/psenough/Documents/tmpframesresize"

rm -rf $tmpframesresize
mkdir $tmpframesresize

convert $image -resize 84% $tmpframesresize/tmp.png
python $generatepy $tmpframesresize/tmp.png -m $model -o $output -g 0

#python $generatepy $image -m $model -o $output -g 0

#python $generatepy $image -m $model -o $output -g 0 --keep_colors

#python $generatepy $tmpframesresize/tmp.jpg -m $model -o $output -g 0
