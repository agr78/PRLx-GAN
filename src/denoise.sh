#!/bin/bash
# Retrain (optional)
python train.py --outdir=./training-runs --data=/your/QSM/rims --gpus=8
# Generate synthetic PRL QSM
python generate.py --outdir=./out --trunc=1 --seeds=100-200 \ 
--network=./training-runs/00020--auto8/network-snapshot-025000.pkl 
# Project noisy rims onto latent space
python projector.py --outdir=out --target=/sample_noisy_rim.png \ 
--network=./training-runs/00020--auto8/network-snapshot-025000.pkl 