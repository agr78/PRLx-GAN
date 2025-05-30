# PRLx-GAN
Repository for [_Synthetic Generation and Latent Projection Denoising of Rim Lesions in Multiple Sclerosis_](https://openreview.net/forum?id=wFkiqB5spT&referrer=%5Bthe%20profile%20of%20Alexandra%20Grace%20Roberts%5D(%2Fprofile%3Fid%3D~Alexandra_Grace_Roberts1)) published in [Synthetic Data](https://syndata4cv.github.io/) at [CVPR 2025](https://cvpr.thecvf.com/). 
## Summary
Paramagnetic rim lesions (PRLs) are a rare but highly prognostic lesion subtype in multiple sclerosis, visible only on susceptibility ($\chi$) contrasts. This work presents a generative framework to: <br/>
* Synthesize new rim lesion maps that address class imbalance in training data <br/>
* Enable a novel denoising method to resolve radiologist disagreements on noisy labels, "ambiguous rim lesions". <br/>

<br/>
<br/>

<p align="center">
   <img src="./gif/proj_4x.gif"/></br>
   <i>Latent projection iterations to identify the denoised rim lesion from an "noisy" rim lesion.</i>
</p>

<br/>

## Contents
Uncurated synthetic rim lesion susceptibilities can be found in [`png`](https://github.com/agr78/PRLx-GAN/tree/main/png) <br/>
Pretrained weights are located in [`net`](https://github.com/agr78/PRLx-GAN/tree/main/net) <br/>

## Preliminaries
To download the pretrained weights, ensure [Git Large File Service](https://git-lfs.com/) is installed
```
sudo apt-get install git-lfs
git lfs install
```
The `main.sh` script will skip retraining unless `\your\QSM\data` is replaced by a valid path

## Installation
Clone the repository with
```
git clone https://github.com/agr78/PRLx-GAN.git
```
Navigate to the repository
```
cd PRLx-GAN
```
Run the setup script
```
source ./src/main.sh
```
Wait...then check the generated and denoised outputs
```
cd ./out
```

## Publications
If this code is used, please cite the following:
> [Conference Paper](https://openreview.net/forum?id=wFkiqB5spT&noteId=wFkiqB5spT): A. G. Roberts et al., "Synthetic Generation and Latent Projection Denoising of Rim Lesions in Multiple Sclerosis," Synthetic Data for Computer Vision at CVPR, 2025.
> 

## BibTex
```bibtex
@inproceedings{
roberts2025synthetic,
title={Synthetic Generation and Latent Projection Denoising of Rim Lesions in Multiple Sclerosis},
author={Alexandra Grace Roberts and Ha Manh Luu and Mert Sisman and Alexey V. Dimov and Ceren Tozlu and Ilhami Kovanlikaya and Susan Gauthier and Thanh D. Nguyen and Yi Wang},
booktitle={Synthetic Data for Computer Vision Workshop @ CVPR 2025},
year={2025},
url={https://openreview.net/forum?id=wFkiqB5spT}
}
```
## Acknowledgements
This method relies on the [StyleGAN2-ADA](https://github.com/NVlabs/stylegan2-ada-pytorch) architecture developed by [`@tkarras`](https://github.com/tkarras).
## Contact
Please direct questions to [Alexandra Roberts](https://github.com/agr78) at agr78@cornell.edu.
