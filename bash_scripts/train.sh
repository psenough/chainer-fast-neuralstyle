#!/bin/sh

# what image to use as input
image="/home/psenough/Documents/_images/drawing_styles/landscape_painting.jpg"

# train dataset
trainset="/home/psenough/Documents/train2017/"

# where to store the output model
model="/home/psenough/Documents/chainer-fast-neuralstyle/models/"

# location of train.py
location="/home/psenough/Documents/chainer-fast-neuralstyle/"
#trainpy="train.py"
trainpy="train_no_pop.py"

# move to location of train.py to make sure model is placed in right /models/ dir
# -o argument exists but i didn't test it and code looks weird on that
cd $location

python $trainpy -s $image -d $trainset -g 0
