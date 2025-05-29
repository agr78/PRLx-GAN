#!/bin/bash
# Retrain (optional)
python train.py --outdir=./training-runs --data=/your/QSM/rims --gpus=8 || echo Specify a valid directory to retrain
cd ../PRLx-GAN
# Generate synthetic PRL QSM
echo Generating synthetic rims
python ~/stylegan2-ada-pytorch/generate.py --outdir=./out --trunc=1 --seeds=100-200 --network=./net/network-snapshot-025000.pkl 
# Project noisy rims onto latent space
echo Denoising ambiguous rim via latent projection
python ~/stylegan2-ada-pytorch/projector.py --outdir=out --target=./sample/noisy_rim.png --network=./net/network-snapshot-025000.pkl 
echo Done, see ~/PRLx-GAN/out/ for generated and denoised samples