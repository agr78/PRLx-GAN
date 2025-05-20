#!/bin/bash
# Make environment
conda create -n "rimgan" python=3.7.0 ipython
# Activate it
conda activate rimgan
# Install PyTorch
conda install pytorch==1.7.1 torchvision==0.8.2 torchaudio==0.7.2 cudatoolkit=11.0 -c pytorch
# Install some additional packages
conda install click requests tqdm pyspng ninja imageio-ffmpeg==0.4.3
# Install some package from pip
~/anaconda3/envs/rimgan/bin/pip install pyspng
~/anaconda3/envs/rimgan/bin/pip install imageio-ffmpeg==0.4.3
# Optionally install the CUDA development toolkit package
conda install -c conda-forge cudatoolkit-dev -y
# Clone StyleGAN2-ADA
git clone https://github.com/NVlabs/stylegan2-ada-pytorch.git