# Chainer implementation of "Perceptual Losses for Real-Time Style Transfer and Super-Resolution"
Fast artistic style transfer by using feed forward network.

This is a fork based on [yusuketomoto/chainer-fast-neuralstyle](https://github.com/yusuketomoto/chainer-fast-neuralstyle). Mostly just merging [resize-conv](https://github.com/yusuketomoto/chainer-fast-neuralstyle/tree/resize-conv) and [stable-style](https://github.com/ElementAI/chainer-fast-neuralstyle/tree/stable-style). And upgrading to work with latest version of Chainer (which isn't backwards compatible with volatile's and test's anymore apparently).

Also added a few bash scripts to help streamline some things like style transfer on video. You can find those scripts on `\bash_scripts\`

## Test Environment
[Ubuntu](https://www.ubuntu.com/desktop) 16.04

[Python](https://developer.nvidia.com/cuda-downloads) 2.7 `sudo apt install python2.7`

[pip](https://pypi.org/project/pip/) 8.1.1 from /usr/lib/python2.7/dist-packages (python 2.7)

[Chainer](https://chainer.org/) 4.2.0 `pip install chainer`

[CUDA](https://developer.nvidia.com/cuda-downloads) 9.2

[cuDNN](https://developer.nvidia.com/cudnn) 7.1

[cuPY](https://cupy.chainer.org/) `pip install cupy-cuda92`

[MS COCO](http://cocodataset.org/) 2017 Train Images

[FFMPEG](https://www.ffmpeg.org/) 2.8.14

## Prerequisite
Download VGG16 model and convert it into smaller file so that we use only the convolutional layers which are 10% of the entire model.
```
sh setup_model.sh
```

## Train
Need to train one image transformation network model per one style target.
```
python train.py -s <style_image_path> -d <training_dataset_path> -g <use_gpu ? gpu_id : -1>
```

## Generate
```
python generate.py <input_image_path> -m <model_path> -o <output_image_path> -g <use_gpu ? gpu_id : -1>
```

This repo has pretrained models as an example.

```
python generate.py sample_images/tubingen.jpg -m models/composition.model -o sample_images/output.jpg
```
or
```
python generate.py sample_images/tubingen.jpg -m models/seurat.model -o sample_images/output.jpg
```
or with keep colors option
```
python generate.py <input_image_path> -m <model_path> -o <output_image_path> -g <use_gpu ? gpu_id : -1> --keep_colors
```

## License
MIT

## Other relevant repos to this project
https://github.com/gafr/chainer-fast-neuralstyle-video

https://github.com/rupeshs/neuralstyler

https://github.com/6o6o/chainer-fast-neuralstyle
