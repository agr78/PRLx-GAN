#!/bin/bash
# Make environment
conda config --add channels defaults
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
# Test the repo
python generate.py \ 
--outdir=out --trunc=1 --seeds=85,265,297,849 \
--network=https://nvlabs-fi-cdn.nvidia.com/stylegan2-ada-pytorch/pretrained/metfaces.pkl
# Apply patch
git apply ./patch/prlx_gan.patch
# Retrain (optional)
python train.py --outdir=./training-runs --data=/your/QSM/rims --gpus=8
# Generate synthetic PRL QSM
python generate.py --outdir=./out --trunc=1 --seeds=100-200 \ 
--network=./training-runs/00020--auto8/network-snapshot-025000.pkl 
# Project noisy rims onto latent space
python projector.py --outdir=out --target=/sample_noisy_rim.png \ 
--network=./training-runs/00020--auto8/network-snapshot-025000.pkl 