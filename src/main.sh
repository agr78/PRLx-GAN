#!/bin/bash
# Make environment
echo Creating and activating environment
conda config --add channels defaults
conda create -n "rimgan" python=3.7.0 ipython -y
# Activate it
conda activate rimgan
# Install PyTorch
echo Installing some extra packages
conda install pytorch==1.7.1 torchvision==0.8.2 torchaudio==0.7.2 cudatoolkit=11.0 -c pytorch -y
# Install some additional packages
conda install click requests tqdm ninja imageio psutil scipy -y
# Install some package from pip
~/anaconda3/envs/rimgan/bin/pip install pyspng
~/anaconda3/envs/rimgan/bin/pip install imageio-ffmpeg==0.4.3
# Optionally install the CUDA development toolkit package
conda install -c conda-forge cudatoolkit-dev -y
# Clone StyleGAN2-ADA
cd
echo Cloning StyleGAN2-ADA to home directory
git clone https://github.com/NVlabs/stylegan2-ada-pytorch.git
cd stylegan2-ada-pytorch
# Test the repo
python generate.py --outdir=out --trunc=1 --seeds=85,265,297,849 --network=https://nvlabs-fi-cdn.nvidia.com/stylegan2-ada-pytorch/pretrained/metfaces.pkl
# Apply patch
git apply ~PRLx-GAN/patch/prlx_gan.patch
# Retrain (optional)
python train.py --outdir=./training-runs --data=/your/QSM/rims --gpus=8
# Generate synthetic PRL QSM
python generate.py --outdir=./out --trunc=1 --seeds=100-200 --network=~PRLx-GAN/net/network-snapshot-025000.pkl 
# Project noisy rims onto latent space
python projector.py --outdir=out --target=/sample_noisy_rim.png --network=~/PRLx-GAN/net/network-snapshot-025000.pkl 